.class Lorg/msgpack/type/StringRawValueImpl;
.super Lorg/msgpack/type/AbstractRawValue;
.source "StringRawValueImpl.java"


# instance fields
.field private string:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/msgpack/type/AbstractRawValue;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/msgpack/type/StringRawValueImpl;->string:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 55
    if-ne p0, p1, :cond_5

    .line 56
    const/4 v1, 0x1

    .line 70
    :cond_4
    :goto_4
    return v1

    .line 58
    :cond_5
    instance-of v2, p1, Lorg/msgpack/type/Value;

    if-eqz v2, :cond_4

    move-object v0, p1

    .line 61
    check-cast v0, Lorg/msgpack/type/Value;

    .line 62
    .local v0, "v":Lorg/msgpack/type/Value;
    invoke-interface {v0}, Lorg/msgpack/type/Value;->isRawValue()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lorg/msgpack/type/StringRawValueImpl;

    if-ne v1, v2, :cond_25

    .line 67
    iget-object v1, p0, Lorg/msgpack/type/StringRawValueImpl;->string:Ljava/lang/String;

    check-cast v0, Lorg/msgpack/type/StringRawValueImpl;

    .end local v0    # "v":Lorg/msgpack/type/Value;
    iget-object v2, v0, Lorg/msgpack/type/StringRawValueImpl;->string:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_4

    .line 70
    .restart local v0    # "v":Lorg/msgpack/type/Value;
    :cond_25
    invoke-virtual {p0}, Lorg/msgpack/type/StringRawValueImpl;->getByteArray()[B

    move-result-object v1

    invoke-interface {v0}, Lorg/msgpack/type/Value;->asRawValue()Lorg/msgpack/type/RawValue;

    move-result-object v2

    invoke-interface {v2}, Lorg/msgpack/type/RawValue;->getByteArray()[B

    move-result-object v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    goto :goto_4
.end method

.method public getByteArray()[B
    .registers 4

    .prologue
    .line 37
    :try_start_0
    iget-object v1, p0, Lorg/msgpack/type/StringRawValueImpl;->string:Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    return-object v1

    .line 38
    :catch_9
    move-exception v0

    .line 39
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lorg/msgpack/type/StringRawValueImpl;->string:Ljava/lang/String;

    return-object v0
.end method

.method public writeTo(Lorg/msgpack/packer/Packer;)V
    .registers 3
    .param p1, "pk"    # Lorg/msgpack/packer/Packer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    iget-object v0, p0, Lorg/msgpack/type/StringRawValueImpl;->string:Ljava/lang/String;

    invoke-interface {p1, v0}, Lorg/msgpack/packer/Packer;->write(Ljava/lang/String;)Lorg/msgpack/packer/Packer;

    .line 51
    return-void
.end method
