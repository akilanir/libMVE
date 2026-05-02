.class public Lcz/msebera/android/httpclient/impl/client/BasicResponseHandler;
.super Ljava/lang/Object;
.source "BasicResponseHandler.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/ResponseHandler;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcz/msebera/android/httpclient/client/ResponseHandler",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handleResponse(Lcz/msebera/android/httpclient/HttpResponse;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/client/ClientProtocolException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcz/msebera/android/httpclient/impl/client/BasicResponseHandler;->handleResponse(Lcz/msebera/android/httpclient/HttpResponse;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handleResponse(Lcz/msebera/android/httpclient/HttpResponse;)Ljava/lang/String;
    .registers 7
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/client/HttpResponseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v1

    .line 64
    .local v1, "statusLine":Lcz/msebera/android/httpclient/StatusLine;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v0

    .line 65
    .local v0, "entity":Lcz/msebera/android/httpclient/HttpEntity;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v3, 0x12c

    if-lt v2, v3, :cond_21

    .line 66
    invoke-static {v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->consume(Lcz/msebera/android/httpclient/HttpEntity;)V

    .line 67
    new-instance v2, Lcz/msebera/android/httpclient/client/HttpResponseException;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v3

    .line 68
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcz/msebera/android/httpclient/client/HttpResponseException;-><init>(ILjava/lang/String;)V

    throw v2

    .line 70
    :cond_21
    if-nez v0, :cond_25

    const/4 v2, 0x0

    :goto_24
    return-object v2

    :cond_25
    invoke-static {v0}, Lcz/msebera/android/httpclient/util/EntityUtils;->toString(Lcz/msebera/android/httpclient/HttpEntity;)Ljava/lang/String;

    move-result-object v2

    goto :goto_24
.end method
