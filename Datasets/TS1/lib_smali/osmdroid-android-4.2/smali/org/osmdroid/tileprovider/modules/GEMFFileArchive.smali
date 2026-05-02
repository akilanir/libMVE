.class public Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;
.super Ljava/lang/Object;
.source "GEMFFileArchive.java"

# interfaces
.implements Lorg/osmdroid/tileprovider/modules/IArchiveFile;


# instance fields
.field private final mFile:Lorg/osmdroid/util/GEMFFile;


# direct methods
.method private constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "pFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Lorg/osmdroid/util/GEMFFile;

    invoke-direct {v0, p1}, Lorg/osmdroid/util/GEMFFile;-><init>(Ljava/io/File;)V

    iput-object v0, p0, Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;->mFile:Lorg/osmdroid/util/GEMFFile;

    .line 18
    return-void
.end method

.method public static getGEMFFileArchive(Ljava/io/File;)Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;
    .registers 2
    .param p0, "pFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21
    new-instance v0, Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;

    invoke-direct {v0, p0}, Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;-><init>(Ljava/io/File;)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 32
    :try_start_0
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;->mFile:Lorg/osmdroid/util/GEMFFile;

    invoke-virtual {v0}, Lorg/osmdroid/util/GEMFFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 34
    :goto_5
    return-void

    .line 33
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method public getInputStream(Lorg/osmdroid/tileprovider/tilesource/ITileSource;Lorg/osmdroid/tileprovider/MapTile;)Ljava/io/InputStream;
    .registers 7
    .param p1, "pTileSource"    # Lorg/osmdroid/tileprovider/tilesource/ITileSource;
    .param p2, "pTile"    # Lorg/osmdroid/tileprovider/MapTile;

    .prologue
    .line 26
    iget-object v0, p0, Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;->mFile:Lorg/osmdroid/util/GEMFFile;

    invoke-virtual {p2}, Lorg/osmdroid/tileprovider/MapTile;->getX()I

    move-result v1

    invoke-virtual {p2}, Lorg/osmdroid/tileprovider/MapTile;->getY()I

    move-result v2

    invoke-virtual {p2}, Lorg/osmdroid/tileprovider/MapTile;->getZoomLevel()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lorg/osmdroid/util/GEMFFile;->getInputStream(III)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GEMFFileArchive [mGEMFFile="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/osmdroid/tileprovider/modules/GEMFFileArchive;->mFile:Lorg/osmdroid/util/GEMFFile;

    invoke-virtual {v1}, Lorg/osmdroid/util/GEMFFile;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
