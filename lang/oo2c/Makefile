# Created by: Oliver Breuninger <ob@seicom.NET>
# $FreeBSD$

PORTNAME=	oo2c
PORTVERSION=	2.1.11
CATEGORIES=	lang
MASTER_SITES=	SF/ooc/ooc2/${PORTVERSION}
DISTNAME=	${PORTNAME}_${BITS}-${PORTVERSION}

MAINTAINER=	johans@FreeBSD.org
COMMENT=	Optimizing Oberon-2 compiler of University of Kaiserslautern, Germany

BUILD_DEPENDS=	xsltproc:${PORTSDIR}/textproc/libxslt
LIB_DEPENDS=	libgc.so:${PORTSDIR}/devel/boehm-gc

DOCSDIR=	lib/${PORTNAME}
USES=		gmake
USE_BZIP2=	yes
USE_AUTOTOOLS=	libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

ONLY_FOR_ARCHS=	i386 amd64 ia64

.include <bsd.port.pre.mk>

.if ${ARCH} == i386
BITS=		32
.else
BITS=		64
.endif

.include <bsd.port.post.mk>
