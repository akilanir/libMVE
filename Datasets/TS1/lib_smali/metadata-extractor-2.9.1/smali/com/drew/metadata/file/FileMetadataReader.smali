.class public Lcom/drew/metadata/file/FileMetadataReader;
.super Ljava/lang/Object;
.source "FileMetadataReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Ljava/io/File;Lcom/drew/metadata/Metadata;)V
    .registers 8
    .param p1, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_e

    .line 35
    new-instance v1, Ljava/io/IOException;

    const-string v2, "File object must reference a file"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 36
    :cond_e
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1c

    .line 37
    new-instance v1, Ljava/io/IOException;

    const-string v2, "File does not exist"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 38
    :cond_1c
    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v1

    if-nez v1, :cond_2a

    .line 39
    new-instance v1, Ljava/io/IOException;

    const-string v2, "File is not readable"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 41
    :cond_2a
    new-instance v0, Lcom/drew/metadata/file/FileMetadataDirectory;

    invoke-direct {v0}, Lcom/drew/metadata/file/FileMetadataDirectory;-><init>()V

    .line 43
    .local v0, "directory":Lcom/drew/metadata/file/FileMetadataDirectory;
    const/4 v1, 0x1

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/drew/metadata/file/FileMetadataDirectory;->setString(ILjava/lang/String;)V

    .line 44
    const/4 v1, 0x2

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lcom/drew/metadata/file/FileMetadataDirectory;->setLong(IJ)V

    .line 45
    const/4 v1, 0x3

    new-instance v2, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1, v2}, Lcom/drew/metadata/file/FileMetadataDirectory;->setDate(ILjava/util/Date;)V

    .line 47
    invoke-virtual {p2, v0}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 48
    return-void
.end method
