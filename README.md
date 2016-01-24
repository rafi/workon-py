# workon-py
Work and create python virtualenvs in a central directory, via subshell.

## Dependencies
- virtualenv

## Install
Change directory to installation location, for example `~/.local/bin`:
```sh
$ cd ~/.local/bin
$ curl -L https://github.com/rafi/workon-py/tarball/master | tar zx --strip-components=1
```

## Usage
```
usage: workon [arguments] <virtualenv>

arguments:
  -c, --create           create and activate a new virtualenv
  -h, --help             show this help message and exit
```

### Examples
#### Create a New Virtualenv
To create a new virtualenv, use `-c`, you will be prompted which
virtualenv to use, if more than one version is found:
```sh
$ workon -c foobar
1) /opt/local/bin/virtualenv      3) /opt/local/bin/virtualenv-3.4
2) /opt/local/bin/virtualenv-2.7
Select virtualenv program to use:
```

#### Activate an Existing Virtualenv
Simply run:
```sh
$ workon foobar
```

To deactivate, simply type `exit` or hit <kbd>Ctrl</kbd>+<kbd>d</kbd>

### Shell Completion
Add the completion script to your `.bash_profile` or `.bashrc`:
#### bash
```sh
source "$HOME/.local/bin/workon-completion.bash"
```
#### zsh
None available currently, pull-requests are welcomed.

## Similar Projects
- [Virtualenv's bin/activate is Doing It Wrong (article)](https://gist.github.com/datagrok/2199506)
- [autoenv - directory-based environments (shell)](https://github.com/kennethreitz/autoenv)
- [capn - specify hooks when changing directories (python)](https://github.com/dustinlacewell/capn)
- [pew - manage multiple virtual environments (python)](https://github.com/berdario/pew)
- [vex - run a command in the named virtualenv (python)](https://github.com/sashahart/vex)

## License
Copyright (C) 2015-2016 Rafael Bodill
Distributed under the GNU General Public License, version 2.0.
