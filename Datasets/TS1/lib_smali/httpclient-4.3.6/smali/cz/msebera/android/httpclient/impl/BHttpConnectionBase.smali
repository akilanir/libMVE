.class public Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;
.super Ljava/lang/Object;
.source "BHttpConnectionBase.java"

# interfaces
.implements Lcz/msebera/android/httpclient/HttpConnection;
.implements Lcz/msebera/android/httpclient/HttpInetConnection;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final connMetrics:Lcz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl;

.field private final inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

.field private final incomingContentStrategy:Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

.field private final outbuffer:Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

.field private final outgoingContentStrategy:Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

.field private final socketHolder:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(IILjava/nio/charset/CharsetDecoder;Ljava/nio/charset/CharsetEncoder;Lcz/msebera/android/httpclient/config/MessageConstraints;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;)V
    .registers 15
    .param p1, "buffersize"    # I
    .param p2, "fragmentSizeHint"    # I
    .param p3, "chardecoder"    # Ljava/nio/charset/CharsetDecoder;
    .param p4, "charencoder"    # Ljava/nio/charset/CharsetEncoder;
    .param p5, "constraints"    # Lcz/msebera/android/httpclient/config/MessageConstraints;
    .param p6, "incomingContentStrategy"    # Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;
    .param p7, "outgoingContentStrategy"    # Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    const-string v0, "Buffer size"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->positive(ILjava/lang/String;)I

    .line 113
    new-instance v1, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;

    invoke-direct {v1}, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;-><init>()V

    .line 114
    .local v1, "inTransportMetrics":Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;
    new-instance v6, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;

    invoke-direct {v6}, Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;-><init>()V

    .line 115
    .local v6, "outTransportMetrics":Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;
    new-instance v0, Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    const/4 v3, -0x1

    if-eqz p5, :cond_3d

    move-object v4, p5

    :goto_18
    move v2, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;-><init>(Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;IILcz/msebera/android/httpclient/config/MessageConstraints;Ljava/nio/charset/CharsetDecoder;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    .line 117
    new-instance v0, Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

    invoke-direct {v0, v6, p1, p2, p4}, Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;-><init>(Lcz/msebera/android/httpclient/impl/io/HttpTransportMetricsImpl;IILjava/nio/charset/CharsetEncoder;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outbuffer:Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

    .line 119
    new-instance v0, Lcz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl;

    invoke-direct {v0, v1, v6}, Lcz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl;-><init>(Lcz/msebera/android/httpclient/io/HttpTransportMetrics;Lcz/msebera/android/httpclient/io/HttpTransportMetrics;)V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->connMetrics:Lcz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl;

    .line 120
    if-eqz p6, :cond_40

    .end local p6    # "incomingContentStrategy":Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;
    :goto_2f
    iput-object p6, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->incomingContentStrategy:Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

    .line 122
    if-eqz p7, :cond_43

    .end local p7    # "outgoingContentStrategy":Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;
    :goto_33
    iput-object p7, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outgoingContentStrategy:Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

    .line 124
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    .line 125
    return-void

    .line 115
    .restart local p6    # "incomingContentStrategy":Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;
    .restart local p7    # "outgoingContentStrategy":Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;
    :cond_3d
    sget-object v4, Lcz/msebera/android/httpclient/config/MessageConstraints;->DEFAULT:Lcz/msebera/android/httpclient/config/MessageConstraints;

    goto :goto_18

    .line 120
    :cond_40
    sget-object p6, Lcz/msebera/android/httpclient/impl/entity/LaxContentLengthStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/entity/LaxContentLengthStrategy;

    goto :goto_2f

    .line 122
    .end local p6    # "incomingContentStrategy":Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;
    :cond_43
    sget-object p7, Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;->INSTANCE:Lcz/msebera/android/httpclient/impl/entity/StrictContentLengthStrategy;

    goto :goto_33
.end method

.method private fillInputBuffer(I)I
    .registers 5
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 320
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Socket;

    .line 321
    .local v1, "socket":Ljava/net/Socket;
    invoke-virtual {v1}, Ljava/net/Socket;->getSoTimeout()I

    move-result v0

    .line 323
    .local v0, "oldtimeout":I
    :try_start_c
    invoke-virtual {v1, p1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 324
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    invoke-virtual {v2}, Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;->fillBuffer()I
    :try_end_14
    .catchall {:try_start_c .. :try_end_14} :catchall_19

    move-result v2

    .line 326
    invoke-virtual {v1, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    return v2

    :catchall_19
    move-exception v2

    invoke-virtual {v1, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    throw v2
.end method


# virtual methods
.method protected awaitInput(I)Z
    .registers 3
    .param p1, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 331
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 332
    const/4 v0, 0x1

    .line 335
    :goto_9
    return v0

    .line 334
    :cond_a
    invoke-direct {p0, p1}, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->fillInputBuffer(I)I

    .line 335
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;->hasBufferedData()Z

    move-result v0

    goto :goto_9
.end method

.method protected bind(Ljava/net/Socket;)V
    .registers 4
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 157
    const-string v0, "Socket"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 158
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 159
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;->bind(Ljava/io/InputStream;)V

    .line 160
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outbuffer:Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

    invoke-virtual {v0, v1}, Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;->bind(Ljava/io/OutputStream;)V

    .line 161
    return-void
.end method

.method public close()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 296
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    .line 297
    .local v0, "socket":Ljava/net/Socket;
    if-eqz v0, :cond_1e

    .line 299
    :try_start_b
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;->clear()V

    .line 300
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outbuffer:Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;->flush()V
    :try_end_15
    .catchall {:try_start_b .. :try_end_15} :catchall_1f

    .line 303
    :try_start_15
    invoke-virtual {v0}, Ljava/net/Socket;->shutdownOutput()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_18} :catch_24
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_15 .. :try_end_18} :catch_28
    .catchall {:try_start_15 .. :try_end_18} :catchall_1f

    .line 307
    :goto_18
    :try_start_18
    invoke-virtual {v0}, Ljava/net/Socket;->shutdownInput()V
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_1b} :catch_26
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_18 .. :try_end_1b} :catch_28
    .catchall {:try_start_18 .. :try_end_1b} :catchall_1f

    .line 314
    :goto_1b
    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 317
    :cond_1e
    return-void

    .line 314
    :catchall_1f
    move-exception v1

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    throw v1

    .line 304
    :catch_24
    move-exception v1

    goto :goto_18

    .line 308
    :catch_26
    move-exception v1

    goto :goto_1b

    .line 310
    :catch_28
    move-exception v1

    goto :goto_1b
.end method

.method protected createInputStream(JLcz/msebera/android/httpclient/io/SessionInputBuffer;)Ljava/io/InputStream;
    .registers 6
    .param p1, "len"    # J
    .param p3, "inbuffer"    # Lcz/msebera/android/httpclient/io/SessionInputBuffer;

    .prologue
    .line 203
    const-wide/16 v0, -0x2

    cmp-long v0, p1, v0

    if-nez v0, :cond_c

    .line 204
    new-instance v0, Lcz/msebera/android/httpclient/impl/io/ChunkedInputStream;

    invoke-direct {v0, p3}, Lcz/msebera/android/httpclient/impl/io/ChunkedInputStream;-><init>(Lcz/msebera/android/httpclient/io/SessionInputBuffer;)V

    .line 208
    :goto_b
    return-object v0

    .line 205
    :cond_c
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_18

    .line 206
    new-instance v0, Lcz/msebera/android/httpclient/impl/io/IdentityInputStream;

    invoke-direct {v0, p3}, Lcz/msebera/android/httpclient/impl/io/IdentityInputStream;-><init>(Lcz/msebera/android/httpclient/io/SessionInputBuffer;)V

    goto :goto_b

    .line 208
    :cond_18
    new-instance v0, Lcz/msebera/android/httpclient/impl/io/ContentLengthInputStream;

    invoke-direct {v0, p3, p1, p2}, Lcz/msebera/android/httpclient/impl/io/ContentLengthInputStream;-><init>(Lcz/msebera/android/httpclient/io/SessionInputBuffer;J)V

    goto :goto_b
.end method

.method protected createOutputStream(JLcz/msebera/android/httpclient/io/SessionOutputBuffer;)Ljava/io/OutputStream;
    .registers 6
    .param p1, "len"    # J
    .param p3, "outbuffer"    # Lcz/msebera/android/httpclient/io/SessionOutputBuffer;

    .prologue
    .line 186
    const-wide/16 v0, -0x2

    cmp-long v0, p1, v0

    if-nez v0, :cond_e

    .line 187
    new-instance v0, Lcz/msebera/android/httpclient/impl/io/ChunkedOutputStream;

    const/16 v1, 0x800

    invoke-direct {v0, v1, p3}, Lcz/msebera/android/httpclient/impl/io/ChunkedOutputStream;-><init>(ILcz/msebera/android/httpclient/io/SessionOutputBuffer;)V

    .line 191
    :goto_d
    return-object v0

    .line 188
    :cond_e
    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_1a

    .line 189
    new-instance v0, Lcz/msebera/android/httpclient/impl/io/IdentityOutputStream;

    invoke-direct {v0, p3}, Lcz/msebera/android/httpclient/impl/io/IdentityOutputStream;-><init>(Lcz/msebera/android/httpclient/io/SessionOutputBuffer;)V

    goto :goto_d

    .line 191
    :cond_1a
    new-instance v0, Lcz/msebera/android/httpclient/impl/io/ContentLengthOutputStream;

    invoke-direct {v0, p3, p1, p2}, Lcz/msebera/android/httpclient/impl/io/ContentLengthOutputStream;-><init>(Lcz/msebera/android/httpclient/io/SessionOutputBuffer;J)V

    goto :goto_d
.end method

.method protected doFlush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outbuffer:Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;->flush()V

    .line 173
    return-void
.end method

.method protected ensureOpen()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    .line 129
    .local v0, "socket":Ljava/net/Socket;
    if-eqz v0, :cond_33

    const/4 v1, 0x1

    :goto_b
    const-string v2, "Connection is not open"

    invoke-static {v1, v2}, Lcz/msebera/android/httpclient/util/Asserts;->check(ZLjava/lang/String;)V

    .line 130
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;->isBound()Z

    move-result v1

    if-nez v1, :cond_21

    .line 131
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->getSocketInputStream(Ljava/net/Socket;)Ljava/io/InputStream;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;->bind(Ljava/io/InputStream;)V

    .line 133
    :cond_21
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outbuffer:Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

    invoke-virtual {v1}, Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;->isBound()Z

    move-result v1

    if-nez v1, :cond_32

    .line 134
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outbuffer:Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

    invoke-virtual {p0, v0}, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->getSocketOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;->bind(Ljava/io/OutputStream;)V

    .line 136
    :cond_32
    return-void

    .line 129
    :cond_33
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .registers 3

    .prologue
    .line 243
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    .line 244
    .local v0, "socket":Ljava/net/Socket;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getLocalPort()I
    .registers 3

    .prologue
    .line 248
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    .line 249
    .local v0, "socket":Ljava/net/Socket;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/net/Socket;->getLocalPort()I

    move-result v1

    :goto_e
    return v1

    :cond_f
    const/4 v1, -0x1

    goto :goto_e
.end method

.method public getMetrics()Lcz/msebera/android/httpclient/HttpConnectionMetrics;
    .registers 2

    .prologue
    .line 361
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->connMetrics:Lcz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl;

    return-object v0
.end method

.method public getRemoteAddress()Ljava/net/InetAddress;
    .registers 3

    .prologue
    .line 253
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    .line 254
    .local v0, "socket":Ljava/net/Socket;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v1

    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getRemotePort()I
    .registers 3

    .prologue
    .line 258
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    .line 259
    .local v0, "socket":Ljava/net/Socket;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/net/Socket;->getPort()I

    move-result v1

    :goto_e
    return v1

    :cond_f
    const/4 v1, -0x1

    goto :goto_e
.end method

.method protected getSessionInputBuffer()Lcz/msebera/android/httpclient/io/SessionInputBuffer;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    return-object v0
.end method

.method protected getSessionOutputBuffer()Lcz/msebera/android/httpclient/io/SessionOutputBuffer;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outbuffer:Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

    return-object v0
.end method

.method protected getSocket()Ljava/net/Socket;
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    return-object v0
.end method

.method protected getSocketInputStream(Ljava/net/Socket;)Ljava/io/InputStream;
    .registers 3
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method protected getSocketOutputStream(Ljava/net/Socket;)Ljava/io/OutputStream;
    .registers 3
    .param p1, "socket"    # Ljava/net/Socket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getSocketTimeout()I
    .registers 5

    .prologue
    const/4 v2, -0x1

    .line 276
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Socket;

    .line 277
    .local v1, "socket":Ljava/net/Socket;
    if-eqz v1, :cond_f

    .line 279
    :try_start_b
    invoke-virtual {v1}, Ljava/net/Socket;->getSoTimeout()I
    :try_end_e
    .catch Ljava/net/SocketException; {:try_start_b .. :try_end_e} :catch_10

    move-result v2

    .line 284
    :cond_f
    :goto_f
    return v2

    .line 280
    :catch_10
    move-exception v0

    .line 281
    .local v0, "ignore":Ljava/net/SocketException;
    goto :goto_f
.end method

.method protected incrementRequestCount()V
    .registers 2

    .prologue
    .line 353
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->connMetrics:Lcz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl;->incrementRequestCount()V

    .line 354
    return-void
.end method

.method protected incrementResponseCount()V
    .registers 2

    .prologue
    .line 357
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->connMetrics:Lcz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl;

    invoke-virtual {v0}, Lcz/msebera/android/httpclient/impl/HttpConnectionMetricsImpl;->incrementResponseCount()V

    .line 358
    return-void
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isStale()Z
    .registers 6

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 339
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->isOpen()Z

    move-result v4

    if-nez v4, :cond_9

    .line 348
    :cond_8
    :goto_8
    return v2

    .line 343
    :cond_9
    const/4 v4, 0x1

    :try_start_a
    invoke-direct {p0, v4}, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->fillInputBuffer(I)I
    :try_end_d
    .catch Ljava/net/SocketTimeoutException; {:try_start_a .. :try_end_d} :catch_12
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_d} :catch_15

    move-result v0

    .line 344
    .local v0, "bytesRead":I
    if-ltz v0, :cond_8

    move v2, v3

    goto :goto_8

    .line 345
    .end local v0    # "bytesRead":I
    :catch_12
    move-exception v1

    .local v1, "ex":Ljava/net/SocketTimeoutException;
    move v2, v3

    .line 346
    goto :goto_8

    .line 347
    .end local v1    # "ex":Ljava/net/SocketTimeoutException;
    :catch_15
    move-exception v1

    .line 348
    .local v1, "ex":Ljava/io/IOException;
    goto :goto_8
.end method

.method protected prepareInput(Lcz/msebera/android/httpclient/HttpMessage;)Lcz/msebera/android/httpclient/HttpEntity;
    .registers 13
    .param p1, "message"    # Lcz/msebera/android/httpclient/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const-wide/16 v8, -0x1

    .line 213
    new-instance v2, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;

    invoke-direct {v2}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;-><init>()V

    .line 215
    .local v2, "entity":Lcz/msebera/android/httpclient/entity/BasicHttpEntity;
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->incomingContentStrategy:Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

    invoke-interface {v6, p1}, Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;->determineLength(Lcz/msebera/android/httpclient/HttpMessage;)J

    move-result-wide v4

    .line 216
    .local v4, "len":J
    iget-object v6, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->inbuffer:Lcz/msebera/android/httpclient/impl/io/SessionInputBufferImpl;

    invoke-virtual {p0, v4, v5, v6}, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->createInputStream(JLcz/msebera/android/httpclient/io/SessionInputBuffer;)Ljava/io/InputStream;

    move-result-object v3

    .line 217
    .local v3, "instream":Ljava/io/InputStream;
    const-wide/16 v6, -0x2

    cmp-long v6, v4, v6

    if-nez v6, :cond_3b

    .line 218
    const/4 v6, 0x1

    invoke-virtual {v2, v6}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setChunked(Z)V

    .line 219
    invoke-virtual {v2, v8, v9}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentLength(J)V

    .line 220
    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    .line 231
    :goto_24
    const-string v6, "Content-Type"

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v1

    .line 232
    .local v1, "contentTypeHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v1, :cond_2f

    .line 233
    invoke-virtual {v2, v1}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentType(Lcz/msebera/android/httpclient/Header;)V

    .line 235
    :cond_2f
    const-string v6, "Content-Encoding"

    invoke-interface {p1, v6}, Lcz/msebera/android/httpclient/HttpMessage;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 236
    .local v0, "contentEncodingHeader":Lcz/msebera/android/httpclient/Header;
    if-eqz v0, :cond_3a

    .line 237
    invoke-virtual {v2, v0}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentEncoding(Lcz/msebera/android/httpclient/Header;)V

    .line 239
    :cond_3a
    return-object v2

    .line 221
    .end local v0    # "contentEncodingHeader":Lcz/msebera/android/httpclient/Header;
    .end local v1    # "contentTypeHeader":Lcz/msebera/android/httpclient/Header;
    :cond_3b
    cmp-long v6, v4, v8

    if-nez v6, :cond_49

    .line 222
    invoke-virtual {v2, v10}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setChunked(Z)V

    .line 223
    invoke-virtual {v2, v8, v9}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentLength(J)V

    .line 224
    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    goto :goto_24

    .line 226
    :cond_49
    invoke-virtual {v2, v10}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setChunked(Z)V

    .line 227
    invoke-virtual {v2, v4, v5}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContentLength(J)V

    .line 228
    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/entity/BasicHttpEntity;->setContent(Ljava/io/InputStream;)V

    goto :goto_24
.end method

.method protected prepareOutput(Lcz/msebera/android/httpclient/HttpMessage;)Ljava/io/OutputStream;
    .registers 5
    .param p1, "message"    # Lcz/msebera/android/httpclient/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 196
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outgoingContentStrategy:Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;

    invoke-interface {v2, p1}, Lcz/msebera/android/httpclient/entity/ContentLengthStrategy;->determineLength(Lcz/msebera/android/httpclient/HttpMessage;)J

    move-result-wide v0

    .line 197
    .local v0, "len":J
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->outbuffer:Lcz/msebera/android/httpclient/impl/io/SessionOutputBufferImpl;

    invoke-virtual {p0, v0, v1, v2}, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->createOutputStream(JLcz/msebera/android/httpclient/io/SessionOutputBuffer;)Ljava/io/OutputStream;

    move-result-object v2

    return-object v2
.end method

.method public setSocketTimeout(I)V
    .registers 4
    .param p1, "timeout"    # I

    .prologue
    .line 263
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    .line 264
    .local v0, "socket":Ljava/net/Socket;
    if-eqz v0, :cond_d

    .line 266
    :try_start_a
    invoke-virtual {v0, p1}, Ljava/net/Socket;->setSoTimeout(I)V
    :try_end_d
    .catch Ljava/net/SocketException; {:try_start_a .. :try_end_d} :catch_e

    .line 273
    :cond_d
    :goto_d
    return-void

    .line 267
    :catch_e
    move-exception v1

    goto :goto_d
.end method

.method public shutdown()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Socket;

    .line 290
    .local v0, "socket":Ljava/net/Socket;
    if-eqz v0, :cond_e

    .line 291
    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 293
    :cond_e
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 366
    iget-object v4, p0, Lcz/msebera/android/httpclient/impl/BHttpConnectionBase;->socketHolder:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/net/Socket;

    .line 367
    .local v3, "socket":Ljava/net/Socket;
    if-eqz v3, :cond_2b

    .line 368
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 369
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v2

    .line 370
    .local v2, "remoteAddress":Ljava/net/SocketAddress;
    invoke-virtual {v3}, Ljava/net/Socket;->getLocalSocketAddress()Ljava/net/SocketAddress;

    move-result-object v1

    .line 371
    .local v1, "localAddress":Ljava/net/SocketAddress;
    if-eqz v2, :cond_26

    if-eqz v1, :cond_26

    .line 372
    invoke-static {v0, v1}, Lcz/msebera/android/httpclient/util/NetUtils;->formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V

    .line 373
    const-string v4, "<->"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 374
    invoke-static {v0, v2}, Lcz/msebera/android/httpclient/util/NetUtils;->formatAddress(Ljava/lang/StringBuilder;Ljava/net/SocketAddress;)V

    .line 376
    :cond_26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 378
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    .end local v1    # "localAddress":Ljava/net/SocketAddress;
    .end local v2    # "remoteAddress":Ljava/net/SocketAddress;
    :goto_2a
    return-object v4

    :cond_2b
    const-string v4, "[Not bound]"

    goto :goto_2a
.end method
