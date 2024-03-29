# +---------------------------------------------------------------------------+
# | Makefile                                                                  |
# |                                                                           |
# | Pankyll-Theme-Newspaper-Example                                           |
# |                                                                           |
# | Version: 0.1.7 (change inline)                                            |
# |                                                                           |
# | Changes:                                                                  |
# |                                                                           |
# | 0.1.7 2023-03-17 Christian Külker <c@c8i.org>                             |
# |     - Improve writing, fix typo                                           |
# |     - Add missing dummy prerequisite to server target                     |
# | 0.1.6 2022-05-20 Christian Külker <c@c8i.org>                             |
# |     - Improve 'info' target                                               |
# |     - Add 'update' target                                                 |
# |     - Add submoduleclean dependencies                                     |
# | 0.1.5 2022-05-09 Christian Külker <c@c8i.org>                             |
# |     - Unmask pankyll run (better error visibility)                        |
# |     - Add Python yaml Loader parameter (safer)                            |
# | 0.1.4 2022-05-08 Christian Külker <c@c8i.org>                             |
# |     - Add test from theme rankle                                          |
# |     - Fix static DSTD                                                     |
# |     - Fix static mssing HOST variable                                     |
# |     - Remove pankyll.rsync at 'clean' target                              |
# |     - Add target 'all'                                                    |
# |     - Add repository-update to .PHONY                                     |
# |     - Change target linkcheck-local-extern to linkcheck-extern            |
# | 0.1.3 2020-04-29 Christian Külker <c@c8i.org>                             |
# |     - Add more phony targets                                              |
# |     - Read configuration partly from cfg.yaml                             |
# |     - Build example root index.html                                       |
# |     - Server target supports URL prefix                                   |
# |     - Fix URL for root index.html for prefix /                            |
# | 0.1.2 2020-04-24 Christian Külker <c@c8i.org>                             |
# |     - Add target submoduleclean                                           |
# |     - Add target submodule-pull                                           |
# |     - Add target repository-pull                                          |
# |     - Add theme variable                                                  |
# |     - Improve server target                                               |
# |     - Add linkcheck targets                                               |
# | 0.1.1 2020-03-29 Christian Külker <c@c8i.org>                             |
# |     - Capture pankyll output: pankyll.err, pankyll.out, pankyll.log       |
# |     - Clean: removes pankyll.err, pankyll.out, pankyll.log                |
# | 0.1.0 2020-03-17 Christian Külker <c@c8i.org>                             |
# |     - Initial release                                                     |
# |                                                                           |
# +---------------------------------------------------------------------------+
#
# Makefile version
THEME:=newspaper
VERSION=0.1.7
PORT=8000
NS=pankyll-theme-$(THEME)-example
# -----------------------------------------------------------------------------
# NO CHANGES BEYOND THIS POINT
ifndef VERSION
$(error VERSION is NOT defined)
endif
# Test if pankyll is installed and in the PATH
ifeq (, $(shell which pankyll))
  $(error "No pankyll in $(PATH), consider installing pankyll")
else
  PANKYLL=$(shell which pankyll)
endif
# Test if pandoc is installed and in the PATH
ifeq (, $(shell which pandoc))
  $(error "No pandoc in $(PATH), consider installing pandoc")
else
  PANDOC=$(shell which pandoc)
endif
# Test if pdflatex is installed and in the PATH
# For pandoc 'pdflatex' is the default option
ifeq (, $(shell which pdflatex))
  $(error "No pdflatex in $(PATH), consider installing pdflatex")
else
  PDFLATEX=$(shell which pdflatex)
endif
HOST=$(shell hostname)
# Python yaml 5.1 require Loader= parameter, see
# https://github.com/yaml/pyyaml/wiki/PyYAML-yaml.load(input)-Deprecation
# python3 -c "import yaml;print(yaml.load(open('cfg.yaml'), Loader=yaml.SafeLoader)['site']['public_dir'])"
PYB :=  python3 -c "import yaml;print(yaml.load(open('cfg.yaml'), Loader=yaml.SafeLoader)['
PYE := '])"
DSTD=$(shell $(PYB)site']['public_dir$(PYE))
PFX=$(shell $(PYB)site']['url$(PYE))
LOC=$(shell $(PYB)default']['l10n_locale$(PYE))
PFXDIR=$(shell echo "$(PFX)"|sed -e 's%^/%%')
NPROC=$(shell nproc)
WDIR=$(shell echo $(DSTD) $(PFXDIR)|tr ' ' '/') # public | public/PFXDIR
DEBUG_PRINT='1[$@]2[$%]3[$<]4[$?]5[$^]6[$+]7[$|]8[$*]9[$(@D)]10[$(@F)]11[$(*D)]\n12[$(*F)]13[$(%D)]14[$(%F)]15[$(<D)]16[$(<F)]17[$(^D)]18[$(^F)]\n19[$(+D)]20[$(+F)]21[$(?D)]22[$(?F)]\n'
# /webfonts/fa-regular-400 requested by all.min.css but not provided
LINKCHECK_IGNORE:=/webfonts/fa-regular-400
LINKCHECK_SERVER:=http://localhost:$(PORT)
LINKCHECK_PARAMS:=--no-status --ignore-url=$(LINKCHECK_IGNORE) -o blacklist $(LINKCHECK_SERVER)
L:=============================================================================
.PHONY: build clean htmlclean info markdownclean pdfclean realclean server \
	submodule-update test usage submoduleclean submodule-pull \
	repository-update
usage:
	@echo "$(L)"
	@echo "USAGE:"
	@echo "$(L)"
	@echo "make usage            : This information"
	@echo "make info             : Print more info"
	@echo "make clean            : Remove process files"
	@echo "make markdownclean    : Remove all *.md from target (debug)"
	@echo "make htmlclean        : Remove all *.html from target (debug)"
	@echo "make pdfclean         : Remove all *.pdf from target (debug)"
	@echo "make submoduleclean   : Remove all changes from content, pandoc"
	@echo "                        and themes/pankyll-theme-$(THEME)"
	@echo "make realclean        : Remove target"
	@echo "make submodule-update : Update git sub-modules configuration"
	@echo "make submodule-pull   : Get latest git sub-module update"
	@echo "make repository-update: Update git repository"
	@echo "make build            : Build project"
	@echo "make server           : Start a development server on port $(PORT)"
	@echo "make all              : Update realclean build server"
info:
	@echo "NS     : [$(NS)]"
	@echo "VERSION: [$(VERSION)]"
	@echo "LOC    : [$(LOC)]"
	@echo "DSTD   : [$(DSTD)]"
	@echo "PFX    : [$(PFX)]"
	@echo "PFXDIR : [$(PFXDIR)]"
	@echo "WDIR   : [$(WDIR)]"
	@echo "NPROC  : [$(NPROC)]"
	@echo "HOST   : [$(HOST)]"
	git submodule status --recursive
# For development (might remove too much or too less files for a clean build)
markdownclean:
	find $(DSTD) -name "*.md"|xargs -d '\n' rm -f
# For development (might remove too much or too less files for a clean build)
htmlclean:
	find $(DSTD) -name "*.html"|xargs -d '\n' rm -f
# For development (might remove too much or too less files for a clean build)
pdfclean:
	find $(DSTD) -name "*.pdf"|xargs -d '\n' rm -f
# For development (might remove too much or too less files for a clean build)
publicclean:
	rm -rf $(DSTD)
# Clean process files
clean:
	rm -f pankyll.log pankyll.rsync
# The make the sub-module clean: WARNING changes will be lost
submoduleclean:
	cd pandoc && git checkout master
	cd content && git checkout master
	cd themes/pankyll-theme-$(THEME) && git checkout master
# Clean build target
realclean: clean publicclean
test:
	@echo "$(DEBUG_PRINT)"
static:
	mkdir -p $@
$(DSTD):
	mkdir -p $@
# Make sure pankyll is in your PATH
build: static $(DSTD)
	@echo "running pankyll - this can take a while (logfile: pankyll.log)"
	@echo $(L)
	pankyll
	@echo $(L)
	@echo "running pankyll - finished"
	@echo $(L)
	sed -i -e 's%=/en_US/index.html%=$(PFX)/$(LOC)/index.html%' $(DSTD)/index.html
	sed -i -e 's%=//en_US/index.html%=/$(LOC)/index.html%' $(DSTD)/index.html
repository-update:
	git pull
submodule-update: submoduleclean
	git submodule update --remote
	git submodule update --init --recursive --jobs $(NPROC)
	cd themes/pankyll-theme-$(THEME) && git submodule update --remote
	cd themes/pankyll-theme-$(THEME) && git submodule update --init --recursive --jobs $(NPROC)
submodule-pull: submoduleclean
	cd pandoc && git pull
	cd content && git pull
	cd themes/pankyll-theme-$(THEME) && git pull
update: submoduleclean submodule-update submodule-pull repository-update
server: $(DSTD)
	@if [ "$(PFX)" = "/" ]; then \
	    echo "$(L)\nhttp://localhost:$(PORT)\nhttp://${HOST}:$(PORT)\n$(L)"; \
	else \
	    echo "$(L)\nhttp://localhost:$(PORT)/$(PFXDIR)\nhttp://${HOST}:$(PORT)/$(PFXDIR)\n$(L)"; \
	fi
	@if [ "$(PFX)" = "/" ]; then \
	    cd $(DSTD) && python3 -m http.server $(PORT);\
	else \
	    if [ -d /tmp/$(NS) ]; then rm -rf /tmp/$(NS) ]; fi; \
	    mkdir -p /tmp/$(NS)/$(WDIR);\
	    cp -a public/* /tmp/$(NS)/$(WDIR);\
	    cd /tmp/$(NS)/$(DSTD) && python3 -m http.server $(PORT);\
	fi
all: submodule-update submoduleclean submodule-pull realclean build server
linkcheck-local:
	@echo "Check local links via $(LINKCHECK_SERVER), will report broken links"
	linkchecker $(LINKCHECK_PARAMS)
	@echo "Links PASS"
linkcheck-extern:
	@echo "Check local and remote links via $(LINKCHECK_SERVER), will report broken links"
	linkchecker --check-extern $(LINKCHECK_PARAMS)
	@echo "Links PASS"
