# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10..13})
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="The Ethereum hashing function, keccak256."

HOMEPAGE="https://github.com/ethereum/eth-utils"
SRC_URI="https://files.pythonhosted.org/packages/source/${PN::1}/${PN}/${PN//-/_}-${PV}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs +pycryptodome test"

S="${WORKDIR}/${PN//-/_}-${PV}"

RESTRICT="test"

DEPENDENCIES="
	dev-python/eth-hash[${PYTHON_USEDEP}]
	dev-python/eth-typing[${PYTHON_USEDEP}]
	dev-python/cytoolz[${PYTHON_USEDEP}]
	dev-python/toolz[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/towncrier[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	pycryptodome? ( <dev-python/pycryptodome-4.0[${PYTHON_USEDEP}] )
"
RDEPEND="${DEPENDENCIES}"
BDEPEND="${DEPENDENCIES}"
