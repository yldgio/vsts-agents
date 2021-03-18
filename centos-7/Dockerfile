FROM yldgio/vsts-container:centos-7-latest

# Build-time metadata as defined at http://label-schema.org

LABEL org.label-schema.name="VSTS Agent with Infrastrucure Tools" \
    org.label-schema.url="https://github.com/yldgio/" \
    org.label-schema.vcs-url="https://github.com/yldgio/vsts-agents" \
    org.label-schema.schema-version="1.0"
                

ENV AGENTRELEASE 2.182.1
WORKDIR /vsts

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]