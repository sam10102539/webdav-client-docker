FROM webdevops/php-nginx:7.3 as develop

### INSTALL-PACKAGES
RUN apt-get update \
 && apt-get install -y sudo \
 && DEBIAN_FRONTEND=noninteractive apt-get -yq install davfs2 procps

### YOUR-WWW-RUNNING
ENV WEB_DOCUMENT_ROOT /var/www/html
WORKDIR /var/www/html
# FROM develop as production
# COPY --chown=application:application . /var/www/html/
# RUN apt update && composer install && composer dump-autoload

### WEBDAV-PROCESS
RUN sudo mkdir -p /mnt/webdav
RUN sudo mkdir -p ~/.davfs2
COPY run.sh /run.sh
COPY mounter.sh /mounter.sh
RUN sudo chmod +x /mounter.sh

CMD ["sh", "/run.sh"]