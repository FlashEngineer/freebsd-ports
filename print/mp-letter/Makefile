# Created by: David O'Brien <obrien@cs.ucdavis.edu>
# $FreeBSD$

PORTNAME=	mp-${PAPERSIZE}
PORTVERSION=	3.0.1
CATEGORIES=	print
MASTER_SITES=	ftp://relay.NUXI.org/pub/misc/ \
		ftp://ftp.netsw.org/system/tools/print/ \
#		ftp://ftp.fu-berlin.de/unix/tools/mp/
#		ftp://ftp.inria.fr/system/user/
DISTNAME=	mp-3.0.1

MAINTAINER=	obrien@FreeBSD.org
COMMENT=	A PostScript printing util for ASCII files, email, USENET news articles, etc

WRKSRC=		${WRKDIR}/mp
MAN1=		mp.1
MLINKS=		mp.1 digestp.1	- filep.1	- filofaxp.1 \
		- franklinp.1	- mailp.1	- newsp.1 \
		- timemanp.1	- timesysp.1

PAPERSIZE?=	letter
.if ${PAPERSIZE:L} == a4
INSTALL_TARGET=	install-a4
.endif

NO_STAGE=	yes
pre-patch:
	@${CP} ${WRKSRC}/Makefile.dist ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's/<iostream\.h>/<iostream>using namespace std;/' \
		-e 's/enum action_type/action_type/g' \
		-e 's/enum text_type/text_type/g' \
	    ${WRKSRC}/header.cc ${WRKSRC}/input.cc ${WRKSRC}/main.cc \
	    ${WRKSRC}/print.cc ${WRKSRC}/print.hh

.include <bsd.port.mk>
