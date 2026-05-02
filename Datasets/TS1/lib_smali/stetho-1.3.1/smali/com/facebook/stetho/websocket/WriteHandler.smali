.class Lcom/facebook/stetho/websocket/WriteHandler;
.super Ljava/lang/Object;
.source "WriteHandler.java"


# annotations
.annotation build Ljavax/annotation/concurrent/ThreadSafe;
.end annotation


# instance fields
.field private final mBufferedOutput:Ljava/io/BufferedOutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 4
    .param p1, "rawSocketOutput"    # Ljava/io/OutputStream;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/io/BufferedOutputStream;

    const/16 v1, 0x400

    invoke-direct {v0, p1, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v0, p0, Lcom/facebook/stetho/websocket/WriteHandler;->mBufferedOutput:Ljava/io/BufferedOutputStream;

    .line 24
    return-void
.end method


# virtual methods
.method public declared-synchronized write(Lcom/facebook/stetho/websocket/Frame;Lcom/facebook/stetho/websocket/WriteCallback;)V
    .registers 5
    .param p1, "frame"    # Lcom/facebook/stetho/websocket/Frame;
    .param p2, "callback"    # Lcom/facebook/stetho/websocket/WriteCallback;

    .prologue
    .line 28
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lcom/facebook/stetho/websocket/WriteHandler;->mBufferedOutput:Ljava/io/BufferedOutputStream;

    invoke-virtual {p1, v1}, Lcom/facebook/stetho/websocket/Frame;->writeTo(Ljava/io/BufferedOutputStream;)V

    .line 29
    iget-object v1, p0, Lcom/facebook/stetho/websocket/WriteHandler;->mBufferedOutput:Ljava/io/BufferedOutputStream;

    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->flush()V

    .line 30
    invoke-interface {p2}, Lcom/facebook/stetho/websocket/WriteCallback;->onSuccess()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_e} :catch_10
    .catchall {:try_start_1 .. :try_end_e} :catchall_15

    .line 34
    :goto_e
    monitor-exit p0

    return-void

    .line 31
    :catch_10
    move-exception v0

    .line 32
    .local v0, "e":Ljava/io/IOException;
    :try_start_11
    invoke-interface {p2, v0}, Lcom/facebook/stetho/websocket/WriteCallback;->onFailure(Ljava/io/IOException;)V
    :try_end_14
    .catchall {:try_start_11 .. :try_end_14} :catchall_15

    goto :goto_e

    .line 28
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_15
    move-exception v1

    monitor-exit p0

    throw v1
.end method
