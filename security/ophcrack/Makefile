# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>
# $FreeBSD$

PORTNAME=	ophcrack
PORTVERSION=	3.6.0
CATEGORIES=	security
MASTER_SITES=	SF

MAINTAINER=	danfe@FreeBSD.org
COMMENT=	Windows password cracker based on rainbow tables

LICENSE=	APACHE20 GPLv2
LICENSE_COMB=	multi

LIB_DEPENDS=	expat:${PORTSDIR}/textproc/expat2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_OPENSSL=	yes

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

PLIST_FILES=	bin/ophcrack
PORTDOCS=	*

OPTIONS_DEFINE=	X11 GRAPH DOCS
OPTIONS_DEFAULT=	X11 GRAPH

X11_DESC=	Build Qt 4 GUI frontend
GRAPH_DESC=	Enable graph rendering via Qwt

NO_STAGE=	yes
.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MX11} || ${PORT_OPTIONS:MGRAPH}
USE_QT4=	moc_build qmake_build rcc_build uic_build corelib gui
.else
CONFIGURE_ARGS+=	--disable-gui
.endif

.if ${PORT_OPTIONS:MGRAPH}
LIB_DEPENDS+=	qwt:${PORTSDIR}/x11-toolkits/qwt5
.else
CONFIGURE_ARGS+=	--disable-graph
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/ChangeLog ${WRKSRC}/README ${DOCSDIR}
.endif
	@${ECHO_MSG} ; ${CAT} ${PKGMESSAGE} ; ${ECHO_MSG}

.if ${ARCH} == "ia64" || ${ARCH} == "powerpc" || ${ARCH} == "sparc64"
BROKEN=		Does not compile on ia64, powerpc, or sparc64
.endif

.include <bsd.port.mk>
