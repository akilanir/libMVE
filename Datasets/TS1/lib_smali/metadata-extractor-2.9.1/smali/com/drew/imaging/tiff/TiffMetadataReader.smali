.class public Lcom/drew/imaging/tiff/TiffMetadataReader;
.super Ljava/lang/Object;
.source "TiffMetadataReader.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readMetadata(Lcom/drew/lang/RandomAccessReader;)Lcom/drew/metadata/Metadata;
    .registers 5
    .param p0, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/drew/imaging/tiff/TiffProcessingException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 73
    new-instance v1, Lcom/drew/metadata/Metadata;

    invoke-direct {v1}, Lcom/drew/metadata/Metadata;-><init>()V

    .line 74
    .local v1, "metadata":Lcom/drew/metadata/Metadata;
    new-instance v0, Lcom/drew/metadata/exif/ExifTiffHandler;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/drew/metadata/exif/ExifTiffHandler;-><init>(Lcom/drew/metadata/Metadata;ZLcom/drew/metadata/Directory;)V

    .line 75
    .local v0, "handler":Lcom/drew/metadata/exif/ExifTiffHandler;
    new-instance v2, Lcom/drew/imaging/tiff/TiffReader;

    invoke-direct {v2}, Lcom/drew/imaging/tiff/TiffReader;-><init>()V

    invoke-virtual {v2, p0, v0, v3}, Lcom/drew/imaging/tiff/TiffReader;->processTiff(Lcom/drew/lang/RandomAccessReader;Lcom/drew/imaging/tiff/TiffHandler;I)V

    .line 76
    return-object v1
.end method

.method public static readMetadata(Ljava/io/File;)Lcom/drew/metadata/Metadata;
    .registers 7
    .param p0, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/drew/imaging/tiff/TiffProcessingException;
        }
    .end annotation

    .prologue
    .line 45
    new-instance v1, Lcom/drew/metadata/Metadata;

    invoke-direct {v1}, Lcom/drew/metadata/Metadata;-><init>()V

    .line 46
    .local v1, "metadata":Lcom/drew/metadata/Metadata;
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v3, "r"

    invoke-direct {v2, p0, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 49
    .local v2, "randomAccessFile":Ljava/io/RandomAccessFile;
    :try_start_c
    new-instance v0, Lcom/drew/metadata/exif/ExifTiffHandler;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v0, v1, v3, v4}, Lcom/drew/metadata/exif/ExifTiffHandler;-><init>(Lcom/drew/metadata/Metadata;ZLcom/drew/metadata/Directory;)V

    .line 50
    .local v0, "handler":Lcom/drew/metadata/exif/ExifTiffHandler;
    new-instance v3, Lcom/drew/imaging/tiff/TiffReader;

    invoke-direct {v3}, Lcom/drew/imaging/tiff/TiffReader;-><init>()V

    new-instance v4, Lcom/drew/lang/RandomAccessFileReader;

    invoke-direct {v4, v2}, Lcom/drew/lang/RandomAccessFileReader;-><init>(Ljava/io/RandomAccessFile;)V

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v0, v5}, Lcom/drew/imaging/tiff/TiffReader;->processTiff(Lcom/drew/lang/RandomAccessReader;Lcom/drew/imaging/tiff/TiffHandler;I)V
    :try_end_21
    .catchall {:try_start_c .. :try_end_21} :catchall_2d

    .line 52
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    .line 55
    new-instance v3, Lcom/drew/metadata/file/FileMetadataReader;

    invoke-direct {v3}, Lcom/drew/metadata/file/FileMetadataReader;-><init>()V

    invoke-virtual {v3, p0, v1}, Lcom/drew/metadata/file/FileMetadataReader;->read(Ljava/io/File;Lcom/drew/metadata/Metadata;)V

    .line 57
    return-object v1

    .line 52
    .end local v0    # "handler":Lcom/drew/metadata/exif/ExifTiffHandler;
    :catchall_2d
    move-exception v3

    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    throw v3
.end method

.method public static readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    .registers 2
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/drew/imaging/tiff/TiffProcessingException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v0, Lcom/drew/lang/RandomAccessStreamReader;

    invoke-direct {v0, p0}, Lcom/drew/lang/RandomAccessStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-static {v0}, Lcom/drew/imaging/tiff/TiffMetadataReader;->readMetadata(Lcom/drew/lang/RandomAccessReader;)Lcom/drew/metadata/Metadata;

    move-result-object v0

    return-object v0
.end method
