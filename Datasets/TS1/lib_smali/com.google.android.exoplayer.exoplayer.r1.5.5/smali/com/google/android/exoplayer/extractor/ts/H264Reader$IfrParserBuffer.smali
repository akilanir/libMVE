.class final Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;
.super Ljava/lang/Object;
.source "H264Reader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/extractor/ts/H264Reader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "IfrParserBuffer"
.end annotation


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x80

.field private static final NOT_SET:I = -0x1


# instance fields
.field private ifrData:[B

.field private ifrLength:I

.field private isFilling:Z

.field private final scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

.field private sliceType:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 239
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    const/16 v0, 0x80

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrData:[B

    .line 241
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableBitArray;

    iget-object v1, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrData:[B

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableBitArray;-><init>([B)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

    .line 242
    invoke-virtual {p0}, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->reset()V

    .line 243
    return-void
.end method


# virtual methods
.method public appendToNalUnit([BII)V
    .registers 10
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "limit"    # I

    .prologue
    const/4 v5, -0x1

    .line 280
    iget-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->isFilling:Z

    if-nez v2, :cond_6

    .line 309
    :cond_5
    :goto_5
    return-void

    .line 283
    :cond_6
    sub-int v1, p3, p2

    .line 284
    .local v1, "readLength":I
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrData:[B

    array-length v2, v2

    iget v3, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrLength:I

    add-int/2addr v3, v1

    if-ge v2, v3, :cond_1d

    .line 285
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrData:[B

    iget v3, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrLength:I

    add-int/2addr v3, v1

    mul-int/lit8 v3, v3, 0x2

    invoke-static {v2, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrData:[B

    .line 287
    :cond_1d
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrData:[B

    iget v3, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrLength:I

    invoke-static {p1, p2, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 288
    iget v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrLength:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrLength:I

    .line 290
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

    iget-object v3, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrData:[B

    iget v4, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrLength:I

    invoke-virtual {v2, v3, v4}, Lcom/google/android/exoplayer/util/ParsableBitArray;->reset([BI)V

    .line 291
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 293
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->peekExpGolombCodedNumLength()I

    move-result v0

    .line 294
    .local v0, "len":I
    if-eq v0, v5, :cond_5

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->bitsLeft()I

    move-result v2

    if-gt v0, v2, :cond_5

    .line 299
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2, v0}, Lcom/google/android/exoplayer/util/ParsableBitArray;->skipBits(I)V

    .line 301
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->peekExpGolombCodedNumLength()I

    move-result v0

    .line 302
    if-eq v0, v5, :cond_5

    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->bitsLeft()I

    move-result v2

    if-gt v0, v2, :cond_5

    .line 306
    iget-object v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->scratchSliceType:Lcom/google/android/exoplayer/util/ParsableBitArray;

    invoke-virtual {v2}, Lcom/google/android/exoplayer/util/ParsableBitArray;->readUnsignedExpGolombCodedInt()I

    move-result v2

    iput v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->sliceType:I

    .line 308
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->isFilling:Z

    goto :goto_5
.end method

.method public getSliceType()I
    .registers 2

    .prologue
    .line 315
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->sliceType:I

    return v0
.end method

.method public isCompleted()Z
    .registers 3

    .prologue
    .line 258
    iget v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->sliceType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public reset()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 249
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->isFilling:Z

    .line 250
    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->ifrLength:I

    .line 251
    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->sliceType:I

    .line 252
    return-void
.end method

.method public startNalUnit(I)V
    .registers 3
    .param p1, "nalUnitType"    # I

    .prologue
    const/4 v0, 0x1

    .line 266
    if-ne p1, v0, :cond_8

    .line 267
    invoke-virtual {p0}, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->reset()V

    .line 268
    iput-boolean v0, p0, Lcom/google/android/exoplayer/extractor/ts/H264Reader$IfrParserBuffer;->isFilling:Z

    .line 270
    :cond_8
    return-void
.end method
