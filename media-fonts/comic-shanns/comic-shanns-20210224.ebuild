# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="A classy font"
HOMEPAGE="https://github.com/shannpersand/comic-shanns"
SRC_URI="
	https://github.com/shannpersand/comic-shanns/archive/refs/heads/master.zip -> ${P}.zip
"

S="${WORKDIR}/${PN}-master/v2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="+otf ttf"

REQUIRED_USE="|| ( otf ttf )"

BDEPEND="app-arch/unzip"

src_install() {
	use otf && FONT_SUFFIX="otf" font_src_install
	use ttf && FONT_SUFFIX="ttf" font_src_install
}
