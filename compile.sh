#!/bin/sh

PWD=pwd

yum install -y libexif-devel libjpeg-devel gd-devel curl-devel openssl-devel libxml2-devel

cd /tmp
wget http://ro1.php.net/get/php-7.0.12.tar.gz/from/this/mirror -O php-7.0.12.tar.gz
rm -rf php-7.0.12/
tar zxvf php-7.0.12.tar.gz

cd php-7.0.12/

./configure --prefix=/tmp/php-7.0.12/compiled/	\
	--without-pear	\
	--enable-shared=no	\
	--enable-static=yes	\
	--enable-phar	\
	--enable-json	\
	\
	--disable-all	\
	--with-openssl	\
	--with-curl	\
	\
	--enable-libxml	\
	--enable-simplexml	\
	--enable-xml	\
	\
	--with-mhash	\
	\
	--with-gd	\
	--enable-exif	\
	--with-freetype-dir	\
	\
	--enable-mbstring	\
	\
	--enable-sockets

make
make install 

cd $PWD


