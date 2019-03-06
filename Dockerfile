FROM dockerenvs/ubuntu-build
LABEL author="Lu Wu"

WORKDIR /home/luwu
ENV LANG en_US.UTF-8

RUN add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> /etc/profile && \
	echo "export JRE_HOME=${JAVA_HOME}/jre" >> /etc/profile && \
	echo "export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib" >> /etc/profile && \
	echo "export PATH=${JAVA_HOME}/bin:$PATH" >> /etc/profile && \
	bash -c "source /etc/profile"
