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

# Copy custom configuration files
COPY postfix-config/main.cf /config/main.cf
COPY postfix-config/master.cf /config/master.cf

EXPOSE 25

HEALTHCHECK --interval=5s --timeout=5s --start-period=2s --retries=5 \
    CMD postfix status || exit 1

CMD ["postfix", "start-fg"]
