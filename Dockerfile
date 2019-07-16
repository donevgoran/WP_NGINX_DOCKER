FROM centos
MAINTAINER Goran Donev <gokidonev@gmail.com>
RUN yum -y install yum-utils vim net-tools screen wget epel-release
COPY Repos/nginx.repo /etc/yum.repos.d/
RUN yum-config-manager --enable nginx-mainline
RUN yum -y install nginx
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php72
RUN yum -y install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql php-fpm
COPY Config/Nginx/default.conf /etc/nginx/conf.d/
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php.ini
RUN sed -i 's/user = apache/user = nginx/g' /etc/php-fpm.d/www.conf
RUN sed -i 's/group = apache/group = nginx/g' /etc/php-fpm.d/www.conf
RUN mkdir -p /run/php-fpm/
RUN yum -y install supervisor
COPY Config/Supervisor/supervisord.conf /etc/
EXPOSE 80
CMD ["/usr/bin/supervisord", "-n"]
