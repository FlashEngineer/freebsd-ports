# Created by: Akinori MUSHA aka knu <knu@idaemons.org>
# $FreeBSD$

PORTNAME=	htmlsplit
PORTVERSION=	1.0.2
CATEGORIES=	textproc www ruby
MASTER_SITES=	http://www.moonwolf.com/ruby/archive/
PKGNAMEPREFIX=	${RUBY_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}${PORTVERSION:S/.//g}
DIST_SUBDIR=	ruby

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	A Ruby library to split an HTML document into tags and contents

USE_ZIP=	yes
USE_RUBY=	yes

NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PLIST_FILES=	%%RUBY_SITELIBDIR%%/htmlsplit.rb

NO_STAGE=	yes
do-install:
	${INSTALL_DATA} ${WRKSRC}/htmlsplit.rb ${RUBY_SITELIBDIR}/

.include <bsd.port.mk>
#		http://www.moonwolf.com/ruby/archive/htmlsplit102.zip
