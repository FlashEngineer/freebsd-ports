# Created by: Adam Weinberger <adamw@FreeBSD.org>
# $FreeBSD$

PORTNAME=	glmaze
PORTVERSION=	1.1a
PORTREVISION=	9
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION} \
		SF/nemysisfreebsdp/${CATEGORIES}/:icons
DISTFILES=	${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX} \
		${PORTNAME}.png:icons
EXTRACT_ONLY=   ${PORTNAME}-${DISTVERSION}${EXTRACT_SUFX}

MAINTAINER=	nemysis@FreeBSD.org
COMMENT=	Multiplayer OpenGL Maze Game

LICENSE=	GPLv2

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_GL=		gl
USE_SDL=	mixer sdl
CFLAGS+=	-w

PORTDOCS=	readme.txt

OPTIONS_DEFINE=	DOCS

DESKTOP_ENTRIES="glMaze" "" "${PORTNAME}" \
		"${PORTNAME}" "Game;ArcadeGame;" ""

# Wrong versioning upstream
PORTSCOUT=	ignore:1

post-extract:
	@(cd ${WRKSRC} && ${MV} ${PORTNAME}.1 ${PORTNAME}.6)

post-patch:
	@${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g" ${WRKSRC}/shot.c

post-install:
	${INSTALL_DATA} ${_DISTDIR}/${PORTNAME}.png \
		${STAGEDIR}${PREFIX}/share/pixmaps/

	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
