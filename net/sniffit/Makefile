# Created by: bsdx
# $FreeBSD$

PORTNAME=	sniffit
PORTVERSION=	0.3.7b
PORTREVISION=	4
CATEGORIES=	net security
MASTER_SITES=	http://www.mavetju.org/download/adopted/
DISTNAME=	sniffit.0.3.7.beta

PATCH_SITES=	${MASTER_SITE_DEBIAN_POOL} \
		http://www.mavetju.org/download/adopted/:patches
PATCHFILES=	sniffit_0.3.7.beta-10.diff.gz:patches
PATCH_DIST_STRIP=	-p1

MAINTAINER=	edwin@mavetju.org
COMMENT=	A packet sniffer program. For educational use

GNU_CONFIGURE=	yes
ALL_TARGET=
MAN5=		sniffit.5
MAN8=		sniffit.8

NO_STAGE=	yes
do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/sniffit ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/sniffit.5 ${PREFIX}/man/man5
	${INSTALL_MAN} ${WRKSRC}/sniffit.8 ${PREFIX}/man/man8
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/sniffit
	${INSTALL_MAN} ${WRKSRC}/README.FIRST ${PREFIX}/share/doc/sniffit
.endif

.include <bsd.port.mk>
