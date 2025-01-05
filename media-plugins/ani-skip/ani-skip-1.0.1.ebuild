# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Automatically skip anime opening and ending sequences"
HOMEPAGE="https://github.com/synacktraa/ani-skip"
SRC_URI="
	https://github.com/synacktraa/ani-skip/archive/${PV}.tar.gz
		-> ${P}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	app-shells/fzf
	media-video/mpv
	net-misc/curl
"
DEPEND=""
BDEPEND=""

src_install() {
	exeinto /usr/bin
	doexe ./ani-skip

	insinto /usr/share/${PN}/lua
	doins skip.lua
}

pkg_postinst() {
	elog "You will need to enable the mpv plugin for your user"
	elog "by copying the script to your mpv config directory."
	elog "cp /usr/share/ani-skip/lua/skip.lua ~/.config/mpv/scripts"
}
