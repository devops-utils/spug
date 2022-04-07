FROM yiluxiangbei/giraffe-base:v1.0

ENV LANG=en_US.UTF-8
RUN echo -e '\n# Source definitions\n. /etc/profile\n' >> /root/.bashrc
RUN mkdir /data
COPY init_spug /usr/bin/
COPY nginx.conf /etc/nginx/
COPY ssh_config /etc/ssh/
COPY spug.ini /etc/supervisord.d/
COPY my.cnf /etc/
COPY redis.conf /etc/
COPY entrypoint.sh /
COPY spug.tar.gz /tmp/

VOLUME /data
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
