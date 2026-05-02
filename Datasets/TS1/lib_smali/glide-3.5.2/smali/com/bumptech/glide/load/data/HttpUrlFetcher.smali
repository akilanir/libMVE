.class public Lcom/bumptech/glide/load/data/HttpUrlFetcher;
.super Ljava/lang/Object;
.source "HttpUrlFetcher.java"

# interfaces
.implements Lcom/bumptech/glide/load/data/DataFetcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/data/HttpUrlFetcher$1;,
        Lcom/bumptech/glide/load/data/HttpUrlFetcher$DefaultHttpUrlConnectionFactory;,
        Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/data/DataFetcher",
        "<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_CONNECTION_FACTORY:Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;

.field private static final MAXIMUM_REDIRECTS:I = 0x5


# instance fields
.field private final connectionFactory:Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;

.field private final glideUrl:Lcom/bumptech/glide/load/model/GlideUrl;

.field private volatile isCancelled:Z

.field private stream:Ljava/io/InputStream;

.field private urlConnection:Ljava/net/HttpURLConnection;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 19
    new-instance v0, Lcom/bumptech/glide/load/data/HttpUrlFetcher$DefaultHttpUrlConnectionFactory;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/bumptech/glide/load/data/HttpUrlFetcher$DefaultHttpUrlConnectionFactory;-><init>(Lcom/bumptech/glide/load/data/HttpUrlFetcher$1;)V

    sput-object v0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->DEFAULT_CONNECTION_FACTORY:Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/load/model/GlideUrl;)V
    .registers 3
    .param p1, "glideUrl"    # Lcom/bumptech/glide/load/model/GlideUrl;

    .prologue
    .line 29
    sget-object v0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->DEFAULT_CONNECTION_FACTORY:Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;

    invoke-direct {p0, p1, v0}, Lcom/bumptech/glide/load/data/HttpUrlFetcher;-><init>(Lcom/bumptech/glide/load/model/GlideUrl;Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;)V

    .line 30
    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/load/model/GlideUrl;Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;)V
    .registers 3
    .param p1, "glideUrl"    # Lcom/bumptech/glide/load/model/GlideUrl;
    .param p2, "connectionFactory"    # Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->glideUrl:Lcom/bumptech/glide/load/model/GlideUrl;

    .line 35
    iput-object p2, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->connectionFactory:Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;

    .line 36
    return-void
.end method

.method private loadDataWithRedirects(Ljava/net/URL;ILjava/net/URL;)Ljava/io/InputStream;
    .registers 10
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "redirects"    # I
    .param p3, "lastUrl"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x9c4

    .line 44
    const/4 v3, 0x5

    if-lt p2, v3, :cond_d

    .line 45
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Too many (> 5) redirects!"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 50
    :cond_d
    if-eqz p3, :cond_26

    :try_start_f
    invoke-virtual {p1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {p3}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/net/URI;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 51
    new-instance v3, Ljava/io/IOException;

    const-string v4, "In re-direct loop"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_25
    .catch Ljava/net/URISyntaxException; {:try_start_f .. :try_end_25} :catch_25

    .line 53
    :catch_25
    move-exception v3

    .line 57
    :cond_26
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->connectionFactory:Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;

    invoke-interface {v3, p1}, Lcom/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory;->build(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object v3

    iput-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    .line 58
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v3, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 59
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v3, v5}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 60
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 61
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 64
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->connect()V

    .line 65
    iget-boolean v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->isCancelled:Z

    if-eqz v3, :cond_4f

    .line 66
    const/4 v3, 0x0

    .line 78
    :goto_4e
    return-object v3

    .line 68
    :cond_4f
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    .line 69
    .local v2, "statusCode":I
    div-int/lit8 v3, v2, 0x64

    const/4 v4, 0x2

    if-ne v3, v4, :cond_65

    .line 70
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    iput-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->stream:Ljava/io/InputStream;

    .line 71
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->stream:Ljava/io/InputStream;

    goto :goto_4e

    .line 72
    :cond_65
    div-int/lit8 v3, v2, 0x64

    const/4 v4, 0x3

    if-ne v3, v4, :cond_8c

    .line 73
    iget-object v3, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    const-string v4, "Location"

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 74
    .local v1, "redirectUrlString":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_80

    .line 75
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Received empty or null redirect url"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 77
    :cond_80
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1, v1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 78
    .local v0, "redirectUrl":Ljava/net/URL;
    add-int/lit8 v3, p2, 0x1

    invoke-direct {p0, v0, v3, p1}, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->loadDataWithRedirects(Ljava/net/URL;ILjava/net/URL;)Ljava/io/InputStream;

    move-result-object v3

    goto :goto_4e

    .line 80
    .end local v0    # "redirectUrl":Ljava/net/URL;
    .end local v1    # "redirectUrlString":Ljava/lang/String;
    :cond_8c
    const/4 v3, -0x1

    if-ne v2, v3, :cond_97

    .line 81
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Unable to retrieve response code from HttpUrlConnection."

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 83
    :cond_97
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Request failed "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .prologue
    .line 110
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->isCancelled:Z

    .line 111
    return-void
.end method

.method public cleanup()V
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->stream:Ljava/io/InputStream;

    if-eqz v0, :cond_9

    .line 91
    :try_start_4
    iget-object v0, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->stream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_9} :catch_13

    .line 96
    :cond_9
    :goto_9
    iget-object v0, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_12

    .line 97
    iget-object v0, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->urlConnection:Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 99
    :cond_12
    return-void

    .line 92
    :catch_13
    move-exception v0

    goto :goto_9
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->glideUrl:Lcom/bumptech/glide/load/model/GlideUrl;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/model/GlideUrl;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public loadData(Lcom/bumptech/glide/Priority;)Ljava/io/InputStream;
    .registers 5
    .param p1, "priority"    # Lcom/bumptech/glide/Priority;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    iget-object v0, p0, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->glideUrl:Lcom/bumptech/glide/load/model/GlideUrl;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/model/GlideUrl;->toURL()Ljava/net/URL;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->loadDataWithRedirects(Ljava/net/URL;ILjava/net/URL;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic loadData(Lcom/bumptech/glide/Priority;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lcom/bumptech/glide/Priority;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/data/HttpUrlFetcher;->loadData(Lcom/bumptech/glide/Priority;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method
