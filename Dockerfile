FROM php:7.4-cli-alpine

# if run in China
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add \
    libzip-dev \
    oniguruma-dev

RUN docker-php-ext-install \
    zip 

WORKDIR /go
ADD loacl /go/loacl/
ADD fonts /go/fonts/
ADD new.php /go/index.php

# 执行方式 docker run -id -v `pwd`:/go/data -p 80:80 tinyfile
# 默认登录 admin admin
CMD ["sh", "-c", "php -S 0.0.0.0:80"]
