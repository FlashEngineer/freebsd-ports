# Created by: Anders Nordby <anders@fix.no>
# $FreeBSD$

PORTNAME=	nessus-plugins
PORTVERSION=	2.2.9
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	ftp://ftp.nessus.org/pub/nessus/nessus-${PORTVERSION}/src/ \
		ftp://ftp.gwdg.de/pub/linux/misc/nessus/nessus-${PORTVERSION}/src/ \
		http://ftp.gwdg.de/pub/linux/misc/nessus/nessus-${PORTVERSION}/src/ \
		ftp://sunsite.cnlab-switch.ch/mirror/nessus/nessus-${PORTVERSION}/src/ \
		ftp://ftp.ayamura.org/pub/nessus/nessus-${PORTVERSION}/src/
DISTNAME=	nessus-plugins-GPL-${PORTVERSION}

MAINTAINER=	udo.schweigert@siemens.com
COMMENT=	Plugins for Nessus, the security scanner

BUILD_DEPENDS=	${LOCALBASE}/include/nessus/nessus-devel.h:${PORTSDIR}/security/nessus
RUN_DEPENDS=	${LOCALBASE}/include/nessus/nessus-devel.h:${PORTSDIR}/security/nessus \
		nmap:${PORTSDIR}/security/nmap

DIST_SUBDIR=	nessus
WRKSRC=		${WRKDIR}/nessus-plugins

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-fetchcmd=wget

.include <bsd.port.pre.mk>

post-install:
	@${ECHO} "================================================================================"
	@${ECHO} "Use ${PREFIX}/sbin/nessus-update-plugins to update your plugin"
	@${ECHO} "collection."
	@${ECHO} "================================================================================"

.include <bsd.port.post.mk>
