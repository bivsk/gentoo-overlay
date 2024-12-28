# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=(python3_10)

inherit distutils-r1

DESCRIPTION="SDK for Hyperliquid API trading with Python"
HOMEPAGE="
	https://github.com/hyperliquid-dex/hyperliquid-python-sdk
	https://hyperliquid.xyz
"
SRC_URI="
	https://github.com/hyperliquid-dex/hyperliquid-python-sdk/archive/${PV}.tar.gz
			-> ${P}.gh.tar.gz
"
S="${WORKDIR}/hyperliquid-python-sdk-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
