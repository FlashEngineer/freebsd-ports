# Created by: Bruce M. Simpson
# $FreeBSD$

PORTNAME=	libstdc++_stldoc_3.4.0
PORTVERSION=	20040609
PORTREVISION=	1
CATEGORIES=	lang devel
MASTER_SITES=	${MASTER_SITE_GCC}
MASTER_SITE_SUBDIR= \
		libstdc++/doxygen
DISTNAME=	libstdc++-html-USERS-3.4.0

MAINTAINER=	ports@FreeBSD.org
COMMENT=	GNU libstdc++ API documentation

USE_BZIP2=	yes

NO_BUILD=	yes
NO_WRKSUBDIR=	yes

PORTDOCS=	*

NO_STAGE=	yes
do-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR} && \
	    cd ${WRKSRC}/html_user && ${COPYTREE_SHARE} \* ${DOCSDIR} && \
	    ${CHMOD} 755 ${DOCSDIR}
.else
	@${ECHO} "NOPORTDOCS is set -- installing nothing."
.endif

.include <bsd.port.mk>
