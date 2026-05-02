.class public Lcom/koushikdutta/ion/mock/MockLoader;
.super Lcom/koushikdutta/ion/loader/SimpleLoader;
.source "MockLoader.java"


# instance fields
.field requestHandler:Lcom/koushikdutta/ion/mock/MockRequestHandler;


# direct methods
.method private constructor <init>(Lcom/koushikdutta/ion/mock/MockRequestHandler;)V
    .registers 2
    .param p1, "requestHandler"    # Lcom/koushikdutta/ion/mock/MockRequestHandler;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/koushikdutta/ion/loader/SimpleLoader;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/koushikdutta/ion/mock/MockLoader;->requestHandler:Lcom/koushikdutta/ion/mock/MockRequestHandler;

    .line 27
    return-void
.end method

.method public static install(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/ion/mock/MockRequestHandler;)V
    .registers 7
    .param p0, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p1, "requestHandler"    # Lcom/koushikdutta/ion/mock/MockRequestHandler;

    .prologue
    .line 16
    new-instance v2, Lcom/koushikdutta/ion/mock/MockLoader;

    invoke-direct {v2, p1}, Lcom/koushikdutta/ion/mock/MockLoader;-><init>(Lcom/koushikdutta/ion/mock/MockRequestHandler;)V

    .line 17
    .local v2, "mockLoader":Lcom/koushikdutta/ion/mock/MockLoader;
    invoke-virtual {p0}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v3

    invoke-virtual {v3}, Lcom/koushikdutta/ion/Ion$Config;->getLoaders()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_29

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/koushikdutta/ion/Loader;

    .line 18
    .local v1, "loader":Lcom/koushikdutta/ion/Loader;
    instance-of v3, v1, Lcom/koushikdutta/ion/mock/MockLoader;

    if-eqz v3, :cond_11

    .line 19
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "MockLoader already installed."

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 21
    .end local v1    # "loader":Lcom/koushikdutta/ion/Loader;
    :cond_29
    invoke-virtual {p0}, Lcom/koushikdutta/ion/Ion;->configure()Lcom/koushikdutta/ion/Ion$Config;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Lcom/koushikdutta/ion/Ion$Config;->addLoader(ILcom/koushikdutta/ion/Loader;)Lcom/koushikdutta/ion/Ion$Config;

    .line 22
    return-void
.end method


# virtual methods
.method public load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/reflect/Type;)Lcom/koushikdutta/ion/future/ResponseFuture;
    .registers 8
    .param p1, "ion"    # Lcom/koushikdutta/ion/Ion;
    .param p2, "request"    # Lcom/koushikdutta/async/http/AsyncHttpRequest;
    .param p3, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/koushikdutta/ion/Ion;",
            "Lcom/koushikdutta/async/http/AsyncHttpRequest;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Lcom/koushikdutta/ion/future/ResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 31
    iget-object v2, p0, Lcom/koushikdutta/ion/mock/MockLoader;->requestHandler:Lcom/koushikdutta/ion/mock/MockRequestHandler;

    invoke-virtual {p2}, Lcom/koushikdutta/async/http/AsyncHttpRequest;->getUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/koushikdutta/ion/mock/MockRequestHandler;->request(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 32
    .local v0, "result":Ljava/lang/Object;, "TT;"
    if-eqz v0, :cond_19

    .line 33
    new-instance v1, Lcom/koushikdutta/ion/mock/MockResponseFuture;

    invoke-direct {v1, p2}, Lcom/koushikdutta/ion/mock/MockResponseFuture;-><init>(Lcom/koushikdutta/async/http/AsyncHttpRequest;)V

    .line 34
    .local v1, "ret":Lcom/koushikdutta/ion/mock/MockResponseFuture;, "Lcom/koushikdutta/ion/mock/MockResponseFuture<TT;>;"
    invoke-virtual {v1, v0}, Lcom/koushikdutta/ion/mock/MockResponseFuture;->setComplete(Ljava/lang/Object;)Z

    .line 37
    .end local v1    # "ret":Lcom/koushikdutta/ion/mock/MockResponseFuture;, "Lcom/koushikdutta/ion/mock/MockResponseFuture<TT;>;"
    :goto_18
    return-object v1

    :cond_19
    invoke-super {p0, p1, p2, p3}, Lcom/koushikdutta/ion/loader/SimpleLoader;->load(Lcom/koushikdutta/ion/Ion;Lcom/koushikdutta/async/http/AsyncHttpRequest;Ljava/lang/reflect/Type;)Lcom/koushikdutta/ion/future/ResponseFuture;

    move-result-object v1

    goto :goto_18
.end method
