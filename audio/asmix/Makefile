# Created by: mtm@identd.net
# $FreeBSD$

PORTNAME=	asmix
PORTVERSION=	1.5
PORTREVISION=	2
CATEGORIES=	audio afterstep
MASTER_SITES=	http://www.tigr.net/afterstep/download/asmix/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Volume control dock-app for the AfterStep Window Manager

DEPRECATED=	No more public distfiles
EXPIRATION_DATE=	2014-03-07

USE_XORG=	xpm x11
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-xpm \
		--with-xpm-includes=${LOCALBASE}/include \
		--with-xpm-library=${LOCALBASE}/lib

NO_STAGE=	yes
MAN1=		${PORTNAME}.1x
PLIST_FILES=	bin/asmix

post-patch:
.for file in asmix.c configure autoconf/config.h.in
	@${REINPLACE_CMD} -e 's|machine/soundcard|sys/soundcard|g ; \
		 s|MACHINE_SOUNDCARD|SYS_SOUNDCARD|g' ${WRKSRC}/${file}
.endfor

.include <bsd.port.mk>
