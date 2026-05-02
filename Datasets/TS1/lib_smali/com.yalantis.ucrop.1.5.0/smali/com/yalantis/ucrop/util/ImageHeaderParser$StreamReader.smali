.class Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;
.super Ljava/lang/Object;
.source "ImageHeaderParser.java"

# interfaces
.implements Lcom/yalantis/ucrop/util/ImageHeaderParser$Reader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/yalantis/ucrop/util/ImageHeaderParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StreamReader"
.end annotation


# instance fields
.field private final is:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "is"    # Ljava/io/InputStream;

    .prologue
    .line 324
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 325
    iput-object p1, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;->is:Ljava/io/InputStream;

    .line 326
    return-void
.end method


# virtual methods
.method public getUInt16()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 330
    iget-object v0, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;->is:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    shl-int/lit8 v0, v0, 0x8

    const v1, 0xff00

    and-int/2addr v0, v1

    iget-object v1, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;->is:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public getUInt8()S
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 335
    iget-object v0, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;->is:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    int-to-short v0, v0

    return v0
.end method

.method public read([BI)I
    .registers 7
    .param p1, "buffer"    # [B
    .param p2, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 367
    move v1, p2

    .line 369
    .local v1, "toRead":I
    :goto_1
    if-lez v1, :cond_10

    iget-object v2, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;->is:Ljava/io/InputStream;

    sub-int v3, p2, v1

    invoke-virtual {v2, p1, v3, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .local v0, "read":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_10

    .line 370
    sub-int/2addr v1, v0

    goto :goto_1

    .line 372
    .end local v0    # "read":I
    :cond_10
    sub-int v2, p2, v1

    return v2
.end method

.method public skip(J)J
    .registers 12
    .param p1, "total"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v5, 0x0

    .line 340
    cmp-long v7, p1, v5

    if-gez v7, :cond_7

    .line 362
    :goto_6
    return-wide v5

    .line 344
    :cond_7
    move-wide v3, p1

    .line 345
    .local v3, "toSkip":J
    :goto_8
    cmp-long v7, v3, v5

    if-lez v7, :cond_21

    .line 346
    iget-object v7, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;->is:Ljava/io/InputStream;

    invoke-virtual {v7, v3, v4}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 347
    .local v0, "skipped":J
    cmp-long v7, v0, v5

    if-lez v7, :cond_18

    .line 348
    sub-long/2addr v3, v0

    goto :goto_8

    .line 354
    :cond_18
    iget-object v7, p0, Lcom/yalantis/ucrop/util/ImageHeaderParser$StreamReader;->is:Ljava/io/InputStream;

    invoke-virtual {v7}, Ljava/io/InputStream;->read()I

    move-result v2

    .line 355
    .local v2, "testEofByte":I
    const/4 v7, -0x1

    if-ne v2, v7, :cond_24

    .line 362
    .end local v0    # "skipped":J
    .end local v2    # "testEofByte":I
    :cond_21
    sub-long v5, p1, v3

    goto :goto_6

    .line 358
    .restart local v0    # "skipped":J
    .restart local v2    # "testEofByte":I
    :cond_24
    const-wide/16 v7, 0x1

    sub-long/2addr v3, v7

    goto :goto_8
.end method
