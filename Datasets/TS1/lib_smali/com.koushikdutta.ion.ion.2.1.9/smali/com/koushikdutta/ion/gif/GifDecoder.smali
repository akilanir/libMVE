.class public Lcom/koushikdutta/ion/gif/GifDecoder;
.super Ljava/lang/Object;
.source "GifDecoder.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final MaxStackSize:I = 0x1000

.field public static final STATUS_FINISH:I = -0x1

.field public static final STATUS_FORMAT_ERROR:I = 0x1

.field public static final STATUS_OPEN_ERROR:I = 0x2

.field public static final STATUS_PARSING:I


# instance fields
.field private act:[I

.field private bgColor:I

.field private bgIndex:I

.field private block:[B

.field private blockSize:I

.field private currentFrame:I

.field private delay:I

.field dest:[I

.field private dispose:I

.field private gct:[I

.field private gctFlag:Z

.field private gctSize:I

.field private gifData:[B

.field private gifDataLength:I

.field private gifDataOffset:I

.field public height:I

.field private ih:I

.field private interlace:Z

.field private iw:I

.field private ix:I

.field private iy:I

.field private lastBgColor:I

.field private lastDispose:I

.field lastFrame:Lcom/koushikdutta/ion/gif/GifFrame;

.field private lct:[I

.field private lctFlag:Z

.field private lctSize:I

.field private loopCount:I

.field private lrh:I

.field private lrw:I

.field private lrx:I

.field private lry:I

.field private pixelAspect:I

.field private pixelStack:[B

.field private pixels:[B

.field private prefix:[S

.field private readBytes:I

.field restoreFrame:Lcom/koushikdutta/ion/gif/GifFrame;

.field private status:I

.field private suffix:[B

.field private transIndex:I

.field private transparency:Z

.field public width:I


# direct methods
.method public constructor <init>(Ljava/nio/ByteBuffer;)V
    .registers 5
    .param p1, "bb"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 108
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/koushikdutta/ion/gif/GifDecoder;-><init>([BII)V

    .line 109
    return-void
.end method

.method public constructor <init>([B)V
    .registers 4
    .param p1, "data"    # [B

    .prologue
    .line 112
    const/4 v0, 0x0

    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/koushikdutta/ion/gif/GifDecoder;-><init>([BII)V

    .line 113
    return-void
.end method

.method public constructor <init>([BII)V
    .registers 6
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/4 v0, 0x1

    iput v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->loopCount:I

    .line 43
    const/16 v0, 0x100

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->block:[B

    .line 44
    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->blockSize:I

    .line 45
    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->dispose:I

    .line 46
    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lastDispose:I

    .line 47
    iput-boolean v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->transparency:Z

    .line 48
    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->delay:I

    .line 60
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifData:[B

    .line 116
    iput-object p1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifData:[B

    .line 117
    iput p2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataOffset:I

    .line 118
    iput p3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataLength:I

    .line 120
    invoke-virtual {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->restart()V

    .line 121
    return-void
.end method

.method private decodeImageData()V
    .registers 26

    .prologue
    .line 261
    const/4 v2, -0x1

    .line 262
    .local v2, "NullCode":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->iw:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->ih:I

    move/from16 v24, v0

    mul-int v17, v23, v24

    .line 265
    .local v17, "npix":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixels:[B

    move-object/from16 v23, v0

    if-eqz v23, :cond_28

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixels:[B

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    move/from16 v1, v17

    if-ge v0, v1, :cond_34

    .line 266
    :cond_28
    move/from16 v0, v17

    new-array v0, v0, [B

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/koushikdutta/ion/gif/GifDecoder;->pixels:[B

    .line 268
    :cond_34
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->prefix:[S

    move-object/from16 v23, v0

    if-nez v23, :cond_4a

    .line 269
    const/16 v23, 0x1000

    move/from16 v0, v23

    new-array v0, v0, [S

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/koushikdutta/ion/gif/GifDecoder;->prefix:[S

    .line 271
    :cond_4a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->suffix:[B

    move-object/from16 v23, v0

    if-nez v23, :cond_60

    .line 272
    const/16 v23, 0x1000

    move/from16 v0, v23

    new-array v0, v0, [B

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/koushikdutta/ion/gif/GifDecoder;->suffix:[B

    .line 274
    :cond_60
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixelStack:[B

    move-object/from16 v23, v0

    if-nez v23, :cond_76

    .line 275
    const/16 v23, 0x1001

    move/from16 v0, v23

    new-array v0, v0, [B

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/koushikdutta/ion/gif/GifDecoder;->pixelStack:[B

    .line 278
    :cond_76
    invoke-direct/range {p0 .. p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v11

    .line 279
    .local v11, "data_size":I
    const/16 v23, 0x1

    shl-int v6, v23, v11

    .line 280
    .local v6, "clear":I
    add-int/lit8 v13, v6, 0x1

    .line 281
    .local v13, "end_of_information":I
    add-int/lit8 v3, v6, 0x2

    .line 282
    .local v3, "available":I
    move/from16 v18, v2

    .line 283
    .local v18, "old_code":I
    add-int/lit8 v9, v11, 0x1

    .line 284
    .local v9, "code_size":I
    const/16 v23, 0x1

    shl-int v23, v23, v9

    add-int/lit8 v8, v23, -0x1

    .line 285
    .local v8, "code_mask":I
    const/4 v7, 0x0

    .local v7, "code":I
    :goto_8d
    if-ge v7, v6, :cond_a7

    .line 286
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->prefix:[S

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-short v24, v23, v7

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->suffix:[B

    move-object/from16 v23, v0

    int-to-byte v0, v7

    move/from16 v24, v0

    aput-byte v24, v23, v7

    .line 285
    add-int/lit8 v7, v7, 0x1

    goto :goto_8d

    .line 291
    :cond_a7
    const/4 v4, 0x0

    .local v4, "bi":I
    move/from16 v19, v4

    .local v19, "pi":I
    move/from16 v21, v4

    .local v21, "top":I
    move v14, v4

    .local v14, "first":I
    move v10, v4

    .local v10, "count":I
    move v5, v4

    .local v5, "bits":I
    move v12, v4

    .line 292
    .local v12, "datum":I
    const/4 v15, 0x0

    .local v15, "i":I
    move/from16 v20, v19

    .end local v19    # "pi":I
    .local v20, "pi":I
    move/from16 v22, v21

    .end local v21    # "top":I
    .local v22, "top":I
    :goto_b5
    move/from16 v0, v17

    if-ge v15, v0, :cond_1c7

    .line 293
    if-nez v22, :cond_1cb

    .line 294
    if-ge v5, v9, :cond_f4

    .line 296
    if-nez v10, :cond_db

    .line 298
    invoke-direct/range {p0 .. p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readBlock()I

    move-result v10

    .line 299
    if-gtz v10, :cond_da

    move/from16 v21, v22

    .line 364
    .end local v22    # "top":I
    .restart local v21    # "top":I
    :goto_c7
    move/from16 v15, v20

    :goto_c9
    move/from16 v0, v17

    if-ge v15, v0, :cond_1c6

    .line 365
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixels:[B

    move-object/from16 v23, v0

    const/16 v24, 0x0

    aput-byte v24, v23, v15

    .line 364
    add-int/lit8 v15, v15, 0x1

    goto :goto_c9

    .line 302
    .end local v21    # "top":I
    .restart local v22    # "top":I
    :cond_da
    const/4 v4, 0x0

    .line 304
    :cond_db
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->block:[B

    move-object/from16 v23, v0

    aget-byte v23, v23, v4

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    shl-int v23, v23, v5

    add-int v12, v12, v23

    .line 305
    add-int/lit8 v5, v5, 0x8

    .line 306
    add-int/lit8 v4, v4, 0x1

    .line 307
    add-int/lit8 v10, v10, -0x1

    .line 308
    goto :goto_b5

    .line 311
    :cond_f4
    and-int v7, v12, v8

    .line 312
    shr-int/2addr v12, v9

    .line 313
    sub-int/2addr v5, v9

    .line 316
    if-gt v7, v3, :cond_1c7

    if-ne v7, v13, :cond_ff

    move/from16 v21, v22

    .line 317
    .end local v22    # "top":I
    .restart local v21    # "top":I
    goto :goto_c7

    .line 319
    .end local v21    # "top":I
    .restart local v22    # "top":I
    :cond_ff
    if-ne v7, v6, :cond_10e

    .line 321
    add-int/lit8 v9, v11, 0x1

    .line 322
    const/16 v23, 0x1

    shl-int v23, v23, v9

    add-int/lit8 v8, v23, -0x1

    .line 323
    add-int/lit8 v3, v6, 0x2

    .line 324
    move/from16 v18, v2

    .line 325
    goto :goto_b5

    .line 327
    :cond_10e
    move/from16 v0, v18

    if-ne v0, v2, :cond_12a

    .line 328
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixelStack:[B

    move-object/from16 v23, v0

    add-int/lit8 v21, v22, 0x1

    .end local v22    # "top":I
    .restart local v21    # "top":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->suffix:[B

    move-object/from16 v24, v0

    aget-byte v24, v24, v7

    aput-byte v24, v23, v22

    .line 329
    move/from16 v18, v7

    .line 330
    move v14, v7

    move/from16 v22, v21

    .line 331
    .end local v21    # "top":I
    .restart local v22    # "top":I
    goto :goto_b5

    .line 333
    :cond_12a
    move/from16 v16, v7

    .line 334
    .local v16, "in_code":I
    if-ne v7, v3, :cond_13f

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixelStack:[B

    move-object/from16 v23, v0

    add-int/lit8 v21, v22, 0x1

    .end local v22    # "top":I
    .restart local v21    # "top":I
    int-to-byte v0, v14

    move/from16 v24, v0

    aput-byte v24, v23, v22

    .line 336
    move/from16 v7, v18

    move/from16 v22, v21

    .line 338
    .end local v21    # "top":I
    .restart local v22    # "top":I
    :cond_13f
    :goto_13f
    if-le v7, v6, :cond_15e

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixelStack:[B

    move-object/from16 v23, v0

    add-int/lit8 v21, v22, 0x1

    .end local v22    # "top":I
    .restart local v21    # "top":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->suffix:[B

    move-object/from16 v24, v0

    aget-byte v24, v24, v7

    aput-byte v24, v23, v22

    .line 340
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->prefix:[S

    move-object/from16 v23, v0

    aget-short v7, v23, v7

    move/from16 v22, v21

    .end local v21    # "top":I
    .restart local v22    # "top":I
    goto :goto_13f

    .line 342
    :cond_15e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->suffix:[B

    move-object/from16 v23, v0

    aget-byte v23, v23, v7

    move/from16 v0, v23

    and-int/lit16 v14, v0, 0xff

    .line 344
    const/16 v23, 0x1000

    move/from16 v0, v23

    if-lt v3, v0, :cond_174

    move/from16 v21, v22

    .line 345
    .end local v22    # "top":I
    .restart local v21    # "top":I
    goto/16 :goto_c7

    .line 347
    .end local v21    # "top":I
    .restart local v22    # "top":I
    :cond_174
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixelStack:[B

    move-object/from16 v23, v0

    add-int/lit8 v21, v22, 0x1

    .end local v22    # "top":I
    .restart local v21    # "top":I
    int-to-byte v0, v14

    move/from16 v24, v0

    aput-byte v24, v23, v22

    .line 348
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->prefix:[S

    move-object/from16 v23, v0

    move/from16 v0, v18

    int-to-short v0, v0

    move/from16 v24, v0

    aput-short v24, v23, v3

    .line 349
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->suffix:[B

    move-object/from16 v23, v0

    int-to-byte v0, v14

    move/from16 v24, v0

    aput-byte v24, v23, v3

    .line 350
    add-int/lit8 v3, v3, 0x1

    .line 351
    and-int v23, v3, v8

    if-nez v23, :cond_1a8

    const/16 v23, 0x1000

    move/from16 v0, v23

    if-ge v3, v0, :cond_1a8

    .line 353
    add-int/lit8 v9, v9, 0x1

    .line 354
    add-int/2addr v8, v3

    .line 356
    :cond_1a8
    move/from16 v18, v16

    .line 360
    .end local v16    # "in_code":I
    :goto_1aa
    add-int/lit8 v21, v21, -0x1

    .line 361
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixels:[B

    move-object/from16 v23, v0

    add-int/lit8 v19, v20, 0x1

    .end local v20    # "pi":I
    .restart local v19    # "pi":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixelStack:[B

    move-object/from16 v24, v0

    aget-byte v24, v24, v21

    aput-byte v24, v23, v20

    .line 362
    add-int/lit8 v15, v15, 0x1

    move/from16 v20, v19

    .end local v19    # "pi":I
    .restart local v20    # "pi":I
    move/from16 v22, v21

    .end local v21    # "top":I
    .restart local v22    # "top":I
    goto/16 :goto_b5

    .line 367
    .end local v22    # "top":I
    .restart local v21    # "top":I
    :cond_1c6
    return-void

    .end local v21    # "top":I
    .restart local v22    # "top":I
    :cond_1c7
    move/from16 v21, v22

    .end local v22    # "top":I
    .restart local v21    # "top":I
    goto/16 :goto_c7

    .end local v21    # "top":I
    .restart local v22    # "top":I
    :cond_1cb
    move/from16 v21, v22

    .end local v22    # "top":I
    .restart local v21    # "top":I
    goto :goto_1aa
.end method

.method private err()Z
    .registers 2

    .prologue
    .line 370
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private read()I
    .registers 5

    .prologue
    .line 374
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->readBytes:I

    iget v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataLength:I

    if-lt v0, v1, :cond_8

    .line 375
    const/4 v0, 0x0

    .line 376
    :goto_7
    return v0

    :cond_8
    iget-object v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifData:[B

    iget v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataOffset:I

    iget v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->readBytes:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->readBytes:I

    add-int/2addr v1, v2

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    goto :goto_7
.end method

.method private read([B)I
    .registers 4
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 389
    const/4 v0, 0x0

    array-length v1, p1

    invoke-direct {p0, p1, v0, v1}, Lcom/koushikdutta/ion/gif/GifDecoder;->read([BII)I

    move-result v0

    return v0
.end method

.method private read([BII)I
    .registers 8
    .param p1, "bytes"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 380
    iget v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->readBytes:I

    iget v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataLength:I

    if-lt v1, v2, :cond_8

    .line 381
    const/4 v0, -0x1

    .line 385
    :goto_7
    return v0

    .line 382
    :cond_8
    iget v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataLength:I

    iget v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->readBytes:I

    sub-int/2addr v1, v2

    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 383
    .local v0, "toCopy":I
    iget-object v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifData:[B

    iget v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataOffset:I

    iget v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->readBytes:I

    add-int/2addr v2, v3

    invoke-static {v1, v2, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 384
    iget v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->readBytes:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->readBytes:I

    goto :goto_7
.end method

.method private readBlock()I
    .registers 6

    .prologue
    .line 393
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v3

    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->blockSize:I

    .line 394
    const/4 v2, 0x0

    .line 395
    .local v2, "n":I
    iget v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->blockSize:I

    if-lez v3, :cond_23

    .line 397
    const/4 v0, 0x0

    .line 398
    .local v0, "count":I
    :goto_c
    :try_start_c
    iget v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->blockSize:I

    if-ge v2, v3, :cond_1c

    .line 399
    iget-object v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->block:[B

    iget v4, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->blockSize:I

    sub-int/2addr v4, v2

    invoke-direct {p0, v3, v2, v4}, Lcom/koushikdutta/ion/gif/GifDecoder;->read([BII)I
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_18} :catch_26

    move-result v0

    .line 400
    const/4 v3, -0x1

    if-ne v0, v3, :cond_24

    .line 408
    :cond_1c
    :goto_1c
    iget v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->blockSize:I

    if-ge v2, v3, :cond_23

    .line 409
    const/4 v3, 0x1

    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    .line 412
    .end local v0    # "count":I
    :cond_23
    return v2

    .line 403
    .restart local v0    # "count":I
    :cond_24
    add-int/2addr v2, v0

    goto :goto_c

    .line 405
    :catch_26
    move-exception v1

    .line 406
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1c
.end method

.method private readColorTable(I)[I
    .registers 16
    .param p1, "ncolors"    # I

    .prologue
    .line 416
    mul-int/lit8 v9, p1, 0x3

    .line 417
    .local v9, "nbytes":I
    const/4 v11, 0x0

    .line 418
    .local v11, "tab":[I
    new-array v1, v9, [B

    .line 419
    .local v1, "c":[B
    const/4 v8, 0x0

    .line 421
    .local v8, "n":I
    :try_start_6
    invoke-direct {p0, v1}, Lcom/koushikdutta/ion/gif/GifDecoder;->read([B)I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_9} :catch_10

    move-result v8

    .line 425
    :goto_a
    if-ge v8, v9, :cond_15

    .line 426
    const/4 v12, 0x1

    iput v12, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    .line 438
    :cond_f
    return-object v11

    .line 422
    :catch_10
    move-exception v2

    .line 423
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_a

    .line 428
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_15
    const/16 v12, 0x100

    new-array v11, v12, [I

    .line 429
    const/4 v4, 0x0

    .line 430
    .local v4, "i":I
    const/4 v6, 0x0

    .local v6, "j":I
    move v7, v6

    .end local v6    # "j":I
    .local v7, "j":I
    move v5, v4

    .line 431
    .end local v4    # "i":I
    .local v5, "i":I
    :goto_1d
    if-ge v5, p1, :cond_f

    .line 432
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "j":I
    .restart local v6    # "j":I
    aget-byte v12, v1, v7

    and-int/lit16 v10, v12, 0xff

    .line 433
    .local v10, "r":I
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "j":I
    .restart local v7    # "j":I
    aget-byte v12, v1, v6

    and-int/lit16 v3, v12, 0xff

    .line 434
    .local v3, "g":I
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "j":I
    .restart local v6    # "j":I
    aget-byte v12, v1, v7

    and-int/lit16 v0, v12, 0xff

    .line 435
    .local v0, "b":I
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "i":I
    .restart local v4    # "i":I
    const/high16 v12, -0x1000000

    shl-int/lit8 v13, v10, 0x10

    or-int/2addr v12, v13

    shl-int/lit8 v13, v3, 0x8

    or-int/2addr v12, v13

    or-int/2addr v12, v0

    aput v12, v11, v5

    move v7, v6

    .end local v6    # "j":I
    .restart local v7    # "j":I
    move v5, v4

    .line 436
    .end local v4    # "i":I
    .restart local v5    # "i":I
    goto :goto_1d
.end method

.method private readGraphicControlExt()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 442
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    .line 443
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v0

    .line 444
    .local v0, "packed":I
    and-int/lit8 v2, v0, 0x1c

    shr-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->dispose:I

    .line 445
    iget v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->dispose:I

    if-nez v2, :cond_14

    .line 446
    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->dispose:I

    .line 448
    :cond_14
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_2c

    :goto_18
    iput-boolean v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->transparency:Z

    .line 449
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readShort()I

    move-result v1

    mul-int/lit8 v1, v1, 0xa

    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->delay:I

    .line 450
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v1

    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->transIndex:I

    .line 451
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    .line 452
    return-void

    .line 448
    :cond_2c
    const/4 v1, 0x0

    goto :goto_18
.end method

.method private readHeader()V
    .registers 5

    .prologue
    .line 455
    const-string v1, ""

    .line 456
    .local v1, "id":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    const/4 v2, 0x6

    if-ge v0, v2, :cond_1f

    .line 457
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v3

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 456
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 459
    :cond_1f
    const-string v2, "GIF"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2b

    .line 460
    const/4 v2, 0x1

    iput v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    .line 468
    :cond_2a
    :goto_2a
    return-void

    .line 463
    :cond_2b
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readLSD()V

    .line 464
    iget-boolean v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gctFlag:Z

    if-eqz v2, :cond_2a

    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->err()Z

    move-result v2

    if-nez v2, :cond_2a

    .line 465
    iget v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gctSize:I

    invoke-direct {p0, v2}, Lcom/koushikdutta/ion/gif/GifDecoder;->readColorTable(I)[I

    move-result-object v2

    iput-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gct:[I

    .line 466
    iget-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gct:[I

    iget v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->bgIndex:I

    aget v2, v2, v3

    iput v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->bgColor:I

    goto :goto_2a
.end method

.method private readImage()Lcom/koushikdutta/ion/gif/GifFrame;
    .registers 8

    .prologue
    const/4 v0, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 471
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readShort()I

    move-result v3

    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->ix:I

    .line 472
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readShort()I

    move-result v3

    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->iy:I

    .line 473
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readShort()I

    move-result v3

    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->iw:I

    .line 474
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readShort()I

    move-result v3

    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->ih:I

    .line 475
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v2

    .line 476
    .local v2, "packed":I
    and-int/lit16 v3, v2, 0x80

    if-eqz v3, :cond_50

    move v3, v4

    :goto_24
    iput-boolean v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lctFlag:Z

    .line 477
    and-int/lit8 v3, v2, 0x40

    if-eqz v3, :cond_52

    move v3, v4

    :goto_2b
    iput-boolean v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->interlace:Z

    .line 480
    const/4 v3, 0x2

    and-int/lit8 v6, v2, 0x7

    shl-int/2addr v3, v6

    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lctSize:I

    .line 481
    iget-boolean v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lctFlag:Z

    if-eqz v3, :cond_54

    .line 482
    iget v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lctSize:I

    invoke-direct {p0, v3}, Lcom/koushikdutta/ion/gif/GifDecoder;->readColorTable(I)[I

    move-result-object v3

    iput-object v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lct:[I

    .line 483
    iget-object v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lct:[I

    iput-object v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->act:[I

    .line 490
    :cond_43
    :goto_43
    iget-object v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->act:[I

    if-nez v3, :cond_49

    .line 491
    iput v4, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    .line 493
    :cond_49
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->err()Z

    move-result v3

    if-eqz v3, :cond_61

    .line 509
    :cond_4f
    :goto_4f
    return-object v0

    :cond_50
    move v3, v5

    .line 476
    goto :goto_24

    :cond_52
    move v3, v5

    .line 477
    goto :goto_2b

    .line 485
    :cond_54
    iget-object v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gct:[I

    iput-object v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->act:[I

    .line 486
    iget v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->bgIndex:I

    iget v6, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->transIndex:I

    if-ne v3, v6, :cond_43

    .line 487
    iput v5, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->bgColor:I

    goto :goto_43

    .line 496
    :cond_61
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->decodeImageData()V

    .line 497
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->skip()V

    .line 498
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->err()Z

    move-result v3

    if-nez v3, :cond_4f

    .line 501
    iget v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->currentFrame:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->currentFrame:I

    .line 504
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->setPixels()Landroid/graphics/Bitmap;

    move-result-object v1

    .line 505
    .local v1, "image":Landroid/graphics/Bitmap;
    new-instance v0, Lcom/koushikdutta/ion/gif/GifFrame;

    iget v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->delay:I

    invoke-direct {v0, v1, v3}, Lcom/koushikdutta/ion/gif/GifFrame;-><init>(Landroid/graphics/Bitmap;I)V

    .line 508
    .local v0, "gifFrame":Lcom/koushikdutta/ion/gif/GifFrame;
    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/gif/GifDecoder;->resetFrame(Lcom/koushikdutta/ion/gif/GifFrame;)V

    goto :goto_4f
.end method

.method private readLSD()V
    .registers 4

    .prologue
    .line 514
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readShort()I

    move-result v1

    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    .line 515
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readShort()I

    move-result v1

    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->height:I

    .line 517
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v0

    .line 518
    .local v0, "packed":I
    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_2a

    const/4 v1, 0x1

    :goto_15
    iput-boolean v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gctFlag:Z

    .line 521
    const/4 v1, 0x2

    and-int/lit8 v2, v0, 0x7

    shl-int/2addr v1, v2

    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gctSize:I

    .line 522
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v1

    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->bgIndex:I

    .line 523
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v1

    iput v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixelAspect:I

    .line 524
    return-void

    .line 518
    :cond_2a
    const/4 v1, 0x0

    goto :goto_15
.end method

.method private readNetscapeExt()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 528
    :cond_1
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readBlock()I

    .line 529
    iget-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->block:[B

    const/4 v3, 0x0

    aget-byte v2, v2, v3

    if-ne v2, v4, :cond_1d

    .line 531
    iget-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->block:[B

    aget-byte v2, v2, v4

    and-int/lit16 v0, v2, 0xff

    .line 532
    .local v0, "b1":I
    iget-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->block:[B

    const/4 v3, 0x2

    aget-byte v2, v2, v3

    and-int/lit16 v1, v2, 0xff

    .line 533
    .local v1, "b2":I
    shl-int/lit8 v2, v1, 0x8

    or-int/2addr v2, v0

    iput v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->loopCount:I

    .line 535
    .end local v0    # "b1":I
    .end local v1    # "b2":I
    :cond_1d
    iget v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->blockSize:I

    if-lez v2, :cond_27

    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->err()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 536
    :cond_27
    return-void
.end method

.method private readShort()I
    .registers 3

    .prologue
    .line 540
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v0

    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    return v0
.end method

.method private resetFrame(Lcom/koushikdutta/ion/gif/GifFrame;)V
    .registers 7
    .param p1, "newFrame"    # Lcom/koushikdutta/ion/gif/GifFrame;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 545
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->dispose:I

    packed-switch v0, :pswitch_data_4c

    .line 564
    const-string v0, "Ion"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown gif dispose code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lastDispose:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 568
    :goto_21
    :pswitch_21
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->dispose:I

    iput v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lastDispose:I

    .line 569
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->ix:I

    iput v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lrx:I

    .line 570
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->iy:I

    iput v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lry:I

    .line 571
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->iw:I

    iput v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lrw:I

    .line 572
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->ih:I

    iput v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lrh:I

    .line 573
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->bgColor:I

    iput v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lastBgColor:I

    .line 574
    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->dispose:I

    .line 575
    iput-boolean v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->transparency:Z

    .line 576
    iput v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->delay:I

    .line 577
    iput-object v4, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lct:[I

    .line 578
    return-void

    .line 548
    :pswitch_42
    iput-object p1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->restoreFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    goto :goto_21

    .line 552
    :pswitch_45
    iput-object p1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->restoreFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    goto :goto_21

    .line 557
    :pswitch_48
    iput-object v4, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->restoreFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    goto :goto_21

    .line 545
    nop

    :pswitch_data_4c
    .packed-switch 0x0
        :pswitch_42
        :pswitch_45
        :pswitch_48
        :pswitch_21
    .end packed-switch
.end method

.method private setPixels()Landroid/graphics/Bitmap;
    .registers 22

    .prologue
    .line 187
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->lastDispose:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_af

    .line 188
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    if-nez v1, :cond_1c

    .line 189
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    move-object/from16 v0, p0

    iget v2, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->height:I

    mul-int/2addr v1, v2

    new-array v1, v1, [I

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    .line 190
    :cond_1c
    const/4 v9, 0x0

    .line 191
    .local v9, "c":I
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->transparency:Z

    if-nez v1, :cond_27

    .line 192
    move-object/from16 v0, p0

    iget v9, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->lastBgColor:I

    .line 194
    :cond_27
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    invoke-static {v1, v9}, Ljava/util/Arrays;->fill([II)V

    .line 214
    .end local v9    # "c":I
    :cond_2e
    :goto_2e
    const/16 v18, 0x1

    .line 215
    .local v18, "pass":I
    const/16 v14, 0x8

    .line 216
    .local v14, "inc":I
    const/4 v13, 0x0

    .line 217
    .local v13, "iline":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_34
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->ih:I

    if-ge v12, v1, :cond_136

    .line 218
    move/from16 v17, v12

    .line 219
    .local v17, "line":I
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->interlace:Z

    if-eqz v1, :cond_50

    .line 220
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->ih:I

    if-lt v13, v1, :cond_4d

    .line 221
    add-int/lit8 v18, v18, 0x1

    .line 222
    packed-switch v18, :pswitch_data_14a

    .line 235
    :cond_4d
    :goto_4d
    move/from16 v17, v13

    .line 236
    add-int/2addr v13, v14

    .line 238
    :cond_50
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->iy:I

    add-int v17, v17, v1

    .line 239
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->height:I

    move/from16 v0, v17

    if-ge v0, v1, :cond_132

    .line 240
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    mul-int v16, v17, v1

    .line 241
    .local v16, "k":I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->ix:I

    add-int v11, v16, v1

    .line 242
    .local v11, "dx":I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->iw:I

    add-int v10, v11, v1

    .line 243
    .local v10, "dlim":I
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    add-int v1, v1, v16

    if-ge v1, v10, :cond_7e

    .line 244
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    add-int v10, v16, v1

    .line 246
    :cond_7e
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->iw:I

    mul-int v19, v12, v1

    .local v19, "sx":I
    move/from16 v20, v19

    .line 247
    .end local v19    # "sx":I
    .local v20, "sx":I
    :goto_86
    if-ge v11, v10, :cond_132

    .line 249
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixels:[B

    add-int/lit8 v19, v20, 0x1

    .end local v20    # "sx":I
    .restart local v19    # "sx":I
    aget-byte v1, v1, v20

    and-int/lit16 v15, v1, 0xff

    .line 250
    .local v15, "index":I
    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->transparency:Z

    if-eqz v1, :cond_9e

    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->transIndex:I

    if-eq v15, v1, :cond_aa

    .line 251
    :cond_9e
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->act:[I

    aget v2, v2, v15

    aput v2, v1, v11

    .line 253
    :cond_aa
    add-int/lit8 v11, v11, 0x1

    move/from16 v20, v19

    .line 254
    .end local v19    # "sx":I
    .restart local v20    # "sx":I
    goto :goto_86

    .line 197
    .end local v10    # "dlim":I
    .end local v11    # "dx":I
    .end local v12    # "i":I
    .end local v13    # "iline":I
    .end local v14    # "inc":I
    .end local v15    # "index":I
    .end local v16    # "k":I
    .end local v17    # "line":I
    .end local v18    # "pass":I
    .end local v20    # "sx":I
    :cond_af
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    if-nez v1, :cond_f2

    .line 198
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    move-object/from16 v0, p0

    iget v2, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->height:I

    mul-int/2addr v1, v2

    new-array v1, v1, [I

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    .line 199
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->restoreFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    if-eqz v1, :cond_e8

    .line 200
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->restoreFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    iget-object v1, v1, Lcom/koushikdutta/ion/gif/GifFrame;->image:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->height:I

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    goto/16 :goto_2e

    .line 202
    :cond_e8
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([II)V

    goto/16 :goto_2e

    .line 204
    :cond_f2
    move-object/from16 v0, p0

    iget v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->lastDispose:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_2e

    .line 206
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->restoreFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    if-eqz v1, :cond_11d

    .line 207
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->restoreFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    iget-object v1, v1, Lcom/koushikdutta/ion/gif/GifFrame;->image:Landroid/graphics/Bitmap;

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    const/4 v3, 0x0

    move-object/from16 v0, p0

    iget v4, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget v7, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    move-object/from16 v0, p0

    iget v8, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->height:I

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    goto/16 :goto_2e

    .line 209
    :cond_11d
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([II)V

    goto/16 :goto_2e

    .line 224
    .restart local v12    # "i":I
    .restart local v13    # "iline":I
    .restart local v14    # "inc":I
    .restart local v17    # "line":I
    .restart local v18    # "pass":I
    :pswitch_127
    const/4 v13, 0x4

    .line 225
    goto/16 :goto_4d

    .line 227
    :pswitch_12a
    const/4 v13, 0x2

    .line 228
    const/4 v14, 0x4

    .line 229
    goto/16 :goto_4d

    .line 231
    :pswitch_12e
    const/4 v13, 0x1

    .line 232
    const/4 v14, 0x2

    goto/16 :goto_4d

    .line 217
    :cond_132
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_34

    .line 257
    .end local v17    # "line":I
    :cond_136
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I

    move-object/from16 v0, p0

    iget v2, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    move-object/from16 v0, p0

    iget v3, v0, Lcom/koushikdutta/ion/gif/GifDecoder;->height:I

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3, v4}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    return-object v1

    .line 222
    nop

    :pswitch_data_14a
    .packed-switch 0x2
        :pswitch_127
        :pswitch_12a
        :pswitch_12e
    .end packed-switch
.end method

.method private skip()V
    .registers 2

    .prologue
    .line 585
    :cond_0
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readBlock()I

    .line 586
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->blockSize:I

    if-lez v0, :cond_d

    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->err()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 587
    :cond_d
    return-void
.end method


# virtual methods
.method public getByteBuffer()Ljava/nio/ByteBuffer;
    .registers 4

    .prologue
    .line 88
    iget-object v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifData:[B

    iget v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataOffset:I

    iget v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataLength:I

    invoke-static {v0, v1, v2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getGifDataLength()I
    .registers 2

    .prologue
    .line 100
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gifDataLength:I

    return v0
.end method

.method public getHeight()I
    .registers 2

    .prologue
    .line 96
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->height:I

    return v0
.end method

.method public getLastFrame()Lcom/koushikdutta/ion/gif/GifFrame;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lastFrame:Lcom/koushikdutta/ion/gif/GifFrame;

    return-object v0
.end method

.method public getLoopCount()I
    .registers 2

    .prologue
    .line 183
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->loopCount:I

    return v0
.end method

.method public getStatus()I
    .registers 2

    .prologue
    .line 175
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    return v0
.end method

.method public getWidth()I
    .registers 2

    .prologue
    .line 92
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->width:I

    return v0
.end method

.method public mutate()Lcom/koushikdutta/ion/gif/GifDecoder;
    .registers 4

    .prologue
    .line 73
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/ion/gif/GifDecoder;

    .line 74
    .local v1, "ret":Lcom/koushikdutta/ion/gif/GifDecoder;
    const/16 v2, 0x100

    new-array v2, v2, [B

    iput-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->block:[B

    .line 75
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->prefix:[S

    .line 76
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->suffix:[B

    .line 77
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixelStack:[B

    .line 78
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->pixels:[B

    .line 79
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->dest:[I
    :try_end_1b
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_1b} :catch_1c

    .line 80
    return-object v1

    .line 82
    .end local v1    # "ret":Lcom/koushikdutta/ion/gif/GifDecoder;
    :catch_1c
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2
.end method

.method public declared-synchronized nextFrame()Lcom/koushikdutta/ion/gif/GifFrame;
    .registers 7

    .prologue
    const/4 v3, 0x0

    .line 133
    monitor-enter p0

    :goto_2
    :sswitch_2
    :try_start_2
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->err()Z

    move-result v4

    if-nez v4, :cond_68

    iget v4, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    if-nez v4, :cond_68

    .line 134
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v1

    .line 135
    .local v1, "code":I
    sparse-switch v1, :sswitch_data_6c

    .line 166
    const/4 v4, 0x1

    iput v4, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I
    :try_end_16
    .catchall {:try_start_2 .. :try_end_16} :catchall_17

    goto :goto_2

    .line 133
    .end local v1    # "code":I
    :catchall_17
    move-exception v3

    monitor-exit p0

    throw v3

    .line 137
    .restart local v1    # "code":I
    :sswitch_1a
    :try_start_1a
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readImage()Lcom/koushikdutta/ion/gif/GifFrame;

    move-result-object v3

    iput-object v3, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lastFrame:Lcom/koushikdutta/ion/gif/GifFrame;
    :try_end_20
    .catchall {:try_start_1a .. :try_end_20} :catchall_17

    .line 171
    .end local v1    # "code":I
    :goto_20
    monitor-exit p0

    return-object v3

    .line 139
    .restart local v1    # "code":I
    :sswitch_22
    :try_start_22
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->read()I

    move-result v1

    .line 140
    sparse-switch v1, :sswitch_data_7e

    .line 157
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->skip()V

    goto :goto_2

    .line 142
    :sswitch_2d
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readGraphicControlExt()V

    goto :goto_2

    .line 145
    :sswitch_31
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readBlock()I

    .line 146
    const-string v0, ""

    .line 147
    .local v0, "app":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_37
    const/16 v4, 0xb

    if-ge v2, v4, :cond_54

    .line 148
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->block:[B

    aget-byte v5, v5, v2

    int-to-char v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 147
    add-int/lit8 v2, v2, 0x1

    goto :goto_37

    .line 150
    :cond_54
    const-string v4, "NETSCAPE2.0"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_60

    .line 151
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readNetscapeExt()V

    goto :goto_2

    .line 153
    :cond_60
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->skip()V

    goto :goto_2

    .line 161
    .end local v0    # "app":Ljava/lang/String;
    .end local v2    # "i":I
    :sswitch_64
    const/4 v4, -0x1

    iput v4, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    goto :goto_20

    .line 170
    .end local v1    # "code":I
    :cond_68
    const/4 v4, 0x1

    iput v4, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I
    :try_end_6b
    .catchall {:try_start_22 .. :try_end_6b} :catchall_17

    goto :goto_20

    .line 135
    :sswitch_data_6c
    .sparse-switch
        0x0 -> :sswitch_2
        0x21 -> :sswitch_22
        0x2c -> :sswitch_1a
        0x3b -> :sswitch_64
    .end sparse-switch

    .line 140
    :sswitch_data_7e
    .sparse-switch
        0xf9 -> :sswitch_2d
        0xff -> :sswitch_31
    .end sparse-switch
.end method

.method public parseOk()Z
    .registers 3

    .prologue
    .line 179
    iget v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public restart()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 124
    iput v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->readBytes:I

    .line 125
    iput v0, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->status:I

    .line 126
    iput-object v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->gct:[I

    .line 127
    iput-object v1, p0, Lcom/koushikdutta/ion/gif/GifDecoder;->lct:[I

    .line 128
    invoke-direct {p0}, Lcom/koushikdutta/ion/gif/GifDecoder;->readHeader()V

    .line 129
    return-void
.end method
