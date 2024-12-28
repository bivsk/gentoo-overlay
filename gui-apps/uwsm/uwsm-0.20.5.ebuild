# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 meson

DESCRIPTION="Universal Wayland Session Manager"
HOMEPAGE="https://github.com/Vladimir-csp/uwsm"
SRC_URI="
	https://github.com/Vladimir-csp/uwsm/archive/v${PV}.tar.gz
			-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
		dev-python/pyxdg
		dev-python/dbus-python
		sys-apps/dbus-broker
"
DEPEND="${RDEPEND}"

# src_configure() {
# 	meson_src_configure
# }