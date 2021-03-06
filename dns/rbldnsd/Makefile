# Created by: Paul Chvostek <paul@it.ca>
# $FreeBSD$

PORTNAME=	rbldnsd
PORTVERSION=	0.997a
CATEGORIES=	dns
MASTER_SITES=	http://www.corpit.ru/mjt/rbldnsd/ \
		ftp://ftp.renatasystems.org/pub/FreeBSD/ports/distfiles/

MAINTAINER=	alexey@renatasystems.org
COMMENT=	Small and fast DNS daemon especially for DNSBL zones

RBLDNSUSER=	rbldns
RBLDNSGROUP=	${RBLDNSUSER}
ROOTDIR=	${PREFIX}/etc/rbldnsd

MAN8=	rbldnsd.8

HAS_CONFIGURE=	yes
USE_RC_SUBR=	rbldnsd
USERS=	rbldns
GROUPS=	${USERS}
PKGMESSAGE=	${WRKDIR}/pkg-message
SUB_FILES=	pkg-message

NO_STAGE=	yes
.include <bsd.port.options.mk>

do-install:
	if [ ! -d ${ROOTDIR} ]; then \
		${INSTALL} -d -o ${RBLDNSUSER} -g ${RBLDNSGROUP} \
		-m 710 ${ROOTDIR}; \
	fi
	${INSTALL_DATA} -o ${RBLDNSUSER} -g ${RBLDNSGROUP} -m 640 \
		${FILESDIR}/example ${ROOTDIR}
	${INSTALL_PROGRAM} ${WRKSRC}/rbldnsd ${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/${MAN8} ${MAN8PREFIX}/man/man8
.if ${PORT_OPTIONS:MDOCS}
	${INSTALL} -d ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/CHANGES-0.81 ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/TODO ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/NEWS ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/debian/changelog ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/debian/copyright ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/debian/rbldnsd.default ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/debian/rbldnsd.init ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/rbldnsd.spec ${DOCSDIR}
.endif

.include <bsd.port.mk>
