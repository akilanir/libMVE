.class public Lcom/fasterxml/jackson/core/io/SerializedString;
.super Ljava/lang/Object;
.source "SerializedString.java"

# interfaces
.implements Lcom/fasterxml/jackson/core/SerializableString;
.implements Ljava/io/Serializable;


# instance fields
.field protected transient _jdkSerializeValue:Ljava/lang/String;

.field protected _quotedChars:[C

.field protected _quotedUTF8Ref:[B

.field protected _unquotedUTF8Ref:[B

.field protected final _value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    if-nez p1, :cond_d

    .line 48
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Null String illegal for SerializedString"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_d
    iput-object p1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    .line 51
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_jdkSerializeValue:Ljava/lang/String;

    .line 69
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 73
    return-void
.end method


# virtual methods
.method public appendQuoted([CI)I
    .registers 7

    .prologue
    .line 160
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedChars:[C

    .line 161
    if-nez v0, :cond_10

    .line 162
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->quoteAsString(Ljava/lang/String;)[C

    move-result-object v0

    .line 163
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedChars:[C

    .line 165
    :cond_10
    array-length v1, v0

    .line 166
    add-int v2, p2, v1

    array-length v3, p1

    if-le v2, v3, :cond_18

    .line 167
    const/4 v0, -0x1

    .line 170
    :goto_17
    return v0

    .line 169
    :cond_18
    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v0, v1

    .line 170
    goto :goto_17
.end method

.method public appendQuotedUTF8([BI)I
    .registers 7

    .prologue
    .line 144
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 145
    if-nez v0, :cond_10

    .line 146
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->quoteAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 147
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 149
    :cond_10
    array-length v1, v0

    .line 150
    add-int v2, p2, v1

    array-length v3, p1

    if-le v2, v3, :cond_18

    .line 151
    const/4 v0, -0x1

    .line 154
    :goto_17
    return v0

    .line 153
    :cond_18
    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v0, v1

    .line 154
    goto :goto_17
.end method

.method public appendUnquoted([CI)I
    .registers 7

    .prologue
    .line 192
    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    .line 193
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 194
    add-int v2, p2, v0

    array-length v3, p1

    if-le v2, v3, :cond_d

    .line 195
    const/4 v0, -0x1

    .line 198
    :goto_c
    return v0

    .line 197
    :cond_d
    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0, p1, p2}, Ljava/lang/String;->getChars(II[CI)V

    goto :goto_c
.end method

.method public appendUnquotedUTF8([BI)I
    .registers 7

    .prologue
    .line 176
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 177
    if-nez v0, :cond_10

    .line 178
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->encodeAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 179
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 181
    :cond_10
    array-length v1, v0

    .line 182
    add-int v2, p2, v1

    array-length v3, p1

    if-le v2, v3, :cond_18

    .line 183
    const/4 v0, -0x1

    .line 186
    :goto_17
    return v0

    .line 185
    :cond_18
    const/4 v2, 0x0

    invoke-static {v0, v2, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v0, v1

    .line 186
    goto :goto_17
.end method

.method public final asQuotedChars()[C
    .registers 3

    .prologue
    .line 97
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedChars:[C

    .line 98
    if-nez v0, :cond_10

    .line 99
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->quoteAsString(Ljava/lang/String;)[C

    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedChars:[C

    .line 102
    :cond_10
    return-object v0
.end method

.method public final asQuotedUTF8()[B
    .registers 3

    .prologue
    .line 127
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 128
    if-nez v0, :cond_10

    .line 129
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->quoteAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 130
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 132
    :cond_10
    return-object v0
.end method

.method public final asUnquotedUTF8()[B
    .registers 3

    .prologue
    .line 112
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 113
    if-nez v0, :cond_10

    .line 114
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->encodeAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 115
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 117
    :cond_10
    return-object v0
.end method

.method public final charLength()I
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    .prologue
    .line 275
    if-ne p1, p0, :cond_4

    const/4 v0, 0x1

    .line 278
    :goto_3
    return v0

    .line 276
    :cond_4
    if-eqz p1, :cond_10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_12

    :cond_10
    const/4 v0, 0x0

    goto :goto_3

    .line 277
    :cond_12
    check-cast p1, Lcom/fasterxml/jackson/core/io/SerializedString;

    .line 278
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    iget-object v1, p1, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public final getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    return-object v0
.end method

.method public final hashCode()I
    .registers 2

    .prologue
    .line 270
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public putQuotedUTF8(Ljava/nio/ByteBuffer;)I
    .registers 5

    .prologue
    .line 230
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 231
    if-nez v0, :cond_10

    .line 232
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->quoteAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 233
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 235
    :cond_10
    array-length v1, v0

    .line 236
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-le v1, v2, :cond_19

    .line 237
    const/4 v0, -0x1

    .line 240
    :goto_18
    return v0

    .line 239
    :cond_19
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    move v0, v1

    .line 240
    goto :goto_18
.end method

.method public putUnquotedUTF8(Ljava/nio/ByteBuffer;)I
    .registers 5

    .prologue
    .line 246
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 247
    if-nez v0, :cond_10

    .line 248
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->encodeAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 249
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 251
    :cond_10
    array-length v1, v0

    .line 252
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-le v1, v2, :cond_19

    .line 253
    const/4 v0, -0x1

    .line 256
    :goto_18
    return v0

    .line 255
    :cond_19
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    move v0, v1

    .line 256
    goto :goto_18
.end method

.method protected readResolve()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 76
    new-instance v0, Lcom/fasterxml/jackson/core/io/SerializedString;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_jdkSerializeValue:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/fasterxml/jackson/core/io/SerializedString;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 267
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    return-object v0
.end method

.method public writeQuotedUTF8(Ljava/io/OutputStream;)I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 204
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 205
    if-nez v0, :cond_10

    .line 206
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->quoteAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 207
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_quotedUTF8Ref:[B

    .line 209
    :cond_10
    array-length v1, v0

    .line 210
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 211
    return v1
.end method

.method public writeUnquotedUTF8(Ljava/io/OutputStream;)I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 218
    if-nez v0, :cond_10

    .line 219
    invoke-static {}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->getInstance()Lcom/fasterxml/jackson/core/io/JsonStringEncoder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/JsonStringEncoder;->encodeAsUTF8(Ljava/lang/String;)[B

    move-result-object v0

    .line 220
    iput-object v0, p0, Lcom/fasterxml/jackson/core/io/SerializedString;->_unquotedUTF8Ref:[B

    .line 222
    :cond_10
    array-length v1, v0

    .line 223
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 224
    return v1
.end method
