# Boinc Client - Container

## Boinc client CLI usage

```sh

boinccmd --project http://boincdev.sos.space/helloworld/ detach
boinccmd --project http://boincdev.sos.space/pytest detach

boinccmd --project_attach http://boincdev.sos.space/pytest c30548f6ecc146bbb8e4d5655c12bd92
boinccmd --project http://boincdev.sos.space/devsai reset 73fe8fffa9236af20aadb2fa6007de9d
boinccmd --project http://boincdev.sos.space/devsai update 73fe8fffa9236af20aadb2fa6007de9d

boinccmd --lookup_account http://boincdev.sos.space/helloworld matias.salimbene@cognitionhq.com V3dd3r01

# key f52d07826d2b5736fd74b2eef683903b

#
# key d899927056927aa7689efd924174281f


boinccmd --get_tasks
boinccmd --get_state


boinccmd --set_run_mode never 0
boinccmd --set_run_mode always 0


boinccmd --task http://boincdev.sos.space/pytest/ linear_761846_1725394192.127191_0 resume

```

## Docker Build

````sh
#aarch64-unknown-linux-gnu (IMX8)
docker build --platform linux/arm64 -t boinc-client:arm64v8-aarch64 -f Dockerfile.arm64v8-aarch64 .
docker tag boinc-client:arm64v8-aarch64 docker.io/spaceaidocker/boinc-client:arm64v8-aarch64
docker push docker.io/spaceaidocker/boinc-client:arm64v8-aarch64

# arm64-apple-darwin (Mac Os Desktop)
docker build --platform linux/arm64 -t boinc-client:arm64-apple-darwin -f Dockerfile.arm64v8-apple-darwin .
docker tag boinc-client:arm64-apple-darwin docker.io/spaceaidocker/boinc-client:arm64-apple-darwin
docker push docker.io/spaceaidocker/boinc-client:arm64-apple-darwin

# arm64-apple-darwin + tensfor flow (Mac Os Desktop)
docker build --platform linux/arm64 -t boinc-client:arm64v8-tensor -f Dockerfile.arm64v8-tf .
docker tag boinc-client:arm64v8-tensor docker.io/spaceaidocker/boinc-client:arm64v8-tensor
docker push docker.io/spaceaidocker/boinc-client:arm64v8-tensor


# run local without downloading image
docker run -d \
 --name boinc-tf \
 --net=host \
 --pid=host \
 -v /Users/salimbene/dev/boinc/tmp:/var/lib/boinc:Z \
 boinc-client:arm64v8-tensor

 cp tfLinear2/linear2.py linear2.py
 cp tfLinear2/input.csv input.csv

 bin/stage_file linear2.py
 bin/stage_file input.csv
 bin/create_work --appname linear2 input.csv linear2.py

## Execute on IMX8

- IMX8: Starting BOINC client version 7.14.2 for aarch64-unknown-linux-gnu
- Desktop: Starting BOINC client version 8.0.2 for arm64-apple-darwin
- Server: 8.1.0
  "/Library/Application Support/Boinc Data/projects/34.41.104.158_8080_helloworld/"
- boinc --version 7.18.1 x86_64-pc-linux-gnu

```sh
docker run -d \
 --name boinc \
 --net=host \
 --pid=host \
 -v /home/root/boinc:/var/lib/boinc \
 -e BOINC_GUI_RPC_PASSWORD="123" \
 -e BOINC_CMD_LINE_OPTIONS="--allow_remote_gui_rpc" \
 -e BOINC_PROJECT_URL="http://boincdev.sos.space/demosai/" \
 -e BOINC_AUTH_KEY="d899927056927aa7689efd924174281f" \
 docker.io/spaceaidocker/boinc-client:arm64v8-aarch64


#  docker run -d \
# --name ipfs-cli \
# --env-file .env \
# -v /root/ipfs/data:/usr/src/app/data \
# -p 7002:7002 -p 7012:7012 spaceaihub/ipfs-cli-slim:amd64

````

## Execute on Mac OS

```sh
podman login docker.io/spaceaihub

podman run -d \
 --name boinc \
 --net=host \
 --pid=host \
 -v /Users/matiassalimbene/opt/appdata/boinc:/var/lib/boinc:Z \
 -e BOINC_GUI_RPC_PASSWORD="123" \
 -e BOINC_CMD_LINE_OPTIONS="--allow_remote_gui_rpc" \
docker.io/spaceaidocker/boinc-client:arm64-apple-darwin

 docker.io/msalimbe1/boinc-client:arm64v8glib
# run local without downloading image
# podman run -d \
docker run -d \
 --name boinc \
 --net=host \
 --pid=host \
 -v $(pwd):/var/lib/boinc:Z \
 docker.io/spaceaidocker/boinc-client:arm64v8-aarch64


# check logs/output
podman logs --follow boinc-apple

# access command line
podman exec -it boinc bash


podman stop boinc-apple && podman rm boinc-apple

while true; do echo -n "This is a test of while loop";date ; sleep 5

```

## Execute Boinc Client on Windows

### x86_64-pc-linux-gnu (intel)

```sh
export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker build -t boinc-client:x86_64 -f Dockerfile.intel .
docker tag boinc-client:x86_64 docker.io/spaceaidocker/boinc-client:x86_64
docker push docker.io/spaceaidocker/boinc-client:x86_64

# -v "%LOCALAPPDATA%\boinc_data:/var/lib/boinc" ^
export DOCKER_DEFAULT_PLATFORM=linux/amd64
docker run -d --name boinc --device /dev/dri:/dev/dri docker.io/spaceaidocker/boinc-client:x86_64

# --network host \
docker run -d \
    --name boinc-client \
    -v "$(pwd)/temp":/usr/src/app \
    boinc-client:x86_64

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
```

### Build intel binary

```sh

docker run -it ^
    --name ubuntu-python ^
    -v C:\Users\Administrator\dev\boinc:/mnt ^
    ubuntu:latest ^
    bash -c "apt-get update && apt-get install -y python3 && bash"



apt-get update
apt-get install -y python3-venv


python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt



```
