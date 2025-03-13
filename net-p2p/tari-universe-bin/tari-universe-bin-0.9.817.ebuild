# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop rpm

DESCRIPTION="Beautifully simple mining app for Tari"
HOMEPAGE="
	https://universe.tari.com
	https://tari.com
"
SRC_URI="https://github.com/tari-project/universe/releases/download/v${PV}/Tari.Universe-${PV}-1.x86_64.rpm"

S="${WORKDIR}"

LICENSE="TariLabs"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="strip"

RDEPEND="
	net-libs/webkit-gtk:4.1
"

src_install() {
	domenu usr/share/applications/Tari\ Universe.desktop
	for size in {32,128,512}; do
		doicon -s ${size} usr/share/icons/hicolor/${size}x${size}/apps/Tari\ Universe.png
	done

	dobin usr/bin/Tari\ Universe

}
