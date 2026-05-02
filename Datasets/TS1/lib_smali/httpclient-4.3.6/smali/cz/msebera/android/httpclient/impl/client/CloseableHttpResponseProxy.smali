.class Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;
.super Ljava/lang/Object;
.source "CloseableHttpResponseProxy.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final CONSTRUCTOR:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation
.end field


# instance fields
.field private final original:Lcz/msebera/android/httpclient/HttpResponse;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    .line 53
    :try_start_0
    const-class v1, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/reflect/Proxy;->getProxyClass(Ljava/lang/ClassLoader;[Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/lang/reflect/InvocationHandler;

    aput-object v4, v2, v3

    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    sput-object v1, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;->CONSTRUCTOR:Ljava/lang/reflect/Constructor;
    :try_end_20
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_20} :catch_21

    .line 58
    return-void

    .line 55
    :catch_21
    move-exception v0

    .line 56
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method constructor <init>(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 2
    .param p1, "original"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;->original:Lcz/msebera/android/httpclient/HttpResponse;

    .line 65
    return-void
.end method

.method public static newProxy(Lcz/msebera/android/httpclient/HttpResponse;)Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    .registers 6
    .param p0, "original"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 94
    :try_start_0
    sget-object v1, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;->CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;

    invoke-direct {v4, p0}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;-><init>(Lcz/msebera/android/httpclient/HttpResponse;)V

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcz/msebera/android/httpclient/client/methods/CloseableHttpResponse;
    :try_end_13
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_13} :catch_14
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_13} :catch_1b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_13} :catch_22

    return-object v1

    .line 95
    :catch_14
    move-exception v0

    .line 96
    .local v0, "ex":Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 97
    .end local v0    # "ex":Ljava/lang/InstantiationException;
    :catch_1b
    move-exception v0

    .line 98
    .local v0, "ex":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 99
    .end local v0    # "ex":Ljava/lang/reflect/InvocationTargetException;
    :catch_22
    move-exception v0

    .line 100
    .local v0, "ex":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;->original:Lcz/msebera/android/httpclient/HttpResponse;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 69
    .local v0, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    invoke-static {v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 70
    return-void
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 75
    .local v2, "mname":Ljava/lang/String;
    const-string v3, "close"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 76
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;->close()V

    .line 77
    const/4 v3, 0x0

    .line 80
    :goto_10
    return-object v3

    :cond_11
    :try_start_11
    iget-object v3, p0, Lcz/msebera/android/httpclient/impl/client/CloseableHttpResponseProxy;->original:Lcz/msebera/android/httpclient/HttpResponse;

    invoke-virtual {p2, v3, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_11 .. :try_end_16} :catch_18

    move-result-object v3

    goto :goto_10

    .line 81
    :catch_18
    move-exception v1

    .line 82
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 83
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_20

    .line 84
    throw v0

    .line 86
    :cond_20
    throw v1
.end method
