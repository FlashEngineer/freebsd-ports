# Created by: Dmitry Marakasov <amdmi3@amdmi3.ru>
# $FreeBSD$

PORTNAME=	stormbaancoureur
PORTVERSION=	2.1.5
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://bram.creative4vision.nl/stormbaancoureur/download/ \
		http://mirror.amdmi3.ru/distfiles/

MAINTAINER=	amdmi3@FreeBSD.org
COMMENT=	Simulated obstacle course for automobiles

BUILD_DEPENDS=	${LOCALBASE}/lib/libplibsl.a:${PORTSDIR}/x11-toolkits/plib \
		${LOCALBASE}/lib/libode.a:${PORTSDIR}/devel/ode

USE_GL=		glut

MAKE_ENV=	DATADIR="${DATADIR}"

BUILD_WRKSRC=	${WRKSRC}/src-stormbaancoureur
INSTALL_WRKSRC=	${WRKSRC}/src-stormbaancoureur

PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	*
PORTDATA=	*

OPTIONS_DEFINE=	DOCS

post-patch:
	@${REINPLACE_CMD} -e 's|__DATADIR|"${DATADIR}"|' \
		${WRKSRC}/src-stormbaancoureur/main.cxx

post-install:
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${INSTALL_WRKSRC}/README ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
