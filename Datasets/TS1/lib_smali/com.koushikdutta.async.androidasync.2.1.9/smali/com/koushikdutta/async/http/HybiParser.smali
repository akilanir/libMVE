.class abstract Lcom/koushikdutta/async/http/HybiParser;
.super Ljava/lang/Object;
.source "HybiParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/http/HybiParser$ProtocolError;
    }
.end annotation


# static fields
.field private static final BASE:J = 0x2L

.field private static final BYTE:I = 0xff

.field private static final FIN:I = 0x80

.field private static final FRAGMENTED_OPCODES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final LENGTH:I = 0x7f

.field private static final MASK:I = 0x80

.field private static final MODE_BINARY:I = 0x2

.field private static final MODE_TEXT:I = 0x1

.field private static final OPCODE:I = 0xf

.field private static final OPCODES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final OP_BINARY:I = 0x2

.field private static final OP_CLOSE:I = 0x8

.field private static final OP_CONTINUATION:I = 0x0

.field private static final OP_PING:I = 0x9

.field private static final OP_PONG:I = 0xa

.field private static final OP_TEXT:I = 0x1

.field private static final RSV1:I = 0x40

.field private static final RSV2:I = 0x20

.field private static final RSV3:I = 0x10

.field private static final TAG:Ljava/lang/String; = "HybiParser"

.field private static final _2_TO_16_:J = 0x10000L

.field private static final _2_TO_24:J = 0x1000000L

.field private static final _2_TO_32_:J = 0x100000000L

.field private static final _2_TO_40_:J = 0x10000000000L

.field private static final _2_TO_48_:J = 0x1000000000000L

.field private static final _2_TO_56_:J = 0x100000000000000L

.field private static final _2_TO_8_:J = 0x100L


# instance fields
.field private final mBuffer:Ljava/io/ByteArrayOutputStream;

.field private mClosed:Z

.field private mDeflate:Z

.field private mDeflated:Z

.field private mFinal:Z

.field private final mInflateBuffer:[B

.field private mLength:I

.field private mLengthSize:I

.field private mMask:[B

.field private mMasked:Z

.field private mMasking:Z

.field private mMode:I

.field private mOpcode:I

.field private mPayload:[B

.field private mReader:Lcom/koushikdutta/async/DataEmitterReader;

.field private mStage:I

.field mStage0:Lcom/koushikdutta/async/callback/DataCallback;

.field mStage1:Lcom/koushikdutta/async/callback/DataCallback;

.field mStage2:Lcom/koushikdutta/async/callback/DataCallback;

.field mStage3:Lcom/koushikdutta/async/callback/DataCallback;

.field mStage4:Lcom/koushikdutta/async/callback/DataCallback;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 89
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Integer;

    .line 90
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    .line 91
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    .line 92
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v5

    const/16 v1, 0x8

    .line 93
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v6

    const/4 v1, 0x4

    const/16 v2, 0x9

    .line 94
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const/16 v2, 0xa

    .line 95
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 89
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/koushikdutta/async/http/HybiParser;->OPCODES:Ljava/util/List;

    .line 98
    new-array v0, v6, [Ljava/lang/Integer;

    .line 99
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v5

    .line 98
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/koushikdutta/async/http/HybiParser;->FRAGMENTED_OPCODES:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/koushikdutta/async/DataEmitter;)V
    .registers 4
    .param p1, "socket"    # Lcom/koushikdutta/async/DataEmitter;

    .prologue
    const/4 v1, 0x0

    .line 251
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mMasking:Z

    .line 50
    iput-boolean v1, p0, Lcom/koushikdutta/async/http/HybiParser;->mDeflate:Z

    .line 62
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mMask:[B

    .line 63
    new-array v0, v1, [B

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mPayload:[B

    .line 65
    iput-boolean v1, p0, Lcom/koushikdutta/async/http/HybiParser;->mClosed:Z

    .line 67
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mBuffer:Ljava/io/ByteArrayOutputStream;

    .line 68
    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mInflateBuffer:[B

    .line 148
    new-instance v0, Lcom/koushikdutta/async/http/HybiParser$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/HybiParser$1;-><init>(Lcom/koushikdutta/async/http/HybiParser;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage0:Lcom/koushikdutta/async/callback/DataCallback;

    .line 162
    new-instance v0, Lcom/koushikdutta/async/http/HybiParser$2;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/HybiParser$2;-><init>(Lcom/koushikdutta/async/http/HybiParser;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage1:Lcom/koushikdutta/async/callback/DataCallback;

    .line 170
    new-instance v0, Lcom/koushikdutta/async/http/HybiParser$3;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/HybiParser$3;-><init>(Lcom/koushikdutta/async/http/HybiParser;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage2:Lcom/koushikdutta/async/callback/DataCallback;

    .line 186
    new-instance v0, Lcom/koushikdutta/async/http/HybiParser$4;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/HybiParser$4;-><init>(Lcom/koushikdutta/async/http/HybiParser;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage3:Lcom/koushikdutta/async/callback/DataCallback;

    .line 196
    new-instance v0, Lcom/koushikdutta/async/http/HybiParser$5;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/HybiParser$5;-><init>(Lcom/koushikdutta/async/http/HybiParser;)V

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage4:Lcom/koushikdutta/async/callback/DataCallback;

    .line 234
    new-instance v0, Lcom/koushikdutta/async/DataEmitterReader;

    invoke-direct {v0}, Lcom/koushikdutta/async/DataEmitterReader;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mReader:Lcom/koushikdutta/async/DataEmitterReader;

    .line 252
    iget-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mReader:Lcom/koushikdutta/async/DataEmitterReader;

    invoke-interface {p1, v0}, Lcom/koushikdutta/async/DataEmitter;->setDataCallback(Lcom/koushikdutta/async/callback/DataCallback;)V

    .line 253
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/HybiParser;->parse()V

    .line 254
    return-void
.end method

.method static synthetic access$000(Lcom/koushikdutta/async/http/HybiParser;B)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;
    .param p1, "x1"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/async/http/HybiParser$ProtocolError;
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/HybiParser;->parseOpcode(B)V

    return-void
.end method

.method static synthetic access$100(Lcom/koushikdutta/async/http/HybiParser;B)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;
    .param p1, "x1"    # B

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/HybiParser;->parseLength(B)V

    return-void
.end method

.method static synthetic access$200(Lcom/koushikdutta/async/http/HybiParser;)I
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;

    .prologue
    .line 46
    iget v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mLengthSize:I

    return v0
.end method

.method static synthetic access$300(Lcom/koushikdutta/async/http/HybiParser;[B)V
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;
    .param p1, "x1"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/async/http/HybiParser$ProtocolError;
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/HybiParser;->parseExtendedLength([B)V

    return-void
.end method

.method static synthetic access$400(Lcom/koushikdutta/async/http/HybiParser;)[B
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mMask:[B

    return-object v0
.end method

.method static synthetic access$402(Lcom/koushikdutta/async/http/HybiParser;[B)[B
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;
    .param p1, "x1"    # [B

    .prologue
    .line 46
    iput-object p1, p0, Lcom/koushikdutta/async/http/HybiParser;->mMask:[B

    return-object p1
.end method

.method static synthetic access$502(Lcom/koushikdutta/async/http/HybiParser;I)I
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;
    .param p1, "x1"    # I

    .prologue
    .line 46
    iput p1, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage:I

    return p1
.end method

.method static synthetic access$600(Lcom/koushikdutta/async/http/HybiParser;)I
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;

    .prologue
    .line 46
    iget v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mLength:I

    return v0
.end method

.method static synthetic access$700(Lcom/koushikdutta/async/http/HybiParser;)[B
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mPayload:[B

    return-object v0
.end method

.method static synthetic access$702(Lcom/koushikdutta/async/http/HybiParser;[B)[B
    .registers 2
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;
    .param p1, "x1"    # [B

    .prologue
    .line 46
    iput-object p1, p0, Lcom/koushikdutta/async/http/HybiParser;->mPayload:[B

    return-object p1
.end method

.method static synthetic access$800(Lcom/koushikdutta/async/http/HybiParser;)V
    .registers 1
    .param p0, "x0"    # Lcom/koushikdutta/async/http/HybiParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/koushikdutta/async/http/HybiParser;->emitFrame()V

    return-void
.end method

.method private static byteArrayToLong([BII)J
    .registers 9
    .param p0, "b"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I

    .prologue
    .line 514
    array-length v4, p0

    if-ge v4, p2, :cond_b

    .line 515
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "length must be less than or equal to b.length"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 517
    :cond_b
    const-wide/16 v2, 0x0

    .line 518
    .local v2, "value":J
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    if-ge v0, p2, :cond_21

    .line 519
    add-int/lit8 v4, p2, -0x1

    sub-int/2addr v4, v0

    mul-int/lit8 v1, v4, 0x8

    .line 520
    .local v1, "shift":I
    add-int v4, v0, p1

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/2addr v4, v1

    int-to-long v4, v4

    add-long/2addr v2, v4

    .line 518
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 522
    .end local v1    # "shift":I
    :cond_21
    return-wide v2
.end method

.method private decode(Ljava/lang/String;)[B
    .registers 4
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 487
    :try_start_0
    const-string v1, "UTF-8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v1

    return-object v1

    .line 488
    :catch_7
    move-exception v0

    .line 489
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private emitFrame()V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v11, 0xa

    const/4 v0, 0x0

    const/4 v10, 0x1

    const/4 v9, 0x2

    .line 402
    iget-object v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mPayload:[B

    iget-object v8, p0, Lcom/koushikdutta/async/http/HybiParser;->mMask:[B

    invoke-static {v7, v8, v0}, Lcom/koushikdutta/async/http/HybiParser;->mask([B[BI)[B

    move-result-object v5

    .line 403
    .local v5, "payload":[B
    iget-boolean v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mDeflated:Z

    if-eqz v7, :cond_15

    .line 405
    :try_start_11
    invoke-direct {p0, v5}, Lcom/koushikdutta/async/http/HybiParser;->inflate([B)[B
    :try_end_14
    .catch Ljava/util/zip/DataFormatException; {:try_start_11 .. :try_end_14} :catch_25

    move-result-object v5

    .line 410
    :cond_15
    iget v4, p0, Lcom/koushikdutta/async/http/HybiParser;->mOpcode:I

    .line 412
    .local v4, "opcode":I
    if-nez v4, :cond_50

    .line 413
    iget v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mMode:I

    if-nez v7, :cond_2e

    .line 414
    new-instance v7, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;

    const-string v8, "Mode was not set."

    invoke-direct {v7, v8}, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;-><init>(Ljava/lang/String;)V

    throw v7

    .line 406
    .end local v4    # "opcode":I
    :catch_25
    move-exception v1

    .line 407
    .local v1, "e":Ljava/util/zip/DataFormatException;
    new-instance v7, Ljava/io/IOException;

    const-string v8, "Invalid deflated data"

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 416
    .end local v1    # "e":Ljava/util/zip/DataFormatException;
    .restart local v4    # "opcode":I
    :cond_2e
    iget-object v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mBuffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v7, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 417
    iget-boolean v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mFinal:Z

    if-eqz v7, :cond_4b

    .line 418
    iget-object v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mBuffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 419
    .local v2, "message":[B
    iget v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mMode:I

    if-ne v7, v10, :cond_4c

    .line 420
    invoke-direct {p0, v2}, Lcom/koushikdutta/async/http/HybiParser;->encode([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/koushikdutta/async/http/HybiParser;->onMessage(Ljava/lang/String;)V

    .line 424
    :goto_48
    invoke-direct {p0}, Lcom/koushikdutta/async/http/HybiParser;->reset()V

    .line 461
    .end local v2    # "message":[B
    :cond_4b
    :goto_4b
    return-void

    .line 422
    .restart local v2    # "message":[B
    :cond_4c
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/http/HybiParser;->onMessage([B)V

    goto :goto_48

    .line 427
    .end local v2    # "message":[B
    :cond_50
    if-ne v4, v10, :cond_66

    .line 428
    iget-boolean v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mFinal:Z

    if-eqz v7, :cond_5e

    .line 429
    invoke-direct {p0, v5}, Lcom/koushikdutta/async/http/HybiParser;->encode([B)Ljava/lang/String;

    move-result-object v3

    .line 430
    .local v3, "messageText":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/koushikdutta/async/http/HybiParser;->onMessage(Ljava/lang/String;)V

    goto :goto_4b

    .line 432
    .end local v3    # "messageText":Ljava/lang/String;
    :cond_5e
    iput v10, p0, Lcom/koushikdutta/async/http/HybiParser;->mMode:I

    .line 433
    iget-object v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mBuffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v7, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_4b

    .line 436
    :cond_66
    if-ne v4, v9, :cond_78

    .line 437
    iget-boolean v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mFinal:Z

    if-eqz v7, :cond_70

    .line 438
    invoke-virtual {p0, v5}, Lcom/koushikdutta/async/http/HybiParser;->onMessage([B)V

    goto :goto_4b

    .line 440
    :cond_70
    iput v9, p0, Lcom/koushikdutta/async/http/HybiParser;->mMode:I

    .line 441
    iget-object v7, p0, Lcom/koushikdutta/async/http/HybiParser;->mBuffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v7, v5}, Ljava/io/ByteArrayOutputStream;->write([B)V

    goto :goto_4b

    .line 444
    :cond_78
    const/16 v7, 0x8

    if-ne v4, v7, :cond_9c

    .line 445
    array-length v7, v5

    if-lt v7, v9, :cond_8b

    aget-byte v7, v5, v0

    and-int/lit16 v7, v7, 0xff

    mul-int/lit16 v7, v7, 0x100

    aget-byte v8, v5, v10

    and-int/lit16 v8, v8, 0xff

    add-int v0, v7, v8

    .line 446
    .local v0, "code":I
    :cond_8b
    array-length v7, v5

    if-le v7, v9, :cond_9a

    invoke-direct {p0, v5, v9}, Lcom/koushikdutta/async/http/HybiParser;->slice([BI)[B

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/koushikdutta/async/http/HybiParser;->encode([B)Ljava/lang/String;

    move-result-object v6

    .line 448
    .local v6, "reason":Ljava/lang/String;
    :goto_96
    invoke-virtual {p0, v0, v6}, Lcom/koushikdutta/async/http/HybiParser;->onDisconnect(ILjava/lang/String;)V

    goto :goto_4b

    .line 446
    .end local v6    # "reason":Ljava/lang/String;
    :cond_9a
    const/4 v6, 0x0

    goto :goto_96

    .line 450
    .end local v0    # "code":I
    :cond_9c
    const/16 v7, 0x9

    if-ne v4, v7, :cond_bd

    .line 451
    array-length v7, v5

    const/16 v8, 0x7d

    if-le v7, v8, :cond_ad

    new-instance v7, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;

    const-string v8, "Ping payload too large"

    invoke-direct {v7, v8}, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;-><init>(Ljava/lang/String;)V

    throw v7

    .line 453
    :cond_ad
    invoke-direct {p0, v5}, Lcom/koushikdutta/async/http/HybiParser;->encode([B)Ljava/lang/String;

    move-result-object v2

    .line 454
    .local v2, "message":Ljava/lang/String;
    const/4 v7, -0x1

    invoke-direct {p0, v11, v5, v7}, Lcom/koushikdutta/async/http/HybiParser;->frame(I[BI)[B

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/koushikdutta/async/http/HybiParser;->sendFrame([B)V

    .line 455
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/http/HybiParser;->onPing(Ljava/lang/String;)V

    goto :goto_4b

    .line 456
    .end local v2    # "message":Ljava/lang/String;
    :cond_bd
    if-ne v4, v11, :cond_4b

    .line 457
    invoke-direct {p0, v5}, Lcom/koushikdutta/async/http/HybiParser;->encode([B)Ljava/lang/String;

    move-result-object v2

    .line 458
    .restart local v2    # "message":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/http/HybiParser;->onPong(Ljava/lang/String;)V

    goto :goto_4b
.end method

.method private encode([B)Ljava/lang/String;
    .registers 5
    .param p1, "buffer"    # [B

    .prologue
    .line 479
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    invoke-direct {v1, p1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_7} :catch_8

    return-object v1

    .line 480
    :catch_8
    move-exception v0

    .line 481
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private frame(ILjava/lang/String;I)[B
    .registers 5
    .param p1, "opcode"    # I
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "errorCode"    # I

    .prologue
    .line 340
    invoke-direct {p0, p2}, Lcom/koushikdutta/async/http/HybiParser;->decode(Ljava/lang/String;)[B

    move-result-object v0

    invoke-direct {p0, p1, v0, p3}, Lcom/koushikdutta/async/http/HybiParser;->frame(I[BI)[B

    move-result-object v0

    return-object v0
.end method

.method private frame(I[BI)[B
    .registers 10
    .param p1, "opcode"    # I
    .param p2, "data"    # [B
    .param p3, "errorCode"    # I

    .prologue
    .line 328
    const/4 v4, 0x0

    array-length v5, p2

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/http/HybiParser;->frame(I[BIII)[B

    move-result-object v0

    return-object v0
.end method

.method private frame(I[BIII)[B
    .registers 20
    .param p1, "opcode"    # I
    .param p2, "data"    # [B
    .param p3, "errorCode"    # I
    .param p4, "dataOffset"    # I
    .param p5, "dataLength"    # I

    .prologue
    .line 344
    iget-boolean v9, p0, Lcom/koushikdutta/async/http/HybiParser;->mClosed:Z

    if-eqz v9, :cond_6

    const/4 v2, 0x0

    .line 392
    :cond_5
    :goto_5
    return-object v2

    .line 347
    :cond_6
    move-object/from16 v1, p2

    .line 348
    .local v1, "buffer":[B
    if-lez p3, :cond_a4

    const/4 v4, 0x2

    .line 349
    .local v4, "insert":I
    :goto_b
    add-int v9, p5, v4

    sub-int v5, v9, p4

    .line 350
    .local v5, "length":I
    const/16 v9, 0x7d

    if-gt v5, v9, :cond_a7

    const/4 v3, 0x2

    .line 351
    .local v3, "header":I
    :goto_14
    iget-boolean v9, p0, Lcom/koushikdutta/async/http/HybiParser;->mMasking:Z

    if-eqz v9, :cond_b3

    const/4 v9, 0x4

    :goto_19
    add-int v8, v3, v9

    .line 352
    .local v8, "offset":I
    iget-boolean v9, p0, Lcom/koushikdutta/async/http/HybiParser;->mMasking:Z

    if-eqz v9, :cond_b6

    const/16 v7, 0x80

    .line 353
    .local v7, "masked":I
    :goto_21
    add-int v9, v5, v8

    new-array v2, v9, [B

    .line 355
    .local v2, "frame":[B
    const/4 v9, 0x0

    int-to-byte v10, p1

    or-int/lit8 v10, v10, -0x80

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 357
    const/16 v9, 0x7d

    if-gt v5, v9, :cond_b9

    .line 358
    const/4 v9, 0x1

    or-int v10, v7, v5

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 376
    :goto_36
    if-lez p3, :cond_4a

    .line 377
    move/from16 v0, p3

    div-int/lit16 v9, v0, 0x100

    and-int/lit16 v9, v9, 0xff

    int-to-byte v9, v9

    aput-byte v9, v2, v8

    .line 378
    add-int/lit8 v9, v8, 0x1

    move/from16 v0, p3

    and-int/lit16 v10, v0, 0xff

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 381
    :cond_4a
    add-int v9, v8, v4

    sub-int v10, p5, p4

    move/from16 v0, p4

    invoke-static {v1, v0, v2, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 383
    iget-boolean v9, p0, Lcom/koushikdutta/async/http/HybiParser;->mMasking:Z

    if-eqz v9, :cond_5

    .line 384
    const/4 v9, 0x4

    new-array v6, v9, [B

    const/4 v9, 0x0

    .line 385
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    const-wide/high16 v12, 0x4070000000000000L    # 256.0

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->floor(D)D

    move-result-wide v10

    double-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v6, v9

    const/4 v9, 0x1

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    const-wide/high16 v12, 0x4070000000000000L    # 256.0

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->floor(D)D

    move-result-wide v10

    double-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v6, v9

    const/4 v9, 0x2

    .line 386
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    const-wide/high16 v12, 0x4070000000000000L    # 256.0

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->floor(D)D

    move-result-wide v10

    double-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v6, v9

    const/4 v9, 0x3

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    const-wide/high16 v12, 0x4070000000000000L    # 256.0

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->floor(D)D

    move-result-wide v10

    double-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v6, v9

    .line 388
    .local v6, "mask":[B
    const/4 v9, 0x0

    array-length v10, v6

    invoke-static {v6, v9, v2, v3, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 389
    invoke-static {v2, v6, v8}, Lcom/koushikdutta/async/http/HybiParser;->mask([B[BI)[B

    goto/16 :goto_5

    .line 348
    .end local v2    # "frame":[B
    .end local v3    # "header":I
    .end local v4    # "insert":I
    .end local v5    # "length":I
    .end local v6    # "mask":[B
    .end local v7    # "masked":I
    .end local v8    # "offset":I
    :cond_a4
    const/4 v4, 0x0

    goto/16 :goto_b

    .line 350
    .restart local v4    # "insert":I
    .restart local v5    # "length":I
    :cond_a7
    const v9, 0xffff

    if-gt v5, v9, :cond_af

    const/4 v3, 0x4

    goto/16 :goto_14

    :cond_af
    const/16 v3, 0xa

    goto/16 :goto_14

    .line 351
    .restart local v3    # "header":I
    :cond_b3
    const/4 v9, 0x0

    goto/16 :goto_19

    .line 352
    .restart local v8    # "offset":I
    :cond_b6
    const/4 v7, 0x0

    goto/16 :goto_21

    .line 359
    .restart local v2    # "frame":[B
    .restart local v7    # "masked":I
    :cond_b9
    const v9, 0xffff

    if-gt v5, v9, :cond_d2

    .line 360
    const/4 v9, 0x1

    or-int/lit8 v10, v7, 0x7e

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 361
    const/4 v9, 0x2

    div-int/lit16 v10, v5, 0x100

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 362
    const/4 v9, 0x3

    and-int/lit16 v10, v5, 0xff

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    goto/16 :goto_36

    .line 365
    :cond_d2
    const/4 v9, 0x1

    or-int/lit8 v10, v7, 0x7f

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 366
    const/4 v9, 0x2

    int-to-long v10, v5

    const-wide/high16 v12, 0x100000000000000L

    div-long/2addr v10, v12

    const-wide/16 v12, 0xff

    and-long/2addr v10, v12

    long-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 367
    const/4 v9, 0x3

    int-to-long v10, v5

    const-wide/high16 v12, 0x1000000000000L

    div-long/2addr v10, v12

    const-wide/16 v12, 0xff

    and-long/2addr v10, v12

    long-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 368
    const/4 v9, 0x4

    int-to-long v10, v5

    const-wide v12, 0x10000000000L

    div-long/2addr v10, v12

    const-wide/16 v12, 0xff

    and-long/2addr v10, v12

    long-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 369
    const/4 v9, 0x5

    int-to-long v10, v5

    const-wide v12, 0x100000000L

    div-long/2addr v10, v12

    const-wide/16 v12, 0xff

    and-long/2addr v10, v12

    long-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 370
    const/4 v9, 0x6

    int-to-long v10, v5

    const-wide/32 v12, 0x1000000

    div-long/2addr v10, v12

    const-wide/16 v12, 0xff

    and-long/2addr v10, v12

    long-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 371
    const/4 v9, 0x7

    int-to-long v10, v5

    const-wide/32 v12, 0x10000

    div-long/2addr v10, v12

    const-wide/16 v12, 0xff

    and-long/2addr v10, v12

    long-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 372
    const/16 v9, 0x8

    int-to-long v10, v5

    const-wide/16 v12, 0x100

    div-long/2addr v10, v12

    const-wide/16 v12, 0xff

    and-long/2addr v10, v12

    long-to-int v10, v10

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    .line 373
    const/16 v9, 0x9

    and-int/lit16 v10, v5, 0xff

    int-to-byte v10, v10

    aput-byte v10, v2, v9

    goto/16 :goto_36
.end method

.method private getInteger([B)I
    .registers 7
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/async/http/HybiParser$ProtocolError;
        }
    .end annotation

    .prologue
    .line 494
    const/4 v2, 0x0

    array-length v3, p1

    invoke-static {p1, v2, v3}, Lcom/koushikdutta/async/http/HybiParser;->byteArrayToLong([BII)J

    move-result-wide v0

    .line 495
    .local v0, "i":J
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_13

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-lez v2, :cond_2c

    .line 496
    :cond_13
    new-instance v2, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Bad integer: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;-><init>(Ljava/lang/String;)V

    throw v2

    .line 498
    :cond_2c
    long-to-int v2, v0

    return v2
.end method

.method private inflate([B)[B
    .registers 7
    .param p1, "payload"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/zip/DataFormatException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 116
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 118
    .local v1, "inflated":Ljava/io/ByteArrayOutputStream;
    new-instance v2, Ljava/util/zip/Inflater;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 119
    .local v2, "inflater":Ljava/util/zip/Inflater;
    invoke-virtual {v2, p1}, Ljava/util/zip/Inflater;->setInput([B)V

    .line 121
    :goto_f
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v3

    if-nez v3, :cond_21

    .line 122
    iget-object v3, p0, Lcom/koushikdutta/async/http/HybiParser;->mInflateBuffer:[B

    invoke-virtual {v2, v3}, Ljava/util/zip/Inflater;->inflate([B)I

    move-result v0

    .line 123
    .local v0, "chunkSize":I
    iget-object v3, p0, Lcom/koushikdutta/async/http/HybiParser;->mInflateBuffer:[B

    invoke-virtual {v1, v3, v4, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_f

    .line 126
    .end local v0    # "chunkSize":I
    :cond_21
    const/4 v3, 0x4

    new-array v3, v3, [B

    fill-array-data v3, :array_4a

    invoke-virtual {v2, v3}, Ljava/util/zip/Inflater;->setInput([B)V

    .line 128
    :goto_2a
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->needsInput()Z

    move-result v3

    if-nez v3, :cond_3c

    .line 129
    iget-object v3, p0, Lcom/koushikdutta/async/http/HybiParser;->mInflateBuffer:[B

    invoke-virtual {v2, v3}, Ljava/util/zip/Inflater;->inflate([B)I

    move-result v0

    .line 130
    .restart local v0    # "chunkSize":I
    iget-object v3, p0, Lcom/koushikdutta/async/http/HybiParser;->mInflateBuffer:[B

    invoke-virtual {v1, v3, v4, v0}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2a

    .line 134
    .end local v0    # "chunkSize":I
    :cond_3c
    :try_start_3c
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_3f
    .catchall {:try_start_3c .. :try_end_3f} :catchall_44

    move-result-object v3

    .line 136
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->end()V

    return-object v3

    :catchall_44
    move-exception v3

    invoke-virtual {v2}, Ljava/util/zip/Inflater;->end()V

    throw v3

    .line 126
    nop

    :array_4a
    .array-data 1
        0x0t
        0x0t
        -0x1t
        -0x1t
    .end array-data
.end method

.method private static mask([B[BI)[B
    .registers 7
    .param p0, "payload"    # [B
    .param p1, "mask"    # [B
    .param p2, "offset"    # I

    .prologue
    .line 107
    array-length v1, p1

    if-nez v1, :cond_4

    .line 112
    :cond_3
    return-object p0

    .line 109
    :cond_4
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v1, p0

    sub-int/2addr v1, p2

    if-ge v0, v1, :cond_3

    .line 110
    add-int v1, p2, v0

    add-int v2, p2, v0

    aget-byte v2, p0, v2

    rem-int/lit8 v3, v0, 0x4

    aget-byte v3, p1, v3

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, p0, v1

    .line 109
    add-int/lit8 v0, v0, 0x1

    goto :goto_5
.end method

.method private parseExtendedLength([B)V
    .registers 3
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/async/http/HybiParser$ProtocolError;
        }
    .end annotation

    .prologue
    .line 295
    invoke-direct {p0, p1}, Lcom/koushikdutta/async/http/HybiParser;->getInteger([B)I

    move-result v0

    iput v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mLength:I

    .line 296
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mMasked:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x3

    :goto_b
    iput v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage:I

    .line 297
    return-void

    .line 296
    :cond_e
    const/4 v0, 0x4

    goto :goto_b
.end method

.method private parseLength(B)V
    .registers 5
    .param p1, "data"    # B

    .prologue
    const/4 v1, 0x2

    .line 283
    and-int/lit16 v0, p1, 0x80

    const/16 v2, 0x80

    if-ne v0, v2, :cond_20

    const/4 v0, 0x1

    :goto_8
    iput-boolean v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mMasked:Z

    .line 284
    and-int/lit8 v0, p1, 0x7f

    iput v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mLength:I

    .line 286
    iget v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mLength:I

    if-ltz v0, :cond_24

    iget v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mLength:I

    const/16 v2, 0x7d

    if-gt v0, v2, :cond_24

    .line 287
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mMasked:Z

    if-eqz v0, :cond_22

    const/4 v0, 0x3

    :goto_1d
    iput v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage:I

    .line 292
    :goto_1f
    return-void

    .line 283
    :cond_20
    const/4 v0, 0x0

    goto :goto_8

    .line 287
    :cond_22
    const/4 v0, 0x4

    goto :goto_1d

    .line 289
    :cond_24
    iget v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mLength:I

    const/16 v2, 0x7e

    if-ne v0, v2, :cond_30

    move v0, v1

    :goto_2b
    iput v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mLengthSize:I

    .line 290
    iput v1, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage:I

    goto :goto_1f

    .line 289
    :cond_30
    const/16 v0, 0x8

    goto :goto_2b
.end method

.method private parseOpcode(B)V
    .registers 9
    .param p1, "data"    # B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/koushikdutta/async/http/HybiParser$ProtocolError;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 257
    and-int/lit8 v5, p1, 0x40

    const/16 v6, 0x40

    if-ne v5, v6, :cond_29

    move v0, v3

    .line 258
    .local v0, "rsv1":Z
    :goto_9
    and-int/lit8 v5, p1, 0x20

    const/16 v6, 0x20

    if-ne v5, v6, :cond_2b

    move v1, v3

    .line 259
    .local v1, "rsv2":Z
    :goto_10
    and-int/lit8 v5, p1, 0x10

    const/16 v6, 0x10

    if-ne v5, v6, :cond_2d

    move v2, v3

    .line 261
    .local v2, "rsv3":Z
    :goto_17
    iget-boolean v5, p0, Lcom/koushikdutta/async/http/HybiParser;->mDeflate:Z

    if-nez v5, :cond_1d

    if-nez v0, :cond_21

    :cond_1d
    if-nez v1, :cond_21

    if-eqz v2, :cond_2f

    .line 262
    :cond_21
    new-instance v3, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;

    const-string v4, "RSV not zero"

    invoke-direct {v3, v4}, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;-><init>(Ljava/lang/String;)V

    throw v3

    .end local v0    # "rsv1":Z
    .end local v1    # "rsv2":Z
    .end local v2    # "rsv3":Z
    :cond_29
    move v0, v4

    .line 257
    goto :goto_9

    .restart local v0    # "rsv1":Z
    :cond_2b
    move v1, v4

    .line 258
    goto :goto_10

    .restart local v1    # "rsv2":Z
    :cond_2d
    move v2, v4

    .line 259
    goto :goto_17

    .line 265
    .restart local v2    # "rsv3":Z
    :cond_2f
    and-int/lit16 v5, p1, 0x80

    const/16 v6, 0x80

    if-ne v5, v6, :cond_5c

    move v5, v3

    :goto_36
    iput-boolean v5, p0, Lcom/koushikdutta/async/http/HybiParser;->mFinal:Z

    .line 266
    and-int/lit8 v5, p1, 0xf

    iput v5, p0, Lcom/koushikdutta/async/http/HybiParser;->mOpcode:I

    .line 267
    iput-boolean v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mDeflated:Z

    .line 268
    new-array v5, v4, [B

    iput-object v5, p0, Lcom/koushikdutta/async/http/HybiParser;->mMask:[B

    .line 269
    new-array v4, v4, [B

    iput-object v4, p0, Lcom/koushikdutta/async/http/HybiParser;->mPayload:[B

    .line 271
    sget-object v4, Lcom/koushikdutta/async/http/HybiParser;->OPCODES:Ljava/util/List;

    iget v5, p0, Lcom/koushikdutta/async/http/HybiParser;->mOpcode:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5e

    .line 272
    new-instance v3, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;

    const-string v4, "Bad opcode"

    invoke-direct {v3, v4}, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_5c
    move v5, v4

    .line 265
    goto :goto_36

    .line 275
    :cond_5e
    sget-object v4, Lcom/koushikdutta/async/http/HybiParser;->FRAGMENTED_OPCODES:Ljava/util/List;

    iget v5, p0, Lcom/koushikdutta/async/http/HybiParser;->mOpcode:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_78

    iget-boolean v4, p0, Lcom/koushikdutta/async/http/HybiParser;->mFinal:Z

    if-nez v4, :cond_78

    .line 276
    new-instance v3, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;

    const-string v4, "Expected non-final packet"

    invoke-direct {v3, v4}, Lcom/koushikdutta/async/http/HybiParser$ProtocolError;-><init>(Ljava/lang/String;)V

    throw v3

    .line 279
    :cond_78
    iput v3, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage:I

    .line 280
    return-void
.end method

.method private reset()V
    .registers 2

    .prologue
    .line 473
    const/4 v0, 0x0

    iput v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mMode:I

    .line 474
    iget-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mBuffer:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 475
    return-void
.end method

.method private slice([BI)[B
    .registers 6
    .param p1, "array"    # [B
    .param p2, "start"    # I

    .prologue
    .line 502
    array-length v1, p1

    sub-int/2addr v1, p2

    new-array v0, v1, [B

    .line 503
    .local v0, "copy":[B
    const/4 v1, 0x0

    array-length v2, p1

    sub-int/2addr v2, p2

    invoke-static {p1, p2, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 504
    return-object v0
.end method


# virtual methods
.method public close(ILjava/lang/String;)V
    .registers 4
    .param p1, "code"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 396
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mClosed:Z

    if-eqz v0, :cond_5

    .line 399
    :goto_4
    return-void

    .line 397
    :cond_5
    const/16 v0, 0x8

    invoke-direct {p0, v0, p2, p1}, Lcom/koushikdutta/async/http/HybiParser;->frame(ILjava/lang/String;I)[B

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/HybiParser;->sendFrame([B)V

    .line 398
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mClosed:Z

    goto :goto_4
.end method

.method public frame(Ljava/lang/String;)[B
    .registers 4
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 300
    const/4 v0, 0x1

    const/4 v1, -0x1

    invoke-direct {p0, v0, p1, v1}, Lcom/koushikdutta/async/http/HybiParser;->frame(ILjava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public frame([B)[B
    .registers 4
    .param p1, "data"    # [B

    .prologue
    .line 304
    const/4 v0, 0x2

    const/4 v1, -0x1

    invoke-direct {p0, v0, p1, v1}, Lcom/koushikdutta/async/http/HybiParser;->frame(I[BI)[B

    move-result-object v0

    return-object v0
.end method

.method public frame([BII)[B
    .registers 10
    .param p1, "data"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 308
    const/4 v1, 0x2

    const/4 v3, -0x1

    move-object v0, p0

    move-object v2, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/koushikdutta/async/http/HybiParser;->frame(I[BIII)[B

    move-result-object v0

    return-object v0
.end method

.method protected abstract onDisconnect(ILjava/lang/String;)V
.end method

.method protected abstract onMessage(Ljava/lang/String;)V
.end method

.method protected abstract onMessage([B)V
.end method

.method protected abstract onPing(Ljava/lang/String;)V
.end method

.method protected abstract onPong(Ljava/lang/String;)V
.end method

.method parse()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 215
    iget v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage:I

    packed-switch v0, :pswitch_data_34

    .line 232
    :goto_6
    return-void

    .line 217
    :pswitch_7
    iget-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mReader:Lcom/koushikdutta/async/DataEmitterReader;

    iget-object v1, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage0:Lcom/koushikdutta/async/callback/DataCallback;

    invoke-virtual {v0, v2, v1}, Lcom/koushikdutta/async/DataEmitterReader;->read(ILcom/koushikdutta/async/callback/DataCallback;)V

    goto :goto_6

    .line 220
    :pswitch_f
    iget-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mReader:Lcom/koushikdutta/async/DataEmitterReader;

    iget-object v1, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage1:Lcom/koushikdutta/async/callback/DataCallback;

    invoke-virtual {v0, v2, v1}, Lcom/koushikdutta/async/DataEmitterReader;->read(ILcom/koushikdutta/async/callback/DataCallback;)V

    goto :goto_6

    .line 223
    :pswitch_17
    iget-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mReader:Lcom/koushikdutta/async/DataEmitterReader;

    iget v1, p0, Lcom/koushikdutta/async/http/HybiParser;->mLengthSize:I

    iget-object v2, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage2:Lcom/koushikdutta/async/callback/DataCallback;

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/DataEmitterReader;->read(ILcom/koushikdutta/async/callback/DataCallback;)V

    goto :goto_6

    .line 226
    :pswitch_21
    iget-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mReader:Lcom/koushikdutta/async/DataEmitterReader;

    const/4 v1, 0x4

    iget-object v2, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage3:Lcom/koushikdutta/async/callback/DataCallback;

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/DataEmitterReader;->read(ILcom/koushikdutta/async/callback/DataCallback;)V

    goto :goto_6

    .line 229
    :pswitch_2a
    iget-object v0, p0, Lcom/koushikdutta/async/http/HybiParser;->mReader:Lcom/koushikdutta/async/DataEmitterReader;

    iget v1, p0, Lcom/koushikdutta/async/http/HybiParser;->mLength:I

    iget-object v2, p0, Lcom/koushikdutta/async/http/HybiParser;->mStage4:Lcom/koushikdutta/async/callback/DataCallback;

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/DataEmitterReader;->read(ILcom/koushikdutta/async/callback/DataCallback;)V

    goto :goto_6

    .line 215
    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_7
        :pswitch_f
        :pswitch_17
        :pswitch_21
        :pswitch_2a
    .end packed-switch
.end method

.method public pingFrame(Ljava/lang/String;)[B
    .registers 4
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 312
    const/16 v0, 0x9

    const/4 v1, -0x1

    invoke-direct {p0, v0, p1, v1}, Lcom/koushikdutta/async/http/HybiParser;->frame(ILjava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public pongFrame(Ljava/lang/String;)[B
    .registers 4
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 316
    const/16 v0, 0xa

    const/4 v1, -0x1

    invoke-direct {p0, v0, p1, v1}, Lcom/koushikdutta/async/http/HybiParser;->frame(ILjava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method protected abstract report(Ljava/lang/Exception;)V
.end method

.method protected abstract sendFrame([B)V
.end method

.method public setDeflate(Z)V
    .registers 2
    .param p1, "deflate"    # Z

    .prologue
    .line 145
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/HybiParser;->mDeflate:Z

    .line 146
    return-void
.end method

.method public setMasking(Z)V
    .registers 2
    .param p1, "masking"    # Z

    .prologue
    .line 141
    iput-boolean p1, p0, Lcom/koushikdutta/async/http/HybiParser;->mMasking:Z

    .line 142
    return-void
.end method
