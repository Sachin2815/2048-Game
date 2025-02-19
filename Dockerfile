FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y nginx curl zip unzip

#configue the nginx server

RUN echo "daemon off;" >>/etc/nginx/nginx.conf

#Download the Game source code from the GitHub

RUN curl -o /var/www/html/main.zip -L https://github.com/Sachin2815/2048-Game/archive/refs/heads/main.zip

# now Unzip this main.zip file and move to /var/www/html folder

RUN cd /var/www/html && unzip main.zip && mv 2048-Game-main/* . && rm -rf 2048-Game-main main.zip

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
