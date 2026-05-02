.class final Lcom/google/android/exoplayer/extractor/webm/Sniffer;
.super Ljava/lang/Object;
.source "Sniffer.java"


# static fields
.field private static final ID_EBML:I = 0x1a45dfa3

.field private static final SEARCH_LENGTH:I = 0x400


# instance fields
.field private peekLength:I

.field private final scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 42
    return-void
.end method

.method private readUint(Lcom/google/android/exoplayer/extractor/ExtractorInput;)J
    .registers 9
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 94
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v4, v4, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-interface {p1, v4, v5, v6}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 95
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v4, v4, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    aget-byte v4, v4, v5

    and-int/lit16 v3, v4, 0xff

    .line 96
    .local v3, "value":I
    if-nez v3, :cond_16

    .line 97
    const-wide/high16 v4, -0x8000000000000000L

    .line 112
    :goto_15
    return-wide v4

    .line 99
    :cond_16
    const/16 v2, 0x80

    .line 100
    .local v2, "mask":I
    const/4 v1, 0x0

    .line 101
    .local v1, "length":I
    :goto_19
    and-int v4, v3, v2

    if-nez v4, :cond_22

    .line 102
    shr-int/lit8 v2, v2, 0x1

    .line 103
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 105
    :cond_22
    xor-int/lit8 v4, v2, -0x1

    and-int/2addr v3, v4

    .line 106
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v4, v4, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-interface {p1, v4, v6, v1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 107
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2d
    if-ge v0, v1, :cond_3f

    .line 108
    shl-int/lit8 v3, v3, 0x8

    .line 109
    iget-object v4, p0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v4, v4, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    add-int/lit8 v5, v0, 0x1

    aget-byte v4, v4, v5

    and-int/lit16 v4, v4, 0xff

    add-int/2addr v3, v4

    .line 107
    add-int/lit8 v0, v0, 0x1

    goto :goto_2d

    .line 111
    :cond_3f
    iget v4, p0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    add-int/lit8 v5, v1, 0x1

    add-int/2addr v4, v5

    iput v4, p0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    .line 112
    int-to-long v4, v3

    goto :goto_15
.end method


# virtual methods
.method public sniff(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 23
    .param p1, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-interface/range {p1 .. p1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v11

    .line 49
    .local v11, "inputLength":J
    const-wide/16 v17, -0x1

    cmp-long v17, v11, v17

    if-eqz v17, :cond_10

    const-wide/16 v17, 0x400

    cmp-long v17, v11, v17

    if-lez v17, :cond_5e

    :cond_10
    const-wide/16 v17, 0x400

    :goto_12
    move-wide/from16 v0, v17

    long-to-int v4, v0

    .line 52
    .local v4, "bytesToSearch":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const/16 v19, 0x4

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 53
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v15

    .line 54
    .local v15, "tag":J
    const/16 v17, 0x4

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    .line 55
    :goto_42
    const-wide/32 v17, 0x1a45dfa3

    cmp-long v17, v15, v17

    if-eqz v17, :cond_a2

    .line 56
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    move/from16 v0, v17

    if-ne v0, v4, :cond_61

    .line 57
    const/16 v17, 0x0

    .line 87
    :goto_5d
    return v17

    .end local v4    # "bytesToSearch":I
    .end local v15    # "tag":J
    :cond_5e
    move-wide/from16 v17, v11

    .line 49
    goto :goto_12

    .line 59
    .restart local v4    # "bytesToSearch":I
    .restart local v15    # "tag":J
    :cond_61
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const/16 v19, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v19

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 60
    const/16 v17, 0x8

    shl-long v17, v15, v17

    const-wide/16 v19, -0x100

    and-long v15, v17, v19

    .line 61
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->scratch:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v17, v0

    const/16 v18, 0x0

    aget-byte v17, v17, v18

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0xff

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v17, v0

    or-long v15, v15, v17

    goto :goto_42

    .line 65
    :cond_a2
    invoke-direct/range {p0 .. p1}, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->readUint(Lcom/google/android/exoplayer/extractor/ExtractorInput;)J

    move-result-wide v5

    .line 66
    .local v5, "headerSize":J
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v7, v0

    .line 67
    .local v7, "headerStart":J
    const-wide/high16 v17, -0x8000000000000000L

    cmp-long v17, v5, v17

    if-eqz v17, :cond_c1

    const-wide/16 v17, -0x1

    cmp-long v17, v11, v17

    if-eqz v17, :cond_ec

    add-long v17, v7, v5

    cmp-long v17, v17, v11

    if-ltz v17, :cond_ec

    .line 69
    :cond_c1
    const/16 v17, 0x0

    goto :goto_5d

    .line 82
    .local v9, "id":J
    .local v13, "size":J
    :cond_c4
    const-wide/16 v17, 0x0

    cmp-long v17, v13, v17

    if-eqz v17, :cond_ec

    .line 83
    long-to-int v0, v13

    move/from16 v17, v0

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->advancePeekPosition(I)V

    .line 84
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v17, v0

    add-long v17, v17, v13

    move-wide/from16 v0, v17

    long-to-int v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    .line 73
    .end local v9    # "id":J
    .end local v13    # "size":J
    :cond_ec
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v17, v0

    add-long v19, v7, v5

    cmp-long v17, v17, v19

    if-gez v17, :cond_120

    .line 74
    invoke-direct/range {p0 .. p1}, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->readUint(Lcom/google/android/exoplayer/extractor/ExtractorInput;)J

    move-result-wide v9

    .line 75
    .restart local v9    # "id":J
    const-wide/high16 v17, -0x8000000000000000L

    cmp-long v17, v9, v17

    if-nez v17, :cond_10b

    .line 76
    const/16 v17, 0x0

    goto/16 :goto_5d

    .line 78
    :cond_10b
    invoke-direct/range {p0 .. p1}, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->readUint(Lcom/google/android/exoplayer/extractor/ExtractorInput;)J

    move-result-wide v13

    .line 79
    .restart local v13    # "size":J
    const-wide/16 v17, 0x0

    cmp-long v17, v13, v17

    if-ltz v17, :cond_11c

    const-wide/32 v17, 0x7fffffff

    cmp-long v17, v13, v17

    if-lez v17, :cond_c4

    .line 80
    :cond_11c
    const/16 v17, 0x0

    goto/16 :goto_5d

    .line 87
    .end local v9    # "id":J
    .end local v13    # "size":J
    :cond_120
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/extractor/webm/Sniffer;->peekLength:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v17, v0

    add-long v19, v7, v5

    cmp-long v17, v17, v19

    if-nez v17, :cond_135

    const/16 v17, 0x1

    goto/16 :goto_5d

    :cond_135
    const/16 v17, 0x0

    goto/16 :goto_5d
.end method
