# Created by: David O'Brien (obrien@FreeBSD.org)
# $FreeBSD$

PORTNAME=	agrep
PORTVERSION=	2.04
PORTREVISION=	2
CATEGORIES=	textproc
MASTER_SITES=	ftp://ftp.cs.arizona.edu/agrep/
EXTRACT_SUFX=	.tar.Z
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} agrep.ps.1.Z agrep.ps.2.Z
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	dinoex@FreeBSD.org
COMMENT=	Approximate grep (fast approximate pattern-matching tool)

NO_CDROM=	No redistribution for profit

ALL_TARGET=
MAKE_ARGS=	CFLAGS="${CFLAGS}"
PLIST_FILES=	bin/agrep man/man1/agrep.1.gz
PORTDOCS=	COPYRIGHT agrep.algorithms agrep.ps.1.Z agrep.ps.2.Z

.include <bsd.port.options.mk>

post-extract:
	${CP} ${DISTDIR}/agrep.ps.1.Z ${DISTDIR}/agrep.ps.2.Z ${WRKSRC}/

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/agrep ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/agrep.1 ${STAGEDIR}${MANPREFIX}/man/man1/
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR}/
.endif

.include <bsd.port.mk>
