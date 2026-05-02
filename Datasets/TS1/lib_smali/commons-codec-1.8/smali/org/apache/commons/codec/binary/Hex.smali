.class public Lorg/apache/commons/codec/binary/Hex;
.super Ljava/lang/Object;
.source "Hex.java"

# interfaces
.implements Lorg/apache/commons/codec/BinaryEncoder;
.implements Lorg/apache/commons/codec/BinaryDecoder;


# static fields
.field public static final DEFAULT_CHARSET:Ljava/nio/charset/Charset;

.field public static final DEFAULT_CHARSET_NAME:Ljava/lang/String; = "UTF-8"

.field private static final DIGITS_LOWER:[C

.field private static final DIGITS_UPPER:[C


# instance fields
.field private final charset:Ljava/nio/charset/Charset;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/16 v1, 0x10

    .line 45
    sget-object v0, Lorg/apache/commons/codec/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    sput-object v0, Lorg/apache/commons/codec/binary/Hex;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    .line 57
    new-array v0, v1, [C

    fill-array-data v0, :array_16

    sput-object v0, Lorg/apache/commons/codec/binary/Hex;->DIGITS_LOWER:[C

    .line 63
    new-array v0, v1, [C

    fill-array-data v0, :array_2a

    sput-object v0, Lorg/apache/commons/codec/binary/Hex;->DIGITS_UPPER:[C

    return-void

    .line 57
    nop

    :array_16
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data

    .line 63
    :array_2a
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 190
    sget-object v0, Lorg/apache/commons/codec/binary/Hex;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lorg/apache/commons/codec/binary/Hex;->charset:Ljava/nio/charset/Charset;

    .line 191
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "charsetName"    # Ljava/lang/String;

    .prologue
    .line 215
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/codec/binary/Hex;-><init>(Ljava/nio/charset/Charset;)V

    .line 216
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .registers 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 200
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    iput-object p1, p0, Lorg/apache/commons/codec/binary/Hex;->charset:Ljava/nio/charset/Charset;

    .line 202
    return-void
.end method

.method public static decodeHex([C)[B
    .registers 8
    .param p0, "data"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 79
    array-length v3, p0

    .line 81
    .local v3, "len":I
    and-int/lit8 v5, v3, 0x1

    if-eqz v5, :cond_d

    .line 82
    new-instance v5, Lorg/apache/commons/codec/DecoderException;

    const-string v6, "Odd number of characters."

    invoke-direct {v5, v6}, Lorg/apache/commons/codec/DecoderException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 85
    :cond_d
    shr-int/lit8 v5, v3, 0x1

    new-array v4, v5, [B

    .line 88
    .local v4, "out":[B
    const/4 v1, 0x0

    .local v1, "i":I
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_13
    if-ge v2, v3, :cond_30

    .line 89
    aget-char v5, p0, v2

    invoke-static {v5, v2}, Lorg/apache/commons/codec/binary/Hex;->toDigit(CI)I

    move-result v5

    shl-int/lit8 v0, v5, 0x4

    .line 90
    .local v0, "f":I
    add-int/lit8 v2, v2, 0x1

    .line 91
    aget-char v5, p0, v2

    invoke-static {v5, v2}, Lorg/apache/commons/codec/binary/Hex;->toDigit(CI)I

    move-result v5

    or-int/2addr v0, v5

    .line 92
    add-int/lit8 v2, v2, 0x1

    .line 93
    and-int/lit16 v5, v0, 0xff

    int-to-byte v5, v5

    aput-byte v5, v4, v1

    .line 88
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 96
    .end local v0    # "f":I
    :cond_30
    return-object v4
.end method

.method public static encodeHex([B)[C
    .registers 2
    .param p0, "data"    # [B

    .prologue
    .line 109
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/apache/commons/codec/binary/Hex;->encodeHex([BZ)[C

    move-result-object v0

    return-object v0
.end method

.method public static encodeHex([BZ)[C
    .registers 3
    .param p0, "data"    # [B
    .param p1, "toLowerCase"    # Z

    .prologue
    .line 125
    if-eqz p1, :cond_9

    sget-object v0, Lorg/apache/commons/codec/binary/Hex;->DIGITS_LOWER:[C

    :goto_4
    invoke-static {p0, v0}, Lorg/apache/commons/codec/binary/Hex;->encodeHex([B[C)[C

    move-result-object v0

    return-object v0

    :cond_9
    sget-object v0, Lorg/apache/commons/codec/binary/Hex;->DIGITS_UPPER:[C

    goto :goto_4
.end method

.method protected static encodeHex([B[C)[C
    .registers 8
    .param p0, "data"    # [B
    .param p1, "toDigits"    # [C

    .prologue
    .line 141
    array-length v3, p0

    .line 142
    .local v3, "l":I
    shl-int/lit8 v5, v3, 0x1

    new-array v4, v5, [C

    .line 144
    .local v4, "out":[C
    const/4 v0, 0x0

    .local v0, "i":I
    const/4 v1, 0x0

    .local v1, "j":I
    move v2, v1

    .end local v1    # "j":I
    .local v2, "j":I
    :goto_8
    if-ge v0, v3, :cond_23

    .line 145
    add-int/lit8 v1, v2, 0x1

    .end local v2    # "j":I
    .restart local v1    # "j":I
    aget-byte v5, p0, v0

    and-int/lit16 v5, v5, 0xf0

    ushr-int/lit8 v5, v5, 0x4

    aget-char v5, p1, v5

    aput-char v5, v4, v2

    .line 146
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "j":I
    .restart local v2    # "j":I
    aget-byte v5, p0, v0

    and-int/lit8 v5, v5, 0xf

    aget-char v5, p1, v5

    aput-char v5, v4, v1

    .line 144
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 148
    :cond_23
    return-object v4
.end method

.method public static encodeHexString([B)Ljava/lang/String;
    .registers 3
    .param p0, "data"    # [B

    .prologue
    .line 161
    new-instance v0, Ljava/lang/String;

    invoke-static {p0}, Lorg/apache/commons/codec/binary/Hex;->encodeHex([B)[C

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([C)V

    return-object v0
.end method

.method protected static toDigit(CI)I
    .registers 6
    .param p0, "ch"    # C
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 176
    const/16 v1, 0x10

    invoke-static {p0, v1}, Ljava/lang/Character;->digit(CI)I

    move-result v0

    .line 177
    .local v0, "digit":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_2c

    .line 178
    new-instance v1, Lorg/apache/commons/codec/DecoderException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Illegal hexadecimal character "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " at index "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/codec/DecoderException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 180
    :cond_2c
    return v0
.end method


# virtual methods
.method public decode(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 251
    :try_start_0
    instance-of v2, p1, Ljava/lang/String;

    if-eqz v2, :cond_f

    check-cast p1, Ljava/lang/String;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 252
    .local v0, "charArray":[C
    :goto_a
    invoke-static {v0}, Lorg/apache/commons/codec/binary/Hex;->decodeHex([C)[B

    move-result-object v2

    return-object v2

    .line 251
    .end local v0    # "charArray":[C
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_f
    check-cast p1, [C

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [C
    :try_end_13
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_13} :catch_15

    move-object v0, p1

    goto :goto_a

    .line 253
    :catch_15
    move-exception v1

    .line 254
    .local v1, "e":Ljava/lang/ClassCastException;
    new-instance v2, Lorg/apache/commons/codec/DecoderException;

    invoke-virtual {v1}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/codec/DecoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public decode([B)[B
    .registers 4
    .param p1, "array"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 232
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/commons/codec/binary/Hex;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/codec/binary/Hex;->decodeHex([C)[B

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 297
    :try_start_0
    instance-of v2, p1, Ljava/lang/String;

    if-eqz v2, :cond_13

    check-cast p1, Ljava/lang/String;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/apache/commons/codec/binary/Hex;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 299
    .local v0, "byteArray":[B
    :goto_e
    invoke-static {v0}, Lorg/apache/commons/codec/binary/Hex;->encodeHex([B)[C

    move-result-object v2

    return-object v2

    .line 297
    .end local v0    # "byteArray":[B
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_13
    check-cast p1, [B

    .end local p1    # "object":Ljava/lang/Object;
    check-cast p1, [B
    :try_end_17
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_17} :catch_19

    move-object v0, p1

    goto :goto_e

    .line 300
    :catch_19
    move-exception v1

    .line 301
    .local v1, "e":Ljava/lang/ClassCastException;
    new-instance v2, Lorg/apache/commons/codec/EncoderException;

    invoke-virtual {v1}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/apache/commons/codec/EncoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public encode([B)[B
    .registers 4
    .param p1, "array"    # [B

    .prologue
    .line 275
    invoke-static {p1}, Lorg/apache/commons/codec/binary/Hex;->encodeHexString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/codec/binary/Hex;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    return-object v0
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 312
    iget-object v0, p0, Lorg/apache/commons/codec/binary/Hex;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getCharsetName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 322
    iget-object v0, p0, Lorg/apache/commons/codec/binary/Hex;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 332
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "[charsetName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/codec/binary/Hex;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
