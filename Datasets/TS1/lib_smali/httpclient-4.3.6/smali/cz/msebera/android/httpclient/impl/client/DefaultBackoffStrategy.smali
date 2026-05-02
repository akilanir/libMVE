.class public Lcz/msebera/android/httpclient/impl/client/DefaultBackoffStrategy;
.super Ljava/lang/Object;
.source "DefaultBackoffStrategy.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/ConnectionBackoffStrategy;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldBackoff(Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 4
    .param p1, "resp"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 51
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    const/16 v1, 0x1f7

    if-ne v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public shouldBackoff(Ljava/lang/Throwable;)Z
    .registers 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 46
    instance-of v0, p1, Ljava/net/SocketTimeoutException;

    if-nez v0, :cond_8

    instance-of v0, p1, Ljava/net/ConnectException;

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
