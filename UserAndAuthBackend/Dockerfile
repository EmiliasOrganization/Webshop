FROM rust:latest as builder

WORKDIR /app

COPY ./UserAndAuthBackend .

RUN rustup default nightly

RUN cargo build --release

FROM debian:buster-slim

COPY ../.env .

WORKDIR /app

RUN apt-get update && apt-get install -y libpq5

COPY --from=builder /app/target/release/UserAndAuthBackend .

ENV ROCKET_ADDRESS=0.0.0.0

CMD ["./UserAndAuthBackend"]

EXPOSE 8000