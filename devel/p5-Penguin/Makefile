# Created by: James FitzGibbon <jfitz@FreeBSD.org>
# $FreeBSD$

PORTNAME=	Penguin
PORTVERSION=	3.00
CATEGORIES=	devel security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A framework for passing digitally signed perl5 code between machines

RUN_DEPENDS=	pgp:${PORTSDIR}/security/pgp

USES=		perl5
USE_PERL5=	configure

NO_STAGE=	yes
post-install:
		${MKDIR} ${PREFIX}/lib/perl5/site_perl/Penguin/bin ${PREFIX}/lib/perl5/site_perl/Penguin/misc ${PREFIX}/lib/perl5/site_perl/Penguin/doc
		${INSTALL_DATA} ${WRKSRC}/bin/.pen ${PREFIX}/lib/perl5/site_perl/Penguin/bin
.for file in makeapplet pclient penguind runapplet
		${INSTALL} -c -o ${BINOWN} -g ${BINGRP} -m ${BINMODE} ${WRKSRC}/bin/${file} ${PREFIX}/lib/perl5/site_perl/Penguin/bin
.endfor
		${INSTALL_DATA} ${WRKSRC}/misc/* ${PREFIX}/lib/perl5/site_perl/Penguin/misc
.for file in FAQ INSTALL MODULE_NOTES README SECURITY TODO
		${INSTALL_DATA} ${WRKSRC}/${file} ${PREFIX}/lib/perl5/site_perl/Penguin/doc
.endfor

.include <bsd.port.mk>
