.class Lfreemarker/debug/impl/DebuggerServer;
.super Ljava/lang/Object;
.source "DebuggerServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;
    }
.end annotation


# static fields
.field private static final R:Ljava/util/Random;

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private final debuggerStub:Ljava/io/Serializable;

.field private final password:[B

.field private final port:I

.field private serverSocket:Ljava/net/ServerSocket;

.field private stop:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 77
    const-string v0, "freemarker.debug.server"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/debug/impl/DebuggerServer;->logger:Lfreemarker/log/Logger;

    .line 79
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    sput-object v0, Lfreemarker/debug/impl/DebuggerServer;->R:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>(Ljava/io/Serializable;)V
    .registers 5
    .param p1, "debuggerStub"    # Ljava/io/Serializable;

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    const/4 v1, 0x0

    iput-boolean v1, p0, Lfreemarker/debug/impl/DebuggerServer;->stop:Z

    .line 89
    const-string v1, "freemarker.debug.port"

    const/16 v2, 0x1b63

    invoke-static {v1, v2}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, p0, Lfreemarker/debug/impl/DebuggerServer;->port:I

    .line 92
    :try_start_14
    const-string v1, "freemarker.debug.password"

    const-string v2, ""

    invoke-static {v1, v2}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    iput-object v1, p0, Lfreemarker/debug/impl/DebuggerServer;->password:[B
    :try_end_24
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_14 .. :try_end_24} :catch_27

    .line 98
    iput-object p1, p0, Lfreemarker/debug/impl/DebuggerServer;->debuggerStub:Ljava/io/Serializable;

    .line 99
    return-void

    .line 94
    :catch_27
    move-exception v0

    .line 96
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static access$000(Lfreemarker/debug/impl/DebuggerServer;)V
    .registers 1
    .param p0, "x0"    # Lfreemarker/debug/impl/DebuggerServer;

    .prologue
    .line 75
    invoke-direct {p0}, Lfreemarker/debug/impl/DebuggerServer;->startInternal()V

    return-void
.end method

.method static access$100()Ljava/util/Random;
    .registers 1

    .prologue
    .line 75
    sget-object v0, Lfreemarker/debug/impl/DebuggerServer;->R:Ljava/util/Random;

    return-object v0
.end method

.method static access$200(Lfreemarker/debug/impl/DebuggerServer;)[B
    .registers 2
    .param p0, "x0"    # Lfreemarker/debug/impl/DebuggerServer;

    .prologue
    .line 75
    iget-object v0, p0, Lfreemarker/debug/impl/DebuggerServer;->password:[B

    return-object v0
.end method

.method static access$300(Lfreemarker/debug/impl/DebuggerServer;)Ljava/io/Serializable;
    .registers 2
    .param p0, "x0"    # Lfreemarker/debug/impl/DebuggerServer;

    .prologue
    .line 75
    iget-object v0, p0, Lfreemarker/debug/impl/DebuggerServer;->debuggerStub:Ljava/io/Serializable;

    return-object v0
.end method

.method static access$400()Lfreemarker/log/Logger;
    .registers 1

    .prologue
    .line 75
    sget-object v0, Lfreemarker/debug/impl/DebuggerServer;->logger:Lfreemarker/log/Logger;

    return-object v0
.end method

.method private startInternal()V
    .registers 5

    .prologue
    .line 116
    :try_start_0
    new-instance v2, Ljava/net/ServerSocket;

    iget v3, p0, Lfreemarker/debug/impl/DebuggerServer;->port:I

    invoke-direct {v2, v3}, Ljava/net/ServerSocket;-><init>(I)V

    iput-object v2, p0, Lfreemarker/debug/impl/DebuggerServer;->serverSocket:Ljava/net/ServerSocket;

    .line 117
    :goto_9
    iget-boolean v2, p0, Lfreemarker/debug/impl/DebuggerServer;->stop:Z

    if-nez v2, :cond_29

    .line 119
    iget-object v2, p0, Lfreemarker/debug/impl/DebuggerServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v2}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v1

    .line 120
    .local v1, "s":Ljava/net/Socket;
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;

    invoke-direct {v3, p0, v1}, Lfreemarker/debug/impl/DebuggerServer$DebuggerAuthProtocol;-><init>(Lfreemarker/debug/impl/DebuggerServer;Ljava/net/Socket;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_20} :catch_21

    goto :goto_9

    .line 123
    .end local v1    # "s":Ljava/net/Socket;
    :catch_21
    move-exception v0

    .line 125
    .local v0, "e":Ljava/io/IOException;
    sget-object v2, Lfreemarker/debug/impl/DebuggerServer;->logger:Lfreemarker/log/Logger;

    const-string v3, "Debugger server shut down."

    invoke-virtual {v2, v3, v0}, Lfreemarker/log/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 127
    .end local v0    # "e":Ljava/io/IOException;
    :cond_29
    return-void
.end method


# virtual methods
.method public start()V
    .registers 4

    .prologue
    .line 103
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lfreemarker/debug/impl/DebuggerServer$1;

    invoke-direct {v1, p0}, Lfreemarker/debug/impl/DebuggerServer$1;-><init>(Lfreemarker/debug/impl/DebuggerServer;)V

    const-string v2, "FreeMarker Debugger Server Acceptor"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 110
    return-void
.end method

.method public stop()V
    .registers 4

    .prologue
    .line 171
    const/4 v1, 0x1

    iput-boolean v1, p0, Lfreemarker/debug/impl/DebuggerServer;->stop:Z

    .line 172
    iget-object v1, p0, Lfreemarker/debug/impl/DebuggerServer;->serverSocket:Ljava/net/ServerSocket;

    if-eqz v1, :cond_c

    .line 176
    :try_start_7
    iget-object v1, p0, Lfreemarker/debug/impl/DebuggerServer;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_d

    .line 183
    :cond_c
    :goto_c
    return-void

    .line 178
    :catch_d
    move-exception v0

    .line 180
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lfreemarker/debug/impl/DebuggerServer;->logger:Lfreemarker/log/Logger;

    const-string v2, "Unable to close server socket."

    invoke-virtual {v1, v2, v0}, Lfreemarker/log/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_c
.end method
