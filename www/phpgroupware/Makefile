# $FreeBSD$

PORTNAME=	phpgroupware
PORTVERSION=	0.9.16.017
CATEGORIES=	www
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=	phpgroupware/phpgroupware/${PORTVERSION}

MAINTAINER=	olgeni@FreeBSD.org
COMMENT=	A web based GroupWare system

USE_BZIP2=	yes
USE_PHP=	yes
WANT_PHP_MOD=	yes

NO_BUILD=	yes

NO_STAGE=	yes
do-install:
		@${MKDIR} -p ${PREFIX}/www/data-dist/phpgroupware
		@${CP} -r ${WRKSRC}/* ${PREFIX}/www/data-dist/phpgroupware

.include <bsd.port.mk>
