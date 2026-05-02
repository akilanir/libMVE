.class public final Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;
.super Ljava/lang/Object;
.source "ByteSourceJsonBootstrapper.java"


# static fields
.field static final UTF8_BOM_1:B = -0x11t

.field static final UTF8_BOM_2:B = -0x45t

.field static final UTF8_BOM_3:B = -0x41t


# instance fields
.field protected _bigEndian:Z

.field private final _bufferRecyclable:Z

.field protected _bytesPerChar:I

.field protected final _context:Lcom/fasterxml/jackson/core/io/IOContext;

.field protected final _in:Ljava/io/InputStream;

.field protected final _inputBuffer:[B

.field private _inputEnd:I

.field protected _inputProcessed:I

.field private _inputPtr:I


# direct methods
.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;Ljava/io/InputStream;)V
    .registers 6

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    .line 76
    iput v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    .line 86
    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    .line 87
    iput-object p2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_in:Ljava/io/InputStream;

    .line 88
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocReadIOBuffer()[B

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    .line 89
    iput v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    .line 90
    iput v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputProcessed:I

    .line 91
    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bufferRecyclable:Z

    .line 92
    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;[BII)V
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    .line 76
    iput v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    .line 96
    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    .line 97
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_in:Ljava/io/InputStream;

    .line 98
    iput-object p2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    .line 99
    iput p3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    .line 100
    add-int v0, p3, p4

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    .line 102
    neg-int v0, p3

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputProcessed:I

    .line 103
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bufferRecyclable:Z

    .line 104
    return-void
.end method

.method private checkUTF16(I)Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 459
    const v2, 0xff00

    and-int/2addr v2, p1

    if-nez v2, :cond_f

    .line 460
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    .line 468
    :goto_a
    const/4 v0, 0x2

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    move v0, v1

    .line 469
    :cond_e
    return v0

    .line 461
    :cond_f
    and-int/lit16 v2, p1, 0xff

    if-nez v2, :cond_e

    .line 462
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    goto :goto_a
.end method

.method private checkUTF32(I)Z
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 439
    shr-int/lit8 v2, p1, 0x8

    if-nez v2, :cond_d

    .line 440
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    .line 453
    :goto_8
    const/4 v0, 0x4

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    move v0, v1

    .line 454
    :cond_c
    return v0

    .line 441
    :cond_d
    const v2, 0xffffff

    and-int/2addr v2, p1

    if-nez v2, :cond_16

    .line 442
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    goto :goto_8

    .line 443
    :cond_16
    const v2, -0xff0001

    and-int/2addr v2, p1

    if-nez v2, :cond_22

    .line 444
    const-string v0, "3412"

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->reportWeirdUCS4(Ljava/lang/String;)V

    goto :goto_8

    .line 445
    :cond_22
    const v2, -0xff01

    and-int/2addr v2, p1

    if-nez v2, :cond_c

    .line 446
    const-string v0, "2143"

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->reportWeirdUCS4(Ljava/lang/String;)V

    goto :goto_8
.end method

.method private handleBOM(I)Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x4

    const/4 v4, 0x2

    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 393
    sparse-switch p1, :sswitch_data_5e

    .line 410
    :goto_7
    ushr-int/lit8 v2, p1, 0x10

    .line 411
    const v3, 0xfeff

    if-ne v2, v3, :cond_3a

    .line 412
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    add-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    .line 413
    iput v4, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    .line 414
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    .line 430
    :goto_18
    return v0

    .line 395
    :sswitch_19
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    .line 396
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    .line 397
    iput v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    goto :goto_18

    .line 400
    :sswitch_24
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    add-int/lit8 v2, v2, 0x4

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    .line 401
    iput v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    .line 402
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    goto :goto_18

    .line 405
    :sswitch_2f
    const-string v2, "2143"

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->reportWeirdUCS4(Ljava/lang/String;)V

    .line 407
    :sswitch_34
    const-string v2, "3412"

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->reportWeirdUCS4(Ljava/lang/String;)V

    goto :goto_7

    .line 417
    :cond_3a
    const v3, 0xfffe

    if-ne v2, v3, :cond_4a

    .line 418
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    add-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    .line 419
    iput v4, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    .line 420
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    goto :goto_18

    .line 424
    :cond_4a
    ushr-int/lit8 v2, p1, 0x8

    const v3, 0xefbbbf

    if-ne v2, v3, :cond_5c

    .line 425
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    add-int/lit8 v1, v1, 0x3

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    .line 426
    iput v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    .line 427
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    goto :goto_18

    :cond_5c
    move v0, v1

    .line 430
    goto :goto_18

    .line 393
    :sswitch_data_5e
    .sparse-switch
        -0x1010000 -> :sswitch_34
        -0x20000 -> :sswitch_24
        0xfeff -> :sswitch_19
        0xfffe -> :sswitch_2f
    .end sparse-switch
.end method

.method public static hasJSONFormat(Lcom/fasterxml/jackson/core/format/InputAccessor;)Lcom/fasterxml/jackson/core/format/MatchStrength;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x5b

    const/16 v4, 0x39

    const/16 v3, 0x30

    const/16 v2, 0x22

    .line 256
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->hasMoreBytes()Z

    move-result v0

    if-nez v0, :cond_11

    .line 257
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->INCONCLUSIVE:Lcom/fasterxml/jackson/core/format/MatchStrength;

    .line 337
    :cond_10
    :goto_10
    return-object v0

    .line 259
    :cond_11
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->nextByte()B

    move-result v0

    .line 261
    const/16 v1, -0x11

    if-ne v0, v1, :cond_4e

    .line 262
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->hasMoreBytes()Z

    move-result v0

    if-nez v0, :cond_22

    .line 263
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->INCONCLUSIVE:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 265
    :cond_22
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->nextByte()B

    move-result v0

    const/16 v1, -0x45

    if-eq v0, v1, :cond_2d

    .line 266
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->NO_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 268
    :cond_2d
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->hasMoreBytes()Z

    move-result v0

    if-nez v0, :cond_36

    .line 269
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->INCONCLUSIVE:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 271
    :cond_36
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->nextByte()B

    move-result v0

    const/16 v1, -0x41

    if-eq v0, v1, :cond_41

    .line 272
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->NO_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 274
    :cond_41
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->hasMoreBytes()Z

    move-result v0

    if-nez v0, :cond_4a

    .line 275
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->INCONCLUSIVE:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 277
    :cond_4a
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->nextByte()B

    move-result v0

    .line 280
    :cond_4e
    invoke-static {p0, v0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->skipSpace(Lcom/fasterxml/jackson/core/format/InputAccessor;B)I

    move-result v1

    .line 281
    if-gez v1, :cond_57

    .line 282
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->INCONCLUSIVE:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 285
    :cond_57
    const/16 v0, 0x7b

    if-ne v1, v0, :cond_70

    .line 287
    invoke-static {p0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->skipSpace(Lcom/fasterxml/jackson/core/format/InputAccessor;)I

    move-result v0

    .line 288
    if-gez v0, :cond_64

    .line 289
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->INCONCLUSIVE:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 291
    :cond_64
    if-eq v0, v2, :cond_6a

    const/16 v1, 0x7d

    if-ne v0, v1, :cond_6d

    .line 292
    :cond_6a
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->SOLID_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 295
    :cond_6d
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->NO_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 299
    :cond_70
    if-ne v1, v5, :cond_87

    .line 300
    invoke-static {p0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->skipSpace(Lcom/fasterxml/jackson/core/format/InputAccessor;)I

    move-result v0

    .line 301
    if-gez v0, :cond_7b

    .line 302
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->INCONCLUSIVE:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 305
    :cond_7b
    const/16 v1, 0x5d

    if-eq v0, v1, :cond_81

    if-ne v0, v5, :cond_84

    .line 306
    :cond_81
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->SOLID_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 308
    :cond_84
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->SOLID_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_10

    .line 311
    :cond_87
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->WEAK_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    .line 314
    if-eq v1, v2, :cond_10

    .line 317
    if-gt v1, v4, :cond_8f

    if-ge v1, v3, :cond_10

    .line 320
    :cond_8f
    const/16 v2, 0x2d

    if-ne v1, v2, :cond_a5

    .line 321
    invoke-static {p0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->skipSpace(Lcom/fasterxml/jackson/core/format/InputAccessor;)I

    move-result v1

    .line 322
    if-gez v1, :cond_9d

    .line 323
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->INCONCLUSIVE:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto/16 :goto_10

    .line 325
    :cond_9d
    if-gt v1, v4, :cond_a1

    if-ge v1, v3, :cond_10

    :cond_a1
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->NO_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto/16 :goto_10

    .line 328
    :cond_a5
    const/16 v2, 0x6e

    if-ne v1, v2, :cond_b1

    .line 329
    const-string v1, "ull"

    invoke-static {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->tryMatch(Lcom/fasterxml/jackson/core/format/InputAccessor;Ljava/lang/String;Lcom/fasterxml/jackson/core/format/MatchStrength;)Lcom/fasterxml/jackson/core/format/MatchStrength;

    move-result-object v0

    goto/16 :goto_10

    .line 331
    :cond_b1
    const/16 v2, 0x74

    if-ne v1, v2, :cond_bd

    .line 332
    const-string v1, "rue"

    invoke-static {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->tryMatch(Lcom/fasterxml/jackson/core/format/InputAccessor;Ljava/lang/String;Lcom/fasterxml/jackson/core/format/MatchStrength;)Lcom/fasterxml/jackson/core/format/MatchStrength;

    move-result-object v0

    goto/16 :goto_10

    .line 334
    :cond_bd
    const/16 v2, 0x66

    if-ne v1, v2, :cond_c9

    .line 335
    const-string v1, "alse"

    invoke-static {p0, v1, v0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->tryMatch(Lcom/fasterxml/jackson/core/format/InputAccessor;Ljava/lang/String;Lcom/fasterxml/jackson/core/format/MatchStrength;)Lcom/fasterxml/jackson/core/format/MatchStrength;

    move-result-object v0

    goto/16 :goto_10

    .line 337
    :cond_c9
    sget-object v0, Lcom/fasterxml/jackson/core/format/MatchStrength;->NO_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto/16 :goto_10
.end method

.method private reportWeirdUCS4(Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 481
    new-instance v0, Ljava/io/CharConversionException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported UCS-4 endianness ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") detected"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/CharConversionException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static skipSpace(Lcom/fasterxml/jackson/core/format/InputAccessor;)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 356
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->hasMoreBytes()Z

    move-result v0

    if-nez v0, :cond_8

    .line 357
    const/4 v0, -0x1

    .line 359
    :goto_7
    return v0

    :cond_8
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->nextByte()B

    move-result v0

    invoke-static {p0, v0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->skipSpace(Lcom/fasterxml/jackson/core/format/InputAccessor;B)I

    move-result v0

    goto :goto_7
.end method

.method private static skipSpace(Lcom/fasterxml/jackson/core/format/InputAccessor;B)I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    :goto_0
    and-int/lit16 v0, p1, 0xff

    .line 366
    const/16 v1, 0x20

    if-eq v0, v1, :cond_13

    const/16 v1, 0xd

    if-eq v0, v1, :cond_13

    const/16 v1, 0xa

    if-eq v0, v1, :cond_13

    const/16 v1, 0x9

    if-eq v0, v1, :cond_13

    .line 370
    :goto_12
    return v0

    .line 369
    :cond_13
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->hasMoreBytes()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 370
    const/4 v0, -0x1

    goto :goto_12

    .line 372
    :cond_1b
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->nextByte()B

    move-result p1

    .line 373
    and-int/lit16 v0, p1, 0xff

    .line 374
    goto :goto_0
.end method

.method private static tryMatch(Lcom/fasterxml/jackson/core/format/InputAccessor;Ljava/lang/String;Lcom/fasterxml/jackson/core/format/MatchStrength;)Lcom/fasterxml/jackson/core/format/MatchStrength;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    :goto_5
    if-ge v0, v1, :cond_f

    .line 344
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->hasMoreBytes()Z

    move-result v2

    if-nez v2, :cond_10

    .line 345
    sget-object p2, Lcom/fasterxml/jackson/core/format/MatchStrength;->INCONCLUSIVE:Lcom/fasterxml/jackson/core/format/MatchStrength;

    .line 351
    :cond_f
    :goto_f
    return-object p2

    .line 347
    :cond_10
    invoke-interface {p0}, Lcom/fasterxml/jackson/core/format/InputAccessor;->nextByte()B

    move-result v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_1d

    .line 348
    sget-object p2, Lcom/fasterxml/jackson/core/format/MatchStrength;->NO_MATCH:Lcom/fasterxml/jackson/core/format/MatchStrength;

    goto :goto_f

    .line 343
    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_5
.end method


# virtual methods
.method public constructParser(ILcom/fasterxml/jackson/core/ObjectCodec;Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;ZZ)Lcom/fasterxml/jackson/core/JsonParser;
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 224
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->detectEncoding()Lcom/fasterxml/jackson/core/JsonEncoding;

    move-result-object v2

    .line 226
    sget-object v3, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    if-ne v2, v3, :cond_26

    .line 230
    if-eqz p5, :cond_26

    .line 231
    move/from16 v0, p5

    move/from16 v1, p6

    invoke-virtual {p3, v0, v1}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->makeChild(ZZ)Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

    move-result-object v7

    .line 232
    new-instance v2, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_in:Ljava/io/InputStream;

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    iget v10, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    iget-boolean v11, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bufferRecyclable:Z

    move v4, p1

    move-object v6, p2

    invoke-direct/range {v2 .. v11}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;ILjava/io/InputStream;Lcom/fasterxml/jackson/core/ObjectCodec;Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;[BIIZ)V

    .line 235
    :goto_25
    return-object v2

    :cond_26
    new-instance v2, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->constructReader()Ljava/io/Reader;

    move-result-object v5

    invoke-virtual/range {p4 .. p6}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->makeChild(ZZ)Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    move-result-object v7

    move v4, p1

    move-object v6, p2

    invoke-direct/range {v2 .. v7}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;ILjava/io/Reader;Lcom/fasterxml/jackson/core/ObjectCodec;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;)V

    goto :goto_25
.end method

.method public constructReader()Ljava/io/Reader;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->getEncoding()Lcom/fasterxml/jackson/core/JsonEncoding;

    move-result-object v6

    .line 193
    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonEncoding;->bits()I

    move-result v0

    sparse-switch v0, :sswitch_data_60

    .line 216
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Internal error"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :sswitch_15
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_in:Ljava/io/InputStream;

    .line 200
    if-nez v2, :cond_2f

    .line 201
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    invoke-direct {v0, v1, v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    .line 210
    :goto_24
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonEncoding;->getJavaName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    move-object v0, v1

    .line 213
    :goto_2e
    return-object v0

    .line 206
    :cond_2f
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    if-ge v0, v1, :cond_5d

    .line 207
    new-instance v0, Lcom/fasterxml/jackson/core/io/MergedStream;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/io/MergedStream;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;Ljava/io/InputStream;[BII)V

    goto :goto_24

    .line 213
    :sswitch_43
    new-instance v0, Lcom/fasterxml/jackson/core/io/UTF32Reader;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_in:Ljava/io/InputStream;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/io/IOContext;->getEncoding()Lcom/fasterxml/jackson/core/JsonEncoding;

    move-result-object v6

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonEncoding;->isBigEndian()Z

    move-result v6

    invoke-direct/range {v0 .. v6}, Lcom/fasterxml/jackson/core/io/UTF32Reader;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;Ljava/io/InputStream;[BIIZ)V

    goto :goto_2e

    :cond_5d
    move-object v0, v2

    goto :goto_24

    .line 193
    nop

    :sswitch_data_60
    .sparse-switch
        0x8 -> :sswitch_15
        0x10 -> :sswitch_15
        0x20 -> :sswitch_43
    .end sparse-switch
.end method

.method public detectEncoding()Lcom/fasterxml/jackson/core/JsonEncoding;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 120
    const/4 v1, 0x0

    .line 129
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->ensureLoaded(I)Z

    move-result v2

    if-eqz v2, :cond_56

    .line 130
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    aget-byte v2, v2, v3

    shl-int/lit8 v2, v2, 0x18

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    add-int/lit8 v4, v4, 0x1

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v2, v3

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    add-int/lit8 v4, v4, 0x2

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    add-int/lit8 v4, v4, 0x3

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    .line 135
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->handleBOM(I)Z

    move-result v3

    if-eqz v3, :cond_46

    .line 161
    :cond_3c
    :goto_3c
    if-nez v0, :cond_79

    .line 162
    sget-object v0, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    .line 178
    :goto_40
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_context:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->setEncoding(Lcom/fasterxml/jackson/core/JsonEncoding;)V

    .line 179
    return-object v0

    .line 144
    :cond_46
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->checkUTF32(I)Z

    move-result v3

    if-nez v3, :cond_3c

    .line 146
    ushr-int/lit8 v2, v2, 0x10

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->checkUTF16(I)Z

    move-result v2

    if-nez v2, :cond_3c

    :cond_54
    move v0, v1

    goto :goto_3c

    .line 150
    :cond_56
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->ensureLoaded(I)Z

    move-result v2

    if-eqz v2, :cond_54

    .line 151
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    add-int/lit8 v4, v4, 0x1

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    .line 153
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->checkUTF16(I)Z

    move-result v2

    if-eqz v2, :cond_54

    goto :goto_3c

    .line 164
    :cond_79
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bytesPerChar:I

    packed-switch v0, :pswitch_data_9e

    .line 175
    :pswitch_7e
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Internal error"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :pswitch_86
    sget-object v0, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF8:Lcom/fasterxml/jackson/core/JsonEncoding;

    goto :goto_40

    .line 169
    :pswitch_89
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    if-eqz v0, :cond_90

    sget-object v0, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF16_BE:Lcom/fasterxml/jackson/core/JsonEncoding;

    goto :goto_40

    :cond_90
    sget-object v0, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF16_LE:Lcom/fasterxml/jackson/core/JsonEncoding;

    goto :goto_40

    .line 172
    :pswitch_93
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_bigEndian:Z

    if-eqz v0, :cond_9a

    sget-object v0, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF32_BE:Lcom/fasterxml/jackson/core/JsonEncoding;

    goto :goto_40

    :cond_9a
    sget-object v0, Lcom/fasterxml/jackson/core/JsonEncoding;->UTF32_LE:Lcom/fasterxml/jackson/core/JsonEncoding;

    goto :goto_40

    .line 164
    nop

    :pswitch_data_9e
    .packed-switch 0x1
        :pswitch_86
        :pswitch_89
        :pswitch_7e
        :pswitch_93
    .end packed-switch
.end method

.method protected ensureLoaded(I)Z
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 496
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputPtr:I

    sub-int/2addr v1, v2

    move v2, v1

    .line 497
    :goto_7
    if-ge v2, p1, :cond_11

    .line 500
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_in:Ljava/io/InputStream;

    if-nez v1, :cond_12

    .line 501
    const/4 v1, -0x1

    .line 505
    :goto_e
    if-ge v1, v0, :cond_23

    .line 506
    const/4 v0, 0x0

    .line 511
    :cond_11
    return v0

    .line 503
    :cond_12
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_in:Ljava/io/InputStream;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputBuffer:[B

    array-length v5, v5

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    sub-int/2addr v5, v6

    invoke-virtual {v1, v3, v4, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    goto :goto_e

    .line 508
    :cond_23
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ByteSourceJsonBootstrapper;->_inputEnd:I

    .line 509
    add-int/2addr v1, v2

    move v2, v1

    .line 510
    goto :goto_7
.end method
