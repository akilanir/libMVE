.class final Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;
.super Ljava/lang/Object;
.source "BufferingClientHttpResponseWrapper.java"

# interfaces
.implements Lorg/springframework/http/client/ClientHttpResponse;


# instance fields
.field private body:[B

.field private final response:Lorg/springframework/http/client/ClientHttpResponse;


# direct methods
.method constructor <init>(Lorg/springframework/http/client/ClientHttpResponse;)V
    .registers 2
    .param p1, "response"    # Lorg/springframework/http/client/ClientHttpResponse;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->response:Lorg/springframework/http/client/ClientHttpResponse;

    .line 43
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->response:Lorg/springframework/http/client/ClientHttpResponse;

    invoke-interface {v0}, Lorg/springframework/http/client/ClientHttpResponse;->close()V

    .line 71
    return-void
.end method

.method public getBody()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->body:[B

    if-nez v0, :cond_10

    .line 64
    iget-object v0, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->response:Lorg/springframework/http/client/ClientHttpResponse;

    invoke-interface {v0}, Lorg/springframework/http/client/ClientHttpResponse;->getBody()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/util/FileCopyUtils;->copyToByteArray(Ljava/io/InputStream;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->body:[B

    .line 66
    :cond_10
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->body:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getHeaders()Lorg/springframework/http/HttpHeaders;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->response:Lorg/springframework/http/client/ClientHttpResponse;

    invoke-interface {v0}, Lorg/springframework/http/client/ClientHttpResponse;->getHeaders()Lorg/springframework/http/HttpHeaders;

    move-result-object v0

    return-object v0
.end method

.method public getRawStatusCode()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v0, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->response:Lorg/springframework/http/client/ClientHttpResponse;

    invoke-interface {v0}, Lorg/springframework/http/client/ClientHttpResponse;->getRawStatusCode()I

    move-result v0

    return v0
.end method

.method public getStatusCode()Lorg/springframework/http/HttpStatus;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget-object v0, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->response:Lorg/springframework/http/client/ClientHttpResponse;

    invoke-interface {v0}, Lorg/springframework/http/client/ClientHttpResponse;->getStatusCode()Lorg/springframework/http/HttpStatus;

    move-result-object v0

    return-object v0
.end method

.method public getStatusText()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Lorg/springframework/http/client/BufferingClientHttpResponseWrapper;->response:Lorg/springframework/http/client/ClientHttpResponse;

    invoke-interface {v0}, Lorg/springframework/http/client/ClientHttpResponse;->getStatusText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
