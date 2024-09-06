docker container stop boinc && docker container rm boinc

docker build -t boinc-client:intel -f Dockerfile.intel .
docker tag boinc-client:intel docker.io/spaceaidocker/boinc-client:intel
docker push docker.io/spaceaidocker/boinc-client:intel

docker run -d ^
--name boinc ^
--device /dev/dri:/dev/dri  ^
-v "%LOCALAPPDATA%\boinc_data:/var/lib/boinc" ^
-e BOINC_GUI_RPC_PASSWORD="123" ^
-e BOINC_CMD_LINE_OPTIONS="--allow_remote_gui_rpc" ^
docker.io/spaceaidocker/boinc-client:intel

@REM -e BOINC_PROJECT_URL="http://boincdev.sos.space/demosai/" ^
@REM -e BOINC_AUTH_KEY="d899927056927aa7689efd924174281f" ^

