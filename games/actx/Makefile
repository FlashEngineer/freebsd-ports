# Created by: Shinya Esu <esu@yk.rim.or.jp>
# $FreeBSD$

PORTNAME=	actx
PORTVERSION=	1.23
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://rosegray.sakura.ne.jp/ActX/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Window sitter for X11

NO_CDROM=	Contains commercial character data

USES=		imake
USE_XORG=	xaw
MAN1=		actx.1
MANLANG=	"" ja

ACTXDIR=	${PREFIX}/share/examples/actx

NO_STAGE=	yes
.include <bsd.port.options.mk>

post-extract:
	@ ${CP} ${WRKSRC}/samples/Imakefile ${WRKSRC}

post-patch:
.for i in samples/sample.actxrc
	@ ${MV} ${WRKSRC}/$i ${WRKSRC}/$i.old
	@ ${SED} -e "s#%%ACTXDIR%%#${ACTXDIR}#" ${WRKSRC}/$i.old > ${WRKSRC}/$i
.endfor

pre-configure:
	@ ${CP} ${WRKSRC}/samples/sample.actxrc ${WRKSRC}/install.actxrc
	@ ${CP} ${WRKSRC}/samples/sample.actxrc ${WRKSRC}/install.actxrc-one

post-install:
# strip binary
	@${STRIP_CMD} ${PREFIX}/bin/actx
# install japanese manual
	@${INSTALL_MAN} ${WRKSRC}/actx.jman ${PREFIX}/man/ja/man1/actx.1
	@${GZIP_CMD} ${PREFIX}/man/ja/man1/actx.1
.for i in sample.Xdefaults sample.actxrc
	@ ${INSTALL_DATA} ${WRKSRC}/samples/$i ${ACTXDIR}
.endfor
.if ${PORT_OPTIONS:MDOCS}
.for i in doc/ForDevelloper.jis doc/ManualInstall.jis README.jis
	@ ${MKDIR} ${PREFIX}/share/doc/ja/actx
	@ ${INSTALL_MAN} ${WRKSRC}/$i ${PREFIX}/share/doc/ja/actx
.endfor
.endif
	@ ${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
