# Created by: John Hay
# $FreeBSD$

PORTNAME=	gpsmanshp
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	graphics tcl geography
MASTER_SITES=	http://www.ncc.up.pt/gpsmanshp/
DISTNAME=	${PORTNAME}_${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	jhay@FreeBSD.org
COMMENT=	Shapelib support for gpsman

RUN_DEPENDS=	gpsman:${PORTSDIR}/astro/gpsman
LIB_DEPENDS=	shp.1:${PORTSDIR}/devel/shapelib \
		tcl${TCLVERSION:S/.//}:${PORTSDIR}/lang/tcl${TCLVERSION:S/.//}

TCLVERSION?=	8.4
PLIST_SUB=	TCLVERSION=${TCLVERSION} PORTVERSION=${PORTVERSION}

NO_STAGE=	yes
post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/doc/* ${DOCSDIR}
.endif

.include <bsd.port.mk>
