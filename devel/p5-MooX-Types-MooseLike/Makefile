# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD$

PORTNAME=	MooX-Types-MooseLike
PORTVERSION=	0.25
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Some Moosish types and a typer builder

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-Module-Runtime>=0.012:${PORTSDIR}/devel/p5-Module-Runtime
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-Moo>=0.091010:${PORTSDIR}/devel/p5-Moo \
		p5-Set-Object>=1:${PORTSDIR}/devel/p5-Set-Object \
		p5-Test-Fatal>=0.003:${PORTSDIR}/devel/p5-Test-Fatal

USE_PERL5=	configure
USES=		perl5

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 501400
TEST_DEPENDS+=	p5-Test-Simple>=0.96:${PORTSDIR}/devel/p5-Test-Simple
.endif

.include <bsd.port.post.mk>
