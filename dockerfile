Run mkdir /tmp/ipfs-docker-staging
Run mkdir /tmp/ipfs-docker-data
Run docker pull ipfs/kubo
Run docker run -d --name ipfs_host -v /tmp/ipfs-docker-staging:/export -v /tmp/ipfs-docker-data:/data/ipfs -p 4000:4001 -p 4001:4001/udp -p 0.0.0.0:8080:8080 -p 0.0.0.0:5001:5001 ipfs/kubo:latest
Run docker exec ipfs_host swarm peers
