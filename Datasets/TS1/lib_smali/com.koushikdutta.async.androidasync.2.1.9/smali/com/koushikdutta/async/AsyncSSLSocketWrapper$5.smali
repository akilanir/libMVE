.class Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;
.super Ljava/lang/Object;
.source "AsyncSSLSocketWrapper.java"

# interfaces
.implements Lcom/koushikdutta/async/callback/DataCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/async/AsyncSSLSocketWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final allocator:Lcom/koushikdutta/async/util/Allocator;

.field final buffered:Lcom/koushikdutta/async/ByteBufferList;

.field final synthetic this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;


# direct methods
.method constructor <init>(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;)V
    .registers 4
    .param p1, "this$0"    # Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    new-instance v0, Lcom/koushikdutta/async/util/Allocator;

    invoke-direct {v0}, Lcom/koushikdutta/async/util/Allocator;-><init>()V

    const/16 v1, 0x2000

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/util/Allocator;->setMinAlloc(I)Lcom/koushikdutta/async/util/Allocator;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->allocator:Lcom/koushikdutta/async/util/Allocator;

    .line 166
    new-instance v0, Lcom/koushikdutta/async/ByteBufferList;

    invoke-direct {v0}, Lcom/koushikdutta/async/ByteBufferList;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    return-void
.end method


# virtual methods
.method public onDataAvailable(Lcom/koushikdutta/async/DataEmitter;Lcom/koushikdutta/async/ByteBufferList;)V
    .registers 15
    .param p1, "emitter"    # Lcom/koushikdutta/async/DataEmitter;
    .param p2, "bb"    # Lcom/koushikdutta/async/ByteBufferList;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 170
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-boolean v7, v7, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mUnwrapping:Z

    if-eqz v7, :cond_9

    .line 229
    :goto_8
    return-void

    .line 173
    :cond_9
    :try_start_9
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    const/4 v8, 0x1

    iput-boolean v8, v7, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mUnwrapping:Z

    .line 175
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {p2, v7}, Lcom/koushikdutta/async/ByteBufferList;->get(Lcom/koushikdutta/async/ByteBufferList;)V

    .line 177
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ByteBufferList;->hasRemaining()Z

    move-result v7

    if-eqz v7, :cond_26

    .line 178
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ByteBufferList;->getAll()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 179
    .local v0, "all":Ljava/nio/ByteBuffer;
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7, v0}, Lcom/koushikdutta/async/ByteBufferList;->add(Ljava/nio/ByteBuffer;)Lcom/koushikdutta/async/ByteBufferList;

    .line 182
    .end local v0    # "all":Ljava/nio/ByteBuffer;
    :cond_26
    sget-object v1, Lcom/koushikdutta/async/ByteBufferList;->EMPTY_BYTEBUFFER:Ljava/nio/ByteBuffer;

    .line 184
    .local v1, "b":Ljava/nio/ByteBuffer;
    :cond_28
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    if-nez v7, :cond_3c

    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ByteBufferList;->size()I

    move-result v7

    if-lez v7, :cond_3c

    .line 185
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ByteBufferList;->remove()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 187
    :cond_3c
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    .line 188
    .local v5, "remaining":I
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v7, v7, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v2

    .line 193
    .local v2, "before":I
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->allocator:Lcom/koushikdutta/async/util/Allocator;

    invoke-virtual {v7}, Lcom/koushikdutta/async/util/Allocator;->allocate()Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 194
    .local v4, "readBuf":Ljava/nio/ByteBuffer;
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v7, v7, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->engine:Ljavax/net/ssl/SSLEngine;

    invoke-virtual {v7, v1, v4}, Ljavax/net/ssl/SSLEngine;->unwrap(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Ljavax/net/ssl/SSLEngineResult;

    move-result-object v6

    .line 195
    .local v6, "res":Ljavax/net/ssl/SSLEngineResult;
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v8, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v8, v8, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7, v8, v4}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->addToPending(Lcom/koushikdutta/async/ByteBufferList;Ljava/nio/ByteBuffer;)V

    .line 196
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->allocator:Lcom/koushikdutta/async/util/Allocator;

    iget-object v8, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v8, v8, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v8}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v8

    sub-int/2addr v8, v2

    int-to-long v8, v8

    invoke-virtual {v7, v8, v9}, Lcom/koushikdutta/async/util/Allocator;->track(J)V

    .line 198
    invoke-virtual {v6}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v7

    sget-object v8, Ljavax/net/ssl/SSLEngineResult$Status;->BUFFER_OVERFLOW:Ljavax/net/ssl/SSLEngineResult$Status;

    if-ne v7, v8, :cond_ad

    .line 199
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->allocator:Lcom/koushikdutta/async/util/Allocator;

    iget-object v8, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->allocator:Lcom/koushikdutta/async/util/Allocator;

    invoke-virtual {v8}, Lcom/koushikdutta/async/util/Allocator;->getMinAlloc()I

    move-result v8

    mul-int/lit8 v8, v8, 0x2

    invoke-virtual {v7, v8}, Lcom/koushikdutta/async/util/Allocator;->setMinAlloc(I)Lcom/koushikdutta/async/util/Allocator;

    .line 200
    const/4 v5, -0x1

    .line 213
    :cond_84
    :goto_84
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    invoke-virtual {v6}, Ljavax/net/ssl/SSLEngineResult;->getHandshakeStatus()Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;

    move-result-object v8

    # invokes: Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->handleHandshakeStatus(Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V
    invoke-static {v7, v8}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->access$000(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;Ljavax/net/ssl/SSLEngineResult$HandshakeStatus;)V

    .line 214
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v7

    if-ne v7, v5, :cond_28

    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iget-object v7, v7, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->pending:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ByteBufferList;->remaining()I

    move-result v7

    if-ne v2, v7, :cond_28

    .line 215
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7, v1}, Lcom/koushikdutta/async/ByteBufferList;->addFirst(Ljava/nio/ByteBuffer;)V

    .line 220
    :cond_a2
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    invoke-virtual {v7}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->onDataAvailable()V
    :try_end_a7
    .catch Ljavax/net/ssl/SSLException; {:try_start_9 .. :try_end_a7} :catch_d1
    .catchall {:try_start_9 .. :try_end_a7} :catchall_e0

    .line 227
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iput-boolean v10, v7, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mUnwrapping:Z

    goto/16 :goto_8

    .line 202
    :cond_ad
    :try_start_ad
    invoke-virtual {v6}, Ljavax/net/ssl/SSLEngineResult;->getStatus()Ljavax/net/ssl/SSLEngineResult$Status;

    move-result-object v7

    sget-object v8, Ljavax/net/ssl/SSLEngineResult$Status;->BUFFER_UNDERFLOW:Ljavax/net/ssl/SSLEngineResult$Status;

    if-ne v7, v8, :cond_84

    .line 203
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7, v1}, Lcom/koushikdutta/async/ByteBufferList;->addFirst(Ljava/nio/ByteBuffer;)V

    .line 204
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ByteBufferList;->size()I

    move-result v7

    if-le v7, v11, :cond_a2

    .line 208
    const/4 v5, -0x1

    .line 209
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7}, Lcom/koushikdutta/async/ByteBufferList;->getAll()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 210
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->buffered:Lcom/koushikdutta/async/ByteBufferList;

    invoke-virtual {v7, v1}, Lcom/koushikdutta/async/ByteBufferList;->addFirst(Ljava/nio/ByteBuffer;)V

    .line 211
    sget-object v1, Lcom/koushikdutta/async/ByteBufferList;->EMPTY_BYTEBUFFER:Ljava/nio/ByteBuffer;
    :try_end_d0
    .catch Ljavax/net/ssl/SSLException; {:try_start_ad .. :try_end_d0} :catch_d1
    .catchall {:try_start_ad .. :try_end_d0} :catchall_e0

    goto :goto_84

    .line 222
    .end local v1    # "b":Ljava/nio/ByteBuffer;
    .end local v2    # "before":I
    .end local v4    # "readBuf":Ljava/nio/ByteBuffer;
    .end local v5    # "remaining":I
    .end local v6    # "res":Ljavax/net/ssl/SSLEngineResult;
    :catch_d1
    move-exception v3

    .line 223
    .local v3, "ex":Ljavax/net/ssl/SSLException;
    :try_start_d2
    invoke-virtual {v3}, Ljavax/net/ssl/SSLException;->printStackTrace()V

    .line 224
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    # invokes: Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->report(Ljava/lang/Exception;)V
    invoke-static {v7, v3}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->access$100(Lcom/koushikdutta/async/AsyncSSLSocketWrapper;Ljava/lang/Exception;)V
    :try_end_da
    .catchall {:try_start_d2 .. :try_end_da} :catchall_e0

    .line 227
    iget-object v7, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iput-boolean v10, v7, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mUnwrapping:Z

    goto/16 :goto_8

    .end local v3    # "ex":Ljavax/net/ssl/SSLException;
    :catchall_e0
    move-exception v7

    iget-object v8, p0, Lcom/koushikdutta/async/AsyncSSLSocketWrapper$5;->this$0:Lcom/koushikdutta/async/AsyncSSLSocketWrapper;

    iput-boolean v10, v8, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->mUnwrapping:Z

    throw v7
.end method
