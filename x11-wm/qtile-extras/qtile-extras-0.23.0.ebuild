# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="elParaguayo's Qtile extras"
HOMEPAGE="https://github.com/elParaguayo/qtile-extras"
SRC_URI="
	https://github.com/elParaguayo/qtile-extras/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="=x11-wm/qtile-0.23.0"
RDEPEND="${DEPEND}"
BDEPEND=""
