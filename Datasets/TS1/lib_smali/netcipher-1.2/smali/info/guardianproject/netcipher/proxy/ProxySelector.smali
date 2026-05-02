.class public Linfo/guardianproject/netcipher/proxy/ProxySelector;
.super Ljava/net/ProxySelector;
.source "ProxySelector.java"


# instance fields
.field private listProxies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/net/ProxySelector;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Linfo/guardianproject/netcipher/proxy/ProxySelector;->listProxies:Ljava/util/ArrayList;

    .line 24
    return-void
.end method


# virtual methods
.method public addProxy(Ljava/net/Proxy$Type;Ljava/lang/String;I)V
    .registers 6
    .param p1, "type"    # Ljava/net/Proxy$Type;
    .param p2, "host"    # Ljava/lang/String;
    .param p3, "port"    # I

    .prologue
    .line 28
    new-instance v0, Ljava/net/Proxy;

    new-instance v1, Ljava/net/InetSocketAddress;

    invoke-direct {v1, p2, p3}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, p1, v1}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    .line 29
    .local v0, "proxy":Ljava/net/Proxy;
    iget-object v1, p0, Linfo/guardianproject/netcipher/proxy/ProxySelector;->listProxies:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    return-void
.end method

.method public connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V
    .registers 7
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "address"    # Ljava/net/SocketAddress;
    .param p3, "failure"    # Ljava/io/IOException;

    .prologue
    .line 35
    const-string v0, "ProxySelector"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "could not connect to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    return-void
.end method

.method public select(Ljava/net/URI;)Ljava/util/List;
    .registers 3
    .param p1, "uri"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Linfo/guardianproject/netcipher/proxy/ProxySelector;->listProxies:Ljava/util/ArrayList;

    return-object v0
.end method
