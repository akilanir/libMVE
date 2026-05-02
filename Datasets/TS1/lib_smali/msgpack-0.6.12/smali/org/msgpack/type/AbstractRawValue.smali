.class abstract Lorg/msgpack/type/AbstractRawValue;
.super Lorg/msgpack/type/AbstractValue;
.source "AbstractRawValue.java"

# interfaces
.implements Lorg/msgpack/type/RawValue;


# static fields
.field private static final HEX_TABLE:[C

.field static final UTF8:Ljava/lang/String; = "UTF-8"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 140
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/msgpack/type/AbstractRawValue;->HEX_TABLE:[C

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/msgpack/type/AbstractValue;-><init>()V

    return-void
.end method

.method private escapeChar(Ljava/lang/StringBuilder;I)V
    .registers 5
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .param p2, "ch"    # I

    .prologue
    .line 143
    const-string v0, "\\u"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    sget-object v0, Lorg/msgpack/type/AbstractRawValue;->HEX_TABLE:[C

    shr-int/lit8 v1, p2, 0xc

    and-int/lit8 v1, v1, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 145
    sget-object v0, Lorg/msgpack/type/AbstractRawValue;->HEX_TABLE:[C

    shr-int/lit8 v1, p2, 0x8

    and-int/lit8 v1, v1, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 146
    sget-object v0, Lorg/msgpack/type/AbstractRawValue;->HEX_TABLE:[C

    shr-int/lit8 v1, p2, 0x4

    and-int/lit8 v1, v1, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 147
    sget-object v0, Lorg/msgpack/type/AbstractRawValue;->HEX_TABLE:[C

    and-int/lit8 v1, p2, 0xf

    aget-char v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 148
    return-void
.end method


# virtual methods
.method public asRawValue()Lorg/msgpack/type/RawValue;
    .registers 1

    .prologue
    .line 42
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 47
    if-ne p0, p1, :cond_5

    .line 48
    const/4 v1, 0x1

    .line 58
    :cond_4
    :goto_4
    return v1

    .line 50
    :cond_5
    instance-of v2, p1, Lorg/msgpack/type/Value;

    if-eqz v2, :cond_4

    move-object v0, p1

    .line 53
    check-cast v0, Lorg/msgpack/type/Value;

    .line 54
    .local v0, "v":Lorg/msgpack/type/Value;
    invoke-interface {v0}, Lorg/msgpack/type/Value;->isRawValue()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 58
    invoke-virtual {p0}, Lorg/msgpack/type/AbstractRawValue;->getByteArray()[B

    move-result-object v1

    invoke-interface {v0}, Lorg/msgpack/type/Value;->asRawValue()Lorg/msgpack/type/RawValue;

    move-result-object v2

    invoke-interface {v2}, Lorg/msgpack/type/RawValue;->getByteArray()[B

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_4
.end method

.method public getType()Lorg/msgpack/type/ValueType;
    .registers 2

    .prologue
    .line 32
    sget-object v0, Lorg/msgpack/type/ValueType;->RAW:Lorg/msgpack/type/ValueType;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 63
    invoke-virtual {p0}, Lorg/msgpack/type/AbstractRawValue;->getByteArray()[B

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    return v0
.end method

.method public isRawValue()Z
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Lorg/msgpack/type/AbstractRawValue;->toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/StringBuilder;)Ljava/lang/StringBuilder;
    .registers 9
    .param p1, "sb"    # Ljava/lang/StringBuilder;

    .prologue
    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const-class v6, Lorg/msgpack/type/StringRawValueImpl;

    if-ne v5, v6, :cond_29

    .line 76
    invoke-virtual {p0}, Lorg/msgpack/type/AbstractRawValue;->getString()Ljava/lang/String;

    move-result-object v4

    .line 91
    .local v4, "s":Ljava/lang/String;
    :goto_c
    const-string v5, "\""

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_12
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_a2

    .line 93
    invoke-virtual {v4, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 94
    .local v0, "ch":C
    const/16 v5, 0x20

    if-ge v0, v5, :cond_79

    .line 95
    packed-switch v0, :pswitch_data_a8

    .line 113
    :pswitch_23
    invoke-direct {p0, p1, v0}, Lorg/msgpack/type/AbstractRawValue;->escapeChar(Ljava/lang/StringBuilder;I)V

    .line 92
    :goto_26
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 80
    .end local v0    # "ch":C
    .end local v3    # "i":I
    .end local v4    # "s":Ljava/lang/String;
    :cond_29
    const-string v5, "UTF-8"

    invoke-static {v5}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v5

    sget-object v6, Ljava/nio/charset/CodingErrorAction;->IGNORE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v5, v6}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v5

    sget-object v6, Ljava/nio/charset/CodingErrorAction;->IGNORE:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v5, v6}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v1

    .line 84
    .local v1, "decoder":Ljava/nio/charset/CharsetDecoder;
    :try_start_3f
    invoke-virtual {p0}, Lorg/msgpack/type/AbstractRawValue;->getByteArray()[B

    move-result-object v5

    invoke-static {v5}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;
    :try_end_4e
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_3f .. :try_end_4e} :catch_50

    move-result-object v4

    .restart local v4    # "s":Ljava/lang/String;
    goto :goto_c

    .line 85
    .end local v4    # "s":Ljava/lang/String;
    :catch_50
    move-exception v2

    .line 87
    .local v2, "ex":Ljava/nio/charset/CharacterCodingException;
    new-instance v4, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/msgpack/type/AbstractRawValue;->getByteArray()[B

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    .restart local v4    # "s":Ljava/lang/String;
    goto :goto_c

    .line 97
    .end local v1    # "decoder":Ljava/nio/charset/CharsetDecoder;
    .end local v2    # "ex":Ljava/nio/charset/CharacterCodingException;
    .restart local v0    # "ch":C
    .restart local v3    # "i":I
    :pswitch_5b
    const-string v5, "\\n"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 100
    :pswitch_61
    const-string v5, "\\r"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 103
    :pswitch_67
    const-string v5, "\\t"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 106
    :pswitch_6d
    const-string v5, "\\f"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 109
    :pswitch_73
    const-string v5, "\\b"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 116
    :cond_79
    const/16 v5, 0x7f

    if-gt v0, v5, :cond_90

    .line 117
    sparse-switch v0, :sswitch_data_b8

    .line 125
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 119
    :sswitch_84
    const-string v5, "\\\\"

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 122
    :sswitch_8a
    const-string v5, "\\\""

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 128
    :cond_90
    const v5, 0xd800

    if-lt v0, v5, :cond_9e

    const v5, 0xdfff

    if-gt v0, v5, :cond_9e

    .line 130
    invoke-direct {p0, p1, v0}, Lorg/msgpack/type/AbstractRawValue;->escapeChar(Ljava/lang/StringBuilder;I)V

    goto :goto_26

    .line 132
    :cond_9e
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 135
    .end local v0    # "ch":C
    :cond_a2
    const-string v5, "\""

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    return-object p1

    .line 95
    :pswitch_data_a8
    .packed-switch 0x8
        :pswitch_73
        :pswitch_67
        :pswitch_5b
        :pswitch_23
        :pswitch_6d
        :pswitch_61
    .end packed-switch

    .line 117
    :sswitch_data_b8
    .sparse-switch
        0x22 -> :sswitch_8a
        0x5c -> :sswitch_84
    .end sparse-switch
.end method
