---
title: pankyll-theme-newspaper-example/README.md
author: Christian Külker
version 0.1.5
date: 2022-05-09

---

# Abstract

This document describes briefly the aim and content of the
`pankyll-theme-newspaper-example` repository.

The goal of this repository is to show the configuration and usage of the
[Pankyll] theme [Newspaper] by providing a working example with a directory
tree that can be used as a base to build up a new site.

![Github license](https://img.shields.io/github/license/ckuelker/pankyll-theme-newspaper-example.svg)
![Github issues](https://img.shields.io/github/issues/ckuelker/pankyll-theme-newspaper-example.svg?style=popout-square)
![Github code size in bytes](https://img.shields.io/github/languages/code-size/ckuelker/pankyll-theme-newspaper-example.svg)
![Git repo size](https://img.shields.io/github/repo-size/ckuelker/pankyll-theme-newspaper-example.svg)
![Last commit](https://img.shields.io/github/last-commit/ckuelker/pankyll-theme-newspaper-example.svg)

## History

| Version | Date       | Notes                                                |
| ------- | ---------- | ---------------------------------------------------- |
| 0.1.5   | 2022-05-09 | Makefile                                             |
| 0.1.4   | 2022-05-09 | Makefile, version, README                            |
| 0.1.3   | 2020-04-24 | Changes to support latest Pankyll                    |
| 0.1.2   | 2020-03-29 | default type, Makefile, log.yaml                     |
| 0.1.1   | 2020-03-28 | README.md: usage, port, license                      |
| 0.1.0   | 2020-03-22 | Initial release                                      |

# Introduction

More than a 1000 words, a life example can show how things are done the right
away. This [Pankyll] theme [newspaper[ example is a pre-configured [Pankyll]
theme with a little bit of content to see how easy it is to set up a
[Pankyll] site with a [newspaper[ theme.

# Prerequisites

**TLTR:**

Requires [Pankyll] and on [Debian] install the following:

As root

```shell
aptitude install pandoc fonts-noto-cjk fonts-wqy-microhei make
```

As user

```shell
export URL=https://github.com/ckuelker/pankyll-theme-newspaper-example.git
git clone --recursive $URL
```


## Pankyll

We assume that [Pankyll] is installed and that the script `pankyll` is in your
`PATH`. Read the [Pankyll] [README.md] for more information.

## Pandoc

[Pandoc] is expected to be installed. While it is possible to run `pankyll`
with `pandoc` 1.x.x it will not produce good results. [Pankyll] was tested
with version 2.2.1 and should give good results.

**Installation for Debian:**

```shell
aptitude install pandoc
```

## Fonts

To create PDF files from Markdown, the following fonts seem to produce the best
results. For [Pankyll] 0.1.0 the names are hard coded, that might change in
future releases.

* Noto Sans CJK JP
* Noto Sans Mono CJK JP Bold
* WenQuanYi Micro Hei Mono

**Installation for Debian:**

```shell
aptitude install fonts-noto-cjk fonts-wqy-microhei
```

## Make (Optional)

A control file (Makefile) is used to control easy build. If you do not want to
use it just run the `pankyll` command inside your project directory. If you
want to use it see the usage section.

**Installation for Debian:**

```shell
aptitude install make
```

# Installation

Clone the example repository and its sub-modules

```shell
git clone --recursive https://github.com/ckuelker/pankyll-theme-newspaper-example.git
```

# Usage

Update, build and see the site:

```shell
cd pankyll-theme-newspaper-example
make submodule-update
make submoduleclean
make submodule-pull
make realclean
make build
make server
```

Or all at once:

```shell
make all
```

Open a browser and access the URL [http://localhost:8000](http://localhost:8000)

# Author

    Christian Külker <c@c8i.org>

# License And Copyright

    Copyright (C) 2020, 2022 by Christian Kuelker, see LICENSE file.

[Debian]: https://www.debian.org/
[Newspaper]: https://github.com/ckuelker/pankyll-theme-newspaper/
[Pandoc]: https://pandoc.org/
[Pankyll]: https://www.pankyll.org/
[Rankle]: https://github.com/ckuelker/pankyll-theme-rankle
[README.md]: https://github.com/ckuelker/pankyll
[Simplicissimus]: https://github.com/ckuelker/pankyll-theme-simplicissimus
