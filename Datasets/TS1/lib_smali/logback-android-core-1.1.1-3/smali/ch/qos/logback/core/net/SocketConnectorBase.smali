.class public Lch/qos/logback/core/net/SocketConnectorBase;
.super Ljava/lang/Object;

# interfaces
.implements Lch/qos/logback/core/net/SocketConnector;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/net/SocketConnectorBase$1;,
        Lch/qos/logback/core/net/SocketConnectorBase$FixedDelay;,
        Lch/qos/logback/core/net/SocketConnectorBase$ConsoleExceptionHandler;,
        Lch/qos/logback/core/net/SocketConnectorBase$DelayStrategy;
    }
.end annotation


# instance fields
.field private final address:Ljava/net/InetAddress;

.field private final connectCondition:Ljava/util/concurrent/locks/Condition;

.field private delayStrategy:Lch/qos/logback/core/net/SocketConnectorBase$DelayStrategy;

.field private exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

.field private final lock:Ljava/util/concurrent/locks/Lock;

.field private final port:I

.field private socket:Ljava/net/Socket;

.field private socketFactory:Ljavax/net/SocketFactory;


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;III)V
    .registers 6

    new-instance v0, Lch/qos/logback/core/net/SocketConnectorBase$FixedDelay;

    invoke-direct {v0, p3, p4}, Lch/qos/logback/core/net/SocketConnectorBase$FixedDelay;-><init>(II)V

    invoke-direct {p0, p1, p2, v0}, Lch/qos/logback/core/net/SocketConnectorBase;-><init>(Ljava/net/InetAddress;ILch/qos/logback/core/net/SocketConnectorBase$DelayStrategy;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILch/qos/logback/core/net/SocketConnectorBase$DelayStrategy;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->lock:Ljava/util/concurrent/locks/Lock;

    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->connectCondition:Ljava/util/concurrent/locks/Condition;

    iput-object p1, p0, Lch/qos/logback/core/net/SocketConnectorBase;->address:Ljava/net/InetAddress;

    iput p2, p0, Lch/qos/logback/core/net/SocketConnectorBase;->port:I

    iput-object p3, p0, Lch/qos/logback/core/net/SocketConnectorBase;->delayStrategy:Lch/qos/logback/core/net/SocketConnectorBase$DelayStrategy;

    return-void
.end method

.method private signalConnected()V
    .registers 3

    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    :try_start_5
    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->connectCondition:Ljava/util/concurrent/locks/Condition;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_a
    .catchall {:try_start_5 .. :try_end_a} :catchall_10

    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_10
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/core/net/SocketConnectorBase;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method


# virtual methods
.method public awaitConnection()Ljava/net/Socket;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const-wide v0, 0x7fffffffffffffffL

    invoke-virtual {p0, v0, v1}, Lch/qos/logback/core/net/SocketConnectorBase;->awaitConnection(J)Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public awaitConnection(J)Ljava/net/Socket;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    move v0, v1

    :goto_7
    :try_start_7
    iget-object v2, p0, Lch/qos/logback/core/net/SocketConnectorBase;->socket:Ljava/net/Socket;

    if-nez v2, :cond_1b

    if-nez v0, :cond_1b

    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->connectCondition:Ljava/util/concurrent/locks/Condition;

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, p1, p2, v2}, Ljava/util/concurrent/locks/Condition;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    goto :goto_7

    :cond_19
    move v0, v1

    goto :goto_7

    :cond_1b
    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->socket:Ljava/net/Socket;
    :try_end_1d
    .catchall {:try_start_7 .. :try_end_1d} :catchall_23

    iget-object v1, p0, Lch/qos/logback/core/net/SocketConnectorBase;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v0

    :catchall_23
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/core/net/SocketConnectorBase;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/net/SocketConnectorBase;->call()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/net/Socket;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public run()V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->socket:Ljava/net/Socket;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "connector cannot be reused"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

    if-nez v0, :cond_18

    new-instance v0, Lch/qos/logback/core/net/SocketConnectorBase$ConsoleExceptionHandler;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lch/qos/logback/core/net/SocketConnectorBase$ConsoleExceptionHandler;-><init>(Lch/qos/logback/core/net/SocketConnectorBase$1;)V

    iput-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

    :cond_18
    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->socketFactory:Ljavax/net/SocketFactory;

    if-nez v0, :cond_22

    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->socketFactory:Ljavax/net/SocketFactory;

    :cond_22
    :goto_22
    :try_start_22
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_45

    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->delayStrategy:Lch/qos/logback/core/net/SocketConnectorBase$DelayStrategy;

    invoke-interface {v0}, Lch/qos/logback/core/net/SocketConnectorBase$DelayStrategy;->nextDelay()I

    move-result v0

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_36
    .catch Ljava/lang/InterruptedException; {:try_start_22 .. :try_end_36} :catch_4d

    :try_start_36
    iget-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->socketFactory:Ljavax/net/SocketFactory;

    iget-object v1, p0, Lch/qos/logback/core/net/SocketConnectorBase;->address:Ljava/net/InetAddress;

    iget v2, p0, Lch/qos/logback/core/net/SocketConnectorBase;->port:I

    invoke-virtual {v0, v1, v2}, Ljavax/net/SocketFactory;->createSocket(Ljava/net/InetAddress;I)Ljava/net/Socket;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/net/SocketConnectorBase;->socket:Ljava/net/Socket;

    invoke-direct {p0}, Lch/qos/logback/core/net/SocketConnectorBase;->signalConnected()V
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_45} :catch_46
    .catch Ljava/lang/InterruptedException; {:try_start_36 .. :try_end_45} :catch_4d

    :cond_45
    :goto_45
    return-void

    :catch_46
    move-exception v0

    :try_start_47
    iget-object v1, p0, Lch/qos/logback/core/net/SocketConnectorBase;->exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

    invoke-interface {v1, p0, v0}, Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;->connectionFailed(Lch/qos/logback/core/net/SocketConnector;Ljava/lang/Exception;)V
    :try_end_4c
    .catch Ljava/lang/InterruptedException; {:try_start_47 .. :try_end_4c} :catch_4d

    goto :goto_22

    :catch_4d
    move-exception v0

    iget-object v1, p0, Lch/qos/logback/core/net/SocketConnectorBase;->exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

    invoke-interface {v1, p0, v0}, Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;->connectionFailed(Lch/qos/logback/core/net/SocketConnector;Ljava/lang/Exception;)V

    goto :goto_45
.end method

.method public setExceptionHandler(Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/SocketConnectorBase;->exceptionHandler:Lch/qos/logback/core/net/SocketConnector$ExceptionHandler;

    return-void
.end method

.method public setSocketFactory(Ljavax/net/SocketFactory;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/net/SocketConnectorBase;->socketFactory:Ljavax/net/SocketFactory;

    return-void
.end method
