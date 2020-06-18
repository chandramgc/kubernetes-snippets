# for adding privilege
docker run --cap-add KILL ubuntu

# for droping privilege
docker run --cap-drop KILL ubuntu

# for getting all privilege
docker run --privileged ubuntu

# for running with certain user
docker run --user=1001 ubuntu sleep 3600





