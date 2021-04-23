FROM rust:slim as builder

RUN apt-get update && \
    apt-get install -y pkg-config

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN cargo build --release


FROM alpine

COPY --from=builder /usr/src/app/target/release/{{project-name}} ./{{project-name}}

ENTRYPOINT ["./{{project-name}}"]