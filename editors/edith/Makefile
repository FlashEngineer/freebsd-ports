# Created by: Christian Brueffer <chris@unixpages.org>
# $FreeBSD$

PORTNAME=	edith
PORTVERSION=	1.58
PORTREVISION=	2
CATEGORIES=	editors linux
MASTER_SITES=	http://www.groenink.com/pub/edith/
DISTFILES=	edith1.55.common.tar.gz \
		edith1.58.linux-glibc.tar.gz

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A X11 GUI editor for binary and plain text files

ONLY_FOR_ARCHS=	i386
USE_LINUX=	yes
USE_LINUX_APPS=	xorglibs

RESTRICTED=	Redistribution not allowed
NO_BUILD=	yes

MAN1=		edith.1
MANCOMPRESSED=	no

WRKSRC=		${WRKDIR}/edith
EDITHDIR=	${PREFIX}/lib/edith

NO_STAGE=	yes
do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bin/linux/edith ${PREFIX}/bin
	${MKDIR} ${EDITHDIR}
	${MKDIR} ${EDITHDIR}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/edi* ${EDITHDIR}/bin
.for i in defaults help
	${MKDIR} ${EDITHDIR}/${i}
	${INSTALL_DATA} ${WRKSRC}/${i}/* ${EDITHDIR}/${i}
.endfor
	${INSTALL_MAN} ${WRKSRC}/edith.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
