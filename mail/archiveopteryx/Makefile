# Created by: Ashish SHUKLA <ashish@FreeBSD.org>
# $FreeBSD$

PORTNAME=	archiveopteryx
PORTVERSION=	3.1.3
PORTREVISION=	3
CATEGORIES=	mail
MASTER_SITES=	http://archiveopteryx.org/download/

MAINTAINER=	feld@FreeBSD.org
COMMENT=	Advanced PostgreSQL-based IMAP/POP server

LICENSE=	BSD
LICENSE_FILE=	${WRKSRC}/bsd.txt

BUILD_DEPENDS=	jam:${PORTSDIR}/devel/jam

USES=	perl5
USE_BZIP2=	yes
USE_PERL5=	build
USE_PGSQL=	yes

MAN5=	aoxsuper.conf.5 archiveopteryx.conf.5
MAN8=	aox.8 aoximport.8 archiveopteryx.8 deliver.8 installer.8 logd.8 \
	recorder.8 tlsproxy.8

PORTDOCS=	COPYING README bsd.txt

SUB_FILES=	pkg-message

USE_RC_SUBR=	${PORTNAME}

USERS=		aox
GROUPS=		aox

JAM?=		${LOCALBASE}/bin/jam

NO_STAGE=	yes
.include <bsd.port.pre.mk>

post-patch:
	@${GREP} -Rl '%%[[:alpha:]]\+%%' ${WRKSRC} |${XARGS} ${REINPLACE_CMD} \
		-e 's,%%PREFIX%%,${PREFIX},g'

do-build:
	@cd ${WRKSRC} && ${JAM}

do-install:
	@cd ${WRKSRC} && ${JAM} install

post-install:
	${INSTALL} -d -o root -g wheel -m 700 /var/db/aox/jail
	${INSTALL} -d -o ${USERS} -g ${GROUPS} /var/db/aox/messages
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
