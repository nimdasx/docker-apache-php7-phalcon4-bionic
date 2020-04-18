FROM ubuntu

LABEL maintainer="nimdasx@gmail.com"
LABEL description="Ubuntu Latest Apache PHP 7.2 Phalcon 4"

ARG DEBIAN_FRONTEND=noninteractive

#update
RUN apt-get -y update \
&& apt-get install -y \
curl \
tzdata \
git \
apache2 \
php7.2 \
libapache2-mod-php7.2 \
php7.2-dev \
php7.2-bcmath \
php7.2-gd \
php7.2-json \
php7.2-sqlite \
php7.2-mysql \
php7.2-curl \
php7.2-xml \
php7.2-mbstring \
php7.2-zip \
&& rm -rf /var/lib/apt/lists/*

#set timezone
RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

#install psr (phalcon butuh ini)
WORKDIR /usr/src
RUN git clone --depth=1 https://github.com/jbboehr/php-psr.git
WORKDIR /usr/src/php-psr
RUN phpize && ./configure && make && make test && make install
RUN echo extension=psr.so | tee -a /etc/php/7.2/mods-available/psr.ini
RUN phpenmod psr
WORKDIR /
RUN rm -rf /usr/src/php-psr

#install phalcon
RUN curl -s "https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh" | bash
RUN apt-get install -y php7.2-phalcon

#custom config php
COPY php-nimdasx.ini /etc/php/7.2/cli/php-nimdasx.ini
COPY php-nimdasx.ini /etc/php/7.2/apache2/php-nimdasx.ini

# konfigurasi apache
RUN a2enmod rewrite
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

#rapenting
COPY telo.php /var/www/html/

WORKDIR /var/www/html
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]