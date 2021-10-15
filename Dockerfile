FROM openshift/base-centos7

EXPOSE 1337

RUN curl -fsSLO --compressed "https://nodejs.org/dist/v16.8.0/node-v16.8.0-linux-x64.tar.xz" && \
	tar -xJf "node-v16.8.0-linux-x64.tar.xz" -C /usr/local --strip-components=1 --no-same-owner

COPY ./s2i/bin/ /usr/libexec/s2i

RUN npm install npm -g

RUN npm install sails -g

RUN chown -R 1001:1001 /opt/app-root

USER 1001

CMD ["/usr/libexec/s2i/usage"]
