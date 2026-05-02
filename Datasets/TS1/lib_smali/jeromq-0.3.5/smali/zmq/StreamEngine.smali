.class public Lzmq/StreamEngine;
.super Ljava/lang/Object;
.source "StreamEngine.java"

# interfaces
.implements Lzmq/IEngine;
.implements Lzmq/IPollEvents;
.implements Lzmq/IMsgSink;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final GREETING_SIZE:I = 0xc


# instance fields
.field private decoder:Lzmq/DecoderBase;

.field private encoder:Lzmq/EncoderBase;

.field private endpoint:Ljava/lang/String;

.field private final greeting:Ljava/nio/ByteBuffer;

.field private final greetingOutputBuffer:Ljava/nio/ByteBuffer;

.field private handle:Ljava/nio/channels/SocketChannel;

.field private handshaking:Z

.field private inbuf:Ljava/nio/ByteBuffer;

.field private insize:I

.field private ioEnabled:Z

.field private ioObject:Lzmq/IOObject;

.field private options:Lzmq/Options;

.field private outbuf:Lzmq/Transfer;

.field private outsize:I

.field private plugged:Z

.field private session:Lzmq/SessionBase;

.field private socket:Lzmq/SocketBase;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    const-class v0, Lzmq/StreamEngine;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/StreamEngine;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/nio/channels/SocketChannel;Lzmq/Options;Ljava/lang/String;)V
    .registers 9
    .param p1, "handle"    # Ljava/nio/channels/SocketChannel;
    .param p2, "options"    # Lzmq/Options;
    .param p3, "endpoint"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0xc

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    .line 83
    iput-object v3, p0, Lzmq/StreamEngine;->inbuf:Ljava/nio/ByteBuffer;

    .line 84
    iput v2, p0, Lzmq/StreamEngine;->insize:I

    .line 85
    iput-boolean v2, p0, Lzmq/StreamEngine;->ioEnabled:Z

    .line 86
    iput-object v3, p0, Lzmq/StreamEngine;->outbuf:Lzmq/Transfer;

    .line 87
    iput v2, p0, Lzmq/StreamEngine;->outsize:I

    .line 88
    const/4 v1, 0x1

    iput-boolean v1, p0, Lzmq/StreamEngine;->handshaking:Z

    .line 89
    iput-object v3, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    .line 90
    iput-object p2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    .line 91
    iput-boolean v2, p0, Lzmq/StreamEngine;->plugged:Z

    .line 92
    iput-object p3, p0, Lzmq/StreamEngine;->endpoint:Ljava/lang/String;

    .line 93
    iput-object v3, p0, Lzmq/StreamEngine;->socket:Lzmq/SocketBase;

    .line 94
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    .line 95
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    sget-object v2, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    .line 96
    iput-object v3, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    .line 97
    iput-object v3, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    .line 101
    :try_start_3c
    iget-object v1, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-static {v1}, Lzmq/Utils;->unblockSocket(Ljava/nio/channels/SelectableChannel;)V

    .line 104
    iget-object v1, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget v1, v1, Lzmq/Options;->sndbuf:I

    if-eqz v1, :cond_54

    .line 105
    iget-object v1, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v1

    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget v2, v2, Lzmq/Options;->sndbuf:I

    invoke-virtual {v1, v2}, Ljava/net/Socket;->setSendBufferSize(I)V

    .line 107
    :cond_54
    iget-object v1, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget v1, v1, Lzmq/Options;->rcvbuf:I

    if-eqz v1, :cond_67

    .line 108
    iget-object v1, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1}, Ljava/nio/channels/SocketChannel;->socket()Ljava/net/Socket;

    move-result-object v1

    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget v2, v2, Lzmq/Options;->rcvbuf:I

    invoke-virtual {v1, v2}, Ljava/net/Socket;->setReceiveBufferSize(I)V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_67} :catch_68

    .line 114
    :cond_67
    return-void

    .line 111
    :catch_68
    move-exception v0

    .line 112
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lzmq/ZError$IOException;

    invoke-direct {v1, v0}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v1
.end method

.method private error()V
    .registers 4

    .prologue
    .line 599
    sget-boolean v0, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-object v0, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 600
    :cond_e
    iget-object v0, p0, Lzmq/StreamEngine;->socket:Lzmq/SocketBase;

    iget-object v1, p0, Lzmq/StreamEngine;->endpoint:Ljava/lang/String;

    iget-object v2, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1, v2}, Lzmq/SocketBase;->eventDisconnected(Ljava/lang/String;Ljava/nio/channels/SelectableChannel;)V

    .line 601
    iget-object v0, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v0}, Lzmq/SessionBase;->detach()V

    .line 602
    invoke-direct {p0}, Lzmq/StreamEngine;->unplug()V

    .line 603
    invoke-virtual {p0}, Lzmq/StreamEngine;->destroy()V

    .line 604
    return-void
.end method

.method private handshake()Z
    .registers 12

    .prologue
    .line 460
    sget-boolean v0, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v0, :cond_18

    iget-boolean v0, p0, Lzmq/StreamEngine;->handshaking:Z

    if-nez v0, :cond_18

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 481
    .local v7, "n":I
    :cond_e
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_a8

    .line 463
    .end local v7    # "n":I
    :cond_18
    :goto_18
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    const/16 v1, 0xc

    if-ge v0, v1, :cond_41

    .line 464
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    invoke-direct {p0, v0}, Lzmq/StreamEngine;->read(Ljava/nio/ByteBuffer;)I

    move-result v7

    .line 465
    .restart local v7    # "n":I
    const/4 v0, -0x1

    if-ne v7, v0, :cond_30

    .line 466
    invoke-direct {p0}, Lzmq/StreamEngine;->error()V

    .line 467
    const/4 v0, 0x0

    .line 570
    .end local v7    # "n":I
    :goto_2f
    return v0

    .line 470
    .restart local v7    # "n":I
    :cond_30
    if-nez v7, :cond_34

    .line 471
    const/4 v0, 0x0

    goto :goto_2f

    .line 477
    :cond_34
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0xff

    if-eq v0, v1, :cond_e

    .line 509
    .end local v7    # "n":I
    :cond_41
    const/16 v10, 0xa

    .line 514
    .local v10, "versionPos":I
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    const/16 v1, 0xff

    if-ne v0, v1, :cond_5c

    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_131

    .line 515
    :cond_5c
    sget-object v0, Lzmq/Config;->OUT_BATCH_SIZE:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lzmq/StreamEngine;->newEncoder(ILzmq/SessionBase;I)Lzmq/EncoderBase;

    move-result-object v0

    iput-object v0, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    .line 516
    iget-object v0, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    iget-object v1, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v0, v1}, Lzmq/EncoderBase;->setMsgSource(Lzmq/IMsgSource;)V

    .line 518
    sget-object v0, Lzmq/Config;->IN_BATCH_SIZE:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v1

    iget-object v0, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-wide v2, v0, Lzmq/Options;->maxMsgSize:J

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lzmq/StreamEngine;->newDecoder(IJLzmq/SessionBase;I)Lzmq/DecoderBase;

    move-result-object v0

    iput-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    .line 519
    iget-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    iget-object v1, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v0, v1}, Lzmq/DecoderBase;->setMsgSink(Lzmq/IMsgSink;)V

    .line 525
    iget-object v0, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-byte v0, v0, Lzmq/Options;->identitySize:B

    add-int/lit8 v0, v0, 0x1

    const/16 v1, 0xff

    if-lt v0, v1, :cond_f9

    const/16 v6, 0xa

    .line 526
    .local v6, "headerSize":I
    :goto_97
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 527
    .local v9, "tmp":Ljava/nio/ByteBuffer;
    iget-object v0, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    invoke-virtual {v0, v9}, Lzmq/EncoderBase;->getData(Ljava/nio/ByteBuffer;)Lzmq/Transfer;

    .line 528
    invoke-virtual {v9}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-eq v0, v6, :cond_fb

    .line 529
    const/4 v0, 0x0

    goto :goto_2f

    .line 489
    .end local v6    # "headerSize":I
    .end local v9    # "tmp":Ljava/nio/ByteBuffer;
    .end local v10    # "versionPos":I
    .restart local v7    # "n":I
    :cond_a8
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_41

    .line 495
    iget-object v0, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    const/16 v1, 0xc

    if-ge v0, v1, :cond_18

    .line 496
    iget v0, p0, Lzmq/StreamEngine;->outsize:I

    if-nez v0, :cond_c9

    .line 497
    iget-object v0, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v1, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1}, Lzmq/IOObject;->setPollOut(Ljava/nio/channels/SelectableChannel;)V

    .line 499
    :cond_c9
    iget-object v0, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v8

    .line 500
    .local v8, "pos":I
    iget-object v0, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    .line 501
    iget-object v0, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 502
    iget-object v0, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget v1, v1, Lzmq/Options;->type:I

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 503
    iget-object v0, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v8}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 504
    iget v0, p0, Lzmq/StreamEngine;->outsize:I

    add-int/lit8 v0, v0, 0x2

    iput v0, p0, Lzmq/StreamEngine;->outsize:I

    goto/16 :goto_18

    .line 525
    .end local v7    # "n":I
    .end local v8    # "pos":I
    .restart local v10    # "versionPos":I
    :cond_f9
    const/4 v6, 0x2

    goto :goto_97

    .line 533
    .restart local v6    # "headerSize":I
    .restart local v9    # "tmp":Ljava/nio/ByteBuffer;
    :cond_fb
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    iput-object v0, p0, Lzmq/StreamEngine;->inbuf:Ljava/nio/ByteBuffer;

    .line 534
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 535
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    iput v0, p0, Lzmq/StreamEngine;->insize:I

    .line 542
    iget-object v0, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->type:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_11b

    iget-object v0, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget v0, v0, Lzmq/Options;->type:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_120

    .line 543
    :cond_11b
    iget-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    invoke-virtual {v0, p0}, Lzmq/DecoderBase;->setMsgSink(Lzmq/IMsgSink;)V

    .line 562
    .end local v6    # "headerSize":I
    .end local v9    # "tmp":Ljava/nio/ByteBuffer;
    :cond_120
    :goto_120
    iget v0, p0, Lzmq/StreamEngine;->outsize:I

    if-nez v0, :cond_12b

    .line 563
    iget-object v0, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v1, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1}, Lzmq/IOObject;->setPollOut(Ljava/nio/channels/SelectableChannel;)V

    .line 568
    :cond_12b
    const/4 v0, 0x0

    iput-boolean v0, p0, Lzmq/StreamEngine;->handshaking:Z

    .line 570
    const/4 v0, 0x1

    goto/16 :goto_2f

    .line 547
    :cond_131
    iget-object v0, p0, Lzmq/StreamEngine;->greeting:Ljava/nio/ByteBuffer;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    if-nez v0, :cond_16b

    .line 549
    sget-object v0, Lzmq/Config;->OUT_BATCH_SIZE:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lzmq/StreamEngine;->newEncoder(ILzmq/SessionBase;I)Lzmq/EncoderBase;

    move-result-object v0

    iput-object v0, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    .line 550
    iget-object v0, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    iget-object v1, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v0, v1}, Lzmq/EncoderBase;->setMsgSource(Lzmq/IMsgSource;)V

    .line 552
    sget-object v0, Lzmq/Config;->IN_BATCH_SIZE:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v1

    iget-object v0, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-wide v2, v0, Lzmq/Options;->maxMsgSize:J

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lzmq/StreamEngine;->newDecoder(IJLzmq/SessionBase;I)Lzmq/DecoderBase;

    move-result-object v0

    iput-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    .line 553
    iget-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    iget-object v1, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v0, v1}, Lzmq/DecoderBase;->setMsgSink(Lzmq/IMsgSink;)V

    goto :goto_120

    .line 557
    :cond_16b
    sget-object v0, Lzmq/Config;->OUT_BATCH_SIZE:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v0

    iget-object v1, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lzmq/StreamEngine;->newEncoder(ILzmq/SessionBase;I)Lzmq/EncoderBase;

    move-result-object v0

    iput-object v0, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    .line 559
    sget-object v0, Lzmq/Config;->IN_BATCH_SIZE:Lzmq/Config;

    invoke-virtual {v0}, Lzmq/Config;->getValue()I

    move-result v1

    iget-object v0, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-wide v2, v0, Lzmq/Options;->maxMsgSize:J

    iget-object v4, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    const/4 v5, 0x1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lzmq/StreamEngine;->newDecoder(IJLzmq/SessionBase;I)Lzmq/DecoderBase;

    move-result-object v0

    iput-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    goto :goto_120
.end method

.method private newDecoder(IJLzmq/SessionBase;I)Lzmq/DecoderBase;
    .registers 12
    .param p1, "size"    # I
    .param p2, "max"    # J
    .param p4, "session"    # Lzmq/SessionBase;
    .param p5, "version"    # I

    .prologue
    const/4 v3, 0x1

    .line 118
    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-object v2, v2, Lzmq/Options;->decoder:Ljava/lang/Class;

    if-nez v2, :cond_15

    .line 119
    if-ne p5, v3, :cond_f

    .line 120
    new-instance v2, Lzmq/V1Decoder;

    invoke-direct {v2, p1, p2, p3, p4}, Lzmq/V1Decoder;-><init>(IJLzmq/IMsgSink;)V

    .line 134
    :goto_e
    return-object v2

    .line 122
    :cond_f
    new-instance v2, Lzmq/Decoder;

    invoke-direct {v2, p1, p2, p3}, Lzmq/Decoder;-><init>(IJ)V

    goto :goto_e

    .line 128
    :cond_15
    if-nez p5, :cond_44

    .line 129
    :try_start_17
    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-object v2, v2, Lzmq/Options;->decoder:Ljava/lang/Class;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 130
    .local v0, "dcon":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lzmq/DecoderBase;>;"
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/DecoderBase;

    goto :goto_e

    .line 133
    .end local v0    # "dcon":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lzmq/DecoderBase;>;"
    :cond_44
    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-object v2, v2, Lzmq/Options;->decoder:Ljava/lang/Class;

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    sget-object v5, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    const-class v5, Lzmq/IMsgSink;

    aput-object v5, v3, v4

    const/4 v4, 0x3

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 134
    .restart local v0    # "dcon":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lzmq/DecoderBase;>;"
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p4, v2, v3

    const/4 v3, 0x3

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/DecoderBase;
    :try_end_84
    .catch Ljava/lang/SecurityException; {:try_start_17 .. :try_end_84} :catch_85
    .catch Ljava/lang/NoSuchMethodException; {:try_start_17 .. :try_end_84} :catch_8c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_17 .. :try_end_84} :catch_93
    .catch Ljava/lang/IllegalAccessException; {:try_start_17 .. :try_end_84} :catch_9a
    .catch Ljava/lang/InstantiationException; {:try_start_17 .. :try_end_84} :catch_a1

    goto :goto_e

    .line 137
    .end local v0    # "dcon":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lzmq/DecoderBase;>;"
    :catch_85
    move-exception v1

    .line 138
    .local v1, "e":Ljava/lang/SecurityException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v1}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 140
    .end local v1    # "e":Ljava/lang/SecurityException;
    :catch_8c
    move-exception v1

    .line 141
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v1}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 143
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :catch_93
    move-exception v1

    .line 144
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v1}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 146
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_9a
    move-exception v1

    .line 147
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v1}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 149
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_a1
    move-exception v1

    .line 150
    .local v1, "e":Ljava/lang/InstantiationException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v1}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private newEncoder(ILzmq/SessionBase;I)Lzmq/EncoderBase;
    .registers 10
    .param p1, "size"    # I
    .param p2, "session"    # Lzmq/SessionBase;
    .param p3, "version"    # I

    .prologue
    const/4 v3, 0x1

    .line 156
    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-object v2, v2, Lzmq/Options;->encoder:Ljava/lang/Class;

    if-nez v2, :cond_15

    .line 157
    if-ne p3, v3, :cond_f

    .line 158
    new-instance v2, Lzmq/V1Encoder;

    invoke-direct {v2, p1, p2}, Lzmq/V1Encoder;-><init>(ILzmq/IMsgSource;)V

    .line 172
    :goto_e
    return-object v2

    .line 160
    :cond_f
    new-instance v2, Lzmq/Encoder;

    invoke-direct {v2, p1}, Lzmq/Encoder;-><init>(I)V

    goto :goto_e

    .line 166
    :cond_15
    if-nez p3, :cond_38

    .line 167
    :try_start_17
    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-object v2, v2, Lzmq/Options;->encoder:Ljava/lang/Class;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 168
    .local v1, "econ":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lzmq/EncoderBase;>;"
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/EncoderBase;

    goto :goto_e

    .line 171
    .end local v1    # "econ":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lzmq/EncoderBase;>;"
    :cond_38
    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-object v2, v2, Lzmq/Options;->encoder:Ljava/lang/Class;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Lzmq/IMsgSource;

    aput-object v5, v3, v4

    const/4 v4, 0x2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 172
    .restart local v1    # "econ":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lzmq/EncoderBase;>;"
    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzmq/EncoderBase;
    :try_end_6c
    .catch Ljava/lang/SecurityException; {:try_start_17 .. :try_end_6c} :catch_6d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_17 .. :try_end_6c} :catch_74
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_17 .. :try_end_6c} :catch_7b
    .catch Ljava/lang/IllegalAccessException; {:try_start_17 .. :try_end_6c} :catch_82
    .catch Ljava/lang/InstantiationException; {:try_start_17 .. :try_end_6c} :catch_89

    goto :goto_e

    .line 175
    .end local v1    # "econ":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<+Lzmq/EncoderBase;>;"
    :catch_6d
    move-exception v0

    .line 176
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v0}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 178
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_74
    move-exception v0

    .line 179
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v0}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 181
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_7b
    move-exception v0

    .line 182
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v0}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 184
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_82
    move-exception v0

    .line 185
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v0}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 187
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_89
    move-exception v0

    .line 188
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v2, Lzmq/ZError$InstantiationException;

    invoke-direct {v2, v0}, Lzmq/ZError$InstantiationException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private read(Ljava/nio/ByteBuffer;)I
    .registers 5
    .param p1, "buf"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 623
    :try_start_0
    iget-object v2, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, p1}, Ljava/nio/channels/SocketChannel;->read(Ljava/nio/ByteBuffer;)I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 629
    :goto_6
    return v1

    .line 625
    :catch_7
    move-exception v0

    .line 626
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, -0x1

    goto :goto_6
.end method

.method private unplug()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 254
    sget-boolean v0, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    iget-boolean v0, p0, Lzmq/StreamEngine;->plugged:Z

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 255
    :cond_10
    iput-boolean v3, p0, Lzmq/StreamEngine;->plugged:Z

    .line 258
    iget-boolean v0, p0, Lzmq/StreamEngine;->ioEnabled:Z

    if-eqz v0, :cond_1f

    .line 259
    iget-object v0, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v1, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1}, Lzmq/IOObject;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 260
    iput-boolean v3, p0, Lzmq/StreamEngine;->ioEnabled:Z

    .line 264
    :cond_1f
    iget-object v0, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    invoke-virtual {v0}, Lzmq/IOObject;->unplug()V

    .line 267
    iget-object v0, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    if-eqz v0, :cond_2d

    .line 268
    iget-object v0, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    invoke-virtual {v0, v2}, Lzmq/EncoderBase;->setMsgSource(Lzmq/IMsgSource;)V

    .line 270
    :cond_2d
    iget-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    if-eqz v0, :cond_36

    .line 271
    iget-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    invoke-virtual {v0, v2}, Lzmq/DecoderBase;->setMsgSink(Lzmq/IMsgSink;)V

    .line 273
    :cond_36
    iput-object v2, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    .line 274
    return-void
.end method

.method private write(Lzmq/Transfer;)I
    .registers 5
    .param p1, "buf"    # Lzmq/Transfer;

    .prologue
    .line 610
    :try_start_0
    iget-object v2, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-interface {p1, v2}, Lzmq/Transfer;->transferTo(Ljava/nio/channels/WritableByteChannel;)I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 616
    :goto_6
    return v1

    .line 612
    :catch_7
    move-exception v0

    .line 613
    .local v0, "e":Ljava/io/IOException;
    const/4 v1, -0x1

    goto :goto_6
.end method


# virtual methods
.method public acceptEvent()V
    .registers 2

    .prologue
    .line 417
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public activateIn()V
    .registers 4

    .prologue
    .line 441
    iget-boolean v0, p0, Lzmq/StreamEngine;->ioEnabled:Z

    if-nez v0, :cond_27

    .line 445
    iget-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    iget-object v1, p0, Lzmq/StreamEngine;->inbuf:Ljava/nio/ByteBuffer;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lzmq/DecoderBase;->processBuffer(Ljava/nio/ByteBuffer;I)I

    .line 446
    sget-boolean v0, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v0, :cond_1e

    iget-object v0, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    invoke-virtual {v0}, Lzmq/DecoderBase;->stalled()Z

    move-result v0

    if-eqz v0, :cond_1e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 447
    :cond_1e
    iget-object v0, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v0}, Lzmq/SessionBase;->flush()V

    .line 448
    invoke-direct {p0}, Lzmq/StreamEngine;->error()V

    .line 456
    :goto_26
    return-void

    .line 452
    :cond_27
    iget-object v0, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v1, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1}, Lzmq/IOObject;->setPollIn(Ljava/nio/channels/SelectableChannel;)V

    .line 455
    iget-object v0, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    invoke-virtual {v0}, Lzmq/IOObject;->inEvent()V

    goto :goto_26
.end method

.method public activateOut()V
    .registers 3

    .prologue
    .line 429
    iget-object v0, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v1, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0, v1}, Lzmq/IOObject;->setPollOut(Ljava/nio/channels/SelectableChannel;)V

    .line 435
    invoke-virtual {p0}, Lzmq/StreamEngine;->outEvent()V

    .line 436
    return-void
.end method

.method public connectEvent()V
    .registers 2

    .prologue
    .line 411
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public destroy()V
    .registers 2

    .prologue
    .line 194
    sget-boolean v0, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-boolean v0, p0, Lzmq/StreamEngine;->plugged:Z

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 196
    :cond_e
    iget-object v0, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    if-eqz v0, :cond_1a

    .line 198
    :try_start_12
    iget-object v0, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v0}, Ljava/nio/channels/SocketChannel;->close()V
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_17} :catch_1b

    .line 202
    :goto_17
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    .line 204
    :cond_1a
    return-void

    .line 200
    :catch_1b
    move-exception v0

    goto :goto_17
.end method

.method public inEvent()V
    .registers 8

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 287
    iget-boolean v2, p0, Lzmq/StreamEngine;->handshaking:Z

    if-eqz v2, :cond_d

    .line 288
    invoke-direct {p0}, Lzmq/StreamEngine;->handshake()Z

    move-result v2

    if-nez v2, :cond_d

    .line 345
    :cond_c
    :goto_c
    return-void

    .line 293
    :cond_d
    sget-boolean v2, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v2, :cond_1b

    iget-object v2, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    if-nez v2, :cond_1b

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 294
    :cond_1b
    const/4 v0, 0x0

    .line 297
    .local v0, "disconnection":Z
    iget v2, p0, Lzmq/StreamEngine;->insize:I

    if-nez v2, :cond_3c

    .line 302
    iget-object v2, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    invoke-virtual {v2}, Lzmq/DecoderBase;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    iput-object v2, p0, Lzmq/StreamEngine;->inbuf:Ljava/nio/ByteBuffer;

    .line 303
    iget-object v2, p0, Lzmq/StreamEngine;->inbuf:Ljava/nio/ByteBuffer;

    invoke-direct {p0, v2}, Lzmq/StreamEngine;->read(Ljava/nio/ByteBuffer;)I

    move-result v2

    iput v2, p0, Lzmq/StreamEngine;->insize:I

    .line 304
    iget-object v2, p0, Lzmq/StreamEngine;->inbuf:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 307
    iget v2, p0, Lzmq/StreamEngine;->insize:I

    if-ne v2, v5, :cond_3c

    .line 308
    iput v6, p0, Lzmq/StreamEngine;->insize:I

    .line 309
    const/4 v0, 0x1

    .line 314
    :cond_3c
    iget-object v2, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    iget-object v3, p0, Lzmq/StreamEngine;->inbuf:Ljava/nio/ByteBuffer;

    iget v4, p0, Lzmq/StreamEngine;->insize:I

    invoke-virtual {v2, v3, v4}, Lzmq/DecoderBase;->processBuffer(Ljava/nio/ByteBuffer;I)I

    move-result v1

    .line 316
    .local v1, "processed":I
    if-ne v1, v5, :cond_62

    .line 317
    const/4 v0, 0x1

    .line 330
    :goto_49
    iget-object v2, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v2}, Lzmq/SessionBase;->flush()V

    .line 336
    if-eqz v0, :cond_c

    .line 337
    iget-object v2, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    invoke-virtual {v2}, Lzmq/DecoderBase;->stalled()Z

    move-result v2

    if-eqz v2, :cond_73

    .line 338
    iget-object v2, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v3, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, v3}, Lzmq/IOObject;->removeHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 339
    iput-boolean v6, p0, Lzmq/StreamEngine;->ioEnabled:Z

    goto :goto_c

    .line 321
    :cond_62
    iget v2, p0, Lzmq/StreamEngine;->insize:I

    if-ge v1, v2, :cond_6d

    .line 322
    iget-object v2, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v3, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, v3}, Lzmq/IOObject;->resetPollIn(Ljava/nio/channels/SelectableChannel;)V

    .line 326
    :cond_6d
    iget v2, p0, Lzmq/StreamEngine;->insize:I

    sub-int/2addr v2, v1

    iput v2, p0, Lzmq/StreamEngine;->insize:I

    goto :goto_49

    .line 342
    :cond_73
    invoke-direct {p0}, Lzmq/StreamEngine;->error()V

    goto :goto_c
.end method

.method public outEvent()V
    .registers 4

    .prologue
    .line 351
    iget v1, p0, Lzmq/StreamEngine;->outsize:I

    if-nez v1, :cond_42

    .line 355
    iget-object v1, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    if-nez v1, :cond_16

    .line 356
    sget-boolean v1, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v1, :cond_41

    iget-boolean v1, p0, Lzmq/StreamEngine;->handshaking:Z

    if-nez v1, :cond_41

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 360
    :cond_16
    iget-object v1, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lzmq/EncoderBase;->getData(Ljava/nio/ByteBuffer;)Lzmq/Transfer;

    move-result-object v1

    iput-object v1, p0, Lzmq/StreamEngine;->outbuf:Lzmq/Transfer;

    .line 361
    iget-object v1, p0, Lzmq/StreamEngine;->outbuf:Lzmq/Transfer;

    invoke-interface {v1}, Lzmq/Transfer;->remaining()I

    move-result v1

    iput v1, p0, Lzmq/StreamEngine;->outsize:I

    .line 363
    iget-object v1, p0, Lzmq/StreamEngine;->outbuf:Lzmq/Transfer;

    invoke-interface {v1}, Lzmq/Transfer;->remaining()I

    move-result v1

    if-nez v1, :cond_42

    .line 364
    iget-object v1, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v2, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1, v2}, Lzmq/IOObject;->resetPollOut(Ljava/nio/channels/SelectableChannel;)V

    .line 367
    iget-object v1, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    invoke-virtual {v1}, Lzmq/EncoderBase;->isError()Z

    move-result v1

    if-eqz v1, :cond_41

    .line 368
    invoke-direct {p0}, Lzmq/StreamEngine;->error()V

    .line 406
    :cond_41
    :goto_41
    return-void

    .line 380
    :cond_42
    iget-object v1, p0, Lzmq/StreamEngine;->outbuf:Lzmq/Transfer;

    invoke-direct {p0, v1}, Lzmq/StreamEngine;->write(Lzmq/Transfer;)I

    move-result v0

    .line 385
    .local v0, "nbytes":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_53

    .line 386
    iget-object v1, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v2, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1, v2}, Lzmq/IOObject;->resetPollOut(Ljava/nio/channels/SelectableChannel;)V

    goto :goto_41

    .line 390
    :cond_53
    iget v1, p0, Lzmq/StreamEngine;->outsize:I

    sub-int/2addr v1, v0

    iput v1, p0, Lzmq/StreamEngine;->outsize:I

    .line 394
    iget-boolean v1, p0, Lzmq/StreamEngine;->handshaking:Z

    if-eqz v1, :cond_67

    .line 395
    iget v1, p0, Lzmq/StreamEngine;->outsize:I

    if-nez v1, :cond_67

    .line 396
    iget-object v1, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v2, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1, v2}, Lzmq/IOObject;->resetPollOut(Ljava/nio/channels/SelectableChannel;)V

    .line 401
    :cond_67
    iget v1, p0, Lzmq/StreamEngine;->outsize:I

    if-nez v1, :cond_41

    .line 402
    iget-object v1, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    if-eqz v1, :cond_41

    iget-object v1, p0, Lzmq/StreamEngine;->encoder:Lzmq/EncoderBase;

    invoke-virtual {v1}, Lzmq/EncoderBase;->isError()Z

    move-result v1

    if-eqz v1, :cond_41

    .line 403
    invoke-direct {p0}, Lzmq/StreamEngine;->error()V

    goto :goto_41
.end method

.method public plug(Lzmq/IOThread;Lzmq/SessionBase;)V
    .registers 8
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "session"    # Lzmq/SessionBase;

    .prologue
    const/4 v1, 0x1

    .line 208
    sget-boolean v2, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v2, :cond_f

    iget-boolean v2, p0, Lzmq/StreamEngine;->plugged:Z

    if-eqz v2, :cond_f

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 209
    :cond_f
    iput-boolean v1, p0, Lzmq/StreamEngine;->plugged:Z

    .line 212
    sget-boolean v2, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v2, :cond_1f

    iget-object v2, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    if-eqz v2, :cond_1f

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 213
    :cond_1f
    sget-boolean v2, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v2, :cond_2b

    if-nez p2, :cond_2b

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 214
    :cond_2b
    iput-object p2, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    .line 215
    iget-object v2, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v2}, Lzmq/SessionBase;->getSocket()Lzmq/SocketBase;

    move-result-object v2

    iput-object v2, p0, Lzmq/StreamEngine;->socket:Lzmq/SocketBase;

    .line 217
    new-instance v2, Lzmq/IOObject;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lzmq/IOObject;-><init>(Lzmq/IOThread;)V

    iput-object v2, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    .line 218
    iget-object v2, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    invoke-virtual {v2, p0}, Lzmq/IOObject;->setHandler(Lzmq/IPollEvents;)V

    .line 220
    iget-object v2, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    invoke-virtual {v2, p1}, Lzmq/IOObject;->plug(Lzmq/IOThread;)V

    .line 221
    iget-object v2, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v3, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, v3}, Lzmq/IOObject;->addHandle(Ljava/nio/channels/SelectableChannel;)V

    .line 222
    iput-boolean v1, p0, Lzmq/StreamEngine;->ioEnabled:Z

    .line 226
    iget-object v2, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 227
    iget-object v2, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    iget-object v3, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-byte v3, v3, Lzmq/Options;->identitySize:B

    add-int/lit8 v3, v3, 0x1

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 228
    iget-object v2, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    const/16 v3, 0x7f

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 230
    iget-object v2, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v3, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v2, v3}, Lzmq/IOObject;->setPollIn(Ljava/nio/channels/SelectableChannel;)V

    .line 232
    const/4 v0, 0x0

    .line 234
    .local v0, "custom":Z
    :try_start_71
    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-object v2, v2, Lzmq/Options;->encoder:Ljava/lang/Class;

    if-eqz v2, :cond_a7

    iget-object v2, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget-object v2, v2, Lzmq/Options;->encoder:Ljava/lang/Class;

    const-string v3, "RAW_ENCODER"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_80
    .catch Ljava/lang/SecurityException; {:try_start_71 .. :try_end_80} :catch_ab
    .catch Ljava/lang/NoSuchFieldException; {:try_start_71 .. :try_end_80} :catch_a9

    move-result-object v2

    if-eqz v2, :cond_a7

    move v0, v1

    .line 241
    :goto_84
    if-nez v0, :cond_a3

    .line 242
    iget-object v1, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    iput v1, p0, Lzmq/StreamEngine;->outsize:I

    .line 243
    iget-object v1, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 244
    new-instance v1, Lzmq/Transfer$ByteBufferTransfer;

    iget-object v2, p0, Lzmq/StreamEngine;->greetingOutputBuffer:Ljava/nio/ByteBuffer;

    invoke-direct {v1, v2}, Lzmq/Transfer$ByteBufferTransfer;-><init>(Ljava/nio/ByteBuffer;)V

    iput-object v1, p0, Lzmq/StreamEngine;->outbuf:Lzmq/Transfer;

    .line 245
    iget-object v1, p0, Lzmq/StreamEngine;->ioObject:Lzmq/IOObject;

    iget-object v2, p0, Lzmq/StreamEngine;->handle:Ljava/nio/channels/SocketChannel;

    invoke-virtual {v1, v2}, Lzmq/IOObject;->setPollOut(Ljava/nio/channels/SelectableChannel;)V

    .line 249
    :cond_a3
    invoke-virtual {p0}, Lzmq/StreamEngine;->inEvent()V

    .line 250
    return-void

    .line 234
    :cond_a7
    const/4 v0, 0x0

    goto :goto_84

    .line 238
    :catch_a9
    move-exception v1

    goto :goto_84

    .line 236
    :catch_ab
    move-exception v1

    goto :goto_84
.end method

.method public pushMsg(Lzmq/Msg;)I
    .registers 6
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    const/4 v3, 0x1

    .line 576
    sget-boolean v1, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v1, :cond_19

    iget-object v1, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget v1, v1, Lzmq/Options;->type:I

    if-eq v1, v3, :cond_19

    iget-object v1, p0, Lzmq/StreamEngine;->options:Lzmq/Options;

    iget v1, v1, Lzmq/Options;->type:I

    const/16 v2, 0x9

    if-eq v1, v2, :cond_19

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 580
    :cond_19
    iget-object v1, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v1, p1}, Lzmq/SessionBase;->pushMsg(Lzmq/Msg;)I

    move-result v0

    .line 581
    .local v0, "rc":I
    sget-boolean v1, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v1, :cond_2b

    if-eqz v0, :cond_2b

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 585
    :cond_2b
    new-instance p1, Lzmq/Msg;

    .end local p1    # "msg":Lzmq/Msg;
    new-array v1, v3, [B

    const/4 v2, 0x0

    aput-byte v3, v1, v2

    invoke-direct {p1, v1}, Lzmq/Msg;-><init>([B)V

    .line 586
    .restart local p1    # "msg":Lzmq/Msg;
    iget-object v1, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v1, p1}, Lzmq/SessionBase;->pushMsg(Lzmq/Msg;)I

    move-result v0

    .line 587
    iget-object v1, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v1}, Lzmq/SessionBase;->flush()V

    .line 591
    sget-boolean v1, Lzmq/StreamEngine;->$assertionsDisabled:Z

    if-nez v1, :cond_4e

    iget-object v1, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    if-nez v1, :cond_4e

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 592
    :cond_4e
    iget-object v1, p0, Lzmq/StreamEngine;->decoder:Lzmq/DecoderBase;

    iget-object v2, p0, Lzmq/StreamEngine;->session:Lzmq/SessionBase;

    invoke-virtual {v1, v2}, Lzmq/DecoderBase;->setMsgSink(Lzmq/IMsgSink;)V

    .line 594
    return v0
.end method

.method public terminate()V
    .registers 1

    .prologue
    .line 279
    invoke-direct {p0}, Lzmq/StreamEngine;->unplug()V

    .line 280
    invoke-virtual {p0}, Lzmq/StreamEngine;->destroy()V

    .line 281
    return-void
.end method

.method public timerEvent(I)V
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 423
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
