FROM python:3
ADD mail-ldap.py /
RUN pip install pystrich \
    pip install ldap
CMD [ "python", "./mail-ldap.py" ]
