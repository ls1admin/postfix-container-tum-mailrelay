# Ref: https://www.frakkingsweet.com/postfix-in-a-container/

# Alpine 3.24 ships Postfix 3.11.x, the newest stable Postfix line
FROM alpine:3.24

# Upgrade first, so that security fixes released after the base image was built are included
RUN apk upgrade --no-cache && \
    apk add --no-cache postfix s-nail ca-certificates

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
