# Created by: Stefan Jahn <stefan.jahn@nemesis-sektor.de>
# $FreeBSD$

PORTNAME=	kdirstat
PORTVERSION=	2.7.4
CATEGORIES=	sysutils kde
MASTER_SITES=	https://bitbucket.org/jeromerobert/k4dirstat/get/
DISTNAME=	k4dirstat-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	KDE utility that sums up disk usage for directory trees

LICENSE=	GPLv2

WRKSRC=		${WRKDIR}/jeromerobert-k4dirstat-33ed79e1054e

USE_BZIP2=	yes
USES=		cmake desktop-file-utils
USE_KDE4=	automoc4 kdelibs kdeprefix libkonq
USE_QT4=	moc_build qmake_build rcc_build uic_build
INSTALLS_ICONS=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		'/^Categories/s|=.*|=Qt;KDE;Utility;|' \
		${WRKSRC}/src/k4dirstat.desktop
	@${REINPLACE_CMD} -e \
		's|<sys/errno.h>|<errno.h>|' \
		${WRKSRC}/src/kdirreadjob.cpp

post-install:
	@${LN} -sf k4dirstat ${STAGEDIR}${PREFIX}/bin/kdirstat

.include <bsd.port.mk>
