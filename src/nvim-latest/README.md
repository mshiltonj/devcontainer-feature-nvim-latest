# nvim-latest devcontainer feature.

* Detects x86_64 or arm64 architecture.
* Downloads the lastest (nightly!) nvim binaries from https://github.com/neovim/neovim/releases.
* Copies the package to /opt/nvim
* Adds /opt/nvim/bin to the PATH in /etc/profile

Note: exec into the container with `bash -l` or be sure to add /opt/nvim/bin to a $PATH you are using.

