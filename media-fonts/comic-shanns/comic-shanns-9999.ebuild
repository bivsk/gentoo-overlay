# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font git-r3

DESCRIPTION="A classy font"
HOMEPAGE="https://github.com/shannpersand/comic-shanns"
EGIT_REPO_URI="https://github.com/shannpersand/comic-shanns"

LICENSE="MIT"
SLOT="0"
IUSE="+otf ttf"

REQUIRED_USE="|| ( otf ttf )"

src_install() {
	if use otf; then
		FONT_S="${S}/v2" FONT_SUFFIX="otf" font_src_install
	fi
	if use ttf; then
		FONT_S="${S}/v2" FONT_SUFFIX="ttf" font_src_install
	fi
}
