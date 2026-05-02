.class public abstract Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;
.super Lcom/loopj/android/http/FileAsyncHttpResponseHandler;
.source "RangeFileAsyncHttpResponseHandler.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "RangeFileAsyncHttpRH"


# instance fields
.field private append:Z

.field private current:J


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;-><init>(Ljava/io/File;)V

    .line 38
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->append:Z

    .line 48
    return-void
.end method


# virtual methods
.method protected getResponseData(Lcz/msebera/android/httpclient/HttpEntity;)[B
    .registers 12
    .param p1, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    if-eqz p1, :cond_5a

    .line 79
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3

    .line 80
    .local v3, "instream":Ljava/io/InputStream;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v6

    iget-wide v8, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    add-long v1, v6, v8

    .line 81
    .local v1, "contentLength":J
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->getTargetFile()Ljava/io/File;

    move-result-object v6

    iget-boolean v7, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->append:Z

    invoke-direct {v0, v6, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 82
    .local v0, "buffer":Ljava/io/FileOutputStream;
    if-eqz v3, :cond_5a

    .line 84
    const/16 v6, 0x1000

    :try_start_1d
    new-array v5, v6, [B

    .line 86
    .local v5, "tmp":[B
    :goto_1f
    iget-wide v6, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    cmp-long v6, v6, v1

    if-gez v6, :cond_51

    invoke-virtual {v3, v5}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .local v4, "l":I
    const/4 v6, -0x1

    if-eq v4, v6, :cond_51

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v6

    if-nez v6, :cond_51

    .line 87
    iget-wide v6, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    int-to-long v8, v4

    add-long/2addr v6, v8

    iput-wide v6, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    .line 88
    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6, v4}, Ljava/io/FileOutputStream;->write([BII)V

    .line 89
    iget-wide v6, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    invoke-virtual {p0, v6, v7, v1, v2}, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->sendProgressMessage(JJ)V
    :try_end_45
    .catchall {:try_start_1d .. :try_end_45} :catchall_46

    goto :goto_1f

    .line 92
    .end local v4    # "l":I
    .end local v5    # "tmp":[B
    :catchall_46
    move-exception v6

    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 93
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 94
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    throw v6

    .line 92
    .restart local v5    # "tmp":[B
    :cond_51
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 93
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 94
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 98
    .end local v0    # "buffer":Ljava/io/FileOutputStream;
    .end local v1    # "contentLength":J
    .end local v3    # "instream":Ljava/io/InputStream;
    .end local v5    # "tmp":[B
    :cond_5a
    const/4 v6, 0x0

    return-object v6
.end method

.method public sendResponseMessage(Lcz/msebera/android/httpclient/HttpResponse;)V
    .registers 10
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 52
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_2c

    .line 53
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v1

    .line 54
    .local v1, "status":Lcz/msebera/android/httpclient/StatusLine;
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v3, 0x1a0

    if-ne v2, v3, :cond_2d

    .line 56
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_2c

    .line 57
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    invoke-virtual {p0, v2, v3, v7}, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->sendSuccessMessage(I[Lcz/msebera/android/httpclient/Header;[B)V

    .line 74
    .end local v1    # "status":Lcz/msebera/android/httpclient/StatusLine;
    :cond_2c
    :goto_2c
    return-void

    .line 58
    .restart local v1    # "status":Lcz/msebera/android/httpclient/StatusLine;
    :cond_2d
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v3, 0x12c

    if-lt v2, v3, :cond_58

    .line 59
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_2c

    .line 60
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    new-instance v4, Lcz/msebera/android/httpclient/client/HttpResponseException;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v5

    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcz/msebera/android/httpclient/client/HttpResponseException;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, v2, v3, v7, v4}, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->sendFailureMessage(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V

    goto :goto_2c

    .line 62
    :cond_58
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_2c

    .line 63
    const-string v2, "Content-Range"

    invoke-interface {p1, v2}, Lcz/msebera/android/httpclient/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lcz/msebera/android/httpclient/Header;

    move-result-object v0

    .line 64
    .local v0, "header":Lcz/msebera/android/httpclient/Header;
    if-nez v0, :cond_85

    .line 65
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->append:Z

    .line 66
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    .line 70
    :goto_71
    invoke-interface {v1}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getAllHeaders()[Lcz/msebera/android/httpclient/Header;

    move-result-object v3

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpResponse;->getEntity()Lcz/msebera/android/httpclient/HttpEntity;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->getResponseData(Lcz/msebera/android/httpclient/HttpEntity;)[B

    move-result-object v4

    invoke-virtual {p0, v2, v3, v4}, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->sendSuccessMessage(I[Lcz/msebera/android/httpclient/Header;[B)V

    goto :goto_2c

    .line 68
    :cond_85
    sget-object v2, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v3, "RangeFileAsyncHttpRH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Content-Range: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Lcz/msebera/android/httpclient/Header;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/loopj/android/http/LogInterface;->v(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_71
.end method

.method public updateRequestHeaders(Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;)V
    .registers 6
    .param p1, "uriRequest"    # Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;

    .prologue
    .line 102
    iget-object v0, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 103
    iget-object v0, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    .line 104
    :cond_18
    iget-wide v0, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_43

    .line 105
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->append:Z

    .line 106
    const-string v0, "Range"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bytes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/loopj/android/http/RangeFileAsyncHttpResponseHandler;->current:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcz/msebera/android/httpclient/client/methods/HttpUriRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    :cond_43
    return-void
.end method
