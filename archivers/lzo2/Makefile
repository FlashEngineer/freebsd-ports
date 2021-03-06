# Created by: giffunip@asme.org
# $FreeBSD$

PORTNAME=	lzo2
PORTVERSION=	2.06
PORTREVISION=	2
CATEGORIES=	archivers devel
MASTER_SITES=	http://www.oberhumer.com/opensource/lzo/download/ \
		LOCAL/mandree
DISTNAME=	lzo-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	mandree@FreeBSD.org
COMMENT=	Portable speedy, lossless data compression library

LICENSE=	GPLv2

USES=		libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-shared --docdir=${DOCSDIR}
USE_LDCONFIG=	yes

.include <bsd.port.options.mk>

.if !${PORT_OPTIONS:MDOCS}
INSTALL_TARGET=	install-exec install-pkgincludeHEADERS
.endif

post-build:
.if !defined(WITHOUT_CHECKS)
	@${ECHO_MSG} "===>  Running self-tests for ${PKGNAME} (can take a few minutes)"
	@#: override MALLOC_OPTIONS, else tests take excessively long
	cd ${WRKSRC} && ${SETENV} MALLOC_OPTIONS=jz ${MAKE} check test SHELL="${SH} -x"
.endif

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/liblzo2.so.2
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${REINPLACE_CMD} -e 's,doc/,,' NEWS README
.for i in AUTHORS BUGS COPYING NEWS README THANKS
	${INSTALL_DATA} ${WRKSRC}/${i} ${STAGEDIR}${DOCSDIR}/
.endfor
	${INSTALL_DATA}	${WRKSRC}/doc/* ${STAGEDIR}${DOCSDIR}/
.endif
.if ${PORT_OPTIONS:MEXAMPLES}
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA}	${WRKSRC}/examples/[a-z]*.[ch] ${STAGEDIR}${EXAMPLESDIR}/
.endif

.include <bsd.port.mk>
