# Created by: Michael Johnson <ahze@FreeBSD.org>
# $FreeBSD$

PORTNAME=	wxsvg
PORTVERSION=	1.2.1
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	danilo@FreeBSD.org
COMMENT=	C++ library to create, manipulate, and render SVG files

LICENSE=	LGPL21 # (or later)

LIB_DEPENDS=	libavcodec.so:${PORTSDIR}/multimedia/ffmpeg \
		libexpat.so:${PORTSDIR}/textproc/expat2

USE_BZIP2=	yes
USES=		gmake pathfix pkgconfig
USE_WX=		yes
WX_CONF_ARGS=	absolute
USE_GNOME=	cairo
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	LIBAV_CFLAGS="${LIBAV_CFLAGS}" LIBAV_LIBS="${LIBAV_LIBS}"
MAKE_ENV=	AM_CPPFLAGS="${LIBAV_CFLAGS}"
USE_LDCONFIG=	yes

post-extract:
.for i in configure install-sh
	@${CHMOD} ${BINMODE} ${WRKSRC}/${i}
.endfor

.include <bsd.port.mk>
