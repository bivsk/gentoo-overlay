# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="Asyncio frontend for pulsectl, a Python bindings library for PulseAudio (libpulse)"
HOMEPAGE="
	https://github.com/mhthies/pulsectl-asyncio
	https://pypi.org/project/pulsectl-asyncio/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	~dev-python/pulsectl-23.5.2
"

distutils_enable_tests pytest
