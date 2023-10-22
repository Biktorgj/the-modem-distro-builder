# Docker build for the modem distro
If you want to build the modem distro through docker, this repo should have everything you need.

## Requirements:
- Docker & Docker-compose (`apt install docker.io docker-compose`)

Once you have the required packages, run:
`docker-compose up`. It will create a debian based container with all the dependencies, fetch all the repositories and make a new build. Output flashable images will be at `./modem_build_vol/repos/target`

To rebuild the image if you change something, run `docker-compose up --build`
If you want to just leave it running without looking at the output and blocking your terminal, run `docker-compose up -d`, you can watch the output later with `docker logs modem_distro_builder -f`