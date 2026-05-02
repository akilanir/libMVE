.class public Lbrut/androlib/res/decoder/StringBlock;
.super Ljava/lang/Object;


# static fields
.field private static final CHUNK_TYPE:I = 0x1c0001

.field private static final LOGGER:Ljava/util/logging/Logger;

.field private static final UTF16LE_DECODER:Ljava/nio/charset/CharsetDecoder;

.field private static final UTF8_DECODER:Ljava/nio/charset/CharsetDecoder;

.field private static final UTF8_FLAG:I = 0x100


# instance fields
.field private m_isUTF8:Z

.field private m_stringOffsets:[I

.field private m_strings:[B

.field private m_styleOffsets:[I

.field private m_styles:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "UTF-16LE"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sput-object v0, Lbrut/androlib/res/decoder/StringBlock;->UTF16LE_DECODER:Ljava/nio/charset/CharsetDecoder;

    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sput-object v0, Lbrut/androlib/res/decoder/StringBlock;->UTF8_DECODER:Ljava/nio/charset/CharsetDecoder;

    const-class v0, Lbrut/androlib/res/decoder/StringBlock;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lbrut/androlib/res/decoder/StringBlock;->LOGGER:Ljava/util/logging/Logger;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private decodeString(II)Ljava/lang/String;
    .registers 7

    const/4 v0, 0x0

    :try_start_1
    iget-boolean v1, p0, Lbrut/androlib/res/decoder/StringBlock;->m_isUTF8:Z

    if-eqz v1, :cond_16

    sget-object v1, Lbrut/androlib/res/decoder/StringBlock;->UTF8_DECODER:Ljava/nio/charset/CharsetDecoder;

    :goto_7
    iget-object v2, p0, Lbrut/androlib/res/decoder/StringBlock;->m_strings:[B

    invoke-static {v2, p1, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_15
    return-object v0

    :cond_16
    sget-object v1, Lbrut/androlib/res/decoder/StringBlock;->UTF16LE_DECODER:Ljava/nio/charset/CharsetDecoder;
    :try_end_18
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_1 .. :try_end_18} :catch_19

    goto :goto_7

    :catch_19
    move-exception v1

    sget-object v2, Lbrut/androlib/res/decoder/StringBlock;->LOGGER:Ljava/util/logging/Logger;

    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    invoke-virtual {v2, v3, v0, v1}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_15
.end method

.method private static final getShort([BI)I
    .registers 4

    add-int/lit8 v0, p1, 0x1

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    aget-byte v1, p0, p1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private static final getShort([II)I
    .registers 4

    div-int/lit8 v0, p1, 0x4

    aget v0, p0, v0

    rem-int/lit8 v1, p1, 0x4

    div-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_f

    const v1, 0xffff

    and-int/2addr v0, v1

    :goto_e
    return v0

    :cond_f
    ushr-int/lit8 v0, v0, 0x10

    goto :goto_e
.end method

.method private getStyle(I)[I
    .registers 9

    const/4 v4, 0x0

    const/4 v3, 0x0

    const/4 v6, -0x1

    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_styleOffsets:[I

    if-eqz v0, :cond_10

    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_styles:[I

    if-eqz v0, :cond_10

    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_styleOffsets:[I

    array-length v0, v0

    if-lt p1, v0, :cond_12

    :cond_10
    move-object v0, v4

    :goto_11
    return-object v0

    :cond_12
    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_styleOffsets:[I

    aget v0, v0, p1

    div-int/lit8 v1, v0, 0x4

    move v0, v1

    move v2, v3

    :goto_1a
    iget-object v5, p0, Lbrut/androlib/res/decoder/StringBlock;->m_styles:[I

    array-length v5, v5

    if-ge v0, v5, :cond_25

    iget-object v5, p0, Lbrut/androlib/res/decoder/StringBlock;->m_styles:[I

    aget v5, v5, v0

    if-ne v5, v6, :cond_2d

    :cond_25
    if-eqz v2, :cond_2b

    rem-int/lit8 v0, v2, 0x3

    if-eqz v0, :cond_32

    :cond_2b
    move-object v0, v4

    goto :goto_11

    :cond_2d
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1a

    :cond_32
    new-array v4, v2, [I

    :goto_34
    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_styles:[I

    array-length v0, v0

    if-ge v1, v0, :cond_3f

    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_styles:[I

    aget v0, v0, v1

    if-ne v0, v6, :cond_41

    :cond_3f
    move-object v0, v4

    goto :goto_11

    :cond_41
    add-int/lit8 v0, v3, 0x1

    iget-object v5, p0, Lbrut/androlib/res/decoder/StringBlock;->m_styles:[I

    add-int/lit8 v2, v1, 0x1

    aget v1, v5, v1

    aput v1, v4, v3

    move v3, v0

    move v1, v2

    goto :goto_34
.end method

.method private static final getVarint([BI)[I
    .registers 8

    const/4 v5, 0x2

    const/4 v2, 0x0

    const/4 v1, 0x1

    aget-byte v3, p0, p1

    and-int/lit16 v0, v3, 0x80

    if-eqz v0, :cond_15

    move v0, v1

    :goto_a
    and-int/lit8 v3, v3, 0x7f

    if-nez v0, :cond_17

    new-array v0, v5, [I

    aput v3, v0, v2

    aput v1, v0, v1

    :goto_14
    return-object v0

    :cond_15
    move v0, v2

    goto :goto_a

    :cond_17
    new-array v0, v5, [I

    shl-int/lit8 v3, v3, 0x8

    add-int/lit8 v4, p1, 0x1

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v3, v4

    aput v3, v0, v2

    aput v5, v0, v1

    goto :goto_14
.end method

.method private outputStyleTag(Ljava/lang/String;Ljava/lang/StringBuilder;Z)V
    .registers 11

    const/16 v6, 0x3b

    const/4 v2, 0x0

    const/4 v5, -0x1

    const/16 v0, 0x3c

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_10

    const/16 v0, 0x2f

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_10
    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v5, :cond_1f

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_19
    const/16 v0, 0x3e

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void

    :cond_1f
    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p3, :cond_19

    const/4 v1, 0x1

    :goto_29
    if-eqz v1, :cond_19

    const/16 v3, 0x3d

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    const/16 v3, 0x20

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v4, 0x1

    invoke-virtual {p1, v6, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    if-eq v3, v5, :cond_65

    add-int/lit8 v0, v4, 0x1

    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :goto_56
    invoke-static {v0}, Lbrut/androlib/res/xml/ResXmlEncoders;->escapeXmlChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v4, 0x22

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v0, v3

    goto :goto_29

    :cond_65
    add-int/lit8 v0, v4, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    move v1, v2

    goto :goto_56
.end method

.method public static read(Lbrut/util/ExtDataInput;)Lbrut/androlib/res/decoder/StringBlock;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const v0, 0x1c0001

    invoke-virtual {p0, v0}, Lbrut/util/ExtDataInput;->skipCheckInt(I)V

    invoke-virtual {p0}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v1

    invoke-virtual {p0}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v3

    invoke-virtual {p0}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v4

    invoke-virtual {p0}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v0

    invoke-virtual {p0}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v5

    invoke-virtual {p0}, Lbrut/util/ExtDataInput;->readInt()I

    move-result v2

    new-instance v6, Lbrut/androlib/res/decoder/StringBlock;

    invoke-direct {v6}, Lbrut/androlib/res/decoder/StringBlock;-><init>()V

    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_5f

    const/4 v0, 0x1

    :goto_28
    iput-boolean v0, v6, Lbrut/androlib/res/decoder/StringBlock;->m_isUTF8:Z

    invoke-virtual {p0, v3}, Lbrut/util/ExtDataInput;->readIntArray(I)[I

    move-result-object v0

    iput-object v0, v6, Lbrut/androlib/res/decoder/StringBlock;->m_stringOffsets:[I

    if-eqz v4, :cond_38

    invoke-virtual {p0, v4}, Lbrut/util/ExtDataInput;->readIntArray(I)[I

    move-result-object v0

    iput-object v0, v6, Lbrut/androlib/res/decoder/StringBlock;->m_styleOffsets:[I

    :cond_38
    if-nez v2, :cond_61

    move v0, v1

    :goto_3b
    sub-int/2addr v0, v5

    rem-int/lit8 v3, v0, 0x4

    if-eqz v3, :cond_63

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "String data size is not multiple of 4 ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_5f
    const/4 v0, 0x0

    goto :goto_28

    :cond_61
    move v0, v2

    goto :goto_3b

    :cond_63
    new-array v0, v0, [B

    iput-object v0, v6, Lbrut/androlib/res/decoder/StringBlock;->m_strings:[B

    iget-object v0, v6, Lbrut/androlib/res/decoder/StringBlock;->m_strings:[B

    invoke-virtual {p0, v0}, Lbrut/util/ExtDataInput;->readFully([B)V

    if-eqz v2, :cond_9b

    sub-int v0, v1, v2

    rem-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_93

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Style data size is not multiple of 4 ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_93
    div-int/lit8 v0, v0, 0x4

    invoke-virtual {p0, v0}, Lbrut/util/ExtDataInput;->readIntArray(I)[I

    move-result-object v0

    iput-object v0, v6, Lbrut/androlib/res/decoder/StringBlock;->m_styles:[I

    :cond_9b
    return-object v6
.end method


# virtual methods
.method public find(Ljava/lang/String;)I
    .registers 10

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-nez p1, :cond_6

    move v0, v2

    :goto_5
    return v0

    :cond_6
    move v0, v1

    :goto_7
    iget-object v3, p0, Lbrut/androlib/res/decoder/StringBlock;->m_stringOffsets:[I

    array-length v3, v3

    if-eq v0, v3, :cond_37

    iget-object v3, p0, Lbrut/androlib/res/decoder/StringBlock;->m_stringOffsets:[I

    aget v3, v3, v0

    iget-object v4, p0, Lbrut/androlib/res/decoder/StringBlock;->m_strings:[B

    invoke-static {v4, v3}, Lbrut/androlib/res/decoder/StringBlock;->getShort([BI)I

    move-result v5

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-eq v5, v4, :cond_1f

    :cond_1c
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_1f
    move v4, v3

    move v3, v1

    :goto_21
    if-eq v3, v5, :cond_31

    add-int/lit8 v4, v4, 0x2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v6

    iget-object v7, p0, Lbrut/androlib/res/decoder/StringBlock;->m_strings:[B

    invoke-static {v7, v4}, Lbrut/androlib/res/decoder/StringBlock;->getShort([BI)I

    move-result v7

    if-eq v6, v7, :cond_34

    :cond_31
    if-ne v3, v5, :cond_1c

    goto :goto_5

    :cond_34
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    :cond_37
    move v0, v2

    goto :goto_5
.end method

.method public get(I)Ljava/lang/CharSequence;
    .registers 3

    invoke-virtual {p0, p1}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCount()I
    .registers 2

    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_stringOffsets:[I

    if-eqz v0, :cond_8

    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_stringOffsets:[I

    array-length v0, v0

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getHTML(I)Ljava/lang/String;
    .registers 16

    const/4 v1, 0x0

    const/4 v5, -0x1

    invoke-virtual {p0, p1}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_a

    move-object v0, v6

    :goto_9
    return-object v0

    :cond_a
    invoke-direct {p0, p1}, Lbrut/androlib/res/decoder/StringBlock;->getStyle(I)[I

    move-result-object v7

    if-nez v7, :cond_15

    invoke-static {v6}, Lbrut/androlib/res/xml/ResXmlEncoders;->escapeXmlChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    :cond_15
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x20

    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    array-length v0, v7

    div-int/lit8 v0, v0, 0x3

    new-array v9, v0, [I

    move v0, v1

    move v2, v1

    :goto_27
    move v3, v1

    move v4, v5

    :goto_29
    array-length v10, v7

    if-eq v3, v10, :cond_43

    add-int/lit8 v10, v3, 0x1

    aget v10, v7, v10

    if-ne v10, v5, :cond_35

    :cond_32
    :goto_32
    add-int/lit8 v3, v3, 0x3

    goto :goto_29

    :cond_35
    if-eq v4, v5, :cond_41

    add-int/lit8 v10, v4, 0x1

    aget v10, v7, v10

    add-int/lit8 v11, v3, 0x1

    aget v11, v7, v11

    if-le v10, v11, :cond_32

    :cond_41
    move v4, v3

    goto :goto_32

    :cond_43
    if-eq v4, v5, :cond_6f

    add-int/lit8 v3, v4, 0x1

    aget v3, v7, v3

    :goto_49
    add-int/lit8 v0, v0, -0x1

    move v13, v0

    move v0, v2

    move v2, v13

    :goto_4e
    if-ltz v2, :cond_58

    aget v10, v9, v2

    add-int/lit8 v11, v10, 0x2

    aget v11, v7, v11

    if-lt v11, v3, :cond_74

    :cond_58
    add-int/lit8 v10, v2, 0x1

    if-ge v0, v3, :cond_a4

    invoke-virtual {v6, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lbrut/androlib/res/xml/ResXmlEncoders;->escapeXmlChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v2, v3

    :goto_68
    if-ne v4, v5, :cond_92

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    :cond_6f
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v3

    goto :goto_49

    :cond_74
    if-gt v0, v11, :cond_85

    add-int/lit8 v12, v11, 0x1

    invoke-virtual {v6, v0, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lbrut/androlib/res/xml/ResXmlEncoders;->escapeXmlChars(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v11, 0x1

    :cond_85
    aget v10, v7, v10

    invoke-virtual {p0, v10}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    invoke-direct {p0, v10, v8, v11}, Lbrut/androlib/res/decoder/StringBlock;->outputStyleTag(Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    add-int/lit8 v2, v2, -0x1

    goto :goto_4e

    :cond_92
    aget v0, v7, v4

    invoke-virtual {p0, v0}, Lbrut/androlib/res/decoder/StringBlock;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v8, v1}, Lbrut/androlib/res/decoder/StringBlock;->outputStyleTag(Ljava/lang/String;Ljava/lang/StringBuilder;Z)V

    add-int/lit8 v0, v4, 0x1

    aput v5, v7, v0

    add-int/lit8 v0, v10, 0x1

    aput v4, v9, v10

    goto :goto_27

    :cond_a4
    move v2, v0

    goto :goto_68
.end method

.method public getString(I)Ljava/lang/String;
    .registers 6

    const/4 v3, 0x1

    if-ltz p1, :cond_c

    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_stringOffsets:[I

    if-eqz v0, :cond_c

    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_stringOffsets:[I

    array-length v0, v0

    if-lt p1, v0, :cond_e

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return-object v0

    :cond_e
    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_stringOffsets:[I

    aget v1, v0, p1

    iget-boolean v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_isUTF8:Z

    if-nez v0, :cond_25

    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_strings:[B

    invoke-static {v0, v1}, Lbrut/androlib/res/decoder/StringBlock;->getShort([BI)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    add-int/lit8 v1, v1, 0x2

    :goto_20
    invoke-direct {p0, v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->decodeString(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_d

    :cond_25
    iget-object v0, p0, Lbrut/androlib/res/decoder/StringBlock;->m_strings:[B

    invoke-static {v0, v1}, Lbrut/androlib/res/decoder/StringBlock;->getVarint([BI)[I

    move-result-object v0

    aget v0, v0, v3

    add-int/2addr v0, v1

    iget-object v1, p0, Lbrut/androlib/res/decoder/StringBlock;->m_strings:[B

    invoke-static {v1, v0}, Lbrut/androlib/res/decoder/StringBlock;->getVarint([BI)[I

    move-result-object v2

    aget v1, v2, v3

    add-int/2addr v1, v0

    const/4 v0, 0x0

    aget v0, v2, v0

    goto :goto_20
.end method
