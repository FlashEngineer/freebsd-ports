# Created by: pst
# $FreeBSD$

PORTNAME=	pcnfsd
PORTVERSION=	93.02.16
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	http://www.tux.org/pub/net/lprng/TOOLS/PCNFSD/ \
		http://ftp.comp.hkbu.edu.hk/pub/packages/plp/LPRng/TOOLS/PCNFSD/ \
		http://www.cise.ufl.edu/mirrors/LPRng/UNIXTOOLS/PCNFSD/ \
		http://ftp.gwdg.de/linux/plp/LPRng/TOOLS/PCNFSD/ \
		http://www.lprng.com/DISTRIB/UNIXTOOLS/PCNFSD/ \
		http://ftp.st.ryukoku.ac.jp/pub/utils/print/LPRng/TOOLS/PCNFSD/
DISTNAME=	pcnfsd.93.02.16
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Sun PC NFS authentication and printing server

MAN8=		pcnfsd.8
MANCOMPRESSED=	maybe
PLIST_FILES=	libexec/rpc.pcnfsd

NO_WRKSUBDIR=

NO_STAGE=	yes
post-extract:
	${CP} ${FILESDIR}/Makefile.inc ${WRKSRC}

.include <bsd.port.mk>
