# Created by: Serge Gagnon <gagnon__s@videotron.ca>
# $FreeBSD$

PORTNAME=	utftools
PORTVERSION=	1.6
CATEGORIES=	misc
MASTER_SITES=	ftp://ftp.cs.yorku.ca/pub/wily/misc/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	UTF-aware wc, fmt, expand, and unexpand

BUILD_DEPENDS=	${LOCALBASE}/lib/libutf.a:${PORTSDIR}/misc/libutf

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	'--libdir=${PREFIX}/lib'

MAN1=	utf8-expand.1 utf8-fmt.1 utf8-unexpand.1 utf8-wc.1

NO_STAGE=	yes
.include <bsd.port.mk>
