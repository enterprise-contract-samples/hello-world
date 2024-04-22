FROM registry.access.redhat.com/ubi9/go-toolset:1.20 AS builder
WORKDIR /opt/app-root/src
COPY . .
RUN go build -o bin/hello-world main.go

FROM registry.access.redhat.com/ubi9-micro:latest
COPY --from=builder /opt/app-root/src/bin/hello-world /usr/bin/hello-world
EXPOSE 8080
CMD [ "hello-world" ]
