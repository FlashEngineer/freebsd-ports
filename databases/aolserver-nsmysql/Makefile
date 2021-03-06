# Created by: Martin Matuska <mm@FreeBSD.org>
# $FreeBSD$

PORTNAME=	nsmysql
PORTVERSION=	1.0
PORTREVISION=	3
CATEGORIES=	databases www
MASTER_SITES=	SF/aolserver/${PORTNAME}/${PORTNAME}_v1
PKGNAMEPREFIX=	aolserver-
DISTNAME=	nsmysql_v1
DIST_SUBDIR=	aolserver

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Internal MySQL database driver for AOLserver

DEPRECATED=	abandonware, messing up on clusters
EXPIRATION_DATE=	2014-04-03

AOLSERVERBASE?=	aolserver
BUILD_DEPENDS+=	${LOCALBASE}/${AOLSERVERBASE}/bin/nsd:${PORTSDIR}/www/aolserver
RUN_DEPENDS+=	${LOCALBASE}/${AOLSERVERBASE}/bin/nsd:${PORTSDIR}/www/aolserver

USE_MYSQL=	yes
USE_GMAKE=	yes

MAKE_ARGS=	AOLSERVER="${LOCALBASE}/${AOLSERVERBASE}" \
		MYSQL_PREFIX="${LOCALBASE}" \
		MODLIBS="-L${LOCALBASE}/lib/mysql -lmysqlclient_r" \
		DLLLIBS="-L${LOCALBASE}/lib/mysql -lmysqlclient_r" \
		NO_LDOVERRIDE=1

PLIST_FILES=	${AOLSERVERBASE}/bin/nsmysql.so \
		${AOLSERVERBASE}/lib/libnsmysql.a \
		${AOLSERVERBASE}/lib/libnsmysql.so

.if !defined(NOPORTDOCS)
PORTDOCS=	ChangeLog README INSTALL
.endif

NO_STAGE=	yes
post-patch:
	@${REINPLACE_CMD} -e 's/^MODLIBS  =/MODLIBS +=/g' \
		-e '/^OBJS      =.*/{n;s/.*/MODOBJS  = $$(OBJS)/g;G;}' \
		${WRKSRC}/Makefile

post-install:
.if !defined(NOPORTDOCS)
	@ ${MKDIR} ${DOCSDIR}
.for FILE in ${PORTDOCS}
	@ ${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
