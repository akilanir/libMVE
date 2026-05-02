.class final Lorg/msgpack/unpacker/StringAccept;
.super Lorg/msgpack/unpacker/Accept;
.source "StringAccept.java"


# instance fields
.field private decoder:Ljava/nio/charset/CharsetDecoder;

.field value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 33
    const-string v0, "raw value"

    invoke-direct {p0, v0}, Lorg/msgpack/unpacker/Accept;-><init>(Ljava/lang/String;)V

    .line 34
    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->newDecoder()Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onMalformedInput(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/CodingErrorAction;->REPORT:Ljava/nio/charset/CodingErrorAction;

    invoke-virtual {v0, v1}, Ljava/nio/charset/CharsetDecoder;->onUnmappableCharacter(Ljava/nio/charset/CodingErrorAction;)Ljava/nio/charset/CharsetDecoder;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/unpacker/StringAccept;->decoder:Ljava/nio/charset/CharsetDecoder;

    .line 37
    return-void
.end method


# virtual methods
.method acceptEmptyRaw()V
    .registers 2

    .prologue
    .line 50
    const-string v0, ""

    iput-object v0, p0, Lorg/msgpack/unpacker/StringAccept;->value:Ljava/lang/String;

    .line 51
    return-void
.end method

.method acceptRaw([B)V
    .registers 5
    .param p1, "raw"    # [B

    .prologue
    .line 42
    :try_start_0
    iget-object v1, p0, Lorg/msgpack/unpacker/StringAccept;->decoder:Ljava/nio/charset/CharsetDecoder;

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/msgpack/unpacker/StringAccept;->value:Ljava/lang/String;
    :try_end_10
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_10} :catch_11

    .line 46
    return-void

    .line 43
    :catch_11
    move-exception v0

    .line 44
    .local v0, "ex":Ljava/nio/charset/CharacterCodingException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public refer(Ljava/nio/ByteBuffer;Z)V
    .registers 5
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .param p2, "gift"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    :try_start_0
    iget-object v1, p0, Lorg/msgpack/unpacker/StringAccept;->decoder:Ljava/nio/charset/CharsetDecoder;

    invoke-virtual {v1, p1}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/msgpack/unpacker/StringAccept;->value:Ljava/lang/String;
    :try_end_c
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_c} :catch_d

    .line 60
    return-void

    .line 57
    :catch_d
    move-exception v0

    .line 58
    .local v0, "ex":Ljava/nio/charset/CharacterCodingException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
