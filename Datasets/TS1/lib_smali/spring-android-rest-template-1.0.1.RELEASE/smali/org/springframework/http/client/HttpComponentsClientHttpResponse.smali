.class final Lorg/springframework/http/client/HttpComponentsClientHttpResponse;
.super Lorg/springframework/http/client/AbstractClientHttpResponse;
.source "HttpComponentsClientHttpResponse.java"


# instance fields
.field private headers:Lorg/springframework/http/HttpHeaders;

.field private final httpResponse:Lorg/apache/http/HttpResponse;


# direct methods
.method constructor <init>(Lorg/apache/http/HttpResponse;)V
    .registers 2
    .param p1, "httpResponse"    # Lorg/apache/http/HttpResponse;

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/springframework/http/client/AbstractClientHttpResponse;-><init>()V

    .line 45
    iput-object p1, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->httpResponse:Lorg/apache/http/HttpResponse;

    .line 46
    return-void
.end method


# virtual methods
.method protected closeInternal()V
    .registers 3

    .prologue
    .line 74
    iget-object v1, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->httpResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 75
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_b

    .line 79
    :try_start_8
    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->consumeContent()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_b} :catch_c

    .line 84
    :cond_b
    :goto_b
    return-void

    .line 80
    :catch_c
    move-exception v1

    goto :goto_b
.end method

.method protected getBodyInternal()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v1, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->httpResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    .line 69
    .local v0, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v0, :cond_d

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1

    :goto_c
    return-object v1

    :cond_d
    const/4 v1, 0x0

    goto :goto_c
.end method

.method public getHeaders()Lorg/springframework/http/HttpHeaders;
    .registers 8

    .prologue
    .line 57
    iget-object v4, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->headers:Lorg/springframework/http/HttpHeaders;

    if-nez v4, :cond_27

    .line 58
    new-instance v4, Lorg/springframework/http/HttpHeaders;

    invoke-direct {v4}, Lorg/springframework/http/HttpHeaders;-><init>()V

    iput-object v4, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->headers:Lorg/springframework/http/HttpHeaders;

    .line 59
    iget-object v4, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->httpResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v4}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    .local v0, "arr$":[Lorg/apache/http/Header;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_13
    if-ge v2, v3, :cond_27

    aget-object v1, v0, v2

    .line 60
    .local v1, "header":Lorg/apache/http/Header;
    iget-object v4, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->headers:Lorg/springframework/http/HttpHeaders;

    invoke-interface {v1}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lorg/springframework/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 63
    .end local v0    # "arr$":[Lorg/apache/http/Header;
    .end local v1    # "header":Lorg/apache/http/Header;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_27
    iget-object v4, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->headers:Lorg/springframework/http/HttpHeaders;

    return-object v4
.end method

.method public getRawStatusCode()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->httpResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v0

    return v0
.end method

.method public getStatusText()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    iget-object v0, p0, Lorg/springframework/http/client/HttpComponentsClientHttpResponse;->httpResponse:Lorg/apache/http/HttpResponse;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
