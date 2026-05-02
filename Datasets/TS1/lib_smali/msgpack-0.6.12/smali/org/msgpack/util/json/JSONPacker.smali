.class public Lorg/msgpack/util/json/JSONPacker;
.super Lorg/msgpack/packer/AbstractPacker;
.source "JSONPacker.java"


# static fields
.field private static final BACKSLASH:B = 0x5ct

.field private static final COLON:B = 0x3at

.field private static final COMMA:B = 0x2ct

.field private static final ESCAPE_TABLE:[I

.field private static final FALSE:[B

.field private static final FLAG_FIRST_ELEMENT:I = 0x1

.field private static final FLAG_MAP_KEY:I = 0x2

.field private static final FLAG_MAP_VALUE:I = 0x4

.field private static final HEX_TABLE:[B

.field private static final LEFT_BR:B = 0x5bt

.field private static final LEFT_WN:B = 0x7bt

.field private static final NULL:[B

.field private static final QUOTE:B = 0x22t

.field private static final RIGHT_BR:B = 0x5dt

.field private static final RIGHT_WN:B = 0x7dt

.field private static final TRUE:[B

.field private static final ZERO:B = 0x30t


# instance fields
.field private decoder:Ljava/nio/charset/CharsetDecoder;

.field private flags:[I

.field protected final out:Lorg/msgpack/io/Output;

.field private stack:Lorg/msgpack/packer/PackerStack;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/16 v5, 0x5c

    const/16 v4, 0x22

    const/4 v3, 0x4

    .line 36
    new-array v2, v3, [B

    fill-array-data v2, :array_78

    sput-object v2, Lorg/msgpack/util/json/JSONPacker;->NULL:[B

    .line 37
    new-array v2, v3, [B

    fill-array-data v2, :array_7e

    sput-object v2, Lorg/msgpack/util/json/JSONPacker;->TRUE:[B

    .line 38
    const/4 v2, 0x5

    new-array v2, v2, [B

    fill-array-data v2, :array_84

    sput-object v2, Lorg/msgpack/util/json/JSONPacker;->FALSE:[B

    .line 321
    const/16 v2, 0x80

    new-array v2, v2, [I

    sput-object v2, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    .line 322
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_22
    const/16 v2, 0x20

    if-ge v1, v2, :cond_2e

    .line 324
    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    const/4 v3, -0x1

    aput v3, v2, v1

    .line 322
    add-int/lit8 v1, v1, 0x1

    goto :goto_22

    .line 326
    :cond_2e
    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    aput v4, v2, v4

    .line 327
    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    aput v5, v2, v5

    .line 328
    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    const/16 v3, 0x8

    const/16 v4, 0x62

    aput v4, v2, v3

    .line 329
    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    const/16 v3, 0x9

    const/16 v4, 0x74

    aput v4, v2, v3

    .line 330
    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    const/16 v3, 0xc

    const/16 v4, 0x66

    aput v4, v2, v3

    .line 331
    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    const/16 v3, 0xa

    const/16 v4, 0x6e

    aput v4, v2, v3

    .line 332
    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    const/16 v3, 0xd

    const/16 v4, 0x72

    aput v4, v2, v3

    .line 334
    const-string v2, "0123456789ABCDEF"

    invoke-virtual {v2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    .line 335
    .local v0, "hex":[C
    array-length v2, v0

    new-array v2, v2, [B

    sput-object v2, Lorg/msgpack/util/json/JSONPacker;->HEX_TABLE:[B

    .line 336
    const/4 v1, 0x0

    :goto_6a
    array-length v2, v0

    if-ge v1, v2, :cond_77

    .line 337
    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->HEX_TABLE:[B

    aget-char v3, v0, v1

    int-to-byte v3, v3

    aput-byte v3, v2, v1

    .line 336
    add-int/lit8 v1, v1, 0x1

    goto :goto_6a

    .line 339
    :cond_77
    return-void

    .line 36
    :array_78
    .array-data 1
        0x6et
        0x75t
        0x6ct
        0x6ct
    .end array-data

    .line 37
    :array_7e
    .array-data 1
        0x74t
        0x72t
        0x75t
        0x65t
    .end array-data

    .line 38
    :array_84
    .array-data 1
        0x66t
        0x61t
        0x6ct
        0x73t
        0x65t
    .end array-data
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 62
    new-instance v0, Lorg/msgpack/MessagePack;

    invoke-direct {v0}, Lorg/msgpack/MessagePack;-><init>()V

    invoke-direct {p0, v0, p1}, Lorg/msgpack/util/json/JSONPacker;-><init>(Lorg/msgpack/MessagePack;Ljava/io/OutputStream;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/MessagePack;Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "stream"    # Ljava/io/OutputStream;

    .prologue
    .line 66
    new-instance v0, Lorg/msgpack/io/StreamOutput;

    invoke-direct {v0, p2}, Lorg/msgpack/io/StreamOutput;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {p0, p1, v0}, Lorg/msgpack/util/json/JSONPacker;-><init>(Lorg/msgpack/MessagePack;Lorg/msgpack/io/Output;)V

    .line 67
    return-void
.end method

.method protected constructor <init>(Lorg/msgpack/MessagePack;Lorg/msgpack/io/Output;)V
    .registers 5
    .param p1, "msgpack"    # Lorg/msgpack/MessagePack;
    .param p2, "out"    # Lorg/msgpack/io/Output;

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lorg/msgpack/packer/AbstractPacker;-><init>(Lorg/msgpack/MessagePack;)V

    .line 58
    new-instance v0, Lorg/msgpack/packer/PackerStack;

    invoke-direct {v0}, Lorg/msgpack/packer/PackerStack;-><init>()V

    iput-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    .line 71
    iput-object p2, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    .line 72
    new-instance v0, Lorg/msgpack/packer/PackerStack;

    invoke-direct {v0}, Lorg/msgpack/packer/PackerStack;-><init>()V

    iput-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    .line 73
    const/16 v0, 0x80

    new-array v0, v0, [I

    iput-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->flags:[I

    .line 74
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

    iput-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->decoder:Ljava/nio/charset/CharsetDecoder;

    .line 77
    return-void
.end method

.method private beginElement()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 277
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->flags:[I

    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    aget v0, v1, v2

    .line 278
    .local v0, "flag":I
    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_16

    .line 279
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Key of a map must be a string in JSON"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 281
    :cond_16
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginStringElement()V

    .line 282
    return-void
.end method

.method private beginStringElement()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 285
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->flags:[I

    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    aget v0, v1, v2

    .line 286
    .local v0, "flag":I
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_16

    .line 287
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/16 v2, 0x3a

    invoke-interface {v1, v2}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 291
    :cond_15
    :goto_15
    return-void

    .line 288
    :cond_16
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v1

    if-lez v1, :cond_15

    and-int/lit8 v1, v0, 0x1

    if-nez v1, :cond_15

    .line 289
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/16 v2, 0x2c

    invoke-interface {v1, v2}, Lorg/msgpack/io/Output;->writeByte(B)V

    goto :goto_15
.end method

.method private endElement()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 294
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->flags:[I

    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    aget v0, v1, v2

    .line 295
    .local v0, "flag":I
    and-int/lit8 v1, v0, 0x2

    if-eqz v1, :cond_24

    .line 296
    and-int/lit8 v0, v0, -0x3

    .line 297
    or-int/lit8 v0, v0, 0x4

    .line 302
    :cond_12
    :goto_12
    and-int/lit8 v0, v0, -0x2

    .line 303
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->flags:[I

    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v2

    aput v0, v1, v2

    .line 304
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->reduceCount()V

    .line 305
    return-void

    .line 298
    :cond_24
    and-int/lit8 v1, v0, 0x4

    if-eqz v1, :cond_12

    .line 299
    and-int/lit8 v0, v0, -0x5

    .line 300
    or-int/lit8 v0, v0, 0x2

    goto :goto_12
.end method

.method private static escape(Lorg/msgpack/io/Output;Ljava/lang/String;)V
    .registers 15
    .param p0, "out"    # Lorg/msgpack/io/Output;
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const/4 v11, 0x6

    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    .line 342
    new-array v4, v11, [B

    fill-array-data v4, :array_ba

    .line 343
    .local v4, "tmp":[B
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    .line 344
    .local v1, "chars":[C
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_f
    array-length v5, v1

    if-ge v3, v5, :cond_b9

    .line 345
    aget-char v0, v1, v3

    .line 346
    .local v0, "ch":I
    const/16 v5, 0x7f

    if-gt v0, v5, :cond_52

    .line 347
    sget-object v5, Lorg/msgpack/util/json/JSONPacker;->ESCAPE_TABLE:[I

    aget v2, v5, v0

    .line 348
    .local v2, "e":I
    if-nez v2, :cond_28

    .line 350
    int-to-byte v5, v0

    aput-byte v5, v4, v8

    .line 351
    const/4 v5, 0x1

    invoke-interface {p0, v4, v8, v5}, Lorg/msgpack/io/Output;->write([BII)V

    .line 344
    .end local v2    # "e":I
    :goto_25
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    .line 352
    .restart local v2    # "e":I
    :cond_28
    if-lez v2, :cond_35

    .line 354
    const/16 v5, 0x5c

    aput-byte v5, v4, v8

    .line 355
    int-to-byte v5, v2

    aput-byte v5, v4, v9

    .line 356
    invoke-interface {p0, v4, v8, v8}, Lorg/msgpack/io/Output;->write([BII)V

    goto :goto_25

    .line 359
    :cond_35
    const/16 v5, 0x30

    aput-byte v5, v4, v8

    .line 360
    const/16 v5, 0x30

    aput-byte v5, v4, v9

    .line 361
    sget-object v5, Lorg/msgpack/util/json/JSONPacker;->HEX_TABLE:[B

    shr-int/lit8 v6, v0, 0x4

    aget-byte v5, v5, v6

    aput-byte v5, v4, v10

    .line 362
    const/4 v5, 0x5

    sget-object v6, Lorg/msgpack/util/json/JSONPacker;->HEX_TABLE:[B

    and-int/lit8 v7, v0, 0xf

    aget-byte v6, v6, v7

    aput-byte v6, v4, v5

    .line 363
    invoke-interface {p0, v4, v12, v11}, Lorg/msgpack/io/Output;->write([BII)V

    goto :goto_25

    .line 365
    .end local v2    # "e":I
    :cond_52
    const/16 v5, 0x7ff

    if-gt v0, v5, :cond_68

    .line 367
    shr-int/lit8 v5, v0, 0x6

    or-int/lit16 v5, v5, 0xc0

    int-to-byte v5, v5

    aput-byte v5, v4, v8

    .line 368
    and-int/lit8 v5, v0, 0x3f

    or-int/lit16 v5, v5, 0x80

    int-to-byte v5, v5

    aput-byte v5, v4, v9

    .line 369
    invoke-interface {p0, v4, v8, v8}, Lorg/msgpack/io/Output;->write([BII)V

    goto :goto_25

    .line 370
    :cond_68
    const v5, 0xd800

    if-lt v0, v5, :cond_9d

    const v5, 0xdfff

    if-gt v0, v5, :cond_9d

    .line 372
    sget-object v5, Lorg/msgpack/util/json/JSONPacker;->HEX_TABLE:[B

    shr-int/lit8 v6, v0, 0xc

    and-int/lit8 v6, v6, 0xf

    aget-byte v5, v5, v6

    aput-byte v5, v4, v8

    .line 373
    sget-object v5, Lorg/msgpack/util/json/JSONPacker;->HEX_TABLE:[B

    shr-int/lit8 v6, v0, 0x8

    and-int/lit8 v6, v6, 0xf

    aget-byte v5, v5, v6

    aput-byte v5, v4, v9

    .line 374
    sget-object v5, Lorg/msgpack/util/json/JSONPacker;->HEX_TABLE:[B

    shr-int/lit8 v6, v0, 0x4

    and-int/lit8 v6, v6, 0xf

    aget-byte v5, v5, v6

    aput-byte v5, v4, v10

    .line 375
    const/4 v5, 0x5

    sget-object v6, Lorg/msgpack/util/json/JSONPacker;->HEX_TABLE:[B

    and-int/lit8 v7, v0, 0xf

    aget-byte v6, v6, v7

    aput-byte v6, v4, v5

    .line 376
    invoke-interface {p0, v4, v12, v11}, Lorg/msgpack/io/Output;->write([BII)V

    goto :goto_25

    .line 379
    :cond_9d
    shr-int/lit8 v5, v0, 0xc

    or-int/lit16 v5, v5, 0xe0

    int-to-byte v5, v5

    aput-byte v5, v4, v8

    .line 380
    shr-int/lit8 v5, v0, 0x6

    and-int/lit8 v5, v5, 0x3f

    or-int/lit16 v5, v5, 0x80

    int-to-byte v5, v5

    aput-byte v5, v4, v9

    .line 381
    and-int/lit8 v5, v0, 0x3f

    or-int/lit16 v5, v5, 0x80

    int-to-byte v5, v5

    aput-byte v5, v4, v10

    .line 382
    invoke-interface {p0, v4, v8, v9}, Lorg/msgpack/io/Output;->write([BII)V

    goto/16 :goto_25

    .line 385
    .end local v0    # "ch":I
    :cond_b9
    return-void

    .line 342
    :array_ba
    .array-data 1
        0x5ct
        0x75t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method private escape(Lorg/msgpack/io/Output;Ljava/nio/ByteBuffer;)V
    .registers 5
    .param p1, "out"    # Lorg/msgpack/io/Output;
    .param p2, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 313
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->decoder:Ljava/nio/charset/CharsetDecoder;

    invoke-virtual {v1, p2}, Ljava/nio/charset/CharsetDecoder;->decode(Ljava/nio/ByteBuffer;)Ljava/nio/CharBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/nio/CharBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 314
    .local v0, "str":Ljava/lang/String;
    invoke-static {p1, v0}, Lorg/msgpack/util/json/JSONPacker;->escape(Lorg/msgpack/io/Output;Ljava/lang/String;)V

    .line 315
    return-void
.end method

.method private escape(Lorg/msgpack/io/Output;[BII)V
    .registers 6
    .param p1, "out"    # Lorg/msgpack/io/Output;
    .param p2, "b"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 308
    invoke-static {p2, p3, p4}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/msgpack/util/json/JSONPacker;->escape(Lorg/msgpack/io/Output;Ljava/nio/ByteBuffer;)V

    .line 309
    return-void
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
    .line 269
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0}, Lorg/msgpack/io/Output;->close()V

    .line 270
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0}, Lorg/msgpack/io/Output;->flush()V

    .line 265
    return-void
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 273
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0}, Lorg/msgpack/packer/PackerStack;->clear()V

    .line 274
    return-void
.end method

.method public writeArrayBegin(I)Lorg/msgpack/packer/Packer;
    .registers 5
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 198
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 199
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, 0x5b

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 200
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 201
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0, p1}, Lorg/msgpack/packer/PackerStack;->pushArray(I)V

    .line 202
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->flags:[I

    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1

    .line 203
    return-object p0
.end method

.method public writeArrayEnd(Z)Lorg/msgpack/packer/Packer;
    .registers 7
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 208
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->topIsArray()Z

    move-result v2

    if-nez v2, :cond_10

    .line 209
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "writeArrayEnd() is called but writeArrayBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 213
    :cond_10
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getTopCount()I

    move-result v1

    .line 214
    .local v1, "remain":I
    if-lez v1, :cond_3c

    .line 215
    if-eqz p1, :cond_33

    .line 216
    new-instance v2, Lorg/msgpack/MessageTypeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "writeArrayEnd(check=true) is called but the array is not end: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 219
    :cond_33
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_34
    if-ge v0, v1, :cond_3c

    .line 220
    invoke-virtual {p0}, Lorg/msgpack/util/json/JSONPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 219
    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    .line 223
    .end local v0    # "i":I
    :cond_3c
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->pop()V

    .line 225
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/16 v3, 0x5d

    invoke-interface {v2, v3}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 226
    return-object p0
.end method

.method protected writeBigInteger(Ljava/math/BigInteger;)V
    .registers 6
    .param p1, "v"    # Ljava/math/BigInteger;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 125
    invoke-virtual {p1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 126
    .local v0, "b":[B
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/4 v2, 0x0

    array-length v3, v0

    invoke-interface {v1, v0, v2, v3}, Lorg/msgpack/io/Output;->write([BII)V

    .line 127
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 128
    return-void
.end method

.method protected writeBoolean(Z)V
    .registers 6
    .param p1, "v"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 81
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 82
    if-eqz p1, :cond_14

    .line 83
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    sget-object v1, Lorg/msgpack/util/json/JSONPacker;->TRUE:[B

    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->TRUE:[B

    array-length v2, v2

    invoke-interface {v0, v1, v3, v2}, Lorg/msgpack/io/Output;->write([BII)V

    .line 87
    :goto_10
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 88
    return-void

    .line 85
    :cond_14
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    sget-object v1, Lorg/msgpack/util/json/JSONPacker;->FALSE:[B

    sget-object v2, Lorg/msgpack/util/json/JSONPacker;->FALSE:[B

    array-length v2, v2

    invoke-interface {v0, v1, v3, v2}, Lorg/msgpack/io/Output;->write([BII)V

    goto :goto_10
.end method

.method protected writeByte(B)V
    .registers 6
    .param p1, "v"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 93
    invoke-static {p1}, Ljava/lang/Byte;->toString(B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 94
    .local v0, "b":[B
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/4 v2, 0x0

    array-length v3, v0

    invoke-interface {v1, v0, v2, v3}, Lorg/msgpack/io/Output;->write([BII)V

    .line 95
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 96
    return-void
.end method

.method protected writeByteArray([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x22

    .line 158
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginStringElement()V

    .line 159
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 160
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-direct {p0, v0, p1, p2, p3}, Lorg/msgpack/util/json/JSONPacker;->escape(Lorg/msgpack/io/Output;[BII)V

    .line 161
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 162
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 163
    return-void
.end method

.method protected writeByteBuffer(Ljava/nio/ByteBuffer;)V
    .registers 5
    .param p1, "bb"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x22

    .line 167
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginStringElement()V

    .line 168
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v1, v2}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 169
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 171
    .local v0, "pos":I
    :try_start_e
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-direct {p0, v1, p1}, Lorg/msgpack/util/json/JSONPacker;->escape(Lorg/msgpack/io/Output;Ljava/nio/ByteBuffer;)V
    :try_end_13
    .catchall {:try_start_e .. :try_end_13} :catchall_1f

    .line 173
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 175
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v1, v2}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 176
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 177
    return-void

    .line 173
    :catchall_1f
    move-exception v1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    throw v1
.end method

.method protected writeDouble(D)V
    .registers 8
    .param p1, "v"    # D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 146
    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 147
    .local v1, "r":Ljava/lang/Double;
    invoke-virtual {v1}, Ljava/lang/Double;->isInfinite()Z

    move-result v2

    if-nez v2, :cond_13

    invoke-virtual {v1}, Ljava/lang/Double;->isNaN()Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 148
    :cond_13
    new-instance v2, Ljava/io/IOException;

    const-string v3, "JSONPacker doesn\'t support NaN and infinite float value"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 151
    :cond_1b
    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 152
    .local v0, "b":[B
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/4 v3, 0x0

    array-length v4, v0

    invoke-interface {v2, v0, v3, v4}, Lorg/msgpack/io/Output;->write([BII)V

    .line 153
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 154
    return-void
.end method

.method protected writeFloat(F)V
    .registers 7
    .param p1, "v"    # F
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 133
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    .line 134
    .local v1, "r":Ljava/lang/Float;
    invoke-virtual {v1}, Ljava/lang/Float;->isInfinite()Z

    move-result v2

    if-nez v2, :cond_13

    invoke-virtual {v1}, Ljava/lang/Float;->isNaN()Z

    move-result v2

    if-eqz v2, :cond_1b

    .line 135
    :cond_13
    new-instance v2, Ljava/io/IOException;

    const-string v3, "JSONPacker doesn\'t support NaN and infinite float value"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 138
    :cond_1b
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 139
    .local v0, "b":[B
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/4 v3, 0x0

    array-length v4, v0

    invoke-interface {v2, v0, v3, v4}, Lorg/msgpack/io/Output;->write([BII)V

    .line 140
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 141
    return-void
.end method

.method protected writeInt(I)V
    .registers 6
    .param p1, "v"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 109
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 110
    .local v0, "b":[B
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/4 v2, 0x0

    array-length v3, v0

    invoke-interface {v1, v0, v2, v3}, Lorg/msgpack/io/Output;->write([BII)V

    .line 111
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 112
    return-void
.end method

.method protected writeLong(J)V
    .registers 7
    .param p1, "v"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 117
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 118
    .local v0, "b":[B
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/4 v2, 0x0

    array-length v3, v0

    invoke-interface {v1, v0, v2, v3}, Lorg/msgpack/io/Output;->write([BII)V

    .line 119
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 120
    return-void
.end method

.method public writeMapBegin(I)Lorg/msgpack/packer/Packer;
    .registers 5
    .param p1, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 231
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 232
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/16 v1, 0x7b

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 233
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 234
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v0, p1}, Lorg/msgpack/packer/PackerStack;->pushMap(I)V

    .line 235
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->flags:[I

    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v1}, Lorg/msgpack/packer/PackerStack;->getDepth()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1

    .line 236
    return-object p0
.end method

.method public writeMapEnd(Z)Lorg/msgpack/packer/Packer;
    .registers 7
    .param p1, "check"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 241
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->topIsMap()Z

    move-result v2

    if-nez v2, :cond_10

    .line 242
    new-instance v2, Lorg/msgpack/MessageTypeException;

    const-string v3, "writeMapEnd() is called but writeMapBegin() is not called"

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 246
    :cond_10
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->getTopCount()I

    move-result v1

    .line 247
    .local v1, "remain":I
    if-lez v1, :cond_3c

    .line 248
    if-eqz p1, :cond_33

    .line 249
    new-instance v2, Lorg/msgpack/MessageTypeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "writeMapEnd(check=true) is called but the map is not end: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 252
    :cond_33
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_34
    if-ge v0, v1, :cond_3c

    .line 253
    invoke-virtual {p0}, Lorg/msgpack/util/json/JSONPacker;->writeNil()Lorg/msgpack/packer/Packer;

    .line 252
    add-int/lit8 v0, v0, 0x1

    goto :goto_34

    .line 256
    .end local v0    # "i":I
    :cond_3c
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->stack:Lorg/msgpack/packer/PackerStack;

    invoke-virtual {v2}, Lorg/msgpack/packer/PackerStack;->pop()V

    .line 258
    iget-object v2, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/16 v3, 0x7d

    invoke-interface {v2, v3}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 259
    return-object p0
.end method

.method public writeNil()Lorg/msgpack/packer/Packer;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 191
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    sget-object v1, Lorg/msgpack/util/json/JSONPacker;->NULL:[B

    const/4 v2, 0x0

    sget-object v3, Lorg/msgpack/util/json/JSONPacker;->NULL:[B

    array-length v3, v3

    invoke-interface {v0, v1, v2, v3}, Lorg/msgpack/io/Output;->write([BII)V

    .line 192
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 193
    return-object p0
.end method

.method protected writeShort(S)V
    .registers 6
    .param p1, "v"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginElement()V

    .line 101
    invoke-static {p1}, Ljava/lang/Short;->toString(S)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 102
    .local v0, "b":[B
    iget-object v1, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    const/4 v2, 0x0

    array-length v3, v0

    invoke-interface {v1, v0, v2, v3}, Lorg/msgpack/io/Output;->write([BII)V

    .line 103
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 104
    return-void
.end method

.method protected writeString(Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x22

    .line 181
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->beginStringElement()V

    .line 182
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 183
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-static {v0, p1}, Lorg/msgpack/util/json/JSONPacker;->escape(Lorg/msgpack/io/Output;Ljava/lang/String;)V

    .line 184
    iget-object v0, p0, Lorg/msgpack/util/json/JSONPacker;->out:Lorg/msgpack/io/Output;

    invoke-interface {v0, v1}, Lorg/msgpack/io/Output;->writeByte(B)V

    .line 185
    invoke-direct {p0}, Lorg/msgpack/util/json/JSONPacker;->endElement()V

    .line 186
    return-void
.end method
