.class Lcom/sun/mail/util/TimeoutOutputStream;
.super Ljava/io/OutputStream;
.source "WriteTimeoutSocket.java"


# instance fields
.field private b1:[B

.field private final os:Ljava/io/OutputStream;

.field private final ses:Ljava/util/concurrent/ScheduledExecutorService;

.field private final timeout:I

.field private final timeoutTask:Ljava/util/concurrent/Callable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Callable",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Ljava/util/concurrent/ScheduledExecutorService;I)V
    .registers 5
    .param p1, "os0"    # Ljava/io/OutputStream;
    .param p2, "ses"    # Ljava/util/concurrent/ScheduledExecutorService;
    .param p3, "timeout"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 315
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 316
    iput-object p1, p0, Lcom/sun/mail/util/TimeoutOutputStream;->os:Ljava/io/OutputStream;

    .line 317
    iput-object p2, p0, Lcom/sun/mail/util/TimeoutOutputStream;->ses:Ljava/util/concurrent/ScheduledExecutorService;

    .line 318
    iput p3, p0, Lcom/sun/mail/util/TimeoutOutputStream;->timeout:I

    .line 319
    new-instance v0, Lcom/sun/mail/util/TimeoutOutputStream$1;

    invoke-direct {v0, p0}, Lcom/sun/mail/util/TimeoutOutputStream$1;-><init>(Lcom/sun/mail/util/TimeoutOutputStream;)V

    iput-object v0, p0, Lcom/sun/mail/util/TimeoutOutputStream;->timeoutTask:Ljava/util/concurrent/Callable;

    .line 325
    return-void
.end method

.method static synthetic access$000(Lcom/sun/mail/util/TimeoutOutputStream;)Ljava/io/OutputStream;
    .registers 2
    .param p0, "x0"    # Lcom/sun/mail/util/TimeoutOutputStream;

    .prologue
    .line 307
    iget-object v0, p0, Lcom/sun/mail/util/TimeoutOutputStream;->os:Ljava/io/OutputStream;

    return-object v0
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    iget-object v0, p0, Lcom/sun/mail/util/TimeoutOutputStream;->os:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 366
    return-void
.end method

.method public declared-synchronized write(I)V
    .registers 5
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 329
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/util/TimeoutOutputStream;->b1:[B

    if-nez v0, :cond_a

    .line 330
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/sun/mail/util/TimeoutOutputStream;->b1:[B

    .line 331
    :cond_a
    iget-object v0, p0, Lcom/sun/mail/util/TimeoutOutputStream;->b1:[B

    const/4 v1, 0x0

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 332
    iget-object v0, p0, Lcom/sun/mail/util/TimeoutOutputStream;->b1:[B

    invoke-virtual {p0, v0}, Lcom/sun/mail/util/TimeoutOutputStream;->write([B)V
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_17

    .line 333
    monitor-exit p0

    return-void

    .line 329
    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized write([BII)V
    .registers 10
    .param p1, "bs"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 338
    monitor-enter p0

    if-ltz p2, :cond_11

    :try_start_3
    array-length v1, p1

    if-gt p2, v1, :cond_11

    if-ltz p3, :cond_11

    add-int v1, p2, p3

    array-length v2, p1

    if-gt v1, v2, :cond_11

    add-int v1, p2, p3

    if-gez v1, :cond_1a

    .line 340
    :cond_11
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v1
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_17

    .line 338
    :catchall_17
    move-exception v1

    monitor-exit p0

    throw v1

    .line 341
    :cond_1a
    if-nez p3, :cond_1e

    .line 361
    :cond_1c
    :goto_1c
    monitor-exit p0

    return-void

    .line 346
    :cond_1e
    const/4 v0, 0x0

    .line 349
    .local v0, "sf":Ljava/util/concurrent/ScheduledFuture;, "Ljava/util/concurrent/ScheduledFuture<Ljava/lang/Object;>;"
    :try_start_1f
    iget v1, p0, Lcom/sun/mail/util/TimeoutOutputStream;->timeout:I

    if-lez v1, :cond_30

    .line 350
    iget-object v1, p0, Lcom/sun/mail/util/TimeoutOutputStream;->ses:Ljava/util/concurrent/ScheduledExecutorService;

    iget-object v2, p0, Lcom/sun/mail/util/TimeoutOutputStream;->timeoutTask:Ljava/util/concurrent/Callable;

    iget v3, p0, Lcom/sun/mail/util/TimeoutOutputStream;->timeout:I

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v3, v4, v5}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/util/concurrent/Callable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_2f
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1f .. :try_end_2f} :catch_44
    .catchall {:try_start_1f .. :try_end_2f} :catchall_3c

    move-result-object v0

    .line 356
    :cond_30
    :goto_30
    :try_start_30
    iget-object v1, p0, Lcom/sun/mail/util/TimeoutOutputStream;->os:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_35
    .catchall {:try_start_30 .. :try_end_35} :catchall_3c

    .line 358
    if-eqz v0, :cond_1c

    .line 359
    const/4 v1, 0x1

    :try_start_38
    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    goto :goto_1c

    .line 358
    :catchall_3c
    move-exception v1

    if-eqz v0, :cond_43

    .line 359
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_43
    throw v1
    :try_end_44
    .catchall {:try_start_38 .. :try_end_44} :catchall_17

    .line 352
    :catch_44
    move-exception v1

    goto :goto_30
.end method
