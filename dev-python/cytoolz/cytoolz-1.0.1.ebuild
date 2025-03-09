# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10..13})
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1

inherit distutils-r1

DESCRIPTION="Cython implementation of Toolz: High performance functional utilities"

HOMEPAGE="https://github.com/pytoolz/cytoolz"
SRC_URI="https://files.pythonhosted.org/packages/source/${PN::1}/${PN}/${PN}-${PV}.tar.gz"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cython"

DEPENDENCIES="
	dev-python/toolz[${PYTHON_USEDEP}]
	cython? ( dev-python/cython[${PYTHON_USEDEP}] )
"
RDEPEND="${DEPENDENCIES}"
BDEPEND="${DEPENDENCIES}"

distutils_enable_tests pytest
