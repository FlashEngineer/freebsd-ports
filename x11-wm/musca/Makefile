# Created by: Dennis Herrmann <dhn@FreeBSD.org>
# $FreeBSD$

PORTNAME=	musca
PORTVERSION=	0.9.24
CATEGORIES=	x11-wm
MASTER_SITES=	http://aerosuidae.net/ \
		http://mirror.mcx2.org/
EXTRACT_SUFX=	.tgz

MAINTAINER=	dhn@FreeBSD.org
COMMENT=	A simple window manager for X, with features from ratpoison and dwm

RUN_DEPENDS=	dmenu:${PORTSDIR}/x11/dmenu

USE_XORG=	x11
MAKE_ARGS=	CFLAGS="-I${LOCALBASE}/include \
		-L${LOCALBASE}/lib"

PLIST_FILES=	bin/musca
MAN1=	musca.1

NO_STAGE=	yes
pre-everything::
	@${ECHO_MSG} "You can build musca with your own config.h using the MUSCA_CONF knob:"
	@${ECHO_MSG} "make MUSCA_CONF=/path/to/musca/config.h install clean"

post-extract:
.if defined(MUSCA_CONF)
	@${ECHO_MSG} "creating config.h from ${MUSCA_CONF}"
	@${CP} ${MUSCA_CONF} ${WRKSRC}/config.h
.endif

do-install:
	@${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${MANPREFIX}/man/man1

.include <bsd.port.mk>
