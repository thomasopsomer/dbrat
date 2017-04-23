# Base
FROM phusion/baseimage:latest

# Regular system stuff
RUN apt-get -y update && apt-get -y upgrade \
  && apt-get -y install wget \
  && apt-get install -y --no-install-recommends software-properties-common

# install python2.7
RUN apt-get install -y python-pip

# pip dependencies for brat
ADD ./requirement.txt requirement.txt
RUN pip install -r requirement.txt


# DL brat & untar
RUN wget http://weaver.nlplab.org/~brat/releases/brat-v1.3_Crunchy_Frog.tar.gz && \
	tar xzf brat-v1.3_Crunchy_Frog.tar.gz && \
	rm brat-v1.3_Crunchy_Frog.tar.gz

WORKDIR brat-v1.3_Crunchy_Frog

# config
COPY config.py config.py
COPY userlist.txt userlist.txt

# Clean and Reduce image size
RUN apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# run brat server
CMD python standalone.py
