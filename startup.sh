git clone https://github.com/dperson/openvpn-client.git
cd openvpn-client

export DOCKER_TAG=armhf
./hooks/post_checkout

sed -i -z 's/FROM arm32v6\/alpine\n/FROM arm32v6\/alpine:3.12.3\n/g' Dockerfile.armhf
docker build -t dperson-openvpn-client:alpine3.12.3 -f Dockerfile.armhf .

cd ..
export COMPOSE_HTTP_TIMEOUT=120
docker-compose up

