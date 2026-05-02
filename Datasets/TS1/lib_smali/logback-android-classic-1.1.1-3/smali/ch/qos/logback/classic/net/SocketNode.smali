.class public Lch/qos/logback/classic/net/SocketNode;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field closed:Z

.field context:Lch/qos/logback/classic/LoggerContext;

.field logger:Lch/qos/logback/classic/Logger;

.field ois:Ljava/io/ObjectInputStream;

.field remoteSocketAddress:Ljava/net/SocketAddress;

.field socket:Ljava/net/Socket;

.field socketServer:Lch/qos/logback/classic/net/SimpleSocketServer;


# direct methods
.method public constructor <init>(Lch/qos/logback/classic/net/SimpleSocketServer;Ljava/net/Socket;Lch/qos/logback/classic/LoggerContext;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/net/SocketNode;->closed:Z

    iput-object p1, p0, Lch/qos/logback/classic/net/SocketNode;->socketServer:Lch/qos/logback/classic/net/SimpleSocketServer;

    iput-object p2, p0, Lch/qos/logback/classic/net/SocketNode;->socket:Ljava/net/Socket;

    invoke-virtual {p2}, Ljava/net/Socket;->getRemoteSocketAddress()Ljava/net/SocketAddress;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->remoteSocketAddress:Ljava/net/SocketAddress;

    iput-object p3, p0, Lch/qos/logback/classic/net/SocketNode;->context:Lch/qos/logback/classic/LoggerContext;

    const-class v0, Lch/qos/logback/classic/net/SocketNode;

    invoke-virtual {p3, v0}, Lch/qos/logback/classic/LoggerContext;->getLogger(Ljava/lang/Class;)Lch/qos/logback/classic/Logger;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->logger:Lch/qos/logback/classic/Logger;

    return-void
.end method


# virtual methods
.method close()V
    .registers 5

    const/4 v3, 0x0

    iget-boolean v0, p0, Lch/qos/logback/classic/net/SocketNode;->closed:Z

    if-eqz v0, :cond_6

    :cond_5
    :goto_5
    return-void

    :cond_6
    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/classic/net/SocketNode;->closed:Z

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->ois:Ljava/io/ObjectInputStream;

    if-eqz v0, :cond_5

    :try_start_d
    iget-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->ois:Ljava/io/ObjectInputStream;

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_12} :catch_15
    .catchall {:try_start_d .. :try_end_12} :catchall_20

    iput-object v3, p0, Lch/qos/logback/classic/net/SocketNode;->ois:Ljava/io/ObjectInputStream;

    goto :goto_5

    :catch_15
    move-exception v0

    :try_start_16
    iget-object v1, p0, Lch/qos/logback/classic/net/SocketNode;->logger:Lch/qos/logback/classic/Logger;

    const-string v2, "Could not close connection."

    invoke-virtual {v1, v2, v0}, Lch/qos/logback/classic/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1d
    .catchall {:try_start_16 .. :try_end_1d} :catchall_20

    iput-object v3, p0, Lch/qos/logback/classic/net/SocketNode;->ois:Ljava/io/ObjectInputStream;

    goto :goto_5

    :catchall_20
    move-exception v0

    iput-object v3, p0, Lch/qos/logback/classic/net/SocketNode;->ois:Ljava/io/ObjectInputStream;

    throw v0
.end method

.method public run()V
    .registers 5

    :try_start_0
    new-instance v0, Ljava/io/ObjectInputStream;

    new-instance v1, Ljava/io/BufferedInputStream;

    iget-object v2, p0, Lch/qos/logback/classic/net/SocketNode;->socket:Ljava/net/Socket;

    invoke-virtual {v2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->ois:Ljava/io/ObjectInputStream;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_47

    :cond_12
    :goto_12
    :try_start_12
    iget-boolean v0, p0, Lch/qos/logback/classic/net/SocketNode;->closed:Z

    if-nez v0, :cond_3e

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->ois:Ljava/io/ObjectInputStream;

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/spi/ILoggingEvent;

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketNode;->context:Lch/qos/logback/classic/LoggerContext;

    invoke-interface {v0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lch/qos/logback/classic/LoggerContext;->getLogger(Ljava/lang/String;)Lch/qos/logback/classic/Logger;

    move-result-object v1

    invoke-interface {v0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v2

    invoke-virtual {v1, v2}, Lch/qos/logback/classic/Logger;->isEnabledFor(Lch/qos/logback/classic/Level;)Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-virtual {v1, v0}, Lch/qos/logback/classic/Logger;->callAppenders(Lch/qos/logback/classic/spi/ILoggingEvent;)V
    :try_end_35
    .catch Ljava/io/EOFException; {:try_start_12 .. :try_end_35} :catch_36
    .catch Ljava/net/SocketException; {:try_start_12 .. :try_end_35} :catch_66
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_35} :catch_6f
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_35} :catch_90

    goto :goto_12

    :catch_36
    move-exception v0

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->logger:Lch/qos/logback/classic/Logger;

    const-string v1, "Caught java.io.EOFException closing connection."

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    :cond_3e
    :goto_3e
    iget-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->socketServer:Lch/qos/logback/classic/net/SimpleSocketServer;

    invoke-virtual {v0, p0}, Lch/qos/logback/classic/net/SimpleSocketServer;->socketNodeClosing(Lch/qos/logback/classic/net/SocketNode;)V

    invoke-virtual {p0}, Lch/qos/logback/classic/net/SocketNode;->close()V

    return-void

    :catch_47
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketNode;->logger:Lch/qos/logback/classic/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Could not open ObjectInputStream to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/classic/net/SocketNode;->socket:Ljava/net/Socket;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lch/qos/logback/classic/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/classic/net/SocketNode;->closed:Z

    goto :goto_12

    :catch_66
    move-exception v0

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->logger:Lch/qos/logback/classic/Logger;

    const-string v1, "Caught java.net.SocketException closing connection."

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    goto :goto_3e

    :catch_6f
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketNode;->logger:Lch/qos/logback/classic/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Caught java.io.IOException: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    iget-object v0, p0, Lch/qos/logback/classic/net/SocketNode;->logger:Lch/qos/logback/classic/Logger;

    const-string v1, "Closing connection."

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    goto :goto_3e

    :catch_90
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketNode;->logger:Lch/qos/logback/classic/Logger;

    const-string v2, "Unexpected exception. Closing connection."

    invoke-virtual {v1, v2, v0}, Lch/qos/logback/classic/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3e
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/net/SocketNode;->remoteSocketAddress:Ljava/net/SocketAddress;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
