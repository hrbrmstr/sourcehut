
[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/sourcehut.svg?branch=master)](https://travis-ci.org/hrbrmstr/sourcehut)
[![builds.sr.ht
status](https://builds.sr.ht/~hrbrmstr/sourcehut.svg)](https://builds.sr.ht/~hrbrmstr/sourcehut?)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.2.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# sourcehut

Tools to Work with the SourceHut Development Ecosystem

## Description

SourceHut (<https://sourcehut.org/>) provides support for collaborative
development of anything that can can be managed by Git or Mecurial
version control systems. Tools are provided to query and ochestrate a
wide variety of SourceHut servies.

## What’s Inside The Tin

The following functions are implemented:

  - `git_repos`: Retrieve metadata about repositories
  - `git_user`: Retrieve metadata about yourself or another SourceHut
    user
  - `meta_audit`: Retrieve your audit log
  - `meta_profile`: Retrieve metadata about yourself
  - `meta_ssh_keys`: Retrieve your SSH keys
  - `sourcehut_pat`: Get or set SourceHut Personal Access Token
  - `sourcehut_user`: Get or set SourceHut username value
  - `use_builds`: Setup .build.yml for SourceHut builds

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/sourcehut.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/sourcehut")
# or
remotes::install_gitlab("hrbrmstr/sourcehut")
# or
remotes::install_bitbucket("hrbrmstr/sourcehut")
# or
remotes::install_github("hrbrmstr/sourcehut")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(sourcehut)

# current version
packageVersion("sourcehut")
## [1] '0.1.0'
```

## sourcehut Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |       13 | 0.93 | 155 | 0.95 |          67 | 0.82 |       72 | 0.72 |
| Rmd  |        1 | 0.07 |   8 | 0.05 |          15 | 0.18 |       28 | 0.28 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
