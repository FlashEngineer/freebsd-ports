# Created by: Alexander Logvinov <ports@logvinov.com>
# $FreeBSD$

PORTNAME=	libssh
DISTVERSION=	0.6.0
CATEGORIES=	security devel
MASTER_SITES=	http://git.libssh.org/projects/libssh.git/snapshot/ \
		LOCAL/fluffy

MAINTAINER=	fluffy@FreeBSD.org
COMMENT=	Library implementing the SSH1 and SSH2 protocol

OPTIONS_DEFINE=	SSH1
OPTIONS_RADIO=	CRYPTO
OPTIONS_RADIO_CRYPTO=	GCRYPT OPENSSL
OPTIONS_DEFAULT=	OPENSSL
OPTIONS_SUB=	yes

USE_BZIP2=	yes
USES=		cmake
CMAKE_SOURCE_PATH=	${WRKSRC}
CONFIGURE_WRKSRC=	${CMAKE_SOURCE_PATH}/build
BUILD_WRKSRC=		${CONFIGURE_WRKSRC}
INSTALL_WRKSRC?=	${BUILD_WRKSRC}
CMAKE_ARGS+=	-DWITH_STATIC_LIB:BOOL=ON
USE_LDCONFIG=	yes

LICENSE=	LGPL21
LICENSE_FILE=	${WRKSRC}/COPYING

GCRYPT_LIB_DEPENDS=	libgcrypt.so:${PORTSDIR}/security/libgcrypt
GCRYPT_CMAKE_ON=	-DWITH_GCRYPT:BOOL=ON
GCRYPT_CMAKE_OFF=	-DWITH_GCRYPT:BOOL=OFF

OPENSSL_USE=		openssl=yes
OPENSSL_CMAKE_ON=	-DWITH_OPENSSL:BOOL=ON
OPENSSL_CMAKE_OFF=	-DWITH_OPENSSL:BOOL=OFF

SSH1_DESC=		Build with SSH1 support
SSH1_CMAKE_ON=		-DWITH_SSH1:BOOL=ON
SSH1_CMAKE_OFF=		-DWITH_SSH1:BOOL=OFF

.include <bsd.port.options.mk>

post-patch:
	@${RM} ${PATCH_WRKSRC}/cmake/Modules/UseDoxygen.cmake
	@${REINPLACE_CMD} -e '/add_subdirectory.*s)/d' \
		-e 's|LIB_INSTALL_DIR}|CMAKE_INSTALL_PREFIX}/libdata|' \
		-e 's|CMAKE_INSTALL_DIR}|CMAKE_INSTALL_DIR}/libssh|' \
		${PATCH_WRKSRC}/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|CMAKE_HAVE_THREADS_LIBRARY|CMAKE_USE_PTHREADS_INIT|' \
		${PATCH_WRKSRC}/src/threads/CMakeLists.txt \
		${PATCH_WRKSRC}/src/CMakeLists.txt
	@${REINPLACE_CMD} -e 's|-lssh_threads|-lssh_threads ${PTHREAD_LIBS}|' \
		-e 's|$${INCLUDE_INSTALL_DIR}|$${INCLUDE_INSTALL_DIR} ${PTHREAD_CFLAGS}|' \
		${PATCH_WRKSRC}/libssh_threads.pc.cmake

.include <bsd.port.mk>
