FROM ccr.ccs.tencentyun.com/dops/alpine:3.9

LABEL maintainer="linfengchen"

RUN mkdir -p /app && apk add tcpdump net-tools tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && apk del tzdata

WORKDIR /app

COPY trpc-gateway /app/trpc-gateway
COPY trpc_go.yaml /app/trpc_go.yaml
COPY router.yaml /app/router.yaml

ENV PATH $PATH:/app

EXPOSE 18080
CMD ["./trpc-gateway"]
