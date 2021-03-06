# Created by: Ernst de Haan <znerd@FreeBSD.org>
# $FreeBSD$

PORTNAME=	commons-collections
PORTVERSION=	3.2.1
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE_COMMONS_SOURCE}
MASTER_SITE_SUBDIR=	${PORTNAME:S,commons-,,}
PKGNAMEPREFIX=	jakarta-
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	hq@FreeBSD.org
COMMENT=	Classes that extend/augment the Java Collections Framework

USE_JAVA=	yes
JAVA_VERSION=	1.6+
USE_ANT=	yes

ALL_TARGET=	jar
.if !defined(NOPORTDOCS)
ALL_TARGET+=	javadoc
OTHERDOCS=	DEVELOPERS-GUIDE.html LICENSE.txt PROPOSAL.html README.txt RELEASE-NOTES.html
PORTDOCS=	apidocs ${OTHERDOCS}
.endif
JARFILE=	${PORTNAME}-${PORTVERSION}.jar
DESTJARFILE=	${PORTNAME}.jar
PLIST_FILES+=	%%JAVAJARDIR%%/${DESTJARFILE}

NO_STAGE=	yes
.include <bsd.port.pre.mk>

JDK_API!=	(${FIND} -s ${LOCALBASE}/share/doc/jdk1.? -maxdepth 1 -name api -type d 2>/dev/null || ${ECHO_CMD}) | ${TAIL} -n 1
.if ${JDK_API} != ""
MAKE_ARGS+=	-Djavadoc.links=${JDK_API}
.endif

do-install:
	@${ECHO_MSG} -n ">> Installing JAR as ${JAVAJARDIR}/${DESTJARFILE}..."
	@${MKDIR} ${JAVAJARDIR}
	@${INSTALL_DATA} ${WRKSRC}/build/${JARFILE} ${JAVAJARDIR}/${DESTJARFILE}
	@${ECHO_MSG} " [ DONE ]"

.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC}/build/docs && ${FIND} apidocs \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR} > /dev/null 2>&1
	@${INSTALL_DATA} ${OTHERDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.post.mk>
