.class Lcz/msebera/android/httpclient/impl/client/cache/ResponseProxyHandler;
.super Ljava/lang/Object;
.source "ResponseProxyHandler.java"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final CLOSE_METHOD:Ljava/lang/reflect/Method;


# instance fields
.field private final original:Lcz/msebera/android/httpclient/HttpResponse;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 52
    :try_start_0
    const-class v1, Ljava/io/Closeable;

    const-string v2, "close"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    sput-object v1, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProxyHandler;->CLOSE_METHOD:Ljava/lang/reflect/Method;
    :try_end_d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_d} :catch_e

    .line 56
    return-void

    .line 53
    :catch_e
    move-exception v0

    .line 54
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/Error;

    invoke-direct {v1, v0}, Ljava/lang/Error;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method constructor <init>(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 2
    .param p1, "original"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProxyHandler;->original:Lcz/msebera/android/httpclient/HttpResponse;

    .line 63
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProxyHandler;->original:Lcz/msebera/android/httpclient/HttpResponse;

    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    invoke-static {v0}, Lcz/msebera/android/httpclient/impl/client/cache/IOUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 67
    return-void
.end method

.method public invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "proxy"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 71
    sget-object v2, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProxyHandler;->CLOSE_METHOD:Ljava/lang/reflect/Method;

    invoke-virtual {p2, v2}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 72
    invoke-virtual {p0}, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProxyHandler;->close()V

    .line 73
    const/4 v2, 0x0

    .line 76
    :goto_c
    return-object v2

    :cond_d
    :try_start_d
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/client/cache/ResponseProxyHandler;->original:Lcz/msebera/android/httpclient/HttpResponse;

    invoke-virtual {p2, v2, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_12
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_d .. :try_end_12} :catch_14

    move-result-object v2

    goto :goto_c

    .line 77
    :catch_14
    move-exception v1

    .line 78
    .local v1, "ex":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 79
    .local v0, "cause":Ljava/lang/Throwable;
    if-eqz v0, :cond_1c

    .line 80
    throw v0

    .line 82
    :cond_1c
    throw v1
.end method
