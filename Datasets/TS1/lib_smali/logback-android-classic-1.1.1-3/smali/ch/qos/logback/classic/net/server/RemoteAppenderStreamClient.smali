.class Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/classic/net/server/RemoteAppenderClient;


# instance fields
.field private final id:Ljava/lang/String;

.field private final inputStream:Ljava/io/InputStream;

.field private lc:Lch/qos/logback/classic/LoggerContext;

.field private logger:Lch/qos/logback/classic/Logger;

.field private final socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/io/InputStream;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->id:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->socket:Ljava/net/Socket;

    iput-object p2, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->inputStream:Ljava/io/InputStream;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/net/Socket;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->id:Ljava/lang/String;

    iput-object p2, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->socket:Ljava/net/Socket;

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->inputStream:Ljava/io/InputStream;

    return-void
.end method

.method private createObjectInputStream()Ljava/io/ObjectInputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->inputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/io/ObjectInputStream;

    iget-object v1, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->inputStream:Ljava/io/InputStream;

    invoke-direct {v0, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    :goto_b
    return-object v0

    :cond_c
    new-instance v0, Ljava/io/ObjectInputStream;

    iget-object v1, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->socket:Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_b
.end method


# virtual methods
.method public close()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->socket:Ljava/net/Socket;

    if-nez v0, :cond_5

    :goto_4
    return-void

    :cond_5
    iget-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->socket:Ljava/net/Socket;

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/net/Socket;)V

    goto :goto_4
.end method

.method public run()V
    .registers 7

    iget-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": connected"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    const/4 v0, 0x0

    :try_start_19
    invoke-direct {p0}, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->createObjectInputStream()Ljava/io/ObjectInputStream;
    :try_end_1c
    .catch Ljava/io/EOFException; {:try_start_19 .. :try_end_1c} :catch_14b
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1c} :catch_5e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_19 .. :try_end_1c} :catch_9f
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_1c} :catch_da
    .catchall {:try_start_19 .. :try_end_1c} :catchall_11c

    move-result-object v1

    :cond_1d
    :goto_1d
    :try_start_1d
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/spi/ILoggingEvent;

    iget-object v2, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->lc:Lch/qos/logback/classic/LoggerContext;

    invoke-interface {v0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lch/qos/logback/classic/LoggerContext;->getLogger(Ljava/lang/String;)Lch/qos/logback/classic/Logger;

    move-result-object v2

    invoke-interface {v0}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v3

    invoke-virtual {v2, v3}, Lch/qos/logback/classic/Logger;->isEnabledFor(Lch/qos/logback/classic/Level;)Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-virtual {v2, v0}, Lch/qos/logback/classic/Logger;->callAppenders(Lch/qos/logback/classic/spi/ILoggingEvent;)V
    :try_end_3a
    .catch Ljava/io/EOFException; {:try_start_1d .. :try_end_3a} :catch_3b
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_3a} :catch_148
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1d .. :try_end_3a} :catch_145
    .catch Ljava/lang/RuntimeException; {:try_start_1d .. :try_end_3a} :catch_143
    .catchall {:try_start_1d .. :try_end_3a} :catchall_141

    goto :goto_1d

    :catch_3b
    move-exception v0

    move-object v0, v1

    :goto_3d
    if-eqz v0, :cond_42

    invoke-static {v0}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_42
    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->close()V

    iget-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": connection closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    :goto_5d
    return-void

    :catch_5e
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    :goto_62
    :try_start_62
    iget-object v2, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V
    :try_end_7e
    .catchall {:try_start_62 .. :try_end_7e} :catchall_141

    if-eqz v1, :cond_83

    invoke-static {v1}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_83
    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->close()V

    iget-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": connection closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    goto :goto_5d

    :catch_9f
    move-exception v1

    move-object v1, v0

    :goto_a1
    :try_start_a1
    iget-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": unknown event class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lch/qos/logback/classic/Logger;->error(Ljava/lang/String;)V
    :try_end_b9
    .catchall {:try_start_a1 .. :try_end_b9} :catchall_141

    if-eqz v1, :cond_be

    invoke-static {v1}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_be
    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->close()V

    iget-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": connection closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    goto :goto_5d

    :catch_da
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    :goto_de
    :try_start_de
    iget-object v2, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lch/qos/logback/classic/Logger;->error(Ljava/lang/String;)V
    :try_end_fa
    .catchall {:try_start_de .. :try_end_fa} :catchall_141

    if-eqz v1, :cond_ff

    invoke-static {v1}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_ff
    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->close()V

    iget-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": connection closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    goto/16 :goto_5d

    :catchall_11c
    move-exception v1

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    :goto_120
    if-eqz v1, :cond_125

    invoke-static {v1}, Lch/qos/logback/core/util/CloseUtil;->closeQuietly(Ljava/io/Closeable;)V

    :cond_125
    invoke-virtual {p0}, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->close()V

    iget-object v1, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": connection closed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lch/qos/logback/classic/Logger;->info(Ljava/lang/String;)V

    throw v0

    :catchall_141
    move-exception v0

    goto :goto_120

    :catch_143
    move-exception v0

    goto :goto_de

    :catch_145
    move-exception v0

    goto/16 :goto_a1

    :catch_148
    move-exception v0

    goto/16 :goto_62

    :catch_14b
    move-exception v1

    goto/16 :goto_3d
.end method

.method public setLoggerContext(Lch/qos/logback/classic/LoggerContext;)V
    .registers 3

    iput-object p1, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->lc:Lch/qos/logback/classic/LoggerContext;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lch/qos/logback/classic/LoggerContext;->getLogger(Ljava/lang/String;)Lch/qos/logback/classic/Logger;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->logger:Lch/qos/logback/classic/Logger;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "client "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/net/server/RemoteAppenderStreamClient;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
