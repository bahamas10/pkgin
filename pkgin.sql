CREATE TABLE IF NOT EXISTS [PKGDB] (
	"PKGDB_MTIME" INTEGER
);

CREATE TABLE IF NOT EXISTS [REPOS] (
	"REPO_URL" TEXT UNIQUE,
	"REPO_MTIME" INTEGER
);

CREATE TABLE IF NOT EXISTS [REMOTE_PKG] (
    "PKG_ID" INTEGER PRIMARY KEY,
    "PKGNAME" TEXT UNIQUE,
    "PKGVERS" TEXT UNIQUE,
    "COMMENT" TEXT ,
    "LICENSE" TEXT NULL,
    "PKGTOOLS_VERSION" TEXT ,
    "HOMEPAGE" TEXT NULL,
    "OS_VERSION" TEXT ,
    "DESCRIPTION" TEXT ,
    "PKGPATH" TEXT ,
    "PKG_OPTIONS" TEXT NULL,
    "CATEGORIES" TEXT ,
    "SIZE_PKG" TEXT ,
    "FILE_SIZE" TEXT ,
    "OPSYS" TEXT,
	"REPOSITORY" TEXT 
);

CREATE TABLE IF NOT EXISTS [LOCAL_PKG] (
    "PKG_ID" INTEGER PRIMARY KEY,
    "PKGNAME" TEXT UNIQUE,
    "PKGVERS" TEXT UNIQUE,
    "COMMENT" TEXT ,
    "LICENSE" TEXT NULL,
    "PKGTOOLS_VERSION" TEXT ,
    "HOMEPAGE" TEXT NULL,
    "OS_VERSION" TEXT ,
    "DESCRIPTION" TEXT ,
    "PKGPATH" TEXT ,
    "PKG_OPTIONS" TEXT NULL,
    "CATEGORIES" TEXT ,
    "SIZE_PKG" TEXT ,
    "FILE_SIZE" TEXT ,
    "OPSYS" TEXT,
	"PKG_KEEP" INTEGER NULL
);

CREATE TABLE IF NOT EXISTS [LOCAL_DEPS] (
[LOCAL_DEPS_ID] INTEGER  PRIMARY KEY AUTOINCREMENT ,
[PKG_ID] INTEGER  ,
[LOCAL_DEPS_PKGNAME] TEXT,  
[LOCAL_DEPS_DEWEY] TEXT  
);
CREATE TABLE IF NOT EXISTS [REMOTE_DEPS] (
[REMOTE_DEPS_ID] INTEGER  PRIMARY KEY AUTOINCREMENT ,
[PKG_ID] INTEGER  ,
[REMOTE_DEPS_PKGNAME] TEXT,
[REMOTE_DEPS_DEWEY] TEXT  
);

CREATE TABLE IF NOT EXISTS [LOCAL_CONFLICTS] (
[LOCAL_CONFLICTS_ID] INTEGER  PRIMARY KEY AUTOINCREMENT ,
[PKG_ID] INTEGER  ,
[LOCAL_CONFLICTS_PKGNAME] TEXT  
);
CREATE TABLE IF NOT EXISTS [REMOTE_CONFLICTS] (
[REMOTE_CONFLICTS_ID] INTEGER  PRIMARY KEY AUTOINCREMENT ,
[PKG_ID] INTEGER  ,
[REMOTE_CONFLICTS_PKGNAME] TEXT  
);

CREATE TABLE IF NOT EXISTS [LOCAL_REQUIRES] (
[LOCAL_REQUIRES_ID] INTEGER  PRIMARY KEY AUTOINCREMENT ,
[PKG_ID] INTEGER  ,
[LOCAL_REQUIRES_PKGNAME] TEXT  
);
CREATE TABLE IF NOT EXISTS [REMOTE_REQUIRES] (
[REMOTE_REQUIRES_ID] INTEGER  PRIMARY KEY AUTOINCREMENT ,
[PKG_ID] INTEGER  ,
[REMOTE_REQUIRES_PKGNAME] TEXT  
);

CREATE TABLE IF NOT EXISTS [LOCAL_PROVIDES] (
[LOCAL_PROVIDES_ID] INTEGER  PRIMARY KEY AUTOINCREMENT ,
[PKG_ID] INTEGER  ,
[LOCAL_PROVIDES_PKGNAME] TEXT  
);
CREATE TABLE IF NOT EXISTS [REMOTE_PROVIDES] (
[REMOTE_PROVIDES_ID] INTEGER  PRIMARY KEY AUTOINCREMENT ,
[PKG_ID] INTEGER  ,
[REMOTE_PROVIDES_PKGNAME] TEXT  
);

CREATE INDEX IF NOT EXISTS [idx_remote_pkg_category] ON [REMOTE_PKG](
[CATEGORIES]  ASC
);
CREATE INDEX IF NOT EXISTS [idx_remote_pkg_comment] ON [REMOTE_PKG](
[COMMENT]  ASC
);
CREATE INDEX IF NOT EXISTS [idx_remote_pkg_description] ON [REMOTE_PKG](
[DESCRIPTION]  ASC
);
CREATE INDEX IF NOT EXISTS [idx_remote_pkg_name] ON [REMOTE_PKG](
[PKGNAME]  ASC
);
CREATE INDEX IF NOT EXISTS [idx_local_pkg_category] ON [LOCAL_PKG](
[CATEGORIES]  ASC
);
CREATE INDEX IF NOT EXISTS [idx_local_pkg_comment] ON [LOCAL_PKG](
[COMMENT]  ASC
);
CREATE INDEX IF NOT EXISTS [idx_local_pkg_description] ON [LOCAL_PKG](
[DESCRIPTION]  ASC
);
CREATE INDEX IF NOT EXISTS [idx_local_pkg_name] ON [LOCAL_PKG](
[PKGNAME]  ASC
);

CREATE UNIQUE INDEX IF NOT EXISTS [idx_local_deps_pkg_id_pkg_name] ON [LOCAL_DEPS](
[PKG_ID]  ASC,
[LOCAL_DEPS_PKGNAME]  ASC
);
CREATE UNIQUE INDEX IF NOT EXISTS [idx_remote_deps_pkg_id_remote_pkg_name] ON [REMOTE_DEPS](
[PKG_ID]  ASC,
[REMOTE_DEPS_PKGNAME]  ASC
);

CREATE UNIQUE INDEX IF NOT EXISTS [idx_local_conflicts_pkg_id_local_pkg_name] ON [LOCAL_CONFLICTS](
[PKG_ID]  ASC,
[LOCAL_CONFLICTS_PKGNAME]  ASC
);
CREATE UNIQUE INDEX IF NOT EXISTS [idx_remote_conflicts_pkg_id_remote_pkg_name] ON [REMOTE_CONFLICTS](
[PKG_ID]  ASC,
[REMOTE_CONFLICTS_PKGNAME]  ASC
);

CREATE UNIQUE INDEX IF NOT EXISTS [idx_local_requires_pkg_id_local_pkg_name] ON [LOCAL_REQUIRES](
[PKG_ID]  ASC,
[LOCAL_REQUIRES_PKGNAME]  ASC
);
CREATE UNIQUE INDEX IF NOT EXISTS [idx_remote_requires_pkg_id_remote_pkg_name] ON [REMOTE_REQUIRES](
[PKG_ID]  ASC,
[REMOTE_REQUIRES_PKGNAME]  ASC
);

CREATE UNIQUE INDEX IF NOT EXISTS [idx_local_provides_pkg_id_local_pkg_name] ON [LOCAL_PROVIDES](
[PKG_ID]  ASC,
[LOCAL_PROVIDES_PKGNAME]  ASC
);
CREATE UNIQUE INDEX IF NOT EXISTS [idx_remote_provides_pkg_id_remote_pkg_name] ON [REMOTE_PROVIDES](
[PKG_ID]  ASC,
[REMOTE_PROVIDES_PKGNAME]  ASC
);
