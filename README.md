# workon-py

> Simple pipenv bash alternative, virtual-environment management helper.

Work and create python virtualenvs in a central
directory, use sub-shell for activation and run arbitrary commands in envs.

## Install

Before, make sure you're using Python 3 and/or have `virtualenv` installed.

Change directory to installation location, for example `~/.local/bin`:

```bash
$ cd ~/.local/bin
$ curl -L https://github.com/rafi/workon-py/tarball/master | tar zx --strip-components=1
```

See [shell completion](#shell-completion) for helpful shell completions.

## Usage

```txt
usage: workon [arguments] <virtualenv>

arguments:
  -c, --create           create and activate a new virtualenv
      --no-install       when creating, don't install requirements
  -d, --delete           Delete virtualenv
  -r, --run <cmd>        Run a binary from virtualenv
  -h, --help             show this help message and exit

environment variables:
  WORKON_HOME            Path to create venvs, default: ${XDG_DATA_HOME}/python/envs
  WORKON_VIRTUALENV      Optional, set specific virtualenv path
                         Leave empty for interactive selection.
```

### Examples

#### Create a New Virtualenv

To create a new virtualenv, use `-c`, you will be prompted which
virtualenv to use, if more than one version is found:

```bash
$ workon -c foobar

1) python3 -m venv                3) /usr/local/bin/virtualenv
1) /usr/local/bin/virtualenv-3.7  4) /usr/local/bin/virtualenv-2.7
 :: Select virtualenv program to use:
```

#### Create a Unique Project Virtualenv

You can use paths when creating a new virtualenv, _e.g._:

```bash
cd myproject
workon -c .
```

This will create a unique virtualenv name with the crc32 of path,
_i.e._ `myproject-8bfb376d`.

#### Activate an Existing Virtualenv

Provide the name of a virtualenv, or without arguments and `fzf`/`fzy`
will be used to interactively select a virtual-environment.

```bash
workon foobar
```

To deactivate, simply type `exit` or hit <kbd>Ctrl</kbd>+<kbd>d</kbd>

#### Run Arbitrary Commands

You can run "one-off" commands within the virtualenv's binary directory,
for example list all pip installed packages:

```bash
workon -r myproject pip list
```

### Shell Completion

#### bash

Add the completion script to your `.bash_profile` or `.bashrc`:

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
- [pipenv - Python Development Workflow (python)](https://github.com/pypa/pipenv)

## License

Copyright (C) 2015-2019 Rafael Bodill

Distributed under the GNU General Public License, version 2.0.
