.class public Lcom/drew/metadata/exif/ExifReader;
.super Ljava/lang/Object;
.source "ExifReader.java"

# interfaces
.implements Lcom/drew/imaging/jpeg/JpegSegmentMetadataReader;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final JPEG_SEGMENT_PREAMBLE:Ljava/lang/String; = "Exif\u0000\u0000"


# instance fields
.field private _storeThumbnailBytes:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const-class v0, Lcom/drew/metadata/exif/ExifReader;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/drew/metadata/exif/ExifReader;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/drew/metadata/exif/ExifReader;->_storeThumbnailBytes:Z

    return-void
.end method


# virtual methods
.method public extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;)V
    .registers 4
    .param p1, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/drew/metadata/exif/ExifReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;I)V

    .line 84
    return-void
.end method

.method public extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;I)V
    .registers 5
    .param p1, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "readerOffset"    # I

    .prologue
    .line 89
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/drew/metadata/exif/ExifReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;ILcom/drew/metadata/Directory;)V

    .line 90
    return-void
.end method

.method public extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;ILcom/drew/metadata/Directory;)V
    .registers 9
    .param p1, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "readerOffset"    # I
    .param p4, "parentDirectory"    # Lcom/drew/metadata/Directory;
        .annotation build Lcom/drew/lang/annotations/Nullable;
        .end annotation
    .end param

    .prologue
    .line 97
    :try_start_0
    new-instance v1, Lcom/drew/imaging/tiff/TiffReader;

    invoke-direct {v1}, Lcom/drew/imaging/tiff/TiffReader;-><init>()V

    new-instance v2, Lcom/drew/metadata/exif/ExifTiffHandler;

    iget-boolean v3, p0, Lcom/drew/metadata/exif/ExifReader;->_storeThumbnailBytes:Z

    invoke-direct {v2, p2, v3, p4}, Lcom/drew/metadata/exif/ExifTiffHandler;-><init>(Lcom/drew/metadata/Metadata;ZLcom/drew/metadata/Directory;)V

    invoke-virtual {v1, p1, v2, p3}, Lcom/drew/imaging/tiff/TiffReader;->processTiff(Lcom/drew/lang/RandomAccessReader;Lcom/drew/imaging/tiff/TiffHandler;I)V
    :try_end_f
    .catch Lcom/drew/imaging/tiff/TiffProcessingException; {:try_start_0 .. :try_end_f} :catch_10
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_f} :catch_17

    .line 109
    :goto_f
    return-void

    .line 102
    :catch_10
    move-exception v0

    .line 104
    .local v0, "e":Lcom/drew/imaging/tiff/TiffProcessingException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Lcom/drew/imaging/tiff/TiffProcessingException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_f

    .line 105
    .end local v0    # "e":Lcom/drew/imaging/tiff/TiffProcessingException;
    :catch_17
    move-exception v0

    .line 107
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v0, v1}, Ljava/io/IOException;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_f
.end method

.method public getSegmentTypes()Ljava/lang/Iterable;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    sget-object v0, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP1:Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public isStoreThumbnailBytes()Z
    .registers 2

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/drew/metadata/exif/ExifReader;->_storeThumbnailBytes:Z

    return v0
.end method

.method public readJpegSegments(Ljava/lang/Iterable;Lcom/drew/metadata/Metadata;Lcom/drew/imaging/jpeg/JpegSegmentType;)V
    .registers 9
    .param p1    # Ljava/lang/Iterable;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "segmentType"    # Lcom/drew/imaging/jpeg/JpegSegmentType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<[B>;",
            "Lcom/drew/metadata/Metadata;",
            "Lcom/drew/imaging/jpeg/JpegSegmentType;",
            ")V"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "segments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    sget-boolean v2, Lcom/drew/metadata/exif/ExifReader;->$assertionsDisabled:Z

    if-nez v2, :cond_e

    sget-object v2, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP1:Lcom/drew/imaging/jpeg/JpegSegmentType;

    if-eq p3, v2, :cond_e

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 72
    :cond_e
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_12
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 74
    .local v1, "segmentBytes":[B
    array-length v2, v1

    const-string v3, "Exif\u0000\u0000"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_12

    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "Exif\u0000\u0000"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-direct {v2, v1, v3, v4}, Ljava/lang/String;-><init>([BII)V

    const-string v3, "Exif\u0000\u0000"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 76
    new-instance v2, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v2, v1}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    const-string v3, "Exif\u0000\u0000"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v2, p2, v3}, Lcom/drew/metadata/exif/ExifReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;I)V

    goto :goto_12

    .line 78
    .end local v1    # "segmentBytes":[B
    :cond_4a
    return-void
.end method

.method public setStoreThumbnailBytes(Z)V
    .registers 2
    .param p1, "storeThumbnailBytes"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/drew/metadata/exif/ExifReader;->_storeThumbnailBytes:Z

    .line 60
    return-void
.end method
