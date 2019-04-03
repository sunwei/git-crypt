# Docker with git-crypt 

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)


For **developer** who need to **decrypt git repo with sensitive file**, the **docker git-crypt** is a **docker image**,
unlike other local git-crypt runtime env, docker git-crypt provide **all the git-crypt runtime through docker**, you 
donn't need to install git-crypt by yourself, just docker only. powered by [docker](https://www.docker.com/) 
and [git-crypt](https://github.com/AGWA/git-crypt).

---


## Table of Contents
- [Install](#-install)
  - [Prerequisites](#prerequisites)
  - [Installing](#Installing)
- [Usage](#-usage)
  - [Docker](#docker)
  - [Makefile](#makefile)
  - [Demo](#demo)
- [License](#-license)


## Install

### Prerequisites
[Docker](https://www.docker.com/)

[GnuPG](https://www.gnupg.org/download/index.html)

### Installing
Download this repo:

```console
git clone git@github.com:sunwei/git-crypt.git
cd ./git-crypt
```

## Usage

### Docker
```
docker run --rm -it \
	 -v "</absolute/path/to/your/gpg/file>:/app/key" \
	 -v "</absolute/path/to/your/encrypted/repo/>:/app/repo" \
	 git-crypt \
	git-crypt unlock
```

### Makefile

1. Export gpg key
```console
make export-key keyid=<your gpg key id>
```

2. Decrypt your repo
```console
make decrypt keyid=<your gpg key id> repo=</path/to/repo/you/want/to/decrypt>
```

### Demo

[YouTube](https://youtu.be/Vaj1aNXXxpk)

[Video download](https://pan.baidu.com/s/1QJ9mR8EOSZN9hGhT72U5PA) Password:`z73m`

## License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
