.class public Ljavassist/URLClassPath;
.super Ljava/lang/Object;
.source "URLClassPath.java"

# interfaces
.implements Ljavassist/ClassPath;


# instance fields
.field protected directory:Ljava/lang/String;

.field protected hostname:Ljava/lang/String;

.field protected packageName:Ljava/lang/String;

.field protected port:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "host"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "directory"    # Ljava/lang/String;
    .param p4, "packageName"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Ljavassist/URLClassPath;->hostname:Ljava/lang/String;

    .line 63
    iput p2, p0, Ljavassist/URLClassPath;->port:I

    .line 64
    iput-object p3, p0, Ljavassist/URLClassPath;->directory:Ljava/lang/String;

    .line 65
    iput-object p4, p0, Ljavassist/URLClassPath;->packageName:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public static fetchClass(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)[B
    .registers 13
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I
    .param p2, "directory"    # Ljava/lang/String;
    .param p3, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x2e

    const/16 v8, 0x2f

    invoke-virtual {p3, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".class"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p0, p1, v6}, Ljavassist/URLClassPath;->fetchClass0(Ljava/lang/String;ILjava/lang/String;)Ljava/net/URLConnection;

    move-result-object v1

    .line 137
    .local v1, "con":Ljava/net/URLConnection;
    invoke-virtual {v1}, Ljava/net/URLConnection;->getContentLength()I

    move-result v5

    .line 138
    .local v5, "size":I
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 140
    .local v4, "s":Ljava/io/InputStream;
    if-gtz v5, :cond_35

    .line 141
    :try_start_2d
    invoke-static {v4}, Ljavassist/ClassPoolTail;->readStream(Ljava/io/InputStream;)[B
    :try_end_30
    .catchall {:try_start_2d .. :try_end_30} :catchall_59

    move-result-object v0

    .line 156
    .local v0, "b":[B
    :goto_31
    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    .line 159
    return-object v0

    .line 143
    .end local v0    # "b":[B
    :cond_35
    :try_start_35
    new-array v0, v5, [B

    .line 144
    .restart local v0    # "b":[B
    const/4 v2, 0x0

    .line 146
    .local v2, "len":I
    :cond_38
    sub-int v6, v5, v2

    invoke-virtual {v4, v0, v2, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 147
    .local v3, "n":I
    if-gez v3, :cond_5e

    .line 148
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "the stream was closed: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_59
    .catchall {:try_start_35 .. :try_end_59} :catchall_59

    .line 156
    .end local v0    # "b":[B
    .end local v2    # "len":I
    .end local v3    # "n":I
    :catchall_59
    move-exception v6

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    throw v6

    .line 151
    .restart local v0    # "b":[B
    .restart local v2    # "len":I
    .restart local v3    # "n":I
    :cond_5e
    add-int/2addr v2, v3

    .line 152
    if-lt v2, v5, :cond_38

    goto :goto_31
.end method

.method private static fetchClass0(Ljava/lang/String;ILjava/lang/String;)Ljava/net/URLConnection;
    .registers 8
    .param p0, "host"    # Ljava/lang/String;
    .param p1, "port"    # I
    .param p2, "filename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    :try_start_0
    new-instance v2, Ljava/net/URL;

    const-string v3, "http"

    invoke-direct {v2, v3, p0, p1, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_7
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_7} :catch_f

    .line 175
    .local v2, "url":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 176
    .local v0, "con":Ljava/net/URLConnection;
    invoke-virtual {v0}, Ljava/net/URLConnection;->connect()V

    .line 177
    return-object v0

    .line 170
    .end local v0    # "con":Ljava/net/URLConnection;
    .end local v2    # "url":Ljava/net/URL;
    :catch_f
    move-exception v1

    .line 172
    .local v1, "e":Ljava/net/MalformedURLException;
    new-instance v3, Ljava/io/IOException;

    const-string v4, "invalid URL?"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private openClassfile0(Ljava/lang/String;)Ljava/net/URLConnection;
    .registers 6
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    iget-object v1, p0, Ljavassist/URLClassPath;->packageName:Ljava/lang/String;

    if-eqz v1, :cond_c

    iget-object v1, p0, Ljavassist/URLClassPath;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_36

    .line 89
    :cond_c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Ljavassist/URLClassPath;->directory:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x2e

    const/16 v3, 0x2f

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".class"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 91
    .local v0, "jarname":Ljava/lang/String;
    iget-object v1, p0, Ljavassist/URLClassPath;->hostname:Ljava/lang/String;

    iget v2, p0, Ljavassist/URLClassPath;->port:I

    invoke-static {v1, v2, v0}, Ljavassist/URLClassPath;->fetchClass0(Ljava/lang/String;ILjava/lang/String;)Ljava/net/URLConnection;

    move-result-object v1

    .line 94
    .end local v0    # "jarname":Ljava/lang/String;
    :goto_35
    return-object v1

    :cond_36
    const/4 v1, 0x0

    goto :goto_35
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 118
    return-void
.end method

.method public find(Ljava/lang/String;)Ljava/net/URL;
    .registers 5
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 104
    :try_start_0
    invoke-direct {p0, p1}, Ljavassist/URLClassPath;->openClassfile0(Ljava/lang/String;)Ljava/net/URLConnection;

    move-result-object v0

    .line 105
    .local v0, "con":Ljava/net/URLConnection;
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 106
    .local v1, "is":Ljava/io/InputStream;
    if-eqz v1, :cond_13

    .line 107
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 108
    invoke-virtual {v0}, Ljava/net/URLConnection;->getURL()Ljava/net/URL;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_10} :catch_12

    move-result-object v2

    .line 112
    .end local v0    # "con":Ljava/net/URLConnection;
    .end local v1    # "is":Ljava/io/InputStream;
    :goto_11
    return-object v2

    .line 111
    :catch_12
    move-exception v2

    .line 112
    :cond_13
    const/4 v2, 0x0

    goto :goto_11
.end method

.method public openClassfile(Ljava/lang/String;)Ljava/io/InputStream;
    .registers 4
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 79
    :try_start_0
    invoke-direct {p0, p1}, Ljavassist/URLClassPath;->openClassfile0(Ljava/lang/String;)Ljava/net/URLConnection;

    move-result-object v0

    .line 80
    .local v0, "con":Ljava/net/URLConnection;
    if-eqz v0, :cond_c

    .line 81
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    .line 84
    .end local v0    # "con":Ljava/net/URLConnection;
    :goto_a
    return-object v1

    .line 83
    :catch_b
    move-exception v1

    .line 84
    :cond_c
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Ljavassist/URLClassPath;->hostname:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ljavassist/URLClassPath;->port:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljavassist/URLClassPath;->directory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
