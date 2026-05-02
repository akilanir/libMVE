.class public Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;
.super Ljava/lang/Object;
.source "AsyncHttpServerResponseImpl.java"

# interfaces
.implements Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field closedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

.field code:I

.field ended:Z

.field headWritten:Z

.field private mContentLength:J

.field mEnded:Z

.field private mRawHeaders:Lcom/koushikdutta/async/http/Headers;

.field mRequest:Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;

.field mSink:Lcom/koushikdutta/async/DataSink;

.field mSocket:Lcom/koushikdutta/async/AsyncSocket;

.field writable:Lcom/koushikdutta/async/callback/WritableCallback;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    const-class v0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>(Lcom/koushikdutta/async/AsyncSocket;Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;)V
    .registers 6
    .param p1, "socket"    # Lcom/koushikdutta/async/AsyncSocket;
    .param p2, "req"    # Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/koushikdutta/async/http/Headers;

    invoke-direct {v0}, Lcom/koushikdutta/async/http/Headers;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    .line 33
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mContentLength:J

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->headWritten:Z

    .line 340
    const/16 v0, 0xc8

    iput v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code:I

    .line 47
    iput-object p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    .line 48
    iput-object p2, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRequest:Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;

    .line 49
    sget-object v0, Lcom/koushikdutta/async/http/Protocol;->HTTP_1_1:Lcom/koushikdutta/async/http/Protocol;

    invoke-virtual {p2}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/koushikdutta/async/http/HttpUtil;->isKeepAlive(Lcom/koushikdutta/async/http/Protocol;Lcom/koushikdutta/async/http/Headers;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 50
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v1, "Connection"

    const-string v2, "Keep-Alive"

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 51
    :cond_2e
    return-void
.end method


# virtual methods
.method public code()I
    .registers 2

    .prologue
    .line 349
    iget v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code:I

    return v0
.end method

.method public code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;
    .registers 2
    .param p1, "code"    # I

    .prologue
    .line 343
    iput p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code:I

    .line 344
    return-object p0
.end method

.method public end()V
    .registers 3

    .prologue
    .line 159
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->ended:Z

    if-eqz v0, :cond_5

    .line 188
    :cond_4
    :goto_4
    return-void

    .line 161
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->ended:Z

    .line 162
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->headWritten:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    if-eqz v0, :cond_4

    .line 167
    :cond_10
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->headWritten:Z

    if-nez v0, :cond_1b

    .line 170
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v1, "Transfer-Encoding"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Headers;->remove(Ljava/lang/String;)Ljava/lang/String;

    .line 172
    :cond_1b
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    instance-of v0, v0, Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;

    if-eqz v0, :cond_39

    .line 173
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    check-cast v0, Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;

    const v1, 0x7fffffff

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/filter/ChunkedOutputFilter;->setMaxBuffer(I)V

    .line 174
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    new-instance v1, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v1}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    invoke-interface {v0, v1}, Lcom/koushikdutta/async/DataSink;->write(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 175
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->onEnd()V

    goto :goto_4

    .line 177
    :cond_39
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->headWritten:Z

    if-nez v0, :cond_5a

    .line 178
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRequest:Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;

    invoke-virtual {v0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;->getMethod()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HEAD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_53

    .line 179
    const-string v0, "text/html"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->send(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 181
    :cond_53
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->writeHead()V

    .line 182
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->onEnd()V

    goto :goto_4

    .line 186
    :cond_5a
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->onEnd()V

    goto :goto_4
.end method

.method public getClosedCallback()Lcom/koushikdutta/async/callback/CompletedCallback;
    .registers 2

    .prologue
    .line 382
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    if-eqz v0, :cond_b

    .line 383
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataSink;->getClosedCallback()Lcom/koushikdutta/async/callback/CompletedCallback;

    move-result-object v0

    .line 384
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->closedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    goto :goto_a
.end method

.method public getHeaders()Lcom/koushikdutta/async/http/Headers;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    return-object v0
.end method

.method public getServer()Lcom/koushikdutta/async/AsyncServer;
    .registers 2

    .prologue
    .line 389
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->getServer()Lcom/koushikdutta/async/AsyncServer;

    move-result-object v0

    return-object v0
.end method

.method public getSocket()Lcom/koushikdutta/async/AsyncSocket;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    return-object v0
.end method

.method public getWriteableCallback()Lcom/koushikdutta/async/callback/WritableCallback;
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    if-eqz v0, :cond_b

    .line 152
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataSink;->getWriteableCallback()Lcom/koushikdutta/async/callback/WritableCallback;

    move-result-object v0

    .line 153
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->writable:Lcom/koushikdutta/async/callback/WritableCallback;

    goto :goto_a
.end method

.method initFirstWrite()V
    .registers 14

    .prologue
    const-wide/16 v11, 0x0

    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 76
    iget-boolean v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->headWritten:Z

    if-eqz v8, :cond_9

    .line 138
    :goto_8
    return-void

    .line 79
    :cond_9
    iput-boolean v6, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->headWritten:Z

    .line 82
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v9, "Transfer-Encoding"

    invoke-virtual {v8, v9}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 83
    .local v2, "currentEncoding":Ljava/lang/String;
    const-string v8, ""

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_22

    .line 84
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v9, "Transfer-Encoding"

    invoke-virtual {v8, v9}, Lcom/koushikdutta/async/http/Headers;->removeAll(Ljava/lang/String;)Ljava/util/List;

    .line 85
    :cond_22
    const-string v8, "Chunked"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2c

    if-nez v2, :cond_9e

    :cond_2c
    const-string v8, "close"

    iget-object v9, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v10, "Connection"

    .line 86
    invoke-virtual {v9, v10}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_9e

    move v0, v6

    .line 87
    .local v0, "canUseChunked":Z
    :goto_3d
    iget-wide v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mContentLength:J

    cmp-long v8, v8, v11

    if-gez v8, :cond_5b

    .line 88
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v9, "Content-Length"

    invoke-virtual {v8, v9}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "contentLength":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5b

    .line 90
    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    iput-wide v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mContentLength:J

    .line 92
    .end local v1    # "contentLength":Ljava/lang/String;
    :cond_5b
    iget-wide v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mContentLength:J

    cmp-long v8, v8, v11

    if-gez v8, :cond_a0

    if-eqz v0, :cond_a0

    .line 93
    iget-object v8, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v9, "Transfer-Encoding"

    const-string v10, "Chunked"

    invoke-virtual {v8, v9, v10}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 94
    const/4 v3, 0x1

    .line 100
    .local v3, "isChunked":Z
    :goto_6d
    sget-object v8, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v9, "HTTP/1.1 %s %s"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    iget v11, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v7

    iget v7, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code:I

    invoke-static {v7}, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->getResponseCodeDescription(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v10, v6

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 101
    .local v5, "statusLine":Ljava/lang/String;
    iget-object v6, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    invoke-virtual {v6, v5}, Lcom/koushikdutta/async/http/Headers;->toPrefixString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 103
    .local v4, "rh":Ljava/lang/String;
    iget-object v6, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    new-instance v8, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1;

    invoke-direct {v8, p0, v3}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$1;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;Z)V

    invoke-static {v6, v7, v8}, Lcom/koushikdutta/async/Util;->writeAll(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V

    goto/16 :goto_8

    .end local v0    # "canUseChunked":Z
    .end local v3    # "isChunked":Z
    .end local v4    # "rh":Ljava/lang/String;
    .end local v5    # "statusLine":Ljava/lang/String;
    :cond_9e
    move v0, v7

    .line 86
    goto :goto_3d

    .line 97
    .restart local v0    # "canUseChunked":Z
    :cond_a0
    const/4 v3, 0x0

    .restart local v3    # "isChunked":Z
    goto :goto_6d
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 366
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    if-eqz v0, :cond_b

    .line 367
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    invoke-interface {v0}, Lcom/koushikdutta/async/DataSink;->isOpen()Z

    move-result v0

    .line 368
    :goto_a
    return v0

    :cond_b
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSocket:Lcom/koushikdutta/async/AsyncSocket;

    invoke-interface {v0}, Lcom/koushikdutta/async/AsyncSocket;->isOpen()Z

    move-result v0

    goto :goto_a
.end method

.method public onCompleted(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 361
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->end()V

    .line 362
    return-void
.end method

.method protected onEnd()V
    .registers 2

    .prologue
    .line 227
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mEnded:Z

    .line 228
    return-void
.end method

.method public proxy(Lcom/koushikdutta/async/http/AsyncHttpResponse;)V
    .registers 5
    .param p1, "remoteResponse"    # Lcom/koushikdutta/async/http/AsyncHttpResponse;

    .prologue
    .line 323
    invoke-interface {p1}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->code()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 324
    invoke-interface {p1}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    const-string v1, "Transfer-Encoding"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Headers;->removeAll(Ljava/lang/String;)Ljava/util/List;

    .line 325
    invoke-interface {p1}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    const-string v1, "Content-Encoding"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Headers;->removeAll(Ljava/lang/String;)Ljava/util/List;

    .line 326
    invoke-interface {p1}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    const-string v1, "Connection"

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Headers;->removeAll(Ljava/lang/String;)Ljava/util/List;

    .line 327
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    invoke-interface {p1}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/Headers;->addAll(Lcom/koushikdutta/async/http/Headers;)Lcom/koushikdutta/async/http/Headers;

    .line 329
    invoke-interface {p1}, Lcom/koushikdutta/async/http/AsyncHttpResponse;->headers()Lcom/koushikdutta/async/http/Headers;

    move-result-object v0

    const-string v1, "Connection"

    const-string v2, "close"

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 330
    new-instance v0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$4;

    invoke-direct {v0, p0, p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$4;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;Lcom/koushikdutta/async/http/AsyncHttpResponse;)V

    invoke-static {p1, p0, v0}, Lcom/koushikdutta/async/Util;->pump(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 338
    return-void
.end method

.method public redirect(Ljava/lang/String;)V
    .registers 4
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 354
    const/16 v0, 0x12e

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 355
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v1, "Location"

    invoke-virtual {v0, v1, p1}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 356
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->end()V

    .line 357
    return-void
.end method

.method protected report(Ljava/lang/Exception;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 231
    return-void
.end method

.method public send(Ljava/lang/String;)V
    .registers 5
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 236
    iget-object v1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v2, "Content-Type"

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 237
    .local v0, "contentType":Ljava/lang/String;
    if-nez v0, :cond_c

    .line 238
    const-string v0, "text/html; charset=utf-8"

    .line 239
    :cond_c
    invoke-virtual {p0, v0, p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->send(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    return-void
.end method

.method public send(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "string"    # Ljava/lang/String;

    .prologue
    .line 218
    :try_start_0
    const-string v1, "UTF-8"

    invoke-virtual {p2, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->send(Ljava/lang/String;[B)V
    :try_end_9
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_9} :catch_a

    .line 223
    return-void

    .line 220
    :catch_a
    move-exception v0

    .line 221
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public send(Ljava/lang/String;[B)V
    .registers 7
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "bytes"    # [B

    .prologue
    .line 202
    sget-boolean v0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    iget-wide v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mContentLength:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 203
    :cond_12
    array-length v0, p2

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mContentLength:J

    .line 204
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v1, "Content-Length"

    array-length v2, p2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 205
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1, p1}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 207
    new-instance v0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$2;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$2;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;)V

    invoke-static {p0, p2, v0}, Lcom/koushikdutta/async/Util;->writeAll(Lcom/koushikdutta/async/DataSink;[BLcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 213
    return-void
.end method

.method public send(Lorg/json/JSONObject;)V
    .registers 4
    .param p1, "json"    # Lorg/json/JSONObject;

    .prologue
    .line 244
    const-string v0, "application/json; charset=utf-8"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->send(Ljava/lang/String;Ljava/lang/String;)V

    .line 245
    return-void
.end method

.method public sendFile(Ljava/io/File;)V
    .registers 7
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 310
    :try_start_0
    iget-object v2, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v3, "Content-Type"

    invoke-virtual {v2, v3}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_19

    .line 311
    iget-object v2, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v3, "Content-Type"

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->getContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 312
    :cond_19
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 313
    .local v1, "fin":Ljava/io/FileInputStream;
    new-instance v2, Ljava/io/BufferedInputStream;

    const v3, 0xfa00

    invoke-direct {v2, v1, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-virtual {p0, v2, v3, v4}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->sendStream(Ljava/io/InputStream;J)V
    :try_end_2d
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_2d} :catch_2e

    .line 319
    .end local v1    # "fin":Ljava/io/FileInputStream;
    :goto_2d
    return-void

    .line 315
    :catch_2e
    move-exception v0

    .line 316
    .local v0, "e":Ljava/io/FileNotFoundException;
    const/16 v2, 0x194

    invoke-virtual {p0, v2}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 317
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->end()V

    goto :goto_2d
.end method

.method public sendStream(Ljava/io/InputStream;J)V
    .registers 18
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "totalLength"    # J

    .prologue
    .line 249
    const-wide/16 v5, 0x0

    .line 250
    .local v5, "start":J
    const-wide/16 v7, 0x1

    sub-long v1, p2, v7

    .line 252
    .local v1, "end":J
    iget-object v7, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRequest:Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v7

    const-string v8, "Range"

    invoke-virtual {v7, v8}, Lcom/koushikdutta/async/http/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 253
    .local v4, "range":Ljava/lang/String;
    if-eqz v4, :cond_a1

    .line 254
    const-string v7, "="

    invoke-virtual {v4, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 255
    .local v3, "parts":[Ljava/lang/String;
    array-length v7, v3

    const/4 v8, 0x2

    if-ne v7, v8, :cond_29

    const-string v7, "bytes"

    const/4 v8, 0x0

    aget-object v8, v3, v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_32

    .line 257
    :cond_29
    const/16 v7, 0x1a0

    invoke-virtual {p0, v7}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 258
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->end()V

    .line 305
    .end local v3    # "parts":[Ljava/lang/String;
    :goto_31
    return-void

    .line 262
    .restart local v3    # "parts":[Ljava/lang/String;
    :cond_32
    const/4 v7, 0x1

    aget-object v7, v3, v7

    const-string v8, "-"

    invoke-virtual {v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 264
    :try_start_3b
    array-length v7, v3

    const/4 v8, 0x2

    if-le v7, v8, :cond_4f

    .line 265
    new-instance v7, Lcom/koushikdutta/async/http/server/MalformedRangeException;

    invoke-direct {v7}, Lcom/koushikdutta/async/http/server/MalformedRangeException;-><init>()V

    throw v7
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_45} :catch_45

    .line 276
    :catch_45
    move-exception v0

    .line 277
    .local v0, "e":Ljava/lang/Exception;
    const/16 v7, 0x1a0

    invoke-virtual {p0, v7}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 278
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->end()V

    goto :goto_31

    .line 266
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_4f
    const/4 v7, 0x0

    :try_start_50
    aget-object v7, v3, v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_5f

    .line 267
    const/4 v7, 0x0

    aget-object v7, v3, v7

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v5

    .line 268
    :cond_5f
    array-length v7, v3

    const/4 v8, 0x2

    if-ne v7, v8, :cond_bc

    const/4 v7, 0x1

    aget-object v7, v3, v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_bc

    .line 269
    const/4 v7, 0x1

    aget-object v7, v3, v7

    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 273
    :goto_73
    const/16 v7, 0xce

    invoke-virtual {p0, v7}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 274
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->getHeaders()Lcom/koushikdutta/async/http/Headers;

    move-result-object v7

    const-string v8, "Content-Range"

    sget-object v9, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v10, "bytes %d-%d/%d"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    const/4 v12, 0x2

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v9, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_a1} :catch_45

    .line 283
    .end local v3    # "parts":[Ljava/lang/String;
    :cond_a1
    :try_start_a1
    invoke-virtual {p1, v5, v6}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v7

    cmp-long v7, v5, v7

    if-eqz v7, :cond_c1

    .line 284
    new-instance v7, Lcom/koushikdutta/async/http/server/StreamSkipException;

    const-string v8, "skip failed to skip requested amount"

    invoke-direct {v7, v8}, Lcom/koushikdutta/async/http/server/StreamSkipException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_b1
    .catch Ljava/lang/Exception; {:try_start_a1 .. :try_end_b1} :catch_b1

    .line 301
    :catch_b1
    move-exception v0

    .line 302
    .restart local v0    # "e":Ljava/lang/Exception;
    const/16 v7, 0x1f4

    invoke-virtual {p0, v7}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code(I)Lcom/koushikdutta/async/http/server/AsyncHttpServerResponse;

    .line 303
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->end()V

    goto/16 :goto_31

    .line 271
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v3    # "parts":[Ljava/lang/String;
    :cond_bc
    const-wide/16 v7, 0x1

    sub-long v1, p2, v7

    goto :goto_73

    .line 285
    .end local v3    # "parts":[Ljava/lang/String;
    :cond_c1
    sub-long v7, v1, v5

    const-wide/16 v9, 0x1

    add-long/2addr v7, v9

    :try_start_c6
    iput-wide v7, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mContentLength:J

    .line 286
    iget-object v7, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v8, "Content-Length"

    iget-wide v9, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mContentLength:J

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 287
    iget-object v7, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v8, "Accept-Ranges"

    const-string v9, "bytes"

    invoke-virtual {v7, v8, v9}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 288
    iget-object v7, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRequest:Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;

    invoke-virtual {v7}, Lcom/koushikdutta/async/http/server/AsyncHttpServerRequestImpl;->getMethod()Ljava/lang/String;

    move-result-object v7

    const-string v8, "HEAD"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_f4

    .line 289
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->writeHead()V

    .line 290
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->onEnd()V

    goto/16 :goto_31

    .line 293
    :cond_f4
    iget-wide v7, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mContentLength:J

    new-instance v9, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$3;

    invoke-direct {v9, p0, p1}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl$3;-><init>(Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;Ljava/io/InputStream;)V

    invoke-static {p1, v7, v8, p0, v9}, Lcom/koushikdutta/async/Util;->pump(Ljava/io/InputStream;JLcom/koushikdutta/async/DataSink;Lcom/koushikdutta/async/callback/CompletedCallback;)V
    :try_end_fe
    .catch Ljava/lang/Exception; {:try_start_c6 .. :try_end_fe} :catch_b1

    goto/16 :goto_31
.end method

.method public setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V
    .registers 3
    .param p1, "handler"    # Lcom/koushikdutta/async/callback/CompletedCallback;

    .prologue
    .line 374
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    if-eqz v0, :cond_a

    .line 375
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/DataSink;->setClosedCallback(Lcom/koushikdutta/async/callback/CompletedCallback;)V

    .line 378
    :goto_9
    return-void

    .line 377
    :cond_a
    iput-object p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->closedCallback:Lcom/koushikdutta/async/callback/CompletedCallback;

    goto :goto_9
.end method

.method public setContentType(Ljava/lang/String;)V
    .registers 4
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 197
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1, p1}, Lcom/koushikdutta/async/http/Headers;->set(Ljava/lang/String;Ljava/lang/String;)Lcom/koushikdutta/async/http/Headers;

    .line 198
    return-void
.end method

.method public setWriteableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V
    .registers 3
    .param p1, "handler"    # Lcom/koushikdutta/async/callback/WritableCallback;

    .prologue
    .line 143
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    if-eqz v0, :cond_a

    .line 144
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/DataSink;->setWriteableCallback(Lcom/koushikdutta/async/callback/WritableCallback;)V

    .line 147
    :goto_9
    return-void

    .line 146
    :cond_a
    iput-object p1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->writable:Lcom/koushikdutta/async/callback/WritableCallback;

    goto :goto_9
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 394
    iget-object v1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    if-nez v1, :cond_9

    .line 395
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 397
    :goto_8
    return-object v1

    .line 396
    :cond_9
    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "HTTP/1.1 %s %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget v5, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->code:I

    invoke-static {v5}, Lcom/koushikdutta/async/http/server/AsyncHttpServer;->getResponseCodeDescription(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 397
    .local v0, "statusLine":Ljava/lang/String;
    iget-object v1, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mRawHeaders:Lcom/koushikdutta/async/http/Headers;

    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/http/Headers;->toPrefixString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_8
.end method

.method public write(Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 3
    .param p1, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    .line 56
    sget-boolean v0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    iget-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mEnded:Z

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 58
    :cond_e
    iget-boolean v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->headWritten:Z

    if-nez v0, :cond_15

    .line 59
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->initFirstWrite()V

    .line 62
    :cond_15
    invoke-virtual {p1}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v0

    if-nez v0, :cond_1c

    .line 71
    :cond_1b
    :goto_1b
    return-void

    .line 66
    :cond_1c
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    if-eqz v0, :cond_1b

    .line 70
    iget-object v0, p0, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->mSink:Lcom/koushikdutta/async/DataSink;

    invoke-interface {v0, p1}, Lcom/koushikdutta/async/DataSink;->write(Lcom/koushikdutta/async/ByteBufferList;)V

    goto :goto_1b
.end method

.method public writeHead()V
    .registers 1

    .prologue
    .line 192
    invoke-virtual {p0}, Lcom/koushikdutta/async/http/server/AsyncHttpServerResponseImpl;->initFirstWrite()V

    .line 193
    return-void
.end method
