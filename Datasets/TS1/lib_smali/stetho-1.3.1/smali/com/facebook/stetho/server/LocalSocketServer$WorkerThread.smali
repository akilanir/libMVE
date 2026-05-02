.class Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;
.super Ljava/lang/Thread;
.source "LocalSocketServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/server/LocalSocketServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "WorkerThread"
.end annotation


# instance fields
.field private final mSocket:Landroid/net/LocalSocket;

.field private final mSocketHandler:Lcom/facebook/stetho/server/SocketHandler;


# direct methods
.method public constructor <init>(Landroid/net/LocalSocket;Lcom/facebook/stetho/server/SocketHandler;)V
    .registers 3
    .param p1, "socket"    # Landroid/net/LocalSocket;
    .param p2, "socketHandler"    # Lcom/facebook/stetho/server/SocketHandler;

    .prologue
    .line 159
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 160
    iput-object p1, p0, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;->mSocket:Landroid/net/LocalSocket;

    .line 161
    iput-object p2, p0, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;->mSocketHandler:Lcom/facebook/stetho/server/SocketHandler;

    .line 162
    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 167
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;->mSocketHandler:Lcom/facebook/stetho/server/SocketHandler;

    iget-object v2, p0, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;->mSocket:Landroid/net/LocalSocket;

    invoke-interface {v1, v2}, Lcom/facebook/stetho/server/SocketHandler;->onAccepted(Landroid/net/LocalSocket;)V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_7} :catch_d
    .catchall {:try_start_0 .. :try_end_7} :catchall_21

    .line 172
    :try_start_7
    iget-object v1, p0, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v1}, Landroid/net/LocalSocket;->close()V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_c} :catch_2a

    .line 176
    :goto_c
    return-void

    .line 168
    :catch_d
    move-exception v0

    .line 169
    .local v0, "ex":Ljava/io/IOException;
    :try_start_e
    const-string v1, "I/O error: %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_19
    .catchall {:try_start_e .. :try_end_19} :catchall_21

    .line 172
    :try_start_19
    iget-object v1, p0, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v1}, Landroid/net/LocalSocket;->close()V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_1e} :catch_1f

    goto :goto_c

    .line 173
    :catch_1f
    move-exception v1

    goto :goto_c

    .line 171
    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_21
    move-exception v1

    .line 172
    :try_start_22
    iget-object v2, p0, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;->mSocket:Landroid/net/LocalSocket;

    invoke-virtual {v2}, Landroid/net/LocalSocket;->close()V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_27} :catch_28

    .line 174
    :goto_27
    throw v1

    .line 173
    :catch_28
    move-exception v2

    goto :goto_27

    :catch_2a
    move-exception v1

    goto :goto_c
.end method
