# Created by: Sergei Kolobov <sergei@kolobov.com>
# $FreeBSD$

PORTNAME=	libdjbdns
PORTVERSION=	1.05
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	http://smarden.org/pape/djb/manpages/
DISTNAME=	djbdns-pd-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Public domain DNS client library

USE_LDCONFIG=	yes
USE_GMAKE=	yes
ALL_TARGET=	it

LIBS=		libdjbdns.a libdjbdns.so.1
INCLUDES=	alloc.h byte.h case.h dns.h env.h error.h fmt.h \
		gen_alloc.h gen_allocdefs.h iopause.h ip4.h ndelay.h \
		open.h openreadclose.h readclose.h scan.h select.h \
		socket.h str.h stralloc.h tai.h taia.h uint16.h \
		uint32.h uint64.h

NO_STAGE=	yes
do-install:
	@${MKDIR} ${PREFIX}/include/libdjbdns
	cd ${WRKSRC} && \
		${INSTALL_DATA} ${LIBS} ${PREFIX}/lib && \
		${INSTALL_DATA} ${INCLUDES} ${PREFIX}/include/libdjbdns

.include <bsd.port.mk>
