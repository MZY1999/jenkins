FROM zhangluya/centos:7.9

LABEL maintainer="Jesse" type="nginx" version="1.22"

# ARG NGINXV
ENV NGINXV="1.22.0"

RUN yum -y install gcc \
	   gd-devel  \
           openssl openssl-devel \ 
  	   libxslt libxslt-devel \
           libxml2 libxml2-devel \
           pcre pcre-devel \
           wget git patch \
    && yum clean all \
    && useradd -s /sbin/nologin www \
    && mkdir -p /data/logs/nginx \
    && cd /tmp \
    && git clone https://github.com/yaoweibin/nginx_upstream_check_module.git \
    && wget https://nginx.org/download/nginx-${NGINXV}.tar.gz \ 
    && tar zvfx nginx-${NGINXV}.tar.gz \
    && cd nginx-${NGINXV} \
    && patch -p1 < ../nginx_upstream_check_module/check_1.20.1+.patch \
    && ./configure --prefix=/usr/local/nginx \
        --with-pcre \
        --with-http_realip_module \
        --with-http_ssl_module \
        --with-http_gzip_static_module \
        --with-http_stub_status_module \
        --with-http_gunzip_module \
        --with-http_addition_module \
        --with-http_sub_module \
        --with-http_dav_module \
        --with-http_random_index_module \
        --with-http_secure_link_module \
        --with-http_auth_request_module \
        --with-http_xslt_module=dynamic \
        --with-http_image_filter_module=dynamic \
        --with-threads \
        --with-stream \
        --with-stream_ssl_module \
        --with-http_slice_module \
        --with-file-aio \
        --with-http_v2_module \
        --add-module=../nginx_upstream_check_module \
    && make -j `cat /proc/cpuinfo|grep processor|wc -l` && make install \ 
    && cd /tmp && rm -rf nginx-${NGINXV}* \
    && rm -rf nginx_upstream_check_module \
    && /bin/mv /usr/local/nginx/conf /tmp/conf.bak
  # && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY ./config/conf /usr/local/nginx/conf
COPY ./config/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh

WORKDIR /root/
EXPOSE 80 443
ENV PATH /usr/local/nginx/sbin:$PATH

#CMD ["/usr/local/nginx/sbin/nginx","-g","daemon off;"]
ENTRYPOINT ["/docker-entrypoint.sh"]
