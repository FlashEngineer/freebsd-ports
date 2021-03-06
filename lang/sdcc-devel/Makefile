# $FreeBSD$

PORTNAME=	sdcc
PORTVERSION=	3.3.2.2013.12.30
CATEGORIES=	lang
MASTER_SITES=	SF/sdcc/snapshot_builds/sdcc-src/ \
		http://tijl.fastmail.fm/mirror/
PKGNAMESUFFIX=	-devel
DISTNAME=	${PORTNAME}-src-20131230-8930

MAINTAINER=	tijl@FreeBSD.org
COMMENT=	Small Device C Compiler

LICENSE=	GPLv3

BUILD_DEPENDS=	${LOCALBASE}/include/boost/graph/adjacency_list.hpp:${PORTSDIR}/devel/boost-libs

CONFLICTS_INSTALL=	sdcc-[0-9]*
DESCR=		${PORTSDIR}/lang/sdcc/pkg-descr
GNU_CONFIGURE=	yes
USES=		gmake
USE_BZIP2=	yes

OPTIONS_DEFINE= 	DEVLIB DOCS UCSIM
OPTIONS_MULTI=		TARGETS
OPTIONS_MULTI_TARGETS=	HC08 MCS51 PIC STM8 Z80
OPTIONS_DEFAULT=	DEVLIB UCSIM HC08 MCS51 PIC STM8 Z80
DEVLIB_DESC=	Device libraries
HC08_DESC=	Freescale 68HC08/S08
MCS51_DESC=	Intel MCS51, Maxim DS80C390/DS80C400
PIC_DESC=	Microchip PIC
UCSIM_DESC=	The ucSim simulator
STM8_DESC=	STMicroelectronics STM8
Z80_DESC=	Zilog Z80/Z180/GBZ80, Rabbit 2000/3000, Toshiba TLCS-90

CPPFLAGS+=	-idirafter ${LOCALBASE}/include
CONFIGURE_ARGS= --disable-avr --disable-install-libbfd --disable-werror \
		--disable-st7 docdir=${DOCSDIR}
CONFIGURE_ENV=	ARCH=""
PORTDATA=	*
PORTDOCS=	*
WRKSRC= 	${WRKDIR}/sdcc

OPTIONS_SUB=		yes
DEVLIB_CONFIGURE_OFF=	--disable-device-lib
HC08_CONFIGURE_OFF=	--disable-hc08 --disable-hc08-port		\
			--disable-s08-port
MCS51_CONFIGURE_OFF=	--disable-51 --disable-mcs51-port		\
			--disable-ds390-port --disable-ds400-port
PIC_BUILD_DEPENDS=	gputils>=1.2.0:${PORTSDIR}/devel/gputils
PIC_RUN_DEPENDS=	gpasm:${PORTSDIR}/devel/gputils
PIC_CONFIGURE_OFF=	--disable-pic14-port --disable-pic16-port
STM8_CONFIGURE_OFF=	--disable-stm8 --disable-stm8-port
UCSIM_CONFIGURE_OFF=	--disable-ucsim
Z80_CONFIGURE_OFF=	--disable-z80 --disable-z80-port		\
			--disable-z180-port --disable-gbz80-port	\
			--disable-r2k-port --disable-r3ka-port		\
			--disable-tlcs90-port

.include <bsd.port.options.mk>

.if ${ARCH} == "amd64"
CONFIGURE_TARGET=	x86_64-portbld-freebsd${OSREL}
.endif

post-patch:
	@${REINPLACE_CMD} '/install:/s/:.*/:/' \
		${WRKSRC}/Makefile.in \
		${WRKSRC}/support/sdbinutils/libiberty/Makefile.in
.if ! ${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} 's, [a-z-]*doc,,' \
		${WRKSRC}/Makefile.in \
		${WRKSRC}/sim/ucsim/packages_in.mk
.endif

post-install:
	${FIND} -d ${STAGEDIR}${DATADIR} -type d -empty -delete

.include <bsd.port.mk>
