.class public Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;
.super Lcom/fasterxml/jackson/core/base/ParserBase;
.source "ReaderBasedJsonParser.java"


# static fields
.field protected static final _icLatin1:[I


# instance fields
.field protected _bufferRecyclable:Z

.field protected final _hashSeed:I

.field protected _inputBuffer:[C

.field protected _nameStartCol:I

.field protected _nameStartOffset:J

.field protected _nameStartRow:I

.field protected _objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

.field protected _reader:Ljava/io/Reader;

.field protected final _symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

.field protected _tokenIncomplete:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 24
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeLatin1()[I

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_icLatin1:[I

    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILjava/io/Reader;Lcom/fasterxml/jackson/core/ObjectCodec;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;)V
    .registers 8
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/core/io/IOContext;
    .param p2, "features"    # I
    .param p3, "r"    # Ljava/io/Reader;
    .param p4, "codec"    # Lcom/fasterxml/jackson/core/ObjectCodec;
    .param p5, "st"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .prologue
    const/4 v1, 0x0

    .line 134
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/base/ParserBase;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;I)V

    .line 135
    iput-object p3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reader:Ljava/io/Reader;

    .line 136
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocTokenBuffer()[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    .line 137
    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 138
    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 139
    iput-object p4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    .line 140
    iput-object p5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .line 141
    invoke-virtual {p5}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->hashSeed()I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_hashSeed:I

    .line 142
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_bufferRecyclable:Z

    .line 143
    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILjava/io/Reader;Lcom/fasterxml/jackson/core/ObjectCodec;Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;[CIIZ)V
    .registers 11
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/core/io/IOContext;
    .param p2, "features"    # I
    .param p3, "r"    # Ljava/io/Reader;
    .param p4, "codec"    # Lcom/fasterxml/jackson/core/ObjectCodec;
    .param p5, "st"    # Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;
    .param p6, "inputBuffer"    # [C
    .param p7, "start"    # I
    .param p8, "end"    # I
    .param p9, "bufferRecyclable"    # Z

    .prologue
    .line 116
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/base/ParserBase;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;I)V

    .line 117
    iput-object p3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reader:Ljava/io/Reader;

    .line 118
    iput-object p6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    .line 119
    iput p7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 120
    iput p8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 121
    iput-object p4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    .line 122
    iput-object p5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    .line 123
    invoke-virtual {p5}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->hashSeed()I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_hashSeed:I

    .line 124
    iput-boolean p9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_bufferRecyclable:Z

    .line 125
    return-void
.end method

.method private _handleOddName2(II[I)Ljava/lang/String;
    .registers 18
    .param p1, "startPtr"    # I
    .param p2, "hash"    # I
    .param p3, "codes"    # [I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1870
    iget-object v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v13, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    sub-int/2addr v13, p1

    invoke-virtual {v11, v12, p1, v13}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithShared([CII)V

    .line 1871
    iget-object v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v11}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegment()[C

    move-result-object v6

    .line 1872
    .local v6, "outBuf":[C
    iget-object v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v11}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v7

    .line 1873
    .local v7, "outPtr":I
    move-object/from16 v0, p3

    array-length v5, v0

    .line 1876
    .local v5, "maxCode":I
    :goto_19
    iget v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v12, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v11, v12, :cond_41

    .line 1877
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v11

    if-nez v11, :cond_41

    .line 1901
    :cond_25
    :goto_25
    iget-object v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v11, v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1903
    iget-object v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    .line 1904
    .local v10, "tb":Lcom/fasterxml/jackson/core/util/TextBuffer;
    invoke-virtual {v10}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextBuffer()[C

    move-result-object v1

    .line 1905
    .local v1, "buf":[C
    invoke-virtual {v10}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextOffset()I

    move-result v9

    .line 1906
    .local v9, "start":I
    invoke-virtual {v10}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v4

    .line 1908
    .local v4, "len":I
    iget-object v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    move/from16 v0, p2

    invoke-virtual {v11, v1, v9, v4, v0}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->findSymbol([CIII)Ljava/lang/String;

    move-result-object v11

    return-object v11

    .line 1881
    .end local v1    # "buf":[C
    .end local v4    # "len":I
    .end local v9    # "start":I
    .end local v10    # "tb":Lcom/fasterxml/jackson/core/util/TextBuffer;
    :cond_41
    iget-object v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v12, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v2, v11, v12

    .line 1882
    .local v2, "c":C
    move v3, v2

    .line 1883
    .local v3, "i":I
    if-gt v3, v5, :cond_67

    .line 1884
    aget v11, p3, v3

    if-nez v11, :cond_25

    .line 1890
    :cond_4e
    iget v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v11, v11, 0x1

    iput v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1891
    mul-int/lit8 v11, p2, 0x21

    add-int p2, v11, v3

    .line 1893
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "outPtr":I
    .local v8, "outPtr":I
    aput-char v2, v6, v7

    .line 1896
    array-length v11, v6

    if-lt v8, v11, :cond_6e

    .line 1897
    iget-object v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v11}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v6

    .line 1898
    const/4 v7, 0x0

    .end local v8    # "outPtr":I
    .restart local v7    # "outPtr":I
    goto :goto_19

    .line 1887
    :cond_67
    invoke-static {v2}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v11

    if-nez v11, :cond_4e

    goto :goto_25

    .end local v7    # "outPtr":I
    .restart local v8    # "outPtr":I
    :cond_6e
    move v7, v8

    .end local v8    # "outPtr":I
    .restart local v7    # "outPtr":I
    goto :goto_19
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

    .line 932
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 933
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 935
    sparse-switch p1, :sswitch_data_50

    .line 974
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleOddValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 975
    :goto_11
    return-void

    .line 937
    :sswitch_12
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 938
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_11

    .line 941
    :sswitch_19
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_11

    .line 944
    :sswitch_1e
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_11

    .line 947
    :sswitch_23
    const-string v0, "true"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 948
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_11

    .line 951
    :sswitch_2d
    const-string v0, "false"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 952
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_11

    .line 955
    :sswitch_37
    const-string v0, "null"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 956
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_11

    .line 959
    :sswitch_41
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_11

    .line 971
    :sswitch_48
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_11

    .line 935
    nop

    :sswitch_data_50
    .sparse-switch
        0x22 -> :sswitch_12
        0x2d -> :sswitch_41
        0x30 -> :sswitch_48
        0x31 -> :sswitch_48
        0x32 -> :sswitch_48
        0x33 -> :sswitch_48
        0x34 -> :sswitch_48
        0x35 -> :sswitch_48
        0x36 -> :sswitch_48
        0x37 -> :sswitch_48
        0x38 -> :sswitch_48
        0x39 -> :sswitch_48
        0x5b -> :sswitch_19
        0x66 -> :sswitch_2d
        0x6e -> :sswitch_37
        0x74 -> :sswitch_23
        0x7b -> :sswitch_1e
    .end sparse-switch
.end method

.method private final _matchFalse()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2493
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2494
    .local v2, "ptr":I
    add-int/lit8 v3, v2, 0x4

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v3, v4, :cond_3b

    .line 2495
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    .line 2496
    .local v0, "b":[C
    aget-char v3, v0, v2

    const/16 v4, 0x61

    if-ne v3, v4, :cond_3b

    add-int/lit8 v2, v2, 0x1

    aget-char v3, v0, v2

    const/16 v4, 0x6c

    if-ne v3, v4, :cond_3b

    add-int/lit8 v2, v2, 0x1

    aget-char v3, v0, v2

    const/16 v4, 0x73

    if-ne v3, v4, :cond_3b

    add-int/lit8 v2, v2, 0x1

    aget-char v3, v0, v2

    const/16 v4, 0x65

    if-ne v3, v4, :cond_3b

    .line 2497
    add-int/lit8 v2, v2, 0x1

    aget-char v1, v0, v2

    .line 2498
    .local v1, "c":C
    const/16 v3, 0x30

    if-lt v1, v3, :cond_38

    const/16 v3, 0x5d

    if-eq v1, v3, :cond_38

    const/16 v3, 0x7d

    if-ne v1, v3, :cond_3b

    .line 2499
    :cond_38
    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2506
    .end local v0    # "b":[C
    .end local v1    # "c":C
    :goto_3a
    return-void

    .line 2505
    :cond_3b
    const-string v3, "false"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    goto :goto_3a
.end method

.method private final _matchNull()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x6c

    .line 2509
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2510
    .local v2, "ptr":I
    add-int/lit8 v3, v2, 0x3

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v3, v4, :cond_31

    .line 2511
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    .line 2512
    .local v0, "b":[C
    aget-char v3, v0, v2

    const/16 v4, 0x75

    if-ne v3, v4, :cond_31

    add-int/lit8 v2, v2, 0x1

    aget-char v3, v0, v2

    if-ne v3, v5, :cond_31

    add-int/lit8 v2, v2, 0x1

    aget-char v3, v0, v2

    if-ne v3, v5, :cond_31

    .line 2513
    add-int/lit8 v2, v2, 0x1

    aget-char v1, v0, v2

    .line 2514
    .local v1, "c":C
    const/16 v3, 0x30

    if-lt v1, v3, :cond_2e

    const/16 v3, 0x5d

    if-eq v1, v3, :cond_2e

    const/16 v3, 0x7d

    if-ne v1, v3, :cond_31

    .line 2515
    :cond_2e
    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2522
    .end local v0    # "b":[C
    .end local v1    # "c":C
    :goto_30
    return-void

    .line 2521
    :cond_31
    const-string v3, "null"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    goto :goto_30
.end method

.method private final _matchTrue()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2477
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2478
    .local v2, "ptr":I
    add-int/lit8 v3, v2, 0x3

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v3, v4, :cond_33

    .line 2479
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    .line 2480
    .local v0, "b":[C
    aget-char v3, v0, v2

    const/16 v4, 0x72

    if-ne v3, v4, :cond_33

    add-int/lit8 v2, v2, 0x1

    aget-char v3, v0, v2

    const/16 v4, 0x75

    if-ne v3, v4, :cond_33

    add-int/lit8 v2, v2, 0x1

    aget-char v3, v0, v2

    const/16 v4, 0x65

    if-ne v3, v4, :cond_33

    .line 2481
    add-int/lit8 v2, v2, 0x1

    aget-char v1, v0, v2

    .line 2482
    .local v1, "c":C
    const/16 v3, 0x30

    if-lt v1, v3, :cond_30

    const/16 v3, 0x5d

    if-eq v1, v3, :cond_30

    const/16 v3, 0x7d

    if-ne v1, v3, :cond_33

    .line 2483
    :cond_30
    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2490
    .end local v0    # "b":[C
    .end local v1    # "c":C
    :goto_32
    return-void

    .line 2489
    :cond_33
    const-string v3, "true"

    const/4 v4, 0x1

    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    goto :goto_32
.end method

.method private final _nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;
    .registers 5

    .prologue
    .line 722
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopied:Z

    .line 723
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 724
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 729
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1b

    .line 730
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 734
    :cond_18
    :goto_18
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 731
    :cond_1b
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_18

    .line 732
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

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

    .line 1036
    const/16 v0, 0x22

    if-ne p1, v0, :cond_c

    .line 1037
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 1038
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1074
    :goto_b
    return-object v0

    .line 1040
    :cond_c
    sparse-switch p1, :sswitch_data_64

    .line 1074
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleOddValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 1042
    :sswitch_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 1043
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 1045
    :sswitch_27
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 1046
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 1048
    :sswitch_38
    const-string v0, "true"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1049
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 1051
    :sswitch_42
    const-string v0, "false"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1052
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 1054
    :sswitch_4c
    const-string v0, "null"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1055
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 1057
    :sswitch_56
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 1072
    :sswitch_5d
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 1040
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

.method private final _parseFloat(IIIZI)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 14
    .param p1, "ch"    # I
    .param p2, "startPtr"    # I
    .param p3, "ptr"    # I
    .param p4, "neg"    # Z
    .param p5, "intLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x39

    const/16 v6, 0x30

    .line 1258
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 1259
    .local v2, "inputLen":I
    const/4 v1, 0x0

    .line 1262
    .local v1, "fractLen":I
    const/16 v5, 0x2e

    if-ne p1, v5, :cond_25

    move v4, p3

    .line 1265
    .end local p3    # "ptr":I
    .local v4, "ptr":I
    :goto_c
    if-lt v4, v2, :cond_14

    .line 1266
    invoke-direct {p0, p4, p2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    move p3, v4

    .line 1316
    .end local v4    # "ptr":I
    .restart local p3    # "ptr":I
    :goto_13
    return-object v5

    .line 1268
    .end local p3    # "ptr":I
    .restart local v4    # "ptr":I
    :cond_14
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 p3, v4, 0x1

    .end local v4    # "ptr":I
    .restart local p3    # "ptr":I
    aget-char p1, v5, v4

    .line 1269
    if-lt p1, v6, :cond_1e

    if-le p1, v7, :cond_39

    .line 1275
    :cond_1e
    if-nez v1, :cond_25

    .line 1276
    const-string v5, "Decimal point not followed by a digit"

    invoke-virtual {p0, p1, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    :cond_25
    move v4, p3

    .line 1279
    .end local p3    # "ptr":I
    .restart local v4    # "ptr":I
    const/4 v0, 0x0

    .line 1280
    .local v0, "expLen":I
    const/16 v5, 0x65

    if-eq p1, v5, :cond_2f

    const/16 v5, 0x45

    if-ne p1, v5, :cond_79

    .line 1281
    :cond_2f
    if-lt v4, v2, :cond_3d

    .line 1282
    iput p2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1283
    invoke-direct {p0, p4, p2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    move p3, v4

    .end local v4    # "ptr":I
    .restart local p3    # "ptr":I
    goto :goto_13

    .line 1272
    .end local v0    # "expLen":I
    :cond_39
    add-int/lit8 v1, v1, 0x1

    move v4, p3

    .end local p3    # "ptr":I
    .restart local v4    # "ptr":I
    goto :goto_c

    .line 1286
    .restart local v0    # "expLen":I
    :cond_3d
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 p3, v4, 0x1

    .end local v4    # "ptr":I
    .restart local p3    # "ptr":I
    aget-char p1, v5, v4

    .line 1287
    const/16 v5, 0x2d

    if-eq p1, v5, :cond_4b

    const/16 v5, 0x2b

    if-ne p1, v5, :cond_98

    .line 1288
    :cond_4b
    if-lt p3, v2, :cond_54

    .line 1289
    iput p2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1290
    invoke-direct {p0, p4, p2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    goto :goto_13

    .line 1292
    :cond_54
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 v4, p3, 0x1

    .end local p3    # "ptr":I
    .restart local v4    # "ptr":I
    aget-char p1, v5, p3

    .line 1294
    :goto_5a
    if-gt p1, v7, :cond_72

    if-lt p1, v6, :cond_72

    .line 1295
    add-int/lit8 v0, v0, 0x1

    .line 1296
    if-lt v4, v2, :cond_6a

    .line 1297
    iput p2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1298
    invoke-direct {p0, p4, p2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    move p3, v4

    .end local v4    # "ptr":I
    .restart local p3    # "ptr":I
    goto :goto_13

    .line 1300
    .end local p3    # "ptr":I
    .restart local v4    # "ptr":I
    :cond_6a
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 p3, v4, 0x1

    .end local v4    # "ptr":I
    .restart local p3    # "ptr":I
    aget-char p1, v5, v4

    move v4, p3

    .end local p3    # "ptr":I
    .restart local v4    # "ptr":I
    goto :goto_5a

    .line 1303
    :cond_72
    if-nez v0, :cond_79

    .line 1304
    const-string v5, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, p1, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    :cond_79
    move p3, v4

    .line 1307
    .end local v4    # "ptr":I
    .restart local p3    # "ptr":I
    add-int/lit8 p3, p3, -0x1

    .line 1308
    iput p3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1310
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v5

    if-eqz v5, :cond_89

    .line 1311
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_verifyRootSpace(I)V

    .line 1313
    :cond_89
    sub-int v3, p3, p2

    .line 1314
    .local v3, "len":I
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    invoke-virtual {v5, v6, p2, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithShared([CII)V

    .line 1316
    invoke-virtual {p0, p4, p5, v1, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->resetFloat(ZIII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    goto/16 :goto_13

    .end local v3    # "len":I
    :cond_98
    move v4, p3

    .end local p3    # "ptr":I
    .restart local v4    # "ptr":I
    goto :goto_5a
.end method

.method private _parseName2(III)Ljava/lang/String;
    .registers 16
    .param p1, "startPtr"    # I
    .param p2, "hash"    # I
    .param p3, "endChar"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1635
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    iget-object v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    sub-int/2addr v11, p1

    invoke-virtual {v9, v10, p1, v11}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithShared([CII)V

    .line 1640
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegment()[C

    move-result-object v4

    .line 1641
    .local v4, "outBuf":[C
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v5

    .line 1644
    .local v5, "outPtr":I
    :goto_16
    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v9, v10, :cond_3f

    .line 1645
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v9

    if-nez v9, :cond_3f

    .line 1646
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, ": was expecting closing \'"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    int-to-char v10, p3

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\' for name"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1649
    :cond_3f
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v9, v10

    .line 1650
    .local v1, "c":C
    move v2, v1

    .line 1651
    .local v2, "i":I
    const/16 v9, 0x5c

    if-gt v2, v9, :cond_56

    .line 1652
    const/16 v9, 0x5c

    if-ne v2, v9, :cond_69

    .line 1657
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeEscaped()C

    move-result v1

    .line 1667
    :cond_56
    :goto_56
    mul-int/lit8 v9, p2, 0x21

    add-int p2, v9, v1

    .line 1669
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outPtr":I
    .local v6, "outPtr":I
    aput-char v1, v4, v5

    .line 1672
    array-length v9, v4

    if-lt v6, v9, :cond_91

    .line 1673
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v4

    .line 1674
    const/4 v5, 0x0

    .end local v6    # "outPtr":I
    .restart local v5    # "outPtr":I
    goto :goto_16

    .line 1658
    :cond_69
    if-gt v2, p3, :cond_56

    .line 1659
    if-ne v2, p3, :cond_87

    .line 1677
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v9, v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1679
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    .line 1680
    .local v8, "tb":Lcom/fasterxml/jackson/core/util/TextBuffer;
    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextBuffer()[C

    move-result-object v0

    .line 1681
    .local v0, "buf":[C
    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextOffset()I

    move-result v7

    .line 1682
    .local v7, "start":I
    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v3

    .line 1683
    .local v3, "len":I
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    invoke-virtual {v9, v0, v7, v3, p2}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->findSymbol([CIII)Ljava/lang/String;

    move-result-object v9

    return-object v9

    .line 1662
    .end local v0    # "buf":[C
    .end local v3    # "len":I
    .end local v7    # "start":I
    .end local v8    # "tb":Lcom/fasterxml/jackson/core/util/TextBuffer;
    :cond_87
    const/16 v9, 0x20

    if-ge v2, v9, :cond_56

    .line 1663
    const-string v9, "name"

    invoke-virtual {p0, v2, v9}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_56

    .end local v5    # "outPtr":I
    .restart local v6    # "outPtr":I
    :cond_91
    move v5, v6

    .end local v6    # "outPtr":I
    .restart local v5    # "outPtr":I
    goto :goto_16
.end method

.method private final _parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 14
    .param p1, "neg"    # Z
    .param p2, "startPtr"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1376
    if-eqz p1, :cond_4

    add-int/lit8 p2, p2, 0x1

    .end local p2    # "startPtr":I
    :cond_4
    iput p2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1377
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v5

    .line 1378
    .local v5, "outBuf":[C
    const/4 v6, 0x0

    .line 1381
    .local v6, "outPtr":I
    if-eqz p1, :cond_16

    .line 1382
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .local v7, "outPtr":I
    const/16 v8, 0x2d

    aput-char v8, v5, v6

    move v6, v7

    .line 1386
    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    :cond_16
    const/4 v4, 0x0

    .line 1387
    .local v4, "intLen":I
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v8, v9, :cond_5e

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v8, v9

    .line 1388
    .local v0, "c":C
    :goto_27
    const/16 v8, 0x30

    if-ne v0, v8, :cond_2f

    .line 1389
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_verifyNoLeadingZeroes()C

    move-result v0

    .line 1391
    :cond_2f
    const/4 v1, 0x0

    .line 1395
    .local v1, "eof":Z
    :goto_30
    const/16 v8, 0x30

    if-lt v0, v8, :cond_171

    const/16 v8, 0x39

    if-gt v0, v8, :cond_171

    .line 1396
    add-int/lit8 v4, v4, 0x1

    .line 1397
    array-length v8, v5

    if-lt v6, v8, :cond_44

    .line 1398
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 1399
    const/4 v6, 0x0

    .line 1401
    :cond_44
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    aput-char v0, v5, v6

    .line 1402
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_65

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_65

    .line 1404
    const/4 v0, 0x0

    .line 1405
    const/4 v1, 0x1

    .line 1411
    :goto_56
    if-nez v4, :cond_71

    .line 1412
    invoke-virtual {p0, v0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    move v6, v7

    .line 1494
    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    :goto_5d
    return-object v8

    .line 1387
    .end local v0    # "c":C
    .end local v1    # "eof":Z
    :cond_5e
    const-string v8, "No digit following minus sign"

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getNextChar(Ljava/lang/String;)C

    move-result v0

    goto :goto_27

    .line 1408
    .end local v6    # "outPtr":I
    .restart local v0    # "c":C
    .restart local v1    # "eof":Z
    .restart local v7    # "outPtr":I
    :cond_65
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v8, v9

    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_30

    .line 1415
    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_71
    const/4 v3, 0x0

    .line 1417
    .local v3, "fractLen":I
    const/16 v8, 0x2e

    if-ne v0, v8, :cond_16e

    .line 1418
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    aput-char v0, v5, v7

    .line 1422
    :goto_7a
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_127

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_127

    .line 1423
    const/4 v1, 0x1

    .line 1438
    :cond_87
    if-nez v3, :cond_8e

    .line 1439
    const-string v8, "Decimal point not followed by a digit"

    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1443
    :cond_8e
    :goto_8e
    const/4 v2, 0x0

    .line 1444
    .local v2, "expLen":I
    const/16 v8, 0x65

    if-eq v0, v8, :cond_97

    const/16 v8, 0x45

    if-ne v0, v8, :cond_109

    .line 1445
    :cond_97
    array-length v8, v5

    if-lt v6, v8, :cond_a1

    .line 1446
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 1447
    const/4 v6, 0x0

    .line 1449
    :cond_a1
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    aput-char v0, v5, v6

    .line 1451
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v8, v9, :cond_14c

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v8, v9

    .line 1454
    :goto_b5
    const/16 v8, 0x2d

    if-eq v0, v8, :cond_bd

    const/16 v8, 0x2b

    if-ne v0, v8, :cond_16b

    .line 1455
    :cond_bd
    array-length v8, v5

    if-lt v7, v8, :cond_168

    .line 1456
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 1457
    const/4 v6, 0x0

    .line 1459
    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    :goto_c7
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    aput-char v0, v5, v6

    .line 1461
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v8, v9, :cond_154

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v8, v9

    :goto_db
    move v6, v7

    .line 1466
    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    :goto_dc
    const/16 v8, 0x39

    if-gt v0, v8, :cond_102

    const/16 v8, 0x30

    if-lt v0, v8, :cond_102

    .line 1467
    add-int/lit8 v2, v2, 0x1

    .line 1468
    array-length v8, v5

    if-lt v6, v8, :cond_f0

    .line 1469
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 1470
    const/4 v6, 0x0

    .line 1472
    :cond_f0
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    aput-char v0, v5, v6

    .line 1473
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_15b

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_15b

    .line 1474
    const/4 v1, 0x1

    move v6, v7

    .line 1480
    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    :cond_102
    if-nez v2, :cond_109

    .line 1481
    const-string v8, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1486
    :cond_109
    if-nez v1, :cond_11c

    .line 1487
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1488
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v8

    if-eqz v8, :cond_11c

    .line 1489
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_verifyRootSpace(I)V

    .line 1492
    :cond_11c
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1494
    invoke-virtual {p0, p1, v4, v3, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->reset(ZIII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    goto/16 :goto_5d

    .line 1426
    .end local v2    # "expLen":I
    :cond_127
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v8, v9

    .line 1427
    const/16 v8, 0x30

    if-lt v0, v8, :cond_87

    const/16 v8, 0x39

    if-gt v0, v8, :cond_87

    .line 1430
    add-int/lit8 v3, v3, 0x1

    .line 1431
    array-length v8, v5

    if-lt v6, v8, :cond_145

    .line 1432
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 1433
    const/4 v6, 0x0

    .line 1435
    :cond_145
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    aput-char v0, v5, v6

    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto/16 :goto_7a

    .line 1451
    .end local v6    # "outPtr":I
    .restart local v2    # "expLen":I
    .restart local v7    # "outPtr":I
    :cond_14c
    const-string v8, "expected a digit for number exponent"

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getNextChar(Ljava/lang/String;)C

    move-result v0

    goto/16 :goto_b5

    .line 1461
    :cond_154
    const-string v8, "expected a digit for number exponent"

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getNextChar(Ljava/lang/String;)C

    move-result v0

    goto :goto_db

    .line 1477
    :cond_15b
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v8, v9

    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto/16 :goto_dc

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_168
    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto/16 :goto_c7

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_16b
    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto/16 :goto_dc

    .end local v2    # "expLen":I
    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_16e
    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto/16 :goto_8e

    .end local v3    # "fractLen":I
    :cond_171
    move v7, v6

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    goto/16 :goto_56
.end method

.method private final _skipAfterComma2()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 2231
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_4e

    .line 2232
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v1, v2

    .line 2233
    .local v0, "i":I
    if-le v0, v4, :cond_2d

    .line 2234
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_22

    .line 2235
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipComment()V

    goto :goto_2

    .line 2238
    :cond_22
    const/16 v1, 0x23

    if-ne v0, v1, :cond_2c

    .line 2239
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipYAMLComment()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2243
    :cond_2c
    return v0

    .line 2245
    :cond_2d
    if-ge v0, v4, :cond_2

    .line 2246
    const/16 v1, 0xa

    if-ne v0, v1, :cond_3e

    .line 2247
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 2248
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2249
    :cond_3e
    const/16 v1, 0xd

    if-ne v0, v1, :cond_46

    .line 2250
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCR()V

    goto :goto_2

    .line 2251
    :cond_46
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2252
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 2256
    .end local v0    # "i":I
    :cond_4e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected end-of-input within/between "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " entries"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_constructError(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParseException;

    move-result-object v1

    throw v1
.end method

.method private _skipCComment()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x2a

    .line 2365
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 2366
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v1, v2

    .line 2367
    .local v0, "i":I
    if-gt v0, v4, :cond_2

    .line 2368
    if-ne v0, v4, :cond_3f

    .line 2369
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_2e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_2e

    .line 2390
    .end local v0    # "i":I
    :cond_28
    const-string v1, " in a comment"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2391
    :goto_2d
    return-void

    .line 2372
    .restart local v0    # "i":I
    :cond_2e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v1, v2

    const/16 v2, 0x2f

    if-ne v1, v2, :cond_2

    .line 2373
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    goto :goto_2d

    .line 2378
    :cond_3f
    const/16 v1, 0x20

    if-ge v0, v1, :cond_2

    .line 2379
    const/16 v1, 0xa

    if-ne v0, v1, :cond_52

    .line 2380
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 2381
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2382
    :cond_52
    const/16 v1, 0xd

    if-ne v0, v1, :cond_5a

    .line 2383
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCR()V

    goto :goto_2

    .line 2384
    :cond_5a
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2385
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2
.end method

.method private final _skipColon()I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x9

    const/16 v7, 0x2f

    const/16 v6, 0x23

    const/4 v5, 0x1

    const/16 v4, 0x20

    .line 2058
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x4

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_17

    .line 2059
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v1

    .line 2107
    :goto_16
    return v1

    .line 2061
    :cond_17
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v2, v3

    .line 2062
    .local v0, "c":C
    const/16 v2, 0x3a

    if-ne v0, v2, :cond_62

    .line 2063
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v2, v3

    .line 2064
    .local v1, "i":I
    if-le v1, v4, :cond_3d

    .line 2065
    if-eq v1, v7, :cond_31

    if-ne v1, v6, :cond_36

    .line 2066
    :cond_31
    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v1

    goto :goto_16

    .line 2068
    :cond_36
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    goto :goto_16

    .line 2071
    :cond_3d
    if-eq v1, v4, :cond_41

    if-ne v1, v8, :cond_5d

    .line 2072
    :cond_41
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v2, v3

    .line 2073
    if-le v1, v4, :cond_5d

    .line 2074
    if-eq v1, v7, :cond_51

    if-ne v1, v6, :cond_56

    .line 2075
    :cond_51
    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v1

    goto :goto_16

    .line 2077
    :cond_56
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    goto :goto_16

    .line 2081
    :cond_5d
    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v1

    goto :goto_16

    .line 2083
    .end local v1    # "i":I
    :cond_62
    if-eq v0, v4, :cond_66

    if-ne v0, v8, :cond_70

    .line 2084
    :cond_66
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v2, v3

    .line 2086
    :cond_70
    const/16 v2, 0x3a

    if-ne v0, v2, :cond_b8

    .line 2087
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v2, v3

    .line 2088
    .restart local v1    # "i":I
    if-le v1, v4, :cond_90

    .line 2089
    if-eq v1, v7, :cond_84

    if-ne v1, v6, :cond_89

    .line 2090
    :cond_84
    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v1

    goto :goto_16

    .line 2092
    :cond_89
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    goto :goto_16

    .line 2095
    :cond_90
    if-eq v1, v4, :cond_94

    if-ne v1, v8, :cond_b2

    .line 2096
    :cond_94
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v2, v3

    .line 2097
    if-le v1, v4, :cond_b2

    .line 2098
    if-eq v1, v7, :cond_a4

    if-ne v1, v6, :cond_aa

    .line 2099
    :cond_a4
    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v1

    goto/16 :goto_16

    .line 2101
    :cond_aa
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    goto/16 :goto_16

    .line 2105
    :cond_b2
    invoke-direct {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v1

    goto/16 :goto_16

    .line 2107
    .end local v1    # "i":I
    :cond_b8
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v1

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

    .line 2113
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_b

    .line 2114
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 2116
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v1, v2

    .line 2117
    .local v0, "i":I
    if-le v0, v4, :cond_3c

    .line 2118
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_1f

    .line 2119
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipComment()V

    goto :goto_2

    .line 2122
    :cond_1f
    const/16 v1, 0x23

    if-ne v0, v1, :cond_29

    .line 2123
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipYAMLComment()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2127
    :cond_29
    if-eqz p1, :cond_2c

    .line 2128
    return v0

    .line 2130
    :cond_2c
    const/16 v1, 0x3a

    if-eq v0, v1, :cond_3a

    .line 2131
    if-ge v0, v4, :cond_35

    .line 2132
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwInvalidSpace(I)V

    .line 2134
    :cond_35
    const-string v1, "was expecting a colon to separate field name and value"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2136
    :cond_3a
    const/4 p1, 0x1

    .line 2137
    goto :goto_2

    .line 2139
    :cond_3c
    if-ge v0, v4, :cond_2

    .line 2140
    const/16 v1, 0xa

    if-ne v0, v1, :cond_4d

    .line 2141
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 2142
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2143
    :cond_4d
    const/16 v1, 0xd

    if-ne v0, v1, :cond_55

    .line 2144
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCR()V

    goto :goto_2

    .line 2145
    :cond_55
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2146
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2
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
    const/4 v0, 0x1

    const/16 v7, 0x9

    const/16 v6, 0x2f

    const/16 v5, 0x23

    const/16 v4, 0x20

    .line 2155
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 v2, p1, 0x1

    .end local p1    # "ptr":I
    .local v2, "ptr":I
    aget-char v1, v3, p1

    .line 2156
    .local v1, "i":I
    const/16 v3, 0x3a

    if-ne v1, v3, :cond_42

    .line 2157
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 p1, v2, 0x1

    .end local v2    # "ptr":I
    .restart local p1    # "ptr":I
    aget-char v1, v3, v2

    .line 2158
    if-le v1, v4, :cond_23

    .line 2159
    if-eq v1, v6, :cond_39

    if-eq v1, v5, :cond_39

    .line 2160
    iput p1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    move v3, v1

    .line 2197
    :goto_22
    return v3

    .line 2163
    :cond_23
    if-eq v1, v4, :cond_27

    if-ne v1, v7, :cond_39

    .line 2164
    :cond_27
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 v2, p1, 0x1

    .end local p1    # "ptr":I
    .restart local v2    # "ptr":I
    aget-char v1, v3, p1

    .line 2165
    if-le v1, v4, :cond_38

    .line 2166
    if-eq v1, v6, :cond_38

    if-eq v1, v5, :cond_38

    .line 2167
    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    move p1, v2

    .end local v2    # "ptr":I
    .restart local p1    # "ptr":I
    move v3, v1

    .line 2168
    goto :goto_22

    .end local p1    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_38
    move p1, v2

    .line 2172
    .end local v2    # "ptr":I
    .restart local p1    # "ptr":I
    :cond_39
    add-int/lit8 v3, p1, -0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2173
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v3

    goto :goto_22

    .line 2175
    .end local p1    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_42
    if-eq v1, v4, :cond_46

    if-ne v1, v7, :cond_4d

    .line 2176
    :cond_46
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 p1, v2, 0x1

    .end local v2    # "ptr":I
    .restart local p1    # "ptr":I
    aget-char v1, v3, v2

    move v2, p1

    .line 2178
    .end local p1    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_4d
    const/16 v3, 0x3a

    if-ne v1, v3, :cond_63

    .line 2179
    .local v0, "gotColon":Z
    :goto_51
    if-eqz v0, :cond_7a

    .line 2180
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 p1, v2, 0x1

    .end local v2    # "ptr":I
    .restart local p1    # "ptr":I
    aget-char v1, v3, v2

    .line 2181
    if-le v1, v4, :cond_65

    .line 2182
    if-eq v1, v6, :cond_7b

    if-eq v1, v5, :cond_7b

    .line 2183
    iput p1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    move v3, v1

    .line 2184
    goto :goto_22

    .line 2178
    .end local v0    # "gotColon":Z
    .end local p1    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_63
    const/4 v0, 0x0

    goto :goto_51

    .line 2186
    .end local v2    # "ptr":I
    .restart local v0    # "gotColon":Z
    .restart local p1    # "ptr":I
    :cond_65
    if-eq v1, v4, :cond_69

    if-ne v1, v7, :cond_7b

    .line 2187
    :cond_69
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 v2, p1, 0x1

    .end local p1    # "ptr":I
    .restart local v2    # "ptr":I
    aget-char v1, v3, p1

    .line 2188
    if-le v1, v4, :cond_7a

    .line 2189
    if-eq v1, v6, :cond_7a

    if-eq v1, v5, :cond_7a

    .line 2190
    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    move p1, v2

    .end local v2    # "ptr":I
    .restart local p1    # "ptr":I
    move v3, v1

    .line 2191
    goto :goto_22

    .end local p1    # "ptr":I
    .restart local v2    # "ptr":I
    :cond_7a
    move p1, v2

    .line 2196
    .end local v2    # "ptr":I
    .restart local p1    # "ptr":I
    :cond_7b
    add-int/lit8 v3, p1, -0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2197
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon2(Z)I

    move-result v3

    goto :goto_22
.end method

.method private final _skipComma(I)I
    .registers 6
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x20

    .line 2203
    const/16 v0, 0x2c

    if-eq p1, v0, :cond_28

    .line 2204
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "was expecting comma to separate "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " entries"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2206
    :cond_28
    :goto_28
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v0, v1, :cond_70

    .line 2207
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char p1, v0, v1

    .line 2208
    if-le p1, v3, :cond_4f

    .line 2209
    const/16 v0, 0x2f

    if-eq p1, v0, :cond_42

    const/16 v0, 0x23

    if-ne p1, v0, :cond_4d

    .line 2210
    :cond_42
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2211
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipAfterComma2()I

    move-result v0

    .line 2226
    :goto_4c
    return v0

    :cond_4d
    move v0, p1

    .line 2213
    goto :goto_4c

    .line 2215
    :cond_4f
    if-ge p1, v3, :cond_28

    .line 2216
    const/16 v0, 0xa

    if-ne p1, v0, :cond_60

    .line 2217
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 2218
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    goto :goto_28

    .line 2219
    :cond_60
    const/16 v0, 0xd

    if-ne p1, v0, :cond_68

    .line 2220
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCR()V

    goto :goto_28

    .line 2221
    :cond_68
    const/16 v0, 0x9

    if-eq p1, v0, :cond_28

    .line 2222
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwInvalidSpace(I)V

    goto :goto_28

    .line 2226
    :cond_70
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipAfterComma2()I

    move-result v0

    goto :goto_4c
.end method

.method private _skipComment()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x2f

    .line 2345
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-nez v1, :cond_f

    .line 2346
    const-string v1, "maybe a (non-standard) comment? (not recognized as one since Feature \'ALLOW_COMMENTS\' not enabled for parser)"

    invoke-virtual {p0, v4, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2349
    :cond_f
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_20

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_20

    .line 2350
    const-string v1, " in a comment"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2352
    :cond_20
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v1, v2

    .line 2353
    .local v0, "c":C
    if-ne v0, v4, :cond_30

    .line 2354
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipLine()V

    .line 2360
    :goto_2f
    return-void

    .line 2355
    :cond_30
    const/16 v1, 0x2a

    if-ne v0, v1, :cond_38

    .line 2356
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCComment()V

    goto :goto_2f

    .line 2358
    :cond_38
    const-string v1, "was expecting either \'*\' or \'/\' for a comment"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    goto :goto_2f
.end method

.method private _skipLine()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2405
    :cond_0
    :goto_0
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_c

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 2406
    :cond_c
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v1, v2

    .line 2407
    .local v0, "i":I
    const/16 v1, 0x20

    if-ge v0, v1, :cond_0

    .line 2408
    const/16 v1, 0xa

    if-ne v0, v1, :cond_29

    .line 2409
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 2410
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    .line 2420
    .end local v0    # "i":I
    :cond_28
    :goto_28
    return-void

    .line 2412
    .restart local v0    # "i":I
    :cond_29
    const/16 v1, 0xd

    if-ne v0, v1, :cond_31

    .line 2413
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCR()V

    goto :goto_28

    .line 2415
    :cond_31
    const/16 v1, 0x9

    if-eq v0, v1, :cond_0

    .line 2416
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwInvalidSpace(I)V

    goto :goto_0
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

    .line 2263
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_1b

    .line 2264
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 2265
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_eofAsNextChar()I

    move-result v0

    .line 2307
    :cond_1a
    :goto_1a
    return v0

    .line 2268
    :cond_1b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v1, v2

    .line 2269
    .local v0, "i":I
    if-le v0, v4, :cond_38

    .line 2270
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_2d

    if-ne v0, v8, :cond_1a

    .line 2271
    :cond_2d
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2272
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipWSOrEnd2()I

    move-result v0

    goto :goto_1a

    .line 2276
    :cond_38
    if-eq v0, v4, :cond_46

    .line 2277
    if-ne v0, v6, :cond_69

    .line 2278
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 2279
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    .line 2287
    :cond_46
    :goto_46
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v1, v2, :cond_90

    .line 2288
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v1, v2

    .line 2289
    if-le v0, v4, :cond_75

    .line 2290
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_5e

    if-ne v0, v8, :cond_1a

    .line 2291
    :cond_5e
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2292
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipWSOrEnd2()I

    move-result v0

    goto :goto_1a

    .line 2280
    :cond_69
    if-ne v0, v7, :cond_6f

    .line 2281
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCR()V

    goto :goto_46

    .line 2282
    :cond_6f
    if-eq v0, v5, :cond_46

    .line 2283
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwInvalidSpace(I)V

    goto :goto_46

    .line 2296
    :cond_75
    if-eq v0, v4, :cond_46

    .line 2297
    if-ne v0, v6, :cond_84

    .line 2298
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 2299
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    goto :goto_46

    .line 2300
    :cond_84
    if-ne v0, v7, :cond_8a

    .line 2301
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCR()V

    goto :goto_46

    .line 2302
    :cond_8a
    if-eq v0, v5, :cond_46

    .line 2303
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwInvalidSpace(I)V

    goto :goto_46

    .line 2307
    :cond_90
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipWSOrEnd2()I

    move-result v0

    goto :goto_1a
.end method

.method private _skipWSOrEnd2()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x20

    .line 2313
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_13

    .line 2314
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_13

    .line 2315
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_eofAsNextChar()I

    move-result v0

    .line 2329
    :cond_12
    return v0

    .line 2318
    :cond_13
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v1, v2

    .line 2319
    .local v0, "i":I
    if-le v0, v4, :cond_32

    .line 2320
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_27

    .line 2321
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipComment()V

    goto :goto_2

    .line 2324
    :cond_27
    const/16 v1, 0x23

    if-ne v0, v1, :cond_12

    .line 2325
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipYAMLComment()Z

    move-result v1

    if-eqz v1, :cond_12

    goto :goto_2

    .line 2330
    :cond_32
    if-eq v0, v4, :cond_2

    .line 2331
    const/16 v1, 0xa

    if-ne v0, v1, :cond_43

    .line 2332
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 2333
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2334
    :cond_43
    const/16 v1, 0xd

    if-ne v0, v1, :cond_4b

    .line 2335
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCR()V

    goto :goto_2

    .line 2336
    :cond_4b
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2337
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2
.end method

.method private _skipYAMLComment()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2395
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_YAML_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 2396
    const/4 v0, 0x0

    .line 2399
    :goto_9
    return v0

    .line 2398
    :cond_a
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipLine()V

    .line 2399
    const/4 v0, 0x1

    goto :goto_9
.end method

.method private final _updateLocation()V
    .registers 6

    .prologue
    .line 2709
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2710
    .local v0, "ptr":I
    iget-wide v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputProcessed:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputTotal:J

    .line 2711
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    .line 2712
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    sub-int v1, v0, v1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    .line 2713
    return-void
.end method

.method private final _updateNameLocation()V
    .registers 4

    .prologue
    .line 2718
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2719
    .local v0, "ptr":I
    int-to-long v1, v0

    iput-wide v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameStartOffset:J

    .line 2720
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameStartRow:I

    .line 2721
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    sub-int v1, v0, v1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameStartCol:I

    .line 2722
    return-void
.end method

.method private _verifyNLZ2()C
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x39

    const/16 v1, 0x30

    .line 1517
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_12

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v2

    if-nez v2, :cond_12

    move v0, v1

    .line 1541
    :cond_11
    :goto_11
    return v0

    .line 1520
    :cond_12
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v2, v3

    .line 1521
    .local v0, "ch":C
    if-lt v0, v1, :cond_1c

    if-le v0, v4, :cond_1e

    :cond_1c
    move v0, v1

    .line 1522
    goto :goto_11

    .line 1524
    :cond_1e
    sget-object v2, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NUMERIC_LEADING_ZEROS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v2

    if-nez v2, :cond_2b

    .line 1525
    const-string v2, "Leading zeroes not allowed"

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->reportInvalidNumber(Ljava/lang/String;)V

    .line 1528
    :cond_2b
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1529
    if-ne v0, v1, :cond_11

    .line 1530
    :cond_33
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_3f

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 1531
    :cond_3f
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v2, v3

    .line 1532
    if-lt v0, v1, :cond_49

    if-le v0, v4, :cond_4b

    :cond_49
    move v0, v1

    .line 1533
    goto :goto_11

    .line 1535
    :cond_4b
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1536
    if-eq v0, v1, :cond_33

    goto :goto_11
.end method

.method private final _verifyNoLeadingZeroes()C
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x30

    .line 1504
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v2, v3, :cond_15

    .line 1505
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v2, v3

    .line 1507
    .local v0, "ch":C
    if-lt v0, v1, :cond_14

    const/16 v2, 0x39

    if-le v0, v2, :cond_15

    .line 1512
    .end local v0    # "ch":C
    :cond_14
    :goto_14
    return v1

    :cond_15
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_verifyNLZ2()C

    move-result v1

    goto :goto_14
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
    .line 1585
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1586
    sparse-switch p1, :sswitch_data_1c

    .line 1598
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportMissingRootWS(I)V

    .line 1599
    :goto_c
    :sswitch_c
    return-void

    .line 1591
    :sswitch_d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipCR()V

    goto :goto_c

    .line 1594
    :sswitch_11
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 1595
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    goto :goto_c

    .line 1586
    :sswitch_data_1c
    .sparse-switch
        0x9 -> :sswitch_c
        0xa -> :sswitch_11
        0xd -> :sswitch_d
        0x20 -> :sswitch_c
    .end sparse-switch
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
    .line 212
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reader:Ljava/io/Reader;

    if-eqz v0, :cond_1c

    .line 213
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->isResourceManaged()Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->AUTO_CLOSE_SOURCE:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 214
    :cond_14
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reader:Ljava/io/Reader;

    invoke-virtual {v0}, Ljava/io/Reader;->close()V

    .line 216
    :cond_19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reader:Ljava/io/Reader;

    .line 218
    :cond_1c
    return-void
.end method

.method protected _decodeBase64(Lcom/fasterxml/jackson/core/Base64Variant;)[B
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

    .line 2573
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_getByteArrayBuilder()Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    move-result-object v1

    .line 2580
    .local v1, "builder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    :cond_8
    :goto_8
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_11

    .line 2581
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 2583
    :cond_11
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v2, v4, v5

    .line 2584
    .local v2, "ch":C
    const/16 v4, 0x20

    if-le v2, v4, :cond_8

    .line 2585
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(C)I

    move-result v0

    .line 2586
    .local v0, "bits":I
    if-gez v0, :cond_33

    .line 2587
    if-ne v2, v8, :cond_2c

    .line 2588
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    .line 2657
    :goto_2b
    return-object v4

    .line 2590
    :cond_2c
    const/4 v4, 0x0

    invoke-virtual {p0, p1, v2, v4}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;CI)I

    move-result v0

    .line 2591
    if-ltz v0, :cond_8

    .line 2595
    :cond_33
    move v3, v0

    .line 2599
    .local v3, "decodedData":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_3d

    .line 2600
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 2602
    :cond_3d
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v2, v4, v5

    .line 2603
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(C)I

    move-result v0

    .line 2604
    if-gez v0, :cond_52

    .line 2605
    const/4 v4, 0x1

    invoke-virtual {p0, p1, v2, v4}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;CI)I

    move-result v0

    .line 2607
    :cond_52
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 2610
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_5f

    .line 2611
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 2613
    :cond_5f
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v2, v4, v5

    .line 2614
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(C)I

    move-result v0

    .line 2617
    if-gez v0, :cond_cc

    .line 2618
    if-eq v0, v7, :cond_88

    .line 2620
    if-ne v2, v8, :cond_83

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v4

    if-nez v4, :cond_83

    .line 2621
    shr-int/lit8 v3, v3, 0x4

    .line 2622
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 2623
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    goto :goto_2b

    .line 2625
    :cond_83
    const/4 v4, 0x2

    invoke-virtual {p0, p1, v2, v4}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;CI)I

    move-result v0

    .line 2627
    :cond_88
    if-ne v0, v7, :cond_cc

    .line 2629
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_93

    .line 2630
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 2632
    :cond_93
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v2, v4, v5

    .line 2633
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPaddingChar(C)Z

    move-result v4

    if-nez v4, :cond_c5

    .line 2634
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

    invoke-virtual {p0, p1, v2, v9, v4}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->reportInvalidBase64Char(Lcom/fasterxml/jackson/core/Base64Variant;IILjava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v4

    throw v4

    .line 2637
    :cond_c5
    shr-int/lit8 v3, v3, 0x4

    .line 2638
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    goto/16 :goto_8

    .line 2644
    :cond_cc
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 2646
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_d9

    .line 2647
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 2649
    :cond_d9
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v2, v4, v5

    .line 2650
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(C)I

    move-result v0

    .line 2651
    if-gez v0, :cond_10b

    .line 2652
    if-eq v0, v7, :cond_102

    .line 2654
    if-ne v2, v8, :cond_fe

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v4

    if-nez v4, :cond_fe

    .line 2655
    shr-int/lit8 v3, v3, 0x2

    .line 2656
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendTwoBytes(I)V

    .line 2657
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    goto/16 :goto_2b

    .line 2659
    :cond_fe
    invoke-virtual {p0, p1, v2, v9}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;CI)I

    move-result v0

    .line 2661
    :cond_102
    if-ne v0, v7, :cond_10b

    .line 2667
    shr-int/lit8 v3, v3, 0x2

    .line 2668
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendTwoBytes(I)V

    goto/16 :goto_8

    .line 2674
    :cond_10b
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 2675
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendThreeBytes(I)V

    goto/16 :goto_8
.end method

.method protected _decodeEscaped()C
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2425
    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v5, v6, :cond_11

    .line 2426
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_11

    .line 2427
    const-string v5, " in character escape sequence"

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2430
    :cond_11
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v5, v6

    .line 2432
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_66

    .line 2455
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleUnrecognizedCharacterEscape(C)C

    move-result v0

    .line 2473
    .end local v0    # "c":C
    :goto_22
    :sswitch_22
    return v0

    .line 2435
    .restart local v0    # "c":C
    :sswitch_23
    const/16 v0, 0x8

    goto :goto_22

    .line 2437
    :sswitch_26
    const/16 v0, 0x9

    goto :goto_22

    .line 2439
    :sswitch_29
    const/16 v0, 0xa

    goto :goto_22

    .line 2441
    :sswitch_2c
    const/16 v0, 0xc

    goto :goto_22

    .line 2443
    :sswitch_2f
    const/16 v0, 0xd

    goto :goto_22

    .line 2459
    :sswitch_32
    const/4 v4, 0x0

    .line 2460
    .local v4, "value":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_34
    const/4 v5, 0x4

    if-ge v3, v5, :cond_64

    .line 2461
    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v5, v6, :cond_48

    .line 2462
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_48

    .line 2463
    const-string v5, " in character escape sequence"

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2466
    :cond_48
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v5, v6

    .line 2467
    .local v1, "ch":I
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    .line 2468
    .local v2, "digit":I
    if-gez v2, :cond_5d

    .line 2469
    const-string v5, "expected a hex-digit for character escape sequence"

    invoke-virtual {p0, v1, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2471
    :cond_5d
    shl-int/lit8 v5, v4, 0x4

    or-int v4, v5, v2

    .line 2460
    add-int/lit8 v3, v3, 0x1

    goto :goto_34

    .line 2473
    .end local v1    # "ch":I
    .end local v2    # "digit":I
    :cond_64
    int-to-char v0, v4

    goto :goto_22

    .line 2432
    :sswitch_data_66
    .sparse-switch
        0x22 -> :sswitch_22
        0x2f -> :sswitch_22
        0x5c -> :sswitch_22
        0x62 -> :sswitch_23
        0x66 -> :sswitch_2c
        0x6e -> :sswitch_29
        0x72 -> :sswitch_2f
        0x74 -> :sswitch_26
        0x75 -> :sswitch_32
    .end sparse-switch
.end method

.method protected final _finishString()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1919
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1920
    .local v4, "ptr":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 1922
    .local v2, "inputLen":I
    if-ge v4, v2, :cond_2d

    .line 1923
    sget-object v1, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_icLatin1:[I

    .line 1924
    .local v1, "codes":[I
    array-length v3, v1

    .line 1927
    .local v3, "maxCode":I
    :cond_9
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    aget-char v0, v5, v4

    .line 1928
    .local v0, "ch":I
    if-ge v0, v3, :cond_29

    aget v5, v1, v0

    if-eqz v5, :cond_29

    .line 1929
    const/16 v5, 0x22

    if-ne v0, v5, :cond_2d

    .line 1930
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    sub-int v8, v4, v8

    invoke-virtual {v5, v6, v7, v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithShared([CII)V

    .line 1931
    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1947
    .end local v0    # "ch":I
    .end local v1    # "codes":[I
    .end local v3    # "maxCode":I
    :goto_28
    return-void

    .line 1937
    .restart local v0    # "ch":I
    .restart local v1    # "codes":[I
    .restart local v3    # "maxCode":I
    :cond_29
    add-int/lit8 v4, v4, 0x1

    .line 1938
    if-lt v4, v2, :cond_9

    .line 1944
    .end local v0    # "ch":I
    .end local v1    # "codes":[I
    .end local v3    # "maxCode":I
    :cond_2d
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    sub-int v8, v4, v8

    invoke-virtual {v5, v6, v7, v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithCopy([CII)V

    .line 1945
    iput v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1946
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_finishString2()V

    goto :goto_28
.end method

.method protected _finishString2()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1951
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegment()[C

    move-result-object v4

    .line 1952
    .local v4, "outBuf":[C
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v5

    .line 1953
    .local v5, "outPtr":I
    sget-object v1, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_icLatin1:[I

    .line 1954
    .local v1, "codes":[I
    array-length v3, v1

    .line 1957
    .local v3, "maxCode":I
    :goto_f
    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_20

    .line 1958
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v7

    if-nez v7, :cond_20

    .line 1959
    const-string v7, ": was expecting closing quote for a string value"

    invoke-virtual {p0, v7}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1962
    :cond_20
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v7, v8

    .line 1963
    .local v0, "c":C
    move v2, v0

    .line 1964
    .local v2, "i":I
    if-ge v2, v3, :cond_43

    aget v7, v1, v2

    if-eqz v7, :cond_43

    .line 1965
    const/16 v7, 0x22

    if-ne v2, v7, :cond_3b

    .line 1985
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7, v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1986
    return-void

    .line 1967
    :cond_3b
    const/16 v7, 0x5c

    if-ne v2, v7, :cond_53

    .line 1972
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeEscaped()C

    move-result v0

    .line 1978
    :cond_43
    :goto_43
    array-length v7, v4

    if-lt v5, v7, :cond_4d

    .line 1979
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v4

    .line 1980
    const/4 v5, 0x0

    .line 1983
    :cond_4d
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outPtr":I
    .local v6, "outPtr":I
    aput-char v0, v4, v5

    move v5, v6

    .line 1984
    .end local v6    # "outPtr":I
    .restart local v5    # "outPtr":I
    goto :goto_f

    .line 1973
    :cond_53
    const/16 v7, 0x20

    if-ge v2, v7, :cond_43

    .line 1974
    const-string v7, "string value"

    invoke-virtual {p0, v2, v7}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_43
.end method

.method protected final _getText2(Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/String;
    .registers 3
    .param p1, "t"    # Lcom/fasterxml/jackson/core/JsonToken;

    .prologue
    .line 303
    if-nez p1, :cond_4

    .line 304
    const/4 v0, 0x0

    .line 316
    :goto_3
    return-object v0

    .line 306
    :cond_4
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v0

    packed-switch v0, :pswitch_data_1e

    .line 316
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonToken;->asString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 308
    :pswitch_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 314
    :pswitch_17
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 306
    :pswitch_data_1e
    .packed-switch 0x5
        :pswitch_10
        :pswitch_17
        :pswitch_17
        :pswitch_17
    .end packed-switch
.end method

.method protected _handleApos()Lcom/fasterxml/jackson/core/JsonToken;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x5c

    const/16 v8, 0x27

    .line 1829
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v2

    .line 1830
    .local v2, "outBuf":[C
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getCurrentSegmentSize()I

    move-result v3

    .line 1833
    .local v3, "outPtr":I
    :goto_10
    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v5, v6, :cond_21

    .line 1834
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_21

    .line 1835
    const-string v5, ": was expecting closing quote for a string value"

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1838
    :cond_21
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v5, v6

    .line 1839
    .local v0, "c":C
    move v1, v0

    .line 1840
    .local v1, "i":I
    if-gt v1, v9, :cond_34

    .line 1841
    if-ne v1, v9, :cond_44

    .line 1846
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeEscaped()C

    move-result v0

    .line 1857
    :cond_34
    :goto_34
    array-length v5, v2

    if-lt v3, v5, :cond_3e

    .line 1858
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v2

    .line 1859
    const/4 v3, 0x0

    .line 1862
    :cond_3e
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "outPtr":I
    .local v4, "outPtr":I
    aput-char v0, v2, v3

    move v3, v4

    .line 1863
    .end local v4    # "outPtr":I
    .restart local v3    # "outPtr":I
    goto :goto_10

    .line 1847
    :cond_44
    if-gt v1, v8, :cond_34

    .line 1848
    if-ne v1, v8, :cond_50

    .line 1864
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v5, v3}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1865
    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v5

    .line 1851
    :cond_50
    const/16 v5, 0x20

    if-ge v1, v5, :cond_34

    .line 1852
    const-string v5, "string value"

    invoke-virtual {p0, v1, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_34
.end method

.method protected _handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 12
    .param p1, "ch"    # I
    .param p2, "negative"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x3

    const-wide/high16 v3, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    const-wide/high16 v1, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    .line 1550
    const/16 v5, 0x49

    if-ne p1, v5, :cond_5d

    .line 1551
    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v5, v6, :cond_18

    .line 1552
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_18

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOFInValue()V

    .line 1554
    :cond_18
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char p1, v5, v6

    .line 1555
    const/16 v5, 0x4e

    if-ne p1, v5, :cond_64

    .line 1556
    if-eqz p2, :cond_3c

    const-string v0, "-INF"

    .line 1557
    .local v0, "match":Ljava/lang/String;
    :goto_2a
    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1558
    sget-object v5, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v5

    if-eqz v5, :cond_41

    .line 1559
    if-eqz p2, :cond_3f

    :goto_37
    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 1572
    .end local v0    # "match":Ljava/lang/String;
    :goto_3b
    return-object v1

    .line 1556
    :cond_3c
    const-string v0, "+INF"

    goto :goto_2a

    .restart local v0    # "match":Ljava/lang/String;
    :cond_3f
    move-wide v1, v3

    .line 1559
    goto :goto_37

    .line 1561
    :cond_41
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

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportError(Ljava/lang/String;)V

    .line 1571
    .end local v0    # "match":Ljava/lang/String;
    :cond_5d
    :goto_5d
    const-string v1, "expected digit (0-9) to follow minus sign, for valid numeric value"

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1572
    const/4 v1, 0x0

    goto :goto_3b

    .line 1562
    :cond_64
    const/16 v5, 0x6e

    if-ne p1, v5, :cond_5d

    .line 1563
    if-eqz p2, :cond_7e

    const-string v0, "-Infinity"

    .line 1564
    .restart local v0    # "match":Ljava/lang/String;
    :goto_6c
    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1565
    sget-object v5, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v5

    if-eqz v5, :cond_83

    .line 1566
    if-eqz p2, :cond_81

    :goto_79
    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    goto :goto_3b

    .line 1563
    .end local v0    # "match":Ljava/lang/String;
    :cond_7e
    const-string v0, "+Infinity"

    goto :goto_6c

    .restart local v0    # "match":Ljava/lang/String;
    :cond_81
    move-wide v1, v3

    .line 1566
    goto :goto_79

    .line 1568
    :cond_83
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

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportError(Ljava/lang/String;)V

    goto :goto_5d
.end method

.method protected _handleOddName(I)Ljava/lang/String;
    .registers 13
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1696
    const/16 v8, 0x27

    if-ne p1, v8, :cond_11

    sget-object v8, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 1697
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseAposName()Ljava/lang/String;

    move-result-object v8

    .line 1741
    :goto_10
    return-object v8

    .line 1700
    :cond_11
    sget-object v8, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_UNQUOTED_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v8

    if-nez v8, :cond_1e

    .line 1701
    const-string v8, "was expecting double-quote to start field name"

    invoke-virtual {p0, p1, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 1703
    :cond_1e
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeLatin1JsNames()[I

    move-result-object v1

    .line 1704
    .local v1, "codes":[I
    array-length v5, v1

    .line 1709
    .local v5, "maxCode":I
    if-ge p1, v5, :cond_56

    .line 1710
    aget v8, v1, p1

    if-nez v8, :cond_54

    const/4 v2, 0x1

    .line 1714
    .local v2, "firstOk":Z
    :goto_2a
    if-nez v2, :cond_31

    .line 1715
    const-string v8, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name"

    invoke-virtual {p0, p1, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 1717
    :cond_31
    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1718
    .local v6, "ptr":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_hashSeed:I

    .line 1719
    .local v3, "hash":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 1721
    .local v4, "inputLen":I
    if-ge v6, v4, :cond_7c

    .line 1723
    :cond_39
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    aget-char v0, v8, v6

    .line 1724
    .local v0, "ch":I
    if-ge v0, v5, :cond_5c

    .line 1725
    aget v8, v1, v0

    if-eqz v8, :cond_74

    .line 1726
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v7, v8, -0x1

    .line 1727
    .local v7, "start":I
    iput v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1728
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    sub-int v10, v6, v7

    invoke-virtual {v8, v9, v7, v10, v3}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->findSymbol([CIII)Ljava/lang/String;

    move-result-object v8

    goto :goto_10

    .line 1710
    .end local v0    # "ch":I
    .end local v2    # "firstOk":Z
    .end local v3    # "hash":I
    .end local v4    # "inputLen":I
    .end local v6    # "ptr":I
    .end local v7    # "start":I
    :cond_54
    const/4 v2, 0x0

    goto :goto_2a

    .line 1712
    :cond_56
    int-to-char v8, p1

    invoke-static {v8}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v2

    .restart local v2    # "firstOk":Z
    goto :goto_2a

    .line 1730
    .restart local v0    # "ch":I
    .restart local v3    # "hash":I
    .restart local v4    # "inputLen":I
    .restart local v6    # "ptr":I
    :cond_5c
    int-to-char v8, v0

    invoke-static {v8}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v8

    if-nez v8, :cond_74

    .line 1731
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v7, v8, -0x1

    .line 1732
    .restart local v7    # "start":I
    iput v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1733
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    sub-int v10, v6, v7

    invoke-virtual {v8, v9, v7, v10, v3}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->findSymbol([CIII)Ljava/lang/String;

    move-result-object v8

    goto :goto_10

    .line 1735
    .end local v7    # "start":I
    :cond_74
    mul-int/lit8 v8, v3, 0x21

    add-int v3, v8, v0

    .line 1736
    add-int/lit8 v6, v6, 0x1

    .line 1737
    if-lt v6, v4, :cond_39

    .line 1739
    .end local v0    # "ch":I
    :cond_7c
    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v7, v8, -0x1

    .line 1740
    .restart local v7    # "start":I
    iput v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1741
    invoke-direct {p0, v7, v3, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleOddName2(II[I)Ljava/lang/String;

    move-result-object v8

    goto :goto_10
.end method

.method protected _handleOddValue(I)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 5
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 1783
    sparse-switch p1, :sswitch_data_8e

    .line 1819
    :cond_4
    :goto_4
    invoke-static {p1}, Ljava/lang/Character;->isJavaIdentifierStart(I)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 1820
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

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 1823
    :cond_23
    const-string v0, "expected a valid value (number, String, array, object, \'true\', \'false\' or \'null\')"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 1824
    const/4 v0, 0x0

    :goto_29
    return-object v0

    .line 1792
    :sswitch_2a
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1793
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleApos()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 1797
    :sswitch_37
    const-string v0, "NaN"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1798
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 1799
    const-string v0, "NaN"

    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 1801
    :cond_4d
    const-string v0, "Non-standard token \'NaN\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportError(Ljava/lang/String;)V

    goto :goto_4

    .line 1804
    :sswitch_53
    const-string v0, "Infinity"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1805
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_69

    .line 1806
    const-string v0, "Infinity"

    const-wide/high16 v1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 1808
    :cond_69
    const-string v0, "Non-standard token \'Infinity\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportError(Ljava/lang/String;)V

    goto :goto_4

    .line 1811
    :sswitch_6f
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_7e

    .line 1812
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_7e

    .line 1813
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOFInValue()V

    .line 1816
    :cond_7e
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v0, v1

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 1783
    :sswitch_data_8e
    .sparse-switch
        0x27 -> :sswitch_2a
        0x2b -> :sswitch_6f
        0x49 -> :sswitch_53
        0x4e -> :sswitch_37
    .end sparse-switch
.end method

.method protected _isNextTokenNameMaybe(ILjava/lang/String;)Z
    .registers 7
    .param p1, "i"    # I
    .param p2, "nameToMatch"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 980
    if-ne p1, v3, :cond_26

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseName()Ljava/lang/String;

    move-result-object v0

    .line 981
    .local v0, "name":Ljava/lang/String;
    :goto_8
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2, v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 982
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 983
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon()I

    move-result p1

    .line 984
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 985
    if-ne p1, v3, :cond_2b

    .line 986
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 987
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 988
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 1031
    :goto_25
    return v2

    .line 980
    .end local v0    # "name":Ljava/lang/String;
    :cond_26
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleOddName(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_8

    .line 992
    .restart local v0    # "name":Ljava/lang/String;
    :cond_2b
    sparse-switch p1, :sswitch_data_5c

    .line 1027
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleOddValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 1030
    .local v1, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_32
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1031
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_25

    .line 994
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_39
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 995
    .restart local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_32

    .line 1006
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_3e
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 1007
    .restart local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_32

    .line 1009
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_43
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchFalse()V

    .line 1010
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1011
    .restart local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_32

    .line 1013
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_49
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchNull()V

    .line 1014
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1015
    .restart local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_32

    .line 1017
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_4f
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchTrue()V

    .line 1018
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1019
    .restart local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_32

    .line 1021
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_55
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1022
    .restart local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_32

    .line 1024
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_58
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1025
    .restart local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_32

    .line 992
    nop

    :sswitch_data_5c
    .sparse-switch
        0x2d -> :sswitch_39
        0x30 -> :sswitch_3e
        0x31 -> :sswitch_3e
        0x32 -> :sswitch_3e
        0x33 -> :sswitch_3e
        0x34 -> :sswitch_3e
        0x35 -> :sswitch_3e
        0x36 -> :sswitch_3e
        0x37 -> :sswitch_3e
        0x38 -> :sswitch_3e
        0x39 -> :sswitch_3e
        0x5b -> :sswitch_55
        0x66 -> :sswitch_43
        0x6e -> :sswitch_49
        0x74 -> :sswitch_4f
        0x7b -> :sswitch_58
    .end sparse-switch
.end method

.method protected final _matchToken(Ljava/lang/String;I)V
    .registers 8
    .param p1, "matchStr"    # Ljava/lang/String;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 2529
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2532
    .local v1, "len":I
    :cond_5
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_18

    .line 2533
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v2

    if-nez v2, :cond_18

    .line 2534
    invoke-virtual {p1, v4, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidToken(Ljava/lang/String;)V

    .line 2537
    :cond_18
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v2, v2, v3

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_2b

    .line 2538
    invoke-virtual {p1, v4, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidToken(Ljava/lang/String;)V

    .line 2540
    :cond_2b
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2541
    add-int/lit8 p2, p2, 0x1

    if-lt p2, v1, :cond_5

    .line 2544
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_42

    .line 2545
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v2

    if-nez v2, :cond_42

    .line 2557
    :cond_41
    :goto_41
    return-void

    .line 2549
    :cond_42
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v2, v3

    .line 2550
    .local v0, "c":C
    const/16 v2, 0x30

    if-lt v0, v2, :cond_41

    const/16 v2, 0x5d

    if-eq v0, v2, :cond_41

    const/16 v2, 0x7d

    if-eq v0, v2, :cond_41

    .line 2554
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v2

    if-eqz v2, :cond_41

    .line 2555
    invoke-virtual {p1, v4, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidToken(Ljava/lang/String;)V

    goto :goto_41
.end method

.method protected _parseAposName()Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x27

    .line 1747
    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1748
    .local v5, "ptr":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_hashSeed:I

    .line 1749
    .local v2, "hash":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 1751
    .local v3, "inputLen":I
    if-ge v5, v3, :cond_2a

    .line 1752
    sget-object v1, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_icLatin1:[I

    .line 1753
    .local v1, "codes":[I
    array-length v4, v1

    .line 1756
    .local v4, "maxCode":I
    :cond_d
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    aget-char v0, v7, v5

    .line 1757
    .local v0, "ch":I
    if-ne v0, v8, :cond_24

    .line 1758
    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1759
    .local v6, "start":I
    add-int/lit8 v7, v5, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1760
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    sub-int v9, v5, v6

    invoke-virtual {v7, v8, v6, v9, v2}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->findSymbol([CIII)Ljava/lang/String;

    move-result-object v7

    .line 1773
    .end local v0    # "ch":I
    .end local v1    # "codes":[I
    .end local v4    # "maxCode":I
    :goto_23
    return-object v7

    .line 1762
    .end local v6    # "start":I
    .restart local v0    # "ch":I
    .restart local v1    # "codes":[I
    .restart local v4    # "maxCode":I
    :cond_24
    if-ge v0, v4, :cond_33

    aget v7, v1, v0

    if-eqz v7, :cond_33

    .line 1770
    .end local v0    # "ch":I
    .end local v1    # "codes":[I
    .end local v4    # "maxCode":I
    :cond_2a
    :goto_2a
    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1771
    .restart local v6    # "start":I
    iput v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1773
    invoke-direct {p0, v6, v2, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseName2(III)Ljava/lang/String;

    move-result-object v7

    goto :goto_23

    .line 1765
    .end local v6    # "start":I
    .restart local v0    # "ch":I
    .restart local v1    # "codes":[I
    .restart local v4    # "maxCode":I
    :cond_33
    mul-int/lit8 v7, v2, 0x21

    add-int v2, v7, v0

    .line 1766
    add-int/lit8 v5, v5, 0x1

    .line 1767
    if-lt v5, v3, :cond_d

    goto :goto_2a
.end method

.method protected final _parseName()Ljava/lang/String;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x22

    .line 1611
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1612
    .local v3, "ptr":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_hashSeed:I

    .line 1613
    .local v2, "hash":I
    sget-object v1, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_icLatin1:[I

    .line 1615
    .local v1, "codes":[I
    :goto_8
    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v3, v5, :cond_31

    .line 1616
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    aget-char v0, v5, v3

    .line 1617
    .local v0, "ch":I
    array-length v5, v1

    if-ge v0, v5, :cond_2a

    aget v5, v1, v0

    if-eqz v5, :cond_2a

    .line 1618
    if-ne v0, v6, :cond_31

    .line 1619
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1620
    .local v4, "start":I
    add-int/lit8 v5, v3, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1621
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    sub-int v7, v3, v4

    invoke-virtual {v5, v6, v4, v7, v2}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->findSymbol([CIII)Ljava/lang/String;

    move-result-object v5

    .line 1630
    .end local v0    # "ch":I
    :goto_29
    return-object v5

    .line 1625
    .end local v4    # "start":I
    .restart local v0    # "ch":I
    :cond_2a
    mul-int/lit8 v5, v2, 0x21

    add-int v2, v5, v0

    .line 1626
    add-int/lit8 v3, v3, 0x1

    .line 1627
    goto :goto_8

    .line 1628
    .end local v0    # "ch":I
    :cond_31
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1629
    .restart local v4    # "start":I
    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1630
    invoke-direct {p0, v4, v2, v6}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseName2(III)Ljava/lang/String;

    move-result-object v5

    goto :goto_29
.end method

.method protected final _parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x39

    const/16 v9, 0x30

    const/4 v4, 0x1

    .line 1321
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1322
    .local v3, "ptr":I
    add-int/lit8 v2, v3, -0x1

    .line 1323
    .local v2, "startPtr":I
    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 1325
    .local v6, "inputLen":I
    if-lt v3, v6, :cond_12

    .line 1326
    invoke-direct {p0, v4, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 1364
    :goto_11
    return-object v0

    .line 1328
    :cond_12
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 v8, v3, 0x1

    .end local v3    # "ptr":I
    .local v8, "ptr":I
    aget-char v1, v0, v3

    .line 1330
    .local v1, "ch":I
    if-gt v1, v10, :cond_1c

    if-ge v1, v9, :cond_24

    .line 1331
    :cond_1c
    iput v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1332
    invoke-virtual {p0, v1, v4}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    move v3, v8

    .end local v8    # "ptr":I
    .restart local v3    # "ptr":I
    goto :goto_11

    .line 1335
    .end local v3    # "ptr":I
    .restart local v8    # "ptr":I
    :cond_24
    if-ne v1, v9, :cond_2c

    .line 1336
    invoke-direct {p0, v4, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    move v3, v8

    .end local v8    # "ptr":I
    .restart local v3    # "ptr":I
    goto :goto_11

    .line 1338
    .end local v3    # "ptr":I
    .restart local v8    # "ptr":I
    :cond_2c
    const/4 v5, 0x1

    .line 1343
    .local v5, "intLen":I
    :goto_2d
    if-lt v8, v6, :cond_35

    .line 1344
    invoke-direct {p0, v4, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    move v3, v8

    .end local v8    # "ptr":I
    .restart local v3    # "ptr":I
    goto :goto_11

    .line 1346
    .end local v3    # "ptr":I
    .restart local v8    # "ptr":I
    :cond_35
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 v3, v8, 0x1

    .end local v8    # "ptr":I
    .restart local v3    # "ptr":I
    aget-char v1, v0, v8

    .line 1347
    if-lt v1, v9, :cond_3f

    if-le v1, v10, :cond_53

    .line 1353
    :cond_3f
    const/16 v0, 0x2e

    if-eq v1, v0, :cond_4b

    const/16 v0, 0x65

    if-eq v1, v0, :cond_4b

    const/16 v0, 0x45

    if-ne v1, v0, :cond_57

    .line 1354
    :cond_4b
    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    move-object v0, p0

    .line 1355
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseFloat(IIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_11

    .line 1350
    :cond_53
    add-int/lit8 v5, v5, 0x1

    move v8, v3

    .end local v3    # "ptr":I
    .restart local v8    # "ptr":I
    goto :goto_2d

    .line 1357
    .end local v8    # "ptr":I
    .restart local v3    # "ptr":I
    :cond_57
    add-int/lit8 v3, v3, -0x1

    .line 1358
    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1359
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_66

    .line 1360
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_verifyRootSpace(I)V

    .line 1362
    :cond_66
    sub-int v7, v3, v2

    .line 1363
    .local v7, "len":I
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    invoke-virtual {v0, v9, v2, v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithShared([CII)V

    .line 1364
    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_11
.end method

.method protected final _parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 11
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x30

    const/4 v4, 0x0

    .line 1209
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1210
    .local v3, "ptr":I
    add-int/lit8 v2, v3, -0x1

    .line 1211
    .local v2, "startPtr":I
    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 1214
    .local v6, "inputLen":I
    if-ne p1, v1, :cond_10

    .line 1215
    invoke-direct {p0, v4, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 1252
    :goto_f
    return-object v0

    .line 1224
    :cond_10
    const/4 v5, 0x1

    .local v5, "intLen":I
    move v8, v3

    .line 1229
    .end local v3    # "ptr":I
    .local v8, "ptr":I
    :goto_12
    if-lt v8, v6, :cond_1c

    .line 1230
    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1231
    invoke-direct {p0, v4, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNumber2(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    move v3, v8

    .end local v8    # "ptr":I
    .restart local v3    # "ptr":I
    goto :goto_f

    .line 1233
    .end local v3    # "ptr":I
    .restart local v8    # "ptr":I
    :cond_1c
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    add-int/lit8 v3, v8, 0x1

    .end local v8    # "ptr":I
    .restart local v3    # "ptr":I
    aget-char p1, v0, v8

    .line 1234
    if-lt p1, v1, :cond_28

    const/16 v0, 0x39

    if-le p1, v0, :cond_3d

    .line 1239
    :cond_28
    const/16 v0, 0x2e

    if-eq p1, v0, :cond_34

    const/16 v0, 0x65

    if-eq p1, v0, :cond_34

    const/16 v0, 0x45

    if-ne p1, v0, :cond_41

    .line 1240
    :cond_34
    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    move-object v0, p0

    move v1, p1

    .line 1241
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseFloat(IIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_f

    .line 1237
    :cond_3d
    add-int/lit8 v5, v5, 0x1

    move v8, v3

    .end local v3    # "ptr":I
    .restart local v8    # "ptr":I
    goto :goto_12

    .line 1244
    .end local v8    # "ptr":I
    .restart local v3    # "ptr":I
    :cond_41
    add-int/lit8 v3, v3, -0x1

    .line 1245
    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1247
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_50

    .line 1248
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_verifyRootSpace(I)V

    .line 1250
    :cond_50
    sub-int v7, v3, v2

    .line 1251
    .local v7, "len":I
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    invoke-virtual {v0, v1, v2, v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->resetWithShared([CII)V

    .line 1252
    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_f
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
    .line 451
    const/4 v5, 0x0

    .line 452
    .local v5, "outputPtr":I
    array-length v7, p3

    add-int/lit8 v4, v7, -0x3

    .line 453
    .local v4, "outputEnd":I
    const/4 v3, 0x0

    .line 459
    .local v3, "outputCount":I
    :cond_5
    :goto_5
    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_e

    .line 460
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 462
    :cond_e
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v7, v8

    .line 463
    .local v1, "ch":C
    const/16 v7, 0x20

    if-le v1, v7, :cond_5

    .line 464
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(C)I

    move-result v0

    .line 465
    .local v0, "bits":I
    if-gez v0, :cond_38

    .line 466
    const/16 v7, 0x22

    if-ne v1, v7, :cond_31

    .line 567
    :goto_26
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 568
    if-lez v5, :cond_30

    .line 569
    add-int/2addr v3, v5

    .line 570
    const/4 v7, 0x0

    invoke-virtual {p2, p3, v7, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 572
    :cond_30
    return v3

    .line 469
    :cond_31
    const/4 v7, 0x0

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;CI)I

    move-result v0

    .line 470
    if-ltz v0, :cond_5

    .line 476
    :cond_38
    if-le v5, v4, :cond_40

    .line 477
    add-int/2addr v3, v5

    .line 478
    const/4 v7, 0x0

    invoke-virtual {p2, p3, v7, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 479
    const/4 v5, 0x0

    .line 482
    :cond_40
    move v2, v0

    .line 486
    .local v2, "decodedData":I
    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_4a

    .line 487
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 489
    :cond_4a
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v7, v8

    .line 490
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(C)I

    move-result v0

    .line 491
    if-gez v0, :cond_5f

    .line 492
    const/4 v7, 0x1

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;CI)I

    move-result v0

    .line 494
    :cond_5f
    shl-int/lit8 v7, v2, 0x6

    or-int v2, v7, v0

    .line 497
    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_6c

    .line 498
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 500
    :cond_6c
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v7, v8

    .line 501
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(C)I

    move-result v0

    .line 504
    if-gez v0, :cond_e0

    .line 505
    const/4 v7, -0x2

    if-eq v0, v7, :cond_97

    .line 507
    const/16 v7, 0x22

    if-ne v1, v7, :cond_92

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v7

    if-nez v7, :cond_92

    .line 508
    shr-int/lit8 v2, v2, 0x4

    .line 509
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .local v6, "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v5

    move v5, v6

    .line 510
    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    goto :goto_26

    .line 512
    :cond_92
    const/4 v7, 0x2

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;CI)I

    move-result v0

    .line 514
    :cond_97
    const/4 v7, -0x2

    if-ne v0, v7, :cond_e0

    .line 516
    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_a3

    .line 517
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 519
    :cond_a3
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v7, v8

    .line 520
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPaddingChar(C)Z

    move-result v7

    if-nez v7, :cond_d6

    .line 521
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

    invoke-virtual {p0, p1, v1, v7, v8}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->reportInvalidBase64Char(Lcom/fasterxml/jackson/core/Base64Variant;IILjava/lang/String;)Ljava/lang/IllegalArgumentException;

    move-result-object v7

    throw v7

    .line 524
    :cond_d6
    shr-int/lit8 v2, v2, 0x4

    .line 525
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v5

    move v5, v6

    .line 526
    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    goto/16 :goto_5

    .line 530
    :cond_e0
    shl-int/lit8 v7, v2, 0x6

    or-int v2, v7, v0

    .line 532
    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_ed

    .line 533
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMoreGuaranteed()V

    .line 535
    :cond_ed
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v1, v7, v8

    .line 536
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(C)I

    move-result v0

    .line 537
    if-gez v0, :cond_132

    .line 538
    const/4 v7, -0x2

    if-eq v0, v7, :cond_11f

    .line 540
    const/16 v7, 0x22

    if-ne v1, v7, :cond_11a

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v7

    if-nez v7, :cond_11a

    .line 541
    shr-int/lit8 v2, v2, 0x2

    .line 542
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x8

    int-to-byte v7, v7

    aput-byte v7, p3, v5

    .line 543
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v6

    goto/16 :goto_26

    .line 546
    :cond_11a
    const/4 v7, 0x3

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;CI)I

    move-result v0

    .line 548
    :cond_11f
    const/4 v7, -0x2

    if-ne v0, v7, :cond_132

    .line 555
    shr-int/lit8 v2, v2, 0x2

    .line 556
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x8

    int-to-byte v7, v7

    aput-byte v7, p3, v5

    .line 557
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v6

    goto/16 :goto_5

    .line 562
    :cond_132
    shl-int/lit8 v7, v2, 0x6

    or-int v2, v7, v0

    .line 563
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x10

    int-to-byte v7, v7

    aput-byte v7, p3, v5

    .line 564
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x8

    int-to-byte v7, v7

    aput-byte v7, p3, v6

    .line 565
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v5

    move v5, v6

    .line 566
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
    .line 228
    invoke-super {p0}, Lcom/fasterxml/jackson/core/base/ParserBase;->_releaseBuffers()V

    .line 230
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/sym/CharsToNameCanonicalizer;->release()V

    .line 232
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_bufferRecyclable:Z

    if-eqz v1, :cond_18

    .line 233
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    .line 234
    .local v0, "buf":[C
    if-eqz v0, :cond_18

    .line 235
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    .line 236
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseTokenBuffer([C)V

    .line 239
    .end local v0    # "buf":[C
    :cond_18
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
    .line 2731
    const-string v0, "\'null\', \'true\', \'false\' or NaN"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 2732
    return-void
.end method

.method protected _reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "matchedPart"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2736
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 2742
    .local v1, "sb":Ljava/lang/StringBuilder;
    :goto_5
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_36

    .line 2743
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v2

    if-nez v2, :cond_36

    .line 2754
    :cond_11
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized token \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\': was expecting "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportError(Ljava/lang/String;)V

    .line 2755
    return-void

    .line 2747
    :cond_36
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v2, v3

    .line 2748
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v2

    if-eqz v2, :cond_11

    .line 2751
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2752
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

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
    .line 2047
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_c

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 2048
    :cond_c
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v0, v1

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1c

    .line 2049
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2052
    :cond_1c
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    .line 2053
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    .line 2054
    return-void
.end method

.method protected final _skipString()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x5c

    const/16 v7, 0x22

    .line 1995
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 1997
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 1998
    .local v4, "inPtr":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 1999
    .local v3, "inLen":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    .line 2002
    .local v2, "inBuf":[C
    :goto_d
    if-lt v4, v3, :cond_20

    .line 2003
    iput v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2004
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v6

    if-nez v6, :cond_1c

    .line 2005
    const-string v6, ": was expecting closing quote for a string value"

    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2007
    :cond_1c
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2008
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 2010
    :cond_20
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "inPtr":I
    .local v5, "inPtr":I
    aget-char v0, v2, v4

    .line 2011
    .local v0, "c":C
    move v1, v0

    .line 2012
    .local v1, "i":I
    if-gt v1, v8, :cond_46

    .line 2013
    if-ne v1, v8, :cond_34

    .line 2018
    iput v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2019
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeEscaped()C

    move-result v0

    .line 2020
    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2021
    .end local v5    # "inPtr":I
    .restart local v4    # "inPtr":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    goto :goto_d

    .line 2022
    .end local v4    # "inPtr":I
    .restart local v5    # "inPtr":I
    :cond_34
    if-gt v1, v7, :cond_46

    .line 2023
    if-ne v1, v7, :cond_3b

    .line 2024
    iput v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2034
    return-void

    .line 2027
    :cond_3b
    const/16 v6, 0x20

    if-ge v1, v6, :cond_46

    .line 2028
    iput v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 2029
    const-string v6, "string value"

    invoke-virtual {p0, v1, v6}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    :cond_46
    move v4, v5

    .end local v5    # "inPtr":I
    .restart local v4    # "inPtr":I
    goto :goto_d
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
    .line 403
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_2e

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_EMBEDDED_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_10

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_binaryValue:[B

    if-nez v2, :cond_2e

    .line 405
    :cond_10
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Current token ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") not VALUE_STRING or VALUE_EMBEDDED_OBJECT, can not access as binary"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportError(Ljava/lang/String;)V

    .line 410
    :cond_2e
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_65

    .line 412
    :try_start_32
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64(Lcom/fasterxml/jackson/core/Base64Variant;)[B

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_binaryValue:[B
    :try_end_38
    .catch Ljava/lang/IllegalArgumentException; {:try_start_32 .. :try_end_38} :catch_3e

    .line 419
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 428
    :cond_3b
    :goto_3b
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_binaryValue:[B

    return-object v2

    .line 413
    :catch_3e
    move-exception v1

    .line 414
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

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_constructError(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParseException;

    move-result-object v2

    throw v2

    .line 421
    .end local v1    # "iae":Ljava/lang/IllegalArgumentException;
    :cond_65
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_binaryValue:[B

    if-nez v2, :cond_3b

    .line 423
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_getByteArrayBuilder()Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    move-result-object v0

    .line 424
    .local v0, "builder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_decodeBase64(Ljava/lang/String;Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;Lcom/fasterxml/jackson/core/Base64Variant;)V

    .line 425
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_binaryValue:[B

    goto :goto_3b
.end method

.method public getCodec()Lcom/fasterxml/jackson/core/ObjectCodec;
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    return-object v0
.end method

.method public getCurrentLocation()Lcom/fasterxml/jackson/core/JsonLocation;
    .registers 11

    .prologue
    .line 2700
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    sub-int/2addr v0, v1

    add-int/lit8 v7, v0, 0x1

    .line 2701
    .local v7, "col":I
    new-instance v0, Lcom/fasterxml/jackson/core/JsonLocation;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/io/IOContext;->getSourceReference()Ljava/lang/Object;

    move-result-object v1

    const-wide/16 v2, -0x1

    iget-wide v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputProcessed:J

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    int-to-long v8, v6

    add-long/2addr v4, v8

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRow:I

    invoke-direct/range {v0 .. v7}, Lcom/fasterxml/jackson/core/JsonLocation;-><init>(Ljava/lang/Object;JJII)V

    return-object v0
.end method

.method public getInputSource()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reader:Ljava/io/Reader;

    return-object v0
.end method

.method protected getNextChar(Ljava/lang/String;)C
    .registers 5
    .param p1, "eofMsg"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_f

    .line 198
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 200
    :cond_f
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    aget-char v0, v0, v1

    return v0
.end method

.method public final getText()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 256
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 257
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_17

    .line 258
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_10

    .line 259
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 260
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_finishString()V

    .line 262
    :cond_10
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v1

    .line 264
    :goto_16
    return-object v1

    :cond_17
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_getText2(Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/String;

    move-result-object v1

    goto :goto_16
.end method

.method public final getTextCharacters()[C
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 323
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v2, :cond_54

    .line 324
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v2

    packed-switch v2, :pswitch_data_56

    .line 348
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonToken;->asCharArray()[C

    move-result-object v2

    .line 351
    :goto_14
    return-object v2

    .line 326
    :pswitch_15
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopied:Z

    if-nez v2, :cond_37

    .line 327
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 328
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 329
    .local v1, "nameLen":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopyBuffer:[C

    if-nez v2, :cond_3a

    .line 330
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocNameCopyBuffer(I)[C

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopyBuffer:[C

    .line 334
    :cond_2f
    :goto_2f
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopyBuffer:[C

    invoke-virtual {v0, v3, v1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 335
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopied:Z

    .line 337
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "nameLen":I
    :cond_37
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopyBuffer:[C

    goto :goto_14

    .line 331
    .restart local v0    # "name":Ljava/lang/String;
    .restart local v1    # "nameLen":I
    :cond_3a
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopyBuffer:[C

    array-length v2, v2

    if-ge v2, v1, :cond_2f

    .line 332
    new-array v2, v1, [C

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopyBuffer:[C

    goto :goto_2f

    .line 339
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "nameLen":I
    :pswitch_44
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_4d

    .line 340
    iput-boolean v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 341
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_finishString()V

    .line 346
    :cond_4d
    :pswitch_4d
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextBuffer()[C

    move-result-object v2

    goto :goto_14

    .line 351
    :cond_54
    const/4 v2, 0x0

    goto :goto_14

    .line 324
    :pswitch_data_56
    .packed-switch 0x5
        :pswitch_15
        :pswitch_44
        :pswitch_4d
        :pswitch_4d
    .end packed-switch
.end method

.method public final getTextLength()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 357
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v1, :cond_15

    .line 358
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v1

    packed-switch v1, :pswitch_data_32

    .line 371
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->asCharArray()[C

    move-result-object v0

    array-length v0, v0

    .line 374
    :cond_15
    :goto_15
    return v0

    .line 360
    :pswitch_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_15

    .line 362
    :pswitch_21
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_2a

    .line 363
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 364
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_finishString()V

    .line 369
    :cond_2a
    :pswitch_2a
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v0

    goto :goto_15

    .line 358
    nop

    :pswitch_data_32
    .packed-switch 0x5
        :pswitch_16
        :pswitch_21
        :pswitch_2a
        :pswitch_2a
    .end packed-switch
.end method

.method public final getTextOffset()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 381
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v1, :cond_e

    .line 382
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v1

    packed-switch v1, :pswitch_data_20

    .line 397
    :cond_e
    :goto_e
    :pswitch_e
    return v0

    .line 386
    :pswitch_f
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_18

    .line 387
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 388
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_finishString()V

    .line 393
    :cond_18
    :pswitch_18
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextOffset()I

    move-result v0

    goto :goto_e

    .line 382
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
    .registers 15

    .prologue
    const-wide/16 v10, 0x1

    const-wide/16 v2, -0x1

    .line 2688
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->getSourceReference()Ljava/lang/Object;

    move-result-object v1

    .line 2689
    .local v1, "src":Ljava/lang/Object;
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v6, :cond_21

    .line 2690
    iget-wide v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputProcessed:J

    iget-wide v8, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameStartOffset:J

    sub-long/2addr v8, v10

    add-long v4, v6, v8

    .line 2691
    .local v4, "total":J
    new-instance v0, Lcom/fasterxml/jackson/core/JsonLocation;

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameStartRow:I

    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameStartCol:I

    invoke-direct/range {v0 .. v7}, Lcom/fasterxml/jackson/core/JsonLocation;-><init>(Ljava/lang/Object;JJII)V

    .line 2694
    .end local v4    # "total":J
    :goto_20
    return-object v0

    :cond_21
    new-instance v6, Lcom/fasterxml/jackson/core/JsonLocation;

    iget-wide v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputTotal:J

    sub-long v10, v7, v10

    iget v12, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v13, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    move-object v7, v1

    move-wide v8, v2

    invoke-direct/range {v6 .. v13}, Lcom/fasterxml/jackson/core/JsonLocation;-><init>(Ljava/lang/Object;JJII)V

    move-object v0, v6

    goto :goto_20
.end method

.method public final getValueAsString()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_17

    .line 274
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_10

    .line 275
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 276
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_finishString()V

    .line 278
    :cond_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    .line 283
    :goto_16
    return-object v0

    .line 280
    :cond_17
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_22

    .line 281
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 283
    :cond_22
    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_16
.end method

.method public final getValueAsString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "defValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_17

    .line 290
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_10

    .line 291
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 292
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_finishString()V

    .line 294
    :cond_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    .line 299
    :goto_16
    return-object v0

    .line 296
    :cond_17
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_22

    .line 297
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    .line 299
    :cond_22
    invoke-super {p0, p1}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_16
.end method

.method protected loadMore()Z
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 169
    iget v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 171
    .local v0, "bufSize":I
    iget-wide v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputProcessed:J

    int-to-long v5, v0

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputProcessed:J

    .line 172
    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    sub-int/2addr v3, v0

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currInputRowStart:I

    .line 177
    iget-wide v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameStartOffset:J

    int-to-long v5, v0

    sub-long/2addr v3, v5

    iput-wide v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameStartOffset:J

    .line 179
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reader:Ljava/io/Reader;

    if-eqz v3, :cond_2a

    .line 180
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reader:Ljava/io/Reader;

    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    array-length v5, v5

    invoke-virtual {v3, v4, v2, v5}, Ljava/io/Reader;->read([CII)I

    move-result v1

    .line 181
    .local v1, "count":I
    if-lez v1, :cond_2b

    .line 182
    iput v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 183
    iput v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    .line 184
    const/4 v2, 0x1

    .line 193
    .end local v1    # "count":I
    :cond_2a
    return v2

    .line 187
    .restart local v1    # "count":I
    :cond_2b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_closeInput()V

    .line 189
    if-nez v1, :cond_2a

    .line 190
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Reader returned 0 characters when trying to read "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public final nextBooleanValue()Ljava/lang/Boolean;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1154
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v4, :cond_40

    .line 1155
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopied:Z

    .line 1156
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1157
    .local v1, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1158
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1159
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v3, :cond_17

    .line 1160
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1178
    :cond_16
    :goto_16
    return-object v2

    .line 1162
    :cond_17
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v3, :cond_1e

    .line 1163
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_16

    .line 1165
    :cond_1e
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v3, :cond_2f

    .line 1166
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v3, v4, v5}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_16

    .line 1167
    :cond_2f
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v3, :cond_16

    .line 1168
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v3, v4, v5}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_16

    .line 1172
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_40
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 1173
    .restart local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    if-eqz v1, :cond_16

    .line 1174
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v0

    .line 1175
    .local v0, "id":I
    const/16 v3, 0x9

    if-ne v0, v3, :cond_51

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_16

    .line 1176
    :cond_51
    const/16 v3, 0xa

    if-ne v0, v3, :cond_16

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_16
.end method

.method public nextFieldName()Ljava/lang/String;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x7d

    const/16 v6, 0x5d

    const/16 v5, 0x22

    const/4 v1, 0x0

    .line 829
    const/4 v3, 0x0

    iput v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_numTypesValid:I

    .line 830
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v3, v4, :cond_14

    .line 831
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    .line 927
    :goto_13
    return-object v1

    .line 834
    :cond_14
    iget-boolean v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v3, :cond_1b

    .line 835
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipString()V

    .line 837
    :cond_1b
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipWSOrEnd()I

    move-result v0

    .line 838
    .local v0, "i":I
    if-gez v0, :cond_27

    .line 839
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->close()V

    .line 840
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 843
    :cond_27
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_binaryValue:[B

    .line 844
    if-ne v0, v6, :cond_46

    .line 845
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 846
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v3

    if-nez v3, :cond_39

    .line 847
    invoke-virtual {p0, v0, v7}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 849
    :cond_39
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 850
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 853
    :cond_46
    if-ne v0, v7, :cond_63

    .line 854
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 855
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_56

    .line 856
    invoke-virtual {p0, v0, v6}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 858
    :cond_56
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 859
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 862
    :cond_63
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v3

    if-eqz v3, :cond_6f

    .line 863
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipComma(I)I

    move-result v0

    .line 865
    :cond_6f
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_7e

    .line 866
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 867
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 871
    :cond_7e
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateNameLocation()V

    .line 872
    if-ne v0, v5, :cond_a2

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseName()Ljava/lang/String;

    move-result-object v1

    .line 873
    .local v1, "name":Ljava/lang/String;
    :goto_87
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3, v1}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 874
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 875
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon()I

    move-result v0

    .line 877
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 878
    if-ne v0, v5, :cond_a7

    .line 879
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 880
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_13

    .line 872
    .end local v1    # "name":Ljava/lang/String;
    :cond_a2
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleOddName(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_87

    .line 888
    .restart local v1    # "name":Ljava/lang/String;
    :cond_a7
    sparse-switch v0, :sswitch_data_d4

    .line 923
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleOddValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 926
    .local v2, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_ae
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_13

    .line 890
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_b2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 891
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_ae

    .line 902
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_b7
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 903
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_ae

    .line 905
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_bc
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchFalse()V

    .line 906
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 907
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_ae

    .line 909
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_c2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchNull()V

    .line 910
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 911
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_ae

    .line 913
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_c8
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchTrue()V

    .line 914
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 915
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_ae

    .line 917
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_ce
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 918
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_ae

    .line 920
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_d1
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 921
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_ae

    .line 888
    :sswitch_data_d4
    .sparse-switch
        0x2d -> :sswitch_b2
        0x30 -> :sswitch_b7
        0x31 -> :sswitch_b7
        0x32 -> :sswitch_b7
        0x33 -> :sswitch_b7
        0x34 -> :sswitch_b7
        0x35 -> :sswitch_b7
        0x36 -> :sswitch_b7
        0x37 -> :sswitch_b7
        0x38 -> :sswitch_b7
        0x39 -> :sswitch_b7
        0x5b -> :sswitch_ce
        0x66 -> :sswitch_bc
        0x6e -> :sswitch_c2
        0x74 -> :sswitch_c8
        0x7b -> :sswitch_d1
    .end sparse-switch
.end method

.method public nextFieldName(Lcom/fasterxml/jackson/core/SerializableString;)Z
    .registers 15
    .param p1, "sstr"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const/16 v11, 0x7d

    const/16 v10, 0x5d

    const/16 v9, 0x22

    const/4 v6, 0x0

    .line 749
    iput v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_numTypesValid:I

    .line 750
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v8, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v7, v8, :cond_14

    .line 751
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    .line 821
    :goto_13
    return v6

    .line 754
    :cond_14
    iget-boolean v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v7, :cond_1b

    .line 755
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipString()V

    .line 757
    :cond_1b
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipWSOrEnd()I

    move-result v1

    .line 758
    .local v1, "i":I
    if-gez v1, :cond_27

    .line 759
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->close()V

    .line 760
    iput-object v12, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 763
    :cond_27
    iput-object v12, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_binaryValue:[B

    .line 765
    if-ne v1, v10, :cond_46

    .line 766
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 767
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v7

    if-nez v7, :cond_39

    .line 768
    invoke-virtual {p0, v1, v11}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 770
    :cond_39
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 771
    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 774
    :cond_46
    if-ne v1, v11, :cond_63

    .line 775
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 776
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v7

    if-nez v7, :cond_56

    .line 777
    invoke-virtual {p0, v1, v10}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 779
    :cond_56
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 780
    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 783
    :cond_63
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v7

    if-eqz v7, :cond_6f

    .line 784
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipComma(I)I

    move-result v1

    .line 787
    :cond_6f
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v7

    if-nez v7, :cond_7e

    .line 788
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 789
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 793
    :cond_7e
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateNameLocation()V

    .line 794
    if-ne v1, v9, :cond_bd

    .line 796
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedChars()[C

    move-result-object v3

    .line 797
    .local v3, "nameChars":[C
    array-length v2, v3

    .line 800
    .local v2, "len":I
    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int/2addr v6, v2

    add-int/lit8 v6, v6, 0x4

    iget v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    if-ge v6, v7, :cond_bd

    .line 802
    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    add-int v0, v6, v2

    .line 803
    .local v0, "end":I
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    aget-char v6, v6, v0

    if-ne v6, v9, :cond_bd

    .line 804
    const/4 v4, 0x0

    .line 805
    .local v4, "offset":I
    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 807
    .local v5, "ptr":I
    :goto_9e
    if-ne v5, v0, :cond_b5

    .line 808
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 809
    add-int/lit8 v6, v5, 0x1

    invoke-direct {p0, v6}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColonFast(I)I

    move-result v6

    invoke-direct {p0, v6}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_isNextTokenNameYes(I)V

    .line 810
    const/4 v6, 0x1

    goto/16 :goto_13

    .line 812
    :cond_b5
    aget-char v6, v3, v4

    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    aget-char v7, v7, v5

    if-eq v6, v7, :cond_c7

    .line 821
    .end local v0    # "end":I
    .end local v2    # "len":I
    .end local v3    # "nameChars":[C
    .end local v4    # "offset":I
    .end local v5    # "ptr":I
    :cond_bd
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v1, v6}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_isNextTokenNameMaybe(ILjava/lang/String;)Z

    move-result v6

    goto/16 :goto_13

    .line 815
    .restart local v0    # "end":I
    .restart local v2    # "len":I
    .restart local v3    # "nameChars":[C
    .restart local v4    # "offset":I
    .restart local v5    # "ptr":I
    :cond_c7
    add-int/lit8 v4, v4, 0x1

    .line 816
    add-int/lit8 v5, v5, 0x1

    goto :goto_9e
.end method

.method public final nextIntValue(I)I
    .registers 6
    .param p1, "defaultValue"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1108
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_3b

    .line 1109
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopied:Z

    .line 1110
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1111
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1112
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1113
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_19

    .line 1114
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getIntValue()I

    move-result p1

    .line 1124
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .end local p1    # "defaultValue":I
    :cond_18
    :goto_18
    return p1

    .line 1116
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local p1    # "defaultValue":I
    :cond_19
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2a

    .line 1117
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1118
    :cond_2a
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_18

    .line 1119
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1124
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_3b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_18

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getIntValue()I

    move-result p1

    goto :goto_18
.end method

.method public final nextLongValue(J)J
    .registers 7
    .param p1, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1131
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_3b

    .line 1132
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopied:Z

    .line 1133
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1134
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1135
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1136
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_19

    .line 1137
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getLongValue()J

    move-result-wide p1

    .line 1147
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .end local p1    # "defaultValue":J
    :cond_18
    :goto_18
    return-wide p1

    .line 1139
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local p1    # "defaultValue":J
    :cond_19
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2a

    .line 1140
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1141
    :cond_2a
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_18

    .line 1142
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1147
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_3b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_18

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getLongValue()J

    move-result-wide p1

    goto :goto_18
.end method

.method public final nextTextValue()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x0

    .line 1081
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_46

    .line 1082
    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nameCopied:Z

    .line 1083
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1084
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1085
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1086
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_24

    .line 1087
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_1d

    .line 1088
    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 1089
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_finishString()V

    .line 1091
    :cond_1d
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v1

    .line 1101
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_23
    :goto_23
    return-object v1

    .line 1093
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_24
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_35

    .line 1094
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_23

    .line 1095
    :cond_35
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_23

    .line 1096
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_23

    .line 1101
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_46
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_23

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_23
.end method

.method public final nextToken()Lcom/fasterxml/jackson/core/JsonToken;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    const/16 v7, 0x7d

    const/16 v6, 0x5d

    .line 592
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v5, :cond_10

    .line 593
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 717
    :goto_f
    return-object v3

    .line 597
    :cond_10
    const/4 v4, 0x0

    iput v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_numTypesValid:I

    .line 598
    iget-boolean v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v4, :cond_1a

    .line 599
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipString()V

    .line 601
    :cond_1a
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipWSOrEnd()I

    move-result v0

    .line 602
    .local v0, "i":I
    if-gez v0, :cond_26

    .line 606
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->close()V

    .line 607
    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_f

    .line 610
    :cond_26
    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_binaryValue:[B

    .line 613
    if-ne v0, v6, :cond_45

    .line 614
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 615
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v4

    if-nez v4, :cond_38

    .line 616
    invoke-virtual {p0, v0, v7}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 618
    :cond_38
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v4

    iput-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 619
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_f

    .line 621
    :cond_45
    if-ne v0, v7, :cond_62

    .line 622
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 623
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v4

    if-nez v4, :cond_55

    .line 624
    invoke-virtual {p0, v0, v6}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 626
    :cond_55
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->clearAndGetParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v4

    iput-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 627
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_f

    .line 631
    :cond_62
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v4

    if-eqz v4, :cond_6e

    .line 632
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipComma(I)I

    move-result v0

    .line 638
    :cond_6e
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v1

    .line 639
    .local v1, "inObject":Z
    if-eqz v1, :cond_8e

    .line 641
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateNameLocation()V

    .line 642
    const/16 v4, 0x22

    if-ne v0, v4, :cond_a0

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseName()Ljava/lang/String;

    move-result-object v2

    .line 643
    .local v2, "name":Ljava/lang/String;
    :goto_81
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 644
    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 645
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_skipColon()I

    move-result v0

    .line 647
    .end local v2    # "name":Ljava/lang/String;
    :cond_8e
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_updateLocation()V

    .line 653
    sparse-switch v0, :sswitch_data_f2

    .line 708
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleOddValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 712
    .local v3, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_98
    if-eqz v1, :cond_ee

    .line 713
    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 714
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_f

    .line 642
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_a0
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_handleOddName(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_81

    .line 655
    :sswitch_a5
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    .line 656
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    .line 657
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_98

    .line 659
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_ab
    if-nez v1, :cond_b9

    .line 660
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v4, v5, v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v4

    iput-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 662
    :cond_b9
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 663
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_98

    .line 665
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_bc
    if-nez v1, :cond_ca

    .line 666
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v5, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputRow:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenInputCol:I

    invoke-virtual {v4, v5, v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v4

    iput-object v4, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 668
    :cond_ca
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 669
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_98

    .line 674
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_cd
    const-string v4, "expected a value"

    invoke-virtual {p0, v0, v4}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 676
    :sswitch_d2
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchTrue()V

    .line 677
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 678
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_98

    .line 680
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_d8
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchFalse()V

    .line 681
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 682
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_98

    .line 684
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_de
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_matchNull()V

    .line 685
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 686
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_98

    .line 693
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_e4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 694
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_98

    .line 705
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_e9
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 706
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_98

    .line 716
    :cond_ee
    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_f

    .line 653
    :sswitch_data_f2
    .sparse-switch
        0x22 -> :sswitch_a5
        0x2d -> :sswitch_e4
        0x30 -> :sswitch_e9
        0x31 -> :sswitch_e9
        0x32 -> :sswitch_e9
        0x33 -> :sswitch_e9
        0x34 -> :sswitch_e9
        0x35 -> :sswitch_e9
        0x36 -> :sswitch_e9
        0x37 -> :sswitch_e9
        0x38 -> :sswitch_e9
        0x39 -> :sswitch_e9
        0x5b -> :sswitch_ab
        0x5d -> :sswitch_cd
        0x66 -> :sswitch_d8
        0x6e -> :sswitch_de
        0x74 -> :sswitch_d2
        0x7b -> :sswitch_bc
        0x7d -> :sswitch_cd
    .end sparse-switch
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
    .line 435
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_13

    .line 436
    :cond_a
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->getBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;)[B

    move-result-object v0

    .line 437
    .local v0, "b":[B
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write([B)V

    .line 438
    array-length v2, v0

    .line 445
    .end local v0    # "b":[B
    :goto_12
    return v2

    .line 441
    :cond_13
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/io/IOContext;->allocBase64Buffer()[B

    move-result-object v1

    .line 443
    .local v1, "buf":[B
    :try_start_19
    invoke-virtual {p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_readBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;[B)I
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_23

    move-result v2

    .line 445
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v3, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    goto :goto_12

    :catchall_23
    move-exception v2

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v3, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    throw v2
.end method

.method public releaseBuffered(Ljava/io/Writer;)I
    .registers 6
    .param p1, "w"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 156
    iget v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputEnd:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    sub-int v0, v2, v3

    .line 157
    .local v0, "count":I
    const/4 v2, 0x1

    if-ge v0, v2, :cond_b

    const/4 v0, 0x0

    .line 161
    .end local v0    # "count":I
    :goto_a
    return v0

    .line 159
    .restart local v0    # "count":I
    :cond_b
    iget v1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputPtr:I

    .line 160
    .local v1, "origPtr":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_inputBuffer:[C

    invoke-virtual {p1, v2, v1, v0}, Ljava/io/Writer;->write([CII)V

    goto :goto_a
.end method

.method public setCodec(Lcom/fasterxml/jackson/core/ObjectCodec;)V
    .registers 2
    .param p1, "c"    # Lcom/fasterxml/jackson/core/ObjectCodec;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/ReaderBasedJsonParser;->_objectCodec:Lcom/fasterxml/jackson/core/ObjectCodec;

    return-void
.end method
