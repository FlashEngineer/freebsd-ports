# Created by: Jeremy Norris <ishmael27@home.com>
# $FreeBSD$

PORTNAME=	ferite
PORTVERSION=	1.0.2
PORTREVISION=	3
CATEGORIES=	lang
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	An embeddable scripting language

LIB_DEPENDS=	pcre.3:${PORTSDIR}/devel/pcre \
		xml2.5:${PORTSDIR}/textproc/libxml2

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}
USE_LDCONFIG=	yes
PLIST_SUB=	MACHINE_ARCH=${MACHINE_ARCH}

MAN1=		builder.1 ferite.1
PORTDOCS=	*

NO_STAGE=	yes
.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|<stdint\.h>|<inttypes.h>|' \
		${WRKSRC}/src/ferite_scanner.c
	@${FIND} ${WRKSRC} -name Makefile.in -print | ${XARGS} \
	${REINPLACE_CMD} -e "s|-lferite|-lferite -L${WRKSRC}/src/.libs|g"

.if defined(NOPORTDOCS)
MAKE_ENV+=	NOPORTDOCS=${NOPORTDOCS}
.endif

.include <bsd.port.post.mk>
