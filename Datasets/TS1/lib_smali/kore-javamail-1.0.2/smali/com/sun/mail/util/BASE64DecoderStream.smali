.class public Lcom/sun/mail/util/BASE64DecoderStream;
.super Ljava/io/FilterInputStream;
.source "BASE64DecoderStream.java"


# static fields
.field private static final pem_array:[C

.field private static final pem_convert_array:[B


# instance fields
.field private buffer:[B

.field private bufsize:I

.field private ignoreErrors:Z

.field private index:I

.field private input_buffer:[B

.field private input_len:I

.field private input_pos:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 204
    const/16 v1, 0x40

    new-array v1, v1, [C

    fill-array-data v1, :array_30

    sput-object v1, Lcom/sun/mail/util/BASE64DecoderStream;->pem_array:[C

    .line 215
    const/16 v1, 0x100

    new-array v1, v1, [B

    sput-object v1, Lcom/sun/mail/util/BASE64DecoderStream;->pem_convert_array:[B

    .line 218
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_10
    const/16 v1, 0xff

    if-ge v0, v1, :cond_1c

    .line 219
    sget-object v1, Lcom/sun/mail/util/BASE64DecoderStream;->pem_convert_array:[B

    const/4 v2, -0x1

    aput-byte v2, v1, v0

    .line 218
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 220
    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    sget-object v1, Lcom/sun/mail/util/BASE64DecoderStream;->pem_array:[C

    array-length v1, v1

    if-ge v0, v1, :cond_2e

    .line 221
    sget-object v1, Lcom/sun/mail/util/BASE64DecoderStream;->pem_convert_array:[B

    sget-object v2, Lcom/sun/mail/util/BASE64DecoderStream;->pem_array:[C

    aget-char v2, v2, v0

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    .line 220
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 222
    :cond_2e
    return-void

    .line 204
    nop

    :array_30
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x2bs
        0x2fs
    .end array-data
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 4
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    const/4 v1, 0x0

    .line 78
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 57
    const/4 v0, 0x3

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->buffer:[B

    .line 58
    iput v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->bufsize:I

    .line 59
    iput v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    .line 63
    const/16 v0, 0x1ffe

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_buffer:[B

    .line 64
    iput v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    .line 65
    iput v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_len:I

    .line 67
    iput-boolean v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->ignoreErrors:Z

    .line 80
    const-string v0, "mail.mime.base64.ignoreerrors"

    invoke-static {v0, v1}, Lcom/sun/mail/util/PropUtil;->getBooleanSystemProperty(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->ignoreErrors:Z

    .line 82
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "ignoreErrors"    # Z

    .prologue
    const/4 v1, 0x0

    .line 91
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 57
    const/4 v0, 0x3

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->buffer:[B

    .line 58
    iput v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->bufsize:I

    .line 59
    iput v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    .line 63
    const/16 v0, 0x1ffe

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_buffer:[B

    .line 64
    iput v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    .line 65
    iput v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_len:I

    .line 67
    iput-boolean v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->ignoreErrors:Z

    .line 92
    iput-boolean p2, p0, Lcom/sun/mail/util/BASE64DecoderStream;->ignoreErrors:Z

    .line 93
    return-void
.end method

.method private decode([BII)I
    .registers 16
    .param p1, "outbuf"    # [B
    .param p2, "pos"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x4

    const/4 v10, 0x2

    const/4 v9, -0x2

    const/4 v8, -0x1

    .line 239
    move v3, p2

    .line 240
    .local v3, "pos0":I
    :goto_5
    const/4 v6, 0x3

    if-lt p3, v6, :cond_114

    .line 246
    const/4 v1, 0x0

    .line 247
    .local v1, "got":I
    const/4 v5, 0x0

    .line 248
    .local v5, "val":I
    :goto_a
    if-ge v1, v11, :cond_f7

    .line 249
    invoke-direct {p0}, Lcom/sun/mail/util/BASE64DecoderStream;->getByte()I

    move-result v2

    .line 250
    .local v2, "i":I
    if-eq v2, v8, :cond_14

    if-ne v2, v9, :cond_f0

    .line 252
    :cond_14
    if-ne v2, v8, :cond_7b

    .line 253
    if-nez v1, :cond_1b

    .line 254
    sub-int v6, p2, v3

    .line 342
    .end local v1    # "got":I
    .end local v2    # "i":I
    .end local v5    # "val":I
    :goto_1a
    return v6

    .line 255
    .restart local v1    # "got":I
    .restart local v2    # "i":I
    .restart local v5    # "val":I
    :cond_1b
    iget-boolean v6, p0, Lcom/sun/mail/util/BASE64DecoderStream;->ignoreErrors:Z

    if-nez v6, :cond_46

    .line 256
    new-instance v6, Lcom/sun/mail/util/DecodingException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "BASE64Decoder: Error in encoded stream: needed 4 valid base64 characters but only got "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " before EOF"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 260
    invoke-direct {p0}, Lcom/sun/mail/util/BASE64DecoderStream;->recentChars()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/sun/mail/util/DecodingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 261
    :cond_46
    const/4 v0, 0x1

    .line 283
    .local v0, "atEOF":Z
    :goto_47
    add-int/lit8 v4, v1, -0x1

    .line 284
    .local v4, "size":I
    if-nez v4, :cond_4c

    .line 285
    const/4 v4, 0x1

    .line 288
    :cond_4c
    add-int/lit8 v1, v1, 0x1

    .line 289
    shl-int/lit8 v5, v5, 0x6

    .line 291
    :goto_50
    if-ge v1, v11, :cond_d9

    .line 292
    if-nez v0, :cond_d3

    .line 295
    invoke-direct {p0}, Lcom/sun/mail/util/BASE64DecoderStream;->getByte()I

    move-result v2

    .line 296
    if-ne v2, v8, :cond_b0

    .line 297
    iget-boolean v6, p0, Lcom/sun/mail/util/BASE64DecoderStream;->ignoreErrors:Z

    if-nez v6, :cond_d3

    .line 298
    new-instance v6, Lcom/sun/mail/util/DecodingException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "BASE64Decoder: Error in encoded stream: hit EOF while looking for padding characters (=)"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 302
    invoke-direct {p0}, Lcom/sun/mail/util/BASE64DecoderStream;->recentChars()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/sun/mail/util/DecodingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 265
    .end local v0    # "atEOF":Z
    .end local v4    # "size":I
    :cond_7b
    if-ge v1, v10, :cond_a8

    iget-boolean v6, p0, Lcom/sun/mail/util/BASE64DecoderStream;->ignoreErrors:Z

    if-nez v6, :cond_a8

    .line 266
    new-instance v6, Lcom/sun/mail/util/DecodingException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "BASE64Decoder: Error in encoded stream: needed at least 2 valid base64 characters, but only got "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " before padding character (=)"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 271
    invoke-direct {p0}, Lcom/sun/mail/util/BASE64DecoderStream;->recentChars()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/sun/mail/util/DecodingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 274
    :cond_a8
    if-nez v1, :cond_ae

    .line 275
    sub-int v6, p2, v3

    goto/16 :goto_1a

    .line 276
    :cond_ae
    const/4 v0, 0x0

    .restart local v0    # "atEOF":Z
    goto :goto_47

    .line 303
    .restart local v4    # "size":I
    :cond_b0
    if-eq v2, v9, :cond_d3

    .line 304
    iget-boolean v6, p0, Lcom/sun/mail/util/BASE64DecoderStream;->ignoreErrors:Z

    if-nez v6, :cond_d3

    .line 305
    new-instance v6, Lcom/sun/mail/util/DecodingException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "BASE64Decoder: Error in encoded stream: found valid base64 character after a padding character (=)"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    .line 309
    invoke-direct {p0}, Lcom/sun/mail/util/BASE64DecoderStream;->recentChars()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/sun/mail/util/DecodingException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 312
    :cond_d3
    shl-int/lit8 v5, v5, 0x6

    .line 313
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_50

    .line 317
    :cond_d9
    shr-int/lit8 v5, v5, 0x8

    .line 318
    if-ne v4, v10, :cond_e4

    .line 319
    add-int/lit8 v6, p2, 0x1

    and-int/lit16 v7, v5, 0xff

    int-to-byte v7, v7

    aput-byte v7, p1, v6

    .line 320
    :cond_e4
    shr-int/lit8 v5, v5, 0x8

    .line 321
    and-int/lit16 v6, v5, 0xff

    int-to-byte v6, v6

    aput-byte v6, p1, p2

    .line 323
    add-int/2addr p2, v4

    .line 324
    sub-int v6, p2, v3

    goto/16 :goto_1a

    .line 327
    .end local v0    # "atEOF":Z
    .end local v4    # "size":I
    :cond_f0
    shl-int/lit8 v5, v5, 0x6

    .line 328
    add-int/lit8 v1, v1, 0x1

    .line 329
    or-int/2addr v5, v2

    .line 331
    goto/16 :goto_a

    .line 334
    .end local v2    # "i":I
    :cond_f7
    add-int/lit8 v6, p2, 0x2

    and-int/lit16 v7, v5, 0xff

    int-to-byte v7, v7

    aput-byte v7, p1, v6

    .line 335
    shr-int/lit8 v5, v5, 0x8

    .line 336
    add-int/lit8 v6, p2, 0x1

    and-int/lit16 v7, v5, 0xff

    int-to-byte v7, v7

    aput-byte v7, p1, v6

    .line 337
    shr-int/lit8 v5, v5, 0x8

    .line 338
    and-int/lit16 v6, v5, 0xff

    int-to-byte v6, v6

    aput-byte v6, p1, p2

    .line 339
    add-int/lit8 p3, p3, -0x3

    .line 340
    add-int/lit8 p2, p2, 0x3

    .line 341
    goto/16 :goto_5

    .line 342
    .end local v1    # "got":I
    .end local v5    # "val":I
    :cond_114
    sub-int v6, p2, v3

    goto/16 :goto_1a
.end method

.method public static decode([B)[B
    .registers 11
    .param p0, "inbuf"    # [B

    .prologue
    const/16 v9, 0x3d

    .line 417
    array-length v7, p0

    div-int/lit8 v7, v7, 0x4

    mul-int/lit8 v5, v7, 0x3

    .line 418
    .local v5, "size":I
    if-nez v5, :cond_a

    .line 456
    .end local p0    # "inbuf":[B
    :goto_9
    return-object p0

    .line 421
    .restart local p0    # "inbuf":[B
    :cond_a
    array-length v7, p0

    add-int/lit8 v7, v7, -0x1

    aget-byte v7, p0, v7

    if-ne v7, v9, :cond_1c

    .line 422
    add-int/lit8 v5, v5, -0x1

    .line 423
    array-length v7, p0

    add-int/lit8 v7, v7, -0x2

    aget-byte v7, p0, v7

    if-ne v7, v9, :cond_1c

    .line 424
    add-int/lit8 v5, v5, -0x1

    .line 426
    :cond_1c
    new-array v3, v5, [B

    .line 428
    .local v3, "outbuf":[B
    const/4 v0, 0x0

    .local v0, "inpos":I
    const/4 v4, 0x0

    .line 429
    .local v4, "outpos":I
    array-length v5, p0

    move v1, v0

    .line 430
    .end local v0    # "inpos":I
    .local v1, "inpos":I
    :goto_22
    if-lez v5, :cond_88

    .line 432
    const/4 v2, 0x3

    .line 433
    .local v2, "osize":I
    sget-object v7, Lcom/sun/mail/util/BASE64DecoderStream;->pem_convert_array:[B

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "inpos":I
    .restart local v0    # "inpos":I
    aget-byte v8, p0, v1

    and-int/lit16 v8, v8, 0xff

    aget-byte v6, v7, v8

    .line 434
    .local v6, "val":I
    shl-int/lit8 v6, v6, 0x6

    .line 435
    sget-object v7, Lcom/sun/mail/util/BASE64DecoderStream;->pem_convert_array:[B

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "inpos":I
    .restart local v1    # "inpos":I
    aget-byte v8, p0, v0

    and-int/lit16 v8, v8, 0xff

    aget-byte v7, v7, v8

    or-int/2addr v6, v7

    .line 436
    shl-int/lit8 v6, v6, 0x6

    .line 437
    aget-byte v7, p0, v1

    if-eq v7, v9, :cond_81

    .line 438
    sget-object v7, Lcom/sun/mail/util/BASE64DecoderStream;->pem_convert_array:[B

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "inpos":I
    .restart local v0    # "inpos":I
    aget-byte v8, p0, v1

    and-int/lit16 v8, v8, 0xff

    aget-byte v7, v7, v8

    or-int/2addr v6, v7

    .line 441
    :goto_4d
    shl-int/lit8 v6, v6, 0x6

    .line 442
    aget-byte v7, p0, v0

    if-eq v7, v9, :cond_85

    .line 443
    sget-object v7, Lcom/sun/mail/util/BASE64DecoderStream;->pem_convert_array:[B

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "inpos":I
    .restart local v1    # "inpos":I
    aget-byte v8, p0, v0

    and-int/lit16 v8, v8, 0xff

    aget-byte v7, v7, v8

    or-int/2addr v6, v7

    move v0, v1

    .line 446
    .end local v1    # "inpos":I
    .restart local v0    # "inpos":I
    :goto_5f
    const/4 v7, 0x2

    if-le v2, v7, :cond_69

    .line 447
    add-int/lit8 v7, v4, 0x2

    and-int/lit16 v8, v6, 0xff

    int-to-byte v8, v8

    aput-byte v8, v3, v7

    .line 448
    :cond_69
    shr-int/lit8 v6, v6, 0x8

    .line 449
    const/4 v7, 0x1

    if-le v2, v7, :cond_75

    .line 450
    add-int/lit8 v7, v4, 0x1

    and-int/lit16 v8, v6, 0xff

    int-to-byte v8, v8

    aput-byte v8, v3, v7

    .line 451
    :cond_75
    shr-int/lit8 v6, v6, 0x8

    .line 452
    and-int/lit16 v7, v6, 0xff

    int-to-byte v7, v7

    aput-byte v7, v3, v4

    .line 453
    add-int/2addr v4, v2

    .line 454
    add-int/lit8 v5, v5, -0x4

    move v1, v0

    .line 455
    .end local v0    # "inpos":I
    .restart local v1    # "inpos":I
    goto :goto_22

    .line 440
    :cond_81
    add-int/lit8 v2, v2, -0x1

    move v0, v1

    .end local v1    # "inpos":I
    .restart local v0    # "inpos":I
    goto :goto_4d

    .line 445
    :cond_85
    add-int/lit8 v2, v2, -0x1

    goto :goto_5f

    .end local v0    # "inpos":I
    .end local v2    # "osize":I
    .end local v6    # "val":I
    .restart local v1    # "inpos":I
    :cond_88
    move-object p0, v3

    .line 456
    goto :goto_9
.end method

.method private getByte()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 356
    :cond_1
    iget v3, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    iget v4, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_len:I

    if-lt v3, v4, :cond_1d

    .line 358
    :try_start_7
    iget-object v3, p0, Lcom/sun/mail/util/BASE64DecoderStream;->in:Ljava/io/InputStream;

    iget-object v4, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_buffer:[B

    invoke-virtual {v3, v4}, Ljava/io/InputStream;->read([B)I

    move-result v3

    iput v3, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_len:I
    :try_end_11
    .catch Ljava/io/EOFException; {:try_start_7 .. :try_end_11} :catch_17

    .line 362
    iget v3, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_len:I

    if-gtz v3, :cond_1a

    move v0, v2

    .line 375
    :goto_16
    return v0

    .line 359
    :catch_17
    move-exception v1

    .local v1, "ex":Ljava/io/EOFException;
    move v0, v2

    .line 360
    goto :goto_16

    .line 364
    .end local v1    # "ex":Ljava/io/EOFException;
    :cond_1a
    const/4 v3, 0x0

    iput v3, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    .line 367
    :cond_1d
    iget-object v3, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_buffer:[B

    iget v4, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    aget-byte v3, v3, v4

    and-int/lit16 v0, v3, 0xff

    .line 369
    .local v0, "c":I
    const/16 v3, 0x3d

    if-ne v0, v3, :cond_2f

    .line 370
    const/4 v0, -0x2

    goto :goto_16

    .line 372
    :cond_2f
    sget-object v3, Lcom/sun/mail/util/BASE64DecoderStream;->pem_convert_array:[B

    aget-byte v0, v3, v0

    .line 374
    if-eq v0, v2, :cond_1

    goto :goto_16
.end method

.method private recentChars()Ljava/lang/String;
    .registers 7

    .prologue
    const/16 v3, 0xa

    .line 384
    const-string v1, ""

    .line 385
    .local v1, "errstr":Ljava/lang/String;
    iget v4, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    if-le v4, v3, :cond_55

    .line 386
    .local v3, "nc":I
    :goto_8
    if-lez v3, :cond_bf

    .line 387
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", the "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " most recent characters were: \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 389
    iget v4, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    sub-int v2, v4, v3

    .local v2, "k":I
    :goto_2b
    iget v4, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    if-ge v2, v4, :cond_ac

    .line 390
    iget-object v4, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_buffer:[B

    aget-byte v4, v4, v2

    and-int/lit16 v4, v4, 0xff

    int-to-char v0, v4

    .line 391
    .local v0, "c":C
    packed-switch v0, :pswitch_data_c0

    .line 396
    :pswitch_39
    const/16 v4, 0x20

    if-lt v0, v4, :cond_94

    const/16 v4, 0x7f

    if-ge v0, v4, :cond_94

    .line 397
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 389
    :goto_52
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    .line 385
    .end local v0    # "c":C
    .end local v2    # "k":I
    .end local v3    # "nc":I
    :cond_55
    iget v3, p0, Lcom/sun/mail/util/BASE64DecoderStream;->input_pos:I

    goto :goto_8

    .line 392
    .restart local v0    # "c":C
    .restart local v2    # "k":I
    .restart local v3    # "nc":I
    :pswitch_58
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\\r"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_52

    .line 393
    :pswitch_6c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_52

    .line 394
    :pswitch_80
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\\t"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_52

    .line 399
    :cond_94
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\\"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_52

    .line 402
    .end local v0    # "c":C
    :cond_ac
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 404
    .end local v2    # "k":I
    :cond_bf
    return-object v1

    .line 391
    :pswitch_data_c0
    .packed-switch 0x9
        :pswitch_80
        :pswitch_6c
        :pswitch_39
        :pswitch_39
        :pswitch_58
    .end packed-switch
.end method


# virtual methods
.method public available()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    iget-object v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->bufsize:I

    iget v2, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    sub-int/2addr v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 185
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 109
    iget v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    iget v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->bufsize:I

    if-lt v0, v1, :cond_1a

    .line 110
    iget-object v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->buffer:[B

    iget-object v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->buffer:[B

    array-length v1, v1

    invoke-direct {p0, v0, v2, v1}, Lcom/sun/mail/util/BASE64DecoderStream;->decode([BII)I

    move-result v0

    iput v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->bufsize:I

    .line 111
    iget v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->bufsize:I

    if-gtz v0, :cond_18

    .line 112
    const/4 v0, -0x1

    .line 115
    :goto_17
    return v0

    .line 113
    :cond_18
    iput v2, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    .line 115
    :cond_1a
    iget-object v0, p0, Lcom/sun/mail/util/BASE64DecoderStream;->buffer:[B

    iget v1, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    goto :goto_17
.end method

.method public read([BII)I
    .registers 13
    .param p1, "buf"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 134
    move v3, p2

    .line 135
    .local v3, "off0":I
    :goto_2
    iget v6, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    iget v7, p0, Lcom/sun/mail/util/BASE64DecoderStream;->bufsize:I

    if-ge v6, v7, :cond_1c

    if-lez p3, :cond_1c

    .line 136
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "off":I
    .local v2, "off":I
    iget-object v6, p0, Lcom/sun/mail/util/BASE64DecoderStream;->buffer:[B

    iget v7, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    aget-byte v6, v6, v7

    aput-byte v6, p1, p2

    .line 137
    add-int/lit8 p3, p3, -0x1

    move p2, v2

    .end local v2    # "off":I
    .restart local p2    # "off":I
    goto :goto_2

    .line 139
    :cond_1c
    iget v6, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    iget v7, p0, Lcom/sun/mail/util/BASE64DecoderStream;->bufsize:I

    if-lt v6, v7, :cond_27

    .line 140
    const/4 v6, 0x0

    iput v6, p0, Lcom/sun/mail/util/BASE64DecoderStream;->index:I

    iput v6, p0, Lcom/sun/mail/util/BASE64DecoderStream;->bufsize:I

    .line 142
    :cond_27
    div-int/lit8 v6, p3, 0x3

    mul-int/lit8 v0, v6, 0x3

    .line 143
    .local v0, "bsize":I
    if-lez v0, :cond_53

    .line 144
    invoke-direct {p0, p1, p2, v0}, Lcom/sun/mail/util/BASE64DecoderStream;->decode([BII)I

    move-result v4

    .line 145
    .local v4, "size":I
    add-int/2addr p2, v4

    .line 146
    sub-int/2addr p3, v4

    .line 148
    if-eq v4, v0, :cond_53

    .line 149
    if-ne p2, v3, :cond_38

    .line 167
    .end local v4    # "size":I
    :goto_37
    return v5

    .line 152
    .restart local v4    # "size":I
    :cond_38
    sub-int v5, p2, v3

    goto :goto_37

    .line 161
    .end local v4    # "size":I
    .end local p2    # "off":I
    .local v1, "c":I
    .restart local v2    # "off":I
    :cond_3b
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "off":I
    .restart local p2    # "off":I
    int-to-byte v6, v1

    aput-byte v6, p1, v2

    .line 157
    add-int/lit8 p3, p3, -0x1

    move v2, p2

    .end local v1    # "c":I
    .end local p2    # "off":I
    .restart local v2    # "off":I
    :goto_43
    if-lez p3, :cond_4b

    .line 158
    invoke-virtual {p0}, Lcom/sun/mail/util/BASE64DecoderStream;->read()I

    move-result v1

    .line 159
    .restart local v1    # "c":I
    if-ne v1, v5, :cond_3b

    .line 164
    .end local v1    # "c":I
    :cond_4b
    if-ne v2, v3, :cond_4f

    move p2, v2

    .line 165
    .end local v2    # "off":I
    .restart local p2    # "off":I
    goto :goto_37

    .line 167
    .end local p2    # "off":I
    .restart local v2    # "off":I
    :cond_4f
    sub-int v5, v2, v3

    move p2, v2

    .end local v2    # "off":I
    .restart local p2    # "off":I
    goto :goto_37

    :cond_53
    move v2, p2

    .end local p2    # "off":I
    .restart local v2    # "off":I
    goto :goto_43
.end method

.method public skip(J)J
    .registers 11
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x1

    .line 174
    const-wide/16 v2, 0x0

    .local v2, "skipped":J
    move-wide v0, p1

    .line 175
    .end local p1    # "n":J
    .local v0, "n":J
    :goto_5
    sub-long p1, v0, v6

    .end local v0    # "n":J
    .restart local p1    # "n":J
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-lez v4, :cond_16

    invoke-virtual {p0}, Lcom/sun/mail/util/BASE64DecoderStream;->read()I

    move-result v4

    if-ltz v4, :cond_16

    .line 176
    add-long/2addr v2, v6

    move-wide v0, p1

    .end local p1    # "n":J
    .restart local v0    # "n":J
    goto :goto_5

    .line 177
    .end local v0    # "n":J
    .restart local p1    # "n":J
    :cond_16
    return-wide v2
.end method
