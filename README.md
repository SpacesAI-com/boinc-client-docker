# Boinc Client

salimbene_local@cognition.com
e859a7d12eb0868bbc04aaa1cf88a59e

space02@cognition.com
848dc4b45a3bc5eb353d8fd316e2b650

## Docker build

```sh
export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker build -t boinc-client:x86_64 -f Dockerfile.intel .
docker tag boinc-client:x86_64 docker.io/spaceaidocker/boinc-client:x86_64
docker push docker.io/spaceaidocker/boinc-client:x86_64
```

## Docker run

```sh
# windows
docker run -d -h space02 --name boinc-client  -e BOINC_AUTH_KEY="848dc4b45a3bc5eb353d8fd316e2b650" -v "%LOCALAPPDATA%\boinc_data:/var/lib/boinc" docker.io/spaceaidocker/boinc-client:x86_64
# --device /dev/dri:/dev/dri GPU support
# --network host \

# linux
export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker run -d \
    -h salimbene_local \
    --name boinc-client \
    -e BOINC_AUTH_KEY="e859a7d12eb0868bbc04aaa1cf88a59e" \
    -v "$(pwd)/temp":/usr/src/app \
    docker.io/spaceaidocker/boinc-client:x86_64

```

### Throubleshoot

```sh

docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name

curl --location 'http://localhost:3000/kubo/repo/stat'
curl --location 'http://ipfs-api:3000/kubo/repo/stat'

http://34.170.126.6/demosai/

boinccmd --project

docker run -it boinc-client:intel bash

docker container stop boinc && docker container rm boinc

docker run -it --entrypoint "bash" docker.io/spaceaidocker/boinc-client:intel

/Library/Application Support/Boinc Data/
C:\Program Files\boinc data

while true; do echo -n "This is a test of while loop";date ; sleep 5

```

## Boinc CLI usage

```sh

boinccmd --project http://boincdev.sos.space/helloworld/ detach
boinccmd --project http://boincdev.sos.space/pytest detach

boinccmd --project_attach http://boincdev.sos.space/pytest c30548f6ecc146bbb8e4d5655c12bd92
boinccmd --project http://boincdev.sos.space/devsai reset 73fe8fffa9236af20aadb2fa6007de9d
boinccmd --project http://boincdev.sos.space/devsai update 73fe8fffa9236af20aadb2fa6007de9d

boinccmd --lookup_account http://boincdev.sos.space/helloworld matias.salimbene@cognitionhq.com V3dd3r01

boinccmd --get_tasks
boinccmd --get_state

boinccmd --set_run_mode never 0
boinccmd --set_run_mode always 0

boinccmd --task http://boincdev.sos.space/pytest/ linear_761846_1725394192.127191_0 resume

```
