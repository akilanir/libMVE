.class public Lzmq/Signaler;
.super Ljava/lang/Object;
.source "Signaler.java"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final r:Ljava/nio/channels/Pipe$SourceChannel;

.field private rcursor:I

.field private final selector:Ljava/nio/channels/Selector;

.field private final w:Ljava/nio/channels/Pipe$SinkChannel;

.field private final wcursor:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-class v0, Lzmq/Signaler;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Signaler;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 6

    .prologue
    const/4 v3, 0x0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v2, p0, Lzmq/Signaler;->wcursor:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 46
    iput v3, p0, Lzmq/Signaler;->rcursor:I

    .line 54
    :try_start_d
    invoke-static {}, Ljava/nio/channels/Pipe;->open()Ljava/nio/channels/Pipe;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_10} :catch_36

    move-result-object v1

    .line 59
    .local v1, "pipe":Ljava/nio/channels/Pipe;
    invoke-virtual {v1}, Ljava/nio/channels/Pipe;->source()Ljava/nio/channels/Pipe$SourceChannel;

    move-result-object v2

    iput-object v2, p0, Lzmq/Signaler;->r:Ljava/nio/channels/Pipe$SourceChannel;

    .line 60
    invoke-virtual {v1}, Ljava/nio/channels/Pipe;->sink()Ljava/nio/channels/Pipe$SinkChannel;

    move-result-object v2

    iput-object v2, p0, Lzmq/Signaler;->w:Ljava/nio/channels/Pipe$SinkChannel;

    .line 64
    :try_start_1d
    iget-object v2, p0, Lzmq/Signaler;->w:Ljava/nio/channels/Pipe$SinkChannel;

    invoke-static {v2}, Lzmq/Utils;->unblockSocket(Ljava/nio/channels/SelectableChannel;)V

    .line 65
    iget-object v2, p0, Lzmq/Signaler;->r:Ljava/nio/channels/Pipe$SourceChannel;

    invoke-static {v2}, Lzmq/Utils;->unblockSocket(Ljava/nio/channels/SelectableChannel;)V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_27} :catch_3d

    .line 72
    :try_start_27
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v2

    iput-object v2, p0, Lzmq/Signaler;->selector:Ljava/nio/channels/Selector;

    .line 73
    iget-object v2, p0, Lzmq/Signaler;->r:Ljava/nio/channels/Pipe$SourceChannel;

    iget-object v3, p0, Lzmq/Signaler;->selector:Ljava/nio/channels/Selector;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Ljava/nio/channels/Pipe$SourceChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;
    :try_end_35
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_35} :catch_44

    .line 79
    return-void

    .line 56
    .end local v1    # "pipe":Ljava/nio/channels/Pipe;
    :catch_36
    move-exception v0

    .line 57
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lzmq/ZError$IOException;

    invoke-direct {v2, v0}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v2

    .line 67
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v1    # "pipe":Ljava/nio/channels/Pipe;
    :catch_3d
    move-exception v0

    .line 68
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v2, Lzmq/ZError$IOException;

    invoke-direct {v2, v0}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v2

    .line 75
    .end local v0    # "e":Ljava/io/IOException;
    :catch_44
    move-exception v0

    .line 76
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v2, Lzmq/ZError$IOException;

    invoke-direct {v2, v0}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v2
.end method


# virtual methods
.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    const/4 v1, 0x0

    .line 86
    .local v1, "exception":Ljava/io/IOException;
    :try_start_1
    iget-object v2, p0, Lzmq/Signaler;->r:Ljava/nio/channels/Pipe$SourceChannel;

    invoke-virtual {v2}, Ljava/nio/channels/Pipe$SourceChannel;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_6} :catch_13

    .line 92
    :goto_6
    :try_start_6
    iget-object v2, p0, Lzmq/Signaler;->w:Ljava/nio/channels/Pipe$SinkChannel;

    invoke-virtual {v2}, Ljava/nio/channels/Pipe$SinkChannel;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_b} :catch_16

    .line 98
    :goto_b
    :try_start_b
    iget-object v2, p0, Lzmq/Signaler;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v2}, Ljava/nio/channels/Selector;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_19

    .line 103
    :goto_10
    if-eqz v1, :cond_1c

    .line 104
    throw v1

    .line 88
    :catch_13
    move-exception v0

    .line 89
    .local v0, "e":Ljava/io/IOException;
    move-object v1, v0

    goto :goto_6

    .line 94
    .end local v0    # "e":Ljava/io/IOException;
    :catch_16
    move-exception v0

    .line 95
    .restart local v0    # "e":Ljava/io/IOException;
    move-object v1, v0

    goto :goto_b

    .line 100
    .end local v0    # "e":Ljava/io/IOException;
    :catch_19
    move-exception v0

    .line 101
    .restart local v0    # "e":Ljava/io/IOException;
    move-object v1, v0

    goto :goto_10

    .line 106
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1c
    return-void
.end method

.method public getFd()Ljava/nio/channels/SelectableChannel;
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Lzmq/Signaler;->r:Ljava/nio/channels/Pipe$SourceChannel;

    return-object v0
.end method

.method public recv()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 169
    const/4 v2, 0x0

    .line 171
    .local v2, "nbytes":I
    const/4 v3, 0x1

    :try_start_3
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 172
    .local v0, "dummy":Ljava/nio/ByteBuffer;
    iget-object v3, p0, Lzmq/Signaler;->r:Ljava/nio/channels/Pipe$SourceChannel;

    invoke-virtual {v3, v0}, Ljava/nio/channels/Pipe$SourceChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v2

    .line 173
    sget-boolean v3, Lzmq/Signaler;->$assertionsDisabled:Z

    if-nez v3, :cond_20

    if-eq v2, v4, :cond_20

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_19} :catch_19

    .line 175
    .end local v0    # "dummy":Ljava/nio/ByteBuffer;
    :catch_19
    move-exception v1

    .line 176
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lzmq/ZError$IOException;

    invoke-direct {v3, v1}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v3

    .line 178
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "dummy":Ljava/nio/ByteBuffer;
    :cond_20
    iget v3, p0, Lzmq/Signaler;->rcursor:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lzmq/Signaler;->rcursor:I

    .line 179
    return-void
.end method

.method public send()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 115
    const/4 v2, 0x0

    .line 116
    .local v2, "nbytes":I
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 120
    .local v0, "dummy":Ljava/nio/ByteBuffer;
    :cond_6
    :try_start_6
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 121
    iget-object v3, p0, Lzmq/Signaler;->w:Ljava/nio/channels/Pipe$SinkChannel;

    invoke-virtual {v3, v0}, Ljava/nio/channels/Pipe$SinkChannel;->write(Ljava/nio/ByteBuffer;)I
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_e} :catch_1d

    move-result v2

    .line 126
    if-eqz v2, :cond_6

    .line 129
    sget-boolean v3, Lzmq/Signaler;->$assertionsDisabled:Z

    if-nez v3, :cond_24

    if-eq v2, v4, :cond_24

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 123
    :catch_1d
    move-exception v1

    .line 124
    .local v1, "e":Ljava/io/IOException;
    new-instance v3, Lzmq/ZError$IOException;

    invoke-direct {v3, v1}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v3

    .line 130
    .end local v1    # "e":Ljava/io/IOException;
    :cond_24
    iget-object v3, p0, Lzmq/Signaler;->wcursor:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 133
    return-void
.end method

.method public waitEvent(J)Z
    .registers 10
    .param p1, "timeout"    # J

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    const-wide/16 v5, 0x0

    .line 137
    const/4 v1, 0x0

    .line 140
    .local v1, "rc":I
    cmp-long v4, p1, v5

    if-nez v4, :cond_16

    .line 144
    :try_start_9
    iget v4, p0, Lzmq/Signaler;->rcursor:I

    iget-object v5, p0, Lzmq/Signaler;->wcursor:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v5

    if-ge v4, v5, :cond_14

    .line 164
    :goto_13
    return v2

    :cond_14
    move v2, v3

    .line 144
    goto :goto_13

    .line 147
    :cond_16
    cmp-long v4, p1, v5

    if-gez v4, :cond_26

    .line 148
    iget-object v4, p0, Lzmq/Signaler;->selector:Ljava/nio/channels/Selector;

    const-wide/16 v5, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/nio/channels/Selector;->select(J)I

    move-result v1

    .line 158
    :goto_22
    if-nez v1, :cond_34

    move v2, v3

    .line 159
    goto :goto_13

    .line 151
    :cond_26
    iget-object v4, p0, Lzmq/Signaler;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v4, p1, p2}, Ljava/nio/channels/Selector;->select(J)I
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_2b} :catch_2d

    move-result v1

    goto :goto_22

    .line 154
    :catch_2d
    move-exception v0

    .line 155
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lzmq/ZError$IOException;

    invoke-direct {v2, v0}, Lzmq/ZError$IOException;-><init>(Ljava/io/IOException;)V

    throw v2

    .line 162
    .end local v0    # "e":Ljava/io/IOException;
    :cond_34
    iget-object v3, p0, Lzmq/Signaler;->selector:Ljava/nio/channels/Selector;

    invoke-virtual {v3}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->clear()V

    goto :goto_13
.end method
