# Created by: Eric F Crist <ecrist@secure-computing.net>
# $FreeBSD$

PORTNAME=	openvpn
DISTVERSION=	201326
CATEGORIES=	security net
MASTER_SITES=	ftp://ftp.secure-computing.net/pub/FreeBSD/ports/openvpn-devel/ \
		ftp://ftp2.secure-computing.net/pub/FreeBSD/ports/openvpn-devel/
PKGNAMESUFFIX=	-devel

MAINTAINER=	ecrist@secure-computing.net
COMMENT=	Secure IP/Ethernet tunnel daemon

LICENSE=	GPLv2

WRKSRC=		${WRKDIR}/${PORTNAME}${PKGNAMESUFFIX}

CONFLICTS_INSTALL=	openvpn-[0-9]* openvpn-beta-[0-9]*

GNU_CONFIGURE=	yes
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install mandir=${MANPREFIX}/man

MAN8=		openvpn.8

OPTIONS_DEFINE=	PW_SAVE SNAPPY LZO PKCS11 POLARSSL
PW_SAVE_DESC=	Interactive passwords may be read from a file
SNAPPY_DESC=	Enable the Snappy compression library
LZO_DESC=		Enable the LZO compression library
PKCS11_DESC=	Use security/pkcs11-helper
POLARSSL_DESC=	Build with PolarSSL instead of OpenSSL
OPTIONS_DEFAULT=	LZO SNAPPY

USE_RC_SUBR=	openvpn
USE_LDCONFIG=	${PREFIX}/lib

SUB_FILES=	pkg-message
SUB_LIST+=	OSVERSION=${OSVERSION}

.if defined(PACKAGE_BUILDING)
WITHOUT_CHECK=	yes
.endif

NO_STAGE=	yes
.include <bsd.port.options.mk>

.ifdef (LOG_OPENVPN)
CFLAGS+=	-DLOG_OPENVPN=${LOG_OPENVPN}
.endif

.if ${PORT_OPTIONS:MLZO}
LIB_DEPENDS+=	lzo2:${PORTSDIR}/archivers/lzo2
.else
CONFIGURE_ARGS+=	--disable-lzo
.endif

.if ${PORT_OPTIONS:MSNAPPY}
LIB_DEPENDS+=	snappy:${PORTSDIR}/archivers/snappy
.else
CONFIGURE_ARGS+=	--disable-snappy
.endif

.if ${PORT_OPTIONS:MPOLARSSL}
LIB_DEPENDS+=		polarssl:${PORTSDIR}/security/polarssl
CONFIGURE_ARGS+=	--with-crypto-library=polarssl
WITHOUT_CHECK=	yes
.else
USE_OPENSSL=	yes
.endif

pre-fetch:
.ifdef (LOG_OPENVPN)
	@${ECHO} "Building with LOG_OPENVPN=${LOG_OPENVPN}"
.else
	@${ECHO} ""
	@${ECHO} "You may use the following build options:"
	@${ECHO} ""
	@${ECHO} "      LOG_OPENVPN={Valid syslog facility}"
	@${ECHO} "      EXAMPLE:  make LOG_OPENVPN=LOG_DAEMON"
	@${ECHO} ""
.endif

.if ${PORT_OPTIONS:MPW_SAVE}
CONFIGURE_ARGS+=	--enable-password-save
.endif

.if ${PORT_OPTIONS:MPKCS11}
LIB_DEPENDS+=	pkcs11-helper:${PORTSDIR}/security/pkcs11-helper
.else
CONFIGURE_ARGS+=	--disable-pkcs11
.endif

post-patch:
	@${FIND} ${WRKSRC} -name \*.orig -delete
	@${FIND} ${WRKSRC} -name \*.bak -delete

post-build:
	cd ${WRKSRC}/src/plugins/down-root && ${MAKE}
	cd ${WRKSRC}/src/plugins/auth-pam && ${CC} ${CPPFLAGS} -I../../../include -DDLOPEN_PAM=0 ${CFLAGS} -fPIC -shared -Wl,-soname,openvpn-auth-pam.so -o openvpn-auth-pam.so auth-pam.c pamdl.c -lc -lpam
	@# self-tests here
.if !defined(WITHOUT_CHECK)
	cd ${WRKSRC} && ${MAKE} check
.endif

post-install:
	${MKDIR} ${PREFIX}/lib
	${LN} -s ${PREFIX}/lib/openvpn/plugins/openvpn-plugin-down-root.so ${PREFIX}/lib/openvpn-down-root.so
	${LN} -s ${PREFIX}/lib/openvpn/plugins/openvpn-plugin-auth-pam.so ${PREFIX}/lib/openvpn-auth-pam.so
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for docs in AUTHORS COPYING COPYRIGHT.GPL ChangeLog INSTALL \
	PORTS README
	${INSTALL_DATA} ${WRKSRC}/${docs} ${DOCSDIR}/
.endfor
.for sample in sample-config-files sample-scripts
	(cd ${WRKSRC}/sample/${sample} && ${COPYTREE_SHARE} \*  ${DOCSDIR}/${sample})
.endfor
.else
	-@${RMDIR} ${DOCSDIR}
.endif
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
