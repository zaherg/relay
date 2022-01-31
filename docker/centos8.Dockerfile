FROM centos:7

RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN dnf install -y yum-utils

RUN dnf install -y php80 \
  php80-php-cli \
  php80-php-fpm

ENV PATH="/opt/remi/php80/root/usr/bin/:$PATH"

RUN curl -s -o /etc/yum.repos.d/cachewerk.repo "https://cachewerk.s3.amazonaws.com/repos/rpm/el.repo"
RUN yum install -y php80-php-relay