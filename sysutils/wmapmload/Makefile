# Created by: pat
# $FreeBSD$

PORTNAME=	wmapmload
PORTVERSION=	0.3.4
PORTREVISION=	2
CATEGORIES=	sysutils windowmaker
MASTER_SITES=	http://tnemeth.free.fr/projets/programmes/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	APM battery status monitor dockapp with a similar look to wmcpuload

ONLY_FOR_ARCHS=	i386
USE_XORG=	x11 xpm
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=""

MAN1=		${PORTNAME}.1
PLIST_FILES=	bin/wmapmload

BINMODE=	2755
BINGRP=		operator

NO_STAGE=	yes
.include <bsd.port.mk>
