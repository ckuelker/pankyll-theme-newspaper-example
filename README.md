---
title:  pankyll-theme-newspaper-example/README.md
author: Christian Külker
date:   2020-04-24

---

# Abstract

This document describes briefly the aim and content of the
`Pankyll-theme-newspaper-example` repository. The goal is to show the
configuration and usage of the [Pankyll] theme [Newspaper] by providing working
example with a directory tree that can be used as base to build up a new site.

![Github license](https://img.shields.io/github/license/ckuelker/pankyll-theme-newspaper-example.svg)
![Github issues](https://img.shields.io/github/issues/ckuelker/pankyll-theme-newspaper-example.svg?style=popout-square)
![Github code size in bytes](https://img.shields.io/github/languages/code-size/ckuelker/pankyll-theme-newspaper-example.svg)
![Git repo size](https://img.shields.io/github/repo-size/ckuelker/pankyll-theme-newspaper-example.svg)
![Last commit](https://img.shields.io/github/last-commit/ckuelker/pankyll-theme-newspaper-example.svg)

# Changes

| Version | Date       | Author           | Notes                             |
| ------- | ---------- | ---------------- | --------------------------------- |
| 0.1.3   | 2020-04-24 | Christian Külker | Changes to support latest Pankyll |
| 0.1.2   | 2020-03-29 | Christian Külker | default type, Makefile, log.yaml  |
| 0.1.1   | 2020-03-28 | Christian Külker | README.md: usage, port, license   |
| 0.1.0   | 2020-03-22 | Christian Külker | Initial release                   |

# Introduction

More than a 1000 words, a life example can show how things are done the right
away. This [Pankyll] theme newspaper example is a pre-configured [Pankyll]
theme with a little bit of content to see how easy it is to set up a
[Pankyll] site with a newspaper theme.

# Prerequisites

**TLTR:**

Requires [Pankyll](https://github.com/ckuelker/pankyll/) and for [Debian] install
the following:

```bash
aptitude install pandoc fonts-noto-cjk fonts-wqy-microhei make
git clone --recursive https://github.com/ckuelker/pankyll-theme-newspaper-example.git
```

## Pankyll

We assume that [Pankyll] is installed and that the script `pankyll` is in
your `PATH`. Read the [Pankyll]
[README.md](https://github.com/ckuelker/pankyll/) for more information.

## Pandoc

[Pandoc] is expected to be installed. While it is possible to run `pankyll`
with `pandoc` 1.x.x it will not produce good results. [Pankyll] was tested
with version 2.2.1 and should give good results.

**Installation for Debian:**

```bash
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

```bash
aptitude install fonts-noto-cjk fonts-wqy-microhei
```

## Make (Optional)

A control file (Makefile) is used to control easy build. If you do not want to
use it just run the `pankyll` command inside your project directory. If you
want to use it see the usage section.

**Installation for Debian:**

```bash
aptitude install make
```

# Installation

Clone the example repository and its sub-modules

```bash
git clone --recursive https://github.com/ckuelker/pankyll-theme-newspaper-example.git
```

# Usage

Build the site

```bash
cd pankyll-theme-newspaper-example
make submodule-update # this takes some time
make realclean
make build
```

Start a server

```bash
make server
```

Or shorter:

```bash
make submodule-update realclean build server
```

Open a browser and access the URL [http://localhost:8000](http://localhost:8000)

# Author

    Christian Külker <c@c8i.org>

# License And Copyright

    Copyright (C) 2020 by Christian Kuelker

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 3, or (at your option) any later
    version.

    This program is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
    more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc., 59
    Temple Place, Suite 330, Boston, MA 02111-1307 USA

# DISCLAIMER OF WARRANTY

    BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR
    THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
    OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
    PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
    OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
    MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO
    THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH YOU. SHOULD THE
    SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
    REPAIR, OR CORRECTION.

# LIMITATION OF LIABILITY

    IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL
    ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE
    THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE LIABLE TO YOU FOR
    DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
    DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE SOFTWARE (INCLUDING
    BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES
    SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE SOFTWARE TO OPERATE
    WITH ANY OTHER SOFTWARE), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN
    ADVISED OF THE POSSIBILITY OF SUCH DAMAGES

[Debian]: https://www.debian.org/
[Newspaper]: https://github.com/ckuelker/pankyll-theme-newspaper/
[Pandoc]: https://pandoc.org/
[Pankyll]: https://www.pankyll.org/


