.class public Lorg/apache/james/mime4j/util/ContentUtil;
.super Ljava/lang/Object;
.source "ContentUtil.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    return-void
.end method

.method public static decode(Ljava/nio/charset/Charset;Lorg/apache/james/mime4j/util/ByteSequence;)Ljava/lang/String;
    .registers 4
    .param p0, "charset"    # Ljava/nio/charset/Charset;
    .param p1, "byteSequence"    # Lorg/apache/james/mime4j/util/ByteSequence;

    .prologue
    .line 102
    const/4 v0, 0x0

    invoke-interface {p1}, Lorg/apache/james/mime4j/util/ByteSequence;->length()I

    move-result v1

    invoke-static {p0, p1, v0, v1}, Lorg/apache/james/mime4j/util/ContentUtil;->decode(Ljava/nio/charset/Charset;Lorg/apache/james/mime4j/util/ByteSequence;II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Ljava/nio/charset/Charset;Lorg/apache/james/mime4j/util/ByteSequence;II)Ljava/lang/String;
    .registers 7
    .param p0, "charset"    # Ljava/nio/charset/Charset;
    .param p1, "byteSequence"    # Lorg/apache/james/mime4j/util/ByteSequence;
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 144
    if-nez p1, :cond_4

    .line 145
    const/4 v2, 0x0

    .line 155
    :goto_3
    return-object v2

    .line 147
    :cond_4
    if-nez p0, :cond_a

    .line 148
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object p0

    .line 150
    :cond_a
    instance-of v2, p1, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    if-eqz v2, :cond_1a

    move-object v0, p1

    .line 151
    check-cast v0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    .line 152
    .local v0, "bab":Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    invoke-virtual {v0}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->buffer()[B

    move-result-object v2

    invoke-static {p0, v2, p2, p3}, Lorg/apache/james/mime4j/util/ContentUtil;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 154
    .end local v0    # "bab":Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    :cond_1a
    invoke-interface {p1}, Lorg/apache/james/mime4j/util/ByteSequence;->toByteArray()[B

    move-result-object v1

    .line 155
    .local v1, "bytes":[B
    invoke-static {p0, v1, p2, p3}, Lorg/apache/james/mime4j/util/ContentUtil;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method private static decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;
    .registers 5
    .param p0, "charset"    # Ljava/nio/charset/Charset;
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 161
    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/nio/charset/Charset;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static decode(Lorg/apache/james/mime4j/util/ByteSequence;)Ljava/lang/String;
    .registers 3
    .param p0, "byteSequence"    # Lorg/apache/james/mime4j/util/ByteSequence;

    .prologue
    .line 85
    if-nez p0, :cond_4

    .line 86
    const/4 v0, 0x0

    .line 88
    :goto_3
    return-object v0

    :cond_4
    const/4 v0, 0x0

    invoke-interface {p0}, Lorg/apache/james/mime4j/util/ByteSequence;->length()I

    move-result v1

    invoke-static {p0, v0, v1}, Lorg/apache/james/mime4j/util/ContentUtil;->decode(Lorg/apache/james/mime4j/util/ByteSequence;II)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public static decode(Lorg/apache/james/mime4j/util/ByteSequence;II)Ljava/lang/String;
    .registers 6
    .param p0, "byteSequence"    # Lorg/apache/james/mime4j/util/ByteSequence;
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 118
    if-nez p0, :cond_4

    .line 119
    const/4 v2, 0x0

    .line 125
    :goto_3
    return-object v2

    .line 121
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 122
    .local v0, "buf":Ljava/lang/StringBuilder;
    move v1, p1

    .local v1, "i":I
    :goto_a
    add-int v2, p1, p2

    if-ge v1, v2, :cond_1b

    .line 123
    invoke-interface {p0, v1}, Lorg/apache/james/mime4j/util/ByteSequence;->byteAt(I)B

    move-result v2

    and-int/lit16 v2, v2, 0xff

    int-to-char v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 122
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 125
    :cond_1b
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_3
.end method

.method public static encode(Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteSequence;
    .registers 4
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    .line 43
    if-nez p0, :cond_4

    .line 44
    const/4 v0, 0x0

    .line 50
    :cond_3
    return-object v0

    .line 46
    :cond_4
    new-instance v0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v0, v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;-><init>(I)V

    .line 47
    .local v0, "buf":Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 48
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    int-to-byte v2, v2

    invoke-virtual {v0, v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append(I)V

    .line 47
    add-int/lit8 v1, v1, 0x1

    goto :goto_e
.end method

.method public static encode(Ljava/nio/charset/Charset;Ljava/lang/String;)Lorg/apache/james/mime4j/util/ByteSequence;
    .registers 7
    .param p0, "charset"    # Ljava/nio/charset/Charset;
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 64
    if-nez p1, :cond_4

    .line 65
    const/4 v0, 0x0

    .line 73
    :goto_3
    return-object v0

    .line 67
    :cond_4
    if-nez p0, :cond_a

    .line 68
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object p0

    .line 70
    :cond_a
    invoke-static {p1}, Ljava/nio/CharBuffer;->wrap(Ljava/lang/CharSequence;)Ljava/nio/CharBuffer;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/nio/charset/Charset;->encode(Ljava/nio/CharBuffer;)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 71
    .local v1, "encoded":Ljava/nio/ByteBuffer;
    new-instance v0, Lorg/apache/james/mime4j/util/ByteArrayBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-direct {v0, v2}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;-><init>(I)V

    .line 72
    .local v0, "buf":Lorg/apache/james/mime4j/util/ByteArrayBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-virtual {v0, v2, v3, v4}, Lorg/apache/james/mime4j/util/ByteArrayBuffer;->append([BII)V

    goto :goto_3
.end method
