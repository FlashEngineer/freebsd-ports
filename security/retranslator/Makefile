# Created by: Gvozdikov Veniamin <g.veniamin@googlemail.com>
# $FreeBSD$

PORTNAME=	retranslator
PORTVERSION=	5.0.0
CATEGORIES=	security
MASTER_SITES=	http://utils.kaspersky.com/updater/retranslator_5.0.0.7/FreeBSD_6.3/ \
		LOCAL/vg
DISTNAME=	${PORTNAME}-${PORTVERSION}-7

MAINTAINER=	vg@FreeBSD.org
COMMENT=	The update utility for Kaspersky applications

NO_BUILD=	yes
ONLY_FOR_ARCHS=	i386 amd64

WRKSRC=		${WRKDIR}/${PORTNAME}

LIB_DEPENDS+=	m:${PORTSDIR}/misc/compat6x

NO_STAGE=	yes
do-configure:

.for f in 's,./backup/,/var/db/${PORTNAME}/backup,g' \
	's,./bases/,/var/db/${PORTNAME}/bases,g' \
	's,./${PORTNAME}.log,/var/log/${PORTNAME}.log,g'
	@${REINPLACE_CMD} -e ${f} \
		${WRKSRC}/${PORTNAME}.conf
.endfor

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME}.bin \
		${PREFIX}/bin/${PORTNAME}

post-install:
	@${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.conf \
		${PREFIX}/etc/${PORTNAME}.conf.sample
	@if [ ! -f ${PREFIX}/etc/${PORTNAME}.conf ]; then \
		${CP} -p ${PREFIX}/etc/${PORTNAME}.conf.sample ${PREFIX}/etc/${PORTNAME}.conf ; \
	fi

.include <bsd.port.mk>
