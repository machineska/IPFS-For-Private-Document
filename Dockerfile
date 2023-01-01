FROM golang:1.19.1-buster
RUN apt-get update && apt-get install -y \
  libssl-dev \
  ca-certificates \
  fuse
RUN DOCKER_BUILDKIT=0  docker build
RUN mkdir /tmp/ipfs-docker-staging
RUN mkdir /tmp/ipfs-docker-data
RUN docker pull ipfs/kubo
RUN docker run -d --name ipfs_host -v /tmp/ipfs-docker-staging:/export -v /tmp/ipfs-docker-data:/data/ipfs -p 4000:4001 -p 4001:4001/udp -p 0.0.0.0:8080:8080 -p 0.0.0.0:5001:5001 ipfs/kubo:latest
RUN docker exec ipfs_host swarm peers