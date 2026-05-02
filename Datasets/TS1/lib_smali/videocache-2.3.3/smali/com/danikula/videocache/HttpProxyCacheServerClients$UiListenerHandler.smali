.class final Lcom/danikula/videocache/HttpProxyCacheServerClients$UiListenerHandler;
.super Landroid/os/Handler;
.source "HttpProxyCacheServerClients.java"

# interfaces
.implements Lcom/danikula/videocache/CacheListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/danikula/videocache/HttpProxyCacheServerClients;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UiListenerHandler"
.end annotation


# instance fields
.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/danikula/videocache/CacheListener;",
            ">;"
        }
    .end annotation
.end field

.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .registers 4
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/danikula/videocache/CacheListener;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p2, "listeners":Ljava/util/List;, "Ljava/util/List<Lcom/danikula/videocache/CacheListener;>;"
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 96
    iput-object p1, p0, Lcom/danikula/videocache/HttpProxyCacheServerClients$UiListenerHandler;->url:Ljava/lang/String;

    .line 97
    iput-object p2, p0, Lcom/danikula/videocache/HttpProxyCacheServerClients$UiListenerHandler;->listeners:Ljava/util/List;

    .line 98
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 7
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 110
    iget-object v2, p0, Lcom/danikula/videocache/HttpProxyCacheServerClients$UiListenerHandler;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/danikula/videocache/CacheListener;

    .line 111
    .local v0, "cacheListener":Lcom/danikula/videocache/CacheListener;
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Ljava/io/File;

    iget-object v3, p0, Lcom/danikula/videocache/HttpProxyCacheServerClients$UiListenerHandler;->url:Ljava/lang/String;

    iget v4, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v0, v2, v3, v4}, Lcom/danikula/videocache/CacheListener;->onCacheAvailable(Ljava/io/File;Ljava/lang/String;I)V

    goto :goto_6

    .line 113
    .end local v0    # "cacheListener":Lcom/danikula/videocache/CacheListener;
    :cond_1e
    return-void
.end method

.method public onCacheAvailable(Ljava/io/File;Ljava/lang/String;I)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "percentsAvailable"    # I

    .prologue
    .line 102
    invoke-virtual {p0}, Lcom/danikula/videocache/HttpProxyCacheServerClients$UiListenerHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .line 103
    .local v0, "message":Landroid/os/Message;
    iput p3, v0, Landroid/os/Message;->arg1:I

    .line 104
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 105
    invoke-virtual {p0, v0}, Lcom/danikula/videocache/HttpProxyCacheServerClients$UiListenerHandler;->sendMessage(Landroid/os/Message;)Z

    .line 106
    return-void
.end method
