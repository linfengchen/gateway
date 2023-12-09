FROM ccr.ccs.tencentyun.com/dops/alpine:3.9

LABEL maintainer="linfengchen"

RUN apk add tcpdump net-tools busybox-extras && mkdir -p /app

WORKDIR /app

COPY trpc-gateway /app/trpc-gateway
COPY trpc_go.yaml /app/trpc_go.yaml
COPY router.yaml /app/router.yaml

ENV PATH $PATH:/app

EXPOSE 18080
CMD ["./trpc-gateway"]
