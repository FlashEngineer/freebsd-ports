# Created by: oz@nixil.net
# $FreeBSD$

PORTNAME=	reply-o-matic
PORTVERSION=	1.5.0
CATEGORIES=	mail
MASTER_SITES=	SF

MAINTAINER=	oz@nixil.net
COMMENT=	Highly configurable, secure, auto reply software

MAN1=		rom.1

NO_STAGE=	yes
post-patch:
	@${REINPLACE_CMD} \
		-e 's|/etc/rom|${PREFIX}/etc/rom|g'       \
		-e 's|/usr/sbin/rom|${PREFIX}/sbin/rom|g' \
		${WRKSRC}/rom.h ${WRKSRC}/rom.1

.include <bsd.port.mk>
