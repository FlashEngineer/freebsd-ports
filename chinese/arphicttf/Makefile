# Created by: Jing-Tang Keith Jang <keith@FreeBSD.org>
# $FreeBSD$

PORTNAME=	arphicttf
PORTVERSION=	2.11
PORTREVISION=	3
CATEGORIES=	chinese x11-fonts
MASTER_SITES=	LOCAL/rafan/chinese/
DISTNAME=	${PKGNAMEPREFIX}${PORTNAME}-${PORTVERSION}

MAINTAINER=	rafan@FreeBSD.org
COMMENT=	Four Chinese Big5/GB TrueType fonts made by Arphic Technology

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/arphic

TTF=		bkai00mp.ttf bsmi00lp.ttf gbsn00lp.ttf gkai00mp.ttf

NO_STAGE=	yes
do-install:
	@${MKDIR} ${FONTSDIR}
.for ttf in ${TTF}
	${INSTALL_DATA} ${WRKSRC}/font/${ttf} ${FONTSDIR}
.endfor
	@${MKDIR} ${DATADIR}
	${CP} -fr ${WRKSRC}/license ${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/logo.gif ${WRKSRC}/release.txt ${DATADIR}

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/chinese/ttfm/Makefile.ttf"
.include <bsd.port.post.mk>
