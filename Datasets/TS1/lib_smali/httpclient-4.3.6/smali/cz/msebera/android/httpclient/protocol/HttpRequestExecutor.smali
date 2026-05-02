.class public Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;
.super Ljava/lang/Object;
.source "HttpRequestExecutor.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/Immutable;
.end annotation


# static fields
.field public static final DEFAULT_WAIT_FOR_CONTINUE:I = 0xbb8


# instance fields
.field private final waitForContinue:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 75
    const/16 v0, 0xbb8

    invoke-direct {p0, v0}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;-><init>(I)V

    .line 76
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "waitForContinue"    # I

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    const-string v0, "Wait for continue time"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->positive(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->waitForContinue:I

    .line 72
    return-void
.end method

.method private static closeConnection(Lcz/msebera/android/httpclient/HttpClientConnection;)V
    .registers 2
    .param p0, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;

    .prologue
    .line 140
    :try_start_0
    invoke-interface {p0}, Lcz/msebera/android/httpclient/HttpClientConnection;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 143
    :goto_3
    return-void

    .line 141
    :catch_4
    move-exception v0

    goto :goto_3
.end method


# virtual methods
.method protected canResponseHaveBody(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)Z
    .registers 7
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "response"    # Lcz/msebera/android/httpclient/HttpResponse;

    .prologue
    const/4 v1, 0x0

    .line 91
    const-string v2, "HEAD"

    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v3

    invoke-interface {v3}, Lcz/msebera/android/httpclient/RequestLine;->getMethod()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 95
    :cond_11
    :goto_11
    return v1

    .line 94
    :cond_12
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v0

    .line 95
    .local v0, "status":I
    const/16 v2, 0xc8

    if-lt v0, v2, :cond_11

    const/16 v2, 0xcc

    if-eq v0, v2, :cond_11

    const/16 v2, 0x130

    if-eq v0, v2, :cond_11

    const/16 v2, 0xcd

    if-eq v0, v2, :cond_11

    const/4 v1, 0x1

    goto :goto_11
.end method

.method protected doReceiveResponse(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 7
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 263
    const-string v2, "HTTP request"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 264
    const-string v2, "Client connection"

    invoke-static {p2, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 265
    const-string v2, "HTTP context"

    invoke-static {p3, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 266
    const/4 v0, 0x0

    .line 267
    .local v0, "response":Lcz/msebera/android/httpclient/HttpResponse;
    const/4 v1, 0x0

    .line 269
    .local v1, "statusCode":I
    :goto_11
    if-eqz v0, :cond_17

    const/16 v2, 0xc8

    if-ge v1, v2, :cond_2d

    .line 271
    :cond_17
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpClientConnection;->receiveResponseHeader()Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v0

    .line 272
    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->canResponseHaveBody(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 273
    invoke-interface {p2, v0}, Lcz/msebera/android/httpclient/HttpClientConnection;->receiveResponseEntity(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 275
    :cond_24
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v1

    goto :goto_11

    .line 279
    :cond_2d
    return-object v0
.end method

.method protected doSendRequest(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 11
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 194
    const-string v4, "HTTP request"

    invoke-static {p1, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 195
    const-string v4, "Client connection"

    invoke-static {p2, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 196
    const-string v4, "HTTP context"

    invoke-static {p3, v4}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 198
    const/4 v0, 0x0

    .line 200
    .local v0, "response":Lcz/msebera/android/httpclient/HttpResponse;
    const-string v4, "http.connection"

    invoke-interface {p3, v4, p2}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 201
    const-string v4, "http.request_sent"

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {p3, v4, v5}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 203
    invoke-interface {p2, p1}, Lcz/msebera/android/httpclient/HttpClientConnection;->sendRequestHeader(Lcz/msebera/android/httpclient/HttpRequest;)V

    .line 204
    instance-of v4, p1, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    if-eqz v4, :cond_8a

    .line 208
    const/4 v1, 0x1

    .line 210
    .local v1, "sendentity":Z
    invoke-interface {p1}, Lcz/msebera/android/httpclient/HttpRequest;->getRequestLine()Lcz/msebera/android/httpclient/RequestLine;

    move-result-object v4

    invoke-interface {v4}, Lcz/msebera/android/httpclient/RequestLine;->getProtocolVersion()Lcz/msebera/android/httpclient/ProtocolVersion;

    move-result-object v3

    .local v3, "ver":Lcz/msebera/android/httpclient/ProtocolVersion;
    move-object v4, p1

    .line 211
    check-cast v4, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    invoke-interface {v4}, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;->expectContinue()Z

    move-result v4

    if-eqz v4, :cond_83

    sget-object v4, Lcz/msebera/android/httpclient/HttpVersion;->HTTP_1_0:Lcz/msebera/android/httpclient/HttpVersion;

    .line 212
    invoke-virtual {v3, v4}, Lcz/msebera/android/httpclient/ProtocolVersion;->lessEquals(Lcz/msebera/android/httpclient/ProtocolVersion;)Z

    move-result v4

    if-nez v4, :cond_83

    .line 214
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpClientConnection;->flush()V

    .line 217
    iget v4, p0, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->waitForContinue:I

    invoke-interface {p2, v4}, Lcz/msebera/android/httpclient/HttpClientConnection;->isResponseAvailable(I)Z

    move-result v4

    if-eqz v4, :cond_83

    .line 218
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpClientConnection;->receiveResponseHeader()Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v0

    .line 219
    invoke-virtual {p0, p1, v0}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->canResponseHaveBody(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpResponse;)Z

    move-result v4

    if-eqz v4, :cond_55

    .line 220
    invoke-interface {p2, v0}, Lcz/msebera/android/httpclient/HttpClientConnection;->receiveResponseEntity(Lcz/msebera/android/httpclient/HttpResponse;)V

    .line 222
    :cond_55
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lcz/msebera/android/httpclient/StatusLine;->getStatusCode()I

    move-result v2

    .line 223
    .local v2, "status":I
    const/16 v4, 0xc8

    if-ge v2, v4, :cond_95

    .line 224
    const/16 v4, 0x64

    if-eq v2, v4, :cond_82

    .line 225
    new-instance v4, Lcz/msebera/android/httpclient/ProtocolException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected response: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 226
    invoke-interface {v0}, Lcz/msebera/android/httpclient/HttpResponse;->getStatusLine()Lcz/msebera/android/httpclient/StatusLine;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcz/msebera/android/httpclient/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 229
    :cond_82
    const/4 v0, 0x0

    .line 235
    .end local v2    # "status":I
    :cond_83
    :goto_83
    if-eqz v1, :cond_8a

    .line 236
    check-cast p1, Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;

    .end local p1    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    invoke-interface {p2, p1}, Lcz/msebera/android/httpclient/HttpClientConnection;->sendRequestEntity(Lcz/msebera/android/httpclient/HttpEntityEnclosingRequest;)V

    .line 239
    .end local v1    # "sendentity":Z
    .end local v3    # "ver":Lcz/msebera/android/httpclient/ProtocolVersion;
    :cond_8a
    invoke-interface {p2}, Lcz/msebera/android/httpclient/HttpClientConnection;->flush()V

    .line 240
    const-string v4, "http.request_sent"

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p3, v4, v5}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 241
    return-object v0

    .line 231
    .restart local v1    # "sendentity":Z
    .restart local v2    # "status":I
    .restart local v3    # "ver":Lcz/msebera/android/httpclient/ProtocolVersion;
    .restart local p1    # "request":Lcz/msebera/android/httpclient/HttpRequest;
    :cond_95
    const/4 v1, 0x0

    goto :goto_83
.end method

.method public execute(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
    .registers 7
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "conn"    # Lcz/msebera/android/httpclient/HttpClientConnection;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcz/msebera/android/httpclient/HttpException;
        }
    .end annotation

    .prologue
    .line 117
    const-string v2, "HTTP request"

    invoke-static {p1, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 118
    const-string v2, "Client connection"

    invoke-static {p2, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    const-string v2, "HTTP context"

    invoke-static {p3, v2}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 121
    :try_start_f
    invoke-virtual {p0, p1, p2, p3}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->doSendRequest(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;

    move-result-object v1

    .line 122
    .local v1, "response":Lcz/msebera/android/httpclient/HttpResponse;
    if-nez v1, :cond_19

    .line 123
    invoke-virtual {p0, p1, p2, p3}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->doReceiveResponse(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/HttpClientConnection;Lcz/msebera/android/httpclient/protocol/HttpContext;)Lcz/msebera/android/httpclient/HttpResponse;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_18} :catch_1a
    .catch Lcz/msebera/android/httpclient/HttpException; {:try_start_f .. :try_end_18} :catch_1f
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_18} :catch_24

    move-result-object v1

    .line 125
    :cond_19
    return-object v1

    .line 126
    .end local v1    # "response":Lcz/msebera/android/httpclient/HttpResponse;
    :catch_1a
    move-exception v0

    .line 127
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {p2}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->closeConnection(Lcz/msebera/android/httpclient/HttpClientConnection;)V

    .line 128
    throw v0

    .line 129
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_1f
    move-exception v0

    .line 130
    .local v0, "ex":Lcz/msebera/android/httpclient/HttpException;
    invoke-static {p2}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->closeConnection(Lcz/msebera/android/httpclient/HttpClientConnection;)V

    .line 131
    throw v0

    .line 132
    .end local v0    # "ex":Lcz/msebera/android/httpclient/HttpException;
    :catch_24
    move-exception v0

    .line 133
    .local v0, "ex":Ljava/lang/RuntimeException;
    invoke-static {p2}, Lcz/msebera/android/httpclient/protocol/HttpRequestExecutor;->closeConnection(Lcz/msebera/android/httpclient/HttpClientConnection;)V

    .line 134
    throw v0
.end method

.method public postProcess(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 5
    .param p1, "response"    # Lcz/msebera/android/httpclient/HttpResponse;
    .param p2, "processor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 304
    const-string v0, "HTTP response"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 305
    const-string v0, "HTTP processor"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 306
    const-string v0, "HTTP context"

    invoke-static {p3, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 307
    const-string v0, "http.response"

    invoke-interface {p3, v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 308
    invoke-interface {p2, p1, p3}, Lcz/msebera/android/httpclient/protocol/HttpProcessor;->process(Lcz/msebera/android/httpclient/HttpResponse;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 309
    return-void
.end method

.method public preProcess(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpProcessor;Lcz/msebera/android/httpclient/protocol/HttpContext;)V
    .registers 5
    .param p1, "request"    # Lcz/msebera/android/httpclient/HttpRequest;
    .param p2, "processor"    # Lcz/msebera/android/httpclient/protocol/HttpProcessor;
    .param p3, "context"    # Lcz/msebera/android/httpclient/protocol/HttpContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcz/msebera/android/httpclient/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    const-string v0, "HTTP request"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 162
    const-string v0, "HTTP processor"

    invoke-static {p2, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 163
    const-string v0, "HTTP context"

    invoke-static {p3, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 164
    const-string v0, "http.request"

    invoke-interface {p3, v0, p1}, Lcz/msebera/android/httpclient/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 165
    invoke-interface {p2, p1, p3}, Lcz/msebera/android/httpclient/protocol/HttpProcessor;->process(Lcz/msebera/android/httpclient/HttpRequest;Lcz/msebera/android/httpclient/protocol/HttpContext;)V

    .line 166
    return-void
.end method
