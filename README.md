# PyLoad

![](https://pyload.net/img/banner.png)

[![](https://images.microbadger.com/badges/version/rootlogin/pyload.svg)](https://microbadger.com/images/rootlogin/pyload "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/rootlogin/pyload.svg)](https://microbadger.com/images/rootlogin/pyload "Get your own image badge on microbadger.com")

Dockerized [PyLoad](https://github.com/pyload/pyload) download manager.

## Container environment

### Included software

* Alpine Linux 3.4 (stable)
* Python2
* py-curl
* py-simplejson
* py-feedparser
* py-crypto
* baker
* pyOpenSSL
* Spidermonkey
Everything is bundled in the newest stable version.

### Tags

* **latest**: latest released stable PyLoad version
* **latest-git**: latest stable PyLoad version from git
* **vX.X.X**: stable version tags of Pyload (e.g. v0.4.9)

### Build-time arguments

* **UID**: User ID of the pyLoad user (default 1502)
* **GID**: Group ID of the pyLoad user (default 1502)

### Exposed ports

* **8000**: PyLoad Webserver

### Volumes

* **/config** : PyLoad configuration

## Usage

* Pull the image: `docker pull rootlogin/pyload`
* Run it: `docker run -d --name pyload -p 8000:8000 -v my_local_config_folder:/config rootlogin/pyload` (Replace my_local_config_folder with the path where do you want to store the persistent configuration)
* Open localhost and profit!
