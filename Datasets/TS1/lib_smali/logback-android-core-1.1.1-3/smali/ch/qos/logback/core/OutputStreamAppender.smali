.class public Lch/qos/logback/core/OutputStreamAppender;
.super Lch/qos/logback/core/UnsynchronizedAppenderBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/UnsynchronizedAppenderBase",
        "<TE;>;"
    }
.end annotation


# instance fields
.field protected encoder:Lch/qos/logback/core/encoder/Encoder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/encoder/Encoder",
            "<TE;>;"
        }
    .end annotation
.end field

.field protected lock:Lch/qos/logback/core/spi/LogbackLock;

.field private outputStream:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;-><init>()V

    new-instance v0, Lch/qos/logback/core/spi/LogbackLock;

    invoke-direct {v0}, Lch/qos/logback/core/spi/LogbackLock;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->lock:Lch/qos/logback/core/spi/LogbackLock;

    return-void
.end method


# virtual methods
.method protected append(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/OutputStreamAppender;->isStarted()Z

    move-result v0

    if-nez v0, :cond_7

    :goto_6
    return-void

    :cond_7
    invoke-virtual {p0, p1}, Lch/qos/logback/core/OutputStreamAppender;->subAppend(Ljava/lang/Object;)V

    goto :goto_6
.end method

.method protected closeOutputStream()V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_f

    :try_start_4
    invoke-virtual {p0}, Lch/qos/logback/core/OutputStreamAppender;->encoderClose()V

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->outputStream:Ljava/io/OutputStream;
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_f} :catch_10

    :cond_f
    :goto_f
    return-void

    :catch_10
    move-exception v0

    new-instance v1, Lch/qos/logback/core/status/ErrorStatus;

    const-string v2, "Could not close output stream for OutputStreamAppender."

    invoke-direct {v1, v2, p0, v0}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Lch/qos/logback/core/OutputStreamAppender;->addStatus(Lch/qos/logback/core/status/Status;)V

    goto :goto_f
.end method

.method encoderClose()V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_d

    :try_start_8
    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    invoke-interface {v0}, Lch/qos/logback/core/encoder/Encoder;->close()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_d} :catch_e

    :cond_d
    :goto_d
    return-void

    :catch_e
    move-exception v0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lch/qos/logback/core/OutputStreamAppender;->started:Z

    new-instance v1, Lch/qos/logback/core/status/ErrorStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to write footer for appender named ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/core/OutputStreamAppender;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p0, v0}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Lch/qos/logback/core/OutputStreamAppender;->addStatus(Lch/qos/logback/core/status/Status;)V

    goto :goto_d
.end method

.method encoderInit()V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    if-eqz v0, :cond_f

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->outputStream:Ljava/io/OutputStream;

    if-eqz v0, :cond_f

    :try_start_8
    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    iget-object v1, p0, Lch/qos/logback/core/OutputStreamAppender;->outputStream:Ljava/io/OutputStream;

    invoke-interface {v0, v1}, Lch/qos/logback/core/encoder/Encoder;->init(Ljava/io/OutputStream;)V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_f} :catch_10

    :cond_f
    :goto_f
    return-void

    :catch_10
    move-exception v0

    const/4 v1, 0x0

    iput-boolean v1, p0, Lch/qos/logback/core/OutputStreamAppender;->started:Z

    new-instance v1, Lch/qos/logback/core/status/ErrorStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to initialize encoder for appender named ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/core/OutputStreamAppender;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p0, v0}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v1}, Lch/qos/logback/core/OutputStreamAppender;->addStatus(Lch/qos/logback/core/status/Status;)V

    goto :goto_f
.end method

.method public getEncoder()Lch/qos/logback/core/encoder/Encoder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/encoder/Encoder",
            "<TE;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->outputStream:Ljava/io/OutputStream;

    return-object v0
.end method

.method public setEncoder(Lch/qos/logback/core/encoder/Encoder;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/encoder/Encoder",
            "<TE;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    return-void
.end method

.method public setLayout(Lch/qos/logback/core/Layout;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/Layout",
            "<TE;>;)V"
        }
    .end annotation

    const-string v0, "This appender no longer admits a layout as a sub-component, set an encoder instead."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/OutputStreamAppender;->addWarn(Ljava/lang/String;)V

    const-string v0, "To ensure compatibility, wrapping your layout in LayoutWrappingEncoder."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/OutputStreamAppender;->addWarn(Ljava/lang/String;)V

    const-string v0, "See also http://logback.qos.ch/codes.html#layoutInsteadOfEncoder for details"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/OutputStreamAppender;->addWarn(Ljava/lang/String;)V

    new-instance v0, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;

    invoke-direct {v0}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;-><init>()V

    invoke-virtual {v0, p1}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->setLayout(Lch/qos/logback/core/Layout;)V

    iget-object v1, p0, Lch/qos/logback/core/OutputStreamAppender;->context:Lch/qos/logback/core/Context;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/encoder/LayoutWrappingEncoder;->setContext(Lch/qos/logback/core/Context;)V

    iput-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    return-void
.end method

.method public setOutputStream(Ljava/io/OutputStream;)V
    .registers 4

    iget-object v1, p0, Lch/qos/logback/core/OutputStreamAppender;->lock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lch/qos/logback/core/OutputStreamAppender;->closeOutputStream()V

    iput-object p1, p0, Lch/qos/logback/core/OutputStreamAppender;->outputStream:Ljava/io/OutputStream;

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    if-nez v0, :cond_13

    const-string v0, "Encoder has not been set. Cannot invoke its init method."

    invoke-virtual {p0, v0}, Lch/qos/logback/core/OutputStreamAppender;->addWarn(Ljava/lang/String;)V

    monitor-exit v1

    :goto_12
    return-void

    :cond_13
    invoke-virtual {p0}, Lch/qos/logback/core/OutputStreamAppender;->encoderInit()V

    monitor-exit v1

    goto :goto_12

    :catchall_18
    move-exception v0

    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw v0
.end method

.method public start()V
    .registers 5

    const/4 v0, 0x0

    iget-object v1, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    if-nez v1, :cond_29

    new-instance v0, Lch/qos/logback/core/status/ErrorStatus;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No encoder set for the appender named \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/OutputStreamAppender;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\"."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/OutputStreamAppender;->addStatus(Lch/qos/logback/core/status/Status;)V

    const/4 v0, 0x1

    :cond_29
    iget-object v1, p0, Lch/qos/logback/core/OutputStreamAppender;->outputStream:Ljava/io/OutputStream;

    if-nez v1, :cond_52

    new-instance v1, Lch/qos/logback/core/status/ErrorStatus;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No output stream set for the appender named \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lch/qos/logback/core/OutputStreamAppender;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\"."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lch/qos/logback/core/OutputStreamAppender;->addStatus(Lch/qos/logback/core/status/Status;)V

    add-int/lit8 v0, v0, 0x1

    :cond_52
    if-nez v0, :cond_57

    invoke-super {p0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;->start()V

    :cond_57
    return-void
.end method

.method public stop()V
    .registers 3

    iget-object v1, p0, Lch/qos/logback/core/OutputStreamAppender;->lock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v1

    :try_start_3
    invoke-virtual {p0}, Lch/qos/logback/core/OutputStreamAppender;->closeOutputStream()V

    invoke-super {p0}, Lch/qos/logback/core/UnsynchronizedAppenderBase;->stop()V

    monitor-exit v1

    return-void

    :catchall_b
    move-exception v0

    monitor-exit v1
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_b

    throw v0
.end method

.method protected subAppend(Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/OutputStreamAppender;->isStarted()Z

    move-result v1

    if-nez v1, :cond_7

    :goto_6
    return-void

    :cond_7
    :try_start_7
    instance-of v1, p1, Lch/qos/logback/core/spi/DeferredProcessingAware;

    if-eqz v1, :cond_12

    move-object v0, p1

    check-cast v0, Lch/qos/logback/core/spi/DeferredProcessingAware;

    move-object v1, v0

    invoke-interface {v1}, Lch/qos/logback/core/spi/DeferredProcessingAware;->prepareForDeferredProcessing()V

    :cond_12
    iget-object v2, p0, Lch/qos/logback/core/OutputStreamAppender;->lock:Lch/qos/logback/core/spi/LogbackLock;

    monitor-enter v2
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_15} :catch_1d

    :try_start_15
    invoke-virtual {p0, p1}, Lch/qos/logback/core/OutputStreamAppender;->writeOut(Ljava/lang/Object;)V

    monitor-exit v2

    goto :goto_6

    :catchall_1a
    move-exception v1

    monitor-exit v2
    :try_end_1c
    .catchall {:try_start_15 .. :try_end_1c} :catchall_1a

    :try_start_1c
    throw v1
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_1d} :catch_1d

    :catch_1d
    move-exception v1

    const/4 v2, 0x0

    iput-boolean v2, p0, Lch/qos/logback/core/OutputStreamAppender;->started:Z

    new-instance v2, Lch/qos/logback/core/status/ErrorStatus;

    const-string v3, "IO failure in appender"

    invoke-direct {v2, v3, p0, v1}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v2}, Lch/qos/logback/core/OutputStreamAppender;->addStatus(Lch/qos/logback/core/status/Status;)V

    goto :goto_6
.end method

.method protected writeOut(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/OutputStreamAppender;->encoder:Lch/qos/logback/core/encoder/Encoder;

    invoke-interface {v0, p1}, Lch/qos/logback/core/encoder/Encoder;->doEncode(Ljava/lang/Object;)V

    return-void
.end method
