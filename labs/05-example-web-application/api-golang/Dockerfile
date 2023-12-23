FROM golang:1.21-bullseye as build

# timeout problem
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn,direct

WORKDIR /app

RUN useradd -u 1001 nonroot

COPY go.mod go.sum ./

RUN --mount=type=cache,target=/go/pkg/mod \
  --mount=type=cache,target=/root/.cache/go-build \
  go mod download

COPY . .

RUN go build \
  -ldflags="-linkmode external -extldflags -static" \
  -tags netgo \
  -o api-golang

# final image
FROM scratch

ENV GIN_MODE release

COPY --from=build /etc/passwd /etc/passwd

COPY --from=build /app/api-golang api-golang

USER nonroot

EXPOSE 8080

CMD [ "/api-golang" ]