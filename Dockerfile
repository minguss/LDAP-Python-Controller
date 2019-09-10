FROM alpine:latest
RUN apk add python3 build-base openldap-dev python2-dev python3-dev \
&& pip3 install --upgrade pip \ 
&& pip3 install virtualenv python-ldap\
&& if [ ! -d /python-project ]; then mkdir /python-project; fi
WORKDIR /python-project
ADD mail-ldap.py .
ADD requirements.txt .
RUN pip3 install -r requirements.txt
CMD [ "python3", "./mail-ldap.py" ]
