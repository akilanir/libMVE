.class public Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;
.super Ljava/lang/Object;
.source "QuotedPrintableCodec.java"

# interfaces
.implements Lezvcard/util/org/apache/commons/codec/BinaryEncoder;
.implements Lezvcard/util/org/apache/commons/codec/BinaryDecoder;
.implements Lezvcard/util/org/apache/commons/codec/StringEncoder;
.implements Lezvcard/util/org/apache/commons/codec/StringDecoder;


# static fields
.field private static final ESCAPE_CHAR:B = 0x3dt

.field private static final PRINTABLE_CHARS:Ljava/util/BitSet;

.field private static final SPACE:B = 0x20t

.field private static final TAB:B = 0x9t


# instance fields
.field private final charset:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 72
    new-instance v1, Ljava/util/BitSet;

    const/16 v2, 0x100

    invoke-direct {v1, v2}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    .line 82
    const/16 v0, 0x21

    .local v0, "i":I
    :goto_b
    const/16 v1, 0x3c

    if-gt v0, v1, :cond_17

    .line 83
    sget-object v1, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 82
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 85
    :cond_17
    const/16 v0, 0x3e

    :goto_19
    const/16 v1, 0x7e

    if-gt v0, v1, :cond_25

    .line 86
    sget-object v1, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 85
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 88
    :cond_25
    sget-object v1, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 89
    sget-object v1, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 90
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 96
    const-string v0, "UTF-8"

    invoke-direct {p0, v0}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;-><init>(Ljava/lang/String;)V

    .line 97
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "charset"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    iput-object p1, p0, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->charset:Ljava/lang/String;

    .line 108
    return-void
.end method

.method public static final decodeQuotedPrintable([B)[B
    .registers 9
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/util/org/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 178
    if-nez p0, :cond_4

    .line 179
    const/4 v6, 0x0

    .line 196
    :goto_3
    return-object v6

    .line 181
    :cond_4
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 182
    .local v1, "buffer":Ljava/io/ByteArrayOutputStream;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_a
    array-length v6, p0

    if-ge v3, v6, :cond_3a

    .line 183
    aget-byte v0, p0, v3

    .line 184
    .local v0, "b":I
    const/16 v6, 0x3d

    if-ne v0, v6, :cond_36

    .line 186
    add-int/lit8 v3, v3, 0x1

    :try_start_15
    aget-byte v6, p0, v3

    invoke-static {v6}, Lezvcard/util/org/apache/commons/codec/net/Utils;->digit16(B)I

    move-result v5

    .line 187
    .local v5, "u":I
    add-int/lit8 v3, v3, 0x1

    aget-byte v6, p0, v3

    invoke-static {v6}, Lezvcard/util/org/apache/commons/codec/net/Utils;->digit16(B)I

    move-result v4

    .line 188
    .local v4, "l":I
    shl-int/lit8 v6, v5, 0x4

    add-int/2addr v6, v4

    int-to-char v6, v6

    invoke-virtual {v1, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_2a
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_15 .. :try_end_2a} :catch_2d

    .line 182
    .end local v4    # "l":I
    .end local v5    # "u":I
    :goto_2a
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    .line 189
    :catch_2d
    move-exception v2

    .line 190
    .local v2, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    new-instance v6, Lezvcard/util/org/apache/commons/codec/DecoderException;

    const-string v7, "Invalid quoted-printable encoding"

    invoke-direct {v6, v7, v2}, Lezvcard/util/org/apache/commons/codec/DecoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 193
    .end local v2    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_36
    invoke-virtual {v1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_2a

    .line 196
    .end local v0    # "b":I
    :cond_3a
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    goto :goto_3
.end method

.method private static final encodeQuotedPrintable(ILjava/io/ByteArrayOutputStream;)V
    .registers 6
    .param p0, "b"    # I
    .param p1, "buffer"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    const/16 v3, 0x10

    .line 119
    const/16 v2, 0x3d

    invoke-virtual {p1, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 120
    shr-int/lit8 v2, p0, 0x4

    and-int/lit8 v2, v2, 0xf

    invoke-static {v2, v3}, Ljava/lang/Character;->forDigit(II)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v0

    .line 121
    .local v0, "hex1":C
    and-int/lit8 v2, p0, 0xf

    invoke-static {v2, v3}, Ljava/lang/Character;->forDigit(II)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v1

    .line 122
    .local v1, "hex2":C
    invoke-virtual {p1, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 123
    invoke-virtual {p1, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 124
    return-void
.end method

.method public static final encodeQuotedPrintable(Ljava/util/BitSet;[B)[B
    .registers 9
    .param p0, "printable"    # Ljava/util/BitSet;
    .param p1, "bytes"    # [B

    .prologue
    .line 141
    if-nez p1, :cond_4

    .line 142
    const/4 v6, 0x0

    .line 159
    :goto_3
    return-object v6

    .line 144
    :cond_4
    if-nez p0, :cond_8

    .line 145
    sget-object p0, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    .line 147
    :cond_8
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 148
    .local v2, "buffer":Ljava/io/ByteArrayOutputStream;
    move-object v0, p1

    .local v0, "arr$":[B
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_10
    if-ge v4, v5, :cond_29

    aget-byte v3, v0, v4

    .line 149
    .local v3, "c":B
    move v1, v3

    .line 150
    .local v1, "b":I
    if-gez v1, :cond_19

    .line 151
    add-int/lit16 v1, v1, 0x100

    .line 153
    :cond_19
    invoke-virtual {p0, v1}, Ljava/util/BitSet;->get(I)Z

    move-result v6

    if-eqz v6, :cond_25

    .line 154
    invoke-virtual {v2, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 148
    :goto_22
    add-int/lit8 v4, v4, 0x1

    goto :goto_10

    .line 156
    :cond_25
    invoke-static {v1, v2}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->encodeQuotedPrintable(ILjava/io/ByteArrayOutputStream;)V

    goto :goto_22

    .line 159
    .end local v1    # "b":I
    .end local v3    # "c":B
    :cond_29
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    goto :goto_3
.end method


# virtual methods
.method public decode(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "pObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/util/org/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 342
    if-nez p1, :cond_4

    .line 343
    const/4 v0, 0x0

    .line 347
    .end local p1    # "pObject":Ljava/lang/Object;
    :goto_3
    return-object v0

    .line 344
    .restart local p1    # "pObject":Ljava/lang/Object;
    :cond_4
    instance-of v0, p1, [B

    if-eqz v0, :cond_11

    .line 345
    check-cast p1, [B

    .end local p1    # "pObject":Ljava/lang/Object;
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->decode([B)[B

    move-result-object v0

    goto :goto_3

    .line 346
    .restart local p1    # "pObject":Ljava/lang/Object;
    :cond_11
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_1c

    .line 347
    check-cast p1, Ljava/lang/String;

    .end local p1    # "pObject":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 349
    .restart local p1    # "pObject":Ljava/lang/Object;
    :cond_1c
    new-instance v0, Lezvcard/util/org/apache/commons/codec/DecoderException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Objects of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " cannot be quoted-printable decoded"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/util/org/apache/commons/codec/DecoderException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public decode(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "pString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/util/org/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 296
    if-nez p1, :cond_4

    .line 297
    const/4 v1, 0x0

    .line 300
    :goto_3
    return-object v1

    :cond_4
    :try_start_4
    invoke-virtual {p0}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->getDefaultCharset()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_b} :catch_d

    move-result-object v1

    goto :goto_3

    .line 301
    :catch_d
    move-exception v0

    .line 302
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lezvcard/util/org/apache/commons/codec/DecoderException;

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lezvcard/util/org/apache/commons/codec/DecoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "pString"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/util/org/apache/commons/codec/DecoderException;,
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 277
    if-nez p1, :cond_4

    .line 278
    const/4 v0, 0x0

    .line 280
    :goto_3
    return-object v0

    :cond_4
    new-instance v0, Ljava/lang/String;

    invoke-static {p1}, Lezvcard/util/org/apache/commons/codec/binary/StringUtils;->getBytesUsAscii(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p0, v1}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->decode([B)[B

    move-result-object v1

    invoke-direct {v0, v1, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    goto :goto_3
.end method

.method public decode([B)[B
    .registers 3
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/util/org/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 231
    invoke-static {p1}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->decodeQuotedPrintable([B)[B

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "pObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/util/org/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 317
    if-nez p1, :cond_4

    .line 318
    const/4 v0, 0x0

    .line 322
    .end local p1    # "pObject":Ljava/lang/Object;
    :goto_3
    return-object v0

    .line 319
    .restart local p1    # "pObject":Ljava/lang/Object;
    :cond_4
    instance-of v0, p1, [B

    if-eqz v0, :cond_11

    .line 320
    check-cast p1, [B

    .end local p1    # "pObject":Ljava/lang/Object;
    check-cast p1, [B

    invoke-virtual {p0, p1}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->encode([B)[B

    move-result-object v0

    goto :goto_3

    .line 321
    .restart local p1    # "pObject":Ljava/lang/Object;
    :cond_11
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_1c

    .line 322
    check-cast p1, Ljava/lang/String;

    .end local p1    # "pObject":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 324
    .restart local p1    # "pObject":Ljava/lang/Object;
    :cond_1c
    new-instance v0, Lezvcard/util/org/apache/commons/codec/EncoderException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Objects of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " cannot be quoted-printable encoded"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lezvcard/util/org/apache/commons/codec/EncoderException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "pString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lezvcard/util/org/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 252
    if-nez p1, :cond_4

    .line 253
    const/4 v1, 0x0

    .line 256
    :goto_3
    return-object v1

    :cond_4
    :try_start_4
    invoke-virtual {p0}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->getDefaultCharset()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_b} :catch_d

    move-result-object v1

    goto :goto_3

    .line 257
    :catch_d
    move-exception v0

    .line 258
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lezvcard/util/org/apache/commons/codec/EncoderException;

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lezvcard/util/org/apache/commons/codec/EncoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "pString"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 382
    if-nez p1, :cond_4

    .line 383
    const/4 v0, 0x0

    .line 385
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->encode([B)[B

    move-result-object v0

    invoke-static {v0}, Lezvcard/util/org/apache/commons/codec/binary/StringUtils;->newStringUsAscii([B)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public encode([B)[B
    .registers 3
    .param p1, "bytes"    # [B

    .prologue
    .line 212
    sget-object v0, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    invoke-static {v0, p1}, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->encodeQuotedPrintable(Ljava/util/BitSet;[B)[B

    move-result-object v0

    return-object v0
.end method

.method public getDefaultCharset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 361
    iget-object v0, p0, Lezvcard/util/org/apache/commons/codec/net/QuotedPrintableCodec;->charset:Ljava/lang/String;

    return-object v0
.end method
