# Created by: gahr
# $FreeBSD$

PORTNAME=	codelite
DISTVERSION=	5.4
CATEGORIES=	editors devel

MAINTAINER=	gahr@FreeBSD.org
COMMENT=	An Open Source IDE for C/C++

LICENSE=	GPLv2

LIB_DEPENDS=	libcurl.so:${PORTSDIR}/ftp/curl
RUN_DEPENDS=	xterm:${PORTSDIR}/x11/xterm

OPTIONS_DEFINE=	CSCOPE CLANG NLS
CSCOPE_DESC=	CScope integration
CLANG_DESC=	Clang code-completion
OPTIONS_SUB=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	eranif
GH_PROJECT=	${PORTNAME}
GH_COMMIT=	41e98e5
GH_TAGNAME=	5.4

USE_WX=		3.0
WX_UNICODE=	yes
USES=		gettext cmake:outsource dos2unix shebangfix
DOS2UNIX_GLOB=	*.cpp *.txt
USE_LDCONFIG=	${PREFIX}/lib/codelite
SHEBANG_FILES=	Runtime/clg++ Runtime/clgcc

CXXFLAGS+=	-I${LOCALBASE}/include
CMAKE_ARGS+=	-DIS_FREEBSD=1 \
		-DPREFIX=${PREFIX}

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MCSCOPE}
RUN_DEPENDS+=	cscope:${PORTSDIR}/devel/cscope
.endif

.if ${PORT_OPTIONS:MCLANG}
BUILD_DEPENDS+=	${LOCALBASE}/llvm-devel/lib/libclang.so:${PORTSDIR}/lang/clang-devel
RUN_DEPENDS+=	${LOCALBASE}/llvm-devel/lib/libclang.so:${PORTSDIR}/lang/clang-devel
CMAKE_ARGS+=	-DENABLE_CLANG=1
.else
CMAKE_ARGS+=	-DENABLE_CLANG=0
.endif

post-patch:
#	Use the correct wx-config
	${REINPLACE_CMD} -e \
	    's|wx-config|${WX_CONFIG}|; \
	     s|%%LOCALBASE%%|${LOCALBASE}|g; \
	     s|%%PREFIX%%|${PREFIX}|g; \
	     /IS_FREEBSD/s|0|1|' \
	    ${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
