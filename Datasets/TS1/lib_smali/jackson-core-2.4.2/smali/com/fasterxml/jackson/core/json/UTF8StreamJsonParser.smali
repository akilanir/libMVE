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

.field protected final _symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

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

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILjava/io/InputStream;Lcom/fasterxml/jackson/core/ObjectCodec;Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;[BIIZ)V
    .registers 12
    .param p1, "ctxt"    # Lcom/fasterxml/jackson/core/io/IOContext;
    .param p2, "features"    # I
    .param p3, "in"    # Ljava/io/InputStream;
    .param p4, "codec"    # Lcom/fasterxml/jackson/core/ObjectCodec;
    .param p5, "sym"    # Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;
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
    iput-object p5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

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
    .line 2534
    invoke-virtual {p0, p3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeCharForError(I)I

    move-result v1

    int-to-char v0, v1

    .line 2535
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 2536
    const/4 v1, 0x0

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidToken(Ljava/lang/String;)V

    .line 2538
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
    .line 2999
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_9

    .line 3000
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3002
    :cond_9
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3003
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    const/16 v2, 0x80

    if-eq v1, v2, :cond_20

    .line 3004
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3006
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

    .line 3011
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_b

    .line 3012
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3014
    :cond_b
    and-int/lit8 p1, p1, 0xf

    .line 3015
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 3016
    .local v1, "d":I
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_22

    .line 3017
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3019
    :cond_22
    shl-int/lit8 v2, p1, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 3020
    .local v0, "c":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_31

    .line 3021
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3023
    :cond_31
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 3024
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_46

    .line 3025
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3027
    :cond_46
    shl-int/lit8 v2, v0, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 3028
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

    .line 3033
    and-int/lit8 p1, p1, 0xf

    .line 3034
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 3035
    .local v1, "d":I
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_19

    .line 3036
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3038
    :cond_19
    shl-int/lit8 v2, p1, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 3039
    .local v0, "c":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v2, v3

    .line 3040
    and-int/lit16 v2, v1, 0xc0

    if-eq v2, v5, :cond_34

    .line 3041
    and-int/lit16 v2, v1, 0xff

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3043
    :cond_34
    shl-int/lit8 v2, v0, 0x6

    and-int/lit8 v3, v1, 0x3f

    or-int v0, v2, v3

    .line 3044
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

    .line 3053
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_b

    .line 3054
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3056
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3057
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_20

    .line 3058
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3060
    :cond_20
    and-int/lit8 v1, p1, 0x7

    shl-int/lit8 v1, v1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int p1, v1, v2

    .line 3062
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_31

    .line 3063
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3065
    :cond_31
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3066
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_46

    .line 3067
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3069
    :cond_46
    shl-int/lit8 v1, p1, 0x6

    and-int/lit8 v2, v0, 0x3f

    or-int p1, v1, v2

    .line 3070
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_55

    .line 3071
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3073
    :cond_55
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3074
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_6a

    .line 3075
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3081
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
    .line 2174
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 2175
    .local v1, "codes":[I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 2182
    .local v2, "inputBuffer":[B
    :goto_4
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2183
    .local v5, "ptr":I
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v5, v7, :cond_f

    .line 2184
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 2185
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2187
    :cond_f
    array-length v7, p1

    if-lt p2, v7, :cond_19

    .line 2188
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 2189
    const/4 p2, 0x0

    .line 2191
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

    .line 2192
    .end local p2    # "outPtr":I
    .local v4, "outPtr":I
    :goto_24
    if-ge v6, v3, :cond_44

    .line 2193
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "ptr":I
    .restart local v5    # "ptr":I
    aget-byte v7, v2, v6

    and-int/lit16 v0, v7, 0xff

    .line 2194
    .local v0, "c":I
    aget v7, v1, v0

    if-eqz v7, :cond_3c

    .line 2195
    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2203
    const/16 v7, 0x22

    if-ne v0, v7, :cond_48

    .line 2249
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7, v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2250
    return-void

    .line 2198
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

    .line 2200
    .end local v0    # "c":I
    :cond_44
    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move p2, v4

    .line 2201
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_4

    .line 2207
    .end local v6    # "ptr":I
    .end local p2    # "outPtr":I
    .restart local v0    # "c":I
    .restart local v4    # "outPtr":I
    .restart local v5    # "ptr":I
    :cond_48
    aget v7, v1, v0

    packed-switch v7, :pswitch_data_ae

    .line 2233
    const/16 v7, 0x20

    if-ge v0, v7, :cond_a9

    .line 2235
    const-string v7, "string value"

    invoke-virtual {p0, v0, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    move p2, v4

    .line 2242
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_57
    array-length v7, p1

    if-lt p2, v7, :cond_61

    .line 2243
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 2244
    const/4 p2, 0x0

    .line 2247
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

    .line 2209
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_68
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    move-result v0

    move p2, v4

    .line 2210
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2212
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_6e
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_2(I)I

    move-result v0

    move p2, v4

    .line 2213
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2215
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_74
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    sub-int/2addr v7, v8

    const/4 v8, 0x2

    if-lt v7, v8, :cond_82

    .line 2216
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_3fast(I)I

    move-result v0

    move p2, v4

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2218
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :cond_82
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_3(I)I

    move-result v0

    move p2, v4

    .line 2220
    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2222
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :pswitch_88
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_4(I)I

    move-result v0

    .line 2224
    add-int/lit8 p2, v4, 0x1

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    const v7, 0xd800

    shr-int/lit8 v8, v0, 0xa

    or-int/2addr v7, v8

    int-to-char v7, v7

    aput-char v7, p1, v4

    .line 2225
    array-length v7, p1

    if-lt p2, v7, :cond_a1

    .line 2226
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 2227
    const/4 p2, 0x0

    .line 2229
    :cond_a1
    const v7, 0xdc00

    and-int/lit16 v8, v0, 0x3ff

    or-int v0, v7, v8

    .line 2231
    goto :goto_57

    .line 2238
    .end local p2    # "outPtr":I
    .restart local v4    # "outPtr":I
    :cond_a9
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    move p2, v4

    .end local v4    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_57

    .line 2207
    :pswitch_data_ae
    .packed-switch 0x1
        :pswitch_68
        :pswitch_6e
        :pswitch_74
        :pswitch_88
    .end packed-switch
.end method

.method private final _isNextTokenNameMaybe(ILcom/fasterxml/jackson/core/SerializableString;)Z
    .registers 9
    .param p1, "i"    # I
    .param p2, "str"    # Lcom/fasterxml/jackson/core/SerializableString;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 1003
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseName(I)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v1

    .line 1006
    .local v1, "n":Lcom/fasterxml/jackson/core/sym/Name;
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/sym/Name;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1007
    .local v2, "nameStr":Ljava/lang/String;
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 1008
    invoke-interface {p2}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 1010
    .local v0, "match":Z
    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1011
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon()I

    move-result p1

    .line 1014
    const/16 v4, 0x22

    if-ne p1, v4, :cond_29

    .line 1015
    iput-boolean v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 1016
    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1059
    :goto_28
    return v0

    .line 1021
    :cond_29
    sparse-switch p1, :sswitch_data_5c

    .line 1056
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 1058
    .local v3, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_30
    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_28

    .line 1023
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_33
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1024
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_30

    .line 1026
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_36
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1027
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_30

    .line 1029
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_39
    const-string v4, "true"

    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1030
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1031
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_30

    .line 1033
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_41
    const-string v4, "false"

    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1034
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1035
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_30

    .line 1037
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_49
    const-string v4, "null"

    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 1038
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1039
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_30

    .line 1041
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_51
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 1042
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_30

    .line 1053
    .end local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_56
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 1054
    .restart local v3    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_30

    .line 1021
    nop

    :sswitch_data_5c
    .sparse-switch
        0x2d -> :sswitch_51
        0x30 -> :sswitch_56
        0x31 -> :sswitch_56
        0x32 -> :sswitch_56
        0x33 -> :sswitch_56
        0x34 -> :sswitch_56
        0x35 -> :sswitch_56
        0x36 -> :sswitch_56
        0x37 -> :sswitch_56
        0x38 -> :sswitch_56
        0x39 -> :sswitch_56
        0x5b -> :sswitch_33
        0x66 -> :sswitch_41
        0x6e -> :sswitch_49
        0x74 -> :sswitch_39
        0x7b -> :sswitch_36
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

    .line 954
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 956
    sparse-switch p1, :sswitch_data_4c

    .line 995
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 996
    :goto_e
    return-void

    .line 958
    :sswitch_f
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 959
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 962
    :sswitch_16
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 965
    :sswitch_1b
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 968
    :sswitch_20
    const-string v0, "true"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 969
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 972
    :sswitch_2a
    const-string v0, "false"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 973
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 976
    :sswitch_34
    const-string v0, "null"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 977
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 980
    :sswitch_3e
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 992
    :sswitch_45
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_e

    .line 956
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
    .line 2513
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2515
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

    .line 2517
    :cond_1c
    const/4 v2, 0x0

    invoke-virtual {p1, v2, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidToken(Ljava/lang/String;)V

    .line 2519
    :cond_24
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2520
    add-int/lit8 p2, p2, 0x1

    if-lt p2, v1, :cond_4

    .line 2523
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_3b

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v2

    if-nez v2, :cond_3b

    .line 2530
    :cond_3a
    :goto_3a
    return-void

    .line 2526
    :cond_3b
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 2527
    .local v0, "ch":I
    const/16 v2, 0x30

    if-lt v0, v2, :cond_3a

    const/16 v2, 0x5d

    if-eq v0, v2, :cond_3a

    const/16 v2, 0x7d

    if-eq v0, v2, :cond_3a

    .line 2528
    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_checkMatchEnd(Ljava/lang/String;II)V

    goto :goto_3a
.end method

.method private final _nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;
    .registers 5

    .prologue
    .line 799
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 800
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 801
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 803
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1b

    .line 804
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 808
    :cond_18
    :goto_18
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v0

    .line 805
    :cond_1b
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_18

    .line 806
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

    .line 756
    const/16 v0, 0x22

    if-ne p1, v0, :cond_c

    .line 757
    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 758
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 794
    :goto_b
    return-object v0

    .line 760
    :cond_c
    sparse-switch p1, :sswitch_data_64

    .line 794
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 762
    :sswitch_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 763
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 765
    :sswitch_27
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v0, v1, v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 766
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 768
    :sswitch_38
    const-string v0, "true"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 769
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 771
    :sswitch_42
    const-string v0, "false"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 772
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 774
    :sswitch_4c
    const-string v0, "null"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 775
    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 777
    :sswitch_56
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 792
    :sswitch_5d
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_b

    .line 760
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

    .line 1370
    const/4 v2, 0x0

    .line 1371
    .local v2, "fractLen":I
    const/4 v0, 0x0

    .line 1374
    .local v0, "eof":Z
    const/16 v4, 0x2e

    if-ne p3, v4, :cond_24

    .line 1375
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .local v3, "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    move p2, v3

    .line 1379
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_10
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_c5

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v4

    if-nez v4, :cond_c5

    .line 1380
    const/4 v0, 0x1

    .line 1395
    :cond_1d
    if-nez v2, :cond_24

    .line 1396
    const-string v4, "Decimal point not followed by a digit"

    invoke-virtual {p0, p3, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1400
    :cond_24
    const/4 v1, 0x0

    .line 1401
    .local v1, "expLen":I
    const/16 v4, 0x65

    if-eq p3, v4, :cond_2d

    const/16 v4, 0x45

    if-ne p3, v4, :cond_a8

    .line 1402
    :cond_2d
    array-length v4, p1

    if-lt p2, v4, :cond_37

    .line 1403
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1404
    const/4 p2, 0x0

    .line 1406
    :cond_37
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1408
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_45

    .line 1409
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 1411
    :cond_45
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    .line 1413
    const/16 v4, 0x2d

    if-eq p3, v4, :cond_59

    const/16 v4, 0x2b

    if-ne p3, v4, :cond_fa

    .line 1414
    :cond_59
    array-length v4, p1

    if-lt v3, v4, :cond_f7

    .line 1415
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1416
    const/4 p2, 0x0

    .line 1418
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_63
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1420
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_71

    .line 1421
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 1423
    :cond_71
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    move p2, v3

    .line 1427
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :goto_7e
    if-gt p3, v8, :cond_a1

    if-lt p3, v7, :cond_a1

    .line 1428
    add-int/lit8 v1, v1, 0x1

    .line 1429
    array-length v4, p1

    if-lt p2, v4, :cond_8e

    .line 1430
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1431
    const/4 p2, 0x0

    .line 1433
    :cond_8e
    add-int/lit8 v3, p2, 0x1

    .end local p2    # "outPtr":I
    .restart local v3    # "outPtr":I
    int-to-char v4, p3

    aput-char v4, p1, p2

    .line 1434
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_e9

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v4

    if-nez v4, :cond_e9

    .line 1435
    const/4 v0, 0x1

    move p2, v3

    .line 1441
    .end local v3    # "outPtr":I
    .restart local p2    # "outPtr":I
    :cond_a1
    if-nez v1, :cond_a8

    .line 1442
    const-string v4, "Exponent indicator not followed by a digit"

    invoke-virtual {p0, p3, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 1447
    :cond_a8
    if-nez v0, :cond_bb

    .line 1448
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1450
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v4

    if-eqz v4, :cond_bb

    .line 1451
    invoke-direct {p0, p3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyRootSpace(I)V

    .line 1454
    :cond_bb
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1457
    invoke-virtual {p0, p4, p5, v2, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetFloat(ZIII)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v4

    return-object v4

    .line 1383
    .end local v1    # "expLen":I
    :cond_c5
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 p3, v4, 0xff

    .line 1384
    if-lt p3, v7, :cond_1d

    if-gt p3, v8, :cond_1d

    .line 1387
    add-int/lit8 v2, v2, 0x1

    .line 1388
    array-length v4, p1

    if-lt p2, v4, :cond_e1

    .line 1389
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1390
    const/4 p2, 0x0

    .line 1392
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

    .line 1438
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
    .line 1301
    :goto_0
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_16

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_16

    .line 1302
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1303
    invoke-virtual {p0, p3, p4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 1327
    :goto_15
    return-object v0

    .line 1305
    :cond_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v3, v0, 0xff

    .line 1306
    .local v3, "c":I
    const/16 v0, 0x39

    if-gt v3, v0, :cond_2a

    const/16 v0, 0x30

    if-ge v3, v0, :cond_40

    .line 1307
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

    .line 1308
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_15

    .line 1312
    :cond_40
    array-length v0, p1

    if-lt p2, v0, :cond_4a

    .line 1313
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object p1

    .line 1314
    const/4 p2, 0x0

    .line 1316
    :cond_4a
    add-int/lit8 v6, p2, 0x1

    .end local p2    # "outPtr":I
    .local v6, "outPtr":I
    int-to-char v0, v3

    aput-char v0, p1, p2

    .line 1317
    add-int/lit8 p4, p4, 0x1

    move p2, v6

    .line 1318
    .end local v6    # "outPtr":I
    .restart local p2    # "outPtr":I
    goto :goto_0

    .line 1319
    :cond_53
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1320
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, p2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1322
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_75

    .line 1323
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyRootSpace(I)V

    .line 1327
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
    .line 2798
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeComment()[I

    move-result-object v1

    .line 2802
    .local v1, "codes":[I
    :cond_4
    :goto_4
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_10

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v3

    if-eqz v3, :cond_33

    .line 2803
    :cond_10
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 v2, v3, 0xff

    .line 2804
    .local v2, "i":I
    aget v0, v1, v2

    .line 2805
    .local v0, "code":I
    if-eqz v0, :cond_4

    .line 2806
    sparse-switch v0, :sswitch_data_66

    .line 2834
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    goto :goto_4

    .line 2808
    :sswitch_27
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_39

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_39

    .line 2838
    .end local v0    # "code":I
    .end local v2    # "i":I
    :cond_33
    const-string v3, " in a comment"

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2839
    :goto_38
    return-void

    .line 2811
    .restart local v0    # "code":I
    .restart local v2    # "i":I
    :cond_39
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_4

    .line 2812
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_38

    .line 2817
    :sswitch_4a
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2818
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_4

    .line 2821
    :sswitch_55
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_4

    .line 2824
    :sswitch_59
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_2(I)V

    goto :goto_4

    .line 2827
    :sswitch_5d
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_3(I)V

    goto :goto_4

    .line 2830
    :sswitch_61
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_4(I)V

    goto :goto_4

    .line 2806
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

    .line 2684
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x4

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_17

    .line 2685
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    .line 2734
    :goto_16
    return v0

    .line 2688
    :cond_17
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2689
    .local v0, "i":I
    const/16 v1, 0x3a

    if-ne v0, v1, :cond_62

    .line 2690
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2691
    if-le v0, v3, :cond_3d

    .line 2692
    if-eq v0, v6, :cond_31

    if-ne v0, v5, :cond_36

    .line 2693
    :cond_31
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto :goto_16

    .line 2695
    :cond_36
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_16

    .line 2698
    :cond_3d
    if-eq v0, v3, :cond_41

    if-ne v0, v7, :cond_5d

    .line 2699
    :cond_41
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2700
    if-le v0, v3, :cond_5d

    .line 2701
    if-eq v0, v6, :cond_51

    if-ne v0, v5, :cond_56

    .line 2702
    :cond_51
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto :goto_16

    .line 2704
    :cond_56
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_16

    .line 2708
    :cond_5d
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto :goto_16

    .line 2710
    :cond_62
    if-eq v0, v3, :cond_66

    if-ne v0, v7, :cond_70

    .line 2711
    :cond_66
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2713
    :cond_70
    const/16 v1, 0x3a

    if-ne v0, v1, :cond_b8

    .line 2714
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2715
    if-le v0, v3, :cond_90

    .line 2716
    if-eq v0, v6, :cond_84

    if-ne v0, v5, :cond_89

    .line 2717
    :cond_84
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto :goto_16

    .line 2719
    :cond_89
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_16

    .line 2722
    :cond_90
    if-eq v0, v3, :cond_94

    if-ne v0, v7, :cond_b2

    .line 2723
    :cond_94
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 2724
    if-le v0, v3, :cond_b2

    .line 2725
    if-eq v0, v6, :cond_a4

    if-ne v0, v5, :cond_aa

    .line 2726
    :cond_a4
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto/16 :goto_16

    .line 2728
    :cond_aa
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto/16 :goto_16

    .line 2732
    :cond_b2
    invoke-direct {p0, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v0

    goto/16 :goto_16

    .line 2734
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

    .line 2739
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_62

    .line 2740
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2742
    .local v0, "i":I
    if-le v0, v4, :cond_41

    .line 2743
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_24

    .line 2744
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipComment()V

    goto :goto_2

    .line 2747
    :cond_24
    const/16 v1, 0x23

    if-ne v0, v1, :cond_2e

    .line 2748
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipYAMLComment()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2752
    :cond_2e
    if-eqz p1, :cond_31

    .line 2753
    return v0

    .line 2755
    :cond_31
    const/16 v1, 0x3a

    if-eq v0, v1, :cond_3f

    .line 2756
    if-ge v0, v4, :cond_3a

    .line 2757
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    .line 2759
    :cond_3a
    const-string v1, "was expecting a colon to separate field name and value"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2761
    :cond_3f
    const/4 p1, 0x1

    goto :goto_2

    .line 2762
    :cond_41
    if-eq v0, v4, :cond_2

    .line 2763
    const/16 v1, 0xa

    if-ne v0, v1, :cond_52

    .line 2764
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2765
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2766
    :cond_52
    const/16 v1, 0xd

    if-ne v0, v1, :cond_5a

    .line 2767
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_2

    .line 2768
    :cond_5a
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2769
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 2773
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

    .line 908
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 v1, p1, 0x1

    .end local p1    # "ptr":I
    .local v1, "ptr":I
    aget-byte v0, v2, p1

    .line 909
    .local v0, "i":I
    if-ne v0, v7, :cond_42

    .line 910
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 p1, v1, 0x1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    aget-byte v0, v2, v1

    .line 911
    if-le v0, v3, :cond_22

    .line 912
    if-eq v0, v5, :cond_38

    if-eq v0, v4, :cond_38

    .line 913
    iput p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move v2, v0

    .line 949
    :goto_21
    return v2

    .line 916
    :cond_22
    if-eq v0, v3, :cond_26

    if-ne v0, v6, :cond_38

    .line 917
    :cond_26
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 v1, p1, 0x1

    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    aget-byte v0, v2, p1

    .line 918
    if-le v0, v3, :cond_37

    .line 919
    if-eq v0, v5, :cond_37

    if-eq v0, v4, :cond_37

    .line 920
    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move p1, v1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    move v2, v0

    .line 921
    goto :goto_21

    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_37
    move p1, v1

    .line 925
    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    :cond_38
    add-int/lit8 v2, p1, -0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 926
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon2(Z)I

    move-result v2

    goto :goto_21

    .line 928
    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_42
    if-eq v0, v3, :cond_46

    if-ne v0, v6, :cond_4d

    .line 929
    :cond_46
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 p1, v1, 0x1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    aget-byte v0, v2, v1

    move v1, p1

    .line 931
    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_4d
    if-ne v0, v7, :cond_74

    .line 932
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 p1, v1, 0x1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    aget-byte v0, v2, v1

    .line 933
    if-le v0, v3, :cond_5f

    .line 934
    if-eq v0, v5, :cond_75

    if-eq v0, v4, :cond_75

    .line 935
    iput p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move v2, v0

    .line 936
    goto :goto_21

    .line 938
    :cond_5f
    if-eq v0, v3, :cond_63

    if-ne v0, v6, :cond_75

    .line 939
    :cond_63
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    add-int/lit8 v1, p1, 0x1

    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    aget-byte v0, v2, p1

    .line 940
    if-le v0, v3, :cond_74

    .line 941
    if-eq v0, v5, :cond_74

    if-eq v0, v4, :cond_74

    .line 942
    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    move p1, v1

    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    move v2, v0

    .line 943
    goto :goto_21

    .end local p1    # "ptr":I
    .restart local v1    # "ptr":I
    :cond_74
    move p1, v1

    .line 948
    .end local v1    # "ptr":I
    .restart local p1    # "ptr":I
    :cond_75
    add-int/lit8 v2, p1, -0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 949
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

    .line 2778
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-nez v1, :cond_f

    .line 2779
    const-string v1, "maybe a (non-standard) comment? (not recognized as one since Feature \'ALLOW_COMMENTS\' not enabled for parser)"

    invoke-virtual {p0, v4, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2782
    :cond_f
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_20

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_20

    .line 2783
    const-string v1, " in a comment"

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2785
    :cond_20
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2786
    .local v0, "c":I
    if-ne v0, v4, :cond_32

    .line 2787
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipLine()V

    .line 2793
    :goto_31
    return-void

    .line 2788
    :cond_32
    const/16 v1, 0x2a

    if-ne v0, v1, :cond_3a

    .line 2789
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCComment()V

    goto :goto_31

    .line 2791
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
    .line 2857
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeComment()[I

    move-result-object v1

    .line 2858
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

    .line 2859
    :cond_10
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 v2, v3, 0xff

    .line 2860
    .local v2, "i":I
    aget v0, v1, v2

    .line 2861
    .local v0, "code":I
    if-eqz v0, :cond_4

    .line 2862
    sparse-switch v0, :sswitch_data_44

    .line 2882
    if-gez v0, :cond_4

    .line 2884
    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    goto :goto_4

    .line 2864
    :sswitch_29
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2865
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 2889
    .end local v0    # "code":I
    .end local v2    # "i":I
    :cond_33
    :goto_33
    return-void

    .line 2868
    .restart local v0    # "code":I
    .restart local v2    # "i":I
    :sswitch_34
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_33

    .line 2873
    :sswitch_38
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_2(I)V

    goto :goto_4

    .line 2876
    :sswitch_3c
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_3(I)V

    goto :goto_4

    .line 2879
    :sswitch_40
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_4(I)V

    goto :goto_4

    .line 2862
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
    .line 3086
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_9

    .line 3087
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3089
    :cond_9
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte p1, v0, v1

    .line 3090
    and-int/lit16 v0, p1, 0xc0

    const/16 v1, 0x80

    if-eq v0, v1, :cond_20

    .line 3091
    and-int/lit16 v0, p1, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3093
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

    .line 3100
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_b

    .line 3101
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3104
    :cond_b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte p1, v0, v1

    .line 3105
    and-int/lit16 v0, p1, 0xc0

    if-eq v0, v3, :cond_20

    .line 3106
    and-int/lit16 v0, p1, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3108
    :cond_20
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_29

    .line 3109
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3111
    :cond_29
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte p1, v0, v1

    .line 3112
    and-int/lit16 v0, p1, 0xc0

    if-eq v0, v3, :cond_3e

    .line 3113
    and-int/lit16 v0, p1, 0xff

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3115
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

    .line 3119
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_b

    .line 3120
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3122
    :cond_b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3123
    .local v0, "d":I
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_20

    .line 3124
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3126
    :cond_20
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_29

    .line 3127
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3129
    :cond_29
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3130
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_3e

    .line 3131
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3133
    :cond_3e
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_47

    .line 3134
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3136
    :cond_47
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v1, v2

    .line 3137
    and-int/lit16 v1, v0, 0xc0

    if-eq v1, v4, :cond_5c

    .line 3138
    and-int/lit16 v1, v0, 0xff

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    invoke-virtual {p0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(II)V

    .line 3140
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

    .line 2548
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-ge v1, v2, :cond_4a

    .line 2549
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2550
    .local v0, "i":I
    if-le v0, v4, :cond_29

    .line 2551
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_1e

    const/16 v1, 0x23

    if-ne v0, v1, :cond_28

    .line 2552
    :cond_1e
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2553
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWS2()I

    move-result v0

    .line 2568
    .end local v0    # "i":I
    :cond_28
    :goto_28
    return v0

    .line 2557
    .restart local v0    # "i":I
    :cond_29
    if-eq v0, v4, :cond_2

    .line 2558
    const/16 v1, 0xa

    if-ne v0, v1, :cond_3a

    .line 2559
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2560
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2561
    :cond_3a
    const/16 v1, 0xd

    if-ne v0, v1, :cond_42

    .line 2562
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_2

    .line 2563
    :cond_42
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2564
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 2568
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

    .line 2573
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_50

    .line 2574
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2575
    .local v0, "i":I
    if-le v0, v4, :cond_2f

    .line 2576
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_24

    .line 2577
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipComment()V

    goto :goto_2

    .line 2580
    :cond_24
    const/16 v1, 0x23

    if-ne v0, v1, :cond_2e

    .line 2581
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipYAMLComment()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2585
    :cond_2e
    return v0

    .line 2587
    :cond_2f
    if-eq v0, v4, :cond_2

    .line 2588
    const/16 v1, 0xa

    if-ne v0, v1, :cond_40

    .line 2589
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2590
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2591
    :cond_40
    const/16 v1, 0xd

    if-ne v0, v1, :cond_48

    .line 2592
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_2

    .line 2593
    :cond_48
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2594
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 2598
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

    .line 2605
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_1b

    .line 2606
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 2607
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_eofAsNextChar()I

    move-result v0

    .line 2649
    :cond_1a
    :goto_1a
    return v0

    .line 2610
    :cond_1b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2611
    .local v0, "i":I
    if-le v0, v4, :cond_3a

    .line 2612
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_2f

    if-ne v0, v8, :cond_1a

    .line 2613
    :cond_2f
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2614
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd2()I

    move-result v0

    goto :goto_1a

    .line 2618
    :cond_3a
    if-eq v0, v4, :cond_48

    .line 2619
    if-ne v0, v6, :cond_6d

    .line 2620
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2621
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 2629
    :cond_48
    :goto_48
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-ge v1, v2, :cond_94

    .line 2630
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2631
    if-le v0, v4, :cond_79

    .line 2632
    const/16 v1, 0x2f

    if-eq v0, v1, :cond_62

    if-ne v0, v8, :cond_1a

    .line 2633
    :cond_62
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2634
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd2()I

    move-result v0

    goto :goto_1a

    .line 2622
    :cond_6d
    if-ne v0, v7, :cond_73

    .line 2623
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_48

    .line 2624
    :cond_73
    if-eq v0, v5, :cond_48

    .line 2625
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_48

    .line 2638
    :cond_79
    if-eq v0, v4, :cond_48

    .line 2639
    if-ne v0, v6, :cond_88

    .line 2640
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2641
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_48

    .line 2642
    :cond_88
    if-ne v0, v7, :cond_8e

    .line 2643
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_48

    .line 2644
    :cond_8e
    if-eq v0, v5, :cond_48

    .line 2645
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_48

    .line 2649
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

    .line 2654
    :cond_2
    :goto_2
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_e

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-eqz v1, :cond_50

    .line 2655
    :cond_e
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v1, v2

    and-int/lit16 v0, v1, 0xff

    .line 2656
    .local v0, "i":I
    if-le v0, v4, :cond_2f

    .line 2657
    const/16 v1, 0x2f

    if-ne v0, v1, :cond_24

    .line 2658
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipComment()V

    goto :goto_2

    .line 2661
    :cond_24
    const/16 v1, 0x23

    if-ne v0, v1, :cond_2e

    .line 2662
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipYAMLComment()Z

    move-result v1

    if-nez v1, :cond_2

    .line 2679
    .end local v0    # "i":I
    :cond_2e
    :goto_2e
    return v0

    .line 2667
    .restart local v0    # "i":I
    :cond_2f
    if-eq v0, v4, :cond_2

    .line 2668
    const/16 v1, 0xa

    if-ne v0, v1, :cond_40

    .line 2669
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 2670
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_2

    .line 2671
    :cond_40
    const/16 v1, 0xd

    if-ne v0, v1, :cond_48

    .line 2672
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_2

    .line 2673
    :cond_48
    const/16 v1, 0x9

    if-eq v0, v1, :cond_2

    .line 2674
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    goto :goto_2

    .line 2679
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
    .line 2843
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_YAML_COMMENTS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 2844
    const/4 v0, 0x0

    .line 2847
    :goto_9
    return v0

    .line 2846
    :cond_a
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipLine()V

    .line 2847
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

    .line 1338
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_12

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v2

    if-nez v2, :cond_12

    move v0, v1

    .line 1364
    :cond_11
    :goto_11
    return v0

    .line 1341
    :cond_12
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 1343
    .local v0, "ch":I
    if-lt v0, v1, :cond_1e

    if-le v0, v4, :cond_20

    :cond_1e
    move v0, v1

    .line 1344
    goto :goto_11

    .line 1347
    :cond_20
    sget-object v2, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NUMERIC_LEADING_ZEROS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v2

    if-nez v2, :cond_2d

    .line 1348
    const-string v2, "Leading zeroes not allowed"

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportInvalidNumber(Ljava/lang/String;)V

    .line 1351
    :cond_2d
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1352
    if-ne v0, v1, :cond_11

    .line 1353
    :cond_35
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_41

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 1354
    :cond_41
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 1355
    if-lt v0, v1, :cond_4d

    if-le v0, v4, :cond_4f

    :cond_4d
    move v0, v1

    .line 1356
    goto :goto_11

    .line 1358
    :cond_4f
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1359
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
    .line 1470
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1472
    sparse-switch p1, :sswitch_data_1c

    .line 1484
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMissingRootWS(I)V

    .line 1485
    :goto_c
    :sswitch_c
    return-void

    .line 1477
    :sswitch_d
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipCR()V

    goto :goto_c

    .line 1480
    :sswitch_11
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 1481
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    goto :goto_c

    .line 1472
    :sswitch_data_1c
    .sparse-switch
        0x9 -> :sswitch_c
        0xa -> :sswitch_11
        0xd -> :sswitch_d
        0x20 -> :sswitch_c
    .end sparse-switch
.end method

.method private final addName([III)Lcom/fasterxml/jackson/core/sym/Name;
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
    .line 2029
    shl-int/lit8 v12, p2, 0x2

    add-int/lit8 v12, v12, -0x4

    add-int v3, v12, p3

    .line 2038
    .local v3, "byteLen":I
    const/4 v12, 0x4

    move/from16 v0, p3

    if-ge v0, v12, :cond_d7

    .line 2039
    add-int/lit8 v12, p2, -0x1

    aget v10, p1, v12

    .line 2041
    .local v10, "lastQuad":I
    add-int/lit8 v12, p2, -0x1

    rsub-int/lit8 v13, p3, 0x4

    shl-int/lit8 v13, v13, 0x3

    shl-int v13, v10, v13

    aput v13, p1, v12

    .line 2047
    :goto_19
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v12}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 2048
    .local v4, "cbuf":[C
    const/4 v7, 0x0

    .line 2050
    .local v7, "cix":I
    const/4 v9, 0x0

    .local v9, "ix":I
    move v8, v7

    .end local v7    # "cix":I
    .local v8, "cix":I
    :goto_22
    if-ge v9, v3, :cond_f7

    .line 2051
    shr-int/lit8 v12, v9, 0x2

    aget v5, p1, v12

    .line 2052
    .local v5, "ch":I
    and-int/lit8 v2, v9, 0x3

    .line 2053
    .local v2, "byteIx":I
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int v12, v5, v12

    and-int/lit16 v5, v12, 0xff

    .line 2054
    add-int/lit8 v9, v9, 0x1

    .line 2056
    const/16 v12, 0x7f

    if-le v5, v12, :cond_10f

    .line 2058
    and-int/lit16 v12, v5, 0xe0

    const/16 v13, 0xc0

    if-ne v12, v13, :cond_da

    .line 2059
    and-int/lit8 v5, v5, 0x1f

    .line 2060
    const/4 v11, 0x1

    .line 2071
    .local v11, "needed":I
    :goto_41
    add-int v12, v9, v11

    if-le v12, v3, :cond_4a

    .line 2072
    const-string v12, " in field name"

    invoke-virtual {p0, v12}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2076
    :cond_4a
    shr-int/lit8 v12, v9, 0x2

    aget v6, p1, v12

    .line 2077
    .local v6, "ch2":I
    and-int/lit8 v2, v9, 0x3

    .line 2078
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int/2addr v6, v12

    .line 2079
    add-int/lit8 v9, v9, 0x1

    .line 2081
    and-int/lit16 v12, v6, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_60

    .line 2082
    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 2084
    :cond_60
    shl-int/lit8 v12, v5, 0x6

    and-int/lit8 v13, v6, 0x3f

    or-int v5, v12, v13

    .line 2085
    const/4 v12, 0x1

    if-le v11, v12, :cond_a6

    .line 2086
    shr-int/lit8 v12, v9, 0x2

    aget v6, p1, v12

    .line 2087
    and-int/lit8 v2, v9, 0x3

    .line 2088
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int/2addr v6, v12

    .line 2089
    add-int/lit8 v9, v9, 0x1

    .line 2091
    and-int/lit16 v12, v6, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_7f

    .line 2092
    invoke-virtual {p0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 2094
    :cond_7f
    shl-int/lit8 v12, v5, 0x6

    and-int/lit8 v13, v6, 0x3f

    or-int v5, v12, v13

    .line 2095
    const/4 v12, 0x2

    if-le v11, v12, :cond_a6

    .line 2096
    shr-int/lit8 v12, v9, 0x2

    aget v6, p1, v12

    .line 2097
    and-int/lit8 v2, v9, 0x3

    .line 2098
    rsub-int/lit8 v12, v2, 0x3

    shl-int/lit8 v12, v12, 0x3

    shr-int/2addr v6, v12

    .line 2099
    add-int/lit8 v9, v9, 0x1

    .line 2100
    and-int/lit16 v12, v6, 0xc0

    const/16 v13, 0x80

    if-eq v12, v13, :cond_a0

    .line 2101
    and-int/lit16 v12, v6, 0xff

    invoke-virtual {p0, v12}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 2103
    :cond_a0
    shl-int/lit8 v12, v5, 0x6

    and-int/lit8 v13, v6, 0x3f

    or-int v5, v12, v13

    .line 2106
    :cond_a6
    const/4 v12, 0x2

    if-le v11, v12, :cond_10f

    .line 2107
    const/high16 v12, 0x10000

    sub-int/2addr v5, v12

    .line 2108
    array-length v12, v4

    if-lt v8, v12, :cond_b5

    .line 2109
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v12}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v4

    .line 2111
    :cond_b5
    add-int/lit8 v7, v8, 0x1

    .end local v8    # "cix":I
    .restart local v7    # "cix":I
    const v12, 0xd800

    shr-int/lit8 v13, v5, 0xa

    add-int/2addr v12, v13

    int-to-char v12, v12

    aput-char v12, v4, v8

    .line 2112
    const v12, 0xdc00

    and-int/lit16 v13, v5, 0x3ff

    or-int v5, v12, v13

    .line 2115
    .end local v6    # "ch2":I
    .end local v11    # "needed":I
    :goto_c7
    array-length v12, v4

    if-lt v7, v12, :cond_d0

    .line 2116
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v12}, Lcom/fasterxml/jackson/core/util/TextBuffer;->expandCurrentSegment()[C

    move-result-object v4

    .line 2118
    :cond_d0
    add-int/lit8 v8, v7, 0x1

    .end local v7    # "cix":I
    .restart local v8    # "cix":I
    int-to-char v12, v5

    aput-char v12, v4, v7

    goto/16 :goto_22

    .line 2043
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

    .line 2061
    .restart local v2    # "byteIx":I
    .restart local v4    # "cbuf":[C
    .restart local v5    # "ch":I
    .restart local v8    # "cix":I
    .restart local v9    # "ix":I
    :cond_da
    and-int/lit16 v12, v5, 0xf0

    const/16 v13, 0xe0

    if-ne v12, v13, :cond_e5

    .line 2062
    and-int/lit8 v5, v5, 0xf

    .line 2063
    const/4 v11, 0x2

    .restart local v11    # "needed":I
    goto/16 :goto_41

    .line 2064
    .end local v11    # "needed":I
    :cond_e5
    and-int/lit16 v12, v5, 0xf8

    const/16 v13, 0xf0

    if-ne v12, v13, :cond_f0

    .line 2065
    and-int/lit8 v5, v5, 0x7

    .line 2066
    const/4 v11, 0x3

    .restart local v11    # "needed":I
    goto/16 :goto_41

    .line 2068
    .end local v11    # "needed":I
    :cond_f0
    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidInitial(I)V

    .line 2069
    const/4 v5, 0x1

    move v11, v5

    .restart local v11    # "needed":I
    goto/16 :goto_41

    .line 2122
    .end local v2    # "byteIx":I
    .end local v5    # "ch":I
    .end local v11    # "needed":I
    :cond_f7
    new-instance v1, Ljava/lang/String;

    const/4 v12, 0x0

    invoke-direct {v1, v4, v12, v8}, Ljava/lang/String;-><init>([CII)V

    .line 2124
    .local v1, "baseName":Ljava/lang/String;
    const/4 v12, 0x4

    move/from16 v0, p3

    if-ge v0, v12, :cond_106

    .line 2125
    add-int/lit8 v12, p2, -0x1

    aput v10, p1, v12

    .line 2127
    :cond_106
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

    move/from16 v0, p2

    invoke-virtual {v12, v1, p1, v0}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->addName(Ljava/lang/String;[II)Lcom/fasterxml/jackson/core/sym/Name;

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

.method private final findName(II)Lcom/fasterxml/jackson/core/sym/Name;
    .registers 6
    .param p1, "q1"    # I
    .param p2, "lastQuadBytes"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 1978
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->findName(I)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    .line 1979
    .local v0, "name":Lcom/fasterxml/jackson/core/sym/Name;
    if-eqz v0, :cond_9

    .line 1984
    .end local v0    # "name":Lcom/fasterxml/jackson/core/sym/Name;
    :goto_8
    return-object v0

    .line 1983
    .restart local v0    # "name":Lcom/fasterxml/jackson/core/sym/Name;
    :cond_9
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 1984
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2, p2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto :goto_8
.end method

.method private final findName(III)Lcom/fasterxml/jackson/core/sym/Name;
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
    .line 1991
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

    invoke-virtual {v1, p1, p2}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->findName(II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    .line 1992
    .local v0, "name":Lcom/fasterxml/jackson/core/sym/Name;
    if-eqz v0, :cond_9

    .line 1998
    .end local v0    # "name":Lcom/fasterxml/jackson/core/sym/Name;
    :goto_8
    return-object v0

    .line 1996
    .restart local v0    # "name":Lcom/fasterxml/jackson/core/sym/Name;
    :cond_9
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    aput p1, v1, v2

    .line 1997
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x1

    aput p2, v1, v2

    .line 1998
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x2

    invoke-direct {p0, v1, v2, p3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto :goto_8
.end method

.method private final findName([IIII)Lcom/fasterxml/jackson/core/sym/Name;
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
    .line 2004
    array-length v2, p1

    if-lt p2, v2, :cond_a

    .line 2005
    array-length v2, p1

    invoke-static {p1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 2007
    :cond_a
    add-int/lit8 v1, p2, 0x1

    .end local p2    # "qlen":I
    .local v1, "qlen":I
    aput p3, p1, p2

    .line 2008
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

    invoke-virtual {v2, p1, v1}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->findName([II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    .line 2009
    .local v0, "name":Lcom/fasterxml/jackson/core/sym/Name;
    if-nez v0, :cond_1a

    .line 2010
    invoke-direct {p0, p1, v1, p4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    .line 2012
    .end local v0    # "name":Lcom/fasterxml/jackson/core/sym/Name;
    :cond_1a
    return-object v0
.end method

.method public static growArrayBy([II)[I
    .registers 3
    .param p0, "arr"    # [I
    .param p1, "more"    # I

    .prologue
    .line 3235
    if-nez p0, :cond_5

    .line 3236
    new-array v0, p1, [I

    .line 3238
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
    .line 3165
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_9

    .line 3166
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3168
    :cond_9
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method private final parseName(III)Lcom/fasterxml/jackson/core/sym/Name;
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
    .line 1676
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x0

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    return-object v0
.end method

.method private final parseName(IIII)Lcom/fasterxml/jackson/core/sym/Name;
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
    .line 1680
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    .line 1681
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v2, 0x1

    move-object v0, p0

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Lcom/fasterxml/jackson/core/sym/Name;

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
    .line 237
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_1c

    .line 238
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->isResourceManaged()Z

    move-result v0

    if-nez v0, :cond_14

    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->AUTO_CLOSE_SOURCE:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_19

    .line 239
    :cond_14
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 241
    :cond_19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    .line 243
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

    .line 3254
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_getByteArrayBuilder()Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    move-result-object v1

    .line 3261
    .local v1, "builder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    :cond_8
    :goto_8
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_11

    .line 3262
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3264
    :cond_11
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3265
    .local v2, "ch":I
    const/16 v4, 0x20

    if-le v2, v4, :cond_8

    .line 3266
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 3267
    .local v0, "bits":I
    if-gez v0, :cond_35

    .line 3268
    if-ne v2, v8, :cond_2e

    .line 3269
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    .line 3337
    :goto_2d
    return-object v4

    .line 3271
    :cond_2e
    const/4 v4, 0x0

    invoke-virtual {p0, p1, v2, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 3272
    if-ltz v0, :cond_8

    .line 3276
    :cond_35
    move v3, v0

    .line 3280
    .local v3, "decodedData":I
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_3f

    .line 3281
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3283
    :cond_3f
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3284
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 3285
    if-gez v0, :cond_56

    .line 3286
    const/4 v4, 0x1

    invoke-virtual {p0, p1, v2, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 3288
    :cond_56
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 3291
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_63

    .line 3292
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3294
    :cond_63
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3295
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 3298
    if-gez v0, :cond_d4

    .line 3299
    if-eq v0, v7, :cond_8e

    .line 3301
    if-ne v2, v8, :cond_89

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v4

    if-nez v4, :cond_89

    .line 3302
    shr-int/lit8 v3, v3, 0x4

    .line 3303
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    .line 3304
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    goto :goto_2d

    .line 3306
    :cond_89
    const/4 v4, 0x2

    invoke-virtual {p0, p1, v2, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 3308
    :cond_8e
    if-ne v0, v7, :cond_d4

    .line 3310
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_99

    .line 3311
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3313
    :cond_99
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3314
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPaddingChar(I)Z

    move-result v4

    if-nez v4, :cond_cd

    .line 3315
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

    .line 3318
    :cond_cd
    shr-int/lit8 v3, v3, 0x4

    .line 3319
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->append(I)V

    goto/16 :goto_8

    .line 3324
    :cond_d4
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 3326
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v4, v5, :cond_e1

    .line 3327
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 3329
    :cond_e1
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v6, v5, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v4, v4, v5

    and-int/lit16 v2, v4, 0xff

    .line 3330
    invoke-virtual {p1, v2}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 3331
    if-gez v0, :cond_115

    .line 3332
    if-eq v0, v7, :cond_10c

    .line 3334
    if-ne v2, v8, :cond_108

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v4

    if-nez v4, :cond_108

    .line 3335
    shr-int/lit8 v3, v3, 0x2

    .line 3336
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendTwoBytes(I)V

    .line 3337
    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->toByteArray()[B

    move-result-object v4

    goto/16 :goto_2d

    .line 3339
    :cond_108
    invoke-virtual {p0, p1, v2, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 3341
    :cond_10c
    if-ne v0, v7, :cond_115

    .line 3348
    shr-int/lit8 v3, v3, 0x2

    .line 3349
    invoke-virtual {v1, v3}, Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;->appendTwoBytes(I)V

    goto/16 :goto_8

    .line 3354
    :cond_115
    shl-int/lit8 v4, v3, 0x6

    or-int v3, v4, v0

    .line 3355
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

    .line 2947
    and-int/lit16 v0, p1, 0xff

    .line 2948
    .local v0, "c":I
    const/16 v3, 0x7f

    if-le v0, v3, :cond_50

    .line 2952
    and-int/lit16 v3, v0, 0xe0

    const/16 v4, 0xc0

    if-ne v3, v4, :cond_51

    .line 2953
    and-int/lit8 v0, v0, 0x1f

    .line 2954
    const/4 v2, 0x1

    .line 2967
    .local v2, "needed":I
    :goto_11
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextByte()I

    move-result v1

    .line 2968
    .local v1, "d":I
    and-int/lit16 v3, v1, 0xc0

    if-eq v3, v5, :cond_1e

    .line 2969
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 2971
    :cond_1e
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v1, 0x3f

    or-int v0, v3, v4

    .line 2973
    const/4 v3, 0x1

    if-le v2, v3, :cond_50

    .line 2974
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextByte()I

    move-result v1

    .line 2975
    and-int/lit16 v3, v1, 0xc0

    if-eq v3, v5, :cond_34

    .line 2976
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 2978
    :cond_34
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v1, 0x3f

    or-int v0, v3, v4

    .line 2979
    const/4 v3, 0x2

    if-le v2, v3, :cond_50

    .line 2980
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextByte()I

    move-result v1

    .line 2981
    and-int/lit16 v3, v1, 0xc0

    if-eq v3, v5, :cond_4a

    .line 2982
    and-int/lit16 v3, v1, 0xff

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 2984
    :cond_4a
    shl-int/lit8 v3, v0, 0x6

    and-int/lit8 v4, v1, 0x3f

    or-int v0, v3, v4

    .line 2988
    .end local v1    # "d":I
    .end local v2    # "needed":I
    :cond_50
    return v0

    .line 2955
    :cond_51
    and-int/lit16 v3, v0, 0xf0

    const/16 v4, 0xe0

    if-ne v3, v4, :cond_5b

    .line 2956
    and-int/lit8 v0, v0, 0xf

    .line 2957
    const/4 v2, 0x2

    .restart local v2    # "needed":I
    goto :goto_11

    .line 2958
    .end local v2    # "needed":I
    :cond_5b
    and-int/lit16 v3, v0, 0xf8

    const/16 v4, 0xf0

    if-ne v3, v4, :cond_65

    .line 2960
    and-int/lit8 v0, v0, 0x7

    .line 2961
    const/4 v2, 0x3

    .restart local v2    # "needed":I
    goto :goto_11

    .line 2963
    .end local v2    # "needed":I
    :cond_65
    and-int/lit16 v3, v0, 0xff

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidInitial(I)V

    .line 2964
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
    .line 2894
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v5, v6, :cond_11

    .line 2895
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_11

    .line 2896
    const-string v5, " in character escape sequence"

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2899
    :cond_11
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v5, v6

    .line 2901
    .local v0, "c":I
    sparse-switch v0, :sswitch_data_6e

    .line 2924
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeCharForError(I)I

    move-result v5

    int-to-char v5, v5

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnrecognizedCharacterEscape(C)C

    move-result v5

    .line 2942
    :goto_27
    return v5

    .line 2904
    :sswitch_28
    const/16 v5, 0x8

    goto :goto_27

    .line 2906
    :sswitch_2b
    const/16 v5, 0x9

    goto :goto_27

    .line 2908
    :sswitch_2e
    const/16 v5, 0xa

    goto :goto_27

    .line 2910
    :sswitch_31
    const/16 v5, 0xc

    goto :goto_27

    .line 2912
    :sswitch_34
    const/16 v5, 0xd

    goto :goto_27

    .line 2918
    :sswitch_37
    int-to-char v5, v0

    goto :goto_27

    .line 2928
    :sswitch_39
    const/4 v4, 0x0

    .line 2929
    .local v4, "value":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3b
    const/4 v5, 0x4

    if-ge v3, v5, :cond_6b

    .line 2930
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v5, v6, :cond_4f

    .line 2931
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v5

    if-nez v5, :cond_4f

    .line 2932
    const-string v5, " in character escape sequence"

    invoke-virtual {p0, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 2935
    :cond_4f
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v5, v6

    .line 2936
    .local v1, "ch":I
    invoke-static {v1}, Lcom/fasterxml/jackson/core/io/CharTypes;->charToHex(I)I

    move-result v2

    .line 2937
    .local v2, "digit":I
    if-gez v2, :cond_64

    .line 2938
    const-string v5, "expected a hex-digit for character escape sequence"

    invoke-virtual {p0, v1, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2940
    :cond_64
    shl-int/lit8 v5, v4, 0x4

    or-int v4, v5, v2

    .line 2929
    add-int/lit8 v3, v3, 0x1

    goto :goto_3b

    .line 2942
    .end local v1    # "ch":I
    .end local v2    # "digit":I
    :cond_6b
    int-to-char v5, v4

    goto :goto_27

    .line 2901
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

.method protected _finishString()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2140
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2141
    .local v7, "ptr":I
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_b

    .line 2142
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 2143
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2145
    :cond_b
    const/4 v5, 0x0

    .line 2146
    .local v5, "outPtr":I
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v4

    .line 2147
    .local v4, "outBuf":[C
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 2149
    .local v1, "codes":[I
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    array-length v9, v4

    add-int/2addr v9, v7

    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 2150
    .local v3, "max":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .local v2, "inputBuffer":[B
    move v6, v5

    .line 2151
    .end local v5    # "outPtr":I
    .local v6, "outPtr":I
    :goto_1f
    if-ge v7, v3, :cond_40

    .line 2152
    aget-byte v8, v2, v7

    and-int/lit16 v0, v8, 0xff

    .line 2153
    .local v0, "c":I
    aget v8, v1, v0

    if-eqz v8, :cond_37

    .line 2154
    const/16 v8, 0x22

    if-ne v0, v8, :cond_40

    .line 2155
    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2156
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2166
    .end local v0    # "c":I
    :goto_36
    return-void

    .line 2161
    .restart local v0    # "c":I
    :cond_37
    add-int/lit8 v7, v7, 0x1

    .line 2162
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v5    # "outPtr":I
    int-to-char v8, v0

    aput-char v8, v4, v6

    move v6, v5

    .line 2163
    .end local v5    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_1f

    .line 2164
    .end local v0    # "c":I
    :cond_40
    iput v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2165
    invoke-direct {p0, v4, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString2([CI)V

    goto :goto_36
.end method

.method protected final _getText2(Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/String;
    .registers 3
    .param p1, "t"    # Lcom/fasterxml/jackson/core/JsonToken;

    .prologue
    .line 318
    if-nez p1, :cond_4

    .line 319
    const/4 v0, 0x0

    .line 331
    :goto_3
    return-object v0

    .line 321
    :cond_4
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v0

    packed-switch v0, :pswitch_data_1e

    .line 331
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonToken;->asString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 323
    :pswitch_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 329
    :pswitch_17
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 321
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

    .line 2370
    const/4 v0, 0x0

    .line 2372
    .local v0, "c":I
    const/4 v6, 0x0

    .line 2373
    .local v6, "outPtr":I
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v5

    .line 2376
    .local v5, "outBuf":[C
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 2377
    .local v1, "codes":[I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 2384
    .local v2, "inputBuffer":[B
    :cond_e
    :goto_e
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_17

    .line 2385
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 2387
    :cond_17
    array-length v8, v5

    if-lt v6, v8, :cond_21

    .line 2388
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 2389
    const/4 v6, 0x0

    .line 2391
    :cond_21
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 2393
    .local v3, "max":I
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    array-length v9, v5

    sub-int/2addr v9, v6

    add-int v4, v8, v9

    .line 2394
    .local v4, "max2":I
    if-ge v4, v3, :cond_2c

    .line 2395
    move v3, v4

    .line 2398
    :cond_2c
    :goto_2c
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    if-ge v8, v3, :cond_e

    .line 2399
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v8, v2, v8

    and-int/lit16 v0, v8, 0xff

    .line 2400
    if-eq v0, v10, :cond_40

    aget v8, v1, v0

    if-eqz v8, :cond_4a

    .line 2408
    :cond_40
    if-ne v0, v10, :cond_51

    .line 2454
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8, v6}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 2456
    sget-object v8, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    return-object v8

    .line 2403
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

    .line 2412
    :cond_51
    aget v8, v1, v0

    packed-switch v8, :pswitch_data_b4

    .line 2440
    const/16 v8, 0x20

    if-ge v0, v8, :cond_5f

    .line 2441
    const-string v8, "string value"

    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    .line 2444
    :cond_5f
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    .line 2447
    :cond_62
    :goto_62
    array-length v8, v5

    if-lt v6, v8, :cond_6c

    .line 2448
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 2449
    const/4 v6, 0x0

    .line 2452
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

    .line 2414
    :pswitch_73
    if-eq v0, v10, :cond_62

    .line 2415
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    move-result v0

    goto :goto_62

    .line 2419
    :pswitch_7a
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_2(I)I

    move-result v0

    .line 2420
    goto :goto_62

    .line 2422
    :pswitch_7f
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    sub-int/2addr v8, v9

    const/4 v9, 0x2

    if-lt v8, v9, :cond_8c

    .line 2423
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_3fast(I)I

    move-result v0

    goto :goto_62

    .line 2425
    :cond_8c
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_3(I)I

    move-result v0

    .line 2427
    goto :goto_62

    .line 2429
    :pswitch_91
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeUtf8_4(I)I

    move-result v0

    .line 2431
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    const v8, 0xd800

    shr-int/lit8 v9, v0, 0xa

    or-int/2addr v8, v9

    int-to-char v8, v8

    aput-char v8, v5, v6

    .line 2432
    array-length v8, v5

    if-lt v7, v8, :cond_b2

    .line 2433
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/util/TextBuffer;->finishCurrentSegment()[C

    move-result-object v5

    .line 2434
    const/4 v6, 0x0

    .line 2436
    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    :goto_aa
    const v8, 0xdc00

    and-int/lit16 v9, v0, 0x3ff

    or-int v0, v8, v9

    .line 2438
    goto :goto_62

    .end local v6    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_b2
    move v6, v7

    .end local v7    # "outPtr":I
    .restart local v6    # "outPtr":I
    goto :goto_aa

    .line 2412
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
    .line 2466
    :goto_0
    const/16 v1, 0x49

    if-ne p1, v1, :cond_69

    .line 2467
    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v1, v2, :cond_13

    .line 2468
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v1

    if-nez v1, :cond_13

    .line 2469
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOFInValue()V

    .line 2472
    :cond_13
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte p1, v1, v2

    .line 2474
    const/16 v1, 0x4e

    if-ne p1, v1, :cond_3d

    .line 2475
    if-eqz p2, :cond_3a

    const-string v0, "-INF"

    .line 2481
    .local v0, "match":Ljava/lang/String;
    :goto_25
    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 2482
    sget-object v1, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v1

    if-eqz v1, :cond_4c

    .line 2483
    if-eqz p2, :cond_49

    const-wide/high16 v1, -0x10000000000000L    # Double.NEGATIVE_INFINITY

    :goto_35
    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 2488
    .end local v0    # "match":Ljava/lang/String;
    :goto_39
    return-object v1

    .line 2475
    :cond_3a
    const-string v0, "+INF"

    goto :goto_25

    .line 2476
    :cond_3d
    const/16 v1, 0x6e

    if-ne p1, v1, :cond_69

    .line 2477
    if-eqz p2, :cond_46

    const-string v0, "-Infinity"

    .restart local v0    # "match":Ljava/lang/String;
    :goto_45
    goto :goto_25

    .end local v0    # "match":Ljava/lang/String;
    :cond_46
    const-string v0, "+Infinity"

    goto :goto_45

    .line 2483
    .restart local v0    # "match":Ljava/lang/String;
    :cond_49
    const-wide/high16 v1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    goto :goto_35

    .line 2485
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

    .line 2487
    .end local v0    # "match":Ljava/lang/String;
    :cond_69
    const-string v1, "expected digit (0-9) to follow minus sign, for valid numeric value"

    invoke-virtual {p0, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->reportUnexpectedNumberChar(ILjava/lang/String;)V

    .line 2488
    const/4 v1, 0x0

    goto :goto_39
.end method

.method protected _handleOddName(I)Lcom/fasterxml/jackson/core/sym/Name;
    .registers 12
    .param p1, "ch"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1793
    const/16 v8, 0x27

    if-ne p1, v8, :cond_11

    sget-object v8, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v8

    if-eqz v8, :cond_11

    .line 1794
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseAposName()Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v4

    .line 1855
    :cond_10
    :goto_10
    return-object v4

    .line 1797
    :cond_11
    sget-object v8, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_UNQUOTED_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v8

    if-nez v8, :cond_23

    .line 1798
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeCharForError(I)I

    move-result v8

    int-to-char v0, v8

    .line 1799
    .local v0, "c":C
    const-string v8, "was expecting double-quote to start field name"

    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 1805
    .end local v0    # "c":C
    :cond_23
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->getInputCodeUtf8JsNames()[I

    move-result-object v1

    .line 1807
    .local v1, "codes":[I
    aget v8, v1, p1

    if-eqz v8, :cond_30

    .line 1808
    const-string v8, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name"

    invoke-virtual {p0, p1, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 1815
    :cond_30
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1816
    .local v7, "quads":[I
    const/4 v5, 0x0

    .line 1817
    .local v5, "qlen":I
    const/4 v2, 0x0

    .line 1818
    .local v2, "currQuad":I
    const/4 v3, 0x0

    .local v3, "currQuadBytes":I
    move v6, v5

    .line 1822
    .end local v5    # "qlen":I
    .local v6, "qlen":I
    :goto_36
    const/4 v8, 0x4

    if-ge v3, v8, :cond_7b

    .line 1823
    add-int/lit8 v3, v3, 0x1

    .line 1824
    shl-int/lit8 v8, v2, 0x8

    or-int v2, v8, p1

    move v5, v6

    .line 1833
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :goto_40
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_51

    .line 1834
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_51

    .line 1835
    const-string v8, " in field name"

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1838
    :cond_51
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v8, v8, v9

    and-int/lit16 p1, v8, 0xff

    .line 1839
    aget v8, v1, p1

    if-eqz v8, :cond_8c

    .line 1845
    if-lez v3, :cond_6e

    .line 1846
    array-length v8, v7

    if-lt v5, v8, :cond_69

    .line 1847
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1849
    :cond_69
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    aput v2, v7, v5

    move v5, v6

    .line 1851
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :cond_6e
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

    invoke-virtual {v8, v7, v5}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->findName([II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v4

    .line 1852
    .local v4, "name":Lcom/fasterxml/jackson/core/sym/Name;
    if-nez v4, :cond_10

    .line 1853
    invoke-direct {p0, v7, v5, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v4

    goto :goto_10

    .line 1826
    .end local v4    # "name":Lcom/fasterxml/jackson/core/sym/Name;
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_7b
    array-length v8, v7

    if-lt v6, v8, :cond_85

    .line 1827
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1829
    :cond_85
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 1830
    move v2, p1

    .line 1831
    const/4 v3, 0x1

    goto :goto_40

    .line 1842
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

    .line 2325
    sparse-switch p1, :sswitch_data_96

    .line 2359
    :cond_4
    :goto_4
    invoke-static {p1}, Ljava/lang/Character;->isJavaIdentifierStart(I)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 2360
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

    .line 2363
    :cond_23
    const-string v0, "expected a valid value (number, String, array, object, \'true\', \'false\' or \'null\')"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2364
    const/4 v0, 0x0

    :goto_29
    return-object v0

    .line 2330
    :sswitch_2a
    const-string v0, "expected a value"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportUnexpectedChar(ILjava/lang/String;)V

    .line 2332
    :sswitch_2f
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_SINGLE_QUOTES:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2333
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleApos()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 2337
    :sswitch_3c
    const-string v0, "NaN"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 2338
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 2339
    const-string v0, "NaN"

    const-wide/high16 v1, 0x7ff8000000000000L    # Double.NaN

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 2341
    :cond_52
    const-string v0, "Non-standard token \'NaN\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportError(Ljava/lang/String;)V

    goto :goto_4

    .line 2344
    :sswitch_58
    const-string v0, "Infinity"

    invoke-virtual {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 2345
    sget-object v0, Lcom/fasterxml/jackson/core/JsonParser$Feature;->ALLOW_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonParser$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->isEnabled(Lcom/fasterxml/jackson/core/JsonParser$Feature;)Z

    move-result v0

    if-eqz v0, :cond_6e

    .line 2346
    const-string v0, "Infinity"

    const-wide/high16 v1, 0x7ff0000000000000L    # Double.POSITIVE_INFINITY

    invoke-virtual {p0, v0, v1, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetAsNaN(Ljava/lang/String;D)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_29

    .line 2348
    :cond_6e
    const-string v0, "Non-standard token \'Infinity\': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportError(Ljava/lang/String;)V

    goto :goto_4

    .line 2351
    :sswitch_74
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_83

    .line 2352
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_83

    .line 2353
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOFInValue()V

    .line 2356
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

    .line 2325
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

    .line 200
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    if-nez v4, :cond_7

    .line 227
    :cond_6
    :goto_6
    return v2

    .line 204
    :cond_7
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    sub-int v0, v4, v5

    .line 205
    .local v0, "amount":I
    if-lez v0, :cond_69

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    if-lez v4, :cond_69

    .line 206
    iget-wide v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    .line 207
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    sub-int/2addr v4, v5

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 208
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    invoke-static {v4, v5, v6, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 209
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 213
    :goto_2d
    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 214
    :goto_2f
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-ge v4, p1, :cond_72

    .line 215
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    array-length v7, v7

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    sub-int/2addr v7, v8

    invoke-virtual {v4, v5, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 216
    .local v1, "count":I
    if-ge v1, v3, :cond_6c

    .line 218
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_closeInput()V

    .line 220
    if-nez v1, :cond_6

    .line 221
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

    .line 211
    .end local v1    # "count":I
    :cond_69
    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    goto :goto_2d

    .line 225
    .restart local v1    # "count":I
    :cond_6c
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    goto :goto_2f

    .end local v1    # "count":I
    :cond_72
    move v2, v3

    .line 227
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
    .line 2493
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 2494
    .local v1, "len":I
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/2addr v2, v1

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v2, v3, :cond_f

    .line 2495
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken2(Ljava/lang/String;I)V

    .line 2509
    :cond_e
    :goto_e
    return-void

    .line 2499
    :cond_f
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v2, v3, :cond_23

    .line 2500
    const/4 v2, 0x0

    invoke-virtual {p1, v2, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidToken(Ljava/lang/String;)V

    .line 2502
    :cond_23
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2503
    add-int/lit8 p2, p2, 0x1

    if-lt p2, v1, :cond_f

    .line 2505
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v2, v2, v3

    and-int/lit16 v0, v2, 0xff

    .line 2506
    .local v0, "ch":I
    const/16 v2, 0x30

    if-lt v0, v2, :cond_e

    const/16 v2, 0x5d

    if-eq v0, v2, :cond_e

    const/16 v2, 0x7d

    if-eq v0, v2, :cond_e

    .line 2507
    invoke-direct {p0, p1, p2, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_checkMatchEnd(Ljava/lang/String;II)V

    goto :goto_e
.end method

.method protected _parseAposName()Lcom/fasterxml/jackson/core/sym/Name;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v12, 0x27

    const/4 v11, 0x4

    .line 1865
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_14

    .line 1866
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_14

    .line 1867
    const-string v8, ": was expecting closing \'\'\' for name"

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1870
    :cond_14
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v8, v8, v9

    and-int/lit16 v0, v8, 0xff

    .line 1871
    .local v0, "ch":I
    if-ne v0, v12, :cond_27

    .line 1872
    invoke-static {}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->getEmptyName()Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v4

    .line 1965
    :cond_26
    :goto_26
    return-object v4

    .line 1874
    :cond_27
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1875
    .local v7, "quads":[I
    const/4 v5, 0x0

    .line 1876
    .local v5, "qlen":I
    const/4 v2, 0x0

    .line 1877
    .local v2, "currQuad":I
    const/4 v3, 0x0

    .line 1881
    .local v3, "currQuadBytes":I
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .local v1, "codes":[I
    move v6, v5

    .line 1884
    .end local v5    # "qlen":I
    .local v6, "qlen":I
    :goto_2f
    if-ne v0, v12, :cond_4e

    .line 1955
    if-lez v3, :cond_f2

    .line 1956
    array-length v8, v7

    if-lt v6, v8, :cond_3d

    .line 1957
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1959
    :cond_3d
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 1961
    :goto_41
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

    invoke-virtual {v8, v7, v5}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->findName([II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v4

    .line 1962
    .local v4, "name":Lcom/fasterxml/jackson/core/sym/Name;
    if-nez v4, :cond_26

    .line 1963
    invoke-direct {p0, v7, v5, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v4

    goto :goto_26

    .line 1888
    .end local v4    # "name":Lcom/fasterxml/jackson/core/sym/Name;
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_4e
    const/16 v8, 0x22

    if-eq v0, v8, :cond_8a

    aget v8, v1, v0

    if-eqz v8, :cond_8a

    .line 1889
    const/16 v8, 0x5c

    if-eq v0, v8, :cond_b3

    .line 1892
    const-string v8, "name"

    invoke-virtual {p0, v0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    .line 1902
    :goto_5f
    const/16 v8, 0x7f

    if-le v0, v8, :cond_8a

    .line 1904
    if-lt v3, v11, :cond_76

    .line 1905
    array-length v8, v7

    if-lt v6, v8, :cond_6f

    .line 1906
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1908
    :cond_6f
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 1909
    const/4 v2, 0x0

    .line 1910
    const/4 v3, 0x0

    move v6, v5

    .line 1912
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_76
    const/16 v8, 0x800

    if-ge v0, v8, :cond_b8

    .line 1913
    shl-int/lit8 v8, v2, 0x8

    shr-int/lit8 v9, v0, 0x6

    or-int/lit16 v9, v9, 0xc0

    or-int v2, v8, v9

    .line 1914
    add-int/lit8 v3, v3, 0x1

    move v5, v6

    .line 1932
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :goto_85
    and-int/lit8 v8, v0, 0x3f

    or-int/lit16 v0, v8, 0x80

    move v6, v5

    .line 1936
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_8a
    if-ge v3, v11, :cond_e1

    .line 1937
    add-int/lit8 v3, v3, 0x1

    .line 1938
    shl-int/lit8 v8, v2, 0x8

    or-int v2, v8, v0

    move v5, v6

    .line 1947
    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    :goto_93
    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v8, v9, :cond_a4

    .line 1948
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v8

    if-nez v8, :cond_a4

    .line 1949
    const-string v8, " in field name"

    invoke-virtual {p0, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1952
    :cond_a4
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v8, v8, v9

    and-int/lit16 v0, v8, 0xff

    move v6, v5

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    goto/16 :goto_2f

    .line 1895
    :cond_b3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    move-result v0

    goto :goto_5f

    .line 1917
    :cond_b8
    shl-int/lit8 v8, v2, 0x8

    shr-int/lit8 v9, v0, 0xc

    or-int/lit16 v9, v9, 0xe0

    or-int v2, v8, v9

    .line 1918
    add-int/lit8 v3, v3, 0x1

    .line 1920
    if-lt v3, v11, :cond_f5

    .line 1921
    array-length v8, v7

    if-lt v6, v8, :cond_ce

    .line 1922
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1924
    :cond_ce
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 1925
    const/4 v2, 0x0

    .line 1926
    const/4 v3, 0x0

    .line 1928
    :goto_d4
    shl-int/lit8 v8, v2, 0x8

    shr-int/lit8 v9, v0, 0x6

    and-int/lit8 v9, v9, 0x3f

    or-int/lit16 v9, v9, 0x80

    or-int v2, v8, v9

    .line 1929
    add-int/lit8 v3, v3, 0x1

    goto :goto_85

    .line 1940
    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_e1
    array-length v8, v7

    if-lt v6, v8, :cond_eb

    .line 1941
    array-length v8, v7

    invoke-static {v7, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v7

    iput-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1943
    :cond_eb
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    aput v2, v7, v6

    .line 1944
    move v2, v0

    .line 1945
    const/4 v3, 0x1

    goto :goto_93

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_f2
    move v5, v6

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    goto/16 :goto_41

    .end local v5    # "qlen":I
    .restart local v6    # "qlen":I
    :cond_f5
    move v5, v6

    .end local v6    # "qlen":I
    .restart local v5    # "qlen":I
    goto :goto_d4
.end method

.method protected final _parseName(I)Lcom/fasterxml/jackson/core/sym/Name;
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

    .line 1495
    if-eq p1, v5, :cond_d

    .line 1496
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleOddName(I)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    .line 1552
    :goto_c
    return-object v3

    .line 1499
    :cond_d
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v3, 0x9

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-le v3, v4, :cond_1a

    .line 1500
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->slowParseName()Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_c

    .line 1509
    :cond_1a
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 1510
    .local v1, "input":[B
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .line 1512
    .local v0, "codes":[I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 v2, v3, 0xff

    .line 1514
    .local v2, "q":I
    aget v3, v0, v2

    if-nez v3, :cond_ae

    .line 1515
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1516
    aget v3, v0, p1

    if-nez v3, :cond_a0

    .line 1517
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1518
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1519
    aget v3, v0, p1

    if-nez v3, :cond_92

    .line 1520
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1521
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1522
    aget v3, v0, p1

    if-nez v3, :cond_85

    .line 1523
    shl-int/lit8 v3, v2, 0x8

    or-int v2, v3, p1

    .line 1524
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v1, v3

    and-int/lit16 p1, v3, 0xff

    .line 1525
    aget v3, v0, p1

    if-nez v3, :cond_77

    .line 1526
    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    .line 1527
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseMediumName(I)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_c

    .line 1529
    :cond_77
    if-ne p1, v5, :cond_7f

    .line 1530
    const/4 v3, 0x4

    invoke-direct {p0, v2, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_c

    .line 1532
    :cond_7f
    const/4 v3, 0x4

    invoke-direct {p0, v2, p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_c

    .line 1534
    :cond_85
    if-ne p1, v5, :cond_8c

    .line 1535
    invoke-direct {p0, v2, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_c

    .line 1537
    :cond_8c
    invoke-direct {p0, v2, p1, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto/16 :goto_c

    .line 1539
    :cond_92
    if-ne p1, v5, :cond_9a

    .line 1540
    invoke-direct {p0, v2, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto/16 :goto_c

    .line 1542
    :cond_9a
    invoke-direct {p0, v2, p1, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto/16 :goto_c

    .line 1544
    :cond_a0
    if-ne p1, v5, :cond_a8

    .line 1545
    invoke-direct {p0, v2, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto/16 :goto_c

    .line 1547
    :cond_a8
    invoke-direct {p0, v2, p1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto/16 :goto_c

    .line 1549
    :cond_ae
    if-ne v2, v5, :cond_b6

    .line 1550
    invoke-static {}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->getEmptyName()Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto/16 :goto_c

    .line 1552
    :cond_b6
    invoke-direct {p0, v6, v2, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(III)Lcom/fasterxml/jackson/core/sym/Name;

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

    .line 1233
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 1234
    .local v1, "outBuf":[C
    const/4 v2, 0x0

    .line 1237
    .local v2, "outPtr":I
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "outPtr":I
    .local v7, "outPtr":I
    const/16 v0, 0x2d

    aput-char v0, v1, v2

    .line 1239
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v8, :cond_1b

    .line 1240
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 1242
    :cond_1b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v8

    and-int/lit16 v3, v0, 0xff

    .line 1244
    .local v3, "c":I
    if-lt v3, v10, :cond_2b

    if-le v3, v11, :cond_31

    .line 1245
    :cond_2b
    invoke-virtual {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleInvalidNumberStart(IZ)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    move v2, v7

    .line 1289
    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    :goto_30
    return-object v0

    .line 1249
    .end local v2    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_31
    if-ne v3, v10, :cond_37

    .line 1250
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyNoLeadingZeroes()I

    move-result v3

    .line 1254
    :cond_37
    add-int/lit8 v2, v7, 0x1

    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    int-to-char v0, v3

    aput-char v0, v1, v7

    .line 1255
    const/4 v5, 0x1

    .line 1259
    .local v5, "intLen":I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    array-length v8, v1

    add-int v6, v0, v8

    .line 1260
    .local v6, "end":I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-le v6, v0, :cond_48

    .line 1261
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 1266
    :cond_48
    :goto_48
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    if-lt v0, v6, :cond_51

    .line 1268
    invoke-direct {p0, v1, v2, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNumber2([CIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_30

    .line 1270
    :cond_51
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v8

    and-int/lit16 v3, v0, 0xff

    .line 1271
    if-lt v3, v10, :cond_61

    if-le v3, v11, :cond_73

    .line 1277
    :cond_61
    const/16 v0, 0x2e

    if-eq v3, v0, :cond_6d

    const/16 v0, 0x65

    if-eq v3, v0, :cond_6d

    const/16 v0, 0x45

    if-ne v3, v0, :cond_7c

    :cond_6d
    move-object v0, p0

    .line 1278
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_30

    .line 1274
    :cond_73
    add-int/lit8 v5, v5, 0x1

    .line 1275
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "outPtr":I
    .restart local v7    # "outPtr":I
    int-to-char v0, v3

    aput-char v0, v1, v2

    move v2, v7

    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    goto :goto_48

    .line 1281
    :cond_7c
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1282
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1284
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_92

    .line 1285
    invoke-direct {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyRootSpace(I)V

    .line 1289
    :cond_92
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

    .line 1191
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->emptyAndGetCurrentSegment()[C

    move-result-object v1

    .line 1192
    .local v1, "outBuf":[C
    const/4 v2, 0x0

    .line 1194
    .local v2, "outPtr":I
    if-ne p1, v9, :cond_10

    .line 1195
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyNoLeadingZeroes()I

    move-result p1

    .line 1198
    :cond_10
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "outPtr":I
    .local v7, "outPtr":I
    int-to-char v0, p1

    aput-char v0, v1, v2

    .line 1199
    const/4 v5, 0x1

    .line 1202
    .local v5, "intLen":I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    array-length v3, v1

    add-int v6, v0, v3

    .line 1203
    .local v6, "end":I
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-le v6, v0, :cond_74

    .line 1204
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    move v2, v7

    .line 1208
    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    :goto_22
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    if-lt v0, v6, :cond_2b

    .line 1209
    invoke-direct {p0, v1, v2, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNumber2([CIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 1228
    :goto_2a
    return-object v0

    .line 1211
    :cond_2b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v8, v3, 0x1

    iput v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v3

    and-int/lit16 p1, v0, 0xff

    .line 1212
    if-lt p1, v9, :cond_3d

    const/16 v0, 0x39

    if-le p1, v0, :cond_50

    .line 1218
    :cond_3d
    const/16 v0, 0x2e

    if-eq p1, v0, :cond_49

    const/16 v0, 0x65

    if-eq p1, v0, :cond_49

    const/16 v0, 0x45

    if-ne p1, v0, :cond_59

    :cond_49
    move-object v0, p0

    move v3, p1

    .line 1219
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseFloat([CIIZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_2a

    .line 1215
    :cond_50
    add-int/lit8 v5, v5, 0x1

    .line 1216
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "outPtr":I
    .restart local v7    # "outPtr":I
    int-to-char v0, p1

    aput-char v0, v1, v2

    move v2, v7

    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    goto :goto_22

    .line 1221
    :cond_59
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 1222
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0, v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->setCurrentLength(I)V

    .line 1224
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inRoot()Z

    move-result v0

    if-eqz v0, :cond_6f

    .line 1225
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_verifyRootSpace(I)V

    .line 1228
    :cond_6f
    invoke-virtual {p0, v4, v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->resetInt(ZI)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_2a

    .end local v2    # "outPtr":I
    .restart local v7    # "outPtr":I
    :cond_74
    move v2, v7

    .end local v7    # "outPtr":I
    .restart local v2    # "outPtr":I
    goto :goto_22
.end method

.method protected _readBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;[B)I
    .registers 14
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "out"    # Ljava/io/OutputStream;
    .param p3, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 477
    const/4 v5, 0x0

    .line 478
    .local v5, "outputPtr":I
    array-length v7, p3

    add-int/lit8 v4, v7, -0x3

    .line 479
    .local v4, "outputEnd":I
    const/4 v3, 0x0

    .line 485
    .local v3, "outputCount":I
    :cond_5
    :goto_5
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_e

    .line 486
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 488
    :cond_e
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 489
    .local v1, "ch":I
    const/16 v7, 0x20

    if-le v1, v7, :cond_5

    .line 490
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 491
    .local v0, "bits":I
    if-gez v0, :cond_3a

    .line 492
    const/16 v7, 0x22

    if-ne v1, v7, :cond_33

    .line 593
    :goto_28
    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 594
    if-lez v5, :cond_32

    .line 595
    add-int/2addr v3, v5

    .line 596
    const/4 v7, 0x0

    invoke-virtual {p2, p3, v7, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 598
    :cond_32
    return v3

    .line 495
    :cond_33
    const/4 v7, 0x0

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 496
    if-ltz v0, :cond_5

    .line 502
    :cond_3a
    if-le v5, v4, :cond_42

    .line 503
    add-int/2addr v3, v5

    .line 504
    const/4 v7, 0x0

    invoke-virtual {p2, p3, v7, v5}, Ljava/io/OutputStream;->write([BII)V

    .line 505
    const/4 v5, 0x0

    .line 508
    :cond_42
    move v2, v0

    .line 512
    .local v2, "decodedData":I
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_4c

    .line 513
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 515
    :cond_4c
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 516
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 517
    if-gez v0, :cond_63

    .line 518
    const/4 v7, 0x1

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 520
    :cond_63
    shl-int/lit8 v7, v2, 0x6

    or-int v2, v7, v0

    .line 523
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_70

    .line 524
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 526
    :cond_70
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 527
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 530
    if-gez v0, :cond_e8

    .line 531
    const/4 v7, -0x2

    if-eq v0, v7, :cond_9d

    .line 533
    const/16 v7, 0x22

    if-ne v1, v7, :cond_98

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v7

    if-nez v7, :cond_98

    .line 534
    shr-int/lit8 v2, v2, 0x4

    .line 535
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .local v6, "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v5

    move v5, v6

    .line 536
    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    goto :goto_28

    .line 538
    :cond_98
    const/4 v7, 0x2

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 540
    :cond_9d
    const/4 v7, -0x2

    if-ne v0, v7, :cond_e8

    .line 542
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_a9

    .line 543
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 545
    :cond_a9
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 546
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPaddingChar(I)Z

    move-result v7

    if-nez v7, :cond_de

    .line 547
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

    .line 550
    :cond_de
    shr-int/lit8 v2, v2, 0x4

    .line 551
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v5

    move v5, v6

    .line 552
    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    goto/16 :goto_5

    .line 556
    :cond_e8
    shl-int/lit8 v7, v2, 0x6

    or-int v2, v7, v0

    .line 558
    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v7, v8, :cond_f5

    .line 559
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 561
    :cond_f5
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v7, v7, v8

    and-int/lit16 v1, v7, 0xff

    .line 562
    invoke-virtual {p1, v1}, Lcom/fasterxml/jackson/core/Base64Variant;->decodeBase64Char(I)I

    move-result v0

    .line 563
    if-gez v0, :cond_13c

    .line 564
    const/4 v7, -0x2

    if-eq v0, v7, :cond_129

    .line 566
    const/16 v7, 0x22

    if-ne v1, v7, :cond_124

    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->usesPadding()Z

    move-result v7

    if-nez v7, :cond_124

    .line 567
    shr-int/lit8 v2, v2, 0x2

    .line 568
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x8

    int-to-byte v7, v7

    aput-byte v7, p3, v5

    .line 569
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v6

    goto/16 :goto_28

    .line 572
    :cond_124
    const/4 v7, 0x3

    invoke-virtual {p0, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64Escape(Lcom/fasterxml/jackson/core/Base64Variant;II)I

    move-result v0

    .line 574
    :cond_129
    const/4 v7, -0x2

    if-ne v0, v7, :cond_13c

    .line 581
    shr-int/lit8 v2, v2, 0x2

    .line 582
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x8

    int-to-byte v7, v7

    aput-byte v7, p3, v5

    .line 583
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v6

    goto/16 :goto_5

    .line 588
    :cond_13c
    shl-int/lit8 v7, v2, 0x6

    or-int v2, v7, v0

    .line 589
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x10

    int-to-byte v7, v7

    aput-byte v7, p3, v5

    .line 590
    add-int/lit8 v5, v6, 0x1

    .end local v6    # "outputPtr":I
    .restart local v5    # "outputPtr":I
    shr-int/lit8 v7, v2, 0x8

    int-to-byte v7, v7

    aput-byte v7, p3, v6

    .line 591
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "outputPtr":I
    .restart local v6    # "outputPtr":I
    int-to-byte v7, v2

    aput-byte v7, p3, v5

    move v5, v6

    .line 592
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
    .line 254
    invoke-super {p0}, Lcom/fasterxml/jackson/core/base/ParserBase;->_releaseBuffers()V

    .line 256
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->release()V

    .line 257
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_bufferRecyclable:Z

    if-eqz v1, :cond_18

    .line 258
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 259
    .local v0, "buf":[B
    if-eqz v0, :cond_18

    .line 260
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 261
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseReadIOBuffer([B)V

    .line 264
    .end local v0    # "buf":[B
    :cond_18
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
    .line 3208
    const/16 v0, 0x20

    if-ge p1, v0, :cond_7

    .line 3209
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwInvalidSpace(I)V

    .line 3211
    :cond_7
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidInitial(I)V

    .line 3212
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
    .line 3217
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

    .line 3218
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
    .line 3223
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

    .line 3224
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
    .line 3229
    iput p2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 3230
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidOther(I)V

    .line 3231
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
    .line 3179
    const-string v0, "\'null\', \'true\', \'false\' or NaN"

    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidToken(Ljava/lang/String;Ljava/lang/String;)V

    .line 3180
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
    .line 3184
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 3191
    .local v2, "sb":Ljava/lang/StringBuilder;
    :goto_5
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_36

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_36

    .line 3201
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

    .line 3202
    return-void

    .line 3194
    :cond_36
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v1, v3, v4

    .line 3195
    .local v1, "i":I
    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeCharForError(I)I

    move-result v3

    int-to-char v0, v3

    .line 3196
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 3199
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
    .line 3154
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_c

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 3155
    :cond_c
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    const/16 v1, 0xa

    if-ne v0, v1, :cond_1c

    .line 3156
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 3159
    :cond_1c
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    .line 3160
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 3161
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
    .line 2259
    const/4 v6, 0x0

    iput-boolean v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 2262
    sget-object v1, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icUTF8:[I

    .line 2263
    .local v1, "codes":[I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 2271
    .local v2, "inputBuffer":[B
    :goto_7
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2272
    .local v4, "ptr":I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 2273
    .local v3, "max":I
    if-lt v4, v3, :cond_4e

    .line 2274
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMoreGuaranteed()V

    .line 2275
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2276
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    move v5, v4

    .line 2278
    .end local v4    # "ptr":I
    .local v5, "ptr":I
    :goto_15
    if-ge v5, v3, :cond_28

    .line 2279
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "ptr":I
    .restart local v4    # "ptr":I
    aget-byte v6, v2, v5

    and-int/lit16 v0, v6, 0xff

    .line 2280
    .local v0, "c":I
    aget v6, v1, v0

    if-eqz v6, :cond_4e

    .line 2281
    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 2288
    const/16 v6, 0x22

    if-ne v0, v6, :cond_2b

    .line 2315
    return-void

    .line 2285
    .end local v0    # "c":I
    .end local v4    # "ptr":I
    .restart local v5    # "ptr":I
    :cond_28
    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    goto :goto_7

    .line 2292
    .end local v5    # "ptr":I
    .restart local v0    # "c":I
    .restart local v4    # "ptr":I
    :cond_2b
    aget v6, v1, v0

    packed-switch v6, :pswitch_data_50

    .line 2306
    const/16 v6, 0x20

    if-ge v0, v6, :cond_4a

    .line 2308
    const-string v6, "string value"

    invoke-virtual {p0, v0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    goto :goto_7

    .line 2294
    :pswitch_3a
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    goto :goto_7

    .line 2297
    :pswitch_3e
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_2(I)V

    goto :goto_7

    .line 2300
    :pswitch_42
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_3(I)V

    goto :goto_7

    .line 2303
    :pswitch_46
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipUtf8_4(I)V

    goto :goto_7

    .line 2311
    :cond_4a
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidChar(I)V

    goto :goto_7

    .end local v0    # "c":I
    :cond_4e
    move v5, v4

    .end local v4    # "ptr":I
    .restart local v5    # "ptr":I
    goto :goto_15

    .line 2292
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
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 426
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_2e

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_EMBEDDED_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_10

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    if-nez v2, :cond_2e

    .line 428
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

    .line 433
    :cond_2e
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_65

    .line 435
    :try_start_32
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64(Lcom/fasterxml/jackson/core/Base64Variant;)[B

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B
    :try_end_38
    .catch Ljava/lang/IllegalArgumentException; {:try_start_32 .. :try_end_38} :catch_3e

    .line 442
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 451
    :cond_3b
    :goto_3b
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    return-object v2

    .line 436
    :catch_3e
    move-exception v1

    .line 437
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

    .line 444
    .end local v1    # "iae":Ljava/lang/IllegalArgumentException;
    :cond_65
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    if-nez v2, :cond_3b

    .line 446
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_getByteArrayBuilder()Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;

    move-result-object v0

    .line 447
    .local v0, "builder":Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeBase64(Ljava/lang/String;Lcom/fasterxml/jackson/core/util/ByteArrayBuilder;Lcom/fasterxml/jackson/core/Base64Variant;)V

    .line 448
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
    .line 615
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    sub-int/2addr v0, v1

    add-int/lit8 v7, v0, 0x1

    .line 616
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
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 276
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_17

    .line 277
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_10

    .line 278
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 279
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 281
    :cond_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    .line 283
    :goto_16
    return-object v0

    :cond_17
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_getText2(Lcom/fasterxml/jackson/core/JsonToken;)Ljava/lang/String;

    move-result-object v0

    goto :goto_16
.end method

.method public getTextCharacters()[C
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 339
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v2, :cond_54

    .line 340
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v2

    packed-switch v2, :pswitch_data_56

    .line 367
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonToken;->asCharArray()[C

    move-result-object v2

    .line 370
    :goto_14
    return-object v2

    .line 343
    :pswitch_15
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    if-nez v2, :cond_37

    .line 344
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 345
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 346
    .local v1, "nameLen":I
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    if-nez v2, :cond_3a

    .line 347
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocNameCopyBuffer(I)[C

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    .line 351
    :cond_2f
    :goto_2f
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    invoke-virtual {v0, v3, v1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 352
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 354
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "nameLen":I
    :cond_37
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    goto :goto_14

    .line 348
    .restart local v0    # "name":Ljava/lang/String;
    .restart local v1    # "nameLen":I
    :cond_3a
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    array-length v2, v2

    if-ge v2, v1, :cond_2f

    .line 349
    new-array v2, v1, [C

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopyBuffer:[C

    goto :goto_2f

    .line 357
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "nameLen":I
    :pswitch_44
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_4d

    .line 358
    iput-boolean v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 359
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 364
    :cond_4d
    :pswitch_4d
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextBuffer()[C

    move-result-object v2

    goto :goto_14

    .line 370
    :cond_54
    const/4 v2, 0x0

    goto :goto_14

    .line 340
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
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 377
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v1, :cond_15

    .line 378
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v1

    packed-switch v1, :pswitch_data_32

    .line 393
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->asCharArray()[C

    move-result-object v0

    array-length v0, v0

    .line 396
    :cond_15
    :goto_15
    return v0

    .line 381
    :pswitch_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_15

    .line 383
    :pswitch_21
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_2a

    .line 384
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 385
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 390
    :cond_2a
    :pswitch_2a
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->size()I

    move-result v0

    goto :goto_15

    .line 378
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
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 403
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    if-eqz v1, :cond_e

    .line 404
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v1

    packed-switch v1, :pswitch_data_20

    .line 419
    :cond_e
    :goto_e
    :pswitch_e
    return v0

    .line 408
    :pswitch_f
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_18

    .line 409
    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 410
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 415
    :cond_18
    :pswitch_18
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->getTextOffset()I

    move-result v0

    goto :goto_e

    .line 404
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
    .line 605
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

.method public getValueAsString()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 292
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_17

    .line 293
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_10

    .line 294
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 295
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 297
    :cond_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    .line 299
    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_16
.end method

.method public getValueAsString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "defValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 306
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_17

    .line 307
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v0, :cond_10

    .line 308
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 309
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 311
    :cond_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v0

    .line 313
    :goto_16
    return-object v0

    :cond_17
    invoke-super {p0, p1}, Lcom/fasterxml/jackson/core/base/ParserBase;->getValueAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_16
.end method

.method protected final loadMore()Z
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 172
    iget-wide v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    int-to-long v4, v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    .line 173
    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    sub-int/2addr v2, v3

    iput v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    .line 175
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    if-eqz v2, :cond_26

    .line 176
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputStream:Ljava/io/InputStream;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    array-length v4, v4

    invoke-virtual {v2, v3, v1, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 177
    .local v0, "count":I
    if-lez v0, :cond_27

    .line 178
    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 179
    iput v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    .line 180
    const/4 v1, 0x1

    .line 189
    .end local v0    # "count":I
    :cond_26
    return v1

    .line 183
    .restart local v0    # "count":I
    :cond_27
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_closeInput()V

    .line 185
    if-nez v0, :cond_26

    .line 186
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "InputStream.read() returned 0 characters when trying to read "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    array-length v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
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

    .line 1139
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_40

    .line 1140
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 1141
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1142
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1143
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1144
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_17

    .line 1145
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1164
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_16
    :goto_16
    return-object v1

    .line 1147
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_17
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_1e

    .line 1148
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_16

    .line 1150
    :cond_1e
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_2f

    .line 1151
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_16

    .line 1152
    :cond_2f
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_16

    .line 1153
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_16

    .line 1158
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_40
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonToken;->id()I

    move-result v2

    packed-switch v2, :pswitch_data_52

    goto :goto_16

    .line 1160
    :pswitch_4c
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_16

    .line 1162
    :pswitch_4f
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_16

    .line 1158
    :pswitch_data_52
    .packed-switch 0x9
        :pswitch_4c
        :pswitch_4f
    .end packed-switch
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
    .line 822
    const/4 v6, 0x0

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    .line 823
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v6, v7, :cond_e

    .line 824
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    .line 825
    const/4 v6, 0x0

    .line 902
    :goto_d
    return v6

    .line 827
    :cond_e
    iget-boolean v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v6, :cond_15

    .line 828
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipString()V

    .line 830
    :cond_15
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd()I

    move-result v1

    .line 831
    .local v1, "i":I
    if-gez v1, :cond_23

    .line 832
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->close()V

    .line 833
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 834
    const/4 v6, 0x0

    goto :goto_d

    .line 836
    :cond_23
    iget-wide v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    int-to-long v8, v8

    add-long/2addr v6, v8

    const-wide/16 v8, 0x1

    sub-long/2addr v6, v8

    iput-wide v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputTotal:J

    .line 837
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    .line 838
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    sub-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    .line 841
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    .line 844
    const/16 v6, 0x5d

    if-ne v1, v6, :cond_5d

    .line 845
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v6

    if-nez v6, :cond_4f

    .line 846
    const/16 v6, 0x7d

    invoke-virtual {p0, v1, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 848
    :cond_4f
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v6

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 849
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 850
    const/4 v6, 0x0

    goto :goto_d

    .line 852
    :cond_5d
    const/16 v6, 0x7d

    if-ne v1, v6, :cond_7c

    .line 853
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v6

    if-nez v6, :cond_6e

    .line 854
    const/16 v6, 0x5d

    invoke-virtual {p0, v1, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 856
    :cond_6e
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v6

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 857
    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 858
    const/4 v6, 0x0

    goto :goto_d

    .line 862
    :cond_7c
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v6

    if-eqz v6, :cond_ae

    .line 863
    const/16 v6, 0x2c

    if-eq v1, v6, :cond_aa

    .line 864
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

    .line 866
    :cond_aa
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWS()I

    move-result v1

    .line 869
    :cond_ae
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v6

    if-nez v6, :cond_bc

    .line 870
    invoke-direct {p0, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;

    .line 871
    const/4 v6, 0x0

    goto/16 :goto_d

    .line 875
    :cond_bc
    const/16 v6, 0x22

    if-ne v1, v6, :cond_fc

    .line 877
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedUTF8()[B

    move-result-object v3

    .line 878
    .local v3, "nameBytes":[B
    array-length v2, v3

    .line 881
    .local v2, "len":I
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/2addr v6, v2

    add-int/lit8 v6, v6, 0x4

    iget v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-ge v6, v7, :cond_fc

    .line 883
    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int v0, v6, v2

    .line 884
    .local v0, "end":I
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    aget-byte v6, v6, v0

    const/16 v7, 0x22

    if-ne v6, v7, :cond_fc

    .line 885
    const/4 v4, 0x0

    .line 886
    .local v4, "offset":I
    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    .line 888
    .local v5, "ptr":I
    :goto_dd
    if-ne v5, v0, :cond_f4

    .line 889
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 890
    add-int/lit8 v6, v5, 0x1

    invoke-direct {p0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColonFast(I)I

    move-result v6

    invoke-direct {p0, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_isNextTokenNameYes(I)V

    .line 891
    const/4 v6, 0x1

    goto/16 :goto_d

    .line 893
    :cond_f4
    aget-byte v6, v3, v4

    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    aget-byte v7, v7, v5

    if-eq v6, v7, :cond_102

    .line 902
    .end local v0    # "end":I
    .end local v2    # "len":I
    .end local v3    # "nameBytes":[B
    .end local v4    # "offset":I
    .end local v5    # "ptr":I
    :cond_fc
    invoke-direct {p0, v1, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_isNextTokenNameMaybe(ILcom/fasterxml/jackson/core/SerializableString;)Z

    move-result v6

    goto/16 :goto_d

    .line 896
    .restart local v0    # "end":I
    .restart local v2    # "len":I
    .restart local v3    # "nameBytes":[B
    .restart local v4    # "offset":I
    .restart local v5    # "ptr":I
    :cond_102
    add-int/lit8 v4, v4, 0x1

    .line 897
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
    .line 1093
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_3b

    .line 1094
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 1095
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1096
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1097
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1098
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_19

    .line 1099
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getIntValue()I

    move-result p1

    .line 1109
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .end local p1    # "defaultValue":I
    :cond_18
    :goto_18
    return p1

    .line 1101
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local p1    # "defaultValue":I
    :cond_19
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2a

    .line 1102
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1103
    :cond_2a
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_18

    .line 1104
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1109
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
    .line 1116
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v2, :cond_3b

    .line 1117
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 1118
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1119
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1120
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1121
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NUMBER_INT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_19

    .line 1122
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getLongValue()J

    move-result-wide p1

    .line 1132
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .end local p1    # "defaultValue":J
    :cond_18
    :goto_18
    return-wide p1

    .line 1124
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    .restart local p1    # "defaultValue":J
    :cond_19
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_2a

    .line 1125
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1126
    :cond_2a
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_18

    .line 1127
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_18

    .line 1132
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

    .line 1066
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_46

    .line 1067
    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nameCopied:Z

    .line 1068
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1069
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1070
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 1071
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_24

    .line 1072
    iget-boolean v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v1, :cond_1d

    .line 1073
    iput-boolean v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 1074
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_finishString()V

    .line 1076
    :cond_1d
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_textBuffer:Lcom/fasterxml/jackson/core/util/TextBuffer;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/util/TextBuffer;->contentsAsString()Ljava/lang/String;

    move-result-object v1

    .line 1086
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_23
    :goto_23
    return-object v1

    .line 1078
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_24
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_35

    .line 1079
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildArrayContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_23

    .line 1080
    :cond_35
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v2, :cond_23

    .line 1081
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    invoke-virtual {v2, v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->createChildObjectContext(II)Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v2

    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    goto :goto_23

    .line 1086
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_46
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_23

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_23
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

    .line 634
    const/4 v4, 0x0

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_numTypesValid:I

    .line 639
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v4, v5, :cond_14

    .line 640
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextAfterName()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 751
    :goto_13
    return-object v3

    .line 642
    :cond_14
    iget-boolean v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v4, :cond_1b

    .line 643
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipString()V

    .line 645
    :cond_1b
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWSOrEnd()I

    move-result v0

    .line 646
    .local v0, "i":I
    if-gez v0, :cond_27

    .line 648
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->close()V

    .line 649
    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 654
    :cond_27
    iget-wide v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputProcessed:J

    iget v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    iput-wide v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputTotal:J

    .line 655
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRow:I

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputRow:I

    .line 656
    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currInputRowStart:I

    sub-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenInputCol:I

    .line 659
    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_binaryValue:[B

    .line 662
    if-ne v0, v9, :cond_5b

    .line 663
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inArray()Z

    move-result v3

    if-nez v3, :cond_4e

    .line 664
    invoke-virtual {p0, v0, v10}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 666
    :cond_4e
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 667
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 669
    :cond_5b
    if-ne v0, v10, :cond_75

    .line 670
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_68

    .line 671
    invoke-virtual {p0, v0, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportMismatchedEndMarker(IC)V

    .line 673
    :cond_68
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonReadContext;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    .line 674
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto :goto_13

    .line 678
    :cond_75
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->expectComma()Z

    move-result v3

    if-eqz v3, :cond_a7

    .line 679
    const/16 v3, 0x2c

    if-eq v0, v3, :cond_a3

    .line 680
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

    .line 682
    :cond_a3
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipWS()I

    move-result v0

    .line 689
    :cond_a7
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->inObject()Z

    move-result v3

    if-nez v3, :cond_b5

    .line 690
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextTokenNotInObject(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    goto/16 :goto_13

    .line 693
    :cond_b5
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseName(I)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v1

    .line 694
    .local v1, "n":Lcom/fasterxml/jackson/core/sym/Name;
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsingContext:Lcom/fasterxml/jackson/core/json/JsonReadContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/sym/Name;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/fasterxml/jackson/core/json/JsonReadContext;->setCurrentName(Ljava/lang/String;)V

    .line 695
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->FIELD_NAME:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 697
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_skipColon()I

    move-result v0

    .line 700
    const/16 v3, 0x22

    if-ne v0, v3, :cond_d8

    .line 701
    iput-boolean v8, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    .line 702
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 703
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_13

    .line 707
    :cond_d8
    sparse-switch v0, :sswitch_data_10e

    .line 748
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_handleUnexpectedValue(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 750
    .local v2, "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_df
    iput-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_nextToken:Lcom/fasterxml/jackson/core/JsonToken;

    .line 751
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    goto/16 :goto_13

    .line 709
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_e5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parseNegNumber()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 710
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_df

    .line 726
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_ea
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_parsePosNumber(I)Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 727
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_df

    .line 729
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_ef
    const-string v3, "false"

    invoke-virtual {p0, v3, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 730
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_FALSE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 731
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_df

    .line 733
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_f7
    const-string v3, "null"

    invoke-virtual {p0, v3, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 734
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 735
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_df

    .line 737
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_ff
    const-string v3, "true"

    invoke-virtual {p0, v3, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_matchToken(Ljava/lang/String;I)V

    .line 738
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_TRUE:Lcom/fasterxml/jackson/core/JsonToken;

    .line 739
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_df

    .line 741
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_107
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    .line 742
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_df

    .line 744
    .end local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :sswitch_10a
    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    .line 745
    .restart local v2    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    goto :goto_df

    .line 707
    nop

    :sswitch_data_10e
    .sparse-switch
        0x2d -> :sswitch_e5
        0x30 -> :sswitch_ea
        0x31 -> :sswitch_ea
        0x32 -> :sswitch_ea
        0x33 -> :sswitch_ea
        0x34 -> :sswitch_ea
        0x35 -> :sswitch_ea
        0x36 -> :sswitch_ea
        0x37 -> :sswitch_ea
        0x38 -> :sswitch_ea
        0x39 -> :sswitch_ea
        0x5b -> :sswitch_107
        0x66 -> :sswitch_ef
        0x6e -> :sswitch_f7
        0x74 -> :sswitch_ff
        0x7b -> :sswitch_10a
    .end sparse-switch
.end method

.method protected final parseEscapedName([IIIII)Lcom/fasterxml/jackson/core/sym/Name;
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

    .line 1698
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .line 1701
    .local v0, "codes":[I
    :goto_3
    aget v3, v0, p4

    if-eqz v3, :cond_c6

    .line 1702
    const/16 v3, 0x22

    if-ne p4, v3, :cond_29

    .line 1771
    if-lez p5, :cond_1c

    .line 1772
    array-length v3, p1

    if-lt p2, v3, :cond_17

    .line 1773
    array-length v3, p1

    invoke-static {p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1775
    :cond_17
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "qlen":I
    .local v2, "qlen":I
    aput p3, p1, p2

    move p2, v2

    .line 1777
    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :cond_1c
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_symbols:Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;

    invoke-virtual {v3, p1, p2}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->findName([II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v1

    .line 1778
    .local v1, "name":Lcom/fasterxml/jackson/core/sym/Name;
    if-nez v1, :cond_28

    .line 1779
    invoke-direct {p0, p1, p2, p5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->addName([III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v1

    .line 1781
    :cond_28
    return-object v1

    .line 1706
    .end local v1    # "name":Lcom/fasterxml/jackson/core/sym/Name;
    :cond_29
    const/16 v3, 0x5c

    if-eq p4, v3, :cond_83

    .line 1708
    const-string v3, "name"

    invoke-virtual {p0, p4, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_throwUnquotedSpace(ILjava/lang/String;)V

    .line 1718
    :goto_32
    const/16 v3, 0x7f

    if-le p4, v3, :cond_c6

    .line 1720
    if-lt p5, v6, :cond_c4

    .line 1721
    array-length v3, p1

    if-lt p2, v3, :cond_42

    .line 1722
    array-length v3, p1

    invoke-static {p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1724
    :cond_42
    add-int/lit8 v2, p2, 0x1

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    aput p3, p1, p2

    .line 1725
    const/4 p3, 0x0

    .line 1726
    const/4 p5, 0x0

    .line 1728
    :goto_48
    const/16 v3, 0x800

    if-ge p4, v3, :cond_88

    .line 1729
    shl-int/lit8 v3, p3, 0x8

    shr-int/lit8 v4, p4, 0x6

    or-int/lit16 v4, v4, 0xc0

    or-int p3, v3, v4

    .line 1730
    add-int/lit8 p5, p5, 0x1

    move p2, v2

    .line 1748
    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :goto_57
    and-int/lit8 v3, p4, 0x3f

    or-int/lit16 p4, v3, 0x80

    move v2, p2

    .line 1752
    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :goto_5c
    if-ge p5, v6, :cond_b1

    .line 1753
    add-int/lit8 p5, p5, 0x1

    .line 1754
    shl-int/lit8 v3, p3, 0x8

    or-int p3, v3, p4

    move p2, v2

    .line 1763
    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :goto_65
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v3, v4, :cond_76

    .line 1764
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v3

    if-nez v3, :cond_76

    .line 1765
    const-string v3, " in field name"

    invoke-virtual {p0, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1768
    :cond_76
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v3, v4

    and-int/lit16 p4, v3, 0xff

    goto :goto_3

    .line 1711
    :cond_83
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_decodeEscaped()C

    move-result p4

    goto :goto_32

    .line 1733
    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_88
    shl-int/lit8 v3, p3, 0x8

    shr-int/lit8 v4, p4, 0xc

    or-int/lit16 v4, v4, 0xe0

    or-int p3, v3, v4

    .line 1734
    add-int/lit8 p5, p5, 0x1

    .line 1736
    if-lt p5, v6, :cond_c2

    .line 1737
    array-length v3, p1

    if-lt v2, v3, :cond_9e

    .line 1738
    array-length v3, p1

    invoke-static {p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1740
    :cond_9e
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    aput p3, p1, v2

    .line 1741
    const/4 p3, 0x0

    .line 1742
    const/4 p5, 0x0

    .line 1744
    :goto_a4
    shl-int/lit8 v3, p3, 0x8

    shr-int/lit8 v4, p4, 0x6

    and-int/lit8 v4, v4, 0x3f

    or-int/lit16 v4, v4, 0x80

    or-int p3, v3, v4

    .line 1745
    add-int/lit8 p5, p5, 0x1

    goto :goto_57

    .line 1756
    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_b1
    array-length v3, p1

    if-lt v2, v3, :cond_bb

    .line 1757
    array-length v3, p1

    invoke-static {p1, v3}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object p1

    iput-object p1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1759
    :cond_bb
    add-int/lit8 p2, v2, 0x1

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    aput p3, p1, v2

    .line 1760
    move p3, p4

    .line 1761
    const/4 p5, 0x1

    goto :goto_65

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    :cond_c2
    move p2, v2

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    goto :goto_a4

    :cond_c4
    move v2, p2

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    goto :goto_48

    .end local v2    # "qlen":I
    .restart local p2    # "qlen":I
    :cond_c6
    move v2, p2

    .end local p2    # "qlen":I
    .restart local v2    # "qlen":I
    goto :goto_5c
.end method

.method protected final parseLongName(II)Lcom/fasterxml/jackson/core/sym/Name;
    .registers 17
    .param p1, "q"    # I
    .param p2, "q2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1597
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x0

    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    aput v3, v0, v1

    .line 1598
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x1

    aput p2, v0, v1

    .line 1601
    iget-object v12, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 1602
    .local v12, "input":[B
    sget-object v11, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .line 1603
    .local v11, "codes":[I
    const/4 v2, 0x2

    .line 1605
    .local v2, "qlen":I
    :goto_11
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-gt v0, v1, :cond_cd

    .line 1606
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v12, v0

    and-int/lit16 v4, v0, 0xff

    .line 1607
    .local v4, "i":I
    aget v0, v11, v4

    if-eqz v0, :cond_3d

    .line 1608
    const/16 v0, 0x22

    if-ne v4, v0, :cond_33

    .line 1609
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x1

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName([IIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    .line 1653
    .end local v4    # "i":I
    :goto_32
    return-object v0

    .line 1611
    .restart local v4    # "i":I
    :cond_33
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v5, 0x1

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto :goto_32

    .line 1614
    :cond_3d
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1615
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v12, v0

    and-int/lit16 v4, v0, 0xff

    .line 1616
    aget v0, v11, v4

    if-eqz v0, :cond_65

    .line 1617
    const/16 v0, 0x22

    if-ne v4, v0, :cond_5b

    .line 1618
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x2

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName([IIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto :goto_32

    .line 1620
    :cond_5b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v5, 0x2

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto :goto_32

    .line 1623
    :cond_65
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1624
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v12, v0

    and-int/lit16 v4, v0, 0xff

    .line 1625
    aget v0, v11, v4

    if-eqz v0, :cond_8d

    .line 1626
    const/16 v0, 0x22

    if-ne v4, v0, :cond_83

    .line 1627
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x3

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName([IIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto :goto_32

    .line 1629
    :cond_83
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v5, 0x3

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto :goto_32

    .line 1632
    :cond_8d
    shl-int/lit8 v0, p1, 0x8

    or-int p1, v0, v4

    .line 1633
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v12, v0

    and-int/lit16 v4, v0, 0xff

    .line 1634
    aget v0, v11, v4

    if-eqz v0, :cond_b6

    .line 1635
    const/16 v0, 0x22

    if-ne v4, v0, :cond_ab

    .line 1636
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v1, 0x4

    invoke-direct {p0, v0, v2, p1, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName([IIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto :goto_32

    .line 1638
    :cond_ab
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v5, 0x4

    move-object v0, p0

    move v3, p1

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto/16 :goto_32

    .line 1642
    :cond_b6
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    array-length v0, v0

    if-lt v2, v0, :cond_c3

    .line 1643
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    invoke-static {v0, v2}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->growArrayBy([II)[I

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    .line 1645
    :cond_c3
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    add-int/lit8 v13, v2, 0x1

    .end local v2    # "qlen":I
    .local v13, "qlen":I
    aput p1, v0, v2

    .line 1646
    move p1, v4

    move v2, v13

    .line 1647
    .end local v13    # "qlen":I
    .restart local v2    # "qlen":I
    goto/16 :goto_11

    .line 1653
    .end local v4    # "i":I
    :cond_cd
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    const/4 v8, 0x0

    const/4 v10, 0x0

    move-object v5, p0

    move v7, v2

    move v9, p1

    invoke-virtual/range {v5 .. v10}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto/16 :goto_32
.end method

.method protected final parseMediumName(I)Lcom/fasterxml/jackson/core/sym/Name;
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

    .line 1557
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    .line 1558
    .local v2, "input":[B
    sget-object v0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_icLatin1:[I

    .line 1561
    .local v0, "codes":[I
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v2, v3

    and-int/lit16 v1, v3, 0xff

    .line 1562
    .local v1, "i":I
    aget v3, v0, v1

    if-eqz v3, :cond_28

    .line 1563
    if-ne v1, v5, :cond_21

    .line 1564
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    .line 1592
    :goto_20
    return-object v3

    .line 1566
    :cond_21
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v6}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_20

    .line 1568
    :cond_28
    shl-int/lit8 v3, p1, 0x8

    or-int p1, v3, v1

    .line 1569
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v2, v3

    and-int/lit16 v1, v3, 0xff

    .line 1570
    aget v3, v0, v1

    if-eqz v3, :cond_4a

    .line 1571
    if-ne v1, v5, :cond_43

    .line 1572
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_20

    .line 1574
    :cond_43
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v7}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_20

    .line 1576
    :cond_4a
    shl-int/lit8 v3, p1, 0x8

    or-int p1, v3, v1

    .line 1577
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v2, v3

    and-int/lit16 v1, v3, 0xff

    .line 1578
    aget v3, v0, v1

    if-eqz v3, :cond_6c

    .line 1579
    if-ne v1, v5, :cond_65

    .line 1580
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_20

    .line 1582
    :cond_65
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v8}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_20

    .line 1584
    :cond_6c
    shl-int/lit8 v3, p1, 0x8

    or-int p1, v3, v1

    .line 1585
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v3, v2, v3

    and-int/lit16 v1, v3, 0xff

    .line 1586
    aget v3, v0, v1

    if-eqz v3, :cond_8e

    .line 1587
    if-ne v1, v5, :cond_87

    .line 1588
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->findName(III)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_20

    .line 1590
    :cond_87
    iget v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quad1:I

    invoke-direct {p0, v3, p1, v1, v9}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseName(IIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_20

    .line 1592
    :cond_8e
    invoke-virtual {p0, v1, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseLongName(II)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v3

    goto :goto_20
.end method

.method public readBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;)I
    .registers 7
    .param p1, "b64variant"    # Lcom/fasterxml/jackson/core/Base64Variant;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonParseException;
        }
    .end annotation

    .prologue
    .line 459
    iget-boolean v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_tokenIncomplete:Z

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_currToken:Lcom/fasterxml/jackson/core/JsonToken;

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_13

    .line 460
    :cond_a
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->getBinaryValue(Lcom/fasterxml/jackson/core/Base64Variant;)[B

    move-result-object v0

    .line 461
    .local v0, "b":[B
    invoke-virtual {p2, v0}, Ljava/io/OutputStream;->write([B)V

    .line 462
    array-length v2, v0

    .line 469
    .end local v0    # "b":[B
    :goto_12
    return v2

    .line 465
    :cond_13
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/io/IOContext;->allocBase64Buffer()[B

    move-result-object v1

    .line 467
    .local v1, "buf":[B
    :try_start_19
    invoke-virtual {p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_readBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/OutputStream;[B)I
    :try_end_1c
    .catchall {:try_start_19 .. :try_end_1c} :catchall_23

    move-result v2

    .line 469
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

.method protected slowParseName()Lcom/fasterxml/jackson/core/sym/Name;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 1663
    iget v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputEnd:I

    if-lt v0, v1, :cond_12

    .line 1664
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->loadMore()Z

    move-result v0

    if-nez v0, :cond_12

    .line 1665
    const-string v0, ": was expecting closing \'\"\' for name"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_reportInvalidEOF(Ljava/lang/String;)V

    .line 1668
    :cond_12
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputBuffer:[B

    iget v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_inputPtr:I

    aget-byte v0, v0, v1

    and-int/lit16 v4, v0, 0xff

    .line 1669
    .local v4, "i":I
    const/16 v0, 0x22

    if-ne v4, v0, :cond_27

    .line 1670
    invoke-static {}, Lcom/fasterxml/jackson/core/sym/BytesToNameCanonicalizer;->getEmptyName()Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    .line 1672
    :goto_26
    return-object v0

    :cond_27
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->_quadBuffer:[I

    move-object v0, p0

    move v3, v2

    move v5, v2

    invoke-virtual/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/UTF8StreamJsonParser;->parseEscapedName([IIIII)Lcom/fasterxml/jackson/core/sym/Name;

    move-result-object v0

    goto :goto_26
.end method
