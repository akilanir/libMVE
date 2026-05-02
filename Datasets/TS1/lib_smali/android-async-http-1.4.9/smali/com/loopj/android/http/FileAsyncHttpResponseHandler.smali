.class public abstract Lcom/loopj/android/http/FileAsyncHttpResponseHandler;
.super Lcom/loopj/android/http/AsyncHttpResponseHandler;
.source "FileAsyncHttpResponseHandler.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "FileAsyncHttpRH"


# instance fields
.field protected final append:Z

.field protected final file:Ljava/io/File;

.field protected frontendFile:Ljava/io/File;

.field protected final renameIfExists:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 100
    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>()V

    .line 101
    invoke-virtual {p0, p1}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getTemporaryFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->file:Ljava/io/File;

    .line 102
    iput-boolean v1, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->append:Z

    .line 103
    iput-boolean v1, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->renameIfExists:Z

    .line 104
    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;-><init>(Ljava/io/File;Z)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;-><init>(Ljava/io/File;ZZ)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/io/File;ZZ)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z
    .param p3, "renameTargetFileIfExists"    # Z

    .prologue
    .line 66
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;-><init>(Ljava/io/File;ZZZ)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/io/File;ZZZ)V
    .registers 8
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z
    .param p3, "renameTargetFileIfExists"    # Z
    .param p4, "usePoolThread"    # Z

    .prologue
    .line 79
    invoke-direct {p0, p4}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>(Z)V

    .line 80
    if-eqz p1, :cond_44

    const/4 v0, 0x1

    :goto_6
    const-string v1, "File passed into FileAsyncHttpResponseHandler constructor must not be null"

    invoke-static {v0, v1}, Lcom/loopj/android/http/Utils;->asserts(ZLjava/lang/String;)V

    .line 81
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_28

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_28

    .line 82
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    const-string v1, "Cannot create parent directories for requested File location"

    invoke-static {v0, v1}, Lcom/loopj/android/http/Utils;->asserts(ZLjava/lang/String;)V

    .line 84
    :cond_28
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 85
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_3d

    .line 86
    sget-object v0, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v1, "FileAsyncHttpRH"

    const-string v2, "Cannot create directories for requested Directory location, might not be a problem"

    invoke-interface {v0, v1, v2}, Lcom/loopj/android/http/LogInterface;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    :cond_3d
    iput-object p1, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->file:Ljava/io/File;

    .line 90
    iput-boolean p2, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->append:Z

    .line 91
    iput-boolean p3, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->renameIfExists:Z

    .line 92
    return-void

    .line 80
    :cond_44
    const/4 v0, 0x0

    goto :goto_6
.end method


# virtual methods
.method public deleteTargetFile()Z
    .registers 2

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getTargetFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_12

    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getTargetFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method protected getOriginalFile()Ljava/io/File;
    .registers 3

    .prologue
    .line 137
    iget-object v0, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->file:Ljava/io/File;

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    :goto_5
    const-string v1, "Target file is null, fatal!"

    invoke-static {v0, v1}, Lcom/loopj/android/http/Utils;->asserts(ZLjava/lang/String;)V

    .line 138
    iget-object v0, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->file:Ljava/io/File;

    return-object v0

    .line 137
    :cond_d
    const/4 v0, 0x0

    goto :goto_5
.end method

.method protected getResponseData(Lcz/msebera/android/httpclient/HttpEntity;)[B
    .registers 11
    .param p1, "entity"    # Lcz/msebera/android/httpclient/HttpEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    if-eqz p1, :cond_4b

    .line 218
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v4

    .line 219
    .local v4, "instream":Ljava/io/InputStream;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpEntity;->getContentLength()J

    move-result-wide v1

    .line 220
    .local v1, "contentLength":J
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getTargetFile()Ljava/io/File;

    move-result-object v7

    iget-boolean v8, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->append:Z

    invoke-direct {v0, v7, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 221
    .local v0, "buffer":Ljava/io/FileOutputStream;
    if-eqz v4, :cond_4b

    .line 223
    const/16 v7, 0x1000

    :try_start_19
    new-array v6, v7, [B

    .line 224
    .local v6, "tmp":[B
    const/4 v3, 0x0

    .line 226
    .local v3, "count":I
    :goto_1c
    invoke-virtual {v4, v6}, Ljava/io/InputStream;->read([B)I

    move-result v5

    .local v5, "l":I
    const/4 v7, -0x1

    if-eq v5, v7, :cond_42

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v7

    if-nez v7, :cond_42

    .line 227
    add-int/2addr v3, v5

    .line 228
    const/4 v7, 0x0

    invoke-virtual {v0, v6, v7, v5}, Ljava/io/FileOutputStream;->write([BII)V

    .line 229
    int-to-long v7, v3

    invoke-virtual {p0, v7, v8, v1, v2}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->sendProgressMessage(JJ)V
    :try_end_36
    .catchall {:try_start_19 .. :try_end_36} :catchall_37

    goto :goto_1c

    .line 232
    .end local v3    # "count":I
    .end local v5    # "l":I
    .end local v6    # "tmp":[B
    :catchall_37
    move-exception v7

    invoke-static {v4}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseInputStream(Ljava/io/InputStream;)V

    .line 233
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 234
    invoke-static {v0}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseOutputStream(Ljava/io/OutputStream;)V

    throw v7

    .line 232
    .restart local v3    # "count":I
    .restart local v5    # "l":I
    .restart local v6    # "tmp":[B
    :cond_42
    invoke-static {v4}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseInputStream(Ljava/io/InputStream;)V

    .line 233
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 234
    invoke-static {v0}, Lcom/loopj/android/http/AsyncHttpClient;->silentCloseOutputStream(Ljava/io/OutputStream;)V

    .line 238
    .end local v0    # "buffer":Ljava/io/FileOutputStream;
    .end local v1    # "contentLength":J
    .end local v3    # "count":I
    .end local v4    # "instream":Ljava/io/InputStream;
    .end local v5    # "l":I
    .end local v6    # "tmp":[B
    :cond_4b
    const/4 v7, 0x0

    return-object v7
.end method

.method public getTargetFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->frontendFile:Ljava/io/File;

    if-nez v0, :cond_14

    .line 148
    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getOriginalFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getTargetFileByParsingURL()Ljava/io/File;

    move-result-object v0

    :goto_12
    iput-object v0, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->frontendFile:Ljava/io/File;

    .line 150
    :cond_14
    iget-object v0, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->frontendFile:Ljava/io/File;

    return-object v0

    .line 148
    :cond_17
    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getOriginalFile()Ljava/io/File;

    move-result-object v0

    goto :goto_12
.end method

.method protected getTargetFileByParsingURL()Ljava/io/File;
    .registers 12

    .prologue
    const/16 v10, 0x2e

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 162
    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getOriginalFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->isDirectory()Z

    move-result v6

    const-string v9, "Target file is not a directory, cannot proceed"

    invoke-static {v6, v9}, Lcom/loopj/android/http/Utils;->asserts(ZLjava/lang/String;)V

    .line 163
    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getRequestURI()Ljava/net/URI;

    move-result-object v6

    if-eqz v6, :cond_81

    move v6, v7

    :goto_18
    const-string v9, "RequestURI is null, cannot proceed"

    invoke-static {v6, v9}, Lcom/loopj/android/http/Utils;->asserts(ZLjava/lang/String;)V

    .line 164
    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getRequestURI()Ljava/net/URI;

    move-result-object v6

    invoke-virtual {v6}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v3

    .line 165
    .local v3, "requestURL":Ljava/lang/String;
    const/16 v6, 0x2f

    invoke-virtual {v3, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v3, v6, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 166
    .local v0, "filename":Ljava/lang/String;
    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getOriginalFile()Ljava/io/File;

    move-result-object v6

    invoke-direct {v4, v6, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 167
    .local v4, "targetFileRtn":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_b2

    iget-boolean v6, p0, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->renameIfExists:Z

    if-eqz v6, :cond_b2

    .line 169
    const-string v6, "."

    invoke-virtual {v0, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_83

    .line 170
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, " (%d)"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 174
    .local v1, "format":Ljava/lang/String;
    :goto_63
    const/4 v2, 0x0

    .line 176
    .local v2, "index":I
    :goto_64
    new-instance v4, Ljava/io/File;

    .end local v4    # "targetFileRtn":Ljava/io/File;
    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getOriginalFile()Ljava/io/File;

    move-result-object v6

    new-array v9, v7, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v8

    invoke-static {v1, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, v6, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 177
    .restart local v4    # "targetFileRtn":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_af

    move-object v5, v4

    .line 182
    .end local v1    # "format":Ljava/lang/String;
    .end local v2    # "index":I
    .end local v4    # "targetFileRtn":Ljava/io/File;
    .local v5, "targetFileRtn":Ljava/lang/Object;
    :goto_80
    return-object v5

    .end local v0    # "filename":Ljava/lang/String;
    .end local v3    # "requestURL":Ljava/lang/String;
    .end local v5    # "targetFileRtn":Ljava/lang/Object;
    :cond_81
    move v6, v8

    .line 163
    goto :goto_18

    .line 172
    .restart local v0    # "filename":Ljava/lang/String;
    .restart local v3    # "requestURL":Ljava/lang/String;
    .restart local v4    # "targetFileRtn":Ljava/io/File;
    :cond_83
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    invoke-virtual {v0, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v9, " (%d)"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0, v10}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v9

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v0, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "format":Ljava/lang/String;
    goto :goto_63

    .line 179
    .restart local v2    # "index":I
    :cond_af
    add-int/lit8 v2, v2, 0x1

    goto :goto_64

    .end local v1    # "format":Ljava/lang/String;
    .end local v2    # "index":I
    :cond_b2
    move-object v5, v4

    .line 182
    .restart local v5    # "targetFileRtn":Ljava/lang/Object;
    goto :goto_80
.end method

.method protected getTemporaryFile(Landroid/content/Context;)Ljava/io/File;
    .registers 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 122
    if-eqz p1, :cond_15

    const/4 v1, 0x1

    :goto_3
    const-string v2, "Tried creating temporary file without having Context"

    invoke-static {v1, v2}, Lcom/loopj/android/http/Utils;->asserts(ZLjava/lang/String;)V

    .line 124
    :try_start_8
    const-string v1, "temp_"

    const-string v2, "_handled"

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v1, v2, v3}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_13} :catch_17

    move-result-object v1

    .line 128
    :goto_14
    return-object v1

    .line 122
    :cond_15
    const/4 v1, 0x0

    goto :goto_3

    .line 125
    :catch_17
    move-exception v0

    .line 126
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lcom/loopj/android/http/AsyncHttpClient;->log:Lcom/loopj/android/http/LogInterface;

    const-string v2, "FileAsyncHttpRH"

    const-string v3, "Cannot create temporary file"

    invoke-interface {v1, v2, v3, v0}, Lcom/loopj/android/http/LogInterface;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 128
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public abstract onFailure(I[Lcz/msebera/android/httpclient/Header;Ljava/lang/Throwable;Ljava/io/File;)V
.end method

.method public final onFailure(I[Lcz/msebera/android/httpclient/Header;[BLjava/lang/Throwable;)V
    .registers 6
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p3, "responseBytes"    # [B
    .param p4, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 187
    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getTargetFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p4, v0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->onFailure(I[Lcz/msebera/android/httpclient/Header;Ljava/lang/Throwable;Ljava/io/File;)V

    .line 188
    return-void
.end method

.method public abstract onSuccess(I[Lcz/msebera/android/httpclient/Header;Ljava/io/File;)V
.end method

.method public final onSuccess(I[Lcz/msebera/android/httpclient/Header;[B)V
    .registers 5
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lcz/msebera/android/httpclient/Header;
    .param p3, "responseBytes"    # [B

    .prologue
    .line 203
    invoke-virtual {p0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->getTargetFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/loopj/android/http/FileAsyncHttpResponseHandler;->onSuccess(I[Lcz/msebera/android/httpclient/Header;Ljava/io/File;)V

    .line 204
    return-void
.end method
