.class public Lorg/apache/commons/codec/net/QCodec;
.super Lorg/apache/commons/codec/net/RFC1522Codec;
.source "QCodec.java"

# interfaces
.implements Lorg/apache/commons/codec/StringEncoder;
.implements Lorg/apache/commons/codec/StringDecoder;


# static fields
.field private static final BLANK:B = 0x20t

.field private static final PRINTABLE_CHARS:Ljava/util/BitSet;

.field private static final UNDERSCORE:B = 0x5ft


# instance fields
.field private final charset:Ljava/nio/charset/Charset;

.field private encodeBlanks:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 61
    new-instance v1, Ljava/util/BitSet;

    const/16 v2, 0x100

    invoke-direct {v1, v2}, Ljava/util/BitSet;-><init>(I)V

    sput-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    .line 65
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 66
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x21

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 67
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x22

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 68
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x23

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 69
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x24

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 70
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x25

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 71
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x26

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 72
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 73
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x28

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 74
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x29

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 75
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 76
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x2b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 77
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x2c

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 78
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x2d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 79
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 80
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 81
    const/16 v0, 0x30

    .local v0, "i":I
    :goto_7b
    const/16 v1, 0x39

    if-gt v0, v1, :cond_87

    .line 82
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 81
    add-int/lit8 v0, v0, 0x1

    goto :goto_7b

    .line 84
    :cond_87
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 85
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x3b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 86
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x3c

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 87
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x3e

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 88
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x40

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 89
    const/16 v0, 0x41

    :goto_ac
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_b8

    .line 90
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 89
    add-int/lit8 v0, v0, 0x1

    goto :goto_ac

    .line 92
    :cond_b8
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x5b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 93
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x5c

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 94
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 95
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x5e

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 96
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x60

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 97
    const/16 v0, 0x61

    :goto_dd
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_e9

    .line 98
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    invoke-virtual {v1, v0}, Ljava/util/BitSet;->set(I)V

    .line 97
    add-int/lit8 v0, v0, 0x1

    goto :goto_dd

    .line 100
    :cond_e9
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x7b

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 101
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x7c

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 102
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x7d

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 103
    sget-object v1, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    const/16 v2, 0x7e

    invoke-virtual {v1, v2}, Ljava/util/BitSet;->set(I)V

    .line 104
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 116
    sget-object v0, Lorg/apache/commons/codec/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0}, Lorg/apache/commons/codec/net/QCodec;-><init>(Ljava/nio/charset/Charset;)V

    .line 117
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "charsetName"    # Ljava/lang/String;

    .prologue
    .line 144
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/codec/net/QCodec;-><init>(Ljava/nio/charset/Charset;)V

    .line 145
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 129
    invoke-direct {p0}, Lorg/apache/commons/codec/net/RFC1522Codec;-><init>()V

    .line 110
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/codec/net/QCodec;->encodeBlanks:Z

    .line 130
    iput-object p1, p0, Lorg/apache/commons/codec/net/QCodec;->charset:Ljava/nio/charset/Charset;

    .line 131
    return-void
.end method


# virtual methods
.method public decode(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 310
    if-nez p1, :cond_4

    .line 311
    const/4 v0, 0x0

    .line 313
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_3
    return-object v0

    .line 312
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_4
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_f

    .line 313
    check-cast p1, Ljava/lang/String;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/net/QCodec;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 315
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_f
    new-instance v0, Lorg/apache/commons/codec/DecoderException;

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

    const-string v2, " cannot be decoded using Q codec"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/codec/DecoderException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public decode(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    .line 265
    if-nez p1, :cond_4

    .line 266
    const/4 v1, 0x0

    .line 269
    :goto_3
    return-object v1

    :cond_4
    :try_start_4
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/net/QCodec;->decodeText(Ljava/lang/String;)Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_7} :catch_9

    move-result-object v1

    goto :goto_3

    .line 270
    :catch_9
    move-exception v0

    .line 271
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lorg/apache/commons/codec/DecoderException;

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/codec/DecoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected doDecoding([B)[B
    .registers 11
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/DecoderException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x5f

    .line 170
    if-nez p1, :cond_6

    .line 171
    const/4 v7, 0x0

    .line 192
    :goto_5
    return-object v7

    .line 173
    :cond_6
    const/4 v2, 0x0

    .line 174
    .local v2, "hasUnderscores":Z
    move-object v0, p1

    .local v0, "arr$":[B
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_a
    if-ge v4, v5, :cond_11

    aget-byte v1, v0, v4

    .line 175
    .local v1, "b":B
    if-ne v1, v8, :cond_23

    .line 176
    const/4 v2, 0x1

    .line 180
    .end local v1    # "b":B
    :cond_11
    if-eqz v2, :cond_30

    .line 181
    array-length v7, p1

    new-array v6, v7, [B

    .line 182
    .local v6, "tmp":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_17
    array-length v7, p1

    if-ge v3, v7, :cond_2b

    .line 183
    aget-byte v1, p1, v3

    .line 184
    .restart local v1    # "b":B
    if-eq v1, v8, :cond_26

    .line 185
    aput-byte v1, v6, v3

    .line 182
    :goto_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    .line 174
    .end local v3    # "i":I
    .end local v6    # "tmp":[B
    :cond_23
    add-int/lit8 v4, v4, 0x1

    goto :goto_a

    .line 187
    .restart local v3    # "i":I
    .restart local v6    # "tmp":[B
    :cond_26
    const/16 v7, 0x20

    aput-byte v7, v6, v3

    goto :goto_20

    .line 190
    .end local v1    # "b":B
    :cond_2b
    invoke-static {v6}, Lorg/apache/commons/codec/net/QuotedPrintableCodec;->decodeQuotedPrintable([B)[B

    move-result-object v7

    goto :goto_5

    .line 192
    .end local v3    # "i":I
    .end local v6    # "tmp":[B
    :cond_30
    invoke-static {p1}, Lorg/apache/commons/codec/net/QuotedPrintableCodec;->decodeQuotedPrintable([B)[B

    move-result-object v7

    goto :goto_5
.end method

.method protected doEncoding([B)[B
    .registers 6
    .param p1, "bytes"    # [B

    .prologue
    .line 154
    if-nez p1, :cond_4

    .line 155
    const/4 v0, 0x0

    .line 165
    :cond_3
    return-object v0

    .line 157
    :cond_4
    sget-object v2, Lorg/apache/commons/codec/net/QCodec;->PRINTABLE_CHARS:Ljava/util/BitSet;

    invoke-static {v2, p1}, Lorg/apache/commons/codec/net/QuotedPrintableCodec;->encodeQuotedPrintable(Ljava/util/BitSet;[B)[B

    move-result-object v0

    .line 158
    .local v0, "data":[B
    iget-boolean v2, p0, Lorg/apache/commons/codec/net/QCodec;->encodeBlanks:Z

    if-eqz v2, :cond_3

    .line 159
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    array-length v2, v0

    if-ge v1, v2, :cond_3

    .line 160
    aget-byte v2, v0, v1

    const/16 v3, 0x20

    if-ne v2, v3, :cond_1c

    .line 161
    const/16 v2, 0x5f

    aput-byte v2, v0, v1

    .line 159
    :cond_1c
    add-int/lit8 v1, v1, 0x1

    goto :goto_f
.end method

.method public encode(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 286
    if-nez p1, :cond_4

    .line 287
    const/4 v0, 0x0

    .line 289
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_3
    return-object v0

    .line 288
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_4
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_f

    .line 289
    check-cast p1, Ljava/lang/String;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/commons/codec/net/QCodec;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 291
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_f
    new-instance v0, Lorg/apache/commons/codec/EncoderException;

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

    const-string v2, " cannot be encoded using Q codec"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/codec/EncoderException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 247
    if-nez p1, :cond_4

    .line 248
    const/4 v0, 0x0

    .line 250
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0}, Lorg/apache/commons/codec/net/QCodec;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/codec/net/QCodec;->encode(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 226
    if-nez p1, :cond_4

    .line 227
    const/4 v1, 0x0

    .line 230
    :goto_3
    return-object v1

    :cond_4
    :try_start_4
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/codec/net/QCodec;->encodeText(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_7} :catch_9

    move-result-object v1

    goto :goto_3

    .line 231
    :catch_9
    move-exception v0

    .line 232
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lorg/apache/commons/codec/EncoderException;

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/codec/EncoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public encode(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 4
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/codec/EncoderException;
        }
    .end annotation

    .prologue
    .line 208
    if-nez p1, :cond_4

    .line 209
    const/4 v0, 0x0

    .line 211
    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/codec/net/QCodec;->encodeText(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .registers 2

    .prologue
    .line 328
    iget-object v0, p0, Lorg/apache/commons/codec/net/QCodec;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getDefaultCharset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 337
    iget-object v0, p0, Lorg/apache/commons/codec/net/QCodec;->charset:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 149
    const-string v0, "Q"

    return-object v0
.end method

.method public isEncodeBlanks()Z
    .registers 2

    .prologue
    .line 346
    iget-boolean v0, p0, Lorg/apache/commons/codec/net/QCodec;->encodeBlanks:Z

    return v0
.end method

.method public setEncodeBlanks(Z)V
    .registers 2
    .param p1, "b"    # Z

    .prologue
    .line 356
    iput-boolean p1, p0, Lorg/apache/commons/codec/net/QCodec;->encodeBlanks:Z

    .line 357
    return-void
.end method
