# Created by: Gea-Suan Lin <gslin@gslin.org>
# $FreeBSD$

PORTNAME=	gregarius
PORTVERSION=	0.6.1
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	SF

MAINTAINER=	gslin@gslin.org
COMMENT=	Web-based RSS/RDF/ATOM news aggregator

USE_PHP=	gettext iconv mbstring session xml zlib
NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

NO_STAGE=	yes
do-install:
	${MKDIR} ${WWWDIR}
	${CP} -R ${WRKSRC}/ ${WWWDIR}

.include <bsd.port.mk>
