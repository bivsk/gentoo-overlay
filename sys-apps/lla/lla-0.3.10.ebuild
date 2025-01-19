# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler2@2.0.0
	aho-corasick@1.1.3
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anyhow@1.0.94
	arboard@3.4.1
	arrayvec@0.5.2
	atty@0.2.14
	autocfg@1.4.0
	base64@0.21.7
	base64@0.22.1
	bincode@1.3.3
	bitflags@1.3.2
	bitflags@2.6.0
	block-buffer@0.10.4
	block2@0.5.1
	bstr@1.6.2
	bumpalo@3.16.0
	bytemuck@1.21.0
	byteorder-lite@0.1.0
	bytes@1.9.0
	cc@1.2.1
	cfg-if@1.0.0
	chrono@0.4.38
	clap@3.2.25
	clap_complete@3.2.5
	clap_lex@0.2.4
	clipboard-win@5.4.0
	colored@2.1.0
	console@0.15.8
	core-foundation@0.9.4
	core-foundation-sys@0.8.7
	core-graphics@0.23.2
	core-graphics-types@0.1.3
	cpufeatures@0.2.16
	crc32fast@1.4.2
	crossbeam-channel@0.5.14
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.20
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	crypto-common@0.1.6
	dashmap@5.5.3
	deranged@0.3.11
	dialoguer@0.11.0
	digest@0.10.7
	dirs@5.0.1
	dirs-sys@0.4.1
	either@1.13.0
	encode_unicode@0.3.6
	equivalent@1.0.1
	errno@0.3.9
	error-code@3.3.1
	fastrand@2.2.0
	fdeflate@0.3.7
	fixedbitset@0.4.2
	flate2@1.0.35
	fnv@1.0.7
	foreign-types@0.5.0
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	fuzzy-matcher@0.3.7
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.15
	glob@0.3.1
	globset@0.4.15
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashbrown@0.15.2
	heck@0.5.0
	hermit-abi@0.1.19
	hermit-abi@0.3.9
	iana-time-zone@0.1.61
	iana-time-zone-haiku@0.1.2
	ignore@0.4.23
	image@0.25.5
	indexmap@1.9.3
	indexmap@2.6.0
	indicatif@0.17.9
	itertools@0.12.1
	itoa@1.0.14
	jpeg-decoder@0.3.1
	js-sys@0.3.72
	lazy_static@1.5.0
	libc@0.2.166
	libloading@0.8.5
	libredox@0.1.3
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.14
	lla_plugin_interface@${PV}
	lla_plugin_utils@${PV}
	lock_api@0.4.12
	log@0.4.22
	memchr@2.7.4
	miniz_oxide@0.8.2
	mio@0.8.11
	multimap@0.10.0
	num-conv@0.1.0
	num-traits@0.2.19
	num_cpus@1.16.0
	number_prefix@0.4.0
	objc-sys@0.3.5
	objc2@0.5.2
	objc2-app-kit@0.2.2
	objc2-core-data@0.2.2
	objc2-core-image@0.2.2
	objc2-encode@4.0.3
	objc2-foundation@0.2.2
	objc2-metal@0.2.2
	objc2-quartz-core@0.2.2
	once_cell@1.20.2
	onig@6.4.0
	onig_sys@69.8.1
	option-ext@0.2.0
	os_str_bytes@6.6.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	petgraph@0.6.5
	pkg-config@0.3.31
	plist@1.7.0
	png@0.17.16
	portable-atomic@1.10.0
	powerfmt@0.2.0
	prettyplease@0.2.25
	proc-macro2@1.0.92
	prost@0.12.6
	prost-build@0.12.6
	prost-derive@0.12.6
	prost-types@0.12.6
	quick-xml@0.32.0
	quote@1.0.37
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.5.7
	redox_users@0.4.6
	regex@1.11.1
	regex-automata@0.4.9
	regex-syntax@0.8.5
	ring@0.17.8
	rustix@0.38.41
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	serde@1.0.215
	serde_derive@1.0.215
	serde_json@1.0.133
	serde_spanned@0.6.8
	sha1@0.10.6
	sha2@0.10.8
	shell-words@1.1.0
	shlex@1.3.0
	signal-hook@0.3.17
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	simd-adler32@0.3.7
	smallvec@1.13.2
	spin@0.9.8
	strip-ansi-escapes@0.1.1
	strip-ansi-escapes@0.2.0
	strsim@0.10.0
	syn@2.0.89
	syntect@5.2.0
	tempfile@3.14.0
	termcolor@1.4.1
	terminal_size@0.4.1
	textwrap@0.16.1
	thiserror-impl@1.0.69
	thiserror@1.0.69
	thread_local@1.1.8
	tiff@0.9.1
	time@0.3.37
	time-core@0.1.2
	time-macros@0.2.19
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.22
	typenum@1.17.0
	unicode-ident@1.0.14
	unicode-normalization@0.1.24
	unicode-width@0.1.14
	unicode-width@0.2.0
	untrusted@0.9.0
	users@0.11.0
	utf8parse@0.2.2
	uuid@1.11.0
	version_check@0.9.5
	vte@0.10.1
	vte@0.11.1
	vte_generate_state_changes@0.1.2
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.95
	wasm-bindgen-macro-support@0.2.95
	wasm-bindgen-macro@0.2.95
	wasm-bindgen-shared@0.2.95
	wasm-bindgen@0.2.95
	web-time@1.1.0
	weezl@0.1.8
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.6.20
	x11rb@0.13.1
	x11rb-protocol@0.13.1
	yaml-rust@0.4.5
	zeroize@1.8.1
"

inherit cargo

DESCRIPTION="Blazing Fast and highly customizable ls Replacement with Superpowers"
HOMEPAGE="https://lla.chaqchase.com"
SRC_URI="
	https://github.com/chaqchase/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	ISC MIT MPL-2.0 Unicode-DFS-2016
	|| ( Apache-2.0 Boost-1.0 )
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+plugins"

DEPEND="
	dev-libs/oniguruma:=
"
BDEPEND="virtual/pkgconfig"

src_setup() {
	export PKG_CONFIG_ALLOW_CROSS=1
	export RUSTONIG_SYSTEM_LIBONIG=1
	rust_pkg_setup
}

src_install() {
	cargo_src_install --path ./lla

	dodoc README.md

	# TODO: do all arch's use .so ?
	local releasedir=$(cargo_target_dir)
	insinto /usr/share/lla/plugins
	use plugins && doins ${releasedir}/*.so

}

pkg_postinst() {
	elog "Plugins are installed in /usr/share/lla/plugins"
	elog "Copy these plugins to ~/.config/lla/plugins"
	elog "This may be necessary after each upgrade to lla"
}
