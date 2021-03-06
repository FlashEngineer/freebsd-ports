# Created by: Barry Irwin <bvi@moria.org>
# $FreeBSD$

PORTNAME=	pixilate
PORTVERSION=	0.4.2
PORTREVISION=	2
CATEGORIES=	net-mgmt
MASTER_SITES=	SF/winfingerprint/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Generates packets to match a list of Cisco PIX access lists

LIB_DEPENDS=	net:${PORTSDIR}/net/libnet

WRKSRC=		${WRKDIR}/pixilate

USE_AUTOTOOLS=	aclocal autoconf automake libtool
AUTOMAKE_ARGS=	--add-missing

MAN1=		pixilate.1

PORTDOCS=	README
PLIST_FILES=	bin/pixilate

LIBNET_CONFIG?=	${LOCALBASE}/bin/libnet11-config

NO_STAGE=	yes
post-patch:
	@${REINPLACE_CMD} -e \
		's|libnet-config|${LIBNET_CONFIG}|; \
		 s|--defines`|& `${LIBNET_CONFIG} --cflags`|' \
		${WRKSRC}/configure.ac

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for i in README
	${INSTALL_DATA} ${WRKSRC}/${i} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
