# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(pypy3 python3_{8..13})

inherit distutils-r1

DESCRIPTION="Plugin for adding to the PYTHONPATH from command line or configs"
HOMEPAGE="https://github.com/bigsassy/pytest-pythonpath"
SRC_URI="https://files.pythonhosted.org/packages/source/${PN::1}/${PN}/${PN}-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/pytest[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
