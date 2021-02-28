FROM yldgio/vsts-agent:centos-7

LABEL org.label-schema.name="VSTS Agent with Infrastrucure Tools" \
    org.label-schema.url="https://github.com/yldgio/" \
    org.label-schema.vcs-url="https://github.com/yldgio/vsts-agent-infrastructure" \
    org.label-schema.schema-version="1.0"
    
RUN /bin/bash -c "yum update -y"
RUN /bin/bash -c "yum -y install epel-release"
RUN /bin/bash -c "yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm"
RUN /bin/bash -c "yum install yum-utils -y"
RUN /bin/bash -c "yum-config-manager --enable remi-php72"
RUN /bin/bash -c "yum install make gcc libpng-devel -y"
RUN /bin/bash -c "yum -y localinstall https://www.linuxglobal.com/static/blog/pdftk-2.02-1.el7.x86_64.rpm"
RUN /bin/bash -c "yum install php-cli php-common php-pear php-pdo_pgsql php-fpm php-soap php-ldap php-gd php-mbstring php-mysqlnd php-mcrypt php-zip php-fileinfo php-curl php-xml -y"
