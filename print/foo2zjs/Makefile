# Created by: Jose Alonso Cardenas Marquez <acardenas@bsd.org.pe>
# $FreeBSD$

PORTNAME=	foo2zjs
PORTVERSION=	20131225
CATEGORIES=	print
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE} \
		${MASTER_SITE_LOCAL:S,$,bsam/${PORTNAME}/,}  \
		ftp://ftp.wart.ru/pub/FreeBSD/ports/distfiles/

MAINTAINER=	bsam@FreeBSD.org
COMMENT=	Driver for printers that use the ZjStream wire protocol

LIB_DEPENDS=	libcups.so:${PORTSDIR}/print/cups-base
RUN_DEPENDS=	${LOCALBASE}/share/foomatic/db/oldprinterids:${PORTSDIR}/print/foomatic-db \
		foomatic-rip:${PORTSDIR}/print/foomatic-filters

PROJECTHOST=	bsdistfiles
USE_GHOSTSCRIPT=yes
USES=		gmake shebangfix
SHEBANG_FILES=	msexpand
SUB_FILES=	pkg-message
EXTRAFILES=	msexpand getweb

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|^CFLAGS|CFLAGS?|g' -e 's|^PREFIX|PREFIX?|g' ${WRKSRC}/icc2ps/Makefile

post-install:
	@cd ${WRKSRC} && \
		${INSTALL_SCRIPT} ${EXTRAFILES} ${STAGEDIR}${PREFIX}/bin
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/foo2zjs-icc2ps
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for FILE in ChangeLog README manual.pdf
	${INSTALL_DATA} ${WRKSRC}/${FILE} ${STAGEDIR}${DOCSDIR}
.endfor

.include <bsd.port.mk>
