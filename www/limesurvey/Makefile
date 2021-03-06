# Created by: janos.mohacsi@bsd.hu
# $FreeBSD$

PORTNAME=	limesurvey
PORTVERSION=	1.91
CATEGORIES=	www
MASTER_SITES=	SF/${PORTNAME}/1._LimeSurvey_stable/${PORTVERSION}+/
DISTNAME=	${PORTNAME}${PORTVERSION:S^.^^}plus-build10232-20110608

MAINTAINER=	jmohacsi@bsd.hu
COMMENT=	A PHP-based survey building and runing system

LICENSE=	GPLv2

# http://docs.limesurvey.org/Installation&structure=English+Instructions+for+LimeSurvey
OPTIONS_DEFINE=		PGSQL GD LDAP ZIP
OPTIONS_DEFAULT=	GD

PGSQL_DESC=		Use PostgreSQL (instead of MySQL)
GD_DESC=		Install PHP gd extension
LDAP_DESC=		Install PHP LDAP extension
ZIP_DESC=		Install PHP zip extension

NO_STAGE=	yes
.include <bsd.port.options.mk>

# http://docs.limesurvey.org/Installation&structure=English+Instructions+for+LimeSurvey#Make_sure_you_can_use_LimeSurvey_on_your_website
.if ${PORT_OPTIONS:MPGSQL}
USE_PGSQL=	yes
USE_PHP=	pgsql
.else
# server is not necessary on this host.
#USE_MYSQL=	server
USE_MYSQL=	client
USE_PHP=	mysql
.endif
.if ${PORT_OPTIONS:MGD}
USE_PHP+=	gd
.endif
.if ${PORT_OPTIONS:MLDAP}
USE_PHP+=	ldap
.endif
.if ${PORT_OPTIONS:MZIP}
USE_PHP+=	zip
.endif
USE_PHP+=	ctype dom iconv json mbstring pcre \
		simplexml session xmlwriter
WANT_PHP_WEB=yes

WWWDOCROOT?=		www
PHPSURVEYORURL?=	${PORTNAME}

WRKSRC=		${WRKDIR}/${PORTNAME}
NO_BUILD=	yes
SUB_FILES=	pkg-message
SUB_LIST=	PHPSURVEYORURL="${PHPSURVEYORURL}" \
		PHPSURVEYORDIR="${PHPSURVEYORDIR}"

PHPSURVEYORDIR=	${WWWDOCROOT}/${PHPSURVEYORURL}

do-install:
	${MKDIR} "${WWWDIR}"
.if ${PORT_OPTIONS:MPGSQL}
	${SED} -E \
	  -e 's/^(\$$databasetype[[:space:]]*=[[:space:]]*'"')mysql('"'.*)$$/\1postgres\2/'	\
	  -e 's/^(\$$databaseuser[[:space:]]*=[[:space:]]*'"')root('"'.*)$$/\1pgsql\2/' \
	  "${WRKSRC}"/config.php >"${WRKSRC}"/config.php-dist
	${RM} "${WRKSRC}"/config.php
.else
	${MV} "${WRKSRC}"/config.php "${WRKSRC}"/config.php-dist
.endif
	${TEST} -e "${WWWDIR}"/config.php || ${CP} -p "${WRKSRC}"/config.php-dist "${WRKSRC}"/config.php
	@cd "${WRKSRC}" && ${COPYTREE_SHARE} . "${WWWDIR}"
	${MKDIR} "${WWWDIR}"/tmp
	${CHOWN} -R "${WWWOWN}:${WWWGRP}" "${WWWDIR}"
	${CHMOD} 755 "${WWWDIR}"/tmp
	${CHMOD} 755 "${WWWDIR}"/templates
	${CHMOD} 755 "${WWWDIR}"/upload
	${CHOWN} -R 0 "${WWWDIR}"/admin
	${CHMOD} -R go-w "${WWWDIR}"/admin

post-install:
	@${CAT} ${PKGMESSAGE}
	@${FIND} -s -d ${WWWDIR} -type f -print | \
		${SED} -e "s#${PREFIX}/##g" >> ${TMPPLIST}
	@${FIND} -s -d ${WWWDIR} -type d  -print | \
		${SED} -E -e "s#${PREFIX}/#@dirrm #g" >> ${TMPPLIST}

.include <bsd.port.mk>
