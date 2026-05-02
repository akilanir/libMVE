.class public Lcom/drew/metadata/jfif/JfifReader;
.super Ljava/lang/Object;
.source "JfifReader.java"

# interfaces
.implements Lcom/drew/imaging/jpeg/JpegSegmentMetadataReader;
.implements Lcom/drew/metadata/MetadataReader;


# static fields
.field public static final PREAMBLE:Ljava/lang/String; = "JFIF"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;)V
    .registers 7
    .param p1, "reader"    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 69
    new-instance v0, Lcom/drew/metadata/jfif/JfifDirectory;

    invoke-direct {v0}, Lcom/drew/metadata/jfif/JfifDirectory;-><init>()V

    .line 70
    .local v0, "directory":Lcom/drew/metadata/jfif/JfifDirectory;
    invoke-virtual {p2, v0}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 75
    const/4 v2, 0x5

    const/4 v3, 0x5

    :try_start_a
    invoke-virtual {p1, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/jfif/JfifDirectory;->setInt(II)V

    .line 76
    const/4 v2, 0x7

    const/4 v3, 0x7

    invoke-virtual {p1, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/jfif/JfifDirectory;->setInt(II)V

    .line 77
    const/16 v2, 0x8

    const/16 v3, 0x8

    invoke-virtual {p1, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/jfif/JfifDirectory;->setInt(II)V

    .line 78
    const/16 v2, 0xa

    const/16 v3, 0xa

    invoke-virtual {p1, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt16(I)I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/jfif/JfifDirectory;->setInt(II)V

    .line 79
    const/16 v2, 0xc

    const/16 v3, 0xc

    invoke-virtual {p1, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/jfif/JfifDirectory;->setInt(II)V

    .line 80
    const/16 v2, 0xd

    const/16 v3, 0xd

    invoke-virtual {p1, v3}, Lcom/drew/lang/RandomAccessReader;->getUInt8(I)S

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/jfif/JfifDirectory;->setInt(II)V
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_46} :catch_47

    .line 84
    :goto_46
    return-void

    .line 81
    :catch_47
    move-exception v1

    .line 82
    .local v1, "me":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/drew/metadata/jfif/JfifDirectory;->addError(Ljava/lang/String;)V

    goto :goto_46
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
    .line 51
    sget-object v0, Lcom/drew/imaging/jpeg/JpegSegmentType;->APP0:Lcom/drew/imaging/jpeg/JpegSegmentType;

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
    .line 56
    .local p1, "segments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 58
    .local v1, "segmentBytes":[B
    array-length v2, v1

    const-string v3, "JFIF"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_4

    const-string v2, "JFIF"

    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "JFIF"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v3, v1, v4, v5}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 59
    new-instance v2, Lcom/drew/lang/ByteArrayReader;

    invoke-direct {v2, v1}, Lcom/drew/lang/ByteArrayReader;-><init>([B)V

    invoke-virtual {p0, v2, p2}, Lcom/drew/metadata/jfif/JfifReader;->extract(Lcom/drew/lang/RandomAccessReader;Lcom/drew/metadata/Metadata;)V

    goto :goto_4

    .line 61
    .end local v1    # "segmentBytes":[B
    :cond_36
    return-void
.end method
