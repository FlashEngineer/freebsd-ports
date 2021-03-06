# Created by: Matthias Andree <matthias.andree@gmx.de>
# $FreeBSD$

PORTNAME=	cone
PORTVERSION=	0.90
PORTREVISION=	1
CATEGORIES=	mail
NO_STAGE=	yes
# This is for beta versions, leave it in please:
#MASTER_SITES=	http://www.courier-mta.org/beta/${PORTNAME}/ \
#		http://www.lerctr.org/~ler/
# This is for release versions, leave it in please:
MASTER_SITES=	SF/courier/${PORTNAME}/${PORTVERSION}

MAINTAINER=	uffe@uffe.org
COMMENT=	Console based mail client with POP3/IMAP/SMAP support

LIB_DEPENDS=	aspell.16:${PORTSDIR}/textproc/aspell
BUILD_DEPENDS=	gpgv:${PORTSDIR}/security/gnupg1
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		fam gettext gmake iconv ncurses perl5
USE_GNOME=	libxml2

USE_BZIP2=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	-C --without-db --with-certdb=${PREFIX}/share/cone/rootcerts --prefix=${PREFIX} --exec-prefix=${PREFIX}

LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	REHASH="${PERL} ${SCRIPTDIR}/c_rehash"
MAN1=		cone.1 leaf.1 mailtool.1
INSTALL_TARGET=	install-strip

.include <bsd.port.pre.mk>

CPPFLAGS+=	-D_XOPEN_SOURCE_EXTENDED
CPPFLAGS+=	-I${WRKDIR} -D_XOPEN_SOURCE_EXTENDED

post-extract:
		${MKDIR} ${WRKDIR}/ncursesw
		${LN} -s ${LOCALBASE}/include/ncurses/ncurses.h ${WRKDIR}/ncursesw/curses.h

post-install:
		${INSTALL_SCRIPT} ${WRKSRC}/sysconftool ${PREFIX}/sbin/cone-sysconftool
		PKG_PREFIX=${PREFIX} ${SH} pkg-install ${PORTNAME} POST-INSTALL
		${RM} -f ${PREFIX}/share/cone/rootcerts/.0
.if !defined(NOPORTDOCS)
		${MKDIR} ${DOCSDIR}
		${INSTALL_MAN} ${WRKSRC}/ChangeLog ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
