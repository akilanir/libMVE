.class final Lcom/google/android/exoplayer/extractor/mp4/Sniffer;
.super Ljava/lang/Object;
.source "Sniffer.java"


# static fields
.field private static final COMPATIBLE_BRANDS:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 31
    const/16 v0, 0x14

    new-array v0, v0, [I

    const/4 v1, 0x0

    const-string v2, "isom"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "iso2"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "avc1"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "hvc1"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "hev1"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "mp41"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "mp42"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "3g2a"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "3g2b"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "3gr6"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "3gs6"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "3ge6"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "3gg6"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "M4V "

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "M4A "

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "f4v "

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "kddi"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "M4VP"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "qt  "

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "MSNV"

    invoke-static {v2}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    sput-object v0, Lcom/google/android/exoplayer/extractor/mp4/Sniffer;->COMPATIBLE_BRANDS:[I

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    return-void
.end method

.method private static isCompatibleBrand(I)Z
    .registers 8
    .param p0, "brand"    # I

    .prologue
    const/4 v4, 0x1

    .line 149
    ushr-int/lit8 v5, p0, 0x8

    const-string v6, "3gp"

    invoke-static {v6}, Lcom/google/android/exoplayer/util/Util;->getIntegerCodeForString(Ljava/lang/String;)I

    move-result v6

    if-ne v5, v6, :cond_c

    .line 157
    :cond_b
    :goto_b
    return v4

    .line 152
    :cond_c
    sget-object v0, Lcom/google/android/exoplayer/extractor/mp4/Sniffer;->COMPATIBLE_BRANDS:[I

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_10
    if-ge v2, v3, :cond_19

    aget v1, v0, v2

    .line 153
    .local v1, "compatibleBrand":I
    if-eq v1, p0, :cond_b

    .line 152
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 157
    .end local v1    # "compatibleBrand":I
    :cond_19
    const/4 v4, 0x0

    goto :goto_b
.end method

.method public static sniffFragmented(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 3
    .param p0, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 65
    const/16 v0, 0x1000

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Sniffer;->sniffInternal(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)Z

    move-result v0

    return v0
.end method

.method private static sniffInternal(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)Z
    .registers 25
    .param p0, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .param p1, "searchLength"    # I
    .param p2, "fragmented"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-interface/range {p0 .. p0}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->getLength()J

    move-result-wide v16

    .line 85
    .local v16, "inputLength":J
    const-wide/16 v18, -0x1

    cmp-long v18, v16, v18

    if-eqz v18, :cond_13

    move/from16 v0, p1

    int-to-long v0, v0

    move-wide/from16 v18, v0

    cmp-long v18, v16, v18

    if-lez v18, :cond_18

    :cond_13
    move/from16 v0, p1

    int-to-long v0, v0

    move-wide/from16 v16, v0

    .end local v16    # "inputLength":J
    :cond_18
    move-wide/from16 v0, v16

    long-to-int v10, v0

    .line 88
    .local v10, "bytesToSearch":I
    new-instance v8, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/16 v18, 0x40

    move/from16 v0, v18

    invoke-direct {v8, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    .line 89
    .local v8, "buffer":Lcom/google/android/exoplayer/util/ParsableByteArray;
    const/4 v9, 0x0

    .line 90
    .local v9, "bytesSearched":I
    const/4 v13, 0x0

    .line 91
    .local v13, "foundGoodFileType":Z
    const/4 v12, 0x0

    .line 92
    .local v12, "foundFragment":Z
    :goto_27
    if-ge v9, v10, :cond_c2

    .line 94
    const/16 v14, 0x8

    .line 95
    .local v14, "headerSize":I
    iget-object v0, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v18, v0

    const/16 v19, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-interface {v0, v1, v2, v14}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 96
    const/16 v18, 0x0

    move/from16 v0, v18

    invoke-virtual {v8, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 97
    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v5

    .line 98
    .local v5, "atomSize":J
    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    .line 99
    .local v7, "atomType":I
    const-wide/16 v18, 0x1

    cmp-long v18, v5, v18

    if-nez v18, :cond_64

    .line 100
    iget-object v0, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v18, v0

    const/16 v19, 0x8

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-interface {v0, v1, v14, v2}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 101
    const/16 v14, 0x10

    .line 102
    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLong()J

    move-result-wide v5

    .line 105
    :cond_64
    int-to-long v0, v14

    move-wide/from16 v18, v0

    cmp-long v18, v5, v18

    if-gez v18, :cond_6e

    .line 106
    const/16 v18, 0x0

    .line 141
    .end local v5    # "atomSize":J
    .end local v7    # "atomType":I
    .end local v14    # "headerSize":I
    :goto_6d
    return v18

    .line 108
    .restart local v5    # "atomSize":J
    .restart local v7    # "atomType":I
    .restart local v14    # "headerSize":I
    :cond_6e
    long-to-int v0, v5

    move/from16 v18, v0

    sub-int v4, v18, v14

    .line 109
    .local v4, "atomDataSize":I
    sget v18, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_ftyp:I

    move/from16 v0, v18

    if-ne v7, v0, :cond_bb

    .line 110
    const/16 v18, 0x8

    move/from16 v0, v18

    if-ge v4, v0, :cond_82

    .line 111
    const/16 v18, 0x0

    goto :goto_6d

    .line 113
    :cond_82
    add-int/lit8 v18, v4, -0x8

    div-int/lit8 v11, v18, 0x4

    .line 114
    .local v11, "compatibleBrandsCount":I
    iget-object v0, v8, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    move-object/from16 v18, v0

    const/16 v19, 0x0

    add-int/lit8 v20, v11, 0x2

    mul-int/lit8 v20, v20, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-interface {v0, v1, v2, v3}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->peekFully([BII)V

    .line 115
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_9c
    add-int/lit8 v18, v11, 0x2

    move/from16 v0, v18

    if-ge v15, v0, :cond_b6

    .line 116
    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v15, v0, :cond_ab

    .line 115
    :cond_a8
    add-int/lit8 v15, v15, 0x1

    goto :goto_9c

    .line 120
    :cond_ab
    invoke-virtual {v8}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v18

    invoke-static/range {v18 .. v18}, Lcom/google/android/exoplayer/extractor/mp4/Sniffer;->isCompatibleBrand(I)Z

    move-result v18

    if-eqz v18, :cond_a8

    .line 121
    const/4 v13, 0x1

    .line 126
    :cond_b6
    if-nez v13, :cond_de

    .line 127
    const/16 v18, 0x0

    goto :goto_6d

    .line 129
    .end local v11    # "compatibleBrandsCount":I
    .end local v15    # "i":I
    :cond_bb
    sget v18, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_moof:I

    move/from16 v0, v18

    if-ne v7, v0, :cond_cb

    .line 130
    const/4 v12, 0x1

    .line 141
    .end local v4    # "atomDataSize":I
    .end local v5    # "atomSize":J
    .end local v7    # "atomType":I
    .end local v14    # "headerSize":I
    :cond_c2
    if-eqz v13, :cond_e8

    move/from16 v0, p2

    if-ne v0, v12, :cond_e8

    const/16 v18, 0x1

    goto :goto_6d

    .line 132
    .restart local v4    # "atomDataSize":I
    .restart local v5    # "atomSize":J
    .restart local v7    # "atomType":I
    .restart local v14    # "headerSize":I
    :cond_cb
    if-eqz v4, :cond_de

    .line 134
    int-to-long v0, v9

    move-wide/from16 v18, v0

    add-long v18, v18, v5

    int-to-long v0, v10

    move-wide/from16 v20, v0

    cmp-long v18, v18, v20

    if-gez v18, :cond_c2

    .line 137
    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Lcom/google/android/exoplayer/extractor/ExtractorInput;->advancePeekPosition(I)V

    .line 139
    :cond_de
    int-to-long v0, v9

    move-wide/from16 v18, v0

    add-long v18, v18, v5

    move-wide/from16 v0, v18

    long-to-int v9, v0

    .line 140
    goto/16 :goto_27

    .line 141
    .end local v4    # "atomDataSize":I
    .end local v5    # "atomSize":J
    .end local v7    # "atomType":I
    .end local v14    # "headerSize":I
    :cond_e8
    const/16 v18, 0x0

    goto :goto_6d
.end method

.method public static sniffUnfragmented(Lcom/google/android/exoplayer/extractor/ExtractorInput;)Z
    .registers 3
    .param p0, "input"    # Lcom/google/android/exoplayer/extractor/ExtractorInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 79
    const/16 v0, 0x80

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/google/android/exoplayer/extractor/mp4/Sniffer;->sniffInternal(Lcom/google/android/exoplayer/extractor/ExtractorInput;IZ)Z

    move-result v0

    return v0
.end method
