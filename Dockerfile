FROM frzquantum/ubuntu-desktop:v1.0

USER root
WORKDIR /root

ADD ./resources/maa /root/maa/

COPY ./resources/ark.apk /root/

ADD ./adb.sh /root/

ADD ./startmaa.sh /root/

RUN chmod +x ./*.sh 
# Run echo "deb http://mirrors.hit.edu.cn/ubuntu/ bionic main restricted universe multiverse" > /etc/apt/sources.list &&\
#     echo "deb http://mirrors.hit.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list &&\
#     echo "deb http://mirrors.hit.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list &&\
#     echo "deb http://mirrors.hit.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list &&\
#     wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - &&\
#     apt-get update  -y  && apt install snapd -y

Run echo "deb http://mirrors.hit.edu.cn/ubuntu/ jammy  main restricted universe multiverse" > /etc/apt/sources.list &&\
    echo "deb http://mirrors.hit.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse" >> /etc/apt/sources.list &&\
    echo "deb http://mirrors.hit.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse" >> /etc/apt/sources.list &&\
    echo "deb http://mirrors.hit.edu.cn/ubuntu/ jammy-security main restricted universe multiverse" >> /etc/apt/sources.list &&\
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - &&\
    apt-get update  -y  && apt install snapd -y

RUN apt install -y \
    adb python3 python3-pip

RUN pip3 install -U pip -i https://pypi.tuna.tsinghua.edu.cn/simple &&\
    pip3 install requests tmux

EXPOSE 22 5900 3389 6001 6002 6003 6004 6005 6006 6007 6008 6009
# 启动脚本
CMD ["/root/startup.sh"]