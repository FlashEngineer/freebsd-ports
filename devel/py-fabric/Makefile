# Created by: Yi-Jheng Lin <yzlin@cs.nctu.edu.tw>
# $FreeBSD$

PORTNAME=	fabric
PORTVERSION=	1.8.1
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:C/f/F/}-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}

MAINTAINER=	koobs@FreeBSD.org
COMMENT=	Simple pythonic remote deployment tool

LICENSE=	BSD2CLAUSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}paramiko>=1.10.0:${PORTSDIR}/security/py-paramiko
TEST_DEPENDS:=	${RUN_DEPENDS} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=0.6:${PORTSDIR}/devel/py-Jinja2 \
		${PYTHON_PKGNAMEPREFIX}fudge>0:${PORTSDIR}/devel/py-fudge \
		nosetests:${PORTSDIR}/devel/py-nose

OPTIONS_DEFINE=	TESTS
TESTS_DESC=	Install nose for test suite

TESTS_BUILD_DEPENDS=	${TEST_DEPENDS}

USE_PYTHON=		yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_AUTOPLIST=	yes

regression-test: build
	@cd ${WRKSRC} && nosetests -v

.include <bsd.port.mk>
