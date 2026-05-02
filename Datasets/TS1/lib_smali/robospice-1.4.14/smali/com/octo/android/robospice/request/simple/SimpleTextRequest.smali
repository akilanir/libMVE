.class public Lcom/octo/android/robospice/request/simple/SimpleTextRequest;
.super Lcom/octo/android/robospice/request/SpiceRequest;
.source "SimpleTextRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/octo/android/robospice/request/SpiceRequest",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/octo/android/robospice/request/SpiceRequest;-><init>(Ljava/lang/Class;)V

    .line 21
    iput-object p1, p0, Lcom/octo/android/robospice/request/simple/SimpleTextRequest;->url:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method protected final getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/octo/android/robospice/request/simple/SimpleTextRequest;->url:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic loadDataFromNetwork()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/octo/android/robospice/request/simple/SimpleTextRequest;->loadDataFromNetwork()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public loadDataFromNetwork()Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 29
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Call web service "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/request/simple/SimpleTextRequest;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 30
    new-instance v1, Ljava/io/InputStreamReader;

    new-instance v2, Ljava/net/URL;

    iget-object v3, p0, Lcom/octo/android/robospice/request/simple/SimpleTextRequest;->url:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-direct {v1, v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->toString(Ljava/io/Reader;)Ljava/lang/String;
    :try_end_31
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_31} :catch_33
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_31} :catch_3c

    move-result-object v1

    return-object v1

    .line 31
    :catch_33
    move-exception v0

    .line 32
    .local v0, "e":Ljava/net/MalformedURLException;
    const-string v1, "Unable to create URL"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 33
    throw v0

    .line 34
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :catch_3c
    move-exception v0

    .line 35
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "Unable to download content"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {v0, v1, v2}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 36
    throw v0
.end method
