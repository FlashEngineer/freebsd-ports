# Created by: Phillip Neumann <pneumann@gmail.com>
# $FreeBSD$

PORTNAME=	rabbitmq
PORTVERSION=	3.2.3
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://www.rabbitmq.com/releases/rabbitmq-server/v${PORTVERSION}/
DISTNAME=	${PORTNAME}-server-${PORTVERSION}

MAINTAINER=	olgeni@FreeBSD.org
COMMENT=	RabbitMQ is an implementation of AMQP

LICENSE=	MPL

BUILD_DEPENDS=	erl:${PORTSDIR}/lang/erlang \
		${PYTHON_PKGNAMEPREFIX}simplejson>=2.0:${PORTSDIR}/devel/py-simplejson \
		xmlto:${PORTSDIR}/textproc/xmlto \
		unzip:${PORTSDIR}/archivers/unzip \
		zip:${PORTSDIR}/archivers/zip
RUN_DEPENDS=	erl:${PORTSDIR}/lang/erlang

USES=		gmake shebangfix
USE_PYTHON_BUILD=yes
USE_RC_SUBR=	rabbitmq
SHEBANG_FILES=	calculate-relative plugins-src/rabbitmq-amqp1.0/codegen.py
python_OLD_CMD=	.*python
python_CMD=	${PYTHON_CMD}

USERS=		rabbitmq
GROUPS=		rabbitmq

PLIST_SUB=	VERSION=${PORTVERSION}

SCRIPTS_DIR=	${WRKSRC}/scripts/
MAKE_ARGS+=	PYTHON=${PYTHON_CMD}
MAKE_ENV+=	TARGET_DIR="${STAGEDIR}${PREFIX}/lib/erlang/lib/rabbitmq_server-${PORTVERSION}" \
		SBIN_DIR="${STAGEDIR}${PREFIX}/sbin/" \
		MAN_DIR="${STAGEDIR}${PREFIX}/man" \
		DOC_INSTALL_DIR="${STAGEDIR}${EXAMPLESDIR}"

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/rabbitmq|${PREFIX}/etc/rabbitmq|g ; s|/var/lib|/var/db|g ; s|erl|${LOCALBASE}/bin/erl|g' \
		${SCRIPTS_DIR}/rabbitmq-server ${SCRIPTS_DIR}/rabbitmqctl \
		${SCRIPTS_DIR}/rabbitmq-env ${SCRIPTS_DIR}/rabbitmq-plugins \
		${SCRIPTS_DIR}/rabbitmq-defaults
	@${REINPLACE_CMD} -e 's|VERSION=0.0.0|VERSION=${PORTVERSION}|g' \
		${WRKSRC}/plugins-src/rabbitmq-erlang-client/Makefile \
		${WRKSRC}/plugins-src/release.mk
	@${REINPLACE_CMD} -e 's|VERSION:=0.0.0|VERSION:=${PORTVERSION}|g' \
		${WRKSRC}/plugins-src/Makefile
	@${REINPLACE_CMD} -e 's|VERSION?=0.0.0|VERSION?=${PORTVERSION}|g' \
		${WRKSRC}/Makefile
	@${FIND} ${WRKSRC} -name "*.bak" -delete

post-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/etc/rabbitmq
	@${MKDIR} ${STAGEDIR}/var/db/rabbitmq/mnesia
	@${MKDIR} ${STAGEDIR}/var/log/rabbitmq

.include <bsd.port.mk>
