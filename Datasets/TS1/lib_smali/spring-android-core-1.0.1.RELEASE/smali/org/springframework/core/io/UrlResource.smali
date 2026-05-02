.class public Lorg/springframework/core/io/UrlResource;
.super Lorg/springframework/core/io/AbstractFileResolvingResource;
.source "UrlResource.java"


# instance fields
.field private final cleanedUrl:Ljava/net/URL;

.field private final uri:Ljava/net/URI;

.field private final url:Ljava/net/URL;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-direct {p0}, Lorg/springframework/core/io/AbstractFileResolvingResource;-><init>()V

    .line 87
    const-string v0, "Path must not be null"

    invoke-static {p1, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 88
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    .line 89
    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    invoke-direct {p0, v0, p1}, Lorg/springframework/core/io/UrlResource;->getCleanedUrl(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lorg/springframework/core/io/UrlResource;->cleanedUrl:Ljava/net/URL;

    .line 90
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/springframework/core/io/UrlResource;->uri:Ljava/net/URI;

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .registers 4
    .param p1, "uri"    # Ljava/net/URI;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/springframework/core/io/AbstractFileResolvingResource;-><init>()V

    .line 75
    const-string v0, "URI must not be null"

    invoke-static {p1, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    invoke-virtual {p1}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    .line 77
    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    invoke-virtual {p1}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/springframework/core/io/UrlResource;->getCleanedUrl(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lorg/springframework/core/io/UrlResource;->cleanedUrl:Ljava/net/URL;

    .line 78
    iput-object p1, p0, Lorg/springframework/core/io/UrlResource;->uri:Ljava/net/URI;

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .registers 4
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/springframework/core/io/AbstractFileResolvingResource;-><init>()V

    .line 63
    const-string v0, "URL must not be null"

    invoke-static {p1, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    iput-object p1, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    .line 65
    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/springframework/core/io/UrlResource;->getCleanedUrl(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    iput-object v0, p0, Lorg/springframework/core/io/UrlResource;->cleanedUrl:Ljava/net/URL;

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/springframework/core/io/UrlResource;->uri:Ljava/net/URI;

    .line 67
    return-void
.end method

.method private getCleanedUrl(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;
    .registers 6
    .param p1, "originalUrl"    # Ljava/net/URL;
    .param p2, "originalPath"    # Ljava/lang/String;

    .prologue
    .line 102
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-static {p2}, Lorg/springframework/util/StringUtils;->cleanPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_9} :catch_b

    move-object p1, v1

    .line 107
    .end local p1    # "originalUrl":Ljava/net/URL;
    :goto_a
    return-object p1

    .line 104
    .restart local p1    # "originalUrl":Ljava/net/URL;
    :catch_b
    move-exception v0

    .line 107
    .local v0, "ex":Ljava/net/MalformedURLException;
    goto :goto_a
.end method


# virtual methods
.method public createRelative(Ljava/lang/String;)Lorg/springframework/core/io/Resource;
    .registers 5
    .param p1, "relativePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .prologue
    .line 179
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 180
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 182
    :cond_d
    new-instance v0, Lorg/springframework/core/io/UrlResource;

    new-instance v1, Ljava/net/URL;

    iget-object v2, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    invoke-direct {v1, v2, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/springframework/core/io/UrlResource;-><init>(Ljava/net/URL;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 208
    if-eq p1, p0, :cond_12

    instance-of v0, p1, Lorg/springframework/core/io/UrlResource;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->cleanedUrl:Ljava/net/URL;

    check-cast p1, Lorg/springframework/core/io/UrlResource;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-object v1, p1, Lorg/springframework/core/io/UrlResource;->cleanedUrl:Ljava/net/URL;

    invoke-virtual {v0, v1}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public getDescription()Ljava/lang/String;
    .registers 3

    .prologue
    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "URL ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->uri:Ljava/net/URI;

    if-eqz v0, :cond_b

    .line 165
    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->uri:Ljava/net/URI;

    invoke-super {p0, v0}, Lorg/springframework/core/io/AbstractFileResolvingResource;->getFile(Ljava/net/URI;)Ljava/io/File;

    move-result-object v0

    .line 168
    :goto_a
    return-object v0

    :cond_b
    invoke-super {p0}, Lorg/springframework/core/io/AbstractFileResolvingResource;->getFile()Ljava/io/File;

    move-result-object v0

    goto :goto_a
.end method

.method public getFilename()Ljava/lang/String;
    .registers 3

    .prologue
    .line 192
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    iget-object v2, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 122
    .local v0, "con":Ljava/net/URLConnection;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/net/URLConnection;->setUseCaches(Z)V

    .line 124
    :try_start_a
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v2

    return-object v2

    .line 126
    :catch_f
    move-exception v1

    .line 128
    .local v1, "ex":Ljava/io/IOException;
    instance-of v2, v0, Ljava/net/HttpURLConnection;

    if-eqz v2, :cond_19

    .line 129
    check-cast v0, Ljava/net/HttpURLConnection;

    .end local v0    # "con":Ljava/net/URLConnection;
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 131
    :cond_19
    throw v1
.end method

.method public getURI()Ljava/net/URI;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->uri:Ljava/net/URI;

    if-eqz v0, :cond_7

    .line 150
    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->uri:Ljava/net/URI;

    .line 153
    :goto_6
    return-object v0

    :cond_7
    invoke-super {p0}, Lorg/springframework/core/io/AbstractFileResolvingResource;->getURI()Ljava/net/URI;

    move-result-object v0

    goto :goto_6
.end method

.method public getURL()Ljava/net/URL;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 140
    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->url:Ljava/net/URL;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 217
    iget-object v0, p0, Lorg/springframework/core/io/UrlResource;->cleanedUrl:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->hashCode()I

    move-result v0

    return v0
.end method
