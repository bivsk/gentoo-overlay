# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_PN=${PN/-bin/}
MY_PN_BIN=${PN/-bin/d}
inherit eutils gnome2-utils unpacker

DESCRIPTION="Simple, low-latency game streaming"
HOMEPAGE="https://parsecgaming.com/"
SRC_URI="https://builds.parsec.app/package/parsec-linux.deb -> ${P}.deb"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	sys-libs/glibc
	sys-devel/gcc[cxx]
	media-libs/alsa-lib
	media-libs/mesa
	media-video/ffmpeg
	dev-libs/openssl
	virtual/libudev
	x11-libs/libX11
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libXrandr
"

S=${WORKDIR}

RESTRICT="mirror bindist"

QA_PREBUILT="
	opt/parsec/bin/parsecd
	opt/parsec/share/${MY_PN}/skel/parsecd-${PV/\./-}.so
"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	insinto /opt/${MY_PN}
	doins -r usr/.

	fperms +x /opt/${MY_PN}/bin/${MY_PN_BIN}
	dosym /opt/${MY_PN}/bin/${MY_PN_BIN} /usr/bin/${MY_PN_BIN}
	dosym /opt/${MY_PN}/share/applications/${MY_PN}.desktop \
		/usr/share/applications/${MY_PN}.desktop
	dosym /opt/${MY_PN}/share/icons/hicolor/256x256/apps/${MY_PN}.png \
		/usr/share/icons/hicolor/256x256/apps/${MY_PN}.png
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
