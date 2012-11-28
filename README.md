# gitpluck

Updating lots of repositories can be annoying.  `gitpluck` automates the process by recursively searching for git repositories from your current directory and giving you the option to update each of them.  Passing `-a` or `--all` (.e.g `gitpluck -a`) will skip the confirmation step and just try to update all of your repositories.

`gitpluck` is pretty basic, it just runs `git pull` on every repo it finds.  That assumes that your current branch has an remote branch it's tracking.  If it doesn't, `gitpluck` will show you the error returned by git.

## Installation

This is most useful if you put `gitpluck` somewhere that your `$PATH` has access to.  For example, assuming `~/bin` is in your `$PATH`, something like this:

`ln -s /path/to/git-pluck/gitpluck ~/bin`