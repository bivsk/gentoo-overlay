# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10..13})
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python types for type hinting commonly used by ethereum types."

HOMEPAGE="https://github.com/ethereum/eth-typing"
SRC_URI="https://files.pythonhosted.org/packages/source/${PN::1}/${PN}/${PN//-/_}-${PV}.tar.gz"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="docs test"

S="${WORKDIR}/${PN//-/_}-${PV}"

RESTRICT="test"

DEPENDENCIES="
	dev-python/typing-extensions
	docs? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-autobuild[${PYTHON_USEDEP}] )
	docs? ( dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}] )
	docs? ( dev-python/towncrier[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
	test? ( dev-python/pytest-xdist[${PYTHON_USEDEP}] )
"
RDEPEND="${DEPENDENCIES}"
BDEPEND="${DEPENDENCIES}"
