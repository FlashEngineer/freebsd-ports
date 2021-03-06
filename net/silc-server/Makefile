# Created by: Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
# $FreeBSD$

PORTNAME=	silc
PORTVERSION=	1.1.18
CATEGORIES=	net ipv6 security
MASTER_SITES=	http://www.silcnet.org/download/%SUBDIR%/ \
		http://ftp.silcnet.org/%SUBDIR%/ \
		http://www.nic.funet.fi/pub/mirrors/ftp.silcnet.org/silc/%SUBDIR%/ \
		http://ftp.sunet.se/pub/network/silc/%SUBDIR%/ \
		ftp://ftp.silcnet.org/silc/%SUBDIR%/ \
		ftp://ftp.funet.fi/pub/mirrors/ftp.silcnet.org/silc/%SUBDIR%/ \
		ftp://ftp.sunet.se/pub/network/silc/%SUBDIR%/
MASTER_SITE_SUBDIR=	server/sources
PKGNAMESUFFIX=	-server
DISTNAME=	${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

MAINTAINER=	wxs@FreeBSD.org
COMMENT=	Secure Internet Live Conferencing (SILC) network server

LIB_DEPENDS=	silc-1.1:${PORTSDIR}/devel/silc-toolkit

SUB_FILES=	pkg-message pkg-deinstall
USE_RC_SUBR=	silcd
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CFLAGS+=	${PTHREAD_CFLAGS} ${PTHREAD_LIBS}
CONFIGURE_ARGS=	--with-silcd-config-file=${PREFIX}/etc/${PORTNAME}/silcd.conf \
		--sysconfdir=${PREFIX}/etc/${PORTNAME} \
		--with-helpdir=share/${PORTNAME}/help \
		--with-logsdir=/var/log/${PORTNAME} \
		--with-silcd-pid-file=/var/run/silcd.pid \
		--enable-ipv6 \
		--enable-debug

MAN5=	silcd.conf.5
MAN8=	silcd.8

NO_STAGE=	yes
.include <bsd.port.pre.mk>

.if ${ARCH} != "i386"
CONFIGURE_ARGS+=	--disable-asm
.endif

post-patch:
.ifdef(NOPORTEXAMPLES)
	@${REINPLACE_CMD} -E -e \
		'/examples-install.*\\/d' \
		${WRKSRC}/apps/silcd/Makefile.in
.endif
	@${REINPLACE_CMD} -e 's/--libtool-enable-shared//' \
		${WRKSRC}/lib/silccrypt/Makefile.in

post-install:
	@if [ ! -f ${PREFIX}/etc/silc/silcd.conf ]; then \
		${CP} -p ${PREFIX}/etc/silc/silcd.conf.sample ${PREFIX}/etc//silc/silcd.conf; \
	fi
	@if [ ! -f ${PREFIX}/etc/silc/silcalgs.conf ]; then \
		${CP} -p ${PREFIX}/etc/silc/silcalgs.conf.sample ${PREFIX}/etc/silc/silcalgs.conf; \
	fi
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
