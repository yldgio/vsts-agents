FROM centos:centos7.5.1804

# Build-time metadata as defined at http://label-schema.org

LABEL org.label-schema.name="VSTS Agent with Infrastrucure Tools" \
    org.label-schema.url="https://github.com/yldgio/" \
    org.label-schema.vcs-url="https://github.com/yldgio/vsts-agent-infrastructure" \
    org.label-schema.schema-version="1.0"
                
RUN /bin/bash -c "yum update -y"
RUN /bin/bash -c "yum install wget unzip -y"
RUN /bin/bash -c "yum install -y openssl-libs krb5-libs zlib libicu"
RUN /bin/bash -c "wget -P /etc/yum.repos.d/ https://packages.efficios.com/repo.files/EfficiOS-RHEL7-x86-64.repo && rpmkeys --import https://packages.efficios.com/rhel/repo.key && yum updateinfo -y && yum install -y lttng-ust"
RUN /bin/bash -c "yum -y install https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm"
RUN /bin/bash -c "yum install -y git"

ENV AGENTRELEASE 2.182.1
WORKDIR /vsts

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]