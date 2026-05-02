.class public Lcom/drew/imaging/webp/WebpMetadataReader;
.super Ljava/lang/Object;
.source "WebpMetadataReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
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
            Ljava/io/IOException;,
            Lcom/drew/imaging/riff/RiffProcessingException;
        }
    .end annotation

    .prologue
    .line 43
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 46
    .local v0, "inputStream":Ljava/io/InputStream;
    :try_start_5
    invoke-static {v0}, Lcom/drew/imaging/webp/WebpMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_15

    move-result-object v1

    .line 48
    .local v1, "metadata":Lcom/drew/metadata/Metadata;
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 50
    new-instance v2, Lcom/drew/metadata/file/FileMetadataReader;

    invoke-direct {v2}, Lcom/drew/metadata/file/FileMetadataReader;-><init>()V

    invoke-virtual {v2, p0, v1}, Lcom/drew/metadata/file/FileMetadataReader;->read(Ljava/io/File;Lcom/drew/metadata/Metadata;)V

    .line 51
    return-object v1

    .line 48
    .end local v1    # "metadata":Lcom/drew/metadata/Metadata;
    :catchall_15
    move-exception v2

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v2
.end method

.method public static readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    .registers 5
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/drew/imaging/riff/RiffProcessingException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Lcom/drew/metadata/Metadata;

    invoke-direct {v0}, Lcom/drew/metadata/Metadata;-><init>()V

    .line 58
    .local v0, "metadata":Lcom/drew/metadata/Metadata;
    new-instance v1, Lcom/drew/imaging/riff/RiffReader;

    invoke-direct {v1}, Lcom/drew/imaging/riff/RiffReader;-><init>()V

    new-instance v2, Lcom/drew/lang/StreamReader;

    invoke-direct {v2, p0}, Lcom/drew/lang/StreamReader;-><init>(Ljava/io/InputStream;)V

    new-instance v3, Lcom/drew/metadata/webp/WebpRiffHandler;

    invoke-direct {v3, v0}, Lcom/drew/metadata/webp/WebpRiffHandler;-><init>(Lcom/drew/metadata/Metadata;)V

    invoke-virtual {v1, v2, v3}, Lcom/drew/imaging/riff/RiffReader;->processRiff(Lcom/drew/lang/SequentialReader;Lcom/drew/imaging/riff/RiffHandler;)V

    .line 59
    return-object v0
.end method
