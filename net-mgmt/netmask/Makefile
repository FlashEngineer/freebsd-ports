# Created by: Mike Bristow <mike@urgle.com>
# $FreeBSD$

PORTNAME=	netmask
PORTVERSION=	2.4
PORTREVISION=	1
CATEGORIES=	net-mgmt
MASTER_SITES=	http://trap.mtview.ca.us/~talby/
DISTNAME=	netmask_${PORTVERSION}

MAINTAINER=	mike@urgle.com
COMMENT=	Tool for generating terse netmasks in several common formats

WRKSRC=		${WRKDIR}/${DISTNAME:S/_/-/}
GNU_CONFIGURE=	yes
USES=		gmake

MAN1=		netmask.1
INFO=		netmask
PLIST_FILES=	bin/netmask

NO_STAGE=	yes
.include <bsd.port.mk>
