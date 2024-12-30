# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{10..13} python3_13t pypy3)

inherit distutils-r1 pypi

DESCRIPTION="A JavaScript / TypeScript / Python / C# / PHP cryptocurrency trading library"
HOMEPAGE="
	https://ccxt.com/
	https://pypi.org/project/ccxt/
"

src_prepare() {
	eapply_user

	# pypi packages README.rst, instead of README.md
	sed -i 's/README.md/README.rst/' setup.py || die
}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
