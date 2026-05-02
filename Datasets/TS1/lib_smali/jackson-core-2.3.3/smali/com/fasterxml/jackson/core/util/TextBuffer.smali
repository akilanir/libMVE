.class public final Lcom/fasterxml/jackson/core/util/TextBuffer;
.super Ljava/lang/Object;
.source "TextBuffer.java"


# static fields
.field static final MAX_SEGMENT_LEN:I = 0x40000

.field static final MIN_SEGMENT_LEN:I = 0x3e8

.field static final NO_CHARS:[C


# instance fields
.field private final _allocator:Lcom/fasterxml/jackson/core/util/BufferRecycler;

.field private _currentSegment:[C

.field private _currentSize:I

.field private _hasSegments:Z

.field private _inputBuffer:[C

.field private _inputLen:I

.field private _inputStart:I

.field private _resultArray:[C

.field private _resultString:Ljava/lang/String;

.field private _segmentSize:I

.field private _segments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<[C>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const/4 v0, 0x0

    new-array v0, v0, [C

    sput-object v0, Lcom/fasterxml/jackson/core/util/TextBuffer;->NO_CHARS:[C

    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/util/BufferRecycler;)V
    .registers 3

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    .line 121
    iput-object p1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_allocator:Lcom/fasterxml/jackson/core/util/BufferRecycler;

    .line 122
    return-void
.end method

.method private buf(I)[C
    .registers 4

    .prologue
    .line 233
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_allocator:Lcom/fasterxml/jackson/core/util/BufferRecycler;

    if-eqz v0, :cond_d

    .line 234
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_allocator:Lcom/fasterxml/jackson/core/util/BufferRecycler;

    sget-object v1, Lcom/fasterxml/jackson/core/util/BufferRecycler$CharBufferType;->TEXT_BUFFER:Lcom/fasterxml/jackson/core/util/BufferRecycler$CharBufferType;

    invoke-virtual {v0, v1, p1}, Lcom/fasterxml/jackson/core/util/BufferRecycler;->allocCharBuffer(Lcom/fasterxml/jackson/core/util/BufferRecycler$CharBufferType;I)[C

    move-result-object v0

    .line 236
    :goto_c
    return-object v0

    :cond_d
    const/16 v0, 0x3e8

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    new-array v0, v0, [C

    goto :goto_c
.end method

.method private carr(I)[C
    .registers 3

    .prologue
    .line 703
    new-array v0, p1, [C

    return-object v0
.end method

.method private clearSegments()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 241
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    .line 249
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 250
    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 251
    return-void
.end method

.method private expand(I)V
    .registers 5

    .prologue
    .line 650
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 651
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    .line 653
    :cond_b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 654
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    .line 655
    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 656
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    array-length v2, v0

    add-int/2addr v1, v2

    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    .line 657
    array-length v1, v0

    .line 659
    shr-int/lit8 v0, v1, 0x1

    .line 660
    if-ge v0, p1, :cond_31

    .line 663
    :goto_20
    const/4 v0, 0x0

    iput v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 664
    const/high16 v0, 0x40000

    add-int/2addr v1, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->carr(I)[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 665
    return-void

    :cond_31
    move p1, v0

    goto :goto_20
.end method

.method private resultArray()[C
    .registers 8

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 669
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    if-eqz v0, :cond_d

    .line 670
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 700
    :goto_c
    return-object v0

    .line 673
    :cond_d
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_2b

    .line 674
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    .line 675
    if-ge v0, v1, :cond_18

    .line 676
    sget-object v0, Lcom/fasterxml/jackson/core/util/TextBuffer;->NO_CHARS:[C

    goto :goto_c

    .line 678
    :cond_18
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    .line 679
    if-nez v1, :cond_23

    .line 680
    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    invoke-static {v1, v0}, Lcom/fasterxml/jackson/core/util/ArraysCompat;->copyOf([CI)[C

    move-result-object v0

    goto :goto_c

    .line 682
    :cond_23
    iget-object v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    add-int/2addr v0, v1

    invoke-static {v2, v1, v0}, Lcom/fasterxml/jackson/core/util/ArraysCompat;->copyOfRange([CII)[C

    move-result-object v0

    goto :goto_c

    .line 685
    :cond_2b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v0

    .line 686
    if-ge v0, v1, :cond_34

    .line 687
    sget-object v0, Lcom/fasterxml/jackson/core/util/TextBuffer;->NO_CHARS:[C

    goto :goto_c

    .line 690
    :cond_34
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->carr(I)[C

    move-result-object v3

    .line 691
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    if-eqz v0, :cond_63

    .line 692
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v4, v2

    move v1, v2

    :goto_44
    if-ge v4, v5, :cond_59

    .line 693
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    check-cast v0, [C

    .line 694
    array-length v6, v0

    .line 695
    invoke-static {v0, v2, v3, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 696
    add-int/2addr v1, v6

    .line 692
    add-int/lit8 v0, v4, 0x1

    move v4, v0

    goto :goto_44

    :cond_59
    move v0, v1

    .line 699
    :goto_5a
    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    iget v4, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    invoke-static {v1, v2, v3, v0, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v3

    .line 700
    goto :goto_c

    :cond_63
    move v0, v2

    goto :goto_5a
.end method

.method private unshare(I)V
    .registers 8

    .prologue
    const/4 v5, 0x0

    .line 624
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    .line 625
    iput v5, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    .line 626
    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    .line 627
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    .line 628
    iget v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    .line 629
    const/4 v3, -0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    .line 632
    add-int v3, v0, p1

    .line 633
    iget-object v4, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    if-eqz v4, :cond_1a

    iget-object v4, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    array-length v4, v4

    if-le v3, v4, :cond_20

    .line 634
    :cond_1a
    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->buf(I)[C

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 636
    :cond_20
    if-lez v0, :cond_27

    .line 637
    iget-object v3, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    invoke-static {v1, v2, v3, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 639
    :cond_27
    iput v5, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    .line 640
    iput v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 641
    return-void
.end method


# virtual methods
.method public append(C)V
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 412
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_a

    .line 413
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->unshare(I)V

    .line 415
    :cond_a
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    .line 416
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 418
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 419
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    array-length v2, v0

    if-lt v1, v2, :cond_1b

    .line 420
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expand(I)V

    .line 421
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 423
    :cond_1b
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    aput-char p1, v0, v1

    .line 424
    return-void
.end method

.method public append(Ljava/lang/String;II)V
    .registers 8

    .prologue
    const/4 v1, 0x0

    .line 467
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_8

    .line 468
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->unshare(I)V

    .line 470
    :cond_8
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    .line 471
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 474
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 475
    array-length v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    sub-int/2addr v1, v2

    .line 476
    if-lt v1, p3, :cond_21

    .line 477
    add-int v1, p2, p3

    iget v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    invoke-virtual {p1, p2, v1, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 478
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 499
    :goto_20
    return-void

    .line 482
    :cond_21
    if-lez v1, :cond_2c

    .line 483
    add-int v2, p2, v1

    iget v3, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    invoke-virtual {p1, p2, v2, v0, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 484
    sub-int/2addr p3, v1

    .line 485
    add-int/2addr p2, v1

    .line 492
    :cond_2c
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expand(I)V

    .line 493
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    array-length v0, v0

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 494
    add-int v1, p2, v0

    iget-object v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    const/4 v3, 0x0

    invoke-virtual {p1, p2, v1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 495
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 496
    add-int/2addr p2, v0

    .line 497
    sub-int/2addr p3, v0

    .line 498
    if-gtz p3, :cond_2c

    goto :goto_20
.end method

.method public append([CII)V
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 429
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_8

    .line 430
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->unshare(I)V

    .line 432
    :cond_8
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    .line 433
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 436
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 437
    array-length v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    sub-int/2addr v1, v2

    .line 439
    if-lt v1, p3, :cond_1f

    .line 440
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 441
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 462
    :goto_1e
    return-void

    .line 445
    :cond_1f
    if-lez v1, :cond_28

    .line 446
    iget v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    invoke-static {p1, p2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 447
    add-int/2addr p2, v1

    .line 448
    sub-int/2addr p3, v1

    .line 455
    :cond_28
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expand(I)V

    .line 456
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    array-length v0, v0

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 457
    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    const/4 v2, 0x0

    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 458
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 459
    add-int/2addr p2, v0

    .line 460
    sub-int/2addr p3, v0

    .line 461
    if-gtz p3, :cond_28

    goto :goto_1e
.end method

.method public contentsAsArray()[C
    .registers 2

    .prologue
    .line 357
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 358
    if-nez v0, :cond_a

    .line 359
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resultArray()[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 361
    :cond_a
    return-object v0
.end method

.method public contentsAsDecimal()Ljava/math/BigDecimal;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 371
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    if-eqz v0, :cond_b

    .line 372
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseBigDecimal([C)Ljava/math/BigDecimal;

    move-result-object v0

    .line 383
    :goto_a
    return-object v0

    .line 375
    :cond_b
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_1e

    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    if-eqz v0, :cond_1e

    .line 376
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    iget v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseBigDecimal([CII)Ljava/math/BigDecimal;

    move-result-object v0

    goto :goto_a

    .line 379
    :cond_1e
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    if-nez v0, :cond_30

    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    if-eqz v0, :cond_30

    .line 380
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    const/4 v1, 0x0

    iget v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    invoke-static {v0, v1, v2}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseBigDecimal([CII)Ljava/math/BigDecimal;

    move-result-object v0

    goto :goto_a

    .line 383
    :cond_30
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsArray()[C

    move-result-object v0

    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseBigDecimal([C)Ljava/math/BigDecimal;

    move-result-object v0

    goto :goto_a
.end method

.method public contentsAsDouble()D
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    .line 391
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/NumberInput;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method public contentsAsString()Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 319
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    if-nez v0, :cond_12

    .line 321
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    if-eqz v0, :cond_15

    .line 322
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    .line 353
    :cond_12
    :goto_12
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    :goto_14
    return-object v0

    .line 325
    :cond_15
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_31

    .line 326
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_23

    .line 327
    const-string v0, ""

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    goto :goto_14

    .line 329
    :cond_23
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    iget v3, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    goto :goto_12

    .line 332
    :cond_31
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    .line 333
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 335
    if-nez v0, :cond_46

    .line 336
    if-nez v1, :cond_3e

    const-string v0, ""

    :goto_3b
    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    goto :goto_12

    :cond_3e
    new-instance v0, Ljava/lang/String;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    invoke-direct {v0, v3, v2, v1}, Ljava/lang/String;-><init>([CII)V

    goto :goto_3b

    .line 338
    :cond_46
    new-instance v3, Ljava/lang/StringBuilder;

    add-int/2addr v0, v1

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 340
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    if-eqz v0, :cond_69

    .line 341
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v1, v2

    :goto_57
    if-ge v1, v4, :cond_69

    .line 342
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [C

    .line 343
    array-length v5, v0

    invoke-virtual {v3, v0, v2, v5}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 341
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_57

    .line 347
    :cond_69
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    invoke-virtual {v3, v0, v2, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 348
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    goto :goto_12
.end method

.method public emptyAndGetCurrentSegment()[C
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 530
    const/4 v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    .line 531
    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 532
    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    .line 534
    iput-object v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    .line 535
    iput-object v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    .line 536
    iput-object v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 539
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    if-eqz v0, :cond_16

    .line 540
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->clearSegments()V

    .line 542
    :cond_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 543
    if-nez v0, :cond_20

    .line 544
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->buf(I)[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 546
    :cond_20
    return-object v0
.end method

.method public ensureNotShared()V
    .registers 2

    .prologue
    .line 405
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_9

    .line 406
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->unshare(I)V

    .line 408
    :cond_9
    return-void
.end method

.method public expandCurrentSegment()[C
    .registers 5

    .prologue
    const/high16 v3, 0x40000

    .line 575
    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 577
    array-length v0, v1

    .line 579
    if-ne v0, v3, :cond_11

    const v0, 0x40001

    .line 580
    :goto_a
    invoke-static {v1, v0}, Lcom/fasterxml/jackson/core/util/ArraysCompat;->copyOf([CI)[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    return-object v0

    .line 579
    :cond_11
    shr-int/lit8 v2, v0, 0x1

    add-int/2addr v0, v2

    invoke-static {v3, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_a
.end method

.method public expandCurrentSegment(I)[C
    .registers 4

    .prologue
    .line 593
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 594
    array-length v1, v0

    if-lt v1, p1, :cond_6

    .line 596
    :goto_5
    return-object v0

    .line 595
    :cond_6
    invoke-static {v0, p1}, Lcom/fasterxml/jackson/core/util/ArraysCompat;->copyOf([CI)[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    goto :goto_5
.end method

.method public finishCurrentSegment()[C
    .registers 3

    .prologue
    .line 553
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 554
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    .line 556
    :cond_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    .line 557
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 558
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    array-length v0, v0

    .line 559
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    .line 561
    shr-int/lit8 v1, v0, 0x1

    add-int/2addr v0, v1

    const/high16 v1, 0x40000

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 562
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->carr(I)[C

    move-result-object v0

    .line 563
    const/4 v1, 0x0

    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 564
    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 565
    return-object v0
.end method

.method public getCurrentSegment()[C
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 513
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_b

    .line 514
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->unshare(I)V

    .line 524
    :cond_8
    :goto_8
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    return-object v0

    .line 516
    :cond_b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 517
    if-nez v0, :cond_17

    .line 518
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->buf(I)[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    goto :goto_8

    .line 519
    :cond_17
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    array-length v0, v0

    if-lt v1, v0, :cond_8

    .line 521
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expand(I)V

    goto :goto_8
.end method

.method public getCurrentSegmentSize()I
    .registers 2

    .prologue
    .line 549
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    return v0
.end method

.method public getTextBuffer()[C
    .registers 2

    .prologue
    .line 300
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_7

    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    .line 308
    :goto_6
    return-object v0

    .line 301
    :cond_7
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    goto :goto_6

    .line 302
    :cond_e
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    if-eqz v0, :cond_1b

    .line 303
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    goto :goto_6

    .line 306
    :cond_1b
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    if-nez v0, :cond_22

    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    goto :goto_6

    .line 308
    :cond_22
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsArray()[C

    move-result-object v0

    goto :goto_6
.end method

.method public getTextOffset()I
    .registers 2

    .prologue
    .line 281
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_7

    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public hasTextAsCharacters()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 291
    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-gez v1, :cond_9

    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    if-eqz v1, :cond_a

    .line 294
    :cond_9
    :goto_9
    return v0

    .line 293
    :cond_a
    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    if-eqz v1, :cond_9

    const/4 v0, 0x0

    goto :goto_9
.end method

.method public releaseBuffers()V
    .registers 4

    .prologue
    .line 135
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_allocator:Lcom/fasterxml/jackson/core/util/BufferRecycler;

    if-nez v0, :cond_8

    .line 136
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithEmpty()V

    .line 147
    :cond_7
    :goto_7
    return-void

    .line 138
    :cond_8
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    if-eqz v0, :cond_7

    .line 140
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithEmpty()V

    .line 142
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 143
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    .line 144
    iget-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_allocator:Lcom/fasterxml/jackson/core/util/BufferRecycler;

    sget-object v2, Lcom/fasterxml/jackson/core/util/BufferRecycler$CharBufferType;->TEXT_BUFFER:Lcom/fasterxml/jackson/core/util/BufferRecycler$CharBufferType;

    invoke-virtual {v1, v2, v0}, Lcom/fasterxml/jackson/core/util/BufferRecycler;->releaseCharBuffer(Lcom/fasterxml/jackson/core/util/BufferRecycler$CharBufferType;[C)V

    goto :goto_7
.end method

.method public resetWithCopy([CII)V
    .registers 7

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 194
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    .line 195
    const/4 v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    .line 196
    iput v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    .line 198
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    .line 199
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 202
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    if-eqz v0, :cond_1c

    .line 203
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->clearSegments()V

    .line 207
    :cond_14
    :goto_14
    iput v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    iput v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 208
    invoke-virtual {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->append([CII)V

    .line 209
    return-void

    .line 204
    :cond_1c
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    if-nez v0, :cond_14

    .line 205
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->buf(I)[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSegment:[C

    goto :goto_14
.end method

.method public resetWithEmpty()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 155
    const/4 v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    .line 156
    iput v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 157
    iput v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    .line 159
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    .line 160
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    .line 161
    iput-object v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 164
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    if-eqz v0, :cond_16

    .line 165
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->clearSegments()V

    .line 167
    :cond_16
    return-void
.end method

.method public resetWithShared([CII)V
    .registers 5

    .prologue
    const/4 v0, 0x0

    .line 178
    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    .line 179
    iput-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 182
    iput-object p1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    .line 183
    iput p2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    .line 184
    iput p3, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    .line 187
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    if-eqz v0, :cond_12

    .line 188
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->clearSegments()V

    .line 190
    :cond_12
    return-void
.end method

.method public resetWithString(Ljava/lang/String;)V
    .registers 5

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 213
    iput-object v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputBuffer:[C

    .line 214
    const/4 v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    .line 215
    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    .line 217
    iput-object p1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    .line 218
    iput-object v2, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    .line 220
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_hasSegments:Z

    if-eqz v0, :cond_14

    .line 221
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->clearSegments()V

    .line 223
    :cond_14
    iput v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    .line 225
    return-void
.end method

.method public setCurrentLength(I)V
    .registers 2

    .prologue
    .line 550
    iput p1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    return-void
.end method

.method public size()I
    .registers 3

    .prologue
    .line 263
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputStart:I

    if-ltz v0, :cond_7

    .line 264
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_inputLen:I

    .line 273
    :goto_6
    return v0

    .line 266
    :cond_7
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    if-eqz v0, :cond_f

    .line 267
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultArray:[C

    array-length v0, v0

    goto :goto_6

    .line 269
    :cond_f
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    if-eqz v0, :cond_1a

    .line 270
    iget-object v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_resultString:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_6

    .line 273
    :cond_1a
    iget v0, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_segmentSize:I

    iget v1, p0, Lcom/fasterxml/jackson/core/util/TextBuffer;->_currentSize:I

    add-int/2addr v0, v1

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 610
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
