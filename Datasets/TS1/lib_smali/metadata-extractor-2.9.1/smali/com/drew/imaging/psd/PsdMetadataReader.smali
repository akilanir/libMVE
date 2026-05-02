.class public Lcom/drew/imaging/psd/PsdMetadataReader;
.super Ljava/lang/Object;
.source "PsdMetadataReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readMetadata(Ljava/io/File;)Lcom/drew/metadata/Metadata;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    new-instance v0, Lcom/drew/metadata/Metadata;

    invoke-direct {v0}, Lcom/drew/metadata/Metadata;-><init>()V

    .line 43
    .local v0, "metadata":Lcom/drew/metadata/Metadata;
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 45
    .local v1, "stream":Ljava/io/InputStream;
    :try_start_a
    new-instance v2, Lcom/drew/metadata/photoshop/PsdReader;

    invoke-direct {v2}, Lcom/drew/metadata/photoshop/PsdReader;-><init>()V

    new-instance v3, Lcom/drew/lang/StreamReader;

    invoke-direct {v3, v1}, Lcom/drew/lang/StreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v2, v3, v0}, Lcom/drew/metadata/photoshop/PsdReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V
    :try_end_17
    .catchall {:try_start_a .. :try_end_17} :catchall_23

    .line 47
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 49
    new-instance v2, Lcom/drew/metadata/file/FileMetadataReader;

    invoke-direct {v2}, Lcom/drew/metadata/file/FileMetadataReader;-><init>()V

    invoke-virtual {v2, p0, v0}, Lcom/drew/metadata/file/FileMetadataReader;->read(Ljava/io/File;Lcom/drew/metadata/Metadata;)V

    .line 50
    return-object v0

    .line 47
    :catchall_23
    move-exception v2

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v2
.end method

.method public static readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    .registers 4
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 56
    new-instance v0, Lcom/drew/metadata/Metadata;

    invoke-direct {v0}, Lcom/drew/metadata/Metadata;-><init>()V

    .line 57
    .local v0, "metadata":Lcom/drew/metadata/Metadata;
    new-instance v1, Lcom/drew/metadata/photoshop/PsdReader;

    invoke-direct {v1}, Lcom/drew/metadata/photoshop/PsdReader;-><init>()V

    new-instance v2, Lcom/drew/lang/StreamReader;

    invoke-direct {v2, p0}, Lcom/drew/lang/StreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1, v2, v0}, Lcom/drew/metadata/photoshop/PsdReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V

    .line 58
    return-object v0
.end method
