# Created by: samm
# $FreeBSD$

PORTNAME=	cuneiform
PORTVERSION=	1.1.0
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://launchpadlibrarian.net/69906918/
DISTNAME=	${PORTNAME}-linux-${PORTVERSION}

MAINTAINER=	samm@os2.kiev.ua
COMMENT=	OCR system developed and open sourced by Cognitive technologies

LICENSE=	BSD
LICENSE_FILE=	${WRKSRC}/cuneiform_src/Kern/license.txt

ONLY_FOR_ARCHS=	i386 amd64

USE_BZIP2=	yes
USES=		cmake:outsource
USE_LDCONFIG=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
CFLAGS+=	-I${LOCALBASE}/include

OPTIONS_DEFINE=	IMAGEMAGICK

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MIMAGEMAGICK}
LIB_DEPENDS+=	libMagickWand.so:${PORTSDIR}/graphics/ImageMagick
.endif

post-patch:
	${MV} ${WRKSRC}/cuneiform_src/Kern/hhh/tigerh/h/strings.h \
		${WRKSRC}/cuneiform_src/Kern/hhh/tigerh/h/cf_strings.h
	@${REINPLACE_CMD} -e 's:\[(uchar):\[(uchar)L:' \
		${WRKSRC}/cuneiform_src/Kern/leo/src/leo_dll.c
.if ! ${PORT_OPTIONS:MIMAGEMAGICK}
	@${REINPLACE_CMD} -e '/pkg_check_modules.*ImageMagick/ d' \
		${WRKSRC}/cuneiform_src/Kern/CMakeLists.txt
.endif

.include <bsd.port.mk>
