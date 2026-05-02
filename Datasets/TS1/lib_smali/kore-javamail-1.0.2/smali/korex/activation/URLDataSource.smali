.class public Lkorex/activation/URLDataSource;
.super Ljava/lang/Object;
.source "URLDataSource.java"

# interfaces
.implements Lkorex/activation/DataSource;


# instance fields
.field private url:Ljava/net/URL;

.field private url_conn:Ljava/net/URLConnection;


# direct methods
.method public constructor <init>(Ljava/net/URL;)V
    .registers 3
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    const/4 v0, 0x0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object v0, p0, Lkorex/activation/URLDataSource;->url:Ljava/net/URL;

    .line 51
    iput-object v0, p0, Lkorex/activation/URLDataSource;->url_conn:Ljava/net/URLConnection;

    .line 61
    iput-object p1, p0, Lkorex/activation/URLDataSource;->url:Ljava/net/URL;

    .line 62
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 76
    const/4 v0, 0x0

    .line 79
    .local v0, "type":Ljava/lang/String;
    :try_start_1
    iget-object v1, p0, Lkorex/activation/URLDataSource;->url_conn:Ljava/net/URLConnection;

    if-nez v1, :cond_d

    .line 80
    iget-object v1, p0, Lkorex/activation/URLDataSource;->url:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    iput-object v1, p0, Lkorex/activation/URLDataSource;->url_conn:Ljava/net/URLConnection;
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_d} :catch_1c

    .line 83
    :cond_d
    :goto_d
    iget-object v1, p0, Lkorex/activation/URLDataSource;->url_conn:Ljava/net/URLConnection;

    if-eqz v1, :cond_17

    .line 84
    iget-object v1, p0, Lkorex/activation/URLDataSource;->url_conn:Ljava/net/URLConnection;

    invoke-virtual {v1}, Ljava/net/URLConnection;->getContentType()Ljava/lang/String;

    move-result-object v0

    .line 86
    :cond_17
    if-nez v0, :cond_1b

    .line 87
    const-string v0, "application/octet-stream"

    .line 89
    :cond_1b
    return-object v0

    .line 81
    :catch_1c
    move-exception v1

    goto :goto_d
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lkorex/activation/URLDataSource;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lkorex/activation/URLDataSource;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 122
    iget-object v0, p0, Lkorex/activation/URLDataSource;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/URLDataSource;->url_conn:Ljava/net/URLConnection;

    .line 124
    iget-object v0, p0, Lkorex/activation/URLDataSource;->url_conn:Ljava/net/URLConnection;

    if-eqz v0, :cond_19

    .line 125
    iget-object v0, p0, Lkorex/activation/URLDataSource;->url_conn:Ljava/net/URLConnection;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 126
    iget-object v0, p0, Lkorex/activation/URLDataSource;->url_conn:Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 128
    :goto_18
    return-object v0

    :cond_19
    const/4 v0, 0x0

    goto :goto_18
.end method

.method public getURL()Ljava/net/URL;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lkorex/activation/URLDataSource;->url:Ljava/net/URL;

    return-object v0
.end method
