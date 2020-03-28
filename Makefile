# +---------------------------------------------------------------------------+
# | Makefile                                                                  |
# |                                                                           |
# | Pankyll-Theme-Newspaper-Example                                           |
# |                                                                           |
# | Version: 0.1.0 (change inline)                                            |
# |                                                                           |
# | Changes:                                                                  |
# |                                                                           |
# | 0.1.0 2020-03-17 Christian Külker <c@c8i.org>                             |
# |     - initial release                                                     |
# |                                                                           |
# +---------------------------------------------------------------------------+
#
# Makefile version
VERSION=0.1.0
# -----------------------------------------------------------------------------
# NO CHANGES BEYOND THIS POINT
ifndef VERSION
$(error VERSION is NOT defined)
endif
DSTD=public
NPROC=$(shell nproc)
DEBUG_PRINT='1[$@]2[$%]3[$<]4[$?]5[$^]6[$+]7[$|]8[$*]9[$(@D)]10[$(@F)]11[$(*D)]\n12[$(*F)]13[$(%D)]14[$(%F)]15[$(<D)]16[$(<F)]17[$(^D)]18[$(^F)]\n19[$(+D)]20[$(+F)]21[$(?D)]22[$(?F)]\n'
L:=============================================================================
.PHONY: build clean htmlclean info markdownclean pdfclean realclean server \
        submodule-update test usage
usage:
	@echo "$(L)"
	@echo "USAGE:"
	@echo "$(L)"
	@echo "make usage            : this information"
	@echo "make info             : print more info"
	@echo "make clean            : remove porcess files (non so far)"
	@echo "make realclean        : remove target"
	@echo "make markdownclean    : remove all *.md from target (debug)"
	@echo "make htmlclean        : remove all *.html from target (debug)"
	@echo "make pdfclean         : remove all *.pdf from target (debug)"
	@echo "make submodule-update : update git sub-modules"
	@echo "make build            : build project"
	@echo "make server           : start a development server on port 8000"
info:
	@echo "VERSION: [$(VERSION)]"
	@echo "DSTD   : [$(DSTD)]"
	@echo "NPROC  : [$(NPROC)]"
	git submodule status --recursive
# for development (might remove too much or too less files for a clean build)
markdownclean:
	find $(DSTD) -name "*.md"|xargs -d '\n' rm -f
# for development (might remove too much or too less files for a clean build)
htmlclean:
	find $(DSTD) -name "*.html"|xargs -d '\n' rm -f
# for development (might remove too much or too less files for a clean build)
pdfclean:
	find $(DSTD) -name "*.pdf"|xargs -d '\n' rm -f
# clean process files (non so far)
clean:
# clean build target
realclean: clean
	rm -rf $(DSTD)
test:
	@echo "$(DEBUG_PRINT)"
static:
	mkdir -p $@
$(DSTD):
	mkdir -p $@
# make sure pankyll is in your PATH
build: static $(DSTD)
	pankyll
repository-update:
	git pull
submodule-update:
	git submodule update --remote
	git submodule update --init --recursive --jobs $(NPROC)
	cd themes/pankyll-theme-newspaper && git submodule update --remote
	cd themes/pankyll-theme-newspaper && git submodule update --init --recursive --jobs $(NPROC)
server:
	cd public && python3 -m http.server


