# Created by: Veniamin Gvozdikov <vg@FreeBSD.org>
# $FreeBSD$

PORTNAME=	nmapsi4
PORTVERSION=	0.4.1
CATEGORIES=	security
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	vg@FreeBSD.org
COMMENT=	GUI frontend for the nmap scanning utility

LICENSE=	GPLv2

RUN_DEPENDS=	${LOCALBASE}/bin/nmap:${PORTSDIR}/security/nmap

USES=		cmake
USE_XZ=		yes
INSTALLS_ICONS=	yes
USE_QT4=	gui qmake_build uic_build moc_build rcc_build network \
		linguist_build webkit dbus
CMAKE_ARGS+=	-DBUILD_KDELIBS=off

pre-configure:
	${REINPLACE_CMD} -e 's#share/applications/kde4/#share/applications/#g' \
		${WRKSRC}/src/CMakeLists.txt

.include <bsd.port.mk>
