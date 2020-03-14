# coder
A basic, customised, installation of [cdr/code-server](https://github.com/cdr/code-server) to provide a VS Code IDE in a web-browser. Designed to enable development from an iPad Pro for a generic stack that includes:

* Python3
  * Using `Pipenv` and `Pyenv`
* Go
* React
* ReactNative

## Usage
The easiest way to get setup and running in a `semi-production` sense is to:

* use Cloudflare for DNS:
  * enable HTTPS (not `strict`)
* run the container with the following command

```bash
docker run --name coder \
    -v /path/to/storage:/home/coder/project \
    -e PASSWORD=mypassword \
    -p 80:8080 \
    -p 443:8080 \
saracen9/coder --cert
```

You can optionally run this with access to the host docker daemon as well so that docker commands (such as building) will work from within the VS Code terminal. **Please ensure you're comfortable with the security implications of doing so.**

```bash
docker run --name coder \
    -v /path/to/storage:/home/coder/project \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/bin/docker:/usr/bin/docker \
    -e PASSWORD=mypassword \
    -p 80:8080 \
    -p 443:8080 \
saracen9/coder --cert
```

## Roadmap
These are features I'd like to have but haven't yet implemented.

* [ ] Language support
  * [ ] Python 3
  * [ ] Go
  * [ ] React
  * [ ] ReactNative
* [x] Enable ability to use docker from within the IDE for builds
* [ ] Install appropriate extensions for VS Code

## References
* [cdr/code-server](https://github.com/cdr/code-server)
* [How to host VS Code on a vps using Code-server](https://medium.com/@edwinbrowwn/how-to-host-vs-code-on-a-vps-using-coder-aka-code-server-d519767fb52c)