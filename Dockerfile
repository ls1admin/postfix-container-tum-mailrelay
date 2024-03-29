# Ref: https://www.frakkingsweet.com/postfix-in-a-container/

FROM debian:10.8

RUN apt update && \
    apt upgrade -y && \
    apt install -y postfix mailutils 

RUN mkdir /config && \
    mv /etc/postfix/main.cf /config/main.cf && \
    mv /etc/postfix/master.cf /config/master.cf && \
    ln -s /config/main.cf /etc/postfix/main.cf && \
    ln -s /config/master.cf /etc/postfix/master.cf

EXPOSE 25

CMD ["postfix", "start-fg"]
