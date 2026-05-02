.class final Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;
.super Ljava/lang/Object;
.source "H262Reader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/ts/H262Reader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CsdBuffer"
.end annotation


# instance fields
.field public data:[B

.field private isFilling:Z

.field public length:I

.field public sequenceExtensionPosition:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "initialCapacity"    # I

    .prologue
    .line 222
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 223
    new-array v0, p1, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->data:[B

    .line 224
    return-void
.end method


# virtual methods
.method public onData([BII)V
    .registers 7
    .param p1, "newData"    # [B
    .param p2, "offset"    # I
    .param p3, "limit"    # I

    .prologue
    .line 268
    iget-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->isFilling:Z

    if-nez v1, :cond_5

    .line 277
    :goto_4
    return-void

    .line 271
    :cond_5
    sub-int v0, p3, p2

    .line 272
    .local v0, "readLength":I
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->data:[B

    array-length v1, v1

    iget v2, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->length:I

    add-int/2addr v2, v0

    if-ge v1, v2, :cond_1c

    .line 273
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->length:I

    add-int/2addr v2, v0

    mul-int/lit8 v2, v2, 0x2

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->data:[B

    .line 275
    :cond_1c
    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->data:[B

    iget v2, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->length:I

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 276
    iget v1, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->length:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->length:I

    goto :goto_4
.end method

.method public onStartCode(II)Z
    .registers 6
    .param p1, "startCodeValue"    # I
    .param p2, "bytesAlreadyPassed"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 246
    iget-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->isFilling:Z

    if-eqz v2, :cond_1c

    .line 247
    iget v2, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->sequenceExtensionPosition:I

    if-nez v2, :cond_14

    const/16 v2, 0xb5

    if-ne p1, v2, :cond_14

    .line 248
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->length:I

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->sequenceExtensionPosition:I

    :cond_12
    :goto_12
    move v0, v1

    .line 257
    :goto_13
    return v0

    .line 250
    :cond_14
    iget v2, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->length:I

    sub-int/2addr v2, p2

    iput v2, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->length:I

    .line 251
    iput-boolean v1, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->isFilling:Z

    goto :goto_13

    .line 254
    :cond_1c
    const/16 v2, 0xb3

    if-ne p1, v2, :cond_12

    .line 255
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->isFilling:Z

    goto :goto_12
.end method

.method public reset()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 230
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->isFilling:Z

    .line 231
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->length:I

    .line 232
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/H262Reader$CsdBuffer;->sequenceExtensionPosition:I

    .line 233
    return-void
.end method
