# `gitpluck`

Managing lots of repositories can be annoying.  `git pluck` automates the process by recursively searching for git
repositories from your current directory and letting you pass arbitrary commands to each of them.  Its design is
inspired by Git core's `git submodule foreach`.

For example, if you want to run `git pull` on each of the repositories within your current directory, you could run `git
pluck pull`.  If you wanted to be more specific, you could run `git pluck pull origin master`.  To see what the state of
each repository is, you could run `git pluck status`

## Installation

```
cp git-pluck $HOME/bin/git-pluck
cp bash_completion.bash $HOME/.git-pluck.bash
```
Add the `git-pluck` executable to your `$PATH`, and Git will automatically use it when you run `git pluck`.  To enable
bash completion for `git pluck`, source the bash completion script in your `.bashrc`.
```
if [ -f ~/.git-pluck.bash ]; then
    . ~/.git-pluck.bash
fi
```

## Non-git commands

By default `git pluck` assumes you're going to pass git commands to each repository, so it prefixes your command with
`git `.  That's why the short syntax like `git pluck pull` works.

If you want to disable the prefixing, you can pass a `--nogit` flag as either the first or last argument.  For example,
`git pluck ls --nogit` or `git pluck --nogit ls` would both list the files in each repository.
