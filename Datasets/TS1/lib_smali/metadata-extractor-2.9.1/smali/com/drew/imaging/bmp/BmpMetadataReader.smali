.class public Lcom/drew/imaging/bmp/BmpMetadataReader;
.super Ljava/lang/Object;
.source "BmpMetadataReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readMetadata(Ljava/io/File;)Lcom/drew/metadata/Metadata;
    .registers 4
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
    .line 41
    const/4 v0, 0x0

    .line 43
    .local v0, "stream":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_10

    .line 44
    .end local v0    # "stream":Ljava/io/FileInputStream;
    .local v1, "stream":Ljava/io/FileInputStream;
    :try_start_6
    invoke-static {v1}, Lcom/drew/imaging/bmp/BmpMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    :try_end_9
    .catchall {:try_start_6 .. :try_end_9} :catchall_17

    move-result-object v2

    .line 46
    if-eqz v1, :cond_f

    .line 47
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    :cond_f
    return-object v2

    .line 46
    .end local v1    # "stream":Ljava/io/FileInputStream;
    .restart local v0    # "stream":Ljava/io/FileInputStream;
    :catchall_10
    move-exception v2

    :goto_11
    if-eqz v0, :cond_16

    .line 47
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V

    :cond_16
    throw v2

    .line 46
    .end local v0    # "stream":Ljava/io/FileInputStream;
    .restart local v1    # "stream":Ljava/io/FileInputStream;
    :catchall_17
    move-exception v2

    move-object v0, v1

    .end local v1    # "stream":Ljava/io/FileInputStream;
    .restart local v0    # "stream":Ljava/io/FileInputStream;
    goto :goto_11
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
    .line 55
    new-instance v0, Lcom/drew/metadata/Metadata;

    invoke-direct {v0}, Lcom/drew/metadata/Metadata;-><init>()V

    .line 56
    .local v0, "metadata":Lcom/drew/metadata/Metadata;
    new-instance v1, Lcom/drew/metadata/bmp/BmpReader;

    invoke-direct {v1}, Lcom/drew/metadata/bmp/BmpReader;-><init>()V

    new-instance v2, Lcom/drew/lang/StreamReader;

    invoke-direct {v2, p0}, Lcom/drew/lang/StreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1, v2, v0}, Lcom/drew/metadata/bmp/BmpReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V

    .line 57
    return-object v0
.end method
