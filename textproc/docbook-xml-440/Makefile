# Created by: Sergey Skvortsov <skv@protey.ru>
# $FreeBSD$

PORTNAME=	docbook-xml
PORTVERSION=	4.4
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	http://www.oasis-open.org/docbook/xml/${PORTVERSION}/
PKGNAMESUFFIX=	44
EXTRACT_SUFX=	.zip

MAINTAINER=	ports@FreeBSD.org
COMMENT=	DocBook/XML DTD V4.4, designed for technical documentation

RUN_DEPENDS=	${XMLCATMGR}:${PORTSDIR}/textproc/xmlcatmgr

NO_BUILD=	yes
NO_WRKSUBDIR=	yes
PLIST=		${WRKSRC}/pkg-plist

XMLCATBASE=	share/xml
DTD_NAME=	docbook
DTD_VERSION=	${PORTVERSION}

XMLCATMGR=	${LOCALBASE}/bin/xmlcatmgr
CATALOG_PORTS_XML=	${PREFIX}/${XMLCATBASE}/catalog.ports
REGIST_CAT_FLAGS_XML=	-c ${CATALOG_PORTS_XML} \
			add nextCatalog ${DTD_NAME}/${DTD_VERSION}/catalog.xml
UNREGIST_CAT_FLAGS_XML=	-c ${CATALOG_PORTS_XML} \
			remove nextCatalog ${DTD_NAME}/${DTD_VERSION}/catalog.xml

DOC_FILES=	ChangeLog README
DTDDIR=		${XMLCATBASE}/${DTD_NAME}/${DTD_VERSION}
DTD_FILES=	calstblx.dtd catalog.xml dbcentx.mod dbgenent.mod \
		dbhierx.mod dbnotnx.mod dbpoolx.mod docbook.cat docbookx.dtd \
		htmltblx.mod soextblx.dtd
ENTDIR=		${DTDDIR}/ent
ENT_FILES=	isoamsa.ent isoamsb.ent isoamsc.ent isoamsn.ent \
		isoamso.ent isoamsr.ent isobox.ent isocyr1.ent \
		isocyr2.ent isodia.ent isogrk1.ent isogrk2.ent \
		isogrk3.ent isogrk4.ent isolat1.ent isolat2.ent \
		isonum.ent isopub.ent isotech.ent

OPTIONS_DEFINE=	DOCS

pre-install:
	@${RM} -f ${PLIST}
.for F in ${ENT_FILES}
	@${ECHO_CMD} "${ENTDIR}/${F}" >> ${PLIST}
.endfor
	@${ECHO_CMD} "@dirrm ${ENTDIR}" >> ${PLIST}
.for F in ${DTD_FILES}
	@${ECHO_CMD} "${DTDDIR}/${F}" >> ${PLIST}
.endfor
	@${ECHO_CMD} "@dirrm ${DTDDIR}" >> ${PLIST}
	@${ECHO_CMD} "@dirrmtry ${XMLCATBASE}/${DTD_NAME}" >> ${PLIST}
.for F in ${DOC_FILES}
	@${ECHO_CMD} "%%PORTDOCS%%${DOCSDIR:S!^${PREFIX}/!!}/${F}.${PORTVERSION}" >> ${PLIST}
.endfor
	@${ECHO_CMD} "%%PORTDOCS%%@dirrmtry ${DOCSDIR:S!^${PREFIX}/!!}" >> ${PLIST}
	@${ECHO_CMD} "@exec ${XMLCATMGR} ${REGIST_CAT_FLAGS_XML}" >> ${PLIST}
	@${ECHO_CMD} "@unexec ${XMLCATMGR} ${UNREGIST_CAT_FLAGS_XML}" >> ${PLIST}

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/${DTDDIR}
	${INSTALL_DATA} ${DTD_FILES:S!^!${WRKSRC}/!} ${STAGEDIR}${PREFIX}/${DTDDIR}
	${MKDIR} ${STAGEDIR}${PREFIX}/${ENTDIR}
	${INSTALL_DATA} ${ENT_FILES:S!^!${WRKSRC}/ent/!} ${STAGEDIR}${PREFIX}/${ENTDIR}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
.for F in ${DOC_FILES}
	${INSTALL_DATA} ${WRKSRC}/${F} ${STAGEDIR}${DOCSDIR}/${F}.${PORTVERSION}
.endfor

.include <bsd.port.mk>
