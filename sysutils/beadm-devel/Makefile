# $FreeBSD$

PORTNAME=	beadm
PORTVERSION=	1.0.99.20131026
PORTREVISION=	1
CATEGORIES=	sysutils
PKGNAMESUFFIX=	-devel
MASTER_SITES=	GH \
		LOCAL/bdrewery/${PORTNAME}/ \
		http://mirror.shatow.net/freebsd/${PORTNAME}/

MAINTAINER=	bdrewery@FreeBSD.org
COMMENT=	Solaris-like utility to manage Boot Environments on ZFS

LICENSE=	BSD

USE_GITHUB=	yes
GH_ACCOUNT=	vermaden
GH_COMMIT=	09ffd9c
GH_TAGNAME=	${GH_COMMIT}

NO_BUILD=	YES

CONFLICTS_INSTALL=	beadm-[0-9]*

PLIST_FILES=	sbin/${PORTNAME} \
		man/man1/${PORTNAME}.1.gz

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} \
	    ${STAGEDIR}${PREFIX}/sbin/${PORTNAME}
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 \
	    ${STAGEDIR}${MANPREFIX}/man/man1/

.include <bsd.port.mk>
