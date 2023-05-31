# Setup and Configuration of Docker RStudio

### Setup
If running rocker/rstudio on an ARM mac (using an Apple Silicon chip) make sure to enable rosetta from command line: 
```sh
softwareupdate --install-rosetta
```
Update Docker Hub App Settings: 
- Turn on Virtualization Framework (enabled via the toggle in the General panel)
- Enable the checkbox under the experimental settings (settings > features in development > use rosetta)
![Docker Setting - Rosetta emulation on Apple Silicon](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*6uPAJ8XiHyZ0gqMy2JscBQ.png)
Footnote: (https://github.com/rocker-org/rocker-versioned2/issues/144#issuecomment-1412330338)

### Configuration

#### Install new packages
To install new package (libraries) in the RStudio env that you want to reuse in subsequent sessions
1. Edit Dockerfile in root of this directory and append new package 
```hp
"install.packages(c('devtools', 'githubinstall', 'dbplyr', 'RSQLite', etc. ...));"
```
2. Run in terminal:
```hp
docker compose build --no-cache
```
3. Restart container:
```hp
docker compose up
```


Additional Details:
- R Docker Tutorial: https://jsta.github.io/r-docker-tutorial/
- Fix `no matching manifest for Linux/arm64/v8 in the manifest list entries` error : 
- Add line to docker-compose (https://onexlab-io.medium.com/apple-m1-chip-no-matching-manifest-for-linux-arm64-v8-docker-mysql-5142060a9309)
```sh 
platform: "linux/x86_64"
``` 
- Dave Tang Blog on configuring Docker Rstudio:
https://github.com/davetang/learning_docker/blob/main/rstudio/Dockerfile
https://davetang.org/muse/2021/04/24/running-rstudio-server-with-docker/ 