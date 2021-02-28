#!/bin/bash
set -e

if [ -z "$VSTS_ACCOUNT" ]; then
  echo 1>&2 error: missing VSTS_ACCOUNT environment variable
  exit 1
fi

if [ -z "$VSTS_TOKEN_FILE" ]; then
  if [ -z "$VSTS_TOKEN" ]; then
    echo 1>&2 error: missing VSTS_TOKEN environment variable
    exit 1
  fi
  VSTS_TOKEN_FILE=/vsts/.token
  echo -n $VSTS_TOKEN > "$VSTS_TOKEN_FILE"
fi
unset VSTS_TOKEN


rm -rf /vsts/agent
mkdir /vsts/agent
cd /vsts/agent
export AGENT_ALLOW_RUNASROOT="1"
cleanup() {
  if [ -e config.sh ]; then
    print_header "Cleanup. Removing Azure Pipelines agent..."

    ./config.sh remove --unattended \
      --auth PAT \
      --token $(cat "$VSTS_TOKEN_FILE")
  fi
}
print_header() {
  lightcyan='\033[1;36m'
  nocolor='\033[0m'
  echo -e "${lightcyan}$1${nocolor}"
}
print_header "downloading Azure Pipelines agent..."
export VSTS_URL="https://dev.azure.com/$VSTS_ACCOUNT"

export VSTS_AGENTPACKAGE_URL="https://vstsagentpackage.azureedge.net/agent/$AGENTRELEASE/vsts-agent-linux-x64-$AGENTRELEASE.tar.gz"
curl -LsS $VSTS_AGENTPACKAGE_URL | tar -xz & wait $!
#wget -O agent.tar.gz $VSTS_AGENTPACKAGE_URL
#tar zxvf agent.tar.gz

source ./env.sh

print_header "3. Configuring Azure Pipelines agent... $VSTS_AGENT, $VSTS_URL, $VSTS_POOL"

./config.sh --unattended --agent $VSTS_AGENT --url $VSTS_URL --auth pat --token $(cat "$VSTS_TOKEN_FILE") --pool $VSTS_POOL --work ./_work --acceptTeeEula & wait $!

print_header "Running Azure Pipelines agent..."

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!