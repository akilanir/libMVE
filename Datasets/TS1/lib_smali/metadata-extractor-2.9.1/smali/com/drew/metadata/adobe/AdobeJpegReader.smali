.class public Lcom/drew/metadata/adobe/AdobeJpegReader;
.super Ljava/lang/Object;
.source "AdobeJpegReader.java"

# interfaces
.implements Lcom/drew/imaging/jpeg/JpegSegmentMetadataReader;


# static fields
.field public static final PREAMBLE:Ljava/lang/String; = "Adobe"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V
    .registers 7
    .param p1, "reader"    # Lcom/drew/lang/SequentialReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "metadata"    # Lcom/drew/metadata/Metadata;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 61
    new-instance v0, Lcom/drew/metadata/adobe/AdobeJpegDirectory;

    invoke-direct {v0}, Lcom/drew/metadata/adobe/AdobeJpegDirectory;-><init>()V

    .line 62
    .local v0, "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {p2, v0}, Lcom/drew/metadata/Metadata;->addDirectory(Lcom/drew/metadata/Directory;)V

    .line 65
    const/4 v2, 0x0

    :try_start_9
    invoke-virtual {p1, v2}, Lcom/drew/lang/SequentialReader;->setMotorolaByteOrder(Z)V

    .line 67
    const-string v2, "Adobe"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/drew/lang/SequentialReader;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "Adobe"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_24

    .line 68
    const-string v2, "Invalid Adobe JPEG data header."

    invoke-virtual {v0, v2}, Lcom/drew/metadata/Directory;->addError(Ljava/lang/String;)V

    .line 79
    :goto_23
    return-void

    .line 72
    :cond_24
    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 73
    const/4 v2, 0x1

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 74
    const/4 v2, 0x2

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getUInt16()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/Directory;->setInt(II)V

    .line 75
    const/4 v2, 0x3

    invoke-virtual {p1}, Lcom/drew/lang/SequentialReader;->getInt8()B

    move-result v3

    invoke-virtual {v0, v2, v3}, Lcom/drew/metadata/Directory;->setInt(II)V
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_44} :catch_45

    goto :goto_23

    .line 76
    :catch_45
    move-exception v1

    .line 77
    .local v1, "ex":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IO exception processing data: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/drew/metadata/Directory;->addError(Ljava/lang/String;)V

    goto :goto_23
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
    .line 48
    sget-object v0, Lcom/drew/imaging/jpeg/JpegSegmentType;->APPE:Lcom/drew/imaging/jpeg/JpegSegmentType;

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
    .line 53
    .local p1, "segments":Ljava/lang/Iterable;, "Ljava/lang/Iterable<[B>;"
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_4
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_32

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 54
    .local v0, "bytes":[B
    array-length v2, v0

    const/16 v3, 0xc

    if-ne v2, v3, :cond_4

    const-string v2, "Adobe"

    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "Adobe"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-direct {v3, v0, v4, v5}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 55
    new-instance v2, Lcom/drew/lang/SequentialByteArrayReader;

    invoke-direct {v2, v0}, Lcom/drew/lang/SequentialByteArrayReader;-><init>([B)V

    invoke-virtual {p0, v2, p2}, Lcom/drew/metadata/adobe/AdobeJpegReader;->extract(Lcom/drew/lang/SequentialReader;Lcom/drew/metadata/Metadata;)V

    goto :goto_4

    .line 57
    .end local v0    # "bytes":[B
    :cond_32
    return-void
.end method
