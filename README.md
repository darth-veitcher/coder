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

## References
* [cdr/code-server](https://github.com/cdr/code-server)
* [How to host VS Code on a vps using Code-server](https://medium.com/@edwinbrowwn/how-to-host-vs-code-on-a-vps-using-coder-aka-code-server-d519767fb52c)