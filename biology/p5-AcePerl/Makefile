# Created by: Johann Visagie <johann@egenetics.com>
# $FreeBSD$

PORTNAME=	AcePerl
PORTVERSION=	1.92
PORTREVISION=	2
CATEGORIES=	biology databases perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	Ace
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Perl5 interface to the ACEDB genome database system

RUN_DEPENDS=	p5-Cache-Cache>=0:${PORTSDIR}/devel/p5-Cache-Cache
BUILD_DEPENDS:=	${RUN_DEPENDS}

MAKE_JOBS_UNSAFE=  yes

USES=		perl5
USE_PERL5=	configure

MAN1=		ace.pl.1
MAN3=		Ace.3 Ace::Browser::AceSubs.3 Ace::Browser::SearchSubs.3 \
		Ace::Browser::SiteDefs.3 Ace::Graphics::Fk.3 \
		Ace::Graphics::Glyph.3 Ace::Graphics::Glyph::anchored_arrow.3 \
		Ace::Graphics::Glyph::arrow.3 Ace::Graphics::Glyph::box.3 \
		Ace::Graphics::Glyph::dot.3 Ace::Graphics::Glyph::ex.3 \
		Ace::Graphics::Glyph::graded_segments.3 \
		Ace::Graphics::Glyph::group.3 Ace::Graphics::Glyph::line.3 \
		Ace::Graphics::Glyph::primers.3 \
		Ace::Graphics::Glyph::segments.3 Ace::Graphics::Glyph::span.3 \
		Ace::Graphics::Glyph::toomany.3 \
		Ace::Graphics::Glyph::transcript.3 \
		Ace::Graphics::Glyph::triangle.3 \
		Ace::Graphics::GlyphFactory.3 Ace::Graphics::Panel.3 \
		Ace::Graphics::Track.3 Ace::Iterator.3 Ace::Local.3 \
		Ace::Model.3 Ace::Object.3 Ace::Sequence.3 \
		Ace::Sequence::Feature.3 Ace::Sequence::FeatureList.3 \
		Ace::Sequence::GappedAlignment.3 Ace::Sequence::Gene.3 \
		Ace::Sequence::Homol.3 Ace::Sequence::Multi.3 \
		Ace::Sequence::Transcript.3

NO_STAGE=	yes
.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64" || ${ARCH} == "ia64"
CFLAGS+=	-fPIC
.endif

post-patch:
	@ ${SED} -e 's|XX__CC__XX|${CC}|' < ${FILESDIR}/FREEBSD_DEF \
	  > ${WRKSRC}/acelib/wmake/FREEBSD_DEF

.include <bsd.port.post.mk>
