# Created by: nemysis <nemysis@gmx.ch>
# $FreeBSD$

PORTNAME=	gottet
PORTVERSION=	1.0.6
CATEGORIES=	games
MASTER_SITES=	http://gottcode.org/${PORTNAME}/
EXTRACT_SUFX=	-src.tar.bz2

MAINTAINER=	nemysis@FreeBSD.org
COMMENT=	Tetris clone

LICENSE=	GPLv3

USES=		qmake
USE_BZIP2=	yes
USE_QT4=	moc_build rcc_build iconengines_run imageformats_run \
		gui
INSTALLS_ICONS=	yes

PORTDOCS=	CREDITS ChangeLog NEWS README

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

.include <bsd.port.options.mk>

post-patch:
.if ! ${PORT_OPTIONS:MNLS}
	@${REINPLACE_CMD} -i '' '/qm.files/,/qm.path/s/^/#/' \
		${WRKSRC}/${PORTNAME}.pro
.endif

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

	${LN} -sf ${PREFIX}/share/icons/hicolor/48x48/apps/${PORTNAME}.png \
		    ${STAGEDIR}${PREFIX}/share/pixmaps/

	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
