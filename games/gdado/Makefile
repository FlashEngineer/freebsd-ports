# Created by: Anish Mistry <amistry@am-productions.biz>
# $FreeBSD$

PORTNAME=	gdado
PORTVERSION=	2.2
PORTREVISION=	6
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/souce%20code/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	GTK2 dice roller

GNU_CONFIGURE=	yes
USES=		gmake pkgconfig
USE_GNOME=	gnomeprefix gtk20 libgnomeui

NO_STAGE=	yes
post-patch:
	@${REINPLACE_CMD} "s|-O2|${CFLAGS}|" ${WRKSRC}/configure

.include <bsd.port.mk>
