.class public final Lcom/squareup/okhttp/internal/ws/WebSocket;
.super Ljava/lang/Object;
.source "WebSocket.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;,
        Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;
    }
.end annotation


# static fields
.field private static final ACCEPT_MAGIC:Ljava/lang/String; = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

.field private static final CLOSE_PROTOCOL_EXCEPTION:I = 0x3ea


# instance fields
.field private final client:Lcom/squareup/okhttp/OkHttpClient;

.field private final closeLock:Ljava/lang/Object;

.field private connected:Z

.field private connection:Lcom/squareup/okhttp/Connection;

.field private final key:Ljava/lang/String;

.field private final pongExecutor:Ljava/util/concurrent/Executor;

.field private final random:Ljava/util/Random;

.field private volatile readerClosed:Z

.field private final request:Lcom/squareup/okhttp/Request;

.field private writer:Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

.field private volatile writerClosed:Z


# direct methods
.method constructor <init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;Ljava/util/Random;)V
    .registers 14
    .param p1, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p2, "request"    # Lcom/squareup/okhttp/Request;
    .param p3, "random"    # Ljava/util/Random;

    .prologue
    const/4 v1, 0x1

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->closeLock:Ljava/lang/Object;

    .line 95
    iput-object p1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->client:Lcom/squareup/okhttp/OkHttpClient;

    .line 96
    iput-object p3, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->random:Ljava/util/Random;

    .line 98
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    const-wide/16 v3, 0x1

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>()V

    move v2, v1

    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 100
    .local v0, "pongExecutor":Ljava/util/concurrent/ThreadPoolExecutor;
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 101
    iput-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->pongExecutor:Ljava/util/concurrent/Executor;

    .line 103
    const-string v1, "GET"

    invoke-virtual {p2}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4c

    .line 104
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Request must be GET: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p2}, Lcom/squareup/okhttp/Request;->method()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :cond_4c
    invoke-virtual {p2}, Lcom/squareup/okhttp/Request;->urlString()Ljava/lang/String;

    move-result-object v9

    .line 108
    .local v9, "url":Ljava/lang/String;
    const-string v1, "ws://"

    invoke-virtual {v9, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b0

    .line 109
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x5

    invoke-virtual {v9, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 119
    .local v7, "httpUrl":Ljava/lang/String;
    :goto_70
    const/16 v1, 0x10

    new-array v8, v1, [B

    .line 120
    .local v8, "nonce":[B
    invoke-virtual {p3, v8}, Ljava/util/Random;->nextBytes([B)V

    .line 121
    invoke-static {v8}, Lokio/ByteString;->of([B)Lokio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lokio/ByteString;->base64()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->key:Ljava/lang/String;

    .line 123
    invoke-virtual {p2}, Lcom/squareup/okhttp/Request;->newBuilder()Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    .line 124
    invoke-virtual {v1, v7}, Lcom/squareup/okhttp/Request$Builder;->url(Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    const-string v2, "Upgrade"

    const-string v3, "websocket"

    .line 125
    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    const-string v2, "Connection"

    const-string v3, "Upgrade"

    .line 126
    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    const-string v2, "Sec-WebSocket-Key"

    iget-object v3, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->key:Ljava/lang/String;

    .line 127
    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    const-string v2, "Sec-WebSocket-Version"

    const-string v3, "13"

    .line 128
    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/squareup/okhttp/Request$Builder;

    move-result-object v1

    .line 129
    invoke-virtual {v1}, Lcom/squareup/okhttp/Request$Builder;->build()Lcom/squareup/okhttp/Request;

    move-result-object v1

    iput-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->request:Lcom/squareup/okhttp/Request;

    .line 130
    return-void

    .line 110
    .end local v7    # "httpUrl":Ljava/lang/String;
    .end local v8    # "nonce":[B
    :cond_b0
    const-string v1, "wss://"

    invoke-virtual {v9, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d1

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x6

    invoke-virtual {v9, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .restart local v7    # "httpUrl":Ljava/lang/String;
    goto :goto_70

    .line 112
    .end local v7    # "httpUrl":Ljava/lang/String;
    :cond_d1
    const-string v1, "http://"

    invoke-virtual {v9, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_e1

    const-string v1, "https://"

    invoke-virtual {v9, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e3

    .line 113
    :cond_e1
    move-object v7, v9

    .restart local v7    # "httpUrl":Ljava/lang/String;
    goto :goto_70

    .line 115
    .end local v7    # "httpUrl":Ljava/lang/String;
    :cond_e3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Request url must use \'ws\', \'wss\', \'http\', or \'https\' scheme: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static synthetic access$000(Lcom/squareup/okhttp/internal/ws/WebSocket;)Lcom/squareup/okhttp/internal/ws/WebSocketWriter;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocket;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writer:Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/squareup/okhttp/internal/ws/WebSocket;)Ljava/util/concurrent/Executor;
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocket;

    .prologue
    .line 45
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->pongExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method static synthetic access$200(Lcom/squareup/okhttp/internal/ws/WebSocket;Lokio/Buffer;)V
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocket;
    .param p1, "x1"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/ws/WebSocket;->peerClose(Lokio/Buffer;)V

    return-void
.end method

.method static synthetic access$300(Lcom/squareup/okhttp/internal/ws/WebSocket;)Z
    .registers 2
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocket;

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->readerClosed:Z

    return v0
.end method

.method static synthetic access$400(Lcom/squareup/okhttp/internal/ws/WebSocket;Ljava/io/IOException;Lcom/squareup/okhttp/internal/ws/WebSocketListener;)V
    .registers 3
    .param p0, "x0"    # Lcom/squareup/okhttp/internal/ws/WebSocket;
    .param p1, "x1"    # Ljava/io/IOException;
    .param p2, "x2"    # Lcom/squareup/okhttp/internal/ws/WebSocketListener;

    .prologue
    .line 45
    invoke-direct {p0, p1, p2}, Lcom/squareup/okhttp/internal/ws/WebSocket;->readerErrorClose(Ljava/io/IOException;Lcom/squareup/okhttp/internal/ws/WebSocketListener;)V

    return-void
.end method

.method private closeConnection()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 327
    sget-object v0, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v0, v1, p0}, Lcom/squareup/okhttp/internal/Internal;->connectionCloseIfOwnedBy(Lcom/squareup/okhttp/Connection;Ljava/lang/Object;)V

    .line 328
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connection:Lcom/squareup/okhttp/Connection;

    .line 329
    return-void
.end method

.method public static newWebSocket(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/internal/ws/WebSocket;
    .registers 4
    .param p0, "client"    # Lcom/squareup/okhttp/OkHttpClient;
    .param p1, "request"    # Lcom/squareup/okhttp/Request;

    .prologue
    .line 59
    invoke-virtual {p0}, Lcom/squareup/okhttp/OkHttpClient;->clone()Lcom/squareup/okhttp/OkHttpClient;

    move-result-object p0

    .line 61
    sget-object v0, Lcom/squareup/okhttp/Protocol;->HTTP_1_1:Lcom/squareup/okhttp/Protocol;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/squareup/okhttp/OkHttpClient;->setProtocols(Ljava/util/List;)Lcom/squareup/okhttp/OkHttpClient;

    .line 63
    new-instance v0, Lcom/squareup/okhttp/internal/ws/WebSocket;

    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    invoke-direct {v0, p0, p1, v1}, Lcom/squareup/okhttp/internal/ws/WebSocket;-><init>(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;Ljava/util/Random;)V

    return-object v0
.end method

.method private peerClose(Lokio/Buffer;)V
    .registers 5
    .param p1, "buffer"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    iget-object v2, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->closeLock:Ljava/lang/Object;

    monitor-enter v2

    .line 281
    const/4 v1, 0x1

    :try_start_4
    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->readerClosed:Z

    .line 284
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    .line 285
    .local v0, "closeConnection":Z
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    .line 286
    monitor-exit v2
    :try_end_c
    .catchall {:try_start_4 .. :try_end_c} :catchall_12

    .line 288
    if-eqz v0, :cond_15

    .line 289
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/ws/WebSocket;->closeConnection()V

    .line 294
    :goto_11
    return-void

    .line 286
    .end local v0    # "closeConnection":Z
    :catchall_12
    move-exception v1

    :try_start_13
    monitor-exit v2
    :try_end_14
    .catchall {:try_start_13 .. :try_end_14} :catchall_12

    throw v1

    .line 292
    .restart local v0    # "closeConnection":Z
    :cond_15
    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writer:Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    invoke-virtual {v1, p1}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeClose(Lokio/Buffer;)V

    goto :goto_11
.end method

.method private readerErrorClose(Ljava/io/IOException;Lcom/squareup/okhttp/internal/ws/WebSocketListener;)V
    .registers 7
    .param p1, "e"    # Ljava/io/IOException;
    .param p2, "listener"    # Lcom/squareup/okhttp/internal/ws/WebSocketListener;

    .prologue
    const/4 v0, 0x1

    .line 299
    iget-object v2, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->closeLock:Ljava/lang/Object;

    monitor-enter v2

    .line 300
    const/4 v1, 0x1

    :try_start_5
    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->readerClosed:Z

    .line 303
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    if-nez v1, :cond_24

    .line 304
    .local v0, "closeConnection":Z
    :goto_b
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    .line 305
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_5 .. :try_end_f} :catchall_26

    .line 307
    if-eqz v0, :cond_20

    .line 308
    instance-of v1, p1, Ljava/net/ProtocolException;

    if-eqz v1, :cond_1d

    .line 311
    :try_start_15
    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writer:Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    const/16 v2, 0x3ea

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeClose(ILjava/lang/String;)V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_1d} :catch_2b

    .line 317
    :cond_1d
    :goto_1d
    :try_start_1d
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/ws/WebSocket;->closeConnection()V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_20} :catch_29

    .line 322
    :cond_20
    :goto_20
    invoke-interface {p2, p1}, Lcom/squareup/okhttp/internal/ws/WebSocketListener;->onFailure(Ljava/io/IOException;)V

    .line 323
    return-void

    .line 303
    .end local v0    # "closeConnection":Z
    :cond_24
    const/4 v0, 0x0

    goto :goto_b

    .line 305
    :catchall_26
    move-exception v1

    :try_start_27
    monitor-exit v2
    :try_end_28
    .catchall {:try_start_27 .. :try_end_28} :catchall_26

    throw v1

    .line 318
    .restart local v0    # "closeConnection":Z
    :catch_29
    move-exception v1

    goto :goto_20

    .line 312
    :catch_2b
    move-exception v1

    goto :goto_1d
.end method


# virtual methods
.method public close(ILjava/lang/String;)V
    .registers 6
    .param p1, "code"    # I
    .param p2, "reason"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 261
    iget-object v2, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->closeLock:Ljava/lang/Object;

    monitor-enter v2

    .line 262
    :try_start_3
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    if-eqz v1, :cond_9

    monitor-exit v2

    .line 275
    :cond_8
    :goto_8
    return-void

    .line 263
    :cond_9
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    .line 266
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->readerClosed:Z

    .line 267
    .local v0, "closeConnection":Z
    monitor-exit v2
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_1d

    .line 269
    iget-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writer:Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    invoke-virtual {v1, p1, p2}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->writeClose(ILjava/lang/String;)V

    .line 270
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writer:Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    .line 272
    if-eqz v0, :cond_8

    .line 273
    invoke-direct {p0}, Lcom/squareup/okhttp/internal/ws/WebSocket;->closeConnection()V

    goto :goto_8

    .line 267
    .end local v0    # "closeConnection":Z
    :catchall_1d
    move-exception v1

    :try_start_1e
    monitor-exit v2
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1d

    throw v1
.end method

.method public connect(Lcom/squareup/okhttp/internal/ws/WebSocketListener;)Lcom/squareup/okhttp/Response;
    .registers 16
    .param p1, "listener"    # Lcom/squareup/okhttp/internal/ws/WebSocketListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 154
    iget-boolean v11, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connected:Z

    if-eqz v11, :cond_c

    new-instance v11, Ljava/lang/IllegalStateException;

    const-string v12, "Already connected"

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 155
    :cond_c
    iget-boolean v11, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    if-eqz v11, :cond_18

    new-instance v11, Ljava/lang/IllegalStateException;

    const-string v12, "Closed"

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 158
    :cond_18
    sget-object v11, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v12, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->client:Lcom/squareup/okhttp/OkHttpClient;

    iget-object v13, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v11, v12, v13}, Lcom/squareup/okhttp/internal/Internal;->newCall(Lcom/squareup/okhttp/OkHttpClient;Lcom/squareup/okhttp/Request;)Lcom/squareup/okhttp/Call;

    move-result-object v1

    .line 160
    .local v1, "call":Lcom/squareup/okhttp/Call;
    sget-object v11, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    const/4 v12, 0x1

    invoke-virtual {v11, v1, v12}, Lcom/squareup/okhttp/internal/Internal;->callGetResponse(Lcom/squareup/okhttp/Call;Z)Lcom/squareup/okhttp/Response;

    move-result-object v7

    .line 161
    .local v7, "response":Lcom/squareup/okhttp/Response;
    invoke-virtual {v7}, Lcom/squareup/okhttp/Response;->code()I

    move-result v11

    const/16 v12, 0x65

    if-eq v11, v12, :cond_37

    .line 163
    sget-object v11, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v11, v1}, Lcom/squareup/okhttp/internal/Internal;->callEngineReleaseConnection(Lcom/squareup/okhttp/Call;)V

    .line 220
    :goto_36
    return-object v7

    .line 165
    :cond_37
    const-string v11, "Connection"

    invoke-virtual {v7, v11}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 166
    .local v3, "headerConnection":Ljava/lang/String;
    const-string v11, "Upgrade"

    invoke-virtual {v11, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_5e

    .line 167
    new-instance v11, Ljava/net/ProtocolException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Expected \'Connection\' header value \'Upgrade\' but was: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 170
    :cond_5e
    const-string v11, "Upgrade"

    invoke-virtual {v7, v11}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 171
    .local v4, "headerUpgrade":Ljava/lang/String;
    const-string v11, "websocket"

    invoke-virtual {v11, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_85

    .line 172
    new-instance v11, Ljava/net/ProtocolException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Expected \'Upgrade\' header value \'websocket\' but was: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 175
    :cond_85
    const-string v11, "Sec-WebSocket-Accept"

    invoke-virtual {v7, v11}, Lcom/squareup/okhttp/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 176
    .local v2, "headerAccept":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->key:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/squareup/okhttp/internal/Util;->shaBase64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 177
    .local v0, "acceptExpected":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_cd

    .line 178
    new-instance v11, Ljava/net/ProtocolException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Expected \'Sec-WebSocket-Accept\' header value \'"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\' but was: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 185
    :cond_cd
    sget-object v11, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    invoke-virtual {v11, v1}, Lcom/squareup/okhttp/internal/Internal;->callEngineGetConnection(Lcom/squareup/okhttp/Call;)Lcom/squareup/okhttp/Connection;

    move-result-object v11

    iput-object v11, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connection:Lcom/squareup/okhttp/Connection;

    .line 187
    sget-object v11, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v12, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v11, v12}, Lcom/squareup/okhttp/internal/Internal;->connectionClearOwner(Lcom/squareup/okhttp/Connection;)Z

    move-result v11

    if-nez v11, :cond_e7

    .line 188
    new-instance v11, Ljava/lang/IllegalStateException;

    const-string v12, "Unable to take ownership of connection."

    invoke-direct {v11, v12}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 191
    :cond_e7
    sget-object v11, Lcom/squareup/okhttp/internal/Internal;->instance:Lcom/squareup/okhttp/internal/Internal;

    iget-object v12, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v11, v12, p0}, Lcom/squareup/okhttp/internal/Internal;->connectionSetOwner(Lcom/squareup/okhttp/Connection;Ljava/lang/Object;)V

    .line 192
    const/4 v11, 0x1

    iput-boolean v11, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connected:Z

    .line 194
    iget-object v11, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connection:Lcom/squareup/okhttp/Connection;

    invoke-virtual {v11}, Lcom/squareup/okhttp/Connection;->getSocket()Ljava/net/Socket;

    move-result-object v9

    .line 196
    .local v9, "socket":Ljava/net/Socket;
    invoke-static {v9}, Lokio/Okio;->sink(Ljava/net/Socket;)Lokio/Sink;

    move-result-object v11

    invoke-static {v11}, Lokio/Okio;->buffer(Lokio/Sink;)Lokio/BufferedSink;

    move-result-object v8

    .line 197
    .local v8, "sink":Lokio/BufferedSink;
    new-instance v11, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    const/4 v12, 0x1

    iget-object v13, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->random:Ljava/util/Random;

    invoke-direct {v11, v12, v8, v13}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;-><init>(ZLokio/BufferedSink;Ljava/util/Random;)V

    iput-object v11, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writer:Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    .line 199
    invoke-static {v9}, Lokio/Okio;->source(Ljava/net/Socket;)Lokio/Source;

    move-result-object v11

    invoke-static {v11}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    move-result-object v10

    .line 200
    .local v10, "source":Lokio/BufferedSource;
    new-instance v5, Lcom/squareup/okhttp/internal/ws/WebSocketReader;

    const/4 v11, 0x1

    new-instance v12, Lcom/squareup/okhttp/internal/ws/WebSocket$1;

    invoke-direct {v12, p0}, Lcom/squareup/okhttp/internal/ws/WebSocket$1;-><init>(Lcom/squareup/okhttp/internal/ws/WebSocket;)V

    invoke-direct {v5, v11, v10, p1, v12}, Lcom/squareup/okhttp/internal/ws/WebSocketReader;-><init>(ZLokio/BufferedSource;Lcom/squareup/okhttp/internal/ws/WebSocketListener;Lcom/squareup/okhttp/internal/ws/WebSocketReader$FrameCallback;)V

    .line 217
    .local v5, "reader":Lcom/squareup/okhttp/internal/ws/WebSocketReader;
    new-instance v6, Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;

    iget-object v11, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->request:Lcom/squareup/okhttp/Request;

    invoke-virtual {v11}, Lcom/squareup/okhttp/Request;->urlString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v6, p0, v11, v5, p1}, Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;-><init>(Lcom/squareup/okhttp/internal/ws/WebSocket;Ljava/lang/String;Lcom/squareup/okhttp/internal/ws/WebSocketReader;Lcom/squareup/okhttp/internal/ws/WebSocketListener;)V

    .line 218
    .local v6, "readerRunnable":Lcom/squareup/okhttp/internal/ws/WebSocket$ReaderRunnable;
    new-instance v11, Ljava/lang/Thread;

    invoke-direct {v11, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v11}, Ljava/lang/Thread;->start()V

    goto/16 :goto_36
.end method

.method public isClosed()Z
    .registers 2

    .prologue
    .line 339
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    return v0
.end method

.method public newMessageSink(Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;)Lokio/BufferedSink;
    .registers 4
    .param p1, "type"    # Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;

    .prologue
    .line 232
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 233
    :cond_c
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connected:Z

    if-nez v0, :cond_18

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 235
    :cond_18
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writer:Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    invoke-virtual {v0, p1}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->newMessageSink(Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;)Lokio/BufferedSink;

    move-result-object v0

    return-object v0
.end method

.method public request()Lcom/squareup/okhttp/Request;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->request:Lcom/squareup/okhttp/Request;

    return-object v0
.end method

.method public sendMessage(Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;Lokio/Buffer;)V
    .registers 5
    .param p1, "type"    # Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;
    .param p2, "payload"    # Lokio/Buffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 244
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writerClosed:Z

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 245
    :cond_c
    iget-boolean v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->connected:Z

    if-nez v0, :cond_18

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 247
    :cond_18
    iget-object v0, p0, Lcom/squareup/okhttp/internal/ws/WebSocket;->writer:Lcom/squareup/okhttp/internal/ws/WebSocketWriter;

    invoke-virtual {v0, p1, p2}, Lcom/squareup/okhttp/internal/ws/WebSocketWriter;->sendMessage(Lcom/squareup/okhttp/internal/ws/WebSocket$PayloadType;Lokio/Buffer;)V

    .line 248
    return-void
.end method
