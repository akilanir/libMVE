.class public abstract Lcom/octo/android/robospice/request/simple/BinaryRequest;
.super Lcom/octo/android/robospice/request/SpiceRequest;
.source "BinaryRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/request/SpiceRequest",
        "<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# static fields
.field private static final BUF_SIZE:I = 0x1000


# instance fields
.field protected url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 27
    const-class v0, Ljava/io/InputStream;

    invoke-direct {p0, v0}, Lcom/octo/android/robospice/request/SpiceRequest;-><init>(Ljava/lang/Class;)V

    .line 28
    iput-object p1, p0, Lcom/octo/android/robospice/request/simple/BinaryRequest;->url:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method protected final getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/octo/android/robospice/request/simple/BinaryRequest;->url:Ljava/lang/String;

    return-object v0
.end method

.method public final loadDataFromNetwork()Ljava/io/InputStream;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 34
    :try_start_1
    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/BinaryRequest;->url:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .line 35
    .local v1, "httpURLConnection":Ljava/net/HttpURLConnection;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v2

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/octo/android/robospice/request/simple/BinaryRequest;->processStream(ILjava/io/InputStream;)Ljava/io/InputStream;
    :try_end_19
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_19} :catch_1b
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_19} :catch_24

    move-result-object v2

    return-object v2

    .line 36
    .end local v1    # "httpURLConnection":Ljava/net/HttpURLConnection;
    :catch_1b
    move-exception v0

    .line 37
    .local v0, "e":Ljava/net/MalformedURLException;
    const-string v2, "Unable to create URL"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 38
    throw v0

    .line 39
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :catch_24
    move-exception v0

    .line 40
    .local v0, "e":Ljava/io/IOException;
    const-string v2, "Unable to download binary"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 41
    throw v0
.end method

.method public bridge synthetic loadDataFromNetwork()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 21
    invoke-virtual {p0}, Lcom/octo/android/robospice/request/simple/BinaryRequest;->loadDataFromNetwork()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public abstract processStream(ILjava/io/InputStream;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected readBytes(Ljava/io/InputStream;Lcom/octo/android/robospice/request/ProgressByteProcessor;)V
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "processor"    # Lcom/octo/android/robospice/request/ProgressByteProcessor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    const/16 v2, 0x1000

    new-array v1, v2, [B

    .line 67
    .local v1, "buf":[B
    :cond_4
    :try_start_4
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_17

    move-result v0

    .line 68
    .local v0, "amt":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_f

    .line 73
    :goto_b
    invoke-static {p1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 75
    return-void

    .line 71
    :cond_f
    const/4 v2, 0x0

    :try_start_10
    invoke-virtual {p2, v1, v2, v0}, Lcom/octo/android/robospice/request/ProgressByteProcessor;->processBytes([BII)Z
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_17

    move-result v2

    if-nez v2, :cond_4

    goto :goto_b

    .line 73
    .end local v0    # "amt":I
    :catchall_17
    move-exception v2

    invoke-static {p1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v2
.end method
