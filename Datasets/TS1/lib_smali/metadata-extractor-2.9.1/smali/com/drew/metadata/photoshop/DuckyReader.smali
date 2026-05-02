.class public Lcom/drew/metadata/photoshop/DuckyReader;
.super Ljava/lang/Object;
.source "DuckyReader.java"

# interfaces
.implements Lcom/drew/imaging/jpeg/JpegSegmentMetadataReader;


# static fields
.field private static final JPEG_SEGMENT_PREAMBLE:Ljava/lang/String; = "Ducky"
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V
    .registers 9
    .param p1, "reader"    # Lcom/drew/lang/SequentialReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 67
    new-instance v0, Lcom/drew/metadata/photoshop/DuckyDirectory;

    invoke-direct {v0}, Lcom/drew/metadata/photoshop/DuckyDirectory;-><init>()V

    .line 68
    .local v0, "directory":Lcom/drew/metadata/photoshop/DuckyDirectory;
    invoke-virtual {p2, v0}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 74
    :goto_8
    :try_start_8
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v3

    .line 77
    .local v3, "tag":I
    if-nez v3, :cond_f

    .line 114
    .end local v3    # "tag":I
    :goto_e
    return-void

    .line 80
    .restart local v3    # "tag":I
    :cond_f
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v2

    .line 82
    .local v2, "length":I
    packed-switch v3, :pswitch_data_4a

    .line 104
    invoke-virtual {p1, v2}, Lcom/drew/lang/SequentialReader;->getBytes(I)[B

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/drew/metadata/photoshop/DuckyDirectory;->setByteArray(I[B)V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_1d} :catch_1e

    goto :goto_8

    .line 110
    .end local v2    # "length":I
    .end local v3    # "tag":I
    :catch_1e
    move-exception v1

    .line 112
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/drew/metadata/photoshop/DuckyDirectory;->addError(Ljava/lang/String;)V

    goto :goto_e

    .line 86
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v2    # "length":I
    .restart local v3    # "tag":I
    :pswitch_27
    const/4 v4, 0x4

    if-eq v2, v4, :cond_30

    .line 88
    :try_start_2a
    const-string v4, "Unexpected length for the quality tag"

    invoke-virtual {v0, v4}, Lcom/drew/metadata/photoshop/DuckyDirectory;->addError(Ljava/lang/String;)V

    goto :goto_e

    .line 91
    :cond_30
    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt32()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Lcom/drew/metadata/photoshop/DuckyDirectory;->setInt(II)V

    goto :goto_8

    .line 97
    :pswitch_38
    const-wide/16 v4, 0x4

    invoke-virtual {p1, v4, v5}, Lcom/drew/lang/SequentialReader;->skip(J)V

    .line 98
    add-int/lit8 v4, v2, -0x4

    const-string v5, "UTF-16BE"

    invoke-virtual {p1, v4, v5}, Lcom/drew/lang/SequentialReader;->getString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/drew/metadata/photoshop/DuckyDirectory;->setString(ILjava/lang/String;)V
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_48} :catch_1e

    goto :goto_8

    .line 82
    nop

    :pswitch_data_4a
    .packed-switch 0x1
        :pswitch_27
        :pswitch_38
        :pswitch_38
    .end packed-switch
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
    .line 47
    sget-object v0, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPC:Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public readJpegSegments(Ljava/lang/Iterable;Lcom/drew/metadata/Metadata;Lcom/drew/imaging/jpeg/JpegSegmentType;)V
    .registers 10
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
    .line 52
    .local p1, "segments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    const-string v3, "Ducky"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v1

    .line 54
    .local v1, "preambleLength":I
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    .line 56
    .local v2, "segmentBytes":[B
    array-length v3, v2

    if-lt v3, v1, :cond_a

    const-string v3, "Ducky"

    new-instance v4, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v5, v1}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 59
    new-instance v3, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v3, v2, v1}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([BI)V

    invoke-virtual {p0, v3, p2}, Lcom/drew/metadata/photoshop/DuckyReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V

    goto :goto_a

    .line 63
    .end local v2    # "segmentBytes":[B
    :cond_30
    return-void
.end method
