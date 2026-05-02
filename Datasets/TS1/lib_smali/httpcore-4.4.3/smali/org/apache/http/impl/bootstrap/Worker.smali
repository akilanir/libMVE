.class Lorg/apache/http/impl/bootstrap/Worker;
.super Ljava/lang/Object;
.source "Worker.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final conn:Lorg/apache/http/HttpServerConnection;

.field private final exceptionLogger:Lorg/apache/http/ExceptionLogger;

.field private final httpservice:Lorg/apache/http/protocol/HttpService;


# direct methods
.method constructor <init>(Lorg/apache/http/protocol/HttpService;Lorg/apache/http/HttpServerConnection;Lorg/apache/http/ExceptionLogger;)V
    .registers 4
    .param p1, "httpservice"    # Lorg/apache/http/protocol/HttpService;
    .param p2, "conn"    # Lorg/apache/http/HttpServerConnection;
    .param p3, "exceptionLogger"    # Lorg/apache/http/ExceptionLogger;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/apache/http/impl/bootstrap/Worker;->httpservice:Lorg/apache/http/protocol/HttpService;

    .line 52
    iput-object p2, p0, Lorg/apache/http/impl/bootstrap/Worker;->conn:Lorg/apache/http/HttpServerConnection;

    .line 53
    iput-object p3, p0, Lorg/apache/http/impl/bootstrap/Worker;->exceptionLogger:Lorg/apache/http/ExceptionLogger;

    .line 54
    return-void
.end method


# virtual methods
.method public getConnection()Lorg/apache/http/HttpServerConnection;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lorg/apache/http/impl/bootstrap/Worker;->conn:Lorg/apache/http/HttpServerConnection;

    return-object v0
.end method

.method public run()V
    .registers 6

    .prologue
    .line 63
    :try_start_0
    new-instance v2, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v2}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 64
    .local v2, "localContext":Lorg/apache/http/protocol/BasicHttpContext;
    invoke-static {v2}, Lorg/apache/http/protocol/HttpCoreContext;->adapt(Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/protocol/HttpCoreContext;

    move-result-object v0

    .line 65
    .local v0, "context":Lorg/apache/http/protocol/HttpCoreContext;
    :goto_9
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v3

    if-nez v3, :cond_2e

    iget-object v3, p0, Lorg/apache/http/impl/bootstrap/Worker;->conn:Lorg/apache/http/HttpServerConnection;

    invoke-interface {v3}, Lorg/apache/http/HttpServerConnection;->isOpen()Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 66
    iget-object v3, p0, Lorg/apache/http/impl/bootstrap/Worker;->httpservice:Lorg/apache/http/protocol/HttpService;

    iget-object v4, p0, Lorg/apache/http/impl/bootstrap/Worker;->conn:Lorg/apache/http/HttpServerConnection;

    invoke-virtual {v3, v4, v0}, Lorg/apache/http/protocol/HttpService;->handleRequest(Lorg/apache/http/HttpServerConnection;Lorg/apache/http/protocol/HttpContext;)V

    .line 67
    invoke-virtual {v2}, Lorg/apache/http/protocol/BasicHttpContext;->clear()V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_21} :catch_22
    .catchall {:try_start_0 .. :try_end_21} :catchall_47

    goto :goto_9

    .line 70
    .end local v0    # "context":Lorg/apache/http/protocol/HttpCoreContext;
    .end local v2    # "localContext":Lorg/apache/http/protocol/BasicHttpContext;
    :catch_22
    move-exception v1

    .line 71
    .local v1, "ex":Ljava/lang/Exception;
    :try_start_23
    iget-object v3, p0, Lorg/apache/http/impl/bootstrap/Worker;->exceptionLogger:Lorg/apache/http/ExceptionLogger;

    invoke-interface {v3, v1}, Lorg/apache/http/ExceptionLogger;->log(Ljava/lang/Exception;)V
    :try_end_28
    .catchall {:try_start_23 .. :try_end_28} :catchall_47

    .line 74
    :try_start_28
    iget-object v3, p0, Lorg/apache/http/impl/bootstrap/Worker;->conn:Lorg/apache/http/HttpServerConnection;

    invoke-interface {v3}, Lorg/apache/http/HttpServerConnection;->shutdown()V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_28 .. :try_end_2d} :catch_40

    .line 79
    .end local v1    # "ex":Ljava/lang/Exception;
    :goto_2d
    return-void

    .line 69
    .restart local v0    # "context":Lorg/apache/http/protocol/HttpCoreContext;
    .restart local v2    # "localContext":Lorg/apache/http/protocol/BasicHttpContext;
    :cond_2e
    :try_start_2e
    iget-object v3, p0, Lorg/apache/http/impl/bootstrap/Worker;->conn:Lorg/apache/http/HttpServerConnection;

    invoke-interface {v3}, Lorg/apache/http/HttpServerConnection;->close()V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_33} :catch_22
    .catchall {:try_start_2e .. :try_end_33} :catchall_47

    .line 74
    :try_start_33
    iget-object v3, p0, Lorg/apache/http/impl/bootstrap/Worker;->conn:Lorg/apache/http/HttpServerConnection;

    invoke-interface {v3}, Lorg/apache/http/HttpServerConnection;->shutdown()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_38} :catch_39

    goto :goto_2d

    .line 75
    :catch_39
    move-exception v1

    .line 76
    .local v1, "ex":Ljava/io/IOException;
    iget-object v3, p0, Lorg/apache/http/impl/bootstrap/Worker;->exceptionLogger:Lorg/apache/http/ExceptionLogger;

    invoke-interface {v3, v1}, Lorg/apache/http/ExceptionLogger;->log(Ljava/lang/Exception;)V

    goto :goto_2d

    .line 75
    .end local v0    # "context":Lorg/apache/http/protocol/HttpCoreContext;
    .end local v2    # "localContext":Lorg/apache/http/protocol/BasicHttpContext;
    .local v1, "ex":Ljava/lang/Exception;
    :catch_40
    move-exception v1

    .line 76
    .local v1, "ex":Ljava/io/IOException;
    iget-object v3, p0, Lorg/apache/http/impl/bootstrap/Worker;->exceptionLogger:Lorg/apache/http/ExceptionLogger;

    invoke-interface {v3, v1}, Lorg/apache/http/ExceptionLogger;->log(Ljava/lang/Exception;)V

    goto :goto_2d

    .line 73
    .end local v1    # "ex":Ljava/io/IOException;
    :catchall_47
    move-exception v3

    .line 74
    :try_start_48
    iget-object v4, p0, Lorg/apache/http/impl/bootstrap/Worker;->conn:Lorg/apache/http/HttpServerConnection;

    invoke-interface {v4}, Lorg/apache/http/HttpServerConnection;->shutdown()V
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_48 .. :try_end_4d} :catch_4e

    .line 77
    :goto_4d
    throw v3

    .line 75
    :catch_4e
    move-exception v1

    .line 76
    .restart local v1    # "ex":Ljava/io/IOException;
    iget-object v4, p0, Lorg/apache/http/impl/bootstrap/Worker;->exceptionLogger:Lorg/apache/http/ExceptionLogger;

    invoke-interface {v4, v1}, Lorg/apache/http/ExceptionLogger;->log(Ljava/lang/Exception;)V

    goto :goto_4d
.end method
