# $FreeBSD$

PORTNAME=	hidapi
DISTVERSION=	0.8.0-rc1
PORTREVISION=	1
CATEGORIES=	comms

MAINTAINER=	tijl@FreeBSD.org
COMMENT=	Library to access USB HID-class devices

LICENSE=	BSD3CLAUSE GPLv3
LICENSE_COMB=	dual

USE_GITHUB=	yes
GH_ACCOUNT=	signal11
GH_TAGNAME=	${PORTNAME}-${DISTVERSION}
GH_COMMIT=	40cf516

USE_AUTOTOOLS=	aclocal autoconf autoheader automake libtoolize
AUTOMAKE_ARGS=	--add-missing --copy
LIBTOOLIZE_ARGS=--copy

USES=		iconv:wchar_t libtool
USE_LDCONFIG=	yes

.include <bsd.port.mk>
