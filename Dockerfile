
FROM centos:centos5
MAINTAINER kimwu@live.hk

# Env setup
ENV HOME /root
WORKDIR ~/

# install & link compat libs
RUN yum -y update
RUN yum -y install glibc.i686 expat-devel.i386 libstdc++.i386 openssl-devel.i386 libgcc.i386 compat-libstdc++-296.i386
RUN yum -y clean all
RUN ln -s libstdc++-3-libc6.2-2-2.10.0.so libstdc++-libc6.2-2.so.2

# Define auto start command
ADD autostart.sh /script/
RUN chmod +x /script/autostart.sh
CMD ["/script/autostart.sh"]



			