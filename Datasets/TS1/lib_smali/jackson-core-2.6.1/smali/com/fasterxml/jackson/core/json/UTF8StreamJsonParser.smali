.class public Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;
.super Lcom/fasterxml/jackson/core/base/ParserBase;
.source "UTF8StreamJsonParser.java"


# static fields
.field static final BYTE_LF:B = 0xat

.field protected static final _icLatin1:[I

.field private static final _icUTF8:[I


# instance fields
.field protected _bufferRecyclable:Z

.field protected _inputBuffer:[B

.field protected _inputStream:Ljava/io/InputStream;

.field protected _objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

.field private _quad1:I

.field protected _quadBuffer:[I

.field protected final _symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

.field protected _tokenIncomplete:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 27
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8()[I

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 31
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeLatin1()[I

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILjava/io/InputStream;Lcom/fasterxml/jackson/core/ObjectCodec;Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;[BIIZ)V
    .registers 12
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/core/io/IOContext;
    .param p2, "features"    # I
    .param p3, "in"    # Ljava/io/InputStream;
    .param p4, "codec"    # Lcom/fasterxml/jackson/core/ObjectCodec;
    .param p5, "sym"    # Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;
    .param p6, "inputBuffer"    # [B
    .param p7, "start"    # I
    .param p8, "end"    # I
    .param p9, "bufferRecyclable"    # Z

    .prologue
    .line 115
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/base/ParserBase;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;I)V

    .line 60
    const/16 v0, 0x10

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 116
    iput-object p3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    .line 117
    iput-object p4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    .line 118
    iput-object p5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    .line 119
    iput-object p6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 120
    iput p7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 121
    iput p8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 122
    iput p7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 124
    neg-int v0, p7

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    .line 125
    iput-boolean p9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_bufferRecyclable:Z

    .line 126
    return-void
.end method

.method private final _checkMatchEnd(Ljava/lang/String;II)V
    .registers 6
    .param p1, "matchStr"    # Ljava/lang/String;
    .param p2, "i"    # I
    .param p3, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2781
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeCharForError(I)I

    move-result v1

    int-to-char v0, v1

    .line 2782
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 2783
    const/4 v1, 0x0

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidToken(Ljava/lang/String;)V

    .line 2785
    :cond_13
    return-void
.end method

.method private final _decodeUtf8_2(I)I
    .registers 6
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3246
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_9

    .line 3247
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3249
    :cond_9
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3250
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-eq v1, v2, :cond_20

    .line 3251
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3253
    :cond_20
    and-int/lit8 v1, p1, 0x1f

    shl-int/lit8 v1, v1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int/2addr v1, v2

    return v1
.end method

.method private final _decodeUtf8_3(I)I
    .registers 8
    .param p1, "c1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x80

    .line 3258
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_b

    .line 3259
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3261
    :cond_b
    and-int/lit8 p1, p1, 0xf

    .line 3262
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 3263
    .local v1, "d":I
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_22

    .line 3264
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3266
    :cond_22
    shl-int/lit8 v2, p1, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 3267
    .local v0, "c":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_31

    .line 3268
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3270
    :cond_31
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 3271
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_46

    .line 3272
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3274
    :cond_46
    shl-int/lit8 v2, v0, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 3275
    return v0
.end method

.method private final _decodeUtf8_3fast(I)I
    .registers 8
    .param p1, "c1"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x80

    .line 3280
    and-int/lit8 p1, p1, 0xf

    .line 3281
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 3282
    .local v1, "d":I
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_19

    .line 3283
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3285
    :cond_19
    shl-int/lit8 v2, p1, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 3286
    .local v0, "c":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 3287
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_34

    .line 3288
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3290
    :cond_34
    shl-int/lit8 v2, v0, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 3291
    return v0
.end method

.method private final _decodeUtf8_4(I)I
    .registers 7
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x80

    .line 3300
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_b

    .line 3301
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3303
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3304
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_20

    .line 3305
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3307
    :cond_20
    and-int/lit8 v1, p1, 0x7

    shl-int/lit8 v1, v1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int p1, v1, v2

    .line 3309
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_31

    .line 3310
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3312
    :cond_31
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3313
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_46

    .line 3314
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3316
    :cond_46
    shl-int/lit8 v1, p1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int p1, v1, v2

    .line 3317
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_55

    .line 3318
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3320
    :cond_55
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3321
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_6a

    .line 3322
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3328
    :cond_6a
    shl-int/lit8 v1, p1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int/2addr v1, v2

    const/high16 v2, 0x10000

    sub-int/2addr v1, v2

    return v1
.end method

.method private final _finishString2([CI)V
    .registers 12
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2421
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 2422
    .local v1, "codes":[I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 2429
    .local v2, "inputBuffer":[B
    :goto_4
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2430
    .local v5, "ptr":I
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v5, v7, :cond_f

    .line 2431
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 2432
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2434
    :cond_f
    array-length v7, p1

    if-lt p2, v7, :cond_19

    .line 2435
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 2436
    const/4 p2, 0x0

    .line 2438
    :cond_19
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    array-length v8, p1

    sub-int/2addr v8, p2

    add-int/2addr v8, v5

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v3

    .local v3, "max":I
    move v6, v5

    .end local v5    # "ptr":I
    .local v6, "ptr":I
    move v4, p2

    .line 2439
    .end local p2    # "outPtr":I
    .local v4, "outPtr":I
    :goto_24
    if-ge v6, v3, :cond_44

    .line 2440
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "ptr":I
    .restart local v5    # "ptr":I
    aget-byte v7, v2, v6

    and-int/lit16 v0, v7, 0xff

    .line 2441
    .local v0, "c":I
    aget v7, v1, v0

    if-eqz v7, :cond_3c

    .line 2442
    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2450
    const/16 v7, 0x22

    if-ne v0, v7, :cond_48

    .line 2496
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2497
    return-void

    .line 2445
    :cond_3c
    add-int/lit8 p2, v4, 0x1

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    int-to-char v7, v0

    aput-char v7, p1, v4

    move v6, v5

    .end local v5    # "ptr":I
    .restart local v6    # "ptr":I
    move v4, p2

    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    goto :goto_24

    .line 2447
    .end local v0    # "c":I
    :cond_44
    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move p2, v4

    .line 2448
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_4

    .line 2454
    .end local v6    # "ptr":I
    .end local p2    # "outPtr":I
    .restart local v0    # "c":I
    .restart local v4    # "outPtr":I
    .restart local v5    # "ptr":I
    :cond_48
    aget v7, v1, v0

    packed-switch v7, :pswitch_data_ae

    .line 2480
    const/16 v7, 0x20

    if-ge v0, v7, :cond_a9

    .line 2482
    const-string v7, "string value"

    invoke-virtual {p0, v0, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    move p2, v4

    .line 2489
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_57
    array-length v7, p1

    if-lt p2, v7, :cond_61

    .line 2490
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 2491
    const/4 p2, 0x0

    .line 2494
    :cond_61
    add-int/lit8 v4, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    int-to-char v7, v0

    aput-char v7, p1, p2

    move p2, v4

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_4

    .line 2456
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_68
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    move-result v0

    move p2, v4

    .line 2457
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2459
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_6e
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_2(I)I

    move-result v0

    move p2, v4

    .line 2460
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2462
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_74
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    sub-int/2addr v7, v8

    const/4 v8, 0x2

    if-lt v7, v8, :cond_82

    .line 2463
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_3fast(I)I

    move-result v0

    move p2, v4

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2465
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :cond_82
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_3(I)I

    move-result v0

    move p2, v4

    .line 2467
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2469
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_88
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_4(I)I

    move-result v0

    .line 2471
    add-int/lit8 p2, v4, 0x1

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    const v7, 0xd800

    shr-int/lit8 v8, v0, 0xa

    or-int/2addr v7, v8

    int-to-char v7, v7

    aput-char v7, p1, v4

    .line 2472
    array-length v7, p1

    if-lt p2, v7, :cond_a1

    .line 2473
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 2474
    const/4 p2, 0x0

    .line 2476
    :cond_a1
    const v7, 0xdc00

    and-int/lit16 v8, v0, 0x3ff

    or-int v0, v7, v8

    .line 2478
    goto :goto_57

    .line 2485
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :cond_a9
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    move p2, v4

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2454
    :pswitch_data_ae
    .packed-switch 0x1
        :pswitch_68
        :pswitch_6e
        :pswitch_74
        :pswitch_88
    .end packed-switch
.end method

.method private final _isNextTokenNameMaybe(ILcom/fasterxml/jackson/core/SerializableString;)Z
    .registers 8
    .param p1, "i"    # I
    .param p2, "str"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 1158
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseName(I)Ljava/lang/String;

    move-result-object v1

    .line 1159
    .local v1, "n":Ljava/lang/String;
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3, v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 1160
    invoke-interface {p2}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1161
    .local v0, "match":Z
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1162
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon()I

    move-result p1

    .line 1165
    const/16 v3, 0x22

    if-ne p1, v3, :cond_25

    .line 1166
    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 1167
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1210
    :goto_24
    return v0

    .line 1172
    :cond_25
    sparse-switch p1, :sswitch_data_58

    .line 1207
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 1209
    .local v2, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_2c
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_24

    .line 1174
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_2f
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1175
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_2c

    .line 1177
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_32
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1178
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_2c

    .line 1180
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_35
    const-string v3, "true"

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1181
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1182
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_2c

    .line 1184
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_3d
    const-string v3, "false"

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1185
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1186
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_2c

    .line 1188
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_45
    const-string v3, "null"

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1189
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1190
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_2c

    .line 1192
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_4d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 1193
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_2c

    .line 1204
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_52
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 1205
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_2c

    .line 1172
    nop

    :sswitch_data_58
    .sparse-switch
        0x2d -> :sswitch_4d
        0x30 -> :sswitch_52
        0x31 -> :sswitch_52
        0x32 -> :sswitch_52
        0x33 -> :sswitch_52
        0x34 -> :sswitch_52
        0x35 -> :sswitch_52
        0x36 -> :sswitch_52
        0x37 -> :sswitch_52
        0x38 -> :sswitch_52
        0x39 -> :sswitch_52
        0x5b -> :sswitch_2f
        0x66 -> :sswitch_3d
        0x6e -> :sswitch_45
        0x74 -> :sswitch_35
        0x7b -> :sswitch_32
    .end sparse-switch
.end method

.method private final _isNextTokenNameYes(I)V
    .registers 4
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 1109
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1111
    sparse-switch p1, :sswitch_data_4c

    .line 1150
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1151
    :goto_e
    return-void

    .line 1113
    :sswitch_f
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 1114
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 1117
    :sswitch_16
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 1120
    :sswitch_1b
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 1123
    :sswitch_20
    const-string v0, "true"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1124
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 1127
    :sswitch_2a
    const-string v0, "false"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1128
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 1131
    :sswitch_34
    const-string v0, "null"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1132
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 1135
    :sswitch_3e
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 1147
    :sswitch_45
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 1111
    :sswitch_data_4c
    .sparse-switch
        0x22 -> :sswitch_f
        0x2d -> :sswitch_3e
        0x30 -> :sswitch_45
        0x31 -> :sswitch_45
        0x32 -> :sswitch_45
        0x33 -> :sswitch_45
        0x34 -> :sswitch_45
        0x35 -> :sswitch_45
        0x36 -> :sswitch_45
        0x37 -> :sswitch_45
        0x38 -> :sswitch_45
        0x39 -> :sswitch_45
        0x5b -> :sswitch_16
        0x66 -> :sswitch_2a
        0x6e -> :sswitch_34
        0x74 -> :sswitch_20
        0x7b -> :sswitch_1b
    .end sparse-switch
.end method

.method private final _matchToken2(Ljava/lang/String;I)V
    .registers 7
    .param p1, "matchStr"    # Ljava/lang/String;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2760
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2762
    .local v1, "len":I
    :cond_4
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_10

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v2

    if-eqz v2, :cond_1c

    :cond_10
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_24

    .line 2764
    :cond_1c
    const/4 v2, 0x0

    invoke-virtual {p1, v2, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidToken(Ljava/lang/String;)V

    .line 2766
    :cond_24
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2767
    add-int/lit8 p2, p2, 0x1

    if-lt p2, v1, :cond_4

    .line 2770
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_3b

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v2

    if-nez v2, :cond_3b

    .line 2777
    :cond_3a
    :goto_3a
    return-void

    .line 2773
    :cond_3b
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 2774
    .local v0, "ch":I
    const/16 v2, 0x30

    if-lt v0, v2, :cond_3a

    const/16 v2, 0x5d

    if-eq v0, v2, :cond_3a

    const/16 v2, 0x7d

    if-eq v0, v2, :cond_3a

    .line 2775
    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_checkMatchEnd(Ljava/lang/String;II)V

    goto :goto_3a
.end method

.method private final _nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;
    .registers 5

    .prologue
    .line 846
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 847
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 848
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 850
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1b

    .line 851
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 855
    :cond_18
    :goto_18
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 852
    :cond_1b
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_18

    .line 853
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18
.end method

.method private final _nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 5
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 803
    const/16 v0, 0x22

    if-ne p1, v0, :cond_c

    .line 804
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 805
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 841
    :goto_b
    return-object v0

    .line 807
    :cond_c
    sparse-switch p1, :sswitch_data_64

    .line 841
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 809
    :sswitch_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 810
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 812
    :sswitch_27
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 813
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 815
    :sswitch_38
    const-string v0, "true"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 816
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 818
    :sswitch_42
    const-string v0, "false"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 819
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 821
    :sswitch_4c
    const-string v0, "null"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 822
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 824
    :sswitch_56
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 839
    :sswitch_5d
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 807
    :sswitch_data_64
    .sparse-switch
        0x2d -> :sswitch_56
        0x30 -> :sswitch_5d
        0x31 -> :sswitch_5d
        0x32 -> :sswitch_5d
        0x33 -> :sswitch_5d
        0x34 -> :sswitch_5d
        0x35 -> :sswitch_5d
        0x36 -> :sswitch_5d
        0x37 -> :sswitch_5d
        0x38 -> :sswitch_5d
        0x39 -> :sswitch_5d
        0x5b -> :sswitch_16
        0x66 -> :sswitch_42
        0x6e -> :sswitch_4c
        0x74 -> :sswitch_38
        0x7b -> :sswitch_27
    .end sparse-switch
.end method

.method private final _parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 15
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .param p3, "c"    # I
    .param p4, "negative"    # Z
    .param p5, "integerPartLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x39

    const/16 v7, 0x30

    .line 1521
    const/4 v2, 0x0

    .line 1522
    .local v2, "fractLen":I
    const/4 v0, 0x0

    .line 1525
    .local v0, "eof":Z
    const/16 v4, 0x2e

    if-ne p3, v4, :cond_24

    .line 1526
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .local v3, "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    move p2, v3

    .line 1530
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_10
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_c5

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v4

    if-nez v4, :cond_c5

    .line 1531
    const/4 v0, 0x1

    .line 1546
    :cond_1d
    if-nez v2, :cond_24

    .line 1547
    const-string v4, "Decimal point not followed by a digit"

    invoke-virtual {p0, p3, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1551
    :cond_24
    const/4 v1, 0x0

    .line 1552
    .local v1, "expLen":I
    const/16 v4, 0x65

    if-eq p3, v4, :cond_2d

    const/16 v4, 0x45

    if-ne p3, v4, :cond_a8

    .line 1553
    :cond_2d
    array-length v4, p1

    if-lt p2, v4, :cond_37

    .line 1554
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1555
    const/4 p2, 0x0

    .line 1557
    :cond_37
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1559
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_45

    .line 1560
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 1562
    :cond_45
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    .line 1564
    const/16 v4, 0x2d

    if-eq p3, v4, :cond_59

    const/16 v4, 0x2b

    if-ne p3, v4, :cond_fa

    .line 1565
    :cond_59
    array-length v4, p1

    if-lt v3, v4, :cond_f7

    .line 1566
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1567
    const/4 p2, 0x0

    .line 1569
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_63
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1571
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_71

    .line 1572
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 1574
    :cond_71
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    move p2, v3

    .line 1578
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_7e
    if-gt p3, v8, :cond_a1

    if-lt p3, v7, :cond_a1

    .line 1579
    add-int/lit8 v1, v1, 0x1

    .line 1580
    array-length v4, p1

    if-lt p2, v4, :cond_8e

    .line 1581
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1582
    const/4 p2, 0x0

    .line 1584
    :cond_8e
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1585
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_e9

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v4

    if-nez v4, :cond_e9

    .line 1586
    const/4 v0, 0x1

    move p2, v3

    .line 1592
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :cond_a1
    if-nez v1, :cond_a8

    .line 1593
    const-string v4, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, p3, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1598
    :cond_a8
    if-nez v0, :cond_bb

    .line 1599
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1601
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v4

    if-eqz v4, :cond_bb

    .line 1602
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyRootSpace(I)V

    .line 1605
    :cond_bb
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1608
    invoke-virtual {p0, p4, p5, v2, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetFloat(ZIII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    return-object v4

    .line 1534
    .end local v1    # "expLen":I
    :cond_c5
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    .line 1535
    if-lt p3, v7, :cond_1d

    if-gt p3, v8, :cond_1d

    .line 1538
    add-int/lit8 v2, v2, 0x1

    .line 1539
    array-length v4, p1

    if-lt p2, v4, :cond_e1

    .line 1540
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1541
    const/4 p2, 0x0

    .line 1543
    :cond_e1
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    move p2, v3

    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto/16 :goto_10

    .line 1589
    .end local p2    # "outPtr":I
    .restart local v1    # "expLen":I
    .restart local v3    # "outPtr":I
    :cond_e9
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    move p2, v3

    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_7e

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    :cond_f7
    move p2, v3

    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto/16 :goto_63

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    :cond_fa
    move p2, v3

    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_7e
.end method

.method private final _parseNumber2([CIZI)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 12
    .param p1, "outBuf"    # [C
    .param p2, "outPtr"    # I
    .param p3, "negative"    # Z
    .param p4, "intPartLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1452
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_16

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_16

    .line 1453
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1454
    invoke-virtual {p0, p3, p4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 1478
    :goto_15
    return-object v0

    .line 1456
    :cond_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v3, v0, 0xff

    .line 1457
    .local v3, "c":I
    const/16 v0, 0x39

    if-gt v3, v0, :cond_2a

    const/16 v0, 0x30

    if-ge v3, v0, :cond_40

    .line 1458
    :cond_2a
    const/16 v0, 0x2e

    if-eq v3, v0, :cond_36

    const/16 v0, 0x65

    if-eq v3, v0, :cond_36

    const/16 v0, 0x45

    if-ne v3, v0, :cond_53

    :cond_36
    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    .line 1459
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_15

    .line 1463
    :cond_40
    array-length v0, p1

    if-lt p2, v0, :cond_4a

    .line 1464
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1465
    const/4 p2, 0x0

    .line 1467
    :cond_4a
    add-int/lit8 v6, p2, 0x1

    .end local p2    # "outPtr":I
    .local v6, "outPtr":I
    int-to-char v0, v3

    aput-char v0, p1, p2

    .line 1468
    add-int/lit8 p4, p4, 0x1

    move p2, v6

    .line 1469
    .end local v6    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_0

    .line 1470
    :cond_53
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1471
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1473
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_75

    .line 1474
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyRootSpace(I)V

    .line 1478
    :cond_75
    invoke-virtual {p0, p3, p4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_15
.end method

.method private final _skipCComment()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3045
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeComment()[I

    move-result-object v1

    .line 3049
    .local v1, "codes":[I
    :cond_4
    :goto_4
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_10

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v3

    if-eqz v3, :cond_33

    .line 3050
    :cond_10
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 v2, v3, 0xff

    .line 3051
    .local v2, "i":I
    aget v0, v1, v2

    .line 3052
    .local v0, "code":I
    if-eqz v0, :cond_4

    .line 3053
    sparse-switch v0, :sswitch_data_66

    .line 3081
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    goto :goto_4

    .line 3055
    :sswitch_27
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_39

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_39

    .line 3085
    .end local v0    # "code":I
    .end local v2    # "i":I
    :cond_33
    const-string v3, " in a comment"

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 3086
    :goto_38
    return-void

    .line 3058
    .restart local v0    # "code":I
    .restart local v2    # "i":I
    :cond_39
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_4

    .line 3059
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_38

    .line 3064
    :sswitch_4a
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 3065
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_4

    .line 3068
    :sswitch_55
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_4

    .line 3071
    :sswitch_59
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_2(I)V

    goto :goto_4

    .line 3074
    :sswitch_5d
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_3(I)V

    goto :goto_4

    .line 3077
    :sswitch_61
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_4(I)V

    goto :goto_4

    .line 3053
    nop

    :sswitch_data_66
    .sparse-switch
        0x2 -> :sswitch_59
        0x3 -> :sswitch_5d
        0x4 -> :sswitch_61
        0xa -> :sswitch_4a
        0xd -> :sswitch_55
        0x2a -> :sswitch_27
    .end sparse-switch
.end method

.method private final _skipColon()I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x9

    const/16 v6, 0x2f

    const/16 v5, 0x23

    const/4 v4, 0x1

    const/16 v3, 0x20

    .line 2931
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x4

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_17

    .line 2932
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    .line 2981
    :goto_16
    return v0

    .line 2935
    :cond_17
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2936
    .local v0, "i":I
    const/16 v1, 0x3a

    if-ne v0, v1, :cond_62

    .line 2937
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2938
    if-le v0, v3, :cond_3d

    .line 2939
    if-eq v0, v6, :cond_31

    if-ne v0, v5, :cond_36

    .line 2940
    :cond_31
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto :goto_16

    .line 2942
    :cond_36
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_16

    .line 2945
    :cond_3d
    if-eq v0, v3, :cond_41

    if-ne v0, v7, :cond_5d

    .line 2946
    :cond_41
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2947
    if-le v0, v3, :cond_5d

    .line 2948
    if-eq v0, v6, :cond_51

    if-ne v0, v5, :cond_56

    .line 2949
    :cond_51
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto :goto_16

    .line 2951
    :cond_56
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_16

    .line 2955
    :cond_5d
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto :goto_16

    .line 2957
    :cond_62
    if-eq v0, v3, :cond_66

    if-ne v0, v7, :cond_70

    .line 2958
    :cond_66
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2960
    :cond_70
    const/16 v1, 0x3a

    if-ne v0, v1, :cond_b8

    .line 2961
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2962
    if-le v0, v3, :cond_90

    .line 2963
    if-eq v0, v6, :cond_84

    if-ne v0, v5, :cond_89

    .line 2964
    :cond_84
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto :goto_16

    .line 2966
    :cond_89
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_16

    .line 2969
    :cond_90
    if-eq v0, v3, :cond_94

    if-ne v0, v7, :cond_b2

    .line 2970
    :cond_94
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2971
    if-le v0, v3, :cond_b2

    .line 2972
    if-eq v0, v6, :cond_a4

    if-ne v0, v5, :cond_aa

    .line 2973
    :cond_a4
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto/16 :goto_16

    .line 2975
    :cond_aa
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto/16 :goto_16

    .line 2979
    :cond_b2
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto/16 :goto_16

    .line 2981
    :cond_b8
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto/16 :goto_16
.end method

.method private final _skipColon2(Z)I
    .registers 7
    .param p1, "gotColon"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 2986
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_62

    .line 2987
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2989
    .local v0, "i":I
    if-le v0, v4, :cond_41

    .line 2990
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_24

    .line 2991
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipComment()V

    goto :goto_2

    .line 2994
    :cond_24
    const/16 v1, 0x23

    if-ne v0, v1, :cond_2e

    .line 2995
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipYAMLComment()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2999
    :cond_2e
    if-eqz p1, :cond_31

    .line 3000
    return v0

    .line 3002
    :cond_31
    const/16 v1, 0x3a

    if-eq v0, v1, :cond_3f

    .line 3003
    if-ge v0, v4, :cond_3a

    .line 3004
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    .line 3006
    :cond_3a
    const-string v1, "was expecting a colon to separate field name and value"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 3008
    :cond_3f
    const/4 p1, 0x1

    goto :goto_2

    .line 3009
    :cond_41
    if-eq v0, v4, :cond_2

    .line 3010
    const/16 v1, 0xa

    if-ne v0, v1, :cond_52

    .line 3011
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 3012
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 3013
    :cond_52
    const/16 v1, 0xd

    if-ne v0, v1, :cond_5a

    .line 3014
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_2

    .line 3015
    :cond_5a
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 3016
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 3020
    .end local v0    # "i":I
    :cond_62
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected end-of-input within/between "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " entries"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_constructError(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParseException;

    move-result-object v1

    throw v1
.end method

.method private final _skipColonFast(I)I
    .registers 10
    .param p1, "ptr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x3a

    const/16 v6, 0x9

    const/16 v5, 0x2f

    const/16 v4, 0x23

    const/16 v3, 0x20

    .line 1063
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 v1, p1, 0x1

    .end local p1    # "ptr":I
    .local v1, "ptr":I
    aget-byte v0, v2, p1

    .line 1064
    .local v0, "i":I
    if-ne v0, v7, :cond_42

    .line 1065
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 p1, v1, 0x1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    aget-byte v0, v2, v1

    .line 1066
    if-le v0, v3, :cond_22

    .line 1067
    if-eq v0, v5, :cond_38

    if-eq v0, v4, :cond_38

    .line 1068
    iput p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move v2, v0

    .line 1104
    :goto_21
    return v2

    .line 1071
    :cond_22
    if-eq v0, v3, :cond_26

    if-ne v0, v6, :cond_38

    .line 1072
    :cond_26
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 v1, p1, 0x1

    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    aget-byte v0, v2, p1

    .line 1073
    if-le v0, v3, :cond_37

    .line 1074
    if-eq v0, v5, :cond_37

    if-eq v0, v4, :cond_37

    .line 1075
    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move p1, v1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    move v2, v0

    .line 1076
    goto :goto_21

    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_37
    move p1, v1

    .line 1080
    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    :cond_38
    add-int/lit8 v2, p1, -0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1081
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v2

    goto :goto_21

    .line 1083
    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_42
    if-eq v0, v3, :cond_46

    if-ne v0, v6, :cond_4d

    .line 1084
    :cond_46
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 p1, v1, 0x1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    aget-byte v0, v2, v1

    move v1, p1

    .line 1086
    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_4d
    if-ne v0, v7, :cond_74

    .line 1087
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 p1, v1, 0x1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    aget-byte v0, v2, v1

    .line 1088
    if-le v0, v3, :cond_5f

    .line 1089
    if-eq v0, v5, :cond_75

    if-eq v0, v4, :cond_75

    .line 1090
    iput p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move v2, v0

    .line 1091
    goto :goto_21

    .line 1093
    :cond_5f
    if-eq v0, v3, :cond_63

    if-ne v0, v6, :cond_75

    .line 1094
    :cond_63
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 v1, p1, 0x1

    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    aget-byte v0, v2, p1

    .line 1095
    if-le v0, v3, :cond_74

    .line 1096
    if-eq v0, v5, :cond_74

    if-eq v0, v4, :cond_74

    .line 1097
    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move p1, v1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    move v2, v0

    .line 1098
    goto :goto_21

    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_74
    move p1, v1

    .line 1103
    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    :cond_75
    add-int/lit8 v2, p1, -0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1104
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v2

    goto :goto_21
.end method

.method private final _skipComment()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x2f

    .line 3025
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-nez v1, :cond_f

    .line 3026
    const-string v1, "maybe a (non-standard) comment? (not recognized as one since Feature \'ALLOW_COMMENTS\' not enabled for parser)"

    invoke-virtual {p0, v4, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 3029
    :cond_f
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_20

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_20

    .line 3030
    const-string v1, " in a comment"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 3032
    :cond_20
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 3033
    .local v0, "c":I
    if-ne v0, v4, :cond_32

    .line 3034
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipLine()V

    .line 3040
    :goto_31
    return-void

    .line 3035
    :cond_32
    const/16 v1, 0x2a

    if-ne v0, v1, :cond_3a

    .line 3036
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCComment()V

    goto :goto_31

    .line 3038
    :cond_3a
    const-string v1, "was expecting either \'*\' or \'/\' for a comment"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    goto :goto_31
.end method

.method private final _skipLine()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3104
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeComment()[I

    move-result-object v1

    .line 3105
    .local v1, "codes":[I
    :cond_4
    :goto_4
    :sswitch_4
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_10

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v3

    if-eqz v3, :cond_33

    .line 3106
    :cond_10
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 v2, v3, 0xff

    .line 3107
    .local v2, "i":I
    aget v0, v1, v2

    .line 3108
    .local v0, "code":I
    if-eqz v0, :cond_4

    .line 3109
    sparse-switch v0, :sswitch_data_44

    .line 3129
    if-gez v0, :cond_4

    .line 3131
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    goto :goto_4

    .line 3111
    :sswitch_29
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 3112
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 3136
    .end local v0    # "code":I
    .end local v2    # "i":I
    :cond_33
    :goto_33
    return-void

    .line 3115
    .restart local v0    # "code":I
    .restart local v2    # "i":I
    :sswitch_34
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_33

    .line 3120
    :sswitch_38
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_2(I)V

    goto :goto_4

    .line 3123
    :sswitch_3c
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_3(I)V

    goto :goto_4

    .line 3126
    :sswitch_40
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_4(I)V

    goto :goto_4

    .line 3109
    :sswitch_data_44
    .sparse-switch
        0x2 -> :sswitch_38
        0x3 -> :sswitch_3c
        0x4 -> :sswitch_40
        0xa -> :sswitch_29
        0xd -> :sswitch_34
        0x2a -> :sswitch_4
    .end sparse-switch
.end method

.method private final _skipUtf8_2(I)V
    .registers 5
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3333
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_9

    .line 3334
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3336
    :cond_9
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte p1, v0, v1

    .line 3337
    and-int/lit16 v0, p1, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_20

    .line 3338
    and-int/lit16 v0, p1, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3340
    :cond_20
    return-void
.end method

.method private final _skipUtf8_3(I)V
    .registers 6
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x80

    .line 3347
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_b

    .line 3348
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3351
    :cond_b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte p1, v0, v1

    .line 3352
    and-int/lit16 v0, p1, 0xc0

    if-eq v0, v3, :cond_20

    .line 3353
    and-int/lit16 v0, p1, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3355
    :cond_20
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_29

    .line 3356
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3358
    :cond_29
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte p1, v0, v1

    .line 3359
    and-int/lit16 v0, p1, 0xc0

    if-eq v0, v3, :cond_3e

    .line 3360
    and-int/lit16 v0, p1, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3362
    :cond_3e
    return-void
.end method

.method private final _skipUtf8_4(I)V
    .registers 7
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x80

    .line 3366
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_b

    .line 3367
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3369
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3370
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_20

    .line 3371
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3373
    :cond_20
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_29

    .line 3374
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3376
    :cond_29
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3377
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_3e

    .line 3378
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3380
    :cond_3e
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_47

    .line 3381
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3383
    :cond_47
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3384
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_5c

    .line 3385
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3387
    :cond_5c
    return-void
.end method

.method private final _skipWS()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 2795
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-ge v1, v2, :cond_4a

    .line 2796
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2797
    .local v0, "i":I
    if-le v0, v4, :cond_29

    .line 2798
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_1e

    const/16 v1, 0x23

    if-ne v0, v1, :cond_28

    .line 2799
    :cond_1e
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2800
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWS2()I

    move-result v0

    .line 2815
    .end local v0    # "i":I
    :cond_28
    :goto_28
    return v0

    .line 2804
    .restart local v0    # "i":I
    :cond_29
    if-eq v0, v4, :cond_2

    .line 2805
    const/16 v1, 0xa

    if-ne v0, v1, :cond_3a

    .line 2806
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2807
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2808
    :cond_3a
    const/16 v1, 0xd

    if-ne v0, v1, :cond_42

    .line 2809
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_2

    .line 2810
    :cond_42
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2811
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 2815
    .end local v0    # "i":I
    :cond_4a
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWS2()I

    move-result v0

    goto :goto_28
.end method

.method private final _skipWS2()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 2820
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_50

    .line 2821
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2822
    .local v0, "i":I
    if-le v0, v4, :cond_2f

    .line 2823
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_24

    .line 2824
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipComment()V

    goto :goto_2

    .line 2827
    :cond_24
    const/16 v1, 0x23

    if-ne v0, v1, :cond_2e

    .line 2828
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipYAMLComment()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2832
    :cond_2e
    return v0

    .line 2834
    :cond_2f
    if-eq v0, v4, :cond_2

    .line 2835
    const/16 v1, 0xa

    if-ne v0, v1, :cond_40

    .line 2836
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2837
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2838
    :cond_40
    const/16 v1, 0xd

    if-ne v0, v1, :cond_48

    .line 2839
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_2

    .line 2840
    :cond_48
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2841
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 2845
    .end local v0    # "i":I
    :cond_50
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected end-of-input within/between "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " entries"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_constructError(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParseException;

    move-result-object v1

    throw v1
.end method

.method private final _skipWSOrEnd()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x23

    const/16 v7, 0xd

    const/16 v6, 0xa

    const/16 v5, 0x9

    const/16 v4, 0x20

    .line 2852
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_1b

    .line 2853
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 2854
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_eofAsNextChar()I

    move-result v0

    .line 2896
    :cond_1a
    :goto_1a
    return v0

    .line 2857
    :cond_1b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2858
    .local v0, "i":I
    if-le v0, v4, :cond_3a

    .line 2859
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_2f

    if-ne v0, v8, :cond_1a

    .line 2860
    :cond_2f
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2861
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd2()I

    move-result v0

    goto :goto_1a

    .line 2865
    :cond_3a
    if-eq v0, v4, :cond_48

    .line 2866
    if-ne v0, v6, :cond_6d

    .line 2867
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2868
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 2876
    :cond_48
    :goto_48
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-ge v1, v2, :cond_94

    .line 2877
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2878
    if-le v0, v4, :cond_79

    .line 2879
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_62

    if-ne v0, v8, :cond_1a

    .line 2880
    :cond_62
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2881
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd2()I

    move-result v0

    goto :goto_1a

    .line 2869
    :cond_6d
    if-ne v0, v7, :cond_73

    .line 2870
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_48

    .line 2871
    :cond_73
    if-eq v0, v5, :cond_48

    .line 2872
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_48

    .line 2885
    :cond_79
    if-eq v0, v4, :cond_48

    .line 2886
    if-ne v0, v6, :cond_88

    .line 2887
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2888
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_48

    .line 2889
    :cond_88
    if-ne v0, v7, :cond_8e

    .line 2890
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_48

    .line 2891
    :cond_8e
    if-eq v0, v5, :cond_48

    .line 2892
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_48

    .line 2896
    :cond_94
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd2()I

    move-result v0

    goto :goto_1a
.end method

.method private final _skipWSOrEnd2()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 2901
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_50

    .line 2902
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2903
    .local v0, "i":I
    if-le v0, v4, :cond_2f

    .line 2904
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_24

    .line 2905
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipComment()V

    goto :goto_2

    .line 2908
    :cond_24
    const/16 v1, 0x23

    if-ne v0, v1, :cond_2e

    .line 2909
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipYAMLComment()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2926
    .end local v0    # "i":I
    :cond_2e
    :goto_2e
    return v0

    .line 2914
    .restart local v0    # "i":I
    :cond_2f
    if-eq v0, v4, :cond_2

    .line 2915
    const/16 v1, 0xa

    if-ne v0, v1, :cond_40

    .line 2916
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2917
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2918
    :cond_40
    const/16 v1, 0xd

    if-ne v0, v1, :cond_48

    .line 2919
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_2

    .line 2920
    :cond_48
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2921
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 2926
    .end local v0    # "i":I
    :cond_50
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_eofAsNextChar()I

    move-result v0

    goto :goto_2e
.end method

.method private final _skipYAMLComment()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3090
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_YAML_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 3091
    const/4 v0, 0x0

    .line 3094
    :goto_9
    return v0

    .line 3093
    :cond_a
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipLine()V

    .line 3094
    const/4 v0, 0x1

    goto :goto_9
.end method

.method private final _verifyNoLeadingZeroes()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x39

    const/16 v1, 0x30

    .line 1489
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_12

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v2

    if-nez v2, :cond_12

    move v0, v1

    .line 1515
    :cond_11
    :goto_11
    return v0

    .line 1492
    :cond_12
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 1494
    .local v0, "ch":I
    if-lt v0, v1, :cond_1e

    if-le v0, v4, :cond_20

    :cond_1e
    move v0, v1

    .line 1495
    goto :goto_11

    .line 1498
    :cond_20
    sget-object v2, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NUMERIC_LEADING_ZEROS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v2

    if-nez v2, :cond_2d

    .line 1499
    const-string v2, "Leading zeroes not allowed"

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportInvalidNumber(Ljava/lang/String;)V

    .line 1502
    :cond_2d
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1503
    if-ne v0, v1, :cond_11

    .line 1504
    :cond_35
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_41

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 1505
    :cond_41
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 1506
    if-lt v0, v1, :cond_4d

    if-le v0, v4, :cond_4f

    :cond_4d
    move v0, v1

    .line 1507
    goto :goto_11

    .line 1509
    :cond_4f
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1510
    if-eq v0, v1, :cond_35

    goto :goto_11
.end method

.method private final _verifyRootSpace(I)V
    .registers 3
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1621
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1623
    sparse-switch p1, :sswitch_data_1c

    .line 1635
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMissingRootWS(I)V

    .line 1636
    :goto_c
    :sswitch_c
    return-void

    .line 1628
    :sswitch_d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_c

    .line 1631
    :sswitch_11
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 1632
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_c

    .line 1623
    :sswitch_data_1c
    .sparse-switch
        0x9 -> :sswitch_c
        0xa -> :sswitch_11
        0xd -> :sswitch_d
        0x20 -> :sswitch_c
    .end sparse-switch
.end method

.method private final addName([III)Ljava/lang/String;
    .registers 18
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I
    .param p3, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2242
    shl-int/lit8 v12, p2, 0x2

    add-int/lit8 v12, v12, -0x4

    add-int v3, v12, p3

    .line 2251
    .local v3, "byteLen":I
    const/4 v12, 0x4

    move/from16 v0, p3

    if-ge v0, v12, :cond_d7

    .line 2252
    add-int/lit8 v12, p2, -0x1

    aget v10, p1, v12

    .line 2254
    .local v10, "lastQuad":I
    add-int/lit8 v12, p2, -0x1

    rsub-int/lit8 v13, p3, 0x4

    shl-int/lit8 v13, v13, 0x3

    shl-int v13, v10, v13

    aput v13, p1, v12

    .line 2260
    :goto_19
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v12}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 2261
    .local v4, "cbuf":[C
    const/4 v7, 0x0

    .line 2263
    .local v7, "cix":I
    const/4 v9, 0x0

    .local v9, "ix":I
    move v8, v7

    .end local v7    # "cix":I
    .local v8, "cix":I
    :goto_22
    if-ge v9, v3, :cond_f7

    .line 2264
    shr-int/lit8 v12, v9, 0x2

    aget v5, p1, v12

    .line 2265
    .local v5, "ch":I
    and-int/lit8 v2, v9, 0x3

    .line 2266
    .local v2, "byteIx":I
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int v12, v5, v12

    and-int/lit16 v5, v12, 0xff

    .line 2267
    add-int/lit8 v9, v9, 0x1

    .line 2269
    const/16 v12, 0x7f

    if-le v5, v12, :cond_10f

    .line 2271
    and-int/lit16 v12, v5, 0xe0

    const/16 v13, 0xc0

    if-ne v12, v13, :cond_da

    .line 2272
    and-int/lit8 v5, v5, 0x1f

    .line 2273
    const/4 v11, 0x1

    .line 2284
    .local v11, "needed":I
    :goto_41
    add-int v12, v9, v11

    if-le v12, v3, :cond_4a

    .line 2285
    const-string v12, " in field name"

    invoke-virtual {p0, v12}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2289
    :cond_4a
    shr-int/lit8 v12, v9, 0x2

    aget v6, p1, v12

    .line 2290
    .local v6, "ch2":I
    and-int/lit8 v2, v9, 0x3

    .line 2291
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int/2addr v6, v12

    .line 2292
    add-int/lit8 v9, v9, 0x1

    .line 2294
    and-int/lit16 v12, v6, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_60

    .line 2295
    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 2297
    :cond_60
    shl-int/lit8 v12, v5, 0x6

    and-int/lit8 v13, v6, 0x3f

    or-int v5, v12, v13

    .line 2298
    const/4 v12, 0x1

    if-le v11, v12, :cond_a6

    .line 2299
    shr-int/lit8 v12, v9, 0x2

    aget v6, p1, v12

    .line 2300
    and-int/lit8 v2, v9, 0x3

    .line 2301
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int/2addr v6, v12

    .line 2302
    add-int/lit8 v9, v9, 0x1

    .line 2304
    and-int/lit16 v12, v6, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_7f

    .line 2305
    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 2307
    :cond_7f
    shl-int/lit8 v12, v5, 0x6

    and-int/lit8 v13, v6, 0x3f

    or-int v5, v12, v13

    .line 2308
    const/4 v12, 0x2

    if-le v11, v12, :cond_a6

    .line 2309
    shr-int/lit8 v12, v9, 0x2

    aget v6, p1, v12

    .line 2310
    and-int/lit8 v2, v9, 0x3

    .line 2311
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int/2addr v6, v12

    .line 2312
    add-int/lit8 v9, v9, 0x1

    .line 2313
    and-int/lit16 v12, v6, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_a0

    .line 2314
    and-int/lit16 v12, v6, 0xff

    invoke-virtual {p0, v12}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 2316
    :cond_a0
    shl-int/lit8 v12, v5, 0x6

    and-int/lit8 v13, v6, 0x3f

    or-int v5, v12, v13

    .line 2319
    :cond_a6
    const/4 v12, 0x2

    if-le v11, v12, :cond_10f

    .line 2320
    const/high16 v12, 0x10000

    sub-int/2addr v5, v12

    .line 2321
    array-length v12, v4

    if-lt v8, v12, :cond_b5

    .line 2322
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v12}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v4

    .line 2324
    :cond_b5
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "cix":I
    .restart local v7    # "cix":I
    const v12, 0xd800

    shr-int/lit8 v13, v5, 0xa

    add-int/2addr v12, v13

    int-to-char v12, v12

    aput-char v12, v4, v8

    .line 2325
    const v12, 0xdc00

    and-int/lit16 v13, v5, 0x3ff

    or-int v5, v12, v13

    .line 2328
    .end local v6    # "ch2":I
    .end local v11    # "needed":I
    :goto_c7
    array-length v12, v4

    if-lt v7, v12, :cond_d0

    .line 2329
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v12}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v4

    .line 2331
    :cond_d0
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "cix":I
    .restart local v8    # "cix":I
    int-to-char v12, v5

    aput-char v12, v4, v7

    goto/16 :goto_22

    .line 2256
    .end local v2    # "byteIx":I
    .end local v4    # "cbuf":[C
    .end local v5    # "ch":I
    .end local v8    # "cix":I
    .end local v9    # "ix":I
    .end local v10    # "lastQuad":I
    :cond_d7
    const/4 v10, 0x0

    .restart local v10    # "lastQuad":I
    goto/16 :goto_19

    .line 2274
    .restart local v2    # "byteIx":I
    .restart local v4    # "cbuf":[C
    .restart local v5    # "ch":I
    .restart local v8    # "cix":I
    .restart local v9    # "ix":I
    :cond_da
    and-int/lit16 v12, v5, 0xf0

    const/16 v13, 0xe0

    if-ne v12, v13, :cond_e5

    .line 2275
    and-int/lit8 v5, v5, 0xf

    .line 2276
    const/4 v11, 0x2

    .restart local v11    # "needed":I
    goto/16 :goto_41

    .line 2277
    .end local v11    # "needed":I
    :cond_e5
    and-int/lit16 v12, v5, 0xf8

    const/16 v13, 0xf0

    if-ne v12, v13, :cond_f0

    .line 2278
    and-int/lit8 v5, v5, 0x7

    .line 2279
    const/4 v11, 0x3

    .restart local v11    # "needed":I
    goto/16 :goto_41

    .line 2281
    .end local v11    # "needed":I
    :cond_f0
    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidInitial(I)V

    .line 2282
    const/4 v5, 0x1

    move v11, v5

    .restart local v11    # "needed":I
    goto/16 :goto_41

    .line 2335
    .end local v2    # "byteIx":I
    .end local v5    # "ch":I
    .end local v11    # "needed":I
    :cond_f7
    new-instance v1, Ljava/lang/String;

    const/4 v12, 0x0

    invoke-direct {v1, v4, v12, v8}, Ljava/lang/String;-><init>([CII)V

    .line 2337
    .local v1, "baseName":Ljava/lang/String;
    const/4 v12, 0x4

    move/from16 v0, p3

    if-ge v0, v12, :cond_106

    .line 2338
    add-int/lit8 v12, p2, -0x1

    aput v10, p1, v12

    .line 2340
    :cond_106
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    move/from16 v0, p2

    invoke-virtual {v12, v1, p1, v0}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->addName(Ljava/lang/String;[II)Ljava/lang/String;

    move-result-object v12

    return-object v12

    .end local v1    # "baseName":Ljava/lang/String;
    .restart local v2    # "byteIx":I
    .restart local v5    # "ch":I
    :cond_10f
    move v7, v8

    .end local v8    # "cix":I
    .restart local v7    # "cix":I
    goto :goto_c7
.end method

.method private final findName(II)Ljava/lang/String;
    .registers 6
    .param p1, "q1"    # I
    .param p2, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2177
    invoke-static {p1, p2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->pad(II)I

    move-result p1

    .line 2179
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(I)Ljava/lang/String;

    move-result-object v0

    .line 2180
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_d

    .line 2185
    .end local v0    # "name":Ljava/lang/String;
    :goto_c
    return-object v0

    .line 2184
    .restart local v0    # "name":Ljava/lang/String;
    :cond_d
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 2185
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2, p2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method private final findName(III)Ljava/lang/String;
    .registers 7
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2190
    invoke-static {p2, p3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->pad(II)I

    move-result p2

    .line 2192
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v1, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(II)Ljava/lang/String;

    move-result-object v0

    .line 2193
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_d

    .line 2199
    .end local v0    # "name":Ljava/lang/String;
    :goto_c
    return-object v0

    .line 2197
    .restart local v0    # "name":Ljava/lang/String;
    :cond_d
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 2198
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x1

    aput p2, v1, v2

    .line 2199
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x2

    invoke-direct {p0, v1, v2, p3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method private final findName(IIII)Ljava/lang/String;
    .registers 9
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I
    .param p4, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2204
    invoke-static {p3, p4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->pad(II)I

    move-result p3

    .line 2205
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v2, p1, p2, p3}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName(III)Ljava/lang/String;

    move-result-object v0

    .line 2206
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_d

    .line 2213
    .end local v0    # "name":Ljava/lang/String;
    :goto_c
    return-object v0

    .line 2209
    .restart local v0    # "name":Ljava/lang/String;
    :cond_d
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2210
    .local v1, "quads":[I
    const/4 v2, 0x0

    aput p1, v1, v2

    .line 2211
    const/4 v2, 0x1

    aput p2, v1, v2

    .line 2212
    const/4 v2, 0x2

    invoke-static {p3, p4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->pad(II)I

    move-result v3

    aput v3, v1, v2

    .line 2213
    const/4 v2, 0x3

    invoke-direct {p0, v1, v2, p4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v0

    goto :goto_c
.end method

.method private final findName([IIII)Ljava/lang/String;
    .registers 8
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I
    .param p3, "lastQuad"    # I
    .param p4, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 2218
    array-length v2, p1

    if-lt p2, v2, :cond_a

    .line 2219
    array-length v2, p1

    invoke-static {p1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2221
    :cond_a
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "qlen":I
    .local v1, "qlen":I
    invoke-static {p3, p4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->pad(II)I

    move-result v2

    aput v2, p1, p2

    .line 2222
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v2, p1, v1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v0

    .line 2223
    .local v0, "name":Ljava/lang/String;
    if-nez v0, :cond_1e

    .line 2224
    invoke-direct {p0, p1, v1, p4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v0

    .line 2226
    .end local v0    # "name":Ljava/lang/String;
    :cond_1e
    return-object v0
.end method

.method public static growArrayBy([II)[I
    .registers 3
    .param p0, "arr"    # [I
    .param p1, "more"    # I

    .prologue
    .line 3482
    if-nez p0, :cond_5

    .line 3483
    new-array v0, p1, [I

    .line 3485
    :goto_4
    return-object v0

    :cond_5
    array-length v0, p0

    add-int/2addr v0, p1

    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    goto :goto_4
.end method

.method private nextByte()I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3412
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_9

    .line 3413
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3415
    :cond_9
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method private static final pad(II)I
    .registers 4
    .param p0, "q"    # I
    .param p1, "bytes"    # I

    .prologue
    .line 3616
    const/4 v0, 0x4

    if-ne p1, v0, :cond_4

    .end local p0    # "q":I
    :goto_3
    return p0

    .restart local p0    # "q":I
    :cond_4
    const/4 v0, -0x1

    shl-int/lit8 v1, p1, 0x3

    shl-int/2addr v0, v1

    or-int/2addr p0, v0

    goto :goto_3
.end method

.method private final parseName(III)Ljava/lang/String;
    .registers 10
    .param p1, "q1"    # I
    .param p2, "ch"    # I
    .param p3, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1871
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final parseName(IIII)Ljava/lang/String;
    .registers 11
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "ch"    # I
    .param p4, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1875
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 1876
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x1

    move-object v0, p0

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final parseName(IIIII)Ljava/lang/String;
    .registers 12
    .param p1, "q1"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I
    .param p4, "ch"    # I
    .param p5, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1880
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 1881
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 1882
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x2

    move-object v0, p0

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected _closeInput()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 240
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_1c

    .line 241
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->isResourceManaged()Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->AUTO_CLOSE_SOURCE:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 242
    :cond_14
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 244
    :cond_19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    .line 246
    :cond_1c
    return-void
.end method

.method protected final _decodeBase64(Lcom/fasterxml/jackson/core/Base64Variant;)[B
    .registers 12
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/16 v8, 0x22

    const/4 v7, -0x2

    .line 3501
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_getByteArrayBuilder()Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    move-result-object v1

    .line 3508
    .local v1, "builder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    :cond_8
    :goto_8
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_11

    .line 3509
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3511
    :cond_11
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3512
    .local v2, "ch":I
    const/16 v4, 0x20

    if-le v2, v4, :cond_8

    .line 3513
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 3514
    .local v0, "bits":I
    if-gez v0, :cond_35

    .line 3515
    if-ne v2, v8, :cond_2e

    .line 3516
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    .line 3584
    :goto_2d
    return-object v4

    .line 3518
    :cond_2e
    const/4 v4, 0x0

    invoke-virtual {p0, p1, v2, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 3519
    if-ltz v0, :cond_8

    .line 3523
    :cond_35
    move v3, v0

    .line 3527
    .local v3, "decodedData":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_3f

    .line 3528
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3530
    :cond_3f
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3531
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 3532
    if-gez v0, :cond_56

    .line 3533
    const/4 v4, 0x1

    invoke-virtual {p0, p1, v2, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 3535
    :cond_56
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 3538
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_63

    .line 3539
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3541
    :cond_63
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3542
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 3545
    if-gez v0, :cond_d4

    .line 3546
    if-eq v0, v7, :cond_8e

    .line 3548
    if-ne v2, v8, :cond_89

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v4

    if-nez v4, :cond_89

    .line 3549
    shr-int/lit8 v3, v3, 0x4

    .line 3550
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 3551
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    goto :goto_2d

    .line 3553
    :cond_89
    const/4 v4, 0x2

    invoke-virtual {p0, p1, v2, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 3555
    :cond_8e
    if-ne v0, v7, :cond_d4

    .line 3557
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_99

    .line 3558
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3560
    :cond_99
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3561
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPaddingChar(I)Z

    move-result v4

    if-nez v4, :cond_cd

    .line 3562
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "expected padding character \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getPaddingChar()C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, p1, v2, v9, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportInvalidBase64Char(Lcom/fasterxml/jackson/core/Base64Variant;IILjava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v4

    throw v4

    .line 3565
    :cond_cd
    shr-int/lit8 v3, v3, 0x4

    .line 3566
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    goto/16 :goto_8

    .line 3571
    :cond_d4
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 3573
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_e1

    .line 3574
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3576
    :cond_e1
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3577
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 3578
    if-gez v0, :cond_115

    .line 3579
    if-eq v0, v7, :cond_10c

    .line 3581
    if-ne v2, v8, :cond_108

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v4

    if-nez v4, :cond_108

    .line 3582
    shr-int/lit8 v3, v3, 0x2

    .line 3583
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendTwoBytes(I)V

    .line 3584
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    goto/16 :goto_2d

    .line 3586
    :cond_108
    invoke-virtual {p0, p1, v2, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 3588
    :cond_10c
    if-ne v0, v7, :cond_115

    .line 3595
    shr-int/lit8 v3, v3, 0x2

    .line 3596
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendTwoBytes(I)V

    goto/16 :goto_8

    .line 3601
    :cond_115
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 3602
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendThreeBytes(I)V

    goto/16 :goto_8
.end method

.method protected _decodeCharForError(I)I
    .registers 8
    .param p1, "firstByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x80

    .line 3194
    and-int/lit16 v0, p1, 0xff

    .line 3195
    .local v0, "c":I
    const/16 v3, 0x7f

    if-le v0, v3, :cond_50

    .line 3199
    and-int/lit16 v3, v0, 0xe0

    const/16 v4, 0xc0

    if-ne v3, v4, :cond_51

    .line 3200
    and-int/lit8 v0, v0, 0x1f

    .line 3201
    const/4 v2, 0x1

    .line 3214
    .local v2, "needed":I
    :goto_11
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextByte()I

    move-result v1

    .line 3215
    .local v1, "d":I
    and-int/lit16 v3, v1, 0xc0

    if-eq v3, v5, :cond_1e

    .line 3216
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 3218
    :cond_1e
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v1, 0x3f

    or-int v0, v3, v4

    .line 3220
    const/4 v3, 0x1

    if-le v2, v3, :cond_50

    .line 3221
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextByte()I

    move-result v1

    .line 3222
    and-int/lit16 v3, v1, 0xc0

    if-eq v3, v5, :cond_34

    .line 3223
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 3225
    :cond_34
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v1, 0x3f

    or-int v0, v3, v4

    .line 3226
    const/4 v3, 0x2

    if-le v2, v3, :cond_50

    .line 3227
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextByte()I

    move-result v1

    .line 3228
    and-int/lit16 v3, v1, 0xc0

    if-eq v3, v5, :cond_4a

    .line 3229
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 3231
    :cond_4a
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v1, 0x3f

    or-int v0, v3, v4

    .line 3235
    .end local v1    # "d":I
    .end local v2    # "needed":I
    :cond_50
    return v0

    .line 3202
    :cond_51
    and-int/lit16 v3, v0, 0xf0

    const/16 v4, 0xe0

    if-ne v3, v4, :cond_5b

    .line 3203
    and-int/lit8 v0, v0, 0xf

    .line 3204
    const/4 v2, 0x2

    .restart local v2    # "needed":I
    goto :goto_11

    .line 3205
    .end local v2    # "needed":I
    :cond_5b
    and-int/lit16 v3, v0, 0xf8

    const/16 v4, 0xf0

    if-ne v3, v4, :cond_65

    .line 3207
    and-int/lit8 v0, v0, 0x7

    .line 3208
    const/4 v2, 0x3

    .restart local v2    # "needed":I
    goto :goto_11

    .line 3210
    .end local v2    # "needed":I
    :cond_65
    and-int/lit16 v3, v0, 0xff

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidInitial(I)V

    .line 3211
    const/4 v2, 0x1

    .restart local v2    # "needed":I
    goto :goto_11
.end method

.method protected _decodeEscaped()C
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3141
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v5, v6, :cond_11

    .line 3142
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_11

    .line 3143
    const-string v5, " in character escape sequence"

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 3146
    :cond_11
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v5, v6

    .line 3148
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_6e

    .line 3171
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeCharForError(I)I

    move-result v5

    int-to-char v5, v5

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnrecognizedCharacterEscape(C)C

    move-result v5

    .line 3189
    :goto_27
    return v5

    .line 3151
    :sswitch_28
    const/16 v5, 0x8

    goto :goto_27

    .line 3153
    :sswitch_2b
    const/16 v5, 0x9

    goto :goto_27

    .line 3155
    :sswitch_2e
    const/16 v5, 0xa

    goto :goto_27

    .line 3157
    :sswitch_31
    const/16 v5, 0xc

    goto :goto_27

    .line 3159
    :sswitch_34
    const/16 v5, 0xd

    goto :goto_27

    .line 3165
    :sswitch_37
    int-to-char v5, v0

    goto :goto_27

    .line 3175
    :sswitch_39
    const/4 v4, 0x0

    .line 3176
    .local v4, "value":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3b
    const/4 v5, 0x4

    if-ge v3, v5, :cond_6b

    .line 3177
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v5, v6, :cond_4f

    .line 3178
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_4f

    .line 3179
    const-string v5, " in character escape sequence"

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 3182
    :cond_4f
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v5, v6

    .line 3183
    .local v1, "ch":I
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    .line 3184
    .local v2, "digit":I
    if-gez v2, :cond_64

    .line 3185
    const-string v5, "expected a hex-digit for character escape sequence"

    invoke-virtual {p0, v1, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 3187
    :cond_64
    shl-int/lit8 v5, v4, 0x4

    or-int v4, v5, v2

    .line 3176
    add-int/lit8 v3, v3, 0x1

    goto :goto_3b

    .line 3189
    .end local v1    # "ch":I
    .end local v2    # "digit":I
    :cond_6b
    int-to-char v5, v4

    goto :goto_27

    .line 3148
    nop

    :sswitch_data_6e
    .sparse-switch
        0x22 -> :sswitch_37
        0x2f -> :sswitch_37
        0x5c -> :sswitch_37
        0x62 -> :sswitch_28
        0x66 -> :sswitch_31
        0x6e -> :sswitch_2e
        0x72 -> :sswitch_34
        0x74 -> :sswitch_2b
        0x75 -> :sswitch_39
    .end sparse-switch
.end method

.method protected _finishAndReturnString()Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2387
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2388
    .local v7, "ptr":I
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_b

    .line 2389
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 2390
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2392
    :cond_b
    const/4 v5, 0x0

    .line 2393
    .local v5, "outPtr":I
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 2394
    .local v4, "outBuf":[C
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 2396
    .local v1, "codes":[I
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    array-length v9, v4

    add-int/2addr v9, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 2397
    .local v3, "max":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .local v2, "inputBuffer":[B
    move v6, v5

    .line 2398
    .end local v5    # "outPtr":I
    .local v6, "outPtr":I
    :goto_1f
    if-ge v7, v3, :cond_41

    .line 2399
    aget-byte v8, v2, v7

    and-int/lit16 v0, v8, 0xff

    .line 2400
    .local v0, "c":I
    aget v8, v1, v0

    if-eqz v8, :cond_38

    .line 2401
    const/16 v8, 0x22

    if-ne v0, v8, :cond_41

    .line 2402
    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2403
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentAndReturn(I)Ljava/lang/String;

    move-result-object v8

    .line 2412
    .end local v0    # "c":I
    :goto_37
    return-object v8

    .line 2407
    .restart local v0    # "c":I
    :cond_38
    add-int/lit8 v7, v7, 0x1

    .line 2408
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v5    # "outPtr":I
    int-to-char v8, v0

    aput-char v8, v4, v6

    move v6, v5

    .line 2409
    .end local v5    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_1f

    .line 2410
    .end local v0    # "c":I
    :cond_41
    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2411
    invoke-direct {p0, v4, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString2([CI)V

    .line 2412
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v8

    goto :goto_37
.end method

.method protected _finishString()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2353
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2354
    .local v7, "ptr":I
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_b

    .line 2355
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 2356
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2358
    :cond_b
    const/4 v5, 0x0

    .line 2359
    .local v5, "outPtr":I
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 2360
    .local v4, "outBuf":[C
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 2362
    .local v1, "codes":[I
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    array-length v9, v4

    add-int/2addr v9, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 2363
    .local v3, "max":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .local v2, "inputBuffer":[B
    move v6, v5

    .line 2364
    .end local v5    # "outPtr":I
    .local v6, "outPtr":I
    :goto_1f
    if-ge v7, v3, :cond_40

    .line 2365
    aget-byte v8, v2, v7

    and-int/lit16 v0, v8, 0xff

    .line 2366
    .local v0, "c":I
    aget v8, v1, v0

    if-eqz v8, :cond_37

    .line 2367
    const/16 v8, 0x22

    if-ne v0, v8, :cond_40

    .line 2368
    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2369
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2379
    .end local v0    # "c":I
    :goto_36
    return-void

    .line 2374
    .restart local v0    # "c":I
    :cond_37
    add-int/lit8 v7, v7, 0x1

    .line 2375
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v5    # "outPtr":I
    int-to-char v8, v0

    aput-char v8, v4, v6

    move v6, v5

    .line 2376
    .end local v5    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_1f

    .line 2377
    .end local v0    # "c":I
    :cond_40
    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2378
    invoke-direct {p0, v4, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString2([CI)V

    goto :goto_36
.end method

.method protected final _getText2(Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/String;
    .registers 3
    .param p1, "t"    # Lcom/fasterxml/jackson/core/JsonToken;

    .prologue
    .line 370
    if-nez p1, :cond_4

    .line 371
    const/4 v0, 0x0

    .line 383
    :goto_3
    return-object v0

    .line 373
    :cond_4
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v0

    packed-switch v0, :pswitch_data_1e

    .line 383
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonToken;->asString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 375
    :pswitch_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 381
    :pswitch_17
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 373
    :pswitch_data_1e
    .packed-switch 0x5
        :pswitch_10
        :pswitch_17
        :pswitch_17
        :pswitch_17
    .end packed-switch
.end method

.method protected _handleApos()Lcom/fasterxml/jackson/core/JsonToken;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x27

    .line 2617
    const/4 v0, 0x0

    .line 2619
    .local v0, "c":I
    const/4 v6, 0x0

    .line 2620
    .local v6, "outPtr":I
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v5

    .line 2623
    .local v5, "outBuf":[C
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 2624
    .local v1, "codes":[I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 2631
    .local v2, "inputBuffer":[B
    :cond_e
    :goto_e
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_17

    .line 2632
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 2634
    :cond_17
    array-length v8, v5

    if-lt v6, v8, :cond_21

    .line 2635
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 2636
    const/4 v6, 0x0

    .line 2638
    :cond_21
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 2640
    .local v3, "max":I
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    array-length v9, v5

    sub-int/2addr v9, v6

    add-int v4, v8, v9

    .line 2641
    .local v4, "max2":I
    if-ge v4, v3, :cond_2c

    .line 2642
    move v3, v4

    .line 2645
    :cond_2c
    :goto_2c
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    if-ge v8, v3, :cond_e

    .line 2646
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v8, v2, v8

    and-int/lit16 v0, v8, 0xff

    .line 2647
    if-eq v0, v10, :cond_40

    aget v8, v1, v0

    if-eqz v8, :cond_4a

    .line 2655
    :cond_40
    if-ne v0, v10, :cond_51

    .line 2701
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2703
    sget-object v8, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v8

    .line 2650
    :cond_4a
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .local v7, "outPtr":I
    int-to-char v8, v0

    aput-char v8, v5, v6

    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_2c

    .line 2659
    :cond_51
    aget v8, v1, v0

    packed-switch v8, :pswitch_data_b4

    .line 2687
    const/16 v8, 0x20

    if-ge v0, v8, :cond_5f

    .line 2688
    const-string v8, "string value"

    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    .line 2691
    :cond_5f
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    .line 2694
    :cond_62
    :goto_62
    array-length v8, v5

    if-lt v6, v8, :cond_6c

    .line 2695
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 2696
    const/4 v6, 0x0

    .line 2699
    :cond_6c
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    int-to-char v8, v0

    aput-char v8, v5, v6

    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_e

    .line 2661
    :pswitch_73
    if-eq v0, v10, :cond_62

    .line 2662
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    move-result v0

    goto :goto_62

    .line 2666
    :pswitch_7a
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_2(I)I

    move-result v0

    .line 2667
    goto :goto_62

    .line 2669
    :pswitch_7f
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    sub-int/2addr v8, v9

    const/4 v9, 0x2

    if-lt v8, v9, :cond_8c

    .line 2670
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_3fast(I)I

    move-result v0

    goto :goto_62

    .line 2672
    :cond_8c
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_3(I)I

    move-result v0

    .line 2674
    goto :goto_62

    .line 2676
    :pswitch_91
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_4(I)I

    move-result v0

    .line 2678
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    const v8, 0xd800

    shr-int/lit8 v9, v0, 0xa

    or-int/2addr v8, v9

    int-to-char v8, v8

    aput-char v8, v5, v6

    .line 2679
    array-length v8, v5

    if-lt v7, v8, :cond_b2

    .line 2680
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 2681
    const/4 v6, 0x0

    .line 2683
    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    :goto_aa
    const v8, 0xdc00

    and-int/lit16 v9, v0, 0x3ff

    or-int v0, v8, v9

    .line 2685
    goto :goto_62

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_b2
    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_aa

    .line 2659
    :pswitch_data_b4
    .packed-switch 0x1
        :pswitch_73
        :pswitch_7a
        :pswitch_7f
        :pswitch_91
    .end packed-switch
.end method

.method protected _handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 7
    .param p1, "ch"    # I
    .param p2, "neg"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2713
    :goto_0
    const/16 v1, 0x49

    if-ne p1, v1, :cond_69

    .line 2714
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_13

    .line 2715
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_13

    .line 2716
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOFInValue()V

    .line 2719
    :cond_13
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte p1, v1, v2

    .line 2721
    const/16 v1, 0x4e

    if-ne p1, v1, :cond_3d

    .line 2722
    if-eqz p2, :cond_3a

    const-string v0, "-INF"

    .line 2728
    .local v0, "match":Ljava/lang/String;
    :goto_25
    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 2729
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-eqz v1, :cond_4c

    .line 2730
    if-eqz p2, :cond_49

    const-wide/high16 v1, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    :goto_35
    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 2735
    .end local v0    # "match":Ljava/lang/String;
    :goto_39
    return-object v1

    .line 2722
    :cond_3a
    const-string v0, "+INF"

    goto :goto_25

    .line 2723
    :cond_3d
    const/16 v1, 0x6e

    if-ne p1, v1, :cond_69

    .line 2724
    if-eqz p2, :cond_46

    const-string v0, "-Infinity"

    .restart local v0    # "match":Ljava/lang/String;
    :goto_45
    goto :goto_25

    .end local v0    # "match":Ljava/lang/String;
    :cond_46
    const-string v0, "+Infinity"

    goto :goto_45

    .line 2730
    .restart local v0    # "match":Ljava/lang/String;
    :cond_49
    const-wide/high16 v1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_35

    .line 2732
    :cond_4c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-standard token \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportError(Ljava/lang/String;)V

    goto :goto_0

    .line 2734
    .end local v0    # "match":Ljava/lang/String;
    :cond_69
    const-string v1, "expected digit (0-9) to follow minus sign, for valid numeric value"

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 2735
    const/4 v1, 0x0

    goto :goto_39
.end method

.method protected _handleOddName(I)Ljava/lang/String;
    .registers 12
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1994
    const/16 v8, 0x27

    if-ne p1, v8, :cond_11

    sget-object v8, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 1995
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseAposName()Ljava/lang/String;

    move-result-object v4

    .line 2056
    :cond_10
    :goto_10
    return-object v4

    .line 1998
    :cond_11
    sget-object v8, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_UNQUOTED_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v8

    if-nez v8, :cond_23

    .line 1999
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeCharForError(I)I

    move-result v8

    int-to-char v0, v8

    .line 2000
    .local v0, "c":C
    const-string v8, "was expecting double-quote to start field name"

    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2006
    .end local v0    # "c":C
    :cond_23
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8JsNames()[I

    move-result-object v1

    .line 2008
    .local v1, "codes":[I
    aget v8, v1, p1

    if-eqz v8, :cond_30

    .line 2009
    const-string v8, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name"

    invoke-virtual {p0, p1, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2016
    :cond_30
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2017
    .local v7, "quads":[I
    const/4 v5, 0x0

    .line 2018
    .local v5, "qlen":I
    const/4 v2, 0x0

    .line 2019
    .local v2, "currQuad":I
    const/4 v3, 0x0

    .local v3, "currQuadBytes":I
    move v6, v5

    .line 2023
    .end local v5    # "qlen":I
    .local v6, "qlen":I
    :goto_36
    const/4 v8, 0x4

    if-ge v3, v8, :cond_7b

    .line 2024
    add-int/lit8 v3, v3, 0x1

    .line 2025
    shl-int/lit8 v8, v2, 0x8

    or-int v2, v8, p1

    move v5, v6

    .line 2034
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :goto_40
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_51

    .line 2035
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_51

    .line 2036
    const-string v8, " in field name"

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2039
    :cond_51
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v8, v8, v9

    and-int/lit16 p1, v8, 0xff

    .line 2040
    aget v8, v1, p1

    if-eqz v8, :cond_8c

    .line 2046
    if-lez v3, :cond_6e

    .line 2047
    array-length v8, v7

    if-lt v5, v8, :cond_69

    .line 2048
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2050
    :cond_69
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    aput v2, v7, v5

    move v5, v6

    .line 2052
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :cond_6e
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v8, v7, v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v4

    .line 2053
    .local v4, "name":Ljava/lang/String;
    if-nez v4, :cond_10

    .line 2054
    invoke-direct {p0, v7, v5, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v4

    goto :goto_10

    .line 2027
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_7b
    array-length v8, v7

    if-lt v6, v8, :cond_85

    .line 2028
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2030
    :cond_85
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 2031
    move v2, p1

    .line 2032
    const/4 v3, 0x1

    goto :goto_40

    .line 2043
    :cond_8c
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v8, v8, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move v6, v5

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    goto :goto_36
.end method

.method protected _handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 5
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 2572
    sparse-switch p1, :sswitch_data_96

    .line 2606
    :cond_4
    :goto_4
    invoke-static {p1}, Ljava/lang/Character;->isJavaIdentifierStart(I)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 2607
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    int-to-char v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "(\'true\', \'false\' or \'null\')"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 2610
    :cond_23
    const-string v0, "expected a valid value (number, String, array, object, \'true\', \'false\' or \'null\')"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2611
    const/4 v0, 0x0

    :goto_29
    return-object v0

    .line 2577
    :sswitch_2a
    const-string v0, "expected a value"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2579
    :sswitch_2f
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2580
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleApos()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 2584
    :sswitch_3c
    const-string v0, "NaN"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 2585
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 2586
    const-string v0, "NaN"

    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 2588
    :cond_52
    const-string v0, "Non-standard token \'NaN\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportError(Ljava/lang/String;)V

    goto :goto_4

    .line 2591
    :sswitch_58
    const-string v0, "Infinity"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 2592
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 2593
    const-string v0, "Infinity"

    const-wide/high16 v1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 2595
    :cond_6e
    const-string v0, "Non-standard token \'Infinity\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportError(Ljava/lang/String;)V

    goto :goto_4

    .line 2598
    :sswitch_74
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_83

    .line 2599
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_83

    .line 2600
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOFInValue()V

    .line 2603
    :cond_83
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 2572
    nop

    :sswitch_data_96
    .sparse-switch
        0x27 -> :sswitch_2f
        0x2b -> :sswitch_74
        0x49 -> :sswitch_58
        0x4e -> :sswitch_3c
        0x5d -> :sswitch_2a
        0x7d -> :sswitch_2a
    .end sparse-switch
.end method

.method protected final _loadToHaveAtLeast(I)Z
    .registers 11
    .param p1, "minAvailable"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 203
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    if-nez v4, :cond_7

    .line 230
    :cond_6
    :goto_6
    return v2

    .line 207
    :cond_7
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    sub-int v0, v4, v5

    .line 208
    .local v0, "amount":I
    if-lez v0, :cond_69

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    if-lez v4, :cond_69

    .line 209
    iget-wide v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    .line 210
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    sub-int/2addr v4, v5

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 211
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    invoke-static {v4, v5, v6, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 212
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 216
    :goto_2d
    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 217
    :goto_2f
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-ge v4, p1, :cond_72

    .line 218
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    array-length v7, v7

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    sub-int/2addr v7, v8

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 219
    .local v1, "count":I
    if-ge v1, v3, :cond_6c

    .line 221
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_closeInput()V

    .line 223
    if-nez v1, :cond_6

    .line 224
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "InputStream.read() returned 0 characters when trying to read "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " bytes"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 214
    .end local v1    # "count":I
    :cond_69
    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    goto :goto_2d

    .line 228
    .restart local v1    # "count":I
    :cond_6c
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    goto :goto_2f

    .end local v1    # "count":I
    :cond_72
    move v2, v3

    .line 230
    goto :goto_6
.end method

.method protected final _matchToken(Ljava/lang/String;I)V
    .registers 7
    .param p1, "matchStr"    # Ljava/lang/String;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2740
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2741
    .local v1, "len":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/2addr v2, v1

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_f

    .line 2742
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken2(Ljava/lang/String;I)V

    .line 2756
    :cond_e
    :goto_e
    return-void

    .line 2746
    :cond_f
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_23

    .line 2747
    const/4 v2, 0x0

    invoke-virtual {p1, v2, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidToken(Ljava/lang/String;)V

    .line 2749
    :cond_23
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2750
    add-int/lit8 p2, p2, 0x1

    if-lt p2, v1, :cond_f

    .line 2752
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 2753
    .local v0, "ch":I
    const/16 v2, 0x30

    if-lt v0, v2, :cond_e

    const/16 v2, 0x5d

    if-eq v0, v2, :cond_e

    const/16 v2, 0x7d

    if-eq v0, v2, :cond_e

    .line 2754
    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_checkMatchEnd(Ljava/lang/String;II)V

    goto :goto_e
.end method

.method protected _parseAposName()Ljava/lang/String;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v12, 0x27

    const/4 v11, 0x4

    .line 2066
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_14

    .line 2067
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_14

    .line 2068
    const-string v8, ": was expecting closing \'\'\' for name"

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2071
    :cond_14
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v8, v8, v9

    and-int/lit16 v0, v8, 0xff

    .line 2072
    .local v0, "ch":I
    if-ne v0, v12, :cond_25

    .line 2073
    const-string v4, ""

    .line 2166
    :cond_24
    :goto_24
    return-object v4

    .line 2075
    :cond_25
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2076
    .local v7, "quads":[I
    const/4 v5, 0x0

    .line 2077
    .local v5, "qlen":I
    const/4 v2, 0x0

    .line 2078
    .local v2, "currQuad":I
    const/4 v3, 0x0

    .line 2082
    .local v3, "currQuadBytes":I
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .local v1, "codes":[I
    move v6, v5

    .line 2085
    .end local v5    # "qlen":I
    .local v6, "qlen":I
    :goto_2d
    if-ne v0, v12, :cond_50

    .line 2156
    if-lez v3, :cond_f4

    .line 2157
    array-length v8, v7

    if-lt v6, v8, :cond_3b

    .line 2158
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2160
    :cond_3b
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    invoke-static {v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->pad(II)I

    move-result v8

    aput v8, v7, v6

    .line 2162
    :goto_43
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v8, v7, v5}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v4

    .line 2163
    .local v4, "name":Ljava/lang/String;
    if-nez v4, :cond_24

    .line 2164
    invoke-direct {p0, v7, v5, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v4

    goto :goto_24

    .line 2089
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_50
    const/16 v8, 0x22

    if-eq v0, v8, :cond_8c

    aget v8, v1, v0

    if-eqz v8, :cond_8c

    .line 2090
    const/16 v8, 0x5c

    if-eq v0, v8, :cond_b5

    .line 2093
    const-string v8, "name"

    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    .line 2103
    :goto_61
    const/16 v8, 0x7f

    if-le v0, v8, :cond_8c

    .line 2105
    if-lt v3, v11, :cond_78

    .line 2106
    array-length v8, v7

    if-lt v6, v8, :cond_71

    .line 2107
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2109
    :cond_71
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 2110
    const/4 v2, 0x0

    .line 2111
    const/4 v3, 0x0

    move v6, v5

    .line 2113
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_78
    const/16 v8, 0x800

    if-ge v0, v8, :cond_ba

    .line 2114
    shl-int/lit8 v8, v2, 0x8

    shr-int/lit8 v9, v0, 0x6

    or-int/lit16 v9, v9, 0xc0

    or-int v2, v8, v9

    .line 2115
    add-int/lit8 v3, v3, 0x1

    move v5, v6

    .line 2133
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :goto_87
    and-int/lit8 v8, v0, 0x3f

    or-int/lit16 v0, v8, 0x80

    move v6, v5

    .line 2137
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_8c
    if-ge v3, v11, :cond_e3

    .line 2138
    add-int/lit8 v3, v3, 0x1

    .line 2139
    shl-int/lit8 v8, v2, 0x8

    or-int v2, v8, v0

    move v5, v6

    .line 2148
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :goto_95
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_a6

    .line 2149
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_a6

    .line 2150
    const-string v8, " in field name"

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2153
    :cond_a6
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v8, v8, v9

    and-int/lit16 v0, v8, 0xff

    move v6, v5

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    goto/16 :goto_2d

    .line 2096
    :cond_b5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    move-result v0

    goto :goto_61

    .line 2118
    :cond_ba
    shl-int/lit8 v8, v2, 0x8

    shr-int/lit8 v9, v0, 0xc

    or-int/lit16 v9, v9, 0xe0

    or-int v2, v8, v9

    .line 2119
    add-int/lit8 v3, v3, 0x1

    .line 2121
    if-lt v3, v11, :cond_f7

    .line 2122
    array-length v8, v7

    if-lt v6, v8, :cond_d0

    .line 2123
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2125
    :cond_d0
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 2126
    const/4 v2, 0x0

    .line 2127
    const/4 v3, 0x0

    .line 2129
    :goto_d6
    shl-int/lit8 v8, v2, 0x8

    shr-int/lit8 v9, v0, 0x6

    and-int/lit8 v9, v9, 0x3f

    or-int/lit16 v9, v9, 0x80

    or-int v2, v8, v9

    .line 2130
    add-int/lit8 v3, v3, 0x1

    goto :goto_87

    .line 2141
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_e3
    array-length v8, v7

    if-lt v6, v8, :cond_ed

    .line 2142
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2144
    :cond_ed
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 2145
    move v2, v0

    .line 2146
    const/4 v3, 0x1

    goto :goto_95

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_f4
    move v5, v6

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    goto/16 :goto_43

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_f7
    move v5, v6

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    goto :goto_d6
.end method

.method protected final _parseName(I)Ljava/lang/String;
    .registers 12
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    const/16 v5, 0x22

    .line 1646
    if-eq p1, v5, :cond_d

    .line 1647
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleOddName(I)Ljava/lang/String;

    move-result-object v3

    .line 1703
    :goto_c
    return-object v3

    .line 1650
    :cond_d
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0xd

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-le v3, v4, :cond_1a

    .line 1651
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->slowParseName()Ljava/lang/String;

    move-result-object v3

    goto :goto_c

    .line 1660
    :cond_1a
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 1661
    .local v1, "input":[B
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .line 1663
    .local v0, "codes":[I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 v2, v3, 0xff

    .line 1665
    .local v2, "q":I
    aget v3, v0, v2

    if-nez v3, :cond_ae

    .line 1666
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1667
    aget v3, v0, p1

    if-nez v3, :cond_a0

    .line 1668
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1669
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1670
    aget v3, v0, p1

    if-nez v3, :cond_92

    .line 1671
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1672
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1673
    aget v3, v0, p1

    if-nez v3, :cond_85

    .line 1674
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1675
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1676
    aget v3, v0, p1

    if-nez v3, :cond_77

    .line 1677
    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    .line 1678
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseMediumName(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_c

    .line 1680
    :cond_77
    if-ne p1, v5, :cond_7f

    .line 1681
    const/4 v3, 0x4

    invoke-direct {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_c

    .line 1683
    :cond_7f
    const/4 v3, 0x4

    invoke-direct {p0, v2, p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v3

    goto :goto_c

    .line 1685
    :cond_85
    if-ne p1, v5, :cond_8c

    .line 1686
    invoke-direct {p0, v2, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_c

    .line 1688
    :cond_8c
    invoke-direct {p0, v2, p1, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 1690
    :cond_92
    if-ne p1, v5, :cond_9a

    .line 1691
    invoke-direct {p0, v2, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(II)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 1693
    :cond_9a
    invoke-direct {p0, v2, p1, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 1695
    :cond_a0
    if-ne p1, v5, :cond_a8

    .line 1696
    invoke-direct {p0, v2, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(II)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 1698
    :cond_a8
    invoke-direct {p0, v2, p1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c

    .line 1700
    :cond_ae
    if-ne v2, v5, :cond_b4

    .line 1701
    const-string v3, ""

    goto/16 :goto_c

    .line 1703
    :cond_b4
    invoke-direct {p0, v6, v2, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_c
.end method

.method protected _parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x39

    const/16 v10, 0x30

    const/4 v4, 0x1

    .line 1384
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 1385
    .local v1, "outBuf":[C
    const/4 v2, 0x0

    .line 1388
    .local v2, "outPtr":I
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "outPtr":I
    .local v7, "outPtr":I
    const/16 v0, 0x2d

    aput-char v0, v1, v2

    .line 1390
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v8, :cond_1b

    .line 1391
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 1393
    :cond_1b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v8

    and-int/lit16 v3, v0, 0xff

    .line 1395
    .local v3, "c":I
    if-lt v3, v10, :cond_2b

    if-le v3, v11, :cond_31

    .line 1396
    :cond_2b
    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    move v2, v7

    .line 1440
    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    :goto_30
    return-object v0

    .line 1400
    .end local v2    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_31
    if-ne v3, v10, :cond_37

    .line 1401
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyNoLeadingZeroes()I

    move-result v3

    .line 1405
    :cond_37
    add-int/lit8 v2, v7, 0x1

    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    int-to-char v0, v3

    aput-char v0, v1, v7

    .line 1406
    const/4 v5, 0x1

    .line 1410
    .local v5, "intLen":I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    array-length v8, v1

    add-int/2addr v0, v8

    add-int/lit8 v6, v0, -0x2

    .line 1411
    .local v6, "end":I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-le v6, v0, :cond_49

    .line 1412
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 1417
    :cond_49
    :goto_49
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    if-lt v0, v6, :cond_52

    .line 1419
    invoke-direct {p0, v1, v2, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNumber2([CIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_30

    .line 1421
    :cond_52
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v8

    and-int/lit16 v3, v0, 0xff

    .line 1422
    if-lt v3, v10, :cond_62

    if-le v3, v11, :cond_74

    .line 1428
    :cond_62
    const/16 v0, 0x2e

    if-eq v3, v0, :cond_6e

    const/16 v0, 0x65

    if-eq v3, v0, :cond_6e

    const/16 v0, 0x45

    if-ne v3, v0, :cond_7d

    :cond_6e
    move-object v0, p0

    .line 1429
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_30

    .line 1425
    :cond_74
    add-int/lit8 v5, v5, 0x1

    .line 1426
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "outPtr":I
    .restart local v7    # "outPtr":I
    int-to-char v0, v3

    aput-char v0, v1, v2

    move v2, v7

    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    goto :goto_49

    .line 1432
    :cond_7d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1433
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1435
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_93

    .line 1436
    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyRootSpace(I)V

    .line 1440
    :cond_93
    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_30
.end method

.method protected _parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 12
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x30

    const/4 v4, 0x0

    .line 1342
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 1344
    .local v1, "outBuf":[C
    if-ne p1, v9, :cond_f

    .line 1345
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyNoLeadingZeroes()I

    move-result p1

    .line 1348
    :cond_f
    int-to-char v0, p1

    aput-char v0, v1, v4

    .line 1349
    const/4 v5, 0x1

    .line 1350
    .local v5, "intLen":I
    const/4 v2, 0x1

    .line 1353
    .local v2, "outPtr":I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    array-length v3, v1

    add-int/2addr v0, v3

    add-int/lit8 v6, v0, -0x1

    .line 1354
    .local v6, "end":I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-le v6, v0, :cond_20

    .line 1355
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 1359
    :cond_20
    :goto_20
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    if-lt v0, v6, :cond_29

    .line 1360
    invoke-direct {p0, v1, v2, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNumber2([CIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 1379
    :goto_28
    return-object v0

    .line 1362
    :cond_29
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v8, v3, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v3

    and-int/lit16 p1, v0, 0xff

    .line 1363
    if-lt p1, v9, :cond_3b

    const/16 v0, 0x39

    if-le p1, v0, :cond_4e

    .line 1369
    :cond_3b
    const/16 v0, 0x2e

    if-eq p1, v0, :cond_47

    const/16 v0, 0x65

    if-eq p1, v0, :cond_47

    const/16 v0, 0x45

    if-ne p1, v0, :cond_57

    :cond_47
    move-object v0, p0

    move v3, p1

    .line 1370
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_28

    .line 1366
    :cond_4e
    add-int/lit8 v5, v5, 0x1

    .line 1367
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "outPtr":I
    .local v7, "outPtr":I
    int-to-char v0, p1

    aput-char v0, v1, v2

    move v2, v7

    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    goto :goto_20

    .line 1372
    :cond_57
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1373
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1375
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_6d

    .line 1376
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyRootSpace(I)V

    .line 1379
    :cond_6d
    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_28
.end method

.method protected _readBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;[B)I
    .registers 14
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 524
    const/4 v5, 0x0

    .line 525
    .local v5, "outputPtr":I
    array-length v7, p3

    add-int/lit8 v4, v7, -0x3

    .line 526
    .local v4, "outputEnd":I
    const/4 v3, 0x0

    .line 532
    .local v3, "outputCount":I
    :cond_5
    :goto_5
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_e

    .line 533
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 535
    :cond_e
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 536
    .local v1, "ch":I
    const/16 v7, 0x20

    if-le v1, v7, :cond_5

    .line 537
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 538
    .local v0, "bits":I
    if-gez v0, :cond_3a

    .line 539
    const/16 v7, 0x22

    if-ne v1, v7, :cond_33

    .line 640
    :goto_28
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 641
    if-lez v5, :cond_32

    .line 642
    add-int/2addr v3, v5

    .line 643
    const/4 v7, 0x0

    invoke-virtual {p2, p3, v7, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 645
    :cond_32
    return v3

    .line 542
    :cond_33
    const/4 v7, 0x0

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 543
    if-ltz v0, :cond_5

    .line 549
    :cond_3a
    if-le v5, v4, :cond_42

    .line 550
    add-int/2addr v3, v5

    .line 551
    const/4 v7, 0x0

    invoke-virtual {p2, p3, v7, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 552
    const/4 v5, 0x0

    .line 555
    :cond_42
    move v2, v0

    .line 559
    .local v2, "decodedData":I
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_4c

    .line 560
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 562
    :cond_4c
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 563
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 564
    if-gez v0, :cond_63

    .line 565
    const/4 v7, 0x1

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 567
    :cond_63
    shl-int/lit8 v7, v2, 0x6

    or-int v2, v7, v0

    .line 570
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_70

    .line 571
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 573
    :cond_70
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 574
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 577
    if-gez v0, :cond_e8

    .line 578
    const/4 v7, -0x2

    if-eq v0, v7, :cond_9d

    .line 580
    const/16 v7, 0x22

    if-ne v1, v7, :cond_98

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v7

    if-nez v7, :cond_98

    .line 581
    shr-int/lit8 v2, v2, 0x4

    .line 582
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .local v6, "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v5

    move v5, v6

    .line 583
    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    goto :goto_28

    .line 585
    :cond_98
    const/4 v7, 0x2

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 587
    :cond_9d
    const/4 v7, -0x2

    if-ne v0, v7, :cond_e8

    .line 589
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_a9

    .line 590
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 592
    :cond_a9
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 593
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPaddingChar(I)Z

    move-result v7

    if-nez v7, :cond_de

    .line 594
    const/4 v7, 0x3

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "expected padding character \'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getPaddingChar()C

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\'"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, p1, v1, v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportInvalidBase64Char(Lcom/fasterxml/jackson/core/Base64Variant;IILjava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v7

    throw v7

    .line 597
    :cond_de
    shr-int/lit8 v2, v2, 0x4

    .line 598
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v5

    move v5, v6

    .line 599
    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    goto/16 :goto_5

    .line 603
    :cond_e8
    shl-int/lit8 v7, v2, 0x6

    or-int v2, v7, v0

    .line 605
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_f5

    .line 606
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 608
    :cond_f5
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 609
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 610
    if-gez v0, :cond_13c

    .line 611
    const/4 v7, -0x2

    if-eq v0, v7, :cond_129

    .line 613
    const/16 v7, 0x22

    if-ne v1, v7, :cond_124

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v7

    if-nez v7, :cond_124

    .line 614
    shr-int/lit8 v2, v2, 0x2

    .line 615
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x8

    int-to-byte v7, v7

    aput-byte v7, p3, v5

    .line 616
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v6

    goto/16 :goto_28

    .line 619
    :cond_124
    const/4 v7, 0x3

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 621
    :cond_129
    const/4 v7, -0x2

    if-ne v0, v7, :cond_13c

    .line 628
    shr-int/lit8 v2, v2, 0x2

    .line 629
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x8

    int-to-byte v7, v7

    aput-byte v7, p3, v5

    .line 630
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v6

    goto/16 :goto_5

    .line 635
    :cond_13c
    shl-int/lit8 v7, v2, 0x6

    or-int v2, v7, v0

    .line 636
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x10

    int-to-byte v7, v7

    aput-byte v7, p3, v5

    .line 637
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x8

    int-to-byte v7, v7

    aput-byte v7, p3, v6

    .line 638
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v5

    move v5, v6

    .line 639
    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    goto/16 :goto_5
.end method

.method protected _releaseBuffers()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 257
    invoke-super {p0}, Lcom/fasterxml/jackson/core/base/ParserBase;->_releaseBuffers()V

    .line 259
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->release()V

    .line 260
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_bufferRecyclable:Z

    if-eqz v1, :cond_19

    .line 261
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 262
    .local v0, "buf":[B
    if-eqz v0, :cond_19

    .line 267
    sget-object v1, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->NO_BYTES:[B

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 268
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseReadIOBuffer([B)V

    .line 271
    .end local v0    # "buf":[B
    :cond_19
    return-void
.end method

.method protected _reportInvalidChar(I)V
    .registers 3
    .param p1, "c"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 3455
    const/16 v0, 0x20

    if-ge p1, v0, :cond_7

    .line 3456
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    .line 3458
    :cond_7
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidInitial(I)V

    .line 3459
    return-void
.end method

.method protected _reportInvalidInitial(I)V
    .registers 4
    .param p1, "mask"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 3464
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid UTF-8 start byte 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportError(Ljava/lang/String;)V

    .line 3465
    return-void
.end method

.method protected _reportInvalidOther(I)V
    .registers 4
    .param p1, "mask"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 3470
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid UTF-8 middle byte 0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportError(Ljava/lang/String;)V

    .line 3471
    return-void
.end method

.method protected _reportInvalidOther(II)V
    .registers 3
    .param p1, "mask"    # I
    .param p2, "ptr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 3476
    iput p2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 3477
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 3478
    return-void
.end method

.method protected _reportInvalidToken(Ljava/lang/String;)V
    .registers 3
    .param p1, "matchedPart"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3426
    const-string v0, "\'null\', \'true\', \'false\' or NaN"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 3427
    return-void
.end method

.method protected _reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "matchedPart"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3431
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3438
    .local v2, "sb":Ljava/lang/StringBuilder;
    :goto_5
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_36

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_36

    .line 3448
    :cond_11
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unrecognized token \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\': was expecting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportError(Ljava/lang/String;)V

    .line 3449
    return-void

    .line 3441
    :cond_36
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v3, v4

    .line 3442
    .local v1, "i":I
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeCharForError(I)I

    move-result v3

    int-to-char v0, v3

    .line 3443
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 3446
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_5
.end method

.method protected final _skipCR()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3401
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_c

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 3402
    :cond_c
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1c

    .line 3403
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 3406
    :cond_1c
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 3407
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 3408
    return-void
.end method

.method protected _skipString()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2506
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 2509
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 2510
    .local v1, "codes":[I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 2518
    .local v2, "inputBuffer":[B
    :goto_7
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2519
    .local v4, "ptr":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 2520
    .local v3, "max":I
    if-lt v4, v3, :cond_4e

    .line 2521
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 2522
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2523
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    move v5, v4

    .line 2525
    .end local v4    # "ptr":I
    .local v5, "ptr":I
    :goto_15
    if-ge v5, v3, :cond_28

    .line 2526
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "ptr":I
    .restart local v4    # "ptr":I
    aget-byte v6, v2, v5

    and-int/lit16 v0, v6, 0xff

    .line 2527
    .local v0, "c":I
    aget v6, v1, v0

    if-eqz v6, :cond_4e

    .line 2528
    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2535
    const/16 v6, 0x22

    if-ne v0, v6, :cond_2b

    .line 2562
    return-void

    .line 2532
    .end local v0    # "c":I
    .end local v4    # "ptr":I
    .restart local v5    # "ptr":I
    :cond_28
    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_7

    .line 2539
    .end local v5    # "ptr":I
    .restart local v0    # "c":I
    .restart local v4    # "ptr":I
    :cond_2b
    aget v6, v1, v0

    packed-switch v6, :pswitch_data_50

    .line 2553
    const/16 v6, 0x20

    if-ge v0, v6, :cond_4a

    .line 2555
    const-string v6, "string value"

    invoke-virtual {p0, v0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_7

    .line 2541
    :pswitch_3a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    goto :goto_7

    .line 2544
    :pswitch_3e
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_2(I)V

    goto :goto_7

    .line 2547
    :pswitch_42
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_3(I)V

    goto :goto_7

    .line 2550
    :pswitch_46
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_4(I)V

    goto :goto_7

    .line 2558
    :cond_4a
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    goto :goto_7

    .end local v0    # "c":I
    :cond_4e
    move v5, v4

    .end local v4    # "ptr":I
    .restart local v5    # "ptr":I
    goto :goto_15

    .line 2539
    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_3a
        :pswitch_3e
        :pswitch_42
        :pswitch_46
    .end packed-switch
.end method

.method public getBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;)[B
    .registers 6
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 475
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_2e

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_EMBEDDED_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_10

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    if-nez v2, :cond_2e

    .line 477
    :cond_10
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Current token ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") not VALUE_STRING or VALUE_EMBEDDED_OBJECT, can not access as binary"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportError(Ljava/lang/String;)V

    .line 482
    :cond_2e
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_65

    .line 484
    :try_start_32
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64(Lcom/fasterxml/jackson/core/Base64Variant;)[B

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B
    :try_end_38
    .catch Ljava/lang/IllegalArgumentException; {:try_start_32 .. :try_end_38} :catch_3e

    .line 491
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 500
    :cond_3b
    :goto_3b
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    return-object v2

    .line 485
    :catch_3e
    move-exception v1

    .line 486
    .local v1, "iae":Ljava/lang/IllegalArgumentException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to decode VALUE_STRING as base64 ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_constructError(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParseException;

    move-result-object v2

    throw v2

    .line 493
    .end local v1    # "iae":Ljava/lang/IllegalArgumentException;
    :cond_65
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    if-nez v2, :cond_3b

    .line 495
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_getByteArrayBuilder()Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    move-result-object v0

    .line 496
    .local v0, "builder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64(Ljava/lang/String;Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;Lcom/fasterxml/jackson/core/Base64Variant;)V

    .line 497
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    goto :goto_3b
.end method

.method public getCodec()Lcom/fasterxml/jackson/core/ObjectCodec;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    return-object v0
.end method

.method public getCurrentLocation()Lcom/fasterxml/jackson/core/JsonLocation;
    .registers 9

    .prologue
    .line 662
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    sub-int/2addr v0, v1

    add-int/lit8 v7, v0, 0x1

    .line 663
    .local v7, "col":I
    new-instance v0, Lcom/fasterxml/jackson/core/JsonLocation;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/io/IOContext;->getSourceReference()Ljava/lang/Object;

    move-result-object v1

    iget-wide v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    const-wide/16 v4, -0x1

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    invoke-direct/range {v0 .. v7}, Lcom/fasterxml/jackson/core/JsonLocation;-><init>(Ljava/lang/Object;JJII)V

    return-object v0
.end method

.method public getInputSource()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 282
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_19

    .line 283
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_12

    .line 284
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 285
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishAndReturnString()Ljava/lang/String;

    move-result-object v0

    .line 289
    :goto_11
    return-object v0

    .line 287
    :cond_12
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    .line 289
    :cond_19
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_getText2(Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/String;

    move-result-object v0

    goto :goto_11
.end method

.method public getTextCharacters()[C
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 390
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v2, :cond_54

    .line 391
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v2

    packed-switch v2, :pswitch_data_56

    .line 418
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonToken;->asCharArray()[C

    move-result-object v2

    .line 421
    :goto_14
    return-object v2

    .line 394
    :pswitch_15
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    if-nez v2, :cond_37

    .line 395
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 396
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 397
    .local v1, "nameLen":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    if-nez v2, :cond_3a

    .line 398
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocNameCopyBuffer(I)[C

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    .line 402
    :cond_2f
    :goto_2f
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    invoke-virtual {v0, v3, v1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 403
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 405
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "nameLen":I
    :cond_37
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    goto :goto_14

    .line 399
    .restart local v0    # "name":Ljava/lang/String;
    .restart local v1    # "nameLen":I
    :cond_3a
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    array-length v2, v2

    if-ge v2, v1, :cond_2f

    .line 400
    new-array v2, v1, [C

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    goto :goto_2f

    .line 408
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "nameLen":I
    :pswitch_44
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_4d

    .line 409
    iput-boolean v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 410
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 415
    :cond_4d
    :pswitch_4d
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextBuffer()[C

    move-result-object v2

    goto :goto_14

    .line 421
    :cond_54
    const/4 v2, 0x0

    goto :goto_14

    .line 391
    :pswitch_data_56
    .packed-switch 0x5
        :pswitch_15
        :pswitch_44
        :pswitch_4d
        :pswitch_4d
    .end packed-switch
.end method

.method public getTextLength()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 427
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v1, :cond_15

    .line 428
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v1

    packed-switch v1, :pswitch_data_32

    .line 443
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->asCharArray()[C

    move-result-object v0

    array-length v0, v0

    .line 446
    :cond_15
    :goto_15
    return v0

    .line 431
    :pswitch_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_15

    .line 433
    :pswitch_21
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_2a

    .line 434
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 435
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 440
    :cond_2a
    :pswitch_2a
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v0

    goto :goto_15

    .line 428
    nop

    :pswitch_data_32
    .packed-switch 0x5
        :pswitch_16
        :pswitch_21
        :pswitch_2a
        :pswitch_2a
    .end packed-switch
.end method

.method public getTextOffset()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 453
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v1, :cond_e

    .line 454
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v1

    packed-switch v1, :pswitch_data_20

    .line 469
    :cond_e
    :goto_e
    :pswitch_e
    return v0

    .line 458
    :pswitch_f
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_18

    .line 459
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 460
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 465
    :cond_18
    :pswitch_18
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextOffset()I

    move-result v0

    goto :goto_e

    .line 454
    nop

    :pswitch_data_20
    .packed-switch 0x5
        :pswitch_e
        :pswitch_f
        :pswitch_18
        :pswitch_18
    .end packed-switch
.end method

.method public getTokenLocation()Lcom/fasterxml/jackson/core/JsonLocation;
    .registers 9

    .prologue
    .line 652
    new-instance v0, Lcom/fasterxml/jackson/core/JsonLocation;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/io/IOContext;->getSourceReference()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getTokenCharacterOffset()J

    move-result-wide v2

    const-wide/16 v4, -0x1

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getTokenLineNr()I

    move-result v6

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getTokenColumnNr()I

    move-result v7

    invoke-direct/range {v0 .. v7}, Lcom/fasterxml/jackson/core/JsonLocation;-><init>(Ljava/lang/Object;JJII)V

    return-object v0
.end method

.method public getValueAsInt()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 333
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_a

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_25

    .line 335
    :cond_a
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_22

    .line 336
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    if-nez v1, :cond_19

    .line 337
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseIntValue()I

    move-result v1

    .line 345
    :goto_18
    return v1

    .line 339
    :cond_19
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_22

    .line 340
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->convertNumberToInt()V

    .line 343
    :cond_22
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numberInt:I

    goto :goto_18

    .line 345
    :cond_25
    const/4 v1, 0x0

    invoke-super {p0, v1}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsInt(I)I

    move-result v1

    goto :goto_18
.end method

.method public getValueAsInt(I)I
    .registers 4
    .param p1, "defValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 352
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 353
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_a

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_FLOAT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_25

    .line 355
    :cond_a
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_22

    .line 356
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    if-nez v1, :cond_19

    .line 357
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseIntValue()I

    move-result v1

    .line 365
    :goto_18
    return v1

    .line 359
    :cond_19
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_22

    .line 360
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->convertNumberToInt()V

    .line 363
    :cond_22
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numberInt:I

    goto :goto_18

    .line 365
    :cond_25
    invoke-super {p0, p1}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsInt(I)I

    move-result v1

    goto :goto_18
.end method

.method public getValueAsString()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 298
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_19

    .line 299
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_12

    .line 300
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 301
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishAndReturnString()Ljava/lang/String;

    move-result-object v0

    .line 308
    :goto_11
    return-object v0

    .line 303
    :cond_12
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    .line 305
    :cond_19
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_24

    .line 306
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    .line 308
    :cond_24
    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_11
.end method

.method public getValueAsString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "defValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_19

    .line 316
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_12

    .line 317
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 318
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishAndReturnString()Ljava/lang/String;

    move-result-object v0

    .line 325
    :goto_11
    return-object v0

    .line 320
    :cond_12
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    .line 322
    :cond_19
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_24

    .line 323
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    .line 325
    :cond_24
    invoke-super {p0, p1}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_11
.end method

.method protected final loadMore()Z
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 171
    iget-wide v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    int-to-long v5, v5

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    .line 172
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 174
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    if-eqz v3, :cond_19

    .line 175
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    array-length v1, v3

    .line 176
    .local v1, "space":I
    if-nez v1, :cond_1a

    .line 193
    .end local v1    # "space":I
    :cond_19
    :goto_19
    return v2

    .line 180
    .restart local v1    # "space":I
    :cond_1a
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    invoke-virtual {v3, v4, v2, v1}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 181
    .local v0, "count":I
    if-lez v0, :cond_2a

    .line 182
    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 183
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 184
    const/4 v2, 0x1

    goto :goto_19

    .line 187
    :cond_2a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_closeInput()V

    .line 189
    if-nez v0, :cond_19

    .line 190
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "InputStream.read() returned 0 characters when trying to read "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    array-length v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " bytes"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public nextBooleanValue()Ljava/lang/Boolean;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1290
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_40

    .line 1291
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 1292
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1293
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1294
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1295
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_17

    .line 1296
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1316
    :cond_16
    :goto_16
    return-object v1

    .line 1298
    :cond_17
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_1e

    .line 1299
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_16

    .line 1301
    :cond_1e
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_2f

    .line 1302
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_16

    .line 1303
    :cond_2f
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_16

    .line 1304
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_16

    .line 1309
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_40
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 1310
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_4b

    .line 1311
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_16

    .line 1313
    :cond_4b
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_16

    .line 1314
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_16
.end method

.method public nextFieldName()Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x7d

    const/16 v8, 0x5d

    const/4 v7, 0x1

    const/4 v1, 0x0

    .line 957
    const/4 v3, 0x0

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    .line 958
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v4, :cond_13

    .line 959
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    .line 1057
    :goto_12
    return-object v1

    .line 962
    :cond_13
    iget-boolean v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v3, :cond_1a

    .line 963
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipString()V

    .line 965
    :cond_1a
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd()I

    move-result v0

    .line 966
    .local v0, "i":I
    if-gez v0, :cond_26

    .line 967
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->close()V

    .line 968
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_12

    .line 971
    :cond_26
    iget-wide v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    int-to-long v5, v5

    add-long/2addr v3, v5

    const-wide/16 v5, 0x1

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputTotal:J

    .line 972
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    .line 973
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    .line 975
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    .line 977
    if-ne v0, v8, :cond_5a

    .line 978
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v3

    if-nez v3, :cond_4d

    .line 979
    invoke-virtual {p0, v0, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 981
    :cond_4d
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 982
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_12

    .line 985
    :cond_5a
    if-ne v0, v9, :cond_74

    .line 986
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_67

    .line 987
    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 989
    :cond_67
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 990
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_12

    .line 995
    :cond_74
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v3

    if-eqz v3, :cond_a6

    .line 996
    const/16 v3, 0x2c

    if-eq v0, v3, :cond_a2

    .line 997
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "was expecting comma to separate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " entries"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 999
    :cond_a2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWS()I

    move-result v0

    .line 1002
    :cond_a6
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_b3

    .line 1003
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_12

    .line 1007
    :cond_b3
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseName(I)Ljava/lang/String;

    move-result-object v1

    .line 1008
    .local v1, "nameStr":Ljava/lang/String;
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3, v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 1009
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1011
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon()I

    move-result v0

    .line 1012
    const/16 v3, 0x22

    if-ne v0, v3, :cond_d0

    .line 1013
    iput-boolean v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 1014
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_12

    .line 1018
    :cond_d0
    sparse-switch v0, :sswitch_data_104

    .line 1054
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 1056
    .local v2, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_d7
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_12

    .line 1020
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_db
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 1021
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_d7

    .line 1032
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_e0
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 1033
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_d7

    .line 1035
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_e5
    const-string v3, "false"

    invoke-virtual {p0, v3, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1036
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1037
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_d7

    .line 1039
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_ed
    const-string v3, "null"

    invoke-virtual {p0, v3, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1040
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1041
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_d7

    .line 1043
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_f5
    const-string v3, "true"

    invoke-virtual {p0, v3, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1044
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1045
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_d7

    .line 1047
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_fd
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1048
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_d7

    .line 1050
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_100
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1051
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_d7

    .line 1018
    nop

    :sswitch_data_104
    .sparse-switch
        0x2d -> :sswitch_db
        0x30 -> :sswitch_e0
        0x31 -> :sswitch_e0
        0x32 -> :sswitch_e0
        0x33 -> :sswitch_e0
        0x34 -> :sswitch_e0
        0x35 -> :sswitch_e0
        0x36 -> :sswitch_e0
        0x37 -> :sswitch_e0
        0x38 -> :sswitch_e0
        0x39 -> :sswitch_e0
        0x5b -> :sswitch_fd
        0x66 -> :sswitch_e5
        0x6e -> :sswitch_ed
        0x74 -> :sswitch_f5
        0x7b -> :sswitch_100
    .end sparse-switch
.end method

.method public nextFieldName(Lcom/fasterxml/jackson/core/SerializableString;)Z
    .registers 12
    .param p1, "str"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 869
    const/4 v6, 0x0

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    .line 870
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v6, v7, :cond_e

    .line 871
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    .line 872
    const/4 v6, 0x0

    .line 949
    :goto_d
    return v6

    .line 874
    :cond_e
    iget-boolean v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v6, :cond_15

    .line 875
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipString()V

    .line 877
    :cond_15
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd()I

    move-result v1

    .line 878
    .local v1, "i":I
    if-gez v1, :cond_23

    .line 879
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->close()V

    .line 880
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 881
    const/4 v6, 0x0

    goto :goto_d

    .line 883
    :cond_23
    iget-wide v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    int-to-long v8, v8

    add-long/2addr v6, v8

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputTotal:J

    .line 884
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    .line 885
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    sub-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    .line 888
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    .line 891
    const/16 v6, 0x5d

    if-ne v1, v6, :cond_5d

    .line 892
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v6

    if-nez v6, :cond_4f

    .line 893
    const/16 v6, 0x7d

    invoke-virtual {p0, v1, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 895
    :cond_4f
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v6

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 896
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 897
    const/4 v6, 0x0

    goto :goto_d

    .line 899
    :cond_5d
    const/16 v6, 0x7d

    if-ne v1, v6, :cond_7c

    .line 900
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v6

    if-nez v6, :cond_6e

    .line 901
    const/16 v6, 0x5d

    invoke-virtual {p0, v1, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 903
    :cond_6e
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v6

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 904
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 905
    const/4 v6, 0x0

    goto :goto_d

    .line 909
    :cond_7c
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v6

    if-eqz v6, :cond_ae

    .line 910
    const/16 v6, 0x2c

    if-eq v1, v6, :cond_aa

    .line 911
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "was expecting comma to separate "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " entries"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v1, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 913
    :cond_aa
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWS()I

    move-result v1

    .line 916
    :cond_ae
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v6

    if-nez v6, :cond_bc

    .line 917
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;

    .line 918
    const/4 v6, 0x0

    goto/16 :goto_d

    .line 922
    :cond_bc
    const/16 v6, 0x22

    if-ne v1, v6, :cond_fc

    .line 924
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedUTF8()[B

    move-result-object v3

    .line 925
    .local v3, "nameBytes":[B
    array-length v2, v3

    .line 928
    .local v2, "len":I
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/2addr v6, v2

    add-int/lit8 v6, v6, 0x4

    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-ge v6, v7, :cond_fc

    .line 930
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int v0, v6, v2

    .line 931
    .local v0, "end":I
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    aget-byte v6, v6, v0

    const/16 v7, 0x22

    if-ne v6, v7, :cond_fc

    .line 932
    const/4 v4, 0x0

    .line 933
    .local v4, "offset":I
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 935
    .local v5, "ptr":I
    :goto_dd
    if-ne v5, v0, :cond_f4

    .line 936
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 937
    add-int/lit8 v6, v5, 0x1

    invoke-direct {p0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColonFast(I)I

    move-result v6

    invoke-direct {p0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_isNextTokenNameYes(I)V

    .line 938
    const/4 v6, 0x1

    goto/16 :goto_d

    .line 940
    :cond_f4
    aget-byte v6, v3, v4

    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    aget-byte v7, v7, v5

    if-eq v6, v7, :cond_102

    .line 949
    .end local v0    # "end":I
    .end local v2    # "len":I
    .end local v3    # "nameBytes":[B
    .end local v4    # "offset":I
    .end local v5    # "ptr":I
    :cond_fc
    invoke-direct {p0, v1, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_isNextTokenNameMaybe(ILcom/fasterxml/jackson/core/SerializableString;)Z

    move-result v6

    goto/16 :goto_d

    .line 943
    .restart local v0    # "end":I
    .restart local v2    # "len":I
    .restart local v3    # "nameBytes":[B
    .restart local v4    # "offset":I
    .restart local v5    # "ptr":I
    :cond_102
    add-int/lit8 v4, v4, 0x1

    .line 944
    add-int/lit8 v5, v5, 0x1

    goto :goto_dd
.end method

.method public nextIntValue(I)I
    .registers 6
    .param p1, "defaultValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1244
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_3b

    .line 1245
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 1246
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1247
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1248
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1249
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_19

    .line 1250
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getIntValue()I

    move-result p1

    .line 1260
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .end local p1    # "defaultValue":I
    :cond_18
    :goto_18
    return p1

    .line 1252
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local p1    # "defaultValue":I
    :cond_19
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2a

    .line 1253
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1254
    :cond_2a
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_18

    .line 1255
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1260
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_3b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_18

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getIntValue()I

    move-result p1

    goto :goto_18
.end method

.method public nextLongValue(J)J
    .registers 7
    .param p1, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1267
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_3b

    .line 1268
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 1269
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1270
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1271
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1272
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_19

    .line 1273
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getLongValue()J

    move-result-wide p1

    .line 1283
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .end local p1    # "defaultValue":J
    :cond_18
    :goto_18
    return-wide p1

    .line 1275
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local p1    # "defaultValue":J
    :cond_19
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2a

    .line 1276
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1277
    :cond_2a
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_18

    .line 1278
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1283
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_3b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_18

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getLongValue()J

    move-result-wide p1

    goto :goto_18
.end method

.method public nextTextValue()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 1217
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_48

    .line 1218
    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 1219
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1220
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1221
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1222
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_26

    .line 1223
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_1f

    .line 1224
    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 1225
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishAndReturnString()Ljava/lang/String;

    move-result-object v1

    .line 1237
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_1e
    :goto_1e
    return-object v1

    .line 1227
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_1f
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1e

    .line 1229
    :cond_26
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_37

    .line 1230
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_1e

    .line 1231
    :cond_37
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_1e

    .line 1232
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_1e

    .line 1237
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_48
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_1e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_1e
.end method

.method public nextToken()Lcom/fasterxml/jackson/core/JsonToken;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/16 v10, 0x7d

    const/16 v9, 0x5d

    const/4 v8, 0x1

    .line 681
    const/4 v4, 0x0

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    .line 686
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v5, :cond_14

    .line 687
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 798
    :goto_13
    return-object v3

    .line 689
    :cond_14
    iget-boolean v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v4, :cond_1b

    .line 690
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipString()V

    .line 692
    :cond_1b
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd()I

    move-result v0

    .line 693
    .local v0, "i":I
    if-gez v0, :cond_27

    .line 695
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->close()V

    .line 696
    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 701
    :cond_27
    iget-wide v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputTotal:J

    .line 702
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    .line 703
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    sub-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    .line 706
    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    .line 709
    if-ne v0, v9, :cond_5b

    .line 710
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v3

    if-nez v3, :cond_4e

    .line 711
    invoke-virtual {p0, v0, v10}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 713
    :cond_4e
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 714
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 716
    :cond_5b
    if-ne v0, v10, :cond_75

    .line 717
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_68

    .line 718
    invoke-virtual {p0, v0, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 720
    :cond_68
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 721
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 725
    :cond_75
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v3

    if-eqz v3, :cond_a7

    .line 726
    const/16 v3, 0x2c

    if-eq v0, v3, :cond_a3

    .line 727
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "was expecting comma to separate "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " entries"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 729
    :cond_a3
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWS()I

    move-result v0

    .line 736
    :cond_a7
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_b5

    .line 737
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    goto/16 :goto_13

    .line 740
    :cond_b5
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseName(I)Ljava/lang/String;

    move-result-object v1

    .line 741
    .local v1, "n":Ljava/lang/String;
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3, v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 742
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 744
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon()I

    move-result v0

    .line 747
    const/16 v3, 0x22

    if-ne v0, v3, :cond_d4

    .line 748
    iput-boolean v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 749
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 750
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_13

    .line 754
    :cond_d4
    sparse-switch v0, :sswitch_data_10a

    .line 795
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 797
    .local v2, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_db
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 798
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_13

    .line 756
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_e1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 757
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_db

    .line 773
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_e6
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 774
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_db

    .line 776
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_eb
    const-string v3, "false"

    invoke-virtual {p0, v3, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 777
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 778
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_db

    .line 780
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_f3
    const-string v3, "null"

    invoke-virtual {p0, v3, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 781
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 782
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_db

    .line 784
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_fb
    const-string v3, "true"

    invoke-virtual {p0, v3, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 785
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 786
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_db

    .line 788
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_103
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 789
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_db

    .line 791
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_106
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 792
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_db

    .line 754
    nop

    :sswitch_data_10a
    .sparse-switch
        0x2d -> :sswitch_e1
        0x30 -> :sswitch_e6
        0x31 -> :sswitch_e6
        0x32 -> :sswitch_e6
        0x33 -> :sswitch_e6
        0x34 -> :sswitch_e6
        0x35 -> :sswitch_e6
        0x36 -> :sswitch_e6
        0x37 -> :sswitch_e6
        0x38 -> :sswitch_e6
        0x39 -> :sswitch_e6
        0x5b -> :sswitch_103
        0x66 -> :sswitch_eb
        0x6e -> :sswitch_f3
        0x74 -> :sswitch_fb
        0x7b -> :sswitch_106
    .end sparse-switch
.end method

.method protected final parseEscapedName([IIIII)Ljava/lang/String;
    .registers 13
    .param p1, "quads"    # [I
    .param p2, "qlen"    # I
    .param p3, "currQuad"    # I
    .param p4, "ch"    # I
    .param p5, "currQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x4

    .line 1899
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .line 1902
    .local v0, "codes":[I
    :goto_3
    aget v3, v0, p4

    if-eqz v3, :cond_cb

    .line 1903
    const/16 v3, 0x22

    if-ne p4, v3, :cond_2d

    .line 1972
    if-lez p5, :cond_20

    .line 1973
    array-length v3, p1

    if-lt p2, v3, :cond_17

    .line 1974
    array-length v3, p1

    invoke-static {p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1976
    :cond_17
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "qlen":I
    .local v2, "qlen":I
    invoke-static {p3, p5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->pad(II)I

    move-result v3

    aput v3, p1, p2

    move p2, v2

    .line 1978
    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :cond_20
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;

    invoke-virtual {v3, p1, p2}, Lcom/fasterxml/jackson/core/sym/ByteQuadsCanonicalizer;->findName([II)Ljava/lang/String;

    move-result-object v1

    .line 1979
    .local v1, "name":Ljava/lang/String;
    if-nez v1, :cond_2c

    .line 1980
    invoke-direct {p0, p1, p2, p5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Ljava/lang/String;

    move-result-object v1

    .line 1982
    :cond_2c
    return-object v1

    .line 1907
    .end local v1    # "name":Ljava/lang/String;
    :cond_2d
    const/16 v3, 0x5c

    if-eq p4, v3, :cond_88

    .line 1909
    const-string v3, "name"

    invoke-virtual {p0, p4, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    .line 1919
    :goto_36
    const/16 v3, 0x7f

    if-le p4, v3, :cond_cb

    .line 1921
    if-lt p5, v6, :cond_c9

    .line 1922
    array-length v3, p1

    if-lt p2, v3, :cond_46

    .line 1923
    array-length v3, p1

    invoke-static {p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1925
    :cond_46
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    aput p3, p1, p2

    .line 1926
    const/4 p3, 0x0

    .line 1927
    const/4 p5, 0x0

    .line 1929
    :goto_4c
    const/16 v3, 0x800

    if-ge p4, v3, :cond_8d

    .line 1930
    shl-int/lit8 v3, p3, 0x8

    shr-int/lit8 v4, p4, 0x6

    or-int/lit16 v4, v4, 0xc0

    or-int p3, v3, v4

    .line 1931
    add-int/lit8 p5, p5, 0x1

    move p2, v2

    .line 1949
    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :goto_5b
    and-int/lit8 v3, p4, 0x3f

    or-int/lit16 p4, v3, 0x80

    move v2, p2

    .line 1953
    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :goto_60
    if-ge p5, v6, :cond_b6

    .line 1954
    add-int/lit8 p5, p5, 0x1

    .line 1955
    shl-int/lit8 v3, p3, 0x8

    or-int p3, v3, p4

    move p2, v2

    .line 1964
    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :goto_69
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_7a

    .line 1965
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_7a

    .line 1966
    const-string v3, " in field name"

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1969
    :cond_7a
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 p4, v3, 0xff

    goto/16 :goto_3

    .line 1912
    :cond_88
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    move-result p4

    goto :goto_36

    .line 1934
    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_8d
    shl-int/lit8 v3, p3, 0x8

    shr-int/lit8 v4, p4, 0xc

    or-int/lit16 v4, v4, 0xe0

    or-int p3, v3, v4

    .line 1935
    add-int/lit8 p5, p5, 0x1

    .line 1937
    if-lt p5, v6, :cond_c7

    .line 1938
    array-length v3, p1

    if-lt v2, v3, :cond_a3

    .line 1939
    array-length v3, p1

    invoke-static {p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1941
    :cond_a3
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    aput p3, p1, v2

    .line 1942
    const/4 p3, 0x0

    .line 1943
    const/4 p5, 0x0

    .line 1945
    :goto_a9
    shl-int/lit8 v3, p3, 0x8

    shr-int/lit8 v4, p4, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/lit16 v4, v4, 0x80

    or-int p3, v3, v4

    .line 1946
    add-int/lit8 p5, p5, 0x1

    goto :goto_5b

    .line 1957
    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_b6
    array-length v3, p1

    if-lt v2, v3, :cond_c0

    .line 1958
    array-length v3, p1

    invoke-static {p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1960
    :cond_c0
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    aput p3, p1, v2

    .line 1961
    move p3, p4

    .line 1962
    const/4 p5, 0x1

    goto :goto_69

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_c7
    move p2, v2

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    goto :goto_a9

    :cond_c9
    move v2, p2

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    goto :goto_4c

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :cond_cb
    move v2, p2

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    goto :goto_60
.end method

.method protected final parseLongName(III)Ljava/lang/String;
    .registers 18
    .param p1, "q"    # I
    .param p2, "q2"    # I
    .param p3, "q3"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1791
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x0

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    aput v3, v0, v1

    .line 1792
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 1793
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x2

    aput p3, v0, v1

    .line 1796
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 1797
    .local v12, "input":[B
    sget-object v11, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .line 1798
    .local v11, "codes":[I
    const/4 v2, 0x3

    .line 1800
    .local v2, "qlen":I
    :goto_16
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-gt v0, v1, :cond_d2

    .line 1801
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v12, v0

    and-int/lit16 v4, v0, 0xff

    .line 1802
    .local v4, "i":I
    aget v0, v11, v4

    if-eqz v0, :cond_42

    .line 1803
    const/16 v0, 0x22

    if-ne v4, v0, :cond_38

    .line 1804
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x1

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName([IIII)Ljava/lang/String;

    move-result-object v0

    .line 1848
    .end local v4    # "i":I
    :goto_37
    return-object v0

    .line 1806
    .restart local v4    # "i":I
    :cond_38
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v5, 0x1

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_37

    .line 1809
    :cond_42
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1810
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v12, v0

    and-int/lit16 v4, v0, 0xff

    .line 1811
    aget v0, v11, v4

    if-eqz v0, :cond_6a

    .line 1812
    const/16 v0, 0x22

    if-ne v4, v0, :cond_60

    .line 1813
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x2

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName([IIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_37

    .line 1815
    :cond_60
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v5, 0x2

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_37

    .line 1818
    :cond_6a
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1819
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v12, v0

    and-int/lit16 v4, v0, 0xff

    .line 1820
    aget v0, v11, v4

    if-eqz v0, :cond_92

    .line 1821
    const/16 v0, 0x22

    if-ne v4, v0, :cond_88

    .line 1822
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x3

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName([IIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_37

    .line 1824
    :cond_88
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v5, 0x3

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_37

    .line 1827
    :cond_92
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1828
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v12, v0

    and-int/lit16 v4, v0, 0xff

    .line 1829
    aget v0, v11, v4

    if-eqz v0, :cond_bb

    .line 1830
    const/16 v0, 0x22

    if-ne v4, v0, :cond_b0

    .line 1831
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x4

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName([IIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_37

    .line 1833
    :cond_b0
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v5, 0x4

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_37

    .line 1837
    :cond_bb
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    array-length v0, v0

    if-lt v2, v0, :cond_c8

    .line 1838
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    invoke-static {v0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1840
    :cond_c8
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    add-int/lit8 v13, v2, 0x1

    .end local v2    # "qlen":I
    .local v13, "qlen":I
    aput p1, v0, v2

    .line 1841
    move p1, v4

    move v2, v13

    .line 1842
    .end local v13    # "qlen":I
    .restart local v2    # "qlen":I
    goto/16 :goto_16

    .line 1848
    .end local v4    # "i":I
    :cond_d2
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v8, 0x0

    const/4 v10, 0x0

    move-object v5, p0

    move v7, v2

    move v9, p1

    invoke-virtual/range {v5 .. v10}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_37
.end method

.method protected final parseMediumName(I)Ljava/lang/String;
    .registers 12
    .param p1, "q2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/16 v5, 0x22

    .line 1708
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 1709
    .local v2, "input":[B
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .line 1712
    .local v0, "codes":[I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v2, v3

    and-int/lit16 v1, v3, 0xff

    .line 1713
    .local v1, "i":I
    aget v3, v0, v1

    if-eqz v3, :cond_28

    .line 1714
    if-ne v1, v5, :cond_21

    .line 1715
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(III)Ljava/lang/String;

    move-result-object v3

    .line 1743
    :goto_20
    return-object v3

    .line 1717
    :cond_21
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIII)Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    .line 1719
    :cond_28
    shl-int/lit8 v3, p1, 0x8

    or-int p1, v3, v1

    .line 1720
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v2, v3

    and-int/lit16 v1, v3, 0xff

    .line 1721
    aget v3, v0, v1

    if-eqz v3, :cond_4a

    .line 1722
    if-ne v1, v5, :cond_43

    .line 1723
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(III)Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    .line 1725
    :cond_43
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIII)Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    .line 1727
    :cond_4a
    shl-int/lit8 v3, p1, 0x8

    or-int p1, v3, v1

    .line 1728
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v2, v3

    and-int/lit16 v1, v3, 0xff

    .line 1729
    aget v3, v0, v1

    if-eqz v3, :cond_6c

    .line 1730
    if-ne v1, v5, :cond_65

    .line 1731
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(III)Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    .line 1733
    :cond_65
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIII)Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    .line 1735
    :cond_6c
    shl-int/lit8 v3, p1, 0x8

    or-int p1, v3, v1

    .line 1736
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v2, v3

    and-int/lit16 v1, v3, 0xff

    .line 1737
    aget v3, v0, v1

    if-eqz v3, :cond_8e

    .line 1738
    if-ne v1, v5, :cond_87

    .line 1739
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(III)Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    .line 1741
    :cond_87
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIII)Ljava/lang/String;

    move-result-object v3

    goto :goto_20

    .line 1743
    :cond_8e
    invoke-virtual {p0, v1, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseMediumName2(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_20
.end method

.method protected final parseMediumName2(II)Ljava/lang/String;
    .registers 14
    .param p1, "q3"    # I
    .param p2, "q2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v5, 0x1

    const/16 v2, 0x22

    .line 1751
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 1752
    .local v7, "input":[B
    sget-object v6, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .line 1755
    .local v6, "codes":[I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v7, v0

    and-int/lit16 v4, v0, 0xff

    .line 1756
    .local v4, "i":I
    aget v0, v6, v4

    if-eqz v0, :cond_2b

    .line 1757
    if-ne v4, v2, :cond_21

    .line 1758
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v0, p2, p1, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(IIII)Ljava/lang/String;

    move-result-object v0

    .line 1786
    :goto_20
    return-object v0

    .line 1760
    :cond_21
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    move-object v0, p0

    move v2, p2

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 1762
    :cond_2b
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1763
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v7, v0

    and-int/lit16 v4, v0, 0xff

    .line 1764
    aget v0, v6, v4

    if-eqz v0, :cond_51

    .line 1765
    if-ne v4, v2, :cond_46

    .line 1766
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v0, p2, p1, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(IIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 1768
    :cond_46
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    move-object v0, p0

    move v2, p2

    move v3, p1

    move v5, v8

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 1770
    :cond_51
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1771
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v7, v0

    and-int/lit16 v4, v0, 0xff

    .line 1772
    aget v0, v6, v4

    if-eqz v0, :cond_77

    .line 1773
    if-ne v4, v2, :cond_6c

    .line 1774
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v0, p2, p1, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(IIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 1776
    :cond_6c
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    move-object v0, p0

    move v2, p2

    move v3, p1

    move v5, v9

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 1778
    :cond_77
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1779
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v7, v0

    and-int/lit16 v4, v0, 0xff

    .line 1780
    aget v0, v6, v4

    if-eqz v0, :cond_9d

    .line 1781
    if-ne v4, v2, :cond_92

    .line 1782
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v0, p2, p1, v10}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(IIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 1784
    :cond_92
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    move-object v0, p0

    move v2, p2

    move v3, p1

    move v5, v10

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_20

    .line 1786
    :cond_9d
    invoke-virtual {p0, v4, p2, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseLongName(III)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_20
.end method

.method public readBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;)I
    .registers 7
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 507
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_13

    .line 508
    :cond_a
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;)[B

    move-result-object v0

    .line 509
    .local v0, "b":[B
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write([B)V

    .line 510
    array-length v2, v0

    .line 517
    .end local v0    # "b":[B
    :goto_12
    return v2

    .line 513
    :cond_13
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/io/IOContext;->allocBase64Buffer()[B

    move-result-object v1

    .line 515
    .local v1, "buf":[B
    :try_start_19
    invoke-virtual {p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_readBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;[B)I
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_23

    move-result v2

    .line 517
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v3, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    goto :goto_12

    :catchall_23
    move-exception v2

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v3, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    throw v2
.end method

.method public releaseBuffered(Ljava/io/OutputStream;)I
    .registers 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    sub-int v0, v2, v3

    .line 148
    .local v0, "count":I
    const/4 v2, 0x1

    if-ge v0, v2, :cond_b

    .line 149
    const/4 v0, 0x0

    .line 154
    .end local v0    # "count":I
    :goto_a
    return v0

    .line 152
    .restart local v0    # "count":I
    :cond_b
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 153
    .local v1, "origPtr":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    invoke-virtual {p1, v2, v1, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_a
.end method

.method public setCodec(Lcom/fasterxml/jackson/core/ObjectCodec;)V
    .registers 2
    .param p1, "c"    # Lcom/fasterxml/jackson/core/ObjectCodec;

    .prologue
    .line 135
    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    .line 136
    return-void
.end method

.method protected slowParseName()Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1858
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_12

    .line 1859
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_12

    .line 1860
    const-string v0, ": was expecting closing \'\"\' for name"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1863
    :cond_12
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v4, v0, 0xff

    .line 1864
    .local v4, "i":I
    const/16 v0, 0x22

    if-ne v4, v0, :cond_25

    .line 1865
    const-string v0, ""

    .line 1867
    :goto_24
    return-object v0

    :cond_25
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    move-object v0, p0

    move v3, v2

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Ljava/lang/String;

    move-result-object v0

    goto :goto_24
.end method
