.class public Lcom/loopj/android/http/BlackholeHttpResponseHandler;
.super Lcom/loopj/android/http/AsyncHttpResponseHandler;
.source "BlackholeHttpResponseHandler.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel()V
    .registers 1

    .prologue
    .line 33
    return-void
.end method

.method public onFailure(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V
    .registers 5
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p3, "responseBody"    # [B
    .param p4, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 23
    return-void
.end method

.method public onFinish()V
    .registers 1

    .prologue
    .line 38
    return-void
.end method

.method public onPostProcessResponse(Lcom/loopj/android/http/ResponseHandlerInterface;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 3
    .param p1, "instance"    # Lcom/loopj/android/http/ResponseHandlerInterface;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 43
    return-void
.end method

.method public onPreProcessResponse(Lcom/loopj/android/http/ResponseHandlerInterface;Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 3
    .param p1, "instance"    # Lcom/loopj/android/http/ResponseHandlerInterface;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    .line 48
    return-void
.end method

.method public onProgress(JJ)V
    .registers 5
    .param p1, "bytesWritten"    # J
    .param p3, "totalSize"    # J

    .prologue
    .line 28
    return-void
.end method

.method public onRetry(I)V
    .registers 2
    .param p1, "retryNo"    # I

    .prologue
    .line 53
    return-void
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 58
    return-void
.end method

.method public onSuccess(I[Lcz/msebera/android/httpclient/Header;[B)V
    .registers 4
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p3, "responseBody"    # [B

    .prologue
    .line 18
    return-void
.end method

.method public onUserException(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 63
    return-void
.end method
