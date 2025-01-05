# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A classy font"
HOMEPAGE="https://github.com/shannpersand/comic-shanns"
KEYWORDS="amd64 arm arm64 x86"
SRC_URI="
	https://github.com/shannpersand/comic-shanns/archive/refs/heads/master.zip -> ${P}.zip
"

LICENSE="MIT"
SLOT="0"
IUSE="+otf ttf"

REQUIRED_USE="|| ( otf ttf )"

S="${WORKDIR}/${PN}-master/v2"

src_install() {
	if use otf; then
		FONT_SUFFIX="otf" font_src_install
	fi
	if use ttf; then
		FONT_SUFFIX="ttf" font_src_install
	fi
}
