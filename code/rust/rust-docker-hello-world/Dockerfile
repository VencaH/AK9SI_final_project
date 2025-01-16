FROM rust:latest as build

WORKDIR /usr/src/app
COPY . .
RUN rustup default nightly
RUN cargo clean
RUN cargo build --release


FROM  ubuntu:latest
COPY --from=build /usr/src/app/target/release/rust-docker-hello-world /usr/local/bin/app
WORKDIR /usr/local/bin
CMD ["app"]

