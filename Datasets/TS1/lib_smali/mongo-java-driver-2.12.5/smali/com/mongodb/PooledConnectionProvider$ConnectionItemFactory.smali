.class Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;
.super Ljava/lang/Object;
.source "PooledConnectionProvider.java"

# interfaces
.implements Lcom/mongodb/ConcurrentPool$ItemFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/PooledConnectionProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectionItemFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mongodb/ConcurrentPool$ItemFactory",
        "<",
        "Lcom/mongodb/Connection;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/PooledConnectionProvider;


# direct methods
.method private constructor <init>(Lcom/mongodb/PooledConnectionProvider;)V
    .registers 2

    .prologue
    .line 183
    iput-object p1, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/PooledConnectionProvider$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/mongodb/PooledConnectionProvider;
    .param p2, "x1"    # Lcom/mongodb/PooledConnectionProvider$1;

    .prologue
    .line 183
    invoke-direct {p0, p1}, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;-><init>(Lcom/mongodb/PooledConnectionProvider;)V

    return-void
.end method


# virtual methods
.method public close(Lcom/mongodb/Connection;)V
    .registers 8
    .param p1, "connection"    # Lcom/mongodb/Connection;

    .prologue
    .line 195
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # invokes: Lcom/mongodb/PooledConnectionProvider;->fromPreviousGeneration(Lcom/mongodb/Connection;)Z
    invoke-static {v1, p1}, Lcom/mongodb/PooledConnectionProvider;->access$1100(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Connection;)Z

    move-result v1

    if-eqz v1, :cond_4c

    .line 196
    const-string v0, "there was a socket exception raised on another connection from this pool"

    .line 204
    .local v0, "reason":Ljava/lang/String;
    :goto_a
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->closed:Z
    invoke-static {v1}, Lcom/mongodb/PooledConnectionProvider;->access$1400(Lcom/mongodb/PooledConnectionProvider;)Z

    move-result v1

    if-nez v1, :cond_2c

    .line 205
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;
    invoke-static {v1}, Lcom/mongodb/PooledConnectionProvider;->access$1000(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConnectionPoolListener;

    move-result-object v1

    new-instance v2, Lcom/mongodb/ConnectionEvent;

    iget-object v3, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;
    invoke-static {v3}, Lcom/mongodb/PooledConnectionProvider;->access$900(Lcom/mongodb/PooledConnectionProvider;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;
    invoke-static {v4}, Lcom/mongodb/PooledConnectionProvider;->access$200(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/mongodb/ConnectionEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V

    invoke-interface {v1, v2}, Lcom/mongodb/ConnectionPoolListener;->connectionRemoved(Lcom/mongodb/ConnectionEvent;)V

    .line 207
    :cond_2c
    invoke-interface {p1}, Lcom/mongodb/Connection;->close()V

    .line 208
    # getter for: Lcom/mongodb/PooledConnectionProvider;->LOGGER:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/mongodb/PooledConnectionProvider;->access$300()Ljava/util/logging/Logger;

    move-result-object v1

    const-string v2, "Closed connection to %s because %s."

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;
    invoke-static {v5}, Lcom/mongodb/PooledConnectionProvider;->access$200(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ServerAddress;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 209
    return-void

    .line 197
    .end local v0    # "reason":Ljava/lang/String;
    :cond_4c
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # invokes: Lcom/mongodb/PooledConnectionProvider;->pastMaxLifeTime(Lcom/mongodb/Connection;)Z
    invoke-static {v1, p1}, Lcom/mongodb/PooledConnectionProvider;->access$1200(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Connection;)Z

    move-result v1

    if-eqz v1, :cond_57

    .line 198
    const-string v0, "it is past its maximum allowed life time"

    .restart local v0    # "reason":Ljava/lang/String;
    goto :goto_a

    .line 199
    .end local v0    # "reason":Ljava/lang/String;
    :cond_57
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # invokes: Lcom/mongodb/PooledConnectionProvider;->pastMaxIdleTime(Lcom/mongodb/Connection;)Z
    invoke-static {v1, p1}, Lcom/mongodb/PooledConnectionProvider;->access$1300(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Connection;)Z

    move-result v1

    if-eqz v1, :cond_62

    .line 200
    const-string v0, "it is past its maximum allowed idle time"

    .restart local v0    # "reason":Ljava/lang/String;
    goto :goto_a

    .line 202
    .end local v0    # "reason":Ljava/lang/String;
    :cond_62
    const-string v0, "the pool has been closed"

    .restart local v0    # "reason":Ljava/lang/String;
    goto :goto_a
.end method

.method public bridge synthetic close(Ljava/lang/Object;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 183
    check-cast p1, Lcom/mongodb/Connection;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->close(Lcom/mongodb/Connection;)V

    return-void
.end method

.method public create()Lcom/mongodb/Connection;
    .registers 7

    .prologue
    .line 186
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->connectionFactory:Lcom/mongodb/ConnectionFactory;
    invoke-static {v1}, Lcom/mongodb/PooledConnectionProvider;->access$800(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConnectionFactory;

    move-result-object v1

    iget-object v2, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;
    invoke-static {v2}, Lcom/mongodb/PooledConnectionProvider;->access$200(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ServerAddress;

    move-result-object v2

    iget-object v3, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->generation:Ljava/util/concurrent/atomic/AtomicInteger;
    invoke-static {v4}, Lcom/mongodb/PooledConnectionProvider;->access$700(Lcom/mongodb/PooledConnectionProvider;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v4

    invoke-interface {v1, v2, v3, v4}, Lcom/mongodb/ConnectionFactory;->create(Lcom/mongodb/ServerAddress;Lcom/mongodb/PooledConnectionProvider;I)Lcom/mongodb/Connection;

    move-result-object v0

    .line 187
    .local v0, "connection":Lcom/mongodb/Connection;
    # getter for: Lcom/mongodb/PooledConnectionProvider;->LOGGER:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/mongodb/PooledConnectionProvider;->access$300()Ljava/util/logging/Logger;

    move-result-object v1

    const-string v2, "Opened connection to %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;
    invoke-static {v5}, Lcom/mongodb/PooledConnectionProvider;->access$200(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ServerAddress;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/logging/Logger;->fine(Ljava/lang/String;)V

    .line 188
    iget-object v1, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->connectionPoolListener:Lcom/mongodb/ConnectionPoolListener;
    invoke-static {v1}, Lcom/mongodb/PooledConnectionProvider;->access$1000(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ConnectionPoolListener;

    move-result-object v1

    new-instance v2, Lcom/mongodb/ConnectionEvent;

    iget-object v3, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->clusterId:Ljava/lang/String;
    invoke-static {v3}, Lcom/mongodb/PooledConnectionProvider;->access$900(Lcom/mongodb/PooledConnectionProvider;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # getter for: Lcom/mongodb/PooledConnectionProvider;->serverAddress:Lcom/mongodb/ServerAddress;
    invoke-static {v4}, Lcom/mongodb/PooledConnectionProvider;->access$200(Lcom/mongodb/PooledConnectionProvider;)Lcom/mongodb/ServerAddress;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/mongodb/ConnectionEvent;-><init>(Ljava/lang/String;Lcom/mongodb/ServerAddress;)V

    invoke-interface {v1, v2}, Lcom/mongodb/ConnectionPoolListener;->connectionAdded(Lcom/mongodb/ConnectionEvent;)V

    .line 189
    return-object v0
.end method

.method public bridge synthetic create()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 183
    invoke-virtual {p0}, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->create()Lcom/mongodb/Connection;

    move-result-object v0

    return-object v0
.end method

.method public shouldPrune(Lcom/mongodb/Connection;)Z
    .registers 3
    .param p1, "connection"    # Lcom/mongodb/Connection;

    .prologue
    .line 213
    iget-object v0, p0, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->this$0:Lcom/mongodb/PooledConnectionProvider;

    # invokes: Lcom/mongodb/PooledConnectionProvider;->shouldPrune(Lcom/mongodb/Connection;)Z
    invoke-static {v0, p1}, Lcom/mongodb/PooledConnectionProvider;->access$1500(Lcom/mongodb/PooledConnectionProvider;Lcom/mongodb/Connection;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic shouldPrune(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 183
    check-cast p1, Lcom/mongodb/Connection;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/mongodb/PooledConnectionProvider$ConnectionItemFactory;->shouldPrune(Lcom/mongodb/Connection;)Z

    move-result v0

    return v0
.end method
