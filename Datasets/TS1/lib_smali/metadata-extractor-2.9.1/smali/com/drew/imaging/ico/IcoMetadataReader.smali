.class public Lcom/drew/imaging/ico/IcoMetadataReader;
.super Ljava/lang/Object;
.source "IcoMetadataReader.java"


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
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 44
    .local v0, "inputStream":Ljava/io/InputStream;
    :try_start_5
    invoke-static {v0}, Lcom/drew/imaging/ico/IcoMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    :try_end_8
    .catchall {:try_start_5 .. :try_end_8} :catchall_15

    move-result-object v1

    .line 46
    .local v1, "metadata":Lcom/drew/metadata/Metadata;
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 48
    new-instance v2, Lcom/drew/metadata/file/FileMetadataReader;

    invoke-direct {v2}, Lcom/drew/metadata/file/FileMetadataReader;-><init>()V

    invoke-virtual {v2, p0, v1}, Lcom/drew/metadata/file/FileMetadataReader;->read(Ljava/io/File;Lcom/drew/metadata/Metadata;)V

    .line 49
    return-object v1

    .line 46
    .end local v1    # "metadata":Lcom/drew/metadata/Metadata;
    :catchall_15
    move-exception v2

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

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
    .line 55
    new-instance v0, Lcom/drew/metadata/Metadata;

    invoke-direct {v0}, Lcom/drew/metadata/Metadata;-><init>()V

    .line 56
    .local v0, "metadata":Lcom/drew/metadata/Metadata;
    new-instance v1, Lcom/drew/metadata/ico/IcoReader;

    invoke-direct {v1}, Lcom/drew/metadata/ico/IcoReader;-><init>()V

    new-instance v2, Lcom/drew/lang/StreamReader;

    invoke-direct {v2, p0}, Lcom/drew/lang/StreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1, v2, v0}, Lcom/drew/metadata/ico/IcoReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V

    .line 57
    return-object v0
.end method
