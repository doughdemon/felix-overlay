# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="Utility for manipulating firmware ROM mapping data structure"

HOMEPAGE="https://github.com/dhendrix/flashmap"
SRC_URI=""
EGIT_REPO_URI="https://github.com/dhendrix/flashmap"

LICENSE="BSD GPL-2"
SLOT="0"
KEYWORDS=""

src_prepare() {
	sed -i 's/-Werror //' Makefile || die
	default
}

src_configure() {
	true
}
