# Created by: David O'Brien (obrien@cs.ucdavis.edu)
# $FreeBSD$

PORTNAME=	vnlpr
PORTVERSION=	2.0
CATEGORIES=	vietnamese print
MASTER_SITES=	ftp://ftp.monash.edu.au/pub/vietnam/unix/
DISTNAME=	${PORTNAME}
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	obrien@FreeBSD.org
COMMENT=	Shell script and set of fonts to print Vietnamese text on PostScript printer

RUN_DEPENDS=	vn7to8:${PORTSDIR}/vietnamese/vn7to8 \
		vnpstext:${PORTSDIR}/vietnamese/vnpstext

NO_STAGE=	yes
pre-patch:
	@${MV} ${WRKSRC}/vnlpr ${WRKSRC}/vnlpr.in

do-build:
	${SED} -e "s:^set VNLIB=./:set VNLIB=${PREFIX}/share/vn-fonts:"  \
	    -e 's/^set PRINTER="barrons"/#set PRINTER="postscript"/'  \
		${WRKSRC}/vnlpr.in > ${WRKSRC}/vnlpr

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/vnlpr ${PREFIX}/bin
	@${MKDIR} ${PREFIX}/share/vn-fonts
	${INSTALL_DATA} ${WRKSRC}/*.ps ${PREFIX}/share/vn-fonts
	${INSTALL_DATA} ${WRKSRC}/*.gsf ${PREFIX}/share/vn-fonts
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/README ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/INSTALL ${DOCSDIR}
.endif

.include <bsd.port.mk>
