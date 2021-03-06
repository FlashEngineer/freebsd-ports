# Created by: Alexey Dokuchaev <danfe@FreeBSD.org>
# $FreeBSD$

PORTNAME=	eos-movrec
DISTVERSION=	0.3.2_beta
PORTREVISION=	1
CATEGORIES=	graphics multimedia
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${DISTVERSION}/

MAINTAINER=	nemysis@FreeBSD.org
COMMENT=	Capture short movies with Canon DSLR camera

LICENSE=	GPLv2

LIB_DEPENDS=	libgphoto2.so:${PORTSDIR}/graphics/libgphoto2

USE_BZIP2=	yes
USES=		cmake pkgconfig
USE_DOS2UNIX=	*.pro *.cpp *.h
USE_QT4=	qmake_build moc_build rcc_build uic_build gui

INSTALLS_ICONS=	yes
ICON_SIZES=	16x16 32x32 128x128 256x256 512x512

DESKTOP_ENTRIES="EOS Camera Movie Recorder" "${COMMENT}" "${PORTNAME}" \
		"eos_movrec" "Graphics;Photography;Qt;" false

post-patch:
	@${REINPLACE_CMD} -e 's|GLIBC|${OPSYS}|' ${WRKSRC}/os_api.h
.for s in 16 32 128 256 512
	@cd ${WRKSRC}/mac.icons && \
		${MV} ${s}.png ${PORTNAME}_${s}x${s}.png
.endfor

post-install:
.for s in ${ICON_SIZES}
	@${MKDIR} ${STAGEDIR}${PREFIX}/share/icons/hicolor/${s}/apps/
	${INSTALL_DATA} ${WRKSRC}/mac.icons/${PORTNAME}_${s}.png \
		${STAGEDIR}${PREFIX}/share/icons/hicolor/${s}/apps/${PORTNAME}.png
.endfor
	${LN} -sf ${PREFIX}/share/icons/hicolor/32x32/apps/${PORTNAME}.png \
		${STAGEDIR}${PREFIX}/share/pixmaps/

.include <bsd.port.mk>
