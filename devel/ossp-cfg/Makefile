# Created by: Alan Eldridge <alane@geeksrus.net>
# $FreeBSD$

PORTNAME=	cfg
PORTVERSION=	0.9.11
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OSSP}
MASTER_SITE_SUBDIR=	lib/${PORTNAME}
PKGNAMEPREFIX=	ossp-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A library for parsing arbitrary C/C++-style configuration files

LIB_DEPENDS=	ex.10:${PORTSDIR}/devel/ossp-ex

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ex=${LOCALBASE}
USE_LDCONFIG=	yes

MAN3=		cfg.3

check:	build
	@(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} check)

NO_STAGE=	yes
.include <bsd.port.mk>
