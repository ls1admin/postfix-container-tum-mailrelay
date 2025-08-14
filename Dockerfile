# Ref: https://www.frakkingsweet.com/postfix-in-a-container/

FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends postfix mailutils 

RUN mkdir /config && \
    mv /etc/postfix/main.cf /config/main.cf && \
    mv /etc/postfix/master.cf /config/master.cf && \
    ln -s /config/main.cf /etc/postfix/main.cf && \
    ln -s /config/master.cf /etc/postfix/master.cf

VOLUME [ "/config" ]

EXPOSE 25

CMD ["postfix", "start-fg"]
