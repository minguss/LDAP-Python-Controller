# flask ldap image
FROM alpine:latest
RUN apk add python3 build-base openldap-dev python3-dev \
&& pip3 install --upgrade pip \ 
&& pip3 install virtualenv python-ldap\
&& apk del build-base openldap-dev python3-dev \
&& if [ ! -d /python-project ]; then mkdir /python-project; fi
WORKDIR /python-project
ADD mail-ldap.py .
CMD [ "python3", "./mail-ldap.py" ]
