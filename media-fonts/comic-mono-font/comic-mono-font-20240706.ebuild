# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="The very typeface you’ve been trained to recognize since childhood."
HOMEPAGE="https://github.com/dtinth/comic-mono-font/"
SRC_URI="
	https://github.com/dtinth/comic-mono-font/archive/refs/heads/master.zip -> ${P}.zip
"

S="${WORKDIR}/comic-mono-font-master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~ppc64 ~riscv ~x86"
IUSE="+otf ttf"

REQUIRED_USE="|| ( otf ttf )"

BDEPEND="app-arch/unzip"

RESTRICT="binchecks strip"

src_install() {
	use otf && FONT_SUFFIX="otf" font_src_install
	use ttf && FONT_SUFFIX="ttf" font_src_install
}
