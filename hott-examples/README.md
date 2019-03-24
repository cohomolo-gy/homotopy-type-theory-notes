## Haskell examples for the NYC Homotopy Type Theory Meetup 2019

### Setup

There are 2 ways to set up this project. These instructions should work for Mac, Linux, and Windows.

#### Mac OS/Linux

#####  Using Cabal

For the fastest and easiest route to setup, please install [ghcup](https://github.com/haskell/ghcup), and execute the following commands in terminal:

```bash
ghcup install-cabal
ghcup install 8.6.3
ghcup set 8.6.3
```

This will get you a local install of [cabal](https://github.com/haskell/cabal), a build tool for Haskell, as well as a local installation of GHC 8.6.3, the latest stable version. It is not recommended that you use `cabal` and `ghcup` with Windows, unless you have access to a Cygwin environment. If you choose to use `cabal`, you can remove it and any GHC versions installed by `ghcup` by deleting the `~/.ghcup` directory. By using `v2-*` commands, you will not install global dependencies.

##### Using Stack

[stack](https://github.com/commercialhaskell/stack) is an "all-in-one" build tool which pins all dependencies to stable, curated package sets and GHC versions. You may install stack by following the [instructions](https://docs.haskellstack.org/en/stable/README/#how-to-install).

**WARNING**: this will result in a global install of a binary. Installing dependencies via `stack install` or `cabal install` will result in global dependencies, so be aware, and stick to `stack build` and `cabal v2-build`.

You may remove stack or cabal dependencies at any time by removing `~/.local` for `stack`, or `~/.cabal` for `cabal`, or wherever you set the install directory.


#### Windows

Help Wanted (or use Stack)

### Examples

In order to run examples, you will need to build the project using `(cabal v2-build | stack build)` at the root of the project, and enter into a repl, using the `(cabal v2-repl lib:hott| stack repl lib:hott)` command. You can play around with the content by importing any module.
