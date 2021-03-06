FROM jred/nodejs:12.17 as builder
LABEL maintainer="jafow <jared.a.fowler@gmail.com>"
LABEL "com.github.actions.name"="check-org-members-enable-mfa"
LABEL "com.github.actions.description"="Check that members of a GitHub organziation have multi-factor authentication enabled"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="pink"

ENV VERSION "0.1.0"
COPY LICENSE README.md /

COPY package.json /app/
COPY package-lock.json /app/

WORKDIR /app
RUN npm ci

WORKDIR /
COPY main.js /app/
COPY entrypoint.sh /app/

WORKDIR /app
RUN chmod u+x entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
