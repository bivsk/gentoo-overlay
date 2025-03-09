# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10..13})
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Ethereum ABI utilities for python"

HOMEPAGE="https://github.com/ethereum/eth-abi"
SRC_URI="https://files.pythonhosted.org/packages/source/${PN::1}/${PN}/${PN//-/_}-${PV}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test tools"

S="${WORKDIR}/${PN//-/_}-${PV}"

RESTRICT="test"

DEPENDENCIES="
	dev-python/eth-utils[${PYTHON_USEDEP}]
	dev-python/eth-typing[${PYTHON_USEDEP}]
	dev-python/parsimonious[${PYTHON_USEDEP}]
	dev-python/toolz[${PYTHON_USEDEP}]
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/towncrier[${PYTHON_USEDEP}] )
	test? ( dev-python/eth-hash[${PYTHON_USEDEP}] )
	test? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-pythonpath[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-timeout[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
	tools? ( dev-python/hypothesis[${PYTHON_USEDEP}] )
"
RDEPEND="${DEPENDENCIES}"
BDEPEND="${DEPENDENCIES}"
