# Created by: Florent Thoumie <flz@xbsd.org>
# $FreeBSD$

PORTNAME=	icoconvert
PORTVERSION=	2.0
PORTREVISION=	6
CATEGORIES=	graphics
MASTER_SITES=	http://www.mox.net/downloads/ \
		http://www.xunix.org/~flz/distfiles/

MAINTAINER=	flz@FreeBSD.org
COMMENT=	A small utility to convert Windows icon files into .xpm and .png files

LIB_DEPENDS=	gd:${PORTSDIR}/graphics/gd

PLIST_FILES=	bin/icoconvert

NO_STAGE=	yes
post-patch:
	@${REINPLACE_CMD} -e 's|^icoconvert|all|' -e 's|^\(FLAGS=\)|\1-I${LOCALBASE}/include |' \
		-e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/icoconvert ${PREFIX}/bin

.include <bsd.port.mk>
