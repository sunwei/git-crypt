FROM centos:7

# Add base dependencies, and update
RUN yum -y -q update && \
    yum groupinstall -y "development tools" && \
	  yum -y -q install curl git openssl bind-utils wget zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel expat-devel && \
	  yum -y -q install gcc-c++ gnupg && \
    yum -y -q clean all

WORKDIR /app
COPY . /app/

# Install git-crypt
RUN cd /app && \
		git clone https://github.com/AGWA/git-crypt.git && \
		cd git-crypt && \
		make && make install PREFIX=/usr/local && \
		git-crypt --version

ENTRYPOINT ["/app/docker-entrypoint.sh"]

CMD ["echo", "exec command"]
