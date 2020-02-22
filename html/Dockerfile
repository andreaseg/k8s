FROM nginx:1.17.8-alpine

ADD nginx.conf /etc/nginx
RUN cat /etc/nginx/nginx.conf

ADD data /data
RUN find /data