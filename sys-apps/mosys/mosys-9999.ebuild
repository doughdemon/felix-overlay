# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit flag-o-matic git-r3 toolchain-funcs

DESCRIPTION="The multifunction open system tool"

HOMEPAGE="https://chromium.googlesource.com/chromiumos/platform/mosys"
SRC_URI=""
EGIT_REPO_URI="https://chromium.googlesource.com/chromiumos/platform/mosys"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""

RDEPEND="sys-libs/flashmap"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

PATCHES=("${FILESDIR}/${PN}-musl.patch"
	"${FILESDIR}/${PN}-pkgconfig.patch")

src_configure() {
	emake ARCH=$(tc-arch) defconfig
}

src_compile() {
	emake CC="$(tc-getCC)" LD="$(tc-getLD)" LDFLAGS="$(raw-ldflags)" AR="$(tc-getAR)"
}

src_install() {
	dosbin mosys
}
