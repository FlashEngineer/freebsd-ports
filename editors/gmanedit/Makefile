# Created by: Maxim Sobolev <sobomax@FreeBSD.org>
# $FreeBSD$

PORTNAME=	gmanedit
PORTVERSION=	0.4.2
PORTREVISION=	6
CATEGORIES=	editors gnome
MASTER_SITES=	SF/${PORTNAME}2/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A GNOME manpages editor

USES=        pathfix gettext gmake pkgconfig
USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lz

MAN1=		gmanedit.1

NO_STAGE=	yes
post-patch:
	@${REINPLACE_CMD} -e '/<argz\.h>/d' ${WRKSRC}/src/callbacks.c

.include <bsd.port.mk>
