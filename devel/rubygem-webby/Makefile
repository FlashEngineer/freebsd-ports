# Created by: Ryan Steinmetz (<rpsfa@rit.edu>)
# $FreeBSD$

PORTNAME=	webby
PORTVERSION=	0.9.4
PORTREVISION=	1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	zi@FreeBSD.org
COMMENT=	A small website management system

RUN_DEPENDS=	rubygem-redcloth>=4.2:${PORTSDIR}/www/rubygem-redcloth \
		rubygem-launchy>=0.3.2:${PORTSDIR}/devel/rubygem-launchy \
		rubygem-logging>=0.9.7:${PORTSDIR}/devel/rubygem-logging \
		rubygem-flexmock>=0.2.1:${PORTSDIR}/devel/ruby-flexmock \
		rubygem-lockfile>=1.4.3:${PORTSDIR}/devel/rubygem-lockfile \
		rubygem-rspec>=1.2.2:${PORTSDIR}/devel/rubygem-rspec \
		rubygem-little_plugger>=1.0.1:${PORTSDIR}/devel/rubygem-little_plugger \
		rubygem-loquacious>=1.3.0:${PORTSDIR}/devel/rubygem-loquacious \
		rubygem-hpricot>=0.6.0:${PORTSDIR}/www/rubygem-hpricot \
		rubygem-directory_watcher>=1.1.2:${PORTSDIR}/devel/rubygem-directory_watcher

USE_RUBY=	yes
USE_RUBYGEMS=	yes
USE_RAKE=	yes
RUBYGEM_AUTOPLIST=	yes
PLIST_FILES=	bin/webby bin/webby-gen

.include <bsd.port.mk>
