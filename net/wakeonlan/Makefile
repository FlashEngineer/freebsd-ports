# Created by: Yen-Ming Lee <leeym@cae.ce.ntu.edu.tw>
# $FreeBSD$

PORTNAME=	wakeonlan
PORTVERSION=	0.41
CATEGORIES=	net
MASTER_SITES=	http://gsd.di.uminho.pt/jpo/software/wakeonlan/downloads/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Sends magic packets to WOL enabled NIC to switch on the called PC

USES=		perl5
USE_PERL5=	configure

post-install:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/lab001.wol ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
