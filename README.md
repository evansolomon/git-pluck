# `gitpluck`

Managing lots of repositories can be annoying.  `gitpluck` automates the process by recursively searching for git repositories from your current directory and letting you pass arbitrary commands to each of them.

For example, if you want to run `git pull` on each of the repositories within your current directory, you could run `gitpluck pull`.  If you wanted to be more specific, you could run `gitpluck pull origin master`.  To see what the state of each repository is, you could run `gitpluck status`

## Installation

This is most useful if you put `gitpluck` somewhere that your `$PATH` has access to.  For example, assuming `~/bin` is in your `$PATH`, something like this:

`ln -s /path/to/git-pluck/gitpluck ~/bin`

## Usage

I also find that it's convenient to be able to access `gitpluck` more like other Git commands, i.e. as `git pluck`.  To do this, I wrote a small function that overloads the "real" `git` command.  It checks for specific instances where I want to customize its behavior, and otherwise passes off my input to Git.  This gets loaded in my shell config (e.g. `.bashrc` or `.zshrc`).

```shell
# Git wrapper
# Used to extend/overload git commands
git() {
	if [[ $1 == "pluck" ]]; then
    # Remove the `pluck` arg
    shift
    command gitpluck "$@";
  else
    command git "$@";
  fi
}
```

## Non-git commands

By deafult `gitpluck` assumes you're going to pass git commands to each repository, so it prefixes your command with 'git '.  That's why the short syntax like `gitpluck pull` works.

If you want to disable the prefixing, you can pass a `--nogit` flag as either the first or last arugment.  For example, `gitpluck ls --nogit` or `gitpluck --nogit ls` would both list the files in each repository.