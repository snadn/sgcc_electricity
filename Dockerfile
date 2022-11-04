FROM python:3.8-slim-buster

RUN mkdir /app

COPY ./*.py ./*.sh /app/

RUN cd /app \
    && python3 -m pip install --upgrade pip -i https://pypi.douban.com/simple/\
    && pip3 install --no-cache-dir requests selenium==4.5.0 schedule==1.1.0 ddddocr==1.4.7 undetected_chromedriver==3.1.6 -i https://pypi.douban.com/simple\
    && rm -rf /tmp/* && rm -rf /root/.cache/* \
    && sed -i 's#http://deb.debian.org#http://mirrors.aliyun.com/#g' /etc/apt/sources.list\
    && apt-get --allow-releaseinfo-change update && apt install jq chromium=90.0.4430.212-1~deb10u1 -y

WORKDIR /app

CMD ["./run.sh"]
