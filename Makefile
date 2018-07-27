# $OpenBSD: $

COMMENT =	Dash reinventing cryptocurrency

VER =		0.12.3.2
DISTNAME =	dashcore-${VER}
PKGNAME =	dash-${VER}
CATEGORIES =	coin
MASTER_SITES =	https://github.com/dashpay/dash/releases/download/v${VER}/
EXTRACT_SUFX =	.tar.gz

HOMEPAGE =	https://github.com/dashpay/dash/

MAINTAINER =	Thomas de Grivel <thoxdg@gmail.com>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += ${COMPILER_LIBCXX} event m

COMPILER = ports-gcc

CONFIGURE_STYLE =	gnu

CONFIGURE_ARGS =	--with-gui=no \
			--with-unsupported-ssl \
			CXXFLAGS="-O2 -pipe -I/usr/local/include/db4.8 -I/usr/local/include" \
			LIBS="-L/usr/local/lib/db4.8 -ldb_cxx-4.8" \
			CC=egcc CXX=eg++

MAKE_ENV =		AUTOCONF_VERSION=2.69 \
			AUTOMAKE_VERSION=1.15

USE_GMAKE = Yes

WRKDIST = ${WRKDIR}/dashcore-0.12.3

.include <bsd.port.mk>
