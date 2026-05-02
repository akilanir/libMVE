.class public Lorg/osmdroid/tileprovider/modules/ArchiveFileFactory;
.super Ljava/lang/Object;
.source "ArchiveFileFactory.java"


# static fields
.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const-class v0, Lorg/osmdroid/tileprovider/modules/ArchiveFileFactory;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lorg/osmdroid/tileprovider/modules/ArchiveFileFactory;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getArchiveFile(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/IArchiveFile;
    .registers 4
    .param p0, "pFile"    # Ljava/io/File;

    .prologue
    .line 21
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".zip"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 23
    :try_start_c
    invoke-static {p0}, Lorg/osmdroid/tileprovider/modules/ZipFileArchive;->getZipFileArchive(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/ZipFileArchive;
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_f} :catch_11

    move-result-object v1

    .line 53
    :goto_10
    return-object v1

    .line 24
    :catch_11
    move-exception v0

    .line 25
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lorg/osmdroid/tileprovider/modules/ArchiveFileFactory;->logger:Lorg/slf4j/Logger;

    const-string v2, "Error opening ZIP file"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    .end local v0    # "e":Ljava/io/IOException;
    :cond_19
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".sqlite"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_32

    .line 31
    :try_start_25
    invoke-static {p0}, Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;->getDatabaseFileArchive(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/DatabaseFileArchive;
    :try_end_28
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_25 .. :try_end_28} :catch_2a

    move-result-object v1

    goto :goto_10

    .line 32
    :catch_2a
    move-exception v0

    .line 33
    .local v0, "e":Landroid/database/sqlite/SQLiteException;
    sget-object v1, Lorg/osmdroid/tileprovider/modules/ArchiveFileFactory;->logger:Lorg/slf4j/Logger;

    const-string v2, "Error opening SQL file"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 37
    .end local v0    # "e":Landroid/database/sqlite/SQLiteException;
    :cond_32
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".mbtiles"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 39
    :try_start_3e
    invoke-static {p0}, Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;->getDatabaseFileArchive(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/MBTilesFileArchive;
    :try_end_41
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3e .. :try_end_41} :catch_43

    move-result-object v1

    goto :goto_10

    .line 40
    :catch_43
    move-exception v0

    .line 41
    .restart local v0    # "e":Landroid/database/sqlite/SQLiteException;
    sget-object v1, Lorg/osmdroid/tileprovider/modules/ArchiveFileFactory;->logger:Lorg/slf4j/Logger;

    const-string v2, "Error opening MBTiles SQLite file"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .end local v0    # "e":Landroid/database/sqlite/SQLiteException;
    :cond_4b
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".gemf"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_64

    .line 47
    :try_start_57
    invoke-static {p0}, Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;->getGEMFFileArchive(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_5a} :catch_5c

    move-result-object v1

    goto :goto_10

    .line 48
    :catch_5c
    move-exception v0

    .line 49
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lorg/osmdroid/tileprovider/modules/ArchiveFileFactory;->logger:Lorg/slf4j/Logger;

    const-string v2, "Error opening GEMF file"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .end local v0    # "e":Ljava/io/IOException;
    :cond_64
    const/4 v1, 0x0

    goto :goto_10
.end method
