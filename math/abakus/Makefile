# Created by: Andy Fawcett <andy@athame.co.uk>
# $FreeBSD$

PORTNAME=	abakus
PORTVERSION=	0.92
CATEGORIES=	math kde
MASTER_SITES=	http://purinchu.net/abakus/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Simple KDE Calculator

LICENSE=	GPLv2

BUILD_DEPENDS=	${LOCALBASE}/bin/flex:${PORTSDIR}/textproc/flex
LIB_DEPENDS=	mpfr:${PORTSDIR}/math/mpfr

USE_BZIP2=	yes
USE_KDE4=	automoc4 kdehier kdelibs kdeprefix
USE_QT4=	moc_build qmake_build rcc_build uic_build
USES=		bison cmake
CMAKE_ARGS=	-DCMAKE_REQUIRED_INCLUDES:STRING="${LOCALBASE}/include" \
		-DCMAKE_REQUIRED_FLAGS:STRING="${LDFLAGS}" \
		-DFLEX_EXECUTABLE:FILEPATH=${LOCALBASE}/bin/flex

LDFLAGS+=	-L${LOCALBASE}/lib

NO_STAGE=	yes
.include <bsd.port.mk>
