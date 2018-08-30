FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y && echo test

RUN apt-get install -y pkg-config attr acl samba smbclient ldap-utils \
    winbind libnss-winbind libpam-winbind krb5-user krb5-kdc supervisor \
    openvpn inetutils-ping nano telnet net-tools ldb-tools

RUN mkdir -p /etc/samba/external/

# Set up script and run
ADD init.sh /init.sh

ADD allAccountType.ldif /allAccountType.ldif
ADD displayNom.ldif /displayNom.ldif
ADD rpUser.ldif /rpUser.ldif

ADD addKeyToUser.ldif /addKeyToUser.ldif

RUN chmod 755 /init.sh
CMD /init.sh setup
