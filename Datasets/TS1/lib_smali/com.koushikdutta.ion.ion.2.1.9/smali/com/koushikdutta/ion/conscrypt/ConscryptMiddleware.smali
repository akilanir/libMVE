.class public Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;
.super Lcom/koushikdutta/async/http/SimpleMiddleware;
.source "ConscryptMiddleware.java"


# static fields
.field private static final GMS_PROVIDER:Ljava/lang/String; = "GmsCore_OpenSSL"

.field private static final LOGTAG:Ljava/lang/String; = "IonConscrypt"

.field static initialized:Z

.field static final lock:Ljava/lang/Object;

.field static success:Z


# instance fields
.field context:Landroid/content/Context;

.field enabled:Z

.field instanceInitialized:Z

.field middleware:Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->lock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "middleware"    # Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;

    .prologue
    .line 111
    invoke-direct {p0}, Lcom/koushikdutta/async/http/SimpleMiddleware;-><init>()V

    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->enabled:Z

    .line 112
    iput-object p2, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->middleware:Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;

    .line 113
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->context:Landroid/content/Context;

    .line 114
    return-void
.end method

.method public static initialize(Landroid/content/Context;)V
    .registers 16
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    :try_start_0
    sget-object v10, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->lock:Ljava/lang/Object;

    monitor-enter v10
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_1c

    .line 43
    :try_start_3
    sget-boolean v9, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->initialized:Z

    if-eqz v9, :cond_9

    .line 44
    monitor-exit v10

    .line 82
    :goto_8
    return-void

    .line 46
    :cond_9
    const/4 v9, 0x1

    sput-boolean v9, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->initialized:Z

    .line 49
    const-string v9, "GmsCore_OpenSSL"

    invoke-static {v9}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v9

    if-eqz v9, :cond_25

    .line 50
    const/4 v9, 0x1

    sput-boolean v9, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->success:Z

    .line 51
    monitor-exit v10

    goto :goto_8

    .line 77
    :catchall_19
    move-exception v9

    monitor-exit v10
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    :try_start_1b
    throw v9
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1c} :catch_1c

    .line 79
    :catch_1c
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    const-string v9, "IonConscrypt"

    const-string v10, "Conscrypt initialization failed."

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    .line 54
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_25
    :try_start_25
    invoke-static {}, Ljavax/net/ssl/SSLContext;->getDefault()Ljavax/net/ssl/SSLContext;

    move-result-object v4

    .line 55
    .local v4, "originalDefaultContext":Ljavax/net/ssl/SSLContext;
    invoke-static {}, Ljavax/net/ssl/HttpsURLConnection;->getDefaultSSLSocketFactory()Ljavax/net/ssl/SSLSocketFactory;
    :try_end_2c
    .catchall {:try_start_25 .. :try_end_2c} :catchall_19

    move-result-object v5

    .line 57
    .local v5, "originalDefaultSSLSocketFactory":Ljavax/net/ssl/SSLSocketFactory;
    :try_start_2d
    const-string v9, "com.google.android.gms.security.ProviderInstaller"

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    .line 58
    .local v7, "providerInstaller":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v9, "installIfNeeded"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Class;

    const/4 v12, 0x0

    const-class v13, Landroid/content/Context;

    aput-object v13, v11, v12

    invoke-virtual {v7, v9, v11}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 59
    .local v3, "mInsertProvider":Ljava/lang/reflect/Method;
    const/4 v9, 0x0

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p0, v11, v12

    invoke-virtual {v3, v9, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_2d .. :try_end_4b} :catch_69
    .catchall {:try_start_2d .. :try_end_4b} :catchall_19

    .line 70
    .end local v3    # "mInsertProvider":Ljava/lang/reflect/Method;
    .end local v7    # "providerInstaller":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_4b
    :try_start_4b
    invoke-static {}, Ljava/security/Security;->getProviders()[Ljava/security/Provider;

    move-result-object v8

    .line 71
    .local v8, "providers":[Ljava/security/Provider;
    const-string v9, "GmsCore_OpenSSL"

    invoke-static {v9}, Ljava/security/Security;->getProvider(Ljava/lang/String;)Ljava/security/Provider;

    move-result-object v6

    .line 72
    .local v6, "provider":Ljava/security/Provider;
    const-string v9, "GmsCore_OpenSSL"

    invoke-static {v9}, Ljava/security/Security;->removeProvider(Ljava/lang/String;)V

    .line 73
    array-length v9, v8

    invoke-static {v6, v9}, Ljava/security/Security;->insertProviderAt(Ljava/security/Provider;I)I

    .line 74
    invoke-static {v4}, Ljavax/net/ssl/SSLContext;->setDefault(Ljavax/net/ssl/SSLContext;)V

    .line 75
    invoke-static {v5}, Ljavax/net/ssl/HttpsURLConnection;->setDefaultSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 76
    const/4 v9, 0x1

    sput-boolean v9, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->success:Z

    .line 77
    monitor-exit v10

    goto :goto_8

    .line 61
    .end local v6    # "provider":Ljava/security/Provider;
    .end local v8    # "providers":[Ljava/security/Provider;
    :catch_69
    move-exception v2

    .line 62
    .local v2, "ignored":Ljava/lang/Throwable;
    const-string v9, "com.google.android.gms"

    const/4 v11, 0x3

    invoke-virtual {p0, v9, v11}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v1

    .line 64
    .local v1, "gms":Landroid/content/Context;
    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    const-string v11, "com.google.android.gms.common.security.ProviderInstallerImpl"

    .line 65
    invoke-virtual {v9, v11}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    const-string v11, "insertProvider"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Class;

    const/4 v13, 0x0

    const-class v14, Landroid/content/Context;

    aput-object v14, v12, v13

    .line 66
    invoke-virtual {v9, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    const/4 v11, 0x0

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object p0, v12, v13

    .line 67
    invoke-virtual {v9, v11, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_93
    .catchall {:try_start_4b .. :try_end_93} :catchall_19

    goto :goto_4b
.end method


# virtual methods
.method public enable(Z)V
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    .line 33
    iput-boolean p1, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->enabled:Z

    .line 34
    if-nez p1, :cond_d

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->instanceInitialized:Z

    .line 36
    iget-object v0, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->middleware:Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->setSSLContext(Ljavax/net/ssl/SSLContext;)V

    .line 38
    :cond_d
    return-void
.end method

.method public getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;
    .registers 3
    .param p1, "data"    # Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;

    .prologue
    .line 118
    iget-boolean v0, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->enabled:Z

    if-nez v0, :cond_6

    .line 119
    const/4 v0, 0x0

    .line 123
    :goto_5
    return-object v0

    .line 122
    :cond_6
    invoke-virtual {p0}, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->initialize()V

    .line 123
    invoke-super {p0, p1}, Lcom/koushikdutta/async/http/SimpleMiddleware;->getSocket(Lcom/koushikdutta/async/http/AsyncHttpClientMiddleware$GetSocketData;)Lcom/koushikdutta/async/future/Cancellable;

    move-result-object v0

    goto :goto_5
.end method

.method public initialize()V
    .registers 5

    .prologue
    .line 87
    iget-object v1, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->initialize(Landroid/content/Context;)V

    .line 88
    sget-boolean v1, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->success:Z

    if-eqz v1, :cond_3c

    iget-boolean v1, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->instanceInitialized:Z

    if-nez v1, :cond_3c

    iget-boolean v1, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->enabled:Z

    if-eqz v1, :cond_3c

    .line 89
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->instanceInitialized:Z

    .line 91
    const/4 v0, 0x0

    .line 93
    .local v0, "sslContext":Ljavax/net/ssl/SSLContext;
    :try_start_15
    const-string v1, "TLS"

    const-string v2, "GmsCore_OpenSSL"

    invoke-static {v1, v2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_1c} :catch_3f

    move-result-object v0

    .line 97
    :goto_1d
    if-nez v0, :cond_25

    .line 98
    :try_start_1f
    const-string v1, "TLS"

    invoke-static {v1}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 99
    :cond_25
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 101
    iget-object v1, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->middleware:Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;

    invoke-virtual {v1}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->getSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v1

    invoke-static {}, Lcom/koushikdutta/async/AsyncSSLSocketWrapper;->getDefaultSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v2

    if-ne v1, v2, :cond_3c

    .line 102
    iget-object v1, p0, Lcom/koushikdutta/ion/conscrypt/ConscryptMiddleware;->middleware:Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;

    invoke-virtual {v1, v0}, Lcom/koushikdutta/async/http/AsyncSSLSocketMiddleware;->setSSLContext(Ljavax/net/ssl/SSLContext;)V
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_3c} :catch_3d

    .line 107
    .end local v0    # "sslContext":Ljavax/net/ssl/SSLContext;
    :cond_3c
    :goto_3c
    return-void

    .line 104
    .restart local v0    # "sslContext":Ljavax/net/ssl/SSLContext;
    :catch_3d
    move-exception v1

    goto :goto_3c

    .line 95
    :catch_3f
    move-exception v1

    goto :goto_1d
.end method
