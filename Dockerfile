FROM centos:centos5
MAINTAINER Kim Wu <kimwu@live.hk>

# Env setup
ENV HOME /root

# install & link compat libs
RUN yum -y update
RUN yum -y install glibc.i686 expat-devel.i386 libstdc++.i386 openssl-devel.i386 libgcc.i386 compat-libstdc++-296.i386
RUN yum -y clean all
RUN rm -rf /usr/{{lib,share}/locale,share/{man,doc,info,gnome/help,cracklib,il8n},{lib,lib64}/gconv,bin/localedef,sbin/build-locale-archive}
RUN ln -s /usr/lib/libstdc++-3-libc6.2-2-2.10.0.so /usr/lib/libstdc++-libc6.2-2.so.2

# Define auto start command
ADD autostart.sh /script/
RUN chmod +x /script/autostart.sh
CMD ["/script/autostart.sh"]
