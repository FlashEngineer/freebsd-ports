# Created by: Akinori MUSHA aka knu <knu@idaemons.org>
# $FreeBSD$

PORTNAME=	p4db
PORTVERSION=	2.01
CATEGORIES=	devel www
MASTER_SITES=	http://freebsd.unixfreunde.de/sources/ \
		${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	miwi
DISTNAME=	${PORTNAME:U}_${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Web/Perforce Browser

RUN_DEPENDS=	p4:${PORTSDIR}/devel/p4

USES=		perl5
NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PATCH_WRKSRC=	${WRKSRC}/${PORTNAME}
SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

FQDN!=		hostname
P4DB_HOME=	${PREFIX}/perforce/${PORTNAME}

USERS=	p4admin
GROUPS=	p4admin

# This variable is configurable.
PERFORCE_PORT?=		1666

NO_STAGE=	yes
post-extract:
	${MKDIR} ${WRKSRC}/${PORTNAME}/www
	${TAR} -xf ${WRKSRC}/cgi_files.tar -C ${WRKSRC}/${PORTNAME}/www/
	${RM} -f ${WRKSRC}/${PORTNAME}/www/Makefile ${WRKSRC}/${PORTNAME}/www/p4jdb/*.java
	${CP} -p ${WRKSRC}/README.html ${WRKSRC}/${PORTNAME}/www/
	${CP} ${WRKSRC}/P4DB.conf.txt ${WRKSRC}/${PORTNAME}/P4DB.conf.sample
	cd ${WRKSRC}; for f in P4DB.shortcuts*.txt; do \
		${CP} $${f} ${PORTNAME}/$${f}.sample; \
	done

post-patch:
	@${REINPLACE_CMD} -i '' -e 's,!!PREFIX!!,${PREFIX},' \
		-e 's,!!PERFORCE_USER!!,p4admin,' \
		-e 's,!!PERFORCE_GROUP!!,p4admin,' \
		-e 's,!!PERFORCE_PORT!!,${PERFORCE_PORT},' \
		-e 's,!!FQDN!!,${FQDN},' \
		${WRKSRC}/${PORTNAME}/P4DB.conf.sample
	${FIND} ${WRKSRC}/${PORTNAME} -name '*.orig' -delete

do-install:
	${MKDIR} ${P4DB_HOME}/www
	${CP} -Rp ${WRKSRC}/${PORTNAME}/* ${P4DB_HOME}/
	${CHOWN} -R p4admin:p4admin ${P4DB_HOME}
.for f in P4DB.conf P4DB.shortcuts.txt P4DB.shortcuts2.txt
	if [ ! -f ${P4DB_HOME}/${f} ]; then \
		${CP} -p ${P4DB_HOME}/${f}.sample ${P4DB_HOME}/${f}; \
	fi
.endfor
.if !defined(NOPORTDOCS)
	${MKDIR} ${P4DB_HOME}/doc
	cd ${WRKSRC}; ${INSTALL_DATA} P4CGI.html README.html ${P4DB_HOME}/doc/
.endif

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
