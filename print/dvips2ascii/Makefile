# Created by: eserte@cs.tu-berlin.de
# $FreeBSD$

PORTNAME=	dvips2ascii
PORTVERSION=	1.3
CATEGORIES=	print
MASTER_SITES=	SF/srezic/${PORTNAME}/${PORTVERSION}

MAINTAINER=	slaven@rezic.de
COMMENT=	PostScript (created by dvips) to ASCII converter

PLIST_FILES=	bin/dvips2ascii

NO_STAGE=	yes
do-build:
	${MV} ${WRKSRC}/dvips2ascii ${WRKSRC}/dvips2ascii.orig
	${SED} -e 's;#!.*perl;#!${PERL};' \
	    < ${WRKSRC}/dvips2ascii.orig > ${WRKSRC}/dvips2ascii

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/dvips2ascii ${PREFIX}/bin

.include <bsd.port.mk>
