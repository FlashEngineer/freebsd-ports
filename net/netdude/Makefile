# Created by: ijliao
# $FreeBSD$

PORTNAME=	netdude
PORTVERSION=	0.5.1
CATEGORIES=	net
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	NETwork DUmp data Displayer and Editor for tcpdump tracefiles

LIB_DEPENDS=	netdude.0:${PORTSDIR}/net/libnetdude

USE_AUTOTOOLS=	libltdl libtool
USES=		gettext iconv
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-gtk-doc --with-html-dir=${DOCSDIR}
CONFIGURE_ENV=	LIBS="-L${LOCALBASE}/lib -lltdl"
USE_GMAKE=	yes
USE_GNOME=	glib12 gtk12

MAN1=	netdude.1

NO_STAGE=	yes
post-patch:
	@${REINPLACE_CMD} -e 's|DOC_MODULE = netdude|DOC_MODULE =|' \
	${WRKSRC}/doc/netdude-manual/Makefile.in
.if defined(NOPORTDOCS)
	@${REINPLACE_CMD} -e 's|doc||' ${WRKSRC}/Makefile.in
.endif

.include <bsd.port.mk>
