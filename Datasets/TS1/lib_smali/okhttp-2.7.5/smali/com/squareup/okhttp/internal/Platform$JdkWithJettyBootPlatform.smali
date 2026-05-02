.class Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;
.super Lcom/squareup/okhttp/internal/Platform$JdkPlatform;
.source "Platform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/squareup/okhttp/internal/Platform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JdkWithJettyBootPlatform"
.end annotation


# instance fields
.field private final clientProviderClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final getMethod:Ljava/lang/reflect/Method;

.field private final putMethod:Ljava/lang/reflect/Method;

.field private final removeMethod:Ljava/lang/reflect/Method;

.field private final serverProviderClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 7
    .param p2, "putMethod"    # Ljava/lang/reflect/Method;
    .param p3, "getMethod"    # Ljava/lang/reflect/Method;
    .param p4, "removeMethod"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 359
    .local p1, "sslContextClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p5, "clientProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p6, "serverProviderClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1}, Lcom/squareup/okhttp/internal/Platform$JdkPlatform;-><init>(Ljava/lang/Class;)V

    .line 360
    iput-object p2, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->putMethod:Ljava/lang/reflect/Method;

    .line 361
    iput-object p3, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->getMethod:Ljava/lang/reflect/Method;

    .line 362
    iput-object p4, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->removeMethod:Ljava/lang/reflect/Method;

    .line 363
    iput-object p5, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->clientProviderClass:Ljava/lang/Class;

    .line 364
    iput-object p6, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->serverProviderClass:Ljava/lang/Class;

    .line 365
    return-void
.end method


# virtual methods
.method public afterHandshake(Ljavax/net/ssl/SSLSocket;)V
    .registers 7
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    .line 386
    :try_start_0
    iget-object v1, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->removeMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_c} :catch_d
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_c} :catch_d

    .line 390
    return-void

    .line 387
    :catch_d
    move-exception v0

    .line 388
    .local v0, "ignored":Ljava/lang/ReflectiveOperationException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;)V
    .registers 14
    .param p1, "sslSocket"    # Ljavax/net/ssl/SSLSocket;
    .param p2, "hostname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLSocket;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/squareup/okhttp/Protocol;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 369
    .local p3, "protocols":Ljava/util/List;, "Ljava/util/List<Lcom/squareup/okhttp/Protocol;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v2, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 370
    .local v2, "names":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v5

    .local v5, "size":I
    :goto_e
    if-ge v1, v5, :cond_25

    .line 371
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/squareup/okhttp/Protocol;

    .line 372
    .local v3, "protocol":Lcom/squareup/okhttp/Protocol;
    sget-object v6, Lcom/squareup/okhttp/Protocol;->HTTP_1_0:Lcom/squareup/okhttp/Protocol;

    if-ne v3, v6, :cond_1d

    .line 370
    :goto_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 373
    :cond_1d
    invoke-virtual {v3}, Lcom/squareup/okhttp/Protocol;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 376
    .end local v3    # "protocol":Lcom/squareup/okhttp/Protocol;
    :cond_25
    :try_start_25
    const-class v6, Lcom/squareup/okhttp/internal/Platform;

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->clientProviderClass:Ljava/lang/Class;

    aput-object v9, v7, v8

    const/4 v8, 0x1

    iget-object v9, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->serverProviderClass:Ljava/lang/Class;

    aput-object v9, v7, v8

    new-instance v8, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;

    invoke-direct {v8, v2}, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;-><init>(Ljava/util/List;)V

    invoke-static {v6, v7, v8}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v4

    .line 378
    .local v4, "provider":Ljava/lang/Object;
    iget-object v6, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->putMethod:Ljava/lang/reflect/Method;

    const/4 v7, 0x0

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object p1, v8, v9

    const/4 v9, 0x1

    aput-object v4, v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_50
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_25 .. :try_end_50} :catch_51
    .catch Ljava/lang/IllegalAccessException; {:try_start_25 .. :try_end_50} :catch_51

    .line 382
    return-void

    .line 379
    .end local v4    # "provider":Ljava/lang/Object;
    :catch_51
    move-exception v0

    .line 380
    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 9
    .param p1, "socket"    # Ljavax/net/ssl/SSLSocket;

    .prologue
    const/4 v2, 0x0

    .line 394
    :try_start_1
    iget-object v3, p0, Lcom/squareup/okhttp/internal/Platform$JdkWithJettyBootPlatform;->getMethod:Ljava/lang/reflect/Method;

    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    .line 395
    invoke-virtual {v3, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/reflect/Proxy;->getInvocationHandler(Ljava/lang/Object;)Ljava/lang/reflect/InvocationHandler;

    move-result-object v1

    check-cast v1, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;

    .line 396
    .local v1, "provider":Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;
    # getter for: Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->unsupported:Z
    invoke-static {v1}, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->access$000(Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;)Z

    move-result v3

    if-nez v3, :cond_2a

    # getter for: Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->selected:Ljava/lang/String;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->access$100(Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2a

    .line 397
    sget-object v3, Lcom/squareup/okhttp/internal/Internal;->logger:Ljava/util/logging/Logger;

    sget-object v4, Ljava/util/logging/Level;->INFO:Ljava/util/logging/Level;

    const-string v5, "ALPN callback dropped: SPDY and HTTP/2 are disabled. Is alpn-boot on the boot class path?"

    invoke-virtual {v3, v4, v5}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;)V

    .line 401
    :cond_29
    :goto_29
    return-object v2

    :cond_2a
    # getter for: Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->unsupported:Z
    invoke-static {v1}, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->access$000(Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;)Z

    move-result v3

    if-nez v3, :cond_29

    # getter for: Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->selected:Ljava/lang/String;
    invoke-static {v1}, Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;->access$100(Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;)Ljava/lang/String;
    :try_end_33
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_33} :catch_35
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_33} :catch_35

    move-result-object v2

    goto :goto_29

    .line 402
    .end local v1    # "provider":Lcom/squareup/okhttp/internal/Platform$JettyNegoProvider;
    :catch_35
    move-exception v0

    .line 403
    .local v0, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
.end method
