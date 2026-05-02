.class public Lorg/msgpack/unpacker/MessagePackUnpacker;
.super Lorg/msgpack/unpacker/AbstractUnpacker;
.source "MessagePackUnpacker.java"


# static fields
.field private static final REQUIRE_TO_READ_HEAD:B = -0x3ft


# instance fields
.field private final arrayAccept:Lorg/msgpack/unpacker/ArrayAccept;

.field private final bigIntegerAccept:Lorg/msgpack/unpacker/BigIntegerAccept;

.field private final byteArrayAccept:Lorg/msgpack/unpacker/ByteArrayAccept;

.field private final doubleAccept:Lorg/msgpack/unpacker/DoubleAccept;

.field private headByte:B

.field protected final in:Lorg/msgpack/io/Input;

.field private final intAccept:Lorg/msgpack/unpacker/IntAccept;

.field private final longAccept:Lorg/msgpack/unpacker/LongAccept;

.field private final mapAccept:Lorg/msgpack/unpacker/MapAccept;

.field private raw:[B

.field private rawFilled:I

.field private final skipAccept:Lorg/msgpack/unpacker/SkipAccept;

.field private final stack:Lorg/msgpack/unpacker/UnpackerStack;

.field private final stringAccept:Lorg/msgpack/unpacker/StringAccept;

.field private final valueAccept:Lorg/msgpack/unpacker/ValueAccept;


# direct methods
.method public constructor <init>(Lorg/msgpack/MessagePack;Ljava/io/InputStream;)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 55
    new-instance v0, Lorg/msgpack/io/StreamInput;

    invoke-direct {v0, p2}, Lorg/msgpack/io/StreamInput;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, p1, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/io/Input;)V

    .line 56
    return-void
.end method

.method protected constructor <init>(Lorg/msgpack/MessagePack;Lorg/msgpack/io/Input;)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "in"    # Lorg/msgpack/io/Input;

    .prologue
    .line 59
    invoke-direct {p0, p1}, Lorg/msgpack/unpacker/AbstractUnpacker;-><init>(Lorg/msgpack/MessagePack;)V

    .line 36
    new-instance v0, Lorg/msgpack/unpacker/UnpackerStack;

    invoke-direct {v0}, Lorg/msgpack/unpacker/UnpackerStack;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    .line 38
    const/16 v0, -0x3f

    iput-byte v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 43
    new-instance v0, Lorg/msgpack/unpacker/IntAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/IntAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->intAccept:Lorg/msgpack/unpacker/IntAccept;

    .line 44
    new-instance v0, Lorg/msgpack/unpacker/LongAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/LongAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->longAccept:Lorg/msgpack/unpacker/LongAccept;

    .line 45
    new-instance v0, Lorg/msgpack/unpacker/BigIntegerAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/BigIntegerAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->bigIntegerAccept:Lorg/msgpack/unpacker/BigIntegerAccept;

    .line 46
    new-instance v0, Lorg/msgpack/unpacker/DoubleAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/DoubleAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->doubleAccept:Lorg/msgpack/unpacker/DoubleAccept;

    .line 47
    new-instance v0, Lorg/msgpack/unpacker/ByteArrayAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/ByteArrayAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->byteArrayAccept:Lorg/msgpack/unpacker/ByteArrayAccept;

    .line 48
    new-instance v0, Lorg/msgpack/unpacker/StringAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/StringAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stringAccept:Lorg/msgpack/unpacker/StringAccept;

    .line 49
    new-instance v0, Lorg/msgpack/unpacker/ArrayAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/ArrayAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->arrayAccept:Lorg/msgpack/unpacker/ArrayAccept;

    .line 50
    new-instance v0, Lorg/msgpack/unpacker/MapAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/MapAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->mapAccept:Lorg/msgpack/unpacker/MapAccept;

    .line 51
    new-instance v0, Lorg/msgpack/unpacker/ValueAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/ValueAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->valueAccept:Lorg/msgpack/unpacker/ValueAccept;

    .line 52
    new-instance v0, Lorg/msgpack/unpacker/SkipAccept;

    invoke-direct {v0}, Lorg/msgpack/unpacker/SkipAccept;-><init>()V

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->skipAccept:Lorg/msgpack/unpacker/SkipAccept;

    .line 60
    iput-object p2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    .line 61
    return-void
.end method

.method private getHeadByte()B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 64
    iget-byte v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 65
    .local v0, "b":B
    const/16 v1, -0x3f

    if-ne v0, v1, :cond_e

    .line 66
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v1}, Lorg/msgpack/io/Input;->readByte()B

    move-result v0

    .end local v0    # "b":B
    iput-byte v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 68
    .restart local v0    # "b":B
    :cond_e
    return v0
.end method

.method private readOneWithoutStackLarge(Lorg/msgpack/unpacker/Accept;I)Z
    .registers 11
    .param p1, "a"    # Lorg/msgpack/unpacker/Accept;
    .param p2, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const v7, 0xffff

    const/4 v6, 0x2

    const/4 v3, 0x0

    const/16 v5, -0x3f

    const/4 v2, 0x1

    .line 144
    and-int/lit16 v4, p2, 0xff

    packed-switch v4, :pswitch_data_2d4

    .line 352
    :pswitch_d
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 353
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid byte: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 146
    :pswitch_28
    invoke-virtual {p1}, Lorg/msgpack/unpacker/Accept;->acceptNil()V

    .line 147
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 347
    :goto_2d
    return v2

    .line 150
    :pswitch_2e
    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptBoolean(Z)V

    .line 151
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_2d

    .line 154
    :pswitch_34
    invoke-virtual {p1, v2}, Lorg/msgpack/unpacker/Accept;->acceptBoolean(Z)V

    .line 155
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_2d

    .line 161
    :pswitch_3a
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getFloat()F

    move-result v3

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptFloat(F)V

    .line 162
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 163
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_2d

    .line 166
    :pswitch_4b
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getDouble()D

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Lorg/msgpack/unpacker/Accept;->acceptDouble(D)V

    .line 167
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 168
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_2d

    .line 171
    :pswitch_5c
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getByte()B

    move-result v3

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptUnsignedInteger(B)V

    .line 172
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 173
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_2d

    .line 176
    :pswitch_6d
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getShort()S

    move-result v3

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptUnsignedInteger(S)V

    .line 177
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 178
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_2d

    .line 181
    :pswitch_7e
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getInt()I

    move-result v3

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptUnsignedInteger(I)V

    .line 182
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 183
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_2d

    .line 186
    :pswitch_8f
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getLong()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Lorg/msgpack/unpacker/Accept;->acceptUnsignedInteger(J)V

    .line 187
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 188
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_2d

    .line 191
    :pswitch_a0
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getByte()B

    move-result v3

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptInteger(B)V

    .line 192
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 193
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 196
    :pswitch_b2
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getShort()S

    move-result v3

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptInteger(S)V

    .line 197
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 198
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 201
    :pswitch_c4
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getInt()I

    move-result v3

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptInteger(I)V

    .line 202
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 203
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 206
    :pswitch_d6
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->getLong()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Lorg/msgpack/unpacker/Accept;->acceptInteger(J)V

    .line 207
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 208
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 213
    :pswitch_e8
    iget-object v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v4}, Lorg/msgpack/io/Input;->getByte()B

    move-result v4

    and-int/lit16 v0, v4, 0xff

    .line 214
    .local v0, "count":I
    if-nez v0, :cond_fe

    .line 215
    invoke-virtual {p1}, Lorg/msgpack/unpacker/Accept;->acceptEmptyRaw()V

    .line 216
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 217
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 220
    :cond_fe
    iget v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawSizeLimit:I

    if-lt v0, v4, :cond_11e

    .line 221
    const-string v4, "Size of raw (%d) over limit at %d"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    iget v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawSizeLimit:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 224
    .local v1, "reason":Ljava/lang/String;
    new-instance v2, Lorg/msgpack/unpacker/SizeLimitException;

    invoke-direct {v2, v1}, Lorg/msgpack/unpacker/SizeLimitException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 226
    .end local v1    # "reason":Ljava/lang/String;
    :cond_11e
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 227
    invoke-direct {p0, p1, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->tryReferRawBody(Lorg/msgpack/io/BufferReferer;I)Z

    move-result v3

    if-nez v3, :cond_134

    .line 228
    invoke-direct {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readRawBody(I)V

    .line 229
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptRaw([B)V

    .line 230
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    .line 232
    :cond_134
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 238
    .end local v0    # "count":I
    :pswitch_138
    iget-object v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v4}, Lorg/msgpack/io/Input;->getShort()S

    move-result v4

    and-int v0, v4, v7

    .line 239
    .restart local v0    # "count":I
    if-nez v0, :cond_14e

    .line 240
    invoke-virtual {p1}, Lorg/msgpack/unpacker/Accept;->acceptEmptyRaw()V

    .line 241
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 242
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 245
    :cond_14e
    iget v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawSizeLimit:I

    if-lt v0, v4, :cond_16e

    .line 246
    const-string v4, "Size of raw (%d) over limit at %d"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    iget v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawSizeLimit:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 249
    .restart local v1    # "reason":Ljava/lang/String;
    new-instance v2, Lorg/msgpack/unpacker/SizeLimitException;

    invoke-direct {v2, v1}, Lorg/msgpack/unpacker/SizeLimitException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 251
    .end local v1    # "reason":Ljava/lang/String;
    :cond_16e
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 252
    invoke-direct {p0, p1, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->tryReferRawBody(Lorg/msgpack/io/BufferReferer;I)Z

    move-result v3

    if-nez v3, :cond_184

    .line 253
    invoke-direct {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readRawBody(I)V

    .line 254
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptRaw([B)V

    .line 255
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    .line 257
    :cond_184
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 263
    .end local v0    # "count":I
    :pswitch_188
    iget-object v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v4}, Lorg/msgpack/io/Input;->getInt()I

    move-result v0

    .line 264
    .restart local v0    # "count":I
    if-nez v0, :cond_19c

    .line 265
    invoke-virtual {p1}, Lorg/msgpack/unpacker/Accept;->acceptEmptyRaw()V

    .line 266
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 267
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 270
    :cond_19c
    if-ltz v0, :cond_1a2

    iget v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawSizeLimit:I

    if-lt v0, v4, :cond_1be

    .line 271
    :cond_1a2
    const-string v4, "Size of raw (%d) over limit at %d"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    iget v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawSizeLimit:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 274
    .restart local v1    # "reason":Ljava/lang/String;
    new-instance v2, Lorg/msgpack/unpacker/SizeLimitException;

    invoke-direct {v2, v1}, Lorg/msgpack/unpacker/SizeLimitException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 276
    .end local v1    # "reason":Ljava/lang/String;
    :cond_1be
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v3}, Lorg/msgpack/io/Input;->advance()V

    .line 277
    invoke-direct {p0, p1, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->tryReferRawBody(Lorg/msgpack/io/BufferReferer;I)Z

    move-result v3

    if-nez v3, :cond_1d4

    .line 278
    invoke-direct {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readRawBody(I)V

    .line 279
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptRaw([B)V

    .line 280
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    .line 282
    :cond_1d4
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto/16 :goto_2d

    .line 287
    .end local v0    # "count":I
    :pswitch_1d8
    iget-object v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v4}, Lorg/msgpack/io/Input;->getShort()S

    move-result v4

    and-int v0, v4, v7

    .line 288
    .restart local v0    # "count":I
    iget v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->arraySizeLimit:I

    if-lt v0, v4, :cond_200

    .line 289
    const-string v4, "Size of array (%d) over limit at %d"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    iget v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->arraySizeLimit:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 292
    .restart local v1    # "reason":Ljava/lang/String;
    new-instance v2, Lorg/msgpack/unpacker/SizeLimitException;

    invoke-direct {v2, v1}, Lorg/msgpack/unpacker/SizeLimitException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 294
    .end local v1    # "reason":Ljava/lang/String;
    :cond_200
    invoke-virtual {p1, v0}, Lorg/msgpack/unpacker/Accept;->acceptArray(I)V

    .line 295
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 296
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2, v0}, Lorg/msgpack/unpacker/UnpackerStack;->pushArray(I)V

    .line 297
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v2}, Lorg/msgpack/io/Input;->advance()V

    .line 298
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    move v2, v3

    .line 299
    goto/16 :goto_2d

    .line 303
    .end local v0    # "count":I
    :pswitch_217
    iget-object v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v4}, Lorg/msgpack/io/Input;->getInt()I

    move-result v0

    .line 304
    .restart local v0    # "count":I
    if-ltz v0, :cond_223

    iget v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->arraySizeLimit:I

    if-lt v0, v4, :cond_23f

    .line 305
    :cond_223
    const-string v4, "Size of array (%d) over limit at %d"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    iget v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->arraySizeLimit:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 308
    .restart local v1    # "reason":Ljava/lang/String;
    new-instance v2, Lorg/msgpack/unpacker/SizeLimitException;

    invoke-direct {v2, v1}, Lorg/msgpack/unpacker/SizeLimitException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 310
    .end local v1    # "reason":Ljava/lang/String;
    :cond_23f
    invoke-virtual {p1, v0}, Lorg/msgpack/unpacker/Accept;->acceptArray(I)V

    .line 311
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 312
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2, v0}, Lorg/msgpack/unpacker/UnpackerStack;->pushArray(I)V

    .line 313
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v2}, Lorg/msgpack/io/Input;->advance()V

    .line 314
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    move v2, v3

    .line 315
    goto/16 :goto_2d

    .line 319
    .end local v0    # "count":I
    :pswitch_256
    iget-object v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v4}, Lorg/msgpack/io/Input;->getShort()S

    move-result v4

    and-int v0, v4, v7

    .line 320
    .restart local v0    # "count":I
    iget v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->mapSizeLimit:I

    if-lt v0, v4, :cond_27e

    .line 321
    const-string v4, "Size of map (%d) over limit at %d"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    iget v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->mapSizeLimit:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 324
    .restart local v1    # "reason":Ljava/lang/String;
    new-instance v2, Lorg/msgpack/unpacker/SizeLimitException;

    invoke-direct {v2, v1}, Lorg/msgpack/unpacker/SizeLimitException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 326
    .end local v1    # "reason":Ljava/lang/String;
    :cond_27e
    invoke-virtual {p1, v0}, Lorg/msgpack/unpacker/Accept;->acceptMap(I)V

    .line 327
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 328
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2, v0}, Lorg/msgpack/unpacker/UnpackerStack;->pushMap(I)V

    .line 329
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v2}, Lorg/msgpack/io/Input;->advance()V

    .line 330
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    move v2, v3

    .line 331
    goto/16 :goto_2d

    .line 335
    .end local v0    # "count":I
    :pswitch_295
    iget-object v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v4}, Lorg/msgpack/io/Input;->getInt()I

    move-result v0

    .line 336
    .restart local v0    # "count":I
    if-ltz v0, :cond_2a1

    iget v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->mapSizeLimit:I

    if-lt v0, v4, :cond_2bd

    .line 337
    :cond_2a1
    const-string v4, "Size of map (%d) over limit at %d"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    iget v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->mapSizeLimit:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 340
    .restart local v1    # "reason":Ljava/lang/String;
    new-instance v2, Lorg/msgpack/unpacker/SizeLimitException;

    invoke-direct {v2, v1}, Lorg/msgpack/unpacker/SizeLimitException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 342
    .end local v1    # "reason":Ljava/lang/String;
    :cond_2bd
    invoke-virtual {p1, v0}, Lorg/msgpack/unpacker/Accept;->acceptMap(I)V

    .line 343
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 344
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2, v0}, Lorg/msgpack/unpacker/UnpackerStack;->pushMap(I)V

    .line 345
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v2}, Lorg/msgpack/io/Input;->advance()V

    .line 346
    iput-byte v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    move v2, v3

    .line 347
    goto/16 :goto_2d

    .line 144
    :pswitch_data_2d4
    .packed-switch 0xc0
        :pswitch_28
        :pswitch_d
        :pswitch_2e
        :pswitch_34
        :pswitch_e8
        :pswitch_138
        :pswitch_188
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_3a
        :pswitch_4b
        :pswitch_5c
        :pswitch_6d
        :pswitch_7e
        :pswitch_8f
        :pswitch_a0
        :pswitch_b2
        :pswitch_c4
        :pswitch_d6
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_d
        :pswitch_e8
        :pswitch_138
        :pswitch_188
        :pswitch_1d8
        :pswitch_217
        :pswitch_256
        :pswitch_295
    .end packed-switch
.end method

.method private readRawBody(I)V
    .registers 3
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 362
    new-array v0, p1, [B

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    .line 363
    const/4 v0, 0x0

    iput v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawFilled:I

    .line 364
    invoke-direct {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readRawBodyCont()V

    .line 365
    return-void
.end method

.method private readRawBodyCont()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 368
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    iget v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawFilled:I

    iget-object v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    array-length v4, v4

    iget v5, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawFilled:I

    sub-int/2addr v4, v5

    invoke-interface {v1, v2, v3, v4}, Lorg/msgpack/io/Input;->read([BII)I

    move-result v0

    .line 369
    .local v0, "len":I
    iget v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawFilled:I

    add-int/2addr v1, v0

    iput v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawFilled:I

    .line 370
    iget v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->rawFilled:I

    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    array-length v2, v2

    if-ge v1, v2, :cond_22

    .line 371
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1

    .line 373
    :cond_22
    return-void
.end method

.method private tryReferRawBody(Lorg/msgpack/io/BufferReferer;I)Z
    .registers 4
    .param p1, "referer"    # Lorg/msgpack/io/BufferReferer;
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 358
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v0, p1, p2}, Lorg/msgpack/io/Input;->tryRefer(Lorg/msgpack/io/BufferReferer;I)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 673
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v0}, Lorg/msgpack/io/Input;->close()V

    .line 674
    return-void
.end method

.method public getNextType()Lorg/msgpack/type/ValueType;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 613
    invoke-direct {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->getHeadByte()B

    move-result v0

    .line 614
    .local v0, "b":I
    and-int/lit16 v1, v0, 0x80

    if-nez v1, :cond_b

    .line 615
    sget-object v1, Lorg/msgpack/type/ValueType;->INTEGER:Lorg/msgpack/type/ValueType;

    .line 661
    :goto_a
    return-object v1

    .line 617
    :cond_b
    and-int/lit16 v1, v0, 0xe0

    const/16 v2, 0xe0

    if-ne v1, v2, :cond_14

    .line 618
    sget-object v1, Lorg/msgpack/type/ValueType;->INTEGER:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 620
    :cond_14
    and-int/lit16 v1, v0, 0xe0

    const/16 v2, 0xa0

    if-ne v1, v2, :cond_1d

    .line 621
    sget-object v1, Lorg/msgpack/type/ValueType;->RAW:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 623
    :cond_1d
    and-int/lit16 v1, v0, 0xf0

    const/16 v2, 0x90

    if-ne v1, v2, :cond_26

    .line 624
    sget-object v1, Lorg/msgpack/type/ValueType;->ARRAY:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 626
    :cond_26
    and-int/lit16 v1, v0, 0xf0

    const/16 v2, 0x80

    if-ne v1, v2, :cond_2f

    .line 627
    sget-object v1, Lorg/msgpack/type/ValueType;->MAP:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 629
    :cond_2f
    and-int/lit16 v1, v0, 0xff

    packed-switch v1, :pswitch_data_62

    .line 663
    :pswitch_34
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid byte: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 631
    :pswitch_4d
    sget-object v1, Lorg/msgpack/type/ValueType;->NIL:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 634
    :pswitch_50
    sget-object v1, Lorg/msgpack/type/ValueType;->BOOLEAN:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 637
    :pswitch_53
    sget-object v1, Lorg/msgpack/type/ValueType;->FLOAT:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 646
    :pswitch_56
    sget-object v1, Lorg/msgpack/type/ValueType;->INTEGER:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 655
    :pswitch_59
    sget-object v1, Lorg/msgpack/type/ValueType;->RAW:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 658
    :pswitch_5c
    sget-object v1, Lorg/msgpack/type/ValueType;->ARRAY:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 661
    :pswitch_5f
    sget-object v1, Lorg/msgpack/type/ValueType;->MAP:Lorg/msgpack/type/ValueType;

    goto :goto_a

    .line 629
    :pswitch_data_62
    .packed-switch 0xc0
        :pswitch_4d
        :pswitch_34
        :pswitch_50
        :pswitch_50
        :pswitch_59
        :pswitch_59
        :pswitch_59
        :pswitch_34
        :pswitch_34
        :pswitch_34
        :pswitch_53
        :pswitch_53
        :pswitch_56
        :pswitch_56
        :pswitch_56
        :pswitch_56
        :pswitch_56
        :pswitch_56
        :pswitch_56
        :pswitch_56
        :pswitch_34
        :pswitch_34
        :pswitch_34
        :pswitch_34
        :pswitch_34
        :pswitch_59
        :pswitch_59
        :pswitch_59
        :pswitch_5c
        :pswitch_5c
        :pswitch_5f
        :pswitch_5f
    .end packed-switch
.end method

.method public getReadByteCount()I
    .registers 2

    .prologue
    .line 678
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v0}, Lorg/msgpack/io/Input;->getReadByteCount()I

    move-result v0

    return v0
.end method

.method public readArrayBegin()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 508
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->arrayAccept:Lorg/msgpack/unpacker/ArrayAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 509
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->arrayAccept:Lorg/msgpack/unpacker/ArrayAccept;

    iget v0, v0, Lorg/msgpack/unpacker/ArrayAccept;->size:I

    return v0
.end method

.method public readArrayEnd(Z)V
    .registers 6
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 514
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->topIsArray()Z

    move-result v2

    if-nez v2, :cond_10

    .line 515
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "readArrayEnd() is called but readArrayBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 519
    :cond_10
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v1

    .line 520
    .local v1, "remain":I
    if-lez v1, :cond_2b

    .line 521
    if-eqz p1, :cond_22

    .line 522
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "readArrayEnd(check=true) is called but the array is not end"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 525
    :cond_22
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    if-ge v0, v1, :cond_2b

    .line 526
    invoke-virtual {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->skip()V

    .line 525
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 529
    .end local v0    # "i":I
    :cond_2b
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    .line 530
    return-void
.end method

.method public readBigInteger()Ljava/math/BigInteger;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 478
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->bigIntegerAccept:Lorg/msgpack/unpacker/BigIntegerAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 479
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->bigIntegerAccept:Lorg/msgpack/unpacker/BigIntegerAccept;

    iget-object v0, v0, Lorg/msgpack/unpacker/BigIntegerAccept;->value:Ljava/math/BigInteger;

    return-object v0
.end method

.method public readBoolean()Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, -0x3f

    .line 423
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 424
    invoke-direct {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->getHeadByte()B

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 425
    .local v0, "b":I
    const/16 v1, 0xc2

    if-ne v0, v1, :cond_1a

    .line 426
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 427
    iput-byte v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 428
    const/4 v1, 0x0

    .line 432
    :goto_19
    return v1

    .line 429
    :cond_1a
    const/16 v1, 0xc3

    if-ne v0, v1, :cond_27

    .line 430
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 431
    iput-byte v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 432
    const/4 v1, 0x1

    goto :goto_19

    .line 434
    :cond_27
    new-instance v1, Lorg/msgpack/MessageTypeException;

    const-string v2, "Expected Boolean but got not boolean value"

    invoke-direct {v1, v2}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public readByte()B
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 441
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 442
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->intAccept:Lorg/msgpack/unpacker/IntAccept;

    invoke-virtual {p0, v1}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOneWithoutStack(Lorg/msgpack/unpacker/Accept;)Z

    .line 443
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->intAccept:Lorg/msgpack/unpacker/IntAccept;

    iget v0, v1, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 444
    .local v0, "value":I
    const/16 v1, -0x80

    if-lt v0, v1, :cond_16

    const/16 v1, 0x7f

    if-le v0, v1, :cond_1c

    .line 445
    :cond_16
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v1

    .line 447
    :cond_1c
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 448
    int-to-byte v1, v0

    return v1
.end method

.method public readByteArray()[B
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 496
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->byteArrayAccept:Lorg/msgpack/unpacker/ByteArrayAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 497
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->byteArrayAccept:Lorg/msgpack/unpacker/ByteArrayAccept;

    iget-object v0, v0, Lorg/msgpack/unpacker/ByteArrayAccept;->value:[B

    return-object v0
.end method

.method public readDouble()D
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 490
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->doubleAccept:Lorg/msgpack/unpacker/DoubleAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 491
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->doubleAccept:Lorg/msgpack/unpacker/DoubleAccept;

    iget-wide v0, v0, Lorg/msgpack/unpacker/DoubleAccept;->value:D

    return-wide v0
.end method

.method public readFloat()F
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 484
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->doubleAccept:Lorg/msgpack/unpacker/DoubleAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 485
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->doubleAccept:Lorg/msgpack/unpacker/DoubleAccept;

    iget-wide v0, v0, Lorg/msgpack/unpacker/DoubleAccept;->value:D

    double-to-float v0, v0

    return v0
.end method

.method public readInt()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 466
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->intAccept:Lorg/msgpack/unpacker/IntAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 467
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->intAccept:Lorg/msgpack/unpacker/IntAccept;

    iget v0, v0, Lorg/msgpack/unpacker/IntAccept;->value:I

    return v0
.end method

.method public readLong()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 472
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->longAccept:Lorg/msgpack/unpacker/LongAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 473
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->longAccept:Lorg/msgpack/unpacker/LongAccept;

    iget-wide v0, v0, Lorg/msgpack/unpacker/LongAccept;->value:J

    return-wide v0
.end method

.method public readMapBegin()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 534
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->mapAccept:Lorg/msgpack/unpacker/MapAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 535
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->mapAccept:Lorg/msgpack/unpacker/MapAccept;

    iget v0, v0, Lorg/msgpack/unpacker/MapAccept;->size:I

    return v0
.end method

.method public readMapEnd(Z)V
    .registers 6
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 540
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->topIsMap()Z

    move-result v2

    if-nez v2, :cond_10

    .line 541
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "readMapEnd() is called but readMapBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 545
    :cond_10
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v1

    .line 546
    .local v1, "remain":I
    if-lez v1, :cond_2b

    .line 547
    if-eqz p1, :cond_22

    .line 548
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "readMapEnd(check=true) is called but the map is not end"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 551
    :cond_22
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_23
    if-ge v0, v1, :cond_2b

    .line 552
    invoke-virtual {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->skip()V

    .line 551
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 555
    .end local v0    # "i":I
    :cond_2b
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    .line 556
    return-void
.end method

.method public readNil()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 410
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 411
    invoke-direct {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->getHeadByte()B

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 412
    .local v0, "b":I
    const/16 v1, 0xc0

    if-ne v0, v1, :cond_19

    .line 413
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 414
    const/16 v1, -0x3f

    iput-byte v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 415
    return-void

    .line 417
    :cond_19
    new-instance v1, Lorg/msgpack/MessageTypeException;

    const-string v2, "Expected nil but got not nil value"

    invoke-direct {v1, v2}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method final readOne(Lorg/msgpack/unpacker/Accept;)V
    .registers 3
    .param p1, "a"    # Lorg/msgpack/unpacker/Accept;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 73
    invoke-virtual {p0, p1}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOneWithoutStack(Lorg/msgpack/unpacker/Accept;)Z

    move-result v0

    if-eqz v0, :cond_10

    .line 74
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 76
    :cond_10
    return-void
.end method

.method final readOneWithoutStack(Lorg/msgpack/unpacker/Accept;)Z
    .registers 10
    .param p1, "a"    # Lorg/msgpack/unpacker/Accept;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x1

    const/16 v6, -0x3f

    .line 79
    iget-object v4, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    if-eqz v4, :cond_16

    .line 80
    invoke-direct {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readRawBodyCont()V

    .line 81
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptRaw([B)V

    .line 82
    iput-object v7, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    .line 83
    iput-byte v6, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 139
    :goto_15
    return v2

    .line 87
    :cond_16
    invoke-direct {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->getHeadByte()B

    move-result v0

    .line 89
    .local v0, "b":I
    and-int/lit16 v4, v0, 0x80

    if-nez v4, :cond_24

    .line 91
    invoke-virtual {p1, v0}, Lorg/msgpack/unpacker/Accept;->acceptInteger(I)V

    .line 92
    iput-byte v6, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_15

    .line 96
    :cond_24
    and-int/lit16 v4, v0, 0xe0

    const/16 v5, 0xe0

    if-ne v4, v5, :cond_30

    .line 98
    invoke-virtual {p1, v0}, Lorg/msgpack/unpacker/Accept;->acceptInteger(I)V

    .line 99
    iput-byte v6, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_15

    .line 103
    :cond_30
    and-int/lit16 v4, v0, 0xe0

    const/16 v5, 0xa0

    if-ne v4, v5, :cond_53

    .line 104
    and-int/lit8 v1, v0, 0x1f

    .line 105
    .local v1, "count":I
    if-nez v1, :cond_40

    .line 106
    invoke-virtual {p1}, Lorg/msgpack/unpacker/Accept;->acceptEmptyRaw()V

    .line 107
    iput-byte v6, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_15

    .line 110
    :cond_40
    invoke-direct {p0, p1, v1}, Lorg/msgpack/unpacker/MessagePackUnpacker;->tryReferRawBody(Lorg/msgpack/io/BufferReferer;I)Z

    move-result v3

    if-nez v3, :cond_50

    .line 111
    invoke-direct {p0, v1}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readRawBody(I)V

    .line 112
    iget-object v3, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    invoke-virtual {p1, v3}, Lorg/msgpack/unpacker/Accept;->acceptRaw([B)V

    .line 113
    iput-object v7, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    .line 115
    :cond_50
    iput-byte v6, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_15

    .line 119
    .end local v1    # "count":I
    :cond_53
    and-int/lit16 v2, v0, 0xf0

    const/16 v4, 0x90

    if-ne v2, v4, :cond_6c

    .line 120
    and-int/lit8 v1, v0, 0xf

    .line 122
    .restart local v1    # "count":I
    invoke-virtual {p1, v1}, Lorg/msgpack/unpacker/Accept;->acceptArray(I)V

    .line 123
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 124
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2, v1}, Lorg/msgpack/unpacker/UnpackerStack;->pushArray(I)V

    .line 125
    iput-byte v6, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    move v2, v3

    .line 126
    goto :goto_15

    .line 129
    .end local v1    # "count":I
    :cond_6c
    and-int/lit16 v2, v0, 0xf0

    const/16 v4, 0x80

    if-ne v2, v4, :cond_85

    .line 130
    and-int/lit8 v1, v0, 0xf

    .line 132
    .restart local v1    # "count":I
    invoke-virtual {p1, v1}, Lorg/msgpack/unpacker/Accept;->acceptMap(I)V

    .line 133
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 134
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2, v1}, Lorg/msgpack/unpacker/UnpackerStack;->pushMap(I)V

    .line 135
    iput-byte v6, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    move v2, v3

    .line 136
    goto :goto_15

    .line 139
    .end local v1    # "count":I
    :cond_85
    invoke-direct {p0, p1, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOneWithoutStackLarge(Lorg/msgpack/unpacker/Accept;I)Z

    move-result v2

    goto :goto_15
.end method

.method public readShort()S
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 454
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 455
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->intAccept:Lorg/msgpack/unpacker/IntAccept;

    invoke-virtual {p0, v1}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOneWithoutStack(Lorg/msgpack/unpacker/Accept;)Z

    .line 456
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->intAccept:Lorg/msgpack/unpacker/IntAccept;

    iget v0, v1, Lorg/msgpack/unpacker/IntAccept;->value:I

    .line 457
    .local v0, "value":I
    const/16 v1, -0x8000

    if-lt v0, v1, :cond_16

    const/16 v1, 0x7fff

    if-le v0, v1, :cond_1c

    .line 458
    :cond_16
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1}, Lorg/msgpack/MessageTypeException;-><init>()V

    throw v1

    .line 460
    :cond_1c
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 461
    int-to-short v1, v0

    return v1
.end method

.method public readString()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 502
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stringAccept:Lorg/msgpack/unpacker/StringAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 503
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stringAccept:Lorg/msgpack/unpacker/StringAccept;

    iget-object v0, v0, Lorg/msgpack/unpacker/StringAccept;->value:Ljava/lang/String;

    return-object v0
.end method

.method protected readValue(Lorg/msgpack/packer/Unconverter;)V
    .registers 4
    .param p1, "uc"    # Lorg/msgpack/packer/Unconverter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 560
    invoke-virtual {p1}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 561
    invoke-virtual {p1}, Lorg/msgpack/packer/Unconverter;->resetResult()V

    .line 563
    :cond_a
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->valueAccept:Lorg/msgpack/unpacker/ValueAccept;

    invoke-virtual {v0, p1}, Lorg/msgpack/unpacker/ValueAccept;->setUnconverter(Lorg/msgpack/packer/Unconverter;)V

    .line 565
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 566
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->valueAccept:Lorg/msgpack/unpacker/ValueAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOneWithoutStack(Lorg/msgpack/unpacker/Accept;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 567
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 568
    invoke-virtual {p1}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v0

    if-eqz v0, :cond_2d

    .line 586
    :goto_27
    return-void

    .line 589
    :cond_28
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->valueAccept:Lorg/msgpack/unpacker/ValueAccept;

    invoke-virtual {p0, v0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    .line 573
    :cond_2d
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v0

    if-nez v0, :cond_28

    .line 574
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->topIsArray()Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 575
    invoke-virtual {p1, v1}, Lorg/msgpack/packer/Unconverter;->writeArrayEnd(Z)Lorg/msgpack/packer/Packer;

    .line 576
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    .line 585
    :goto_45
    invoke-virtual {p1}, Lorg/msgpack/packer/Unconverter;->getResult()Lorg/msgpack/type/Value;

    move-result-object v0

    if-eqz v0, :cond_2d

    goto :goto_27

    .line 578
    :cond_4c
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->topIsMap()Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 579
    invoke-virtual {p1, v1}, Lorg/msgpack/packer/Unconverter;->writeMapEnd(Z)Lorg/msgpack/packer/Packer;

    .line 580
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    goto :goto_45

    .line 583
    :cond_5d
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "invalid stack"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 668
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->raw:[B

    .line 669
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v0}, Lorg/msgpack/unpacker/UnpackerStack;->clear()V

    .line 670
    return-void
.end method

.method public resetReadByteCount()V
    .registers 2

    .prologue
    .line 683
    iget-object v0, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->in:Lorg/msgpack/io/Input;

    invoke-interface {v0}, Lorg/msgpack/io/Input;->resetReadByteCount()V

    .line 684
    return-void
.end method

.method public skip()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 595
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 596
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->skipAccept:Lorg/msgpack/unpacker/SkipAccept;

    invoke-virtual {p0, v1}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOneWithoutStack(Lorg/msgpack/unpacker/Accept;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 597
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 605
    :goto_12
    return-void

    .line 600
    :cond_13
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .line 602
    .local v0, "targetDepth":I
    :cond_1b
    :goto_1b
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v1

    if-nez v1, :cond_31

    .line 603
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->pop()V

    .line 604
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v1

    if-gt v1, v0, :cond_1b

    goto :goto_12

    .line 608
    :cond_31
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->skipAccept:Lorg/msgpack/unpacker/SkipAccept;

    invoke-virtual {p0, v1}, Lorg/msgpack/unpacker/MessagePackUnpacker;->readOne(Lorg/msgpack/unpacker/Accept;)V

    goto :goto_1b
.end method

.method protected tryReadNil()Z
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->checkCount()V

    .line 378
    invoke-direct {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->getHeadByte()B

    move-result v1

    and-int/lit16 v0, v1, 0xff

    .line 379
    .local v0, "b":I
    const/16 v1, 0xc0

    if-ne v0, v1, :cond_1a

    .line 381
    iget-object v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v1}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 382
    const/16 v1, -0x3f

    iput-byte v1, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    .line 383
    const/4 v1, 0x1

    .line 386
    :goto_19
    return v1

    :cond_1a
    const/4 v1, 0x0

    goto :goto_19
.end method

.method public trySkipNil()Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x1

    .line 391
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getDepth()I

    move-result v2

    if-lez v2, :cond_12

    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->getTopCount()I

    move-result v2

    if-gtz v2, :cond_12

    .line 404
    :goto_11
    return v1

    .line 396
    :cond_12
    invoke-direct {p0}, Lorg/msgpack/unpacker/MessagePackUnpacker;->getHeadByte()B

    move-result v2

    and-int/lit16 v0, v2, 0xff

    .line 397
    .local v0, "b":I
    const/16 v2, 0xc0

    if-ne v0, v2, :cond_26

    .line 399
    iget-object v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->stack:Lorg/msgpack/unpacker/UnpackerStack;

    invoke-virtual {v2}, Lorg/msgpack/unpacker/UnpackerStack;->reduceCount()V

    .line 400
    const/16 v2, -0x3f

    iput-byte v2, p0, Lorg/msgpack/unpacker/MessagePackUnpacker;->headByte:B

    goto :goto_11

    .line 404
    :cond_26
    const/4 v1, 0x0

    goto :goto_11
.end method
