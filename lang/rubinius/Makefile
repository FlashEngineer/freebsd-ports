# Created by: stas
# $FreeBSD$

PORTNAME=	rubinius
PORTVERSION=	1.2.4
PORTREVISION=	2
CATEGORIES=	lang
MASTER_SITES=	ftp://ftp.SpringDaemons.com/soft/ \
		http://asset.rubini.us/prebuilt/:llvm
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${LLVMDIST}:llvm
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	LLVM based ruby language implementation

HAS_CONFIGURE=	yes
#execinfo is broken for unknow reason
CONFIGURE_ARGS=	--without-execinfo \
		-P "${PREFIX}" \
		-I "${PREFIX}/include/rubinius" \
		-L "${PREFIX}/lib/ruby/rubinius" \
		-G "${PREFIX}/lib/ruby/gems/rubinius" \
		-B "${PREFIX}/bin" \
		-M "${PREFIX}/man" \
		--sitedir "${PREFIX}/lib/ruby/site_ruby/rubinius" \
		--vendordir "${PREFIX}/lib/ruby/vendor_ruby/rubinius"

LLVMDIST=	llvm-2.8.tgz
USES=		perl5
USE_RUBY=	yes
RUBY_NO_RUN_DEPENDS=	yes
USE_RAKE=	yes
USE_PERL5=	build
USE_GMAKE=	yes
MAKE_JOBS_UNSAFE=	yes

OPTIONS_DEFINE=	GDBM
OPTIONS_DEFAULT=	GDBM
GDBM_DESC=	Enable GDBM support

NO_STAGE=	yes
.include <bsd.port.pre.mk>

.if ${ARCH} == "sparc64"
BROKEN=		Does not compile on sparc64
.endif

.if ${PORT_OPTIONS:MGDBM} || exists(${LOCALBASE}/include/gdbm.h)
LIB_DEPENDS=	gdbm.4:${PORTSDIR}/databases/gdbm
PLIST_SUB+=	GDBM=""
.else
PLIST_SUB+=	GDBM="@comment "
.endif

post-extract:
	@${MKDIR} ${WRKSRC}/vm/external_libs/prebuilt/
	@${CP} ${DISTDIR}/${LLVMDIST} ${WRKSRC}/vm/external_libs/prebuilt/${LLVMDIST}

do-build:
	@(cd ${WRKSRC}/; ${SETENV} ${MAKE_ENV} ${RAKE_BIN} build)

do-install:
	@(cd ${WRKSRC}/; ${SETENV} ${MAKE_ENV} ${RAKE_BIN} install)

pre-install:
	${MKDIR} ${PREFIX}/lib/ruby/site_ruby/rubinius
	${MKDIR} ${PREFIX}/lib/ruby/vendor_ruby/rubinius
	@${TOUCH} ${PREFIX}/lib/ruby/site_ruby/rubinius/.keep_me
	@${TOUCH} ${PREFIX}/lib/ruby/vendor_ruby/rubinius/.keep_me

plist:
	truncate -s0 pkg-plist
	@${ECHO_CMD} "bin/rbx" >> pkg-plist
#
# Includes
#
	@${FIND} -ds ${PREFIX}/include/rubinius ! -type d | \
		${SED} 's,^${PREFIX}/*,,' >> pkg-plist
	@${FIND} -ds ${PREFIX}/include/rubinius -type d | \
		${SED} 's,^${PREFIX}/*,@dirrm ,' >> pkg-plist
#
# Libs
#
	@${FIND} -ds ${PREFIX}/lib/ruby/rubinius ! -type d | \
		${SED} 's,^${PREFIX}/*,,' >> pkg-plist
	@${FIND} -ds ${PREFIX}/lib/ruby/rubinius -type d | \
		${SED} 's,^${PREFIX}/*,@dirrm ,' >> pkg-plist
#
# Gems
#
	@${FIND} -ds ${PREFIX}/lib/ruby/gems/rubinius ! -type d | \
		${SED} 's,^${PREFIX}/*,,' >> pkg-plist
	@${FIND} -ds ${PREFIX}/lib/ruby/gems/rubinius -type d | \
		${SED} 's,^${PREFIX}/*,@dirrm ,' >> pkg-plist
#
# Site libs and vendor libs
#
	@${FIND} -ds ${PREFIX}/lib/ruby/site_ruby/rubinius ! -type d | \
		${SED} 's,^${PREFIX}/*,,' >> pkg-plist
	@${FIND} -ds ${PREFIX}/lib/ruby/site_ruby/rubinius -type d | \
		${SED} 's,^${PREFIX}/*,@dirrm ,' >> pkg-plist
	@${FIND} -ds ${PREFIX}/lib/ruby/vendor_ruby/rubinius ! -type d | \
		${SED} 's,^${PREFIX}/*,,' >> pkg-plist
	@${FIND} -ds ${PREFIX}/lib/ruby/vendor_ruby/rubinius -type d | \
		${SED} 's,^${PREFIX}/*,@dirrm ,' >> pkg-plist
#
# Shared dirs
#
	@${ECHO_CMD} "@dirrmtry lib/ruby/site_ruby" >> pkg-plist
	@${ECHO_CMD} "@dirrmtry lib/ruby/vendor_ruby" >> pkg-plist
	@${ECHO_CMD} "@dirrmtry lib/ruby/gems" >> pkg-plist
	@${ECHO_CMD} "@dirrmtry lib/ruby" >> pkg-plist

.include <bsd.port.post.mk>
