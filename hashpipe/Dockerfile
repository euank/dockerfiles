FROM scorpil/rust:1.14

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qqy && apt-get upgrade -qqy && apt-get install libssl-dev -qqy

RUN cargo install hashpipe
ENTRYPOINT ["/root/.cargo/bin/hashpipe"]
