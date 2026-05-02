.class public Lorg/ini4j/spi/RegEscapeTool;
.super Lorg/ini4j/spi/EscapeTool;
.source "RegEscapeTool.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/ini4j/spi/RegEscapeTool$1;
    }
.end annotation


# static fields
.field private static final DIGIT_SIZE:I = 0x4

.field private static final HEX_CHARSET:Ljava/nio/charset/Charset;

.field private static final INSTANCE:Lorg/ini4j/spi/RegEscapeTool;

.field private static final LOWER_DIGIT:I = 0xf

.field private static final UPPER_DIGIT:I = 0xf0


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 30
    const-class v0, Lorg/ini4j/spi/RegEscapeTool;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/RegEscapeTool;

    sput-object v0, Lorg/ini4j/spi/RegEscapeTool;->INSTANCE:Lorg/ini4j/spi/RegEscapeTool;

    .line 31
    const-string v0, "UTF-16LE"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/ini4j/spi/EscapeTool;-><init>()V

    .line 63
    return-void
.end method

.method private bytes2string([B)Ljava/lang/String;
    .registers 8
    .param p1, "bytes"    # [B

    .prologue
    .line 212
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const/4 v3, 0x0

    array-length v4, p1

    add-int/lit8 v4, v4, -0x2

    sget-object v5, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {v1, p1, v3, v4, v5}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V
    :try_end_b
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_b} :catch_c

    .line 226
    .local v1, "str":Ljava/lang/String;
    :goto_b
    return-object v1

    .line 214
    .end local v1    # "str":Ljava/lang/String;
    :catch_c
    move-exception v2

    .line 218
    .local v2, "x":Ljava/lang/NoSuchMethodError;
    :try_start_d
    new-instance v1, Ljava/lang/String;

    const/4 v3, 0x0

    array-length v4, p1

    sget-object v5, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v5}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, p1, v3, v4, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_1a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_d .. :try_end_1a} :catch_1b

    .restart local v1    # "str":Ljava/lang/String;
    goto :goto_b

    .line 220
    .end local v1    # "str":Ljava/lang/String;
    :catch_1b
    move-exception v0

    .line 222
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public static final getInstance()Lorg/ini4j/spi/RegEscapeTool;
    .registers 1

    .prologue
    .line 38
    sget-object v0, Lorg/ini4j/spi/RegEscapeTool;->INSTANCE:Lorg/ini4j/spi/RegEscapeTool;

    return-object v0
.end method

.method private splitMulti(Ljava/lang/String;)[Ljava/lang/String;
    .registers 10
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 231
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 234
    .local v2, "len":I
    const/4 v3, 0x0

    .line 236
    .local v3, "n":I
    const/4 v4, 0x0

    .line 237
    .local v4, "start":I
    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .local v0, "end":I
    :goto_b
    if-ltz v0, :cond_13

    .line 239
    add-int/lit8 v3, v3, 0x1

    .line 240
    add-int/lit8 v4, v0, 0x1

    .line 241
    if-lt v4, v2, :cond_28

    .line 247
    :cond_13
    new-array v5, v3, [Ljava/lang/String;

    .line 249
    .local v5, "values":[Ljava/lang/String;
    const/4 v4, 0x0

    .line 250
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_17
    if-ge v1, v3, :cond_2d

    .line 252
    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 253
    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    .line 254
    add-int/lit8 v4, v0, 0x1

    .line 250
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 237
    .end local v1    # "i":I
    .end local v5    # "values":[Ljava/lang/String;
    :cond_28
    invoke-virtual {p1, v7, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    goto :goto_b

    .line 257
    .restart local v1    # "i":I
    .restart local v5    # "values":[Ljava/lang/String;
    :cond_2d
    return-object v5
.end method

.method private string2bytes(Ljava/lang/String;)[B
    .registers 6
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 267
    :try_start_0
    sget-object v3, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B
    :try_end_5
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v0

    .line 281
    .local v0, "bytes":[B
    :goto_6
    return-object v0

    .line 269
    .end local v0    # "bytes":[B
    :catch_7
    move-exception v2

    .line 273
    .local v2, "x":Ljava/lang/NoSuchMethodError;
    :try_start_8
    sget-object v3, Lorg/ini4j/spi/RegEscapeTool;->HEX_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v3}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_11
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_8 .. :try_end_11} :catch_13

    move-result-object v0

    .restart local v0    # "bytes":[B
    goto :goto_6

    .line 275
    .end local v0    # "bytes":[B
    :catch_13
    move-exception v1

    .line 277
    .local v1, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method binary(Ljava/lang/String;)[B
    .registers 10
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 96
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    new-array v0, v6, [B

    .line 97
    .local v0, "bytes":[B
    const/4 v4, 0x0

    .line 98
    .local v4, "idx":I
    const/4 v5, 0x4

    .line 100
    .local v5, "shift":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_9
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v3, v6, :cond_36

    .line 102
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 104
    .local v1, "c":C
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v6

    if-eqz v6, :cond_1c

    .line 100
    :cond_19
    :goto_19
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 109
    :cond_1c
    const/16 v6, 0x2c

    if-ne v1, v6, :cond_24

    .line 111
    add-int/lit8 v4, v4, 0x1

    .line 112
    const/4 v5, 0x4

    goto :goto_19

    .line 116
    :cond_24
    const/16 v6, 0x10

    invoke-static {v1, v6}, Ljava/lang/Character;->digit(CI)I

    move-result v2

    .line 118
    .local v2, "digit":I
    if-ltz v2, :cond_19

    .line 120
    aget-byte v6, v0, v4

    shl-int v7, v2, v5

    or-int/2addr v6, v7

    int-to-byte v6, v6

    aput-byte v6, v0, v4

    .line 121
    const/4 v5, 0x0

    goto :goto_19

    .line 126
    .end local v1    # "c":C
    .end local v2    # "digit":I
    :cond_36
    const/4 v6, 0x0

    add-int/lit8 v7, v4, 0x1

    invoke-static {v0, v6, v7}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v6

    return-object v6
.end method

.method public decode(Ljava/lang/String;)Lorg/ini4j/spi/TypeValuesPair;
    .registers 7
    .param p1, "raw"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-virtual {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->type(Ljava/lang/String;)Lorg/ini4j/Registry$Type;

    move-result-object v0

    .line 44
    .local v0, "type":Lorg/ini4j/Registry$Type;
    sget-object v3, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    if-ne v0, v3, :cond_25

    invoke-virtual {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 47
    .local v1, "value":Ljava/lang/String;
    :goto_c
    sget-object v3, Lorg/ini4j/spi/RegEscapeTool$1;->$SwitchMap$org$ini4j$Registry$Type:[I

    invoke-virtual {v0}, Lorg/ini4j/Registry$Type;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_50

    .line 66
    :goto_17
    :pswitch_17
    sget-object v3, Lorg/ini4j/Registry$Type;->REG_MULTI_SZ:Lorg/ini4j/Registry$Type;

    if-ne v0, v3, :cond_48

    .line 68
    invoke-direct {p0, v1}, Lorg/ini4j/spi/RegEscapeTool;->splitMulti(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "values":[Ljava/lang/String;
    :goto_1f
    new-instance v3, Lorg/ini4j/spi/TypeValuesPair;

    invoke-direct {v3, v0, v2}, Lorg/ini4j/spi/TypeValuesPair;-><init>(Lorg/ini4j/Registry$Type;[Ljava/lang/String;)V

    return-object v3

    .line 44
    .end local v1    # "value":Ljava/lang/String;
    .end local v2    # "values":[Ljava/lang/String;
    :cond_25
    invoke-virtual {v0}, Lorg/ini4j/Registry$Type;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    .line 52
    .restart local v1    # "value":Ljava/lang/String;
    :pswitch_34
    invoke-virtual {p0, v1}, Lorg/ini4j/spi/RegEscapeTool;->binary(Ljava/lang/String;)[B

    move-result-object v3

    invoke-direct {p0, v3}, Lorg/ini4j/spi/RegEscapeTool;->bytes2string([B)Ljava/lang/String;

    move-result-object v1

    .line 53
    goto :goto_17

    .line 56
    :pswitch_3d
    const/16 v3, 0x10

    invoke-static {v1, v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    .line 57
    goto :goto_17

    .line 72
    :cond_48
    const/4 v3, 0x1

    new-array v2, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    .restart local v2    # "values":[Ljava/lang/String;
    goto :goto_1f

    .line 47
    nop

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_34
        :pswitch_34
        :pswitch_3d
        :pswitch_17
    .end packed-switch
.end method

.method encode(Lorg/ini4j/Registry$Type;[Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p1, "type"    # Lorg/ini4j/Registry$Type;
    .param p2, "values"    # [Ljava/lang/String;

    .prologue
    const/4 v7, 0x0

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .local v0, "buff":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Lorg/ini4j/Registry$Type;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    const/16 v3, 0x3a

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 135
    sget-object v3, Lorg/ini4j/spi/RegEscapeTool$1;->$SwitchMap$org$ini4j$Registry$Type:[I

    invoke-virtual {p1}, Lorg/ini4j/Registry$Type;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_66

    .line 159
    aget-object v3, p2, v7

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    :goto_22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 139
    :pswitch_27
    aget-object v3, p2, v7

    invoke-virtual {p0, v3}, Lorg/ini4j/spi/RegEscapeTool;->hexadecimal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 143
    :pswitch_31
    const-string v3, "%08x"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    aget-object v5, p2, v7

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 147
    :pswitch_4a
    array-length v2, p2

    .line 149
    .local v2, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4c
    if-ge v1, v2, :cond_5f

    .line 151
    aget-object v3, p2, v1

    invoke-virtual {p0, v3}, Lorg/ini4j/spi/RegEscapeTool;->hexadecimal(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    const/16 v3, 0x2c

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 149
    add-int/lit8 v1, v1, 0x1

    goto :goto_4c

    .line 155
    :cond_5f
    const-string v3, "00,00"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 135
    nop

    :pswitch_data_66
    .packed-switch 0x1
        :pswitch_27
        :pswitch_4a
        :pswitch_31
    .end packed-switch
.end method

.method public encode(Lorg/ini4j/spi/TypeValuesPair;)Ljava/lang/String;
    .registers 6
    .param p1, "data"    # Lorg/ini4j/spi/TypeValuesPair;

    .prologue
    const/4 v3, 0x0

    .line 80
    const/4 v0, 0x0

    .line 82
    .local v0, "ret":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getType()Lorg/ini4j/Registry$Type;

    move-result-object v1

    sget-object v2, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    if-ne v1, v2, :cond_15

    .line 84
    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getValues()[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v3

    invoke-virtual {p0, v1}, Lorg/ini4j/spi/RegEscapeTool;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 91
    :cond_14
    :goto_14
    return-object v0

    .line 86
    :cond_15
    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getValues()[Ljava/lang/String;

    move-result-object v1

    aget-object v1, v1, v3

    if-eqz v1, :cond_14

    .line 88
    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getType()Lorg/ini4j/Registry$Type;

    move-result-object v1

    invoke-virtual {p1}, Lorg/ini4j/spi/TypeValuesPair;->getValues()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/ini4j/spi/RegEscapeTool;->encode(Lorg/ini4j/Registry$Type;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_14
.end method

.method hexadecimal(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x10

    .line 168
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 170
    .local v0, "buff":Ljava/lang/StringBuilder;
    if-eqz p1, :cond_3c

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_3c

    .line 172
    invoke-direct {p0, p1}, Lorg/ini4j/spi/RegEscapeTool;->string2bytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 174
    .local v1, "bytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_14
    array-length v3, v1

    if-ge v2, v3, :cond_37

    .line 176
    aget-byte v3, v1, v2

    and-int/lit16 v3, v3, 0xf0

    shr-int/lit8 v3, v3, 0x4

    invoke-static {v3, v4}, Ljava/lang/Character;->forDigit(II)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 177
    aget-byte v3, v1, v2

    and-int/lit8 v3, v3, 0xf

    invoke-static {v3, v4}, Ljava/lang/Character;->forDigit(II)C

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 178
    const/16 v3, 0x2c

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 174
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 181
    :cond_37
    const-string v3, "00,00"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .end local v1    # "bytes":[B
    .end local v2    # "i":I
    :cond_3c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method type(Ljava/lang/String;)Lorg/ini4j/Registry$Type;
    .registers 7
    .param p1, "raw"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 191
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x22

    if-ne v2, v3, :cond_c

    .line 193
    sget-object v1, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    .line 202
    .local v1, "type":Lorg/ini4j/Registry$Type;
    :goto_b
    return-object v1

    .line 197
    .end local v1    # "type":Lorg/ini4j/Registry$Type;
    :cond_c
    const/16 v2, 0x3a

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 199
    .local v0, "idx":I
    if-gez v0, :cond_17

    sget-object v1, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    .restart local v1    # "type":Lorg/ini4j/Registry$Type;
    :goto_16
    goto :goto_b

    .end local v1    # "type":Lorg/ini4j/Registry$Type;
    :cond_17
    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/ini4j/Registry$Type;->fromString(Ljava/lang/String;)Lorg/ini4j/Registry$Type;

    move-result-object v1

    goto :goto_16
.end method
