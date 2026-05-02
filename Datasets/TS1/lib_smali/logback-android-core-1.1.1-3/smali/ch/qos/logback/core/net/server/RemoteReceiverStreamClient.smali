.class Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;
.super Lch/qos/logback/core/spi/ContextAwareBase;

# interfaces
.implements Lch/qos/logback/core/net/server/RemoteReceiverClient;


# instance fields
.field private final clientId:Ljava/lang/String;

.field private final outputStream:Ljava/io/OutputStream;

.field private queue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/io/Serializable;",
            ">;"
        }
    .end annotation
.end field

.field private final socket:Ljava/net/Socket;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 5

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "client "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->socket:Ljava/net/Socket;

    iput-object p2, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->outputStream:Ljava/io/OutputStream;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/net/Socket;)V
    .registers 5

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "client "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    iput-object p2, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->socket:Ljava/net/Socket;

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->outputStream:Ljava/io/OutputStream;

    return-void
.end method

.method private createObjectOutputStream()Ljava/io/ObjectOutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->socket:Ljava/net/Socket;

    if-nez v0, :cond_c

    new-instance v0, Ljava/io/ObjectOutputStream;

    iget-object v1, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->outputStream:Ljava/io/OutputStream;

    invoke-direct {v0, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Ljava/io/ObjectOutputStream;

    iget-object v1, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_b
.end method


# virtual methods
.method public close()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->socket:Ljava/net/Socket;

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->socket:Ljava/net/Socket;

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    goto :goto_4
.end method

.method public offer(Ljava/io/Serializable;)Z
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->queue:Ljava/util/concurrent/BlockingQueue;

    if-nez v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "client has no event queue"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public run()V
    .registers 5

    const/4 v1, 0x0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "connected"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->addInfo(Ljava/lang/String;)V

    const/4 v2, 0x0

    :try_start_1a
    invoke-direct {p0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->createObjectOutputStream()Ljava/io/ObjectOutputStream;
    :try_end_1d
    .catch Ljava/net/SocketException; {:try_start_1a .. :try_end_1d} :catch_6f
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1d} :catch_a8
    .catch Ljava/lang/RuntimeException; {:try_start_1a .. :try_end_1d} :catch_e1
    .catchall {:try_start_1a .. :try_end_1d} :catchall_11b

    move-result-object v3

    move v2, v1

    :goto_1f
    :try_start_1f
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z
    :try_end_26
    .catch Ljava/net/SocketException; {:try_start_1f .. :try_end_26} :catch_148
    .catch Ljava/io/IOException; {:try_start_1f .. :try_end_26} :catch_145
    .catch Ljava/lang/RuntimeException; {:try_start_1f .. :try_end_26} :catch_143
    .catchall {:try_start_1f .. :try_end_26} :catchall_13e

    move-result v0

    if-nez v0, :cond_4e

    :try_start_29
    iget-object v0, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->queue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;

    invoke-virtual {v3, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->flush()V
    :try_end_37
    .catch Ljava/lang/InterruptedException; {:try_start_29 .. :try_end_37} :catch_43
    .catch Ljava/net/SocketException; {:try_start_29 .. :try_end_37} :catch_148
    .catch Ljava/io/IOException; {:try_start_29 .. :try_end_37} :catch_145
    .catch Ljava/lang/RuntimeException; {:try_start_29 .. :try_end_37} :catch_143
    .catchall {:try_start_29 .. :try_end_37} :catchall_13e

    add-int/lit8 v0, v2, 0x1

    const/16 v2, 0x46

    if-lt v0, v2, :cond_41

    :try_start_3d
    invoke-virtual {v3}, Ljava/io/ObjectOutputStream;->reset()V
    :try_end_40
    .catch Ljava/lang/InterruptedException; {:try_start_3d .. :try_end_40} :catch_14c
    .catch Ljava/net/SocketException; {:try_start_3d .. :try_end_40} :catch_148
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_40} :catch_145
    .catch Ljava/lang/RuntimeException; {:try_start_3d .. :try_end_40} :catch_143
    .catchall {:try_start_3d .. :try_end_40} :catchall_13e

    move v0, v1

    :cond_41
    move v2, v0

    goto :goto_1f

    :catch_43
    move-exception v0

    move v0, v2

    :goto_45
    :try_start_45
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V
    :try_end_4c
    .catch Ljava/net/SocketException; {:try_start_45 .. :try_end_4c} :catch_148
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_4c} :catch_145
    .catch Ljava/lang/RuntimeException; {:try_start_45 .. :try_end_4c} :catch_143
    .catchall {:try_start_45 .. :try_end_4c} :catchall_13e

    move v2, v0

    goto :goto_1f

    :cond_4e
    if-eqz v3, :cond_53

    invoke-static {v3}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_53
    invoke-virtual {p0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->close()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection closed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->addInfo(Ljava/lang/String;)V

    :goto_6e
    return-void

    :catch_6f
    move-exception v0

    move-object v1, v2

    :goto_71
    :try_start_71
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->addInfo(Ljava/lang/String;)V
    :try_end_87
    .catchall {:try_start_71 .. :try_end_87} :catchall_140

    if-eqz v1, :cond_8c

    invoke-static {v1}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_8c
    invoke-virtual {p0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->close()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection closed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->addInfo(Ljava/lang/String;)V

    goto :goto_6e

    :catch_a8
    move-exception v0

    move-object v3, v2

    :goto_aa
    :try_start_aa
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->addError(Ljava/lang/String;)V
    :try_end_c0
    .catchall {:try_start_aa .. :try_end_c0} :catchall_13e

    if-eqz v3, :cond_c5

    invoke-static {v3}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_c5
    invoke-virtual {p0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->close()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection closed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->addInfo(Ljava/lang/String;)V

    goto :goto_6e

    :catch_e1
    move-exception v0

    move-object v3, v2

    :goto_e3
    :try_start_e3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->addError(Ljava/lang/String;)V
    :try_end_f9
    .catchall {:try_start_e3 .. :try_end_f9} :catchall_13e

    if-eqz v3, :cond_fe

    invoke-static {v3}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_fe
    invoke-virtual {p0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->close()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "connection closed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->addInfo(Ljava/lang/String;)V

    goto/16 :goto_6e

    :catchall_11b
    move-exception v0

    move-object v3, v2

    :goto_11d
    if-eqz v3, :cond_122

    invoke-static {v3}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_122
    invoke-virtual {p0}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->close()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->clientId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "connection closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->addInfo(Ljava/lang/String;)V

    throw v0

    :catchall_13e
    move-exception v0

    goto :goto_11d

    :catchall_140
    move-exception v0

    move-object v3, v1

    goto :goto_11d

    :catch_143
    move-exception v0

    goto :goto_e3

    :catch_145
    move-exception v0

    goto/16 :goto_aa

    :catch_148
    move-exception v0

    move-object v1, v3

    goto/16 :goto_71

    :catch_14c
    move-exception v0

    move v0, v1

    goto/16 :goto_45
.end method

.method public setQueue(Ljava/util/concurrent/BlockingQueue;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/io/Serializable;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/core/net/server/RemoteReceiverStreamClient;->queue:Ljava/util/concurrent/BlockingQueue;

    return-void
.end method
