# Created by: Andrey Zakhvatov
# $FreeBSD$

PORTNAME=	gtkballs
PORTVERSION=	3.1.5
PORTREVISION=	11
CATEGORIES=	games
MASTER_SITES=	http://gtkballs.antex.ru/dist/

MAINTAINER=	nemysis@FreeBSD.org
COMMENT=	Lines-like simple logic game for X Window System

LICENSE=	GPLv2

USES=		gmake pkgconfig
USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--localstatedir=${DATADIR}

CPPFLAGS+=	-I${LOCALBASE}/include -w
LDFLAGS+=	-L${LOCALBASE}/lib

PORTDOCS=	AUTHORS ChangeLog NEWS README README.russian TODO

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext

DESKTOP_ENTRIES="GtkBalls" "" ${PORTNAME} \
		"${PORTNAME}" "Game;ArcadeGame;" ""

post-install:
	${INSTALL_DATA} ${WRKSRC}/gnome-gtkballs.png  \
		${STAGEDIR}${PREFIX}/share/pixmaps/${PORTNAME}.png

	${CHMOD} 664 ${STAGEDIR}${DATADIR}/gtkballs-scores
	${CHOWN} root:games ${STAGEDIR}${DATADIR}/gtkballs-scores

	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
