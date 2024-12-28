# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Universal Wayland Session Manager"
HOMEPAGE="https://github.com/Vladimir-csp/uwsm"
SRC_URI="
	https://github.com/Vladimir-csp/uwsm/archive/refs/tags/v${PV}.tar.gz
			-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libnotify menu select uuctl uwsm-app"

RDEPEND="
		libnotify? ( x11-libs/libnotify )
		menu? (
			dev-libs/bemenu
			gui-apps/fuzzel
			gui-apps/rofi-wayland
			gui-apps/tofi
			gui-apps/walker
			gui-apps/wmenu
			gui-apps/wofi
			x11-misc/dmenu
		)
		select? ( dev-libs/newt )
		dev-python/pyxdg
		dev-python/dbus-python
		sys-apps/dbus-broker
"
DEPEND="${RDEPEND}"

src_configure() {
	local myemesonargs=(
		$(meson_feature uuctl uuctl)
		$(meson_feature uwsm-app uwsm-app)
	)
	meson_src_configure
}

pkg_postinst() {
	elog "To properly configure uwsm, ensure that dbus-broker is used as the D-Bus daemon."
	elog "Consider running 'uwsm finalize' with the necessary environment variables after starting your compositor."
}
