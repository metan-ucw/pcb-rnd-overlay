# Copyright 2018 Cyril Hrubis
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Fork of gEDA pcb; Printed Circuit Board editor"
HOMEPAGE="http://repo.hu/projects/pcb-rnd/"
SRC_URI="http://repo.hu/projects/pcb-rnd/releases/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk2 gtk2_opengl gtk3 gtk3_opengl +export_png export_jpeg export_gif
+io_tedax +io_autotrax +io_eagle +io_hyp +io_kicad_legacy +io_kicad +io_lihata
+io_mentor_cell +io_pcb"

DEPEND="x11-libs/gtk+:2
	gtk2? ( x11-libs/gtk+:2
		x11-libs/pango )
	gtk2_opengl? ( x11-libs/gtk+:2
		x11-libs/gtkglext )
	gtk3? ( x11-libs/gtk+:3
	        x11-libs/cairo )
	export_gif? ( media-libs/gd )
	export_jpeg? ( media-libs/gd[jpeg] )
	export_png? ( media-libs/gd[png] )
	io_eagle? ( dev-libs/libxml2 )
"
RDEPEND="${DEPEND}"

src_configure() {
	local myconf

	if !(use gtk2); then
		myconf="${myconf} --disable-hid_gtk2_gdk"
	fi

	if !(use gtk2_opengl); then
		myconf="${myconf} --disable-hid_gtk2_gl"
	fi

	if !(use gtk3); then
		myconf="${myconf} --disable-hid_gtk3_cairo"
	fi

	if !(use gtk3_opengl); then
		myconf="${myconf} --disable-hid_gtk3_gl"
	fi

	if !(use io_tedax); then
		myconf="${myconf} --disable-io_tedax"
	fi

	if !(use io_autotrax); then
		myconf="${myconf} --disable-io_autotrax"
	fi

	if !(use io_eagle); then
		myconf="${myconf} --disable-io_eagle"
	fi

	if !(use io_hyp); then
		myconf="${myconf} --disable-io_hyp"
	fi

	if !(use io_kicad_legacy); then
		myconf="${myconf} --disable-io_kicad_legacy"
	fi

	if !(use io_kicad); then
		myconf="${myconf} --disable-io_kicad"
	fi

	if !(use io_lihata); then
		myconf="${myconf} --disable-io_lihata"
	fi

	if !(use io_mentor_cell); then
		myconf="${myconf} --disable-io_mentor_cell"
	fi

	if !(use io_pcb); then
		myconf="${myconf} --disable-io_pcb"
	fi

	if !(use export_gif); then
		myconf="${myconf} --disable-gd-gif"
	fi

	if !(use export_png); then
		myconf="${myconf} --disable-gd-png"
	fi

	if !(use export_jpeg); then
		myconf="${myconf} --disable-gd-jpg"
	fi

	./configure --prefix="" ${myconf}
}

src_compile() {
	emake
}
