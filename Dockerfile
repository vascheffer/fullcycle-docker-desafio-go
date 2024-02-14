FROM golang:alpine as build

WORKDIR /go

COPY ./fullcycle.go .

RUN go build fullcycle.go

FROM scratch

WORKDIR /

COPY --from=build /go/fullcycle /go

ENTRYPOINT [ "/go"]