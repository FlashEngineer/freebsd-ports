# Created by: Andreas Klemm <andreas@klemm.gtn.com>
# $FreeBSD$

PORTNAME=	Net-SSLeay
PORTVERSION=	1.57
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl5 interface to SSL

TEST_DEPENDS=	p5-Test-Exception>=0:${PORTSDIR}/devel/p5-Test-Exception \
		p5-Test-NoWarnings>=0:${PORTSDIR}/devel/p5-Test-NoWarnings \
		p5-Test-Warn>=0:${PORTSDIR}/devel/p5-Test-Warn

OPTIONS_DEFINE=	EXAMPLES

CONFIGURE_ENV=	OPENSSL_PREFIX=${OPENSSLBASE}
USES=		perl5 shebangfix
USE_OPENSSL=	yes
USE_PERL5=	configure

PORTEXAMPLES=	*

SHEBANG_FILES=	examples/*.pl

post-install:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}/
	${INSTALL_SCRIPT} ${WRKSRC}/examples/*.pl ${STAGEDIR}${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/examples/req.conf ${STAGEDIR}${EXAMPLESDIR}/req.conf

.include <bsd.port.mk>
