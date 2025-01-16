FROM rust:latest as build

WORKDIR /usr/src/app
COPY . .
RUN rustup default nightly
RUN cargo clean
RUN cargo build --release


FROM  alpine:latest
RUN apk add gcompat
COPY --from=build /usr/src/app/target/release/simple_app /usr/local/bin/app
WORKDIR /usr/local/bin
CMD ["app"]

