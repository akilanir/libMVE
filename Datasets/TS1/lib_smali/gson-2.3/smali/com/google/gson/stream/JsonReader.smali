.class public Lcom/google/gson/stream/JsonReader;
.super Ljava/lang/Object;
.source "JsonReader.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static final MIN_INCOMPLETE_INTEGER:J = -0xcccccccccccccccL

.field private static final NON_EXECUTE_PREFIX:[C

.field private static final NUMBER_CHAR_DECIMAL:I = 0x3

.field private static final NUMBER_CHAR_DIGIT:I = 0x2

.field private static final NUMBER_CHAR_EXP_DIGIT:I = 0x7

.field private static final NUMBER_CHAR_EXP_E:I = 0x5

.field private static final NUMBER_CHAR_EXP_SIGN:I = 0x6

.field private static final NUMBER_CHAR_FRACTION_DIGIT:I = 0x4

.field private static final NUMBER_CHAR_NONE:I = 0x0

.field private static final NUMBER_CHAR_SIGN:I = 0x1

.field private static final PEEKED_BEGIN_ARRAY:I = 0x3

.field private static final PEEKED_BEGIN_OBJECT:I = 0x1

.field private static final PEEKED_BUFFERED:I = 0xb

.field private static final PEEKED_DOUBLE_QUOTED:I = 0x9

.field private static final PEEKED_DOUBLE_QUOTED_NAME:I = 0xd

.field private static final PEEKED_END_ARRAY:I = 0x4

.field private static final PEEKED_END_OBJECT:I = 0x2

.field private static final PEEKED_EOF:I = 0x11

.field private static final PEEKED_FALSE:I = 0x6

.field private static final PEEKED_LONG:I = 0xf

.field private static final PEEKED_NONE:I = 0x0

.field private static final PEEKED_NULL:I = 0x7

.field private static final PEEKED_NUMBER:I = 0x10

.field private static final PEEKED_SINGLE_QUOTED:I = 0x8

.field private static final PEEKED_SINGLE_QUOTED_NAME:I = 0xc

.field private static final PEEKED_TRUE:I = 0x5

.field private static final PEEKED_UNQUOTED:I = 0xa

.field private static final PEEKED_UNQUOTED_NAME:I = 0xe


# instance fields
.field private final buffer:[C

.field private final in:Ljava/io/Reader;

.field private lenient:Z

.field private limit:I

.field private lineNumber:I

.field private lineStart:I

.field private pathIndices:[I

.field private pathNames:[Ljava/lang/String;

.field private peeked:I

.field private peekedLong:J

.field private peekedNumberLength:I

.field private peekedString:Ljava/lang/String;

.field private pos:I

.field private stack:[I

.field private stackSize:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 192
    const-string v0, ")]}\'\n"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    .line 1598
    new-instance v0, Lcom/google/gson/stream/JsonReader$1;

    invoke-direct {v0}, Lcom/google/gson/stream/JsonReader$1;-><init>()V

    sput-object v0, Lcom/google/gson/internal/JsonReaderInternalAccess;->INSTANCE:Lcom/google/gson/internal/JsonReaderInternalAccess;

    .line 1621
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 6
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    const/16 v3, 0x20

    const/4 v1, 0x0

    .line 289
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
    iput-boolean v1, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    .line 238
    const/16 v0, 0x400

    new-array v0, v0, [C

    iput-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    .line 239
    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 240
    iput v1, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 242
    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    .line 243
    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    .line 245
    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 269
    new-array v0, v3, [I

    iput-object v0, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    .line 270
    iput v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    .line 272
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    const/4 v2, 0x6

    aput v2, v0, v1

    .line 283
    new-array v0, v3, [Ljava/lang/String;

    iput-object v0, p0, Lcom/google/gson/stream/JsonReader;->pathNames:[Ljava/lang/String;

    .line 284
    new-array v0, v3, [I

    iput-object v0, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    .line 290
    if-nez p1, :cond_3b

    .line 291
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "in == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 293
    :cond_3b
    iput-object p1, p0, Lcom/google/gson/stream/JsonReader;->in:Ljava/io/Reader;

    .line 294
    return-void
.end method

.method static synthetic access$000(Lcom/google/gson/stream/JsonReader;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/gson/stream/JsonReader;

    .prologue
    .line 190
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return v0
.end method

.method static synthetic access$002(Lcom/google/gson/stream/JsonReader;I)I
    .registers 2
    .param p0, "x0"    # Lcom/google/gson/stream/JsonReader;
    .param p1, "x1"    # I

    .prologue
    .line 190
    iput p1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    return p1
.end method

.method static synthetic access$100(Lcom/google/gson/stream/JsonReader;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/gson/stream/JsonReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/google/gson/stream/JsonReader;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/gson/stream/JsonReader;

    .prologue
    .line 190
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/google/gson/stream/JsonReader;)I
    .registers 2
    .param p0, "x0"    # Lcom/google/gson/stream/JsonReader;

    .prologue
    .line 190
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v0

    return v0
.end method

.method private checkLenient()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1420
    iget-boolean v0, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    if-nez v0, :cond_b

    .line 1421
    const-string v0, "Use JsonReader.setLenient(true) to accept malformed JSON"

    invoke-direct {p0, v0}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    .line 1423
    :cond_b
    return-void
.end method

.method private consumeNonExecutePrefix()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1580
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    .line 1581
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1583
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sget-object v2, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    array-length v2, v2

    add-int/2addr v1, v2

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-le v1, v2, :cond_1e

    sget-object v1, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    array-length v1, v1

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v1

    if-nez v1, :cond_1e

    .line 1595
    :cond_1d
    :goto_1d
    return-void

    .line 1587
    :cond_1e
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1f
    sget-object v1, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    array-length v1, v1

    if-ge v0, v1, :cond_34

    .line 1588
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v2, v0

    aget-char v1, v1, v2

    sget-object v2, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    aget-char v2, v2, v0

    if-ne v1, v2, :cond_1d

    .line 1587
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 1594
    :cond_34
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sget-object v2, Lcom/google/gson/stream/JsonReader;->NON_EXECUTE_PREFIX:[C

    array-length v2, v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_1d
.end method

.method private doPeek()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x7

    const/4 v8, 0x5

    const/4 v2, 0x4

    const/4 v3, 0x2

    const/4 v4, 0x1

    .line 464
    iget-object v6, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v7, v7, -0x1

    aget v1, v6, v7

    .line 465
    .local v1, "peekStack":I
    if-ne v1, v4, :cond_32

    .line 466
    iget-object v6, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v7, v7, -0x1

    aput v3, v6, v7

    .line 551
    :cond_17
    :goto_17
    :pswitch_17
    :sswitch_17
    invoke-direct {p0, v4}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v0

    .line 552
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_180

    .line 581
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 584
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    if-ne v3, v4, :cond_2b

    .line 585
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 588
    :cond_2b
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->peekKeyword()I

    move-result v2

    .line 589
    .local v2, "result":I
    if-eqz v2, :cond_15d

    .line 603
    .end local v2    # "result":I
    :cond_31
    :goto_31
    return v2

    .line 467
    .end local v0    # "c":I
    :cond_32
    if-ne v1, v3, :cond_49

    .line 469
    invoke-direct {p0, v4}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v0

    .line 470
    .restart local v0    # "c":I
    sparse-switch v0, :sswitch_data_19e

    .line 478
    const-string v3, "Unterminated array"

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 472
    :sswitch_42
    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto :goto_31

    .line 474
    :sswitch_45
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    goto :goto_17

    .line 480
    .end local v0    # "c":I
    :cond_49
    const/4 v6, 0x3

    if-eq v1, v6, :cond_4e

    if-ne v1, v8, :cond_aa

    .line 481
    :cond_4e
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v6, v6, -0x1

    aput v2, v5, v6

    .line 483
    if-ne v1, v8, :cond_6d

    .line 484
    invoke-direct {p0, v4}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v0

    .line 485
    .restart local v0    # "c":I
    sparse-switch v0, :sswitch_data_1ac

    .line 493
    const-string v3, "Unterminated object"

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 487
    :sswitch_66
    iput v3, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    move v2, v3

    goto :goto_31

    .line 489
    :sswitch_6a
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 496
    .end local v0    # "c":I
    :cond_6d
    :sswitch_6d
    invoke-direct {p0, v4}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v0

    .line 497
    .restart local v0    # "c":I
    sparse-switch v0, :sswitch_data_1ba

    .line 510
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 511
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 512
    int-to-char v3, v0

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->isLiteral(C)Z

    move-result v3

    if-eqz v3, :cond_a3

    .line 513
    const/16 v2, 0xe

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto :goto_31

    .line 499
    :sswitch_89
    const/16 v2, 0xd

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto :goto_31

    .line 501
    :sswitch_8e
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 502
    const/16 v2, 0xc

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto :goto_31

    .line 504
    :sswitch_96
    if-eq v1, v8, :cond_9c

    .line 505
    iput v3, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    move v2, v3

    goto :goto_31

    .line 507
    :cond_9c
    const-string v3, "Expected name"

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 515
    :cond_a3
    const-string v3, "Expected name"

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 518
    .end local v0    # "c":I
    :cond_aa
    if-ne v1, v2, :cond_e3

    .line 519
    iget-object v6, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v7, v7, -0x1

    aput v8, v6, v7

    .line 521
    invoke-direct {p0, v4}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v0

    .line 522
    .restart local v0    # "c":I
    packed-switch v0, :pswitch_data_1c8

    .line 532
    :pswitch_bb
    const-string v3, "Expected \':\'"

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 526
    :pswitch_c2
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 527
    iget v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lt v6, v7, :cond_d1

    invoke-direct {p0, v4}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v6

    if-eqz v6, :cond_17

    :cond_d1
    iget-object v6, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v6, v6, v7

    const/16 v7, 0x3e

    if-ne v6, v7, :cond_17

    .line 528
    iget v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto/16 :goto_17

    .line 534
    .end local v0    # "c":I
    :cond_e3
    const/4 v6, 0x6

    if-ne v1, v6, :cond_f7

    .line 535
    iget-boolean v6, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    if-eqz v6, :cond_ed

    .line 536
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->consumeNonExecutePrefix()V

    .line 538
    :cond_ed
    iget-object v6, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v7, v7, -0x1

    aput v5, v6, v7

    goto/16 :goto_17

    .line 539
    :cond_f7
    if-ne v1, v5, :cond_112

    .line 540
    const/4 v6, 0x0

    invoke-direct {p0, v6}, Lcom/google/gson/stream/JsonReader;->nextNonWhitespace(Z)I

    move-result v0

    .line 541
    .restart local v0    # "c":I
    const/4 v6, -0x1

    if-ne v0, v6, :cond_107

    .line 542
    const/16 v2, 0x11

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto/16 :goto_31

    .line 544
    :cond_107
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 545
    iget v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto/16 :goto_17

    .line 547
    .end local v0    # "c":I
    :cond_112
    const/16 v6, 0x8

    if-ne v1, v6, :cond_17

    .line 548
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "JsonReader is closed"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 554
    .restart local v0    # "c":I
    :sswitch_11e
    if-ne v1, v4, :cond_124

    .line 555
    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto/16 :goto_31

    .line 561
    :cond_124
    :sswitch_124
    if-eq v1, v4, :cond_128

    if-ne v1, v3, :cond_136

    .line 562
    :cond_128
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 563
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 564
    iput v5, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    move v2, v5

    goto/16 :goto_31

    .line 566
    :cond_136
    const-string v3, "Unexpected value"

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 569
    :sswitch_13d
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 570
    const/16 v2, 0x8

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto/16 :goto_31

    .line 572
    :sswitch_146
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    if-ne v3, v4, :cond_14d

    .line 573
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 575
    :cond_14d
    const/16 v2, 0x9

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto/16 :goto_31

    .line 577
    :sswitch_153
    const/4 v2, 0x3

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto/16 :goto_31

    .line 579
    :sswitch_158
    iput v4, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    move v2, v4

    goto/16 :goto_31

    .line 593
    .restart local v2    # "result":I
    :cond_15d
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->peekNumber()I

    move-result v2

    .line 594
    if-nez v2, :cond_31

    .line 598
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v3, v3, v4

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->isLiteral(C)Z

    move-result v3

    if-nez v3, :cond_176

    .line 599
    const-string v3, "Expected value"

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v3

    throw v3

    .line 602
    :cond_176
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 603
    const/16 v2, 0xa

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto/16 :goto_31

    .line 552
    nop

    :sswitch_data_180
    .sparse-switch
        0x22 -> :sswitch_146
        0x27 -> :sswitch_13d
        0x2c -> :sswitch_124
        0x3b -> :sswitch_124
        0x5b -> :sswitch_153
        0x5d -> :sswitch_11e
        0x7b -> :sswitch_158
    .end sparse-switch

    .line 470
    :sswitch_data_19e
    .sparse-switch
        0x2c -> :sswitch_17
        0x3b -> :sswitch_45
        0x5d -> :sswitch_42
    .end sparse-switch

    .line 485
    :sswitch_data_1ac
    .sparse-switch
        0x2c -> :sswitch_6d
        0x3b -> :sswitch_6a
        0x7d -> :sswitch_66
    .end sparse-switch

    .line 497
    :sswitch_data_1ba
    .sparse-switch
        0x22 -> :sswitch_89
        0x27 -> :sswitch_8e
        0x7d -> :sswitch_96
    .end sparse-switch

    .line 522
    :pswitch_data_1c8
    .packed-switch 0x3a
        :pswitch_17
        :pswitch_bb
        :pswitch_bb
        :pswitch_c2
    .end packed-switch
.end method

.method private fillBuffer(I)Z
    .registers 9
    .param p1, "minimum"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1287
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    .line 1288
    .local v0, "buffer":[C
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    .line 1289
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    if-eq v3, v4, :cond_5b

    .line 1290
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    sub-int/2addr v3, v4

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 1291
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    invoke-static {v0, v3, v0, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1296
    :goto_1e
    iput v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1298
    :cond_20
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->in:Ljava/io/Reader;

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    array-length v5, v0

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    sub-int/2addr v5, v6

    invoke-virtual {v3, v0, v4, v5}, Ljava/io/Reader;->read([CII)I

    move-result v1

    .local v1, "total":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_5a

    .line 1299
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 1302
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    if-nez v3, :cond_55

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    if-nez v3, :cond_55

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lez v3, :cond_55

    aget-char v3, v0, v2

    const v4, 0xfeff

    if-ne v3, v4, :cond_55

    .line 1303
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1304
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    .line 1305
    add-int/lit8 p1, p1, 0x1

    .line 1308
    :cond_55
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lt v3, p1, :cond_20

    .line 1309
    const/4 v2, 0x1

    .line 1312
    :cond_5a
    return v2

    .line 1293
    .end local v1    # "total":I
    :cond_5b
    iput v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    goto :goto_1e
.end method

.method private getColumnNumber()I
    .registers 3

    .prologue
    .line 1320
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private getLineNumber()I
    .registers 2

    .prologue
    .line 1316
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private isLiteral(C)Z
    .registers 3
    .param p1, "c"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 754
    sparse-switch p1, :sswitch_data_a

    .line 774
    const/4 v0, 0x1

    :goto_4
    return v0

    .line 760
    :sswitch_5
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 772
    :sswitch_8
    const/4 v0, 0x0

    goto :goto_4

    .line 754
    :sswitch_data_a
    .sparse-switch
        0x9 -> :sswitch_8
        0xa -> :sswitch_8
        0xc -> :sswitch_8
        0xd -> :sswitch_8
        0x20 -> :sswitch_8
        0x23 -> :sswitch_5
        0x2c -> :sswitch_8
        0x2f -> :sswitch_5
        0x3a -> :sswitch_8
        0x3b -> :sswitch_5
        0x3d -> :sswitch_5
        0x5b -> :sswitch_8
        0x5c -> :sswitch_5
        0x5d -> :sswitch_8
        0x7b -> :sswitch_8
        0x7d -> :sswitch_8
    .end sparse-switch
.end method

.method private nextNonWhitespace(Z)I
    .registers 12
    .param p1, "throwOnEof"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1338
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    .line 1339
    .local v0, "buffer":[C
    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1340
    .local v4, "p":I
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 1342
    .local v3, "l":I
    :goto_6
    if-ne v4, v3, :cond_42

    .line 1343
    iput v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1344
    const/4 v7, 0x1

    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v7

    if-nez v7, :cond_3e

    .line 1411
    if-eqz p1, :cond_cd

    .line 1412
    new-instance v7, Ljava/io/EOFException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "End of input at line "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 1413
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " column "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 1347
    :cond_3e
    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1348
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 1351
    :cond_42
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "p":I
    .local v5, "p":I
    aget-char v1, v0, v4

    .line 1352
    .local v1, "c":I
    const/16 v7, 0xa

    if-ne v1, v7, :cond_54

    .line 1353
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    .line 1354
    iput v5, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    move v4, v5

    .line 1355
    .end local v5    # "p":I
    .restart local v4    # "p":I
    goto :goto_6

    .line 1356
    .end local v4    # "p":I
    .restart local v5    # "p":I
    :cond_54
    const/16 v7, 0x20

    if-eq v1, v7, :cond_cf

    const/16 v7, 0xd

    if-eq v1, v7, :cond_cf

    const/16 v7, 0x9

    if-ne v1, v7, :cond_62

    move v4, v5

    .line 1357
    .end local v5    # "p":I
    .restart local v4    # "p":I
    goto :goto_6

    .line 1360
    .end local v4    # "p":I
    .restart local v5    # "p":I
    :cond_62
    const/16 v7, 0x2f

    if-ne v1, v7, :cond_b7

    .line 1361
    iput v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1362
    if-ne v5, v3, :cond_7f

    .line 1363
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1364
    const/4 v7, 0x2

    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v2

    .line 1365
    .local v2, "charsLoaded":Z
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1366
    if-nez v2, :cond_7f

    move v4, v5

    .line 1415
    .end local v1    # "c":I
    .end local v2    # "charsLoaded":Z
    .end local v5    # "p":I
    .restart local v4    # "p":I
    :goto_7e
    return v1

    .line 1371
    .end local v4    # "p":I
    .restart local v1    # "c":I
    .restart local v5    # "p":I
    :cond_7f
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 1372
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v6, v0, v7

    .line 1373
    .local v6, "peek":C
    sparse-switch v6, :sswitch_data_d2

    move v4, v5

    .line 1393
    .end local v5    # "p":I
    .restart local v4    # "p":I
    goto :goto_7e

    .line 1376
    .end local v4    # "p":I
    .restart local v5    # "p":I
    :sswitch_8b
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1377
    const-string v7, "*/"

    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->skipTo(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_a0

    .line 1378
    const-string v7, "Unterminated comment"

    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v7

    throw v7

    .line 1380
    :cond_a0
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v4, v7, 0x2

    .line 1381
    .end local v5    # "p":I
    .restart local v4    # "p":I
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 1382
    goto/16 :goto_6

    .line 1386
    .end local v4    # "p":I
    .restart local v5    # "p":I
    :sswitch_a8
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1387
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->skipToEndOfLine()V

    .line 1388
    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1389
    .end local v5    # "p":I
    .restart local v4    # "p":I
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 1390
    goto/16 :goto_6

    .line 1395
    .end local v4    # "p":I
    .end local v6    # "peek":C
    .restart local v5    # "p":I
    :cond_b7
    const/16 v7, 0x23

    if-ne v1, v7, :cond_c9

    .line 1396
    iput v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1402
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 1403
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->skipToEndOfLine()V

    .line 1404
    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1405
    .end local v5    # "p":I
    .restart local v4    # "p":I
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    goto/16 :goto_6

    .line 1407
    .end local v4    # "p":I
    .restart local v5    # "p":I
    :cond_c9
    iput v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    move v4, v5

    .line 1408
    .end local v5    # "p":I
    .restart local v4    # "p":I
    goto :goto_7e

    .line 1415
    .end local v1    # "c":I
    :cond_cd
    const/4 v1, -0x1

    goto :goto_7e

    .end local v4    # "p":I
    .restart local v1    # "c":I
    .restart local v5    # "p":I
    :cond_cf
    move v4, v5

    .end local v5    # "p":I
    .restart local v4    # "p":I
    goto/16 :goto_6

    .line 1373
    :sswitch_data_d2
    .sparse-switch
        0x2a -> :sswitch_8b
        0x2f -> :sswitch_a8
    .end sparse-switch
.end method

.method private nextQuotedValue(C)Ljava/lang/String;
    .registers 10
    .param p1, "quote"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 999
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    .line 1000
    .local v0, "buffer":[C
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1002
    .local v1, "builder":Ljava/lang/StringBuilder;
    :cond_7
    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1003
    .local v4, "p":I
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 1005
    .local v3, "l":I
    move v6, v4

    .local v6, "start":I
    move v5, v4

    .line 1006
    .end local v4    # "p":I
    .local v5, "p":I
    :goto_d
    if-ge v5, v3, :cond_4b

    .line 1007
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "p":I
    .restart local v4    # "p":I
    aget-char v2, v0, v5

    .line 1009
    .local v2, "c":I
    if-ne v2, p1, :cond_23

    .line 1010
    iput v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1011
    sub-int v7, v4, v6

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v1, v0, v6, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1012
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 1013
    :cond_23
    const/16 v7, 0x5c

    if-ne v2, v7, :cond_3e

    .line 1014
    iput v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1015
    sub-int v7, v4, v6

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v1, v0, v6, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1016
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->readEscapeCharacter()C

    move-result v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1017
    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1018
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 1019
    move v6, v4

    :cond_3c
    :goto_3c
    move v5, v4

    .line 1024
    .end local v4    # "p":I
    .restart local v5    # "p":I
    goto :goto_d

    .line 1020
    .end local v5    # "p":I
    .restart local v4    # "p":I
    :cond_3e
    const/16 v7, 0xa

    if-ne v2, v7, :cond_3c

    .line 1021
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    .line 1022
    iput v4, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    goto :goto_3c

    .line 1026
    .end local v2    # "c":I
    .end local v4    # "p":I
    .restart local v5    # "p":I
    :cond_4b
    sub-int v7, v5, v6

    invoke-virtual {v1, v0, v6, v7}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1027
    iput v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1028
    const/4 v7, 0x1

    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v7

    if-nez v7, :cond_7

    .line 1029
    const-string v7, "Unterminated string"

    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v7

    throw v7
.end method

.method private nextUnquotedValue()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1039
    const/4 v0, 0x0

    .line 1040
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 1044
    .local v1, "i":I
    :cond_2
    :goto_2
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v3, v1

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-ge v3, v4, :cond_2a

    .line 1045
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v4, v1

    aget-char v3, v3, v4

    sparse-switch v3, :sswitch_data_60

    .line 1044
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1051
    :sswitch_16
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 1089
    :cond_19
    :goto_19
    :sswitch_19
    if-nez v0, :cond_54

    .line 1090
    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {v2, v3, v4, v1}, Ljava/lang/String;-><init>([CII)V

    .line 1095
    .local v2, "result":Ljava/lang/String;
    :goto_24
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1096
    return-object v2

    .line 1068
    .end local v2    # "result":Ljava/lang/String;
    :cond_2a
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    array-length v3, v3

    if-ge v1, v3, :cond_38

    .line 1069
    add-int/lit8 v3, v1, 0x1

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v3

    if-eqz v3, :cond_19

    goto :goto_2

    .line 1077
    :cond_38
    if-nez v0, :cond_3f

    .line 1078
    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0    # "builder":Ljava/lang/StringBuilder;
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1080
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_3f
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-virtual {v0, v3, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1081
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v3, v1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1082
    const/4 v1, 0x0

    .line 1083
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_19

    .line 1092
    :cond_54
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-virtual {v0, v3, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 1093
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "result":Ljava/lang/String;
    goto :goto_24

    .line 1045
    :sswitch_data_60
    .sparse-switch
        0x9 -> :sswitch_19
        0xa -> :sswitch_19
        0xc -> :sswitch_19
        0xd -> :sswitch_19
        0x20 -> :sswitch_19
        0x23 -> :sswitch_16
        0x2c -> :sswitch_19
        0x2f -> :sswitch_16
        0x3a -> :sswitch_19
        0x3b -> :sswitch_16
        0x3d -> :sswitch_16
        0x5b -> :sswitch_19
        0x5c -> :sswitch_16
        0x5d -> :sswitch_19
        0x7b -> :sswitch_19
        0x7d -> :sswitch_19
    .end sparse-switch
.end method

.method private peekKeyword()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 608
    iget-object v7, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v0, v7, v8

    .line 612
    .local v0, "c":C
    const/16 v7, 0x74

    if-eq v0, v7, :cond_f

    const/16 v7, 0x54

    if-ne v0, v7, :cond_2c

    .line 613
    :cond_f
    const-string v2, "true"

    .line 614
    .local v2, "keyword":Ljava/lang/String;
    const-string v3, "TRUE"

    .line 615
    .local v3, "keywordUpper":Ljava/lang/String;
    const/4 v5, 0x5

    .line 629
    .local v5, "peeking":I
    :goto_14
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    .line 630
    .local v4, "length":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_19
    if-ge v1, v4, :cond_62

    .line 631
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v7, v1

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lt v7, v8, :cond_4a

    add-int/lit8 v7, v1, 0x1

    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v7

    if-nez v7, :cond_4a

    move v5, v6

    .line 647
    .end local v1    # "i":I
    .end local v2    # "keyword":Ljava/lang/String;
    .end local v3    # "keywordUpper":Ljava/lang/String;
    .end local v4    # "length":I
    .end local v5    # "peeking":I
    :goto_2b
    return v5

    .line 616
    :cond_2c
    const/16 v7, 0x66

    if-eq v0, v7, :cond_34

    const/16 v7, 0x46

    if-ne v0, v7, :cond_3a

    .line 617
    :cond_34
    const-string v2, "false"

    .line 618
    .restart local v2    # "keyword":Ljava/lang/String;
    const-string v3, "FALSE"

    .line 619
    .restart local v3    # "keywordUpper":Ljava/lang/String;
    const/4 v5, 0x6

    .restart local v5    # "peeking":I
    goto :goto_14

    .line 620
    .end local v2    # "keyword":Ljava/lang/String;
    .end local v3    # "keywordUpper":Ljava/lang/String;
    .end local v5    # "peeking":I
    :cond_3a
    const/16 v7, 0x6e

    if-eq v0, v7, :cond_42

    const/16 v7, 0x4e

    if-ne v0, v7, :cond_48

    .line 621
    :cond_42
    const-string v2, "null"

    .line 622
    .restart local v2    # "keyword":Ljava/lang/String;
    const-string v3, "NULL"

    .line 623
    .restart local v3    # "keywordUpper":Ljava/lang/String;
    const/4 v5, 0x7

    .restart local v5    # "peeking":I
    goto :goto_14

    .end local v2    # "keyword":Ljava/lang/String;
    .end local v3    # "keywordUpper":Ljava/lang/String;
    .end local v5    # "peeking":I
    :cond_48
    move v5, v6

    .line 625
    goto :goto_2b

    .line 634
    .restart local v1    # "i":I
    .restart local v2    # "keyword":Ljava/lang/String;
    .restart local v3    # "keywordUpper":Ljava/lang/String;
    .restart local v4    # "length":I
    .restart local v5    # "peeking":I
    :cond_4a
    iget-object v7, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v8, v1

    aget-char v0, v7, v8

    .line 635
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v0, v7, :cond_5f

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v0, v7, :cond_5f

    move v5, v6

    .line 636
    goto :goto_2b

    .line 630
    :cond_5f
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 640
    :cond_62
    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v7, v4

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lt v7, v8, :cond_71

    add-int/lit8 v7, v4, 0x1

    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v7

    if-eqz v7, :cond_80

    :cond_71
    iget-object v7, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v8, v4

    aget-char v7, v7, v8

    .line 641
    invoke-direct {p0, v7}, Lcom/google/gson/stream/JsonReader;->isLiteral(C)Z

    move-result v7

    if-eqz v7, :cond_80

    move v5, v6

    .line 642
    goto :goto_2b

    .line 646
    :cond_80
    iget v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v6, v4

    iput v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 647
    iput v5, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto :goto_2b
.end method

.method private peekNumber()I
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 652
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    .line 653
    .local v1, "buffer":[C
    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 654
    .local v10, "p":I
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 656
    .local v5, "l":I
    const-wide/16 v11, 0x0

    .line 657
    .local v11, "value":J
    const/4 v7, 0x0

    .line 658
    .local v7, "negative":Z
    const/4 v3, 0x1

    .line 659
    .local v3, "fitsInLong":Z
    const/4 v6, 0x0

    .line 661
    .local v6, "last":I
    const/4 v4, 0x0

    .line 665
    .local v4, "i":I
    :goto_12
    add-int v13, v10, v4

    if-ne v13, v5, :cond_50

    .line 666
    array-length v13, v1

    if-ne v4, v13, :cond_1b

    .line 669
    const/4 v13, 0x0

    .line 749
    .end local v11    # "value":J
    :goto_1a
    return v13

    .line 671
    .restart local v11    # "value":J
    :cond_1b
    add-int/lit8 v13, v4, 0x1

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v13

    if-nez v13, :cond_48

    .line 740
    :cond_25
    const/4 v13, 0x2

    if-ne v6, v13, :cond_da

    if-eqz v3, :cond_da

    const-wide/high16 v13, -0x8000000000000000L

    cmp-long v13, v11, v13

    if-nez v13, :cond_32

    if-eqz v7, :cond_da

    .line 741
    :cond_32
    if-eqz v7, :cond_d7

    .end local v11    # "value":J
    :goto_34
    move-object/from16 v0, p0

    iput-wide v11, v0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    .line 742
    move-object/from16 v0, p0

    iget v13, v0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v13, v4

    move-object/from16 v0, p0

    iput v13, v0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 743
    const/16 v13, 0xf

    move-object/from16 v0, p0

    iput v13, v0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto :goto_1a

    .line 674
    .restart local v11    # "value":J
    :cond_48
    move-object/from16 v0, p0

    iget v10, v0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 675
    move-object/from16 v0, p0

    iget v5, v0, Lcom/google/gson/stream/JsonReader;->limit:I

    .line 678
    :cond_50
    add-int v13, v10, v4

    aget-char v2, v1, v13

    .line 679
    .local v2, "c":C
    sparse-switch v2, :sswitch_data_f2

    .line 714
    const/16 v13, 0x30

    if-lt v2, v13, :cond_5f

    const/16 v13, 0x39

    if-le v2, v13, :cond_8f

    .line 715
    :cond_5f
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/google/gson/stream/JsonReader;->isLiteral(C)Z

    move-result v13

    if-eqz v13, :cond_25

    .line 718
    const/4 v13, 0x0

    goto :goto_1a

    .line 681
    :sswitch_69
    if-nez v6, :cond_70

    .line 682
    const/4 v7, 0x1

    .line 683
    const/4 v6, 0x1

    .line 664
    :cond_6d
    :goto_6d
    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    .line 685
    :cond_70
    const/4 v13, 0x5

    if-ne v6, v13, :cond_75

    .line 686
    const/4 v6, 0x6

    .line 687
    goto :goto_6d

    .line 689
    :cond_75
    const/4 v13, 0x0

    goto :goto_1a

    .line 692
    :sswitch_77
    const/4 v13, 0x5

    if-ne v6, v13, :cond_7c

    .line 693
    const/4 v6, 0x6

    .line 694
    goto :goto_6d

    .line 696
    :cond_7c
    const/4 v13, 0x0

    goto :goto_1a

    .line 700
    :sswitch_7e
    const/4 v13, 0x2

    if-eq v6, v13, :cond_84

    const/4 v13, 0x4

    if-ne v6, v13, :cond_86

    .line 701
    :cond_84
    const/4 v6, 0x5

    .line 702
    goto :goto_6d

    .line 704
    :cond_86
    const/4 v13, 0x0

    goto :goto_1a

    .line 707
    :sswitch_88
    const/4 v13, 0x2

    if-ne v6, v13, :cond_8d

    .line 708
    const/4 v6, 0x3

    .line 709
    goto :goto_6d

    .line 711
    :cond_8d
    const/4 v13, 0x0

    goto :goto_1a

    .line 720
    :cond_8f
    const/4 v13, 0x1

    if-eq v6, v13, :cond_94

    if-nez v6, :cond_9a

    .line 721
    :cond_94
    add-int/lit8 v13, v2, -0x30

    neg-int v13, v13

    int-to-long v11, v13

    .line 722
    const/4 v6, 0x2

    goto :goto_6d

    .line 723
    :cond_9a
    const/4 v13, 0x2

    if-ne v6, v13, :cond_ca

    .line 724
    const-wide/16 v13, 0x0

    cmp-long v13, v11, v13

    if-nez v13, :cond_a6

    .line 725
    const/4 v13, 0x0

    goto/16 :goto_1a

    .line 727
    :cond_a6
    const-wide/16 v13, 0xa

    mul-long/2addr v13, v11

    add-int/lit8 v15, v2, -0x30

    int-to-long v15, v15

    sub-long v8, v13, v15

    .line 728
    .local v8, "newValue":J
    const-wide v13, -0xcccccccccccccccL

    cmp-long v13, v11, v13

    if-gtz v13, :cond_c4

    const-wide v13, -0xcccccccccccccccL

    cmp-long v13, v11, v13

    if-nez v13, :cond_c8

    cmp-long v13, v8, v11

    if-gez v13, :cond_c8

    :cond_c4
    const/4 v13, 0x1

    :goto_c5
    and-int/2addr v3, v13

    .line 730
    move-wide v11, v8

    .line 731
    goto :goto_6d

    .line 728
    :cond_c8
    const/4 v13, 0x0

    goto :goto_c5

    .line 731
    .end local v8    # "newValue":J
    :cond_ca
    const/4 v13, 0x3

    if-ne v6, v13, :cond_cf

    .line 732
    const/4 v6, 0x4

    goto :goto_6d

    .line 733
    :cond_cf
    const/4 v13, 0x5

    if-eq v6, v13, :cond_d5

    const/4 v13, 0x6

    if-ne v6, v13, :cond_6d

    .line 734
    :cond_d5
    const/4 v6, 0x7

    goto :goto_6d

    .line 741
    .end local v2    # "c":C
    :cond_d7
    neg-long v11, v11

    goto/16 :goto_34

    .line 744
    :cond_da
    const/4 v13, 0x2

    if-eq v6, v13, :cond_e3

    const/4 v13, 0x4

    if-eq v6, v13, :cond_e3

    const/4 v13, 0x7

    if-ne v6, v13, :cond_ef

    .line 746
    :cond_e3
    move-object/from16 v0, p0

    iput v4, v0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    .line 747
    const/16 v13, 0x10

    move-object/from16 v0, p0

    iput v13, v0, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto/16 :goto_1a

    .line 749
    :cond_ef
    const/4 v13, 0x0

    goto/16 :goto_1a

    .line 679
    :sswitch_data_f2
    .sparse-switch
        0x2b -> :sswitch_77
        0x2d -> :sswitch_69
        0x2e -> :sswitch_88
        0x45 -> :sswitch_7e
        0x65 -> :sswitch_7e
    .end sparse-switch
.end method

.method private push(I)V
    .registers 8
    .param p1, "newTop"    # I

    .prologue
    const/4 v5, 0x0

    .line 1267
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    iget-object v4, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    array-length v4, v4

    if-ne v3, v4, :cond_35

    .line 1268
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    mul-int/lit8 v3, v3, 0x2

    new-array v2, v3, [I

    .line 1269
    .local v2, "newStack":[I
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    mul-int/lit8 v3, v3, 0x2

    new-array v0, v3, [I

    .line 1270
    .local v0, "newPathIndices":[I
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    mul-int/lit8 v3, v3, 0x2

    new-array v1, v3, [Ljava/lang/String;

    .line 1271
    .local v1, "newPathNames":[Ljava/lang/String;
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    invoke-static {v3, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1272
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    invoke-static {v3, v5, v0, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1273
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->pathNames:[Ljava/lang/String;

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    invoke-static {v3, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1274
    iput-object v2, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    .line 1275
    iput-object v0, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    .line 1276
    iput-object v1, p0, Lcom/google/gson/stream/JsonReader;->pathNames:[Ljava/lang/String;

    .line 1278
    .end local v0    # "newPathIndices":[I
    .end local v1    # "newPathNames":[Ljava/lang/String;
    .end local v2    # "newStack":[I
    :cond_35
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    aput p1, v3, v4

    .line 1279
    return-void
.end method

.method private readEscapeCharacter()C
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x4

    .line 1510
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-ne v5, v6, :cond_15

    const/4 v5, 0x1

    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v5

    if-nez v5, :cond_15

    .line 1511
    const-string v5, "Unterminated escape sequence"

    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 1514
    :cond_15
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v2, v5, v6

    .line 1515
    .local v2, "escaped":C
    sparse-switch v2, :sswitch_data_bc

    :goto_22
    move v4, v2

    .line 1562
    :goto_23
    return v4

    .line 1517
    :sswitch_24
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v5, v5, 0x4

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-le v5, v6, :cond_39

    invoke-direct {p0, v10}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v5

    if-nez v5, :cond_39

    .line 1518
    const-string v5, "Unterminated escape sequence"

    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v5

    throw v5

    .line 1521
    :cond_39
    const/4 v4, 0x0

    .line 1522
    .local v4, "result":C
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .local v3, "i":I
    add-int/lit8 v1, v3, 0x4

    .local v1, "end":I
    :goto_3e
    if-ge v3, v1, :cond_96

    .line 1523
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    aget-char v0, v5, v3

    .line 1524
    .local v0, "c":C
    shl-int/lit8 v5, v4, 0x4

    int-to-char v4, v5

    .line 1525
    const/16 v5, 0x30

    if-lt v0, v5, :cond_56

    const/16 v5, 0x39

    if-gt v0, v5, :cond_56

    .line 1526
    add-int/lit8 v5, v0, -0x30

    add-int/2addr v5, v4

    int-to-char v4, v5

    .line 1522
    :goto_53
    add-int/lit8 v3, v3, 0x1

    goto :goto_3e

    .line 1527
    :cond_56
    const/16 v5, 0x61

    if-lt v0, v5, :cond_65

    const/16 v5, 0x66

    if-gt v0, v5, :cond_65

    .line 1528
    add-int/lit8 v5, v0, -0x61

    add-int/lit8 v5, v5, 0xa

    add-int/2addr v5, v4

    int-to-char v4, v5

    goto :goto_53

    .line 1529
    :cond_65
    const/16 v5, 0x41

    if-lt v0, v5, :cond_74

    const/16 v5, 0x46

    if-gt v0, v5, :cond_74

    .line 1530
    add-int/lit8 v5, v0, -0x41

    add-int/lit8 v5, v5, 0xa

    add-int/2addr v5, v4

    int-to-char v4, v5

    goto :goto_53

    .line 1532
    :cond_74
    new-instance v5, Ljava/lang/NumberFormatException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "\\u"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    new-instance v7, Ljava/lang/String;

    iget-object v8, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v9, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-direct {v7, v8, v9, v10}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1535
    .end local v0    # "c":C
    :cond_96
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v5, v5, 0x4

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_23

    .line 1539
    .end local v1    # "end":I
    .end local v3    # "i":I
    .end local v4    # "result":C
    :sswitch_9d
    const/16 v4, 0x9

    goto :goto_23

    .line 1542
    :sswitch_a0
    const/16 v4, 0x8

    goto :goto_23

    .line 1545
    :sswitch_a3
    const/16 v4, 0xa

    goto/16 :goto_23

    .line 1548
    :sswitch_a7
    const/16 v4, 0xd

    goto/16 :goto_23

    .line 1551
    :sswitch_ab
    const/16 v4, 0xc

    goto/16 :goto_23

    .line 1554
    :sswitch_af
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    .line 1555
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    goto/16 :goto_22

    .line 1515
    nop

    :sswitch_data_bc
    .sparse-switch
        0xa -> :sswitch_af
        0x62 -> :sswitch_a0
        0x66 -> :sswitch_ab
        0x6e -> :sswitch_a3
        0x72 -> :sswitch_a7
        0x74 -> :sswitch_9d
        0x75 -> :sswitch_24
    .end sparse-switch
.end method

.method private skipQuotedValue(C)V
    .registers 8
    .param p1, "quote"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1101
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    .line 1103
    .local v0, "buffer":[C
    :cond_2
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1104
    .local v3, "p":I
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    .local v2, "l":I
    move v4, v3

    .line 1106
    .end local v3    # "p":I
    .local v4, "p":I
    :goto_7
    if-ge v4, v2, :cond_2e

    .line 1107
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "p":I
    .restart local v3    # "p":I
    aget-char v1, v0, v4

    .line 1108
    .local v1, "c":I
    if-ne v1, p1, :cond_12

    .line 1109
    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1110
    return-void

    .line 1111
    :cond_12
    const/16 v5, 0x5c

    if-ne v1, v5, :cond_21

    .line 1112
    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1113
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->readEscapeCharacter()C

    .line 1114
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1115
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    :cond_1f
    :goto_1f
    move v4, v3

    .line 1120
    .end local v3    # "p":I
    .restart local v4    # "p":I
    goto :goto_7

    .line 1116
    .end local v4    # "p":I
    .restart local v3    # "p":I
    :cond_21
    const/16 v5, 0xa

    if-ne v1, v5, :cond_1f

    .line 1117
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    .line 1118
    iput v3, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    goto :goto_1f

    .line 1121
    .end local v1    # "c":I
    .end local v3    # "p":I
    .restart local v4    # "p":I
    :cond_2e
    iput v4, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1122
    const/4 v5, 0x1

    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v5

    if-nez v5, :cond_2

    .line 1123
    const-string v5, "Unterminated string"

    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->syntaxError(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v5

    throw v5
.end method

.method private skipTo(Ljava/lang/String;)Z
    .registers 5
    .param p1, "toFind"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1448
    :goto_0
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-le v1, v2, :cond_15

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 1449
    :cond_15
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v1, v1, v2

    const/16 v2, 0xa

    if-ne v1, v2, :cond_32

    .line 1450
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    .line 1451
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    .line 1448
    :cond_2b
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_0

    .line 1454
    :cond_32
    const/4 v0, 0x0

    .local v0, "c":I
    :goto_33
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_49

    .line 1455
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v2, v0

    aget-char v1, v1, v2

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v1, v2, :cond_2b

    .line 1454
    add-int/lit8 v0, v0, 0x1

    goto :goto_33

    .line 1459
    :cond_49
    const/4 v1, 0x1

    .line 1461
    .end local v0    # "c":I
    :goto_4a
    return v1

    :cond_4b
    const/4 v1, 0x0

    goto :goto_4a
.end method

.method private skipToEndOfLine()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1431
    :cond_0
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-lt v1, v2, :cond_d

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 1432
    :cond_d
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    aget-char v0, v1, v2

    .line 1433
    .local v0, "c":C
    const/16 v1, 0xa

    if-ne v0, v1, :cond_26

    .line 1434
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineNumber:I

    .line 1435
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->lineStart:I

    .line 1441
    .end local v0    # "c":C
    :cond_25
    :goto_25
    return-void

    .line 1437
    .restart local v0    # "c":C
    :cond_26
    const/16 v1, 0xd

    if-ne v0, v1, :cond_0

    goto :goto_25
.end method

.method private skipUnquotedValue()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1128
    :cond_0
    const/4 v0, 0x0

    .line 1129
    .local v0, "i":I
    :goto_1
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->limit:I

    if-ge v1, v2, :cond_1e

    .line 1130
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v2, v0

    aget-char v1, v1, v2

    sparse-switch v1, :sswitch_data_2c

    .line 1129
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 1136
    :sswitch_15
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->checkLenient()V

    .line 1148
    :sswitch_18
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1154
    :goto_1d
    return-void

    .line 1152
    :cond_1e
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1153
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->fillBuffer(I)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1d

    .line 1130
    nop

    :sswitch_data_2c
    .sparse-switch
        0x9 -> :sswitch_18
        0xa -> :sswitch_18
        0xc -> :sswitch_18
        0xd -> :sswitch_18
        0x20 -> :sswitch_18
        0x23 -> :sswitch_15
        0x2c -> :sswitch_18
        0x2f -> :sswitch_15
        0x3a -> :sswitch_18
        0x3b -> :sswitch_15
        0x3d -> :sswitch_15
        0x5b -> :sswitch_18
        0x5c -> :sswitch_15
        0x5d -> :sswitch_18
        0x7b -> :sswitch_18
        0x7d -> :sswitch_18
    .end sparse-switch
.end method

.method private syntaxError(Ljava/lang/String;)Ljava/io/IOException;
    .registers 5
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1571
    new-instance v0, Lcom/google/gson/stream/MalformedJsonException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " at line "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1572
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " column "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " path "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/gson/stream/MalformedJsonException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public beginArray()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 341
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 342
    .local v0, "p":I
    if-nez v0, :cond_9

    .line 343
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 345
    :cond_9
    const/4 v1, 0x3

    if-ne v0, v1, :cond_1b

    .line 346
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->push(I)V

    .line 347
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v2, v2, -0x1

    aput v3, v1, v2

    .line 348
    iput v3, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 353
    return-void

    .line 350
    :cond_1b
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected BEGIN_ARRAY but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 351
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " path "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public beginObject()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 378
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 379
    .local v0, "p":I
    if-nez v0, :cond_8

    .line 380
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 382
    :cond_8
    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    .line 383
    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lcom/google/gson/stream/JsonReader;->push(I)V

    .line 384
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 389
    return-void

    .line 386
    :cond_13
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected BEGIN_OBJECT but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 387
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " path "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1219
    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1220
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    const/16 v1, 0x8

    aput v1, v0, v2

    .line 1221
    const/4 v0, 0x1

    iput v0, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    .line 1222
    iget-object v0, p0, Lcom/google/gson/stream/JsonReader;->in:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 1223
    return-void
.end method

.method public endArray()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 360
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 361
    .local v0, "p":I
    if-nez v0, :cond_8

    .line 362
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 364
    :cond_8
    const/4 v1, 0x4

    if-ne v0, v1, :cond_15

    .line 365
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    .line 366
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 371
    return-void

    .line 368
    :cond_15
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected END_ARRAY but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 369
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " path "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public endObject()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 396
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 397
    .local v0, "p":I
    if-nez v0, :cond_8

    .line 398
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 400
    :cond_8
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1c

    .line 401
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    .line 402
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->pathNames:[Ljava/lang/String;

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    const/4 v3, 0x0

    aput-object v3, v1, v2

    .line 403
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 408
    return-void

    .line 405
    :cond_1c
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected END_OBJECT but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 406
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " path "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getPath()Ljava/lang/String;
    .registers 6

    .prologue
    .line 1474
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x24

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1475
    .local v1, "result":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    .local v2, "size":I
    :goto_e
    if-ge v0, v2, :cond_41

    .line 1476
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->stack:[I

    aget v3, v3, v0

    packed-switch v3, :pswitch_data_46

    .line 1475
    :cond_17
    :goto_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 1479
    :pswitch_1a
    const/16 v3, 0x5b

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    aget v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x5d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_17

    .line 1485
    :pswitch_2e
    const/16 v3, 0x2e

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1486
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->pathNames:[Ljava/lang/String;

    aget-object v3, v3, v0

    if-eqz v3, :cond_17

    .line 1487
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->pathNames:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_17

    .line 1497
    :cond_41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 1476
    :pswitch_data_46
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_1a
        :pswitch_2e
        :pswitch_2e
        :pswitch_2e
    .end packed-switch
.end method

.method public hasNext()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 414
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 415
    .local v0, "p":I
    if-nez v0, :cond_8

    .line 416
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 418
    :cond_8
    const/4 v1, 0x2

    if-eq v0, v1, :cond_10

    const/4 v1, 0x4

    if-eq v0, v1, :cond_10

    const/4 v1, 0x1

    :goto_f
    return v1

    :cond_10
    const/4 v1, 0x0

    goto :goto_f
.end method

.method public final isLenient()Z
    .registers 2

    .prologue
    .line 333
    iget-boolean v0, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    return v0
.end method

.method public nextBoolean()Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 851
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 852
    .local v0, "p":I
    if-nez v0, :cond_9

    .line 853
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 855
    :cond_9
    const/4 v2, 0x5

    if-ne v0, v2, :cond_1c

    .line 856
    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 857
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v2, v2, -0x1

    aget v3, v1, v2

    add-int/lit8 v3, v3, 0x1

    aput v3, v1, v2

    .line 858
    const/4 v1, 0x1

    .line 862
    :goto_1b
    return v1

    .line 859
    :cond_1c
    const/4 v2, 0x6

    if-ne v0, v2, :cond_2e

    .line 860
    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 861
    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v3, v3, -0x1

    aget v4, v2, v3

    add-int/lit8 v4, v4, 0x1

    aput v4, v2, v3

    goto :goto_1b

    .line 864
    :cond_2e
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a boolean but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 865
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " path "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public nextDouble()D
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0xb

    const/16 v4, 0x8

    const/4 v7, 0x0

    .line 899
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 900
    .local v0, "p":I
    if-nez v0, :cond_d

    .line 901
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 904
    :cond_d
    const/16 v3, 0xf

    if-ne v0, v3, :cond_23

    .line 905
    iput v7, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 906
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v4, v4, -0x1

    aget v5, v3, v4

    add-int/lit8 v5, v5, 0x1

    aput v5, v3, v4

    .line 907
    iget-wide v3, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    long-to-double v1, v3

    .line 931
    :goto_22
    return-wide v1

    .line 910
    :cond_23
    const/16 v3, 0x10

    if-ne v0, v3, :cond_96

    .line 911
    new-instance v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    invoke-direct {v3, v4, v5, v6}, Ljava/lang/String;-><init>([CII)V

    iput-object v3, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    .line 912
    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 922
    :cond_3b
    :goto_3b
    iput v8, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 923
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v1

    .line 924
    .local v1, "result":D
    iget-boolean v3, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    if-nez v3, :cond_fe

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v3

    if-nez v3, :cond_53

    invoke-static {v1, v2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v3

    if-eqz v3, :cond_fe

    .line 925
    :cond_53
    new-instance v3, Lcom/google/gson/stream/MalformedJsonException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "JSON forbids NaN and infinities: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " at line "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 926
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " column "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " path "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/gson/stream/MalformedJsonException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 913
    .end local v1    # "result":D
    :cond_96
    if-eq v0, v4, :cond_9c

    const/16 v3, 0x9

    if-ne v0, v3, :cond_aa

    .line 914
    :cond_9c
    if-ne v0, v4, :cond_a7

    const/16 v3, 0x27

    :goto_a0
    invoke-direct {p0, v3}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    goto :goto_3b

    :cond_a7
    const/16 v3, 0x22

    goto :goto_a0

    .line 915
    :cond_aa
    const/16 v3, 0xa

    if-ne v0, v3, :cond_b5

    .line 916
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->nextUnquotedValue()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    goto :goto_3b

    .line 917
    :cond_b5
    if-eq v0, v8, :cond_3b

    .line 918
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected a double but was "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " at line "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 919
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " column "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " path "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 928
    .restart local v1    # "result":D
    :cond_fe
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    .line 929
    iput v7, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 930
    iget-object v3, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v4, v4, -0x1

    aget v5, v3, v4

    add-int/lit8 v5, v5, 0x1

    aput v5, v3, v4

    goto/16 :goto_22
.end method

.method public nextInt()I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x8

    const/4 v9, 0x0

    .line 1167
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1168
    .local v2, "p":I
    if-nez v2, :cond_b

    .line 1169
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v2

    .line 1173
    :cond_b
    const/16 v5, 0xf

    if-ne v2, v5, :cond_6e

    .line 1174
    iget-wide v5, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    long-to-int v3, v5

    .line 1175
    .local v3, "result":I
    iget-wide v5, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    int-to-long v7, v3

    cmp-long v5, v5, v7

    if-eqz v5, :cond_5e

    .line 1176
    new-instance v5, Ljava/lang/NumberFormatException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected an int but was "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-wide v7, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " at line "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 1177
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " column "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " path "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1179
    :cond_5e
    iput v9, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1180
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v6, v6, -0x1

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6

    move v4, v3

    .line 1212
    .end local v3    # "result":I
    .local v4, "result":I
    :goto_6d
    return v4

    .line 1184
    .end local v4    # "result":I
    :cond_6e
    const/16 v5, 0x10

    if-ne v2, v5, :cond_db

    .line 1185
    new-instance v5, Ljava/lang/String;

    iget-object v6, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    invoke-direct {v5, v6, v7, v8}, Ljava/lang/String;-><init>([CII)V

    iput-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    .line 1186
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v5, v6

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 1202
    :goto_86
    const/16 v5, 0xb

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1203
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 1204
    .local v0, "asDouble":D
    double-to-int v3, v0

    .line 1205
    .restart local v3    # "result":I
    int-to-double v5, v3

    cmpl-double v5, v5, v0

    if-eqz v5, :cond_14d

    .line 1206
    new-instance v5, Ljava/lang/NumberFormatException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected an int but was "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " at line "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 1207
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " column "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " path "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1187
    .end local v0    # "asDouble":D
    .end local v3    # "result":I
    :cond_db
    if-eq v2, v6, :cond_e1

    const/16 v5, 0x9

    if-ne v2, v5, :cond_106

    .line 1188
    :cond_e1
    if-ne v2, v6, :cond_103

    const/16 v5, 0x27

    :goto_e5
    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    .line 1190
    :try_start_eb
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 1191
    .restart local v3    # "result":I
    const/4 v5, 0x0

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1192
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v6, v6, -0x1

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6
    :try_end_100
    .catch Ljava/lang/NumberFormatException; {:try_start_eb .. :try_end_100} :catch_161

    move v4, v3

    .line 1193
    .end local v3    # "result":I
    .restart local v4    # "result":I
    goto/16 :goto_6d

    .line 1188
    .end local v4    # "result":I
    :cond_103
    const/16 v5, 0x22

    goto :goto_e5

    .line 1198
    :cond_106
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected an int but was "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " at line "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 1199
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " column "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " path "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 1209
    .restart local v0    # "asDouble":D
    .restart local v3    # "result":I
    :cond_14d
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    .line 1210
    iput v9, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1211
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v6, v6, -0x1

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6

    move v4, v3

    .line 1212
    .end local v3    # "result":I
    .restart local v4    # "result":I
    goto/16 :goto_6d

    .line 1194
    .end local v0    # "asDouble":D
    .end local v4    # "result":I
    :catch_161
    move-exception v5

    goto/16 :goto_86
.end method

.method public nextLong()J
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x8

    const/4 v9, 0x0

    .line 945
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 946
    .local v2, "p":I
    if-nez v2, :cond_b

    .line 947
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v2

    .line 950
    :cond_b
    const/16 v5, 0xf

    if-ne v2, v5, :cond_20

    .line 951
    iput v9, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 952
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v6, v6, -0x1

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6

    .line 953
    iget-wide v3, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    .line 984
    :goto_1f
    return-wide v3

    .line 956
    :cond_20
    const/16 v5, 0x10

    if-ne v2, v5, :cond_8d

    .line 957
    new-instance v5, Ljava/lang/String;

    iget-object v6, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v7, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v8, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    invoke-direct {v5, v6, v7, v8}, Ljava/lang/String;-><init>([CII)V

    iput-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    .line 958
    iget v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v5, v6

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    .line 974
    :goto_38
    const/16 v5, 0xb

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 975
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    .line 976
    .local v0, "asDouble":D
    double-to-long v3, v0

    .line 977
    .local v3, "result":J
    long-to-double v5, v3

    cmpl-double v5, v5, v0

    if-eqz v5, :cond_100

    .line 978
    new-instance v5, Ljava/lang/NumberFormatException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected a long but was "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " at line "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 979
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " column "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " path "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 959
    .end local v0    # "asDouble":D
    .end local v3    # "result":J
    :cond_8d
    if-eq v2, v6, :cond_93

    const/16 v5, 0x9

    if-ne v2, v5, :cond_b9

    .line 960
    :cond_93
    if-ne v2, v6, :cond_b6

    const/16 v5, 0x27

    :goto_97
    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    .line 962
    :try_start_9d
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 963
    .restart local v3    # "result":J
    const/4 v5, 0x0

    iput v5, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 964
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v6, v6, -0x1

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6
    :try_end_b2
    .catch Ljava/lang/NumberFormatException; {:try_start_9d .. :try_end_b2} :catch_b4

    goto/16 :goto_1f

    .line 966
    .end local v3    # "result":J
    :catch_b4
    move-exception v5

    goto :goto_38

    .line 960
    :cond_b6
    const/16 v5, 0x22

    goto :goto_97

    .line 970
    :cond_b9
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Expected a long but was "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " at line "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 971
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " column "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " path "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 981
    .restart local v0    # "asDouble":D
    .restart local v3    # "result":J
    :cond_100
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    .line 982
    iput v9, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 983
    iget-object v5, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v6, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v6, v6, -0x1

    aget v7, v5, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v5, v6

    goto/16 :goto_1f
.end method

.method public nextName()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 786
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 787
    .local v0, "p":I
    if-nez v0, :cond_8

    .line 788
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 791
    :cond_8
    const/16 v2, 0xe

    if-ne v0, v2, :cond_1c

    .line 792
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->nextUnquotedValue()Ljava/lang/String;

    move-result-object v1

    .line 801
    .local v1, "result":Ljava/lang/String;
    :goto_10
    const/4 v2, 0x0

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 802
    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->pathNames:[Ljava/lang/String;

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v3, v3, -0x1

    aput-object v1, v2, v3

    .line 803
    return-object v1

    .line 793
    .end local v1    # "result":Ljava/lang/String;
    :cond_1c
    const/16 v2, 0xc

    if-ne v0, v2, :cond_27

    .line 794
    const/16 v2, 0x27

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "result":Ljava/lang/String;
    goto :goto_10

    .line 795
    .end local v1    # "result":Ljava/lang/String;
    :cond_27
    const/16 v2, 0xd

    if-ne v0, v2, :cond_32

    .line 796
    const/16 v2, 0x22

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "result":Ljava/lang/String;
    goto :goto_10

    .line 798
    .end local v1    # "result":Ljava/lang/String;
    :cond_32
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected a name but was "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " at line "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 799
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " column "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " path "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public nextNull()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 876
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 877
    .local v0, "p":I
    if-nez v0, :cond_8

    .line 878
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 880
    :cond_8
    const/4 v1, 0x7

    if-ne v0, v1, :cond_1b

    .line 881
    const/4 v1, 0x0

    iput v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 882
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v2, v2, -0x1

    aget v3, v1, v2

    add-int/lit8 v3, v3, 0x1

    aput v3, v1, v2

    .line 887
    return-void

    .line 884
    :cond_1b
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected null but was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " at line "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 885
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " column "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " path "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public nextString()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 815
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 816
    .local v0, "p":I
    if-nez v0, :cond_8

    .line 817
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 820
    :cond_8
    const/16 v2, 0xa

    if-ne v0, v2, :cond_20

    .line 821
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->nextUnquotedValue()Ljava/lang/String;

    move-result-object v1

    .line 838
    .local v1, "result":Ljava/lang/String;
    :goto_10
    const/4 v2, 0x0

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 839
    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v3, v3, -0x1

    aget v4, v2, v3

    add-int/lit8 v4, v4, 0x1

    aput v4, v2, v3

    .line 840
    return-object v1

    .line 822
    .end local v1    # "result":Ljava/lang/String;
    :cond_20
    const/16 v2, 0x8

    if-ne v0, v2, :cond_2b

    .line 823
    const/16 v2, 0x27

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "result":Ljava/lang/String;
    goto :goto_10

    .line 824
    .end local v1    # "result":Ljava/lang/String;
    :cond_2b
    const/16 v2, 0x9

    if-ne v0, v2, :cond_36

    .line 825
    const/16 v2, 0x22

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->nextQuotedValue(C)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "result":Ljava/lang/String;
    goto :goto_10

    .line 826
    .end local v1    # "result":Ljava/lang/String;
    :cond_36
    const/16 v2, 0xb

    if-ne v0, v2, :cond_40

    .line 827
    iget-object v1, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    .line 828
    .restart local v1    # "result":Ljava/lang/String;
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/google/gson/stream/JsonReader;->peekedString:Ljava/lang/String;

    goto :goto_10

    .line 829
    .end local v1    # "result":Ljava/lang/String;
    :cond_40
    const/16 v2, 0xf

    if-ne v0, v2, :cond_4b

    .line 830
    iget-wide v2, p0, Lcom/google/gson/stream/JsonReader;->peekedLong:J

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "result":Ljava/lang/String;
    goto :goto_10

    .line 831
    .end local v1    # "result":Ljava/lang/String;
    :cond_4b
    const/16 v2, 0x10

    if-ne v0, v2, :cond_62

    .line 832
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->buffer:[C

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v4, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    invoke-direct {v1, v2, v3, v4}, Ljava/lang/String;-><init>([CII)V

    .line 833
    .restart local v1    # "result":Ljava/lang/String;
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_10

    .line 835
    .end local v1    # "result":Ljava/lang/String;
    :cond_62
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected a string but was "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->peek()Lcom/google/gson/stream/JsonToken;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " at line "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 836
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " column "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " path "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/gson/stream/JsonReader;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public peek()Lcom/google/gson/stream/JsonToken;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 425
    iget v0, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 426
    .local v0, "p":I
    if-nez v0, :cond_8

    .line 427
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 430
    :cond_8
    packed-switch v0, :pswitch_data_30

    .line 459
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 432
    :pswitch_11
    sget-object v1, Lcom/google/gson/stream/JsonToken;->BEGIN_OBJECT:Lcom/google/gson/stream/JsonToken;

    .line 457
    :goto_13
    return-object v1

    .line 434
    :pswitch_14
    sget-object v1, Lcom/google/gson/stream/JsonToken;->END_OBJECT:Lcom/google/gson/stream/JsonToken;

    goto :goto_13

    .line 436
    :pswitch_17
    sget-object v1, Lcom/google/gson/stream/JsonToken;->BEGIN_ARRAY:Lcom/google/gson/stream/JsonToken;

    goto :goto_13

    .line 438
    :pswitch_1a
    sget-object v1, Lcom/google/gson/stream/JsonToken;->END_ARRAY:Lcom/google/gson/stream/JsonToken;

    goto :goto_13

    .line 442
    :pswitch_1d
    sget-object v1, Lcom/google/gson/stream/JsonToken;->NAME:Lcom/google/gson/stream/JsonToken;

    goto :goto_13

    .line 445
    :pswitch_20
    sget-object v1, Lcom/google/gson/stream/JsonToken;->BOOLEAN:Lcom/google/gson/stream/JsonToken;

    goto :goto_13

    .line 447
    :pswitch_23
    sget-object v1, Lcom/google/gson/stream/JsonToken;->NULL:Lcom/google/gson/stream/JsonToken;

    goto :goto_13

    .line 452
    :pswitch_26
    sget-object v1, Lcom/google/gson/stream/JsonToken;->STRING:Lcom/google/gson/stream/JsonToken;

    goto :goto_13

    .line 455
    :pswitch_29
    sget-object v1, Lcom/google/gson/stream/JsonToken;->NUMBER:Lcom/google/gson/stream/JsonToken;

    goto :goto_13

    .line 457
    :pswitch_2c
    sget-object v1, Lcom/google/gson/stream/JsonToken;->END_DOCUMENT:Lcom/google/gson/stream/JsonToken;

    goto :goto_13

    .line 430
    nop

    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_11
        :pswitch_14
        :pswitch_17
        :pswitch_1a
        :pswitch_20
        :pswitch_20
        :pswitch_23
        :pswitch_26
        :pswitch_26
        :pswitch_26
        :pswitch_26
        :pswitch_1d
        :pswitch_1d
        :pswitch_1d
        :pswitch_29
        :pswitch_29
        :pswitch_2c
    .end packed-switch
.end method

.method public final setLenient(Z)V
    .registers 2
    .param p1, "lenient"    # Z

    .prologue
    .line 326
    iput-boolean p1, p0, Lcom/google/gson/stream/JsonReader;->lenient:Z

    .line 327
    return-void
.end method

.method public skipValue()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x1

    .line 1231
    const/4 v0, 0x0

    .line 1233
    .local v0, "count":I
    :cond_3
    iget v1, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1234
    .local v1, "p":I
    if-nez v1, :cond_b

    .line 1235
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v1

    .line 1238
    :cond_b
    if-ne v1, v5, :cond_2e

    .line 1239
    invoke-direct {p0, v4}, Lcom/google/gson/stream/JsonReader;->push(I)V

    .line 1240
    add-int/lit8 v0, v0, 0x1

    .line 1259
    :cond_12
    :goto_12
    const/4 v2, 0x0

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1260
    if-nez v0, :cond_3

    .line 1262
    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->pathIndices:[I

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v3, v3, -0x1

    aget v4, v2, v3

    add-int/lit8 v4, v4, 0x1

    aput v4, v2, v3

    .line 1263
    iget-object v2, p0, Lcom/google/gson/stream/JsonReader;->pathNames:[Ljava/lang/String;

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v3, v3, -0x1

    const-string v4, "null"

    aput-object v4, v2, v3

    .line 1264
    return-void

    .line 1241
    :cond_2e
    if-ne v1, v4, :cond_36

    .line 1242
    invoke-direct {p0, v5}, Lcom/google/gson/stream/JsonReader;->push(I)V

    .line 1243
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 1244
    :cond_36
    const/4 v2, 0x4

    if-ne v1, v2, :cond_42

    .line 1245
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    .line 1246
    add-int/lit8 v0, v0, -0x1

    goto :goto_12

    .line 1247
    :cond_42
    const/4 v2, 0x2

    if-ne v1, v2, :cond_4e

    .line 1248
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->stackSize:I

    .line 1249
    add-int/lit8 v0, v0, -0x1

    goto :goto_12

    .line 1250
    :cond_4e
    const/16 v2, 0xe

    if-eq v1, v2, :cond_56

    const/16 v2, 0xa

    if-ne v1, v2, :cond_5a

    .line 1251
    :cond_56
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->skipUnquotedValue()V

    goto :goto_12

    .line 1252
    :cond_5a
    const/16 v2, 0x8

    if-eq v1, v2, :cond_62

    const/16 v2, 0xc

    if-ne v1, v2, :cond_68

    .line 1253
    :cond_62
    const/16 v2, 0x27

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->skipQuotedValue(C)V

    goto :goto_12

    .line 1254
    :cond_68
    const/16 v2, 0x9

    if-eq v1, v2, :cond_70

    const/16 v2, 0xd

    if-ne v1, v2, :cond_76

    .line 1255
    :cond_70
    const/16 v2, 0x22

    invoke-direct {p0, v2}, Lcom/google/gson/stream/JsonReader;->skipQuotedValue(C)V

    goto :goto_12

    .line 1256
    :cond_76
    const/16 v2, 0x10

    if-ne v1, v2, :cond_12

    .line 1257
    iget v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    iget v3, p0, Lcom/google/gson/stream/JsonReader;->peekedNumberLength:I

    add-int/2addr v2, v3

    iput v2, p0, Lcom/google/gson/stream/JsonReader;->pos:I

    goto :goto_12
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1465
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " at line "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1466
    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getLineNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " column "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0}, Lcom/google/gson/stream/JsonReader;->getColumnNumber()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
