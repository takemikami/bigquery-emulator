FROM ghcr.io/goccy/go-zetasql:latest

ARG VERSION

WORKDIR /work

COPY . ./

RUN go mod edit -replace github.com/goccy/go-zetasql=../go-zetasql
RUN go mod download

RUN make emulator/build

FROM debian:bullseye AS emulator

COPY --from=0 /work/bigquery-emulator /bin/bigquery-emulator
COPY --from=0 /work/entrypoint.sh /bin/entrypoint.sh

RUN chmod +x /bin/entrypoint.sh

WORKDIR /work

ENTRYPOINT ["/bin/entrypoint.sh"]
