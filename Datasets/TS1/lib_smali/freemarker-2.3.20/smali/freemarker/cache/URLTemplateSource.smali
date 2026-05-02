.class Lfreemarker/cache/URLTemplateSource;
.super Ljava/lang/Object;
.source "URLTemplateSource.java"


# instance fields
.field private conn:Ljava/net/URLConnection;

.field private inputStream:Ljava/io/InputStream;

.field private final url:Ljava/net/URL;


# direct methods
.method constructor <init>(Ljava/net/URL;)V
    .registers 3
    .param p1, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p1, p0, Lfreemarker/cache/URLTemplateSource;->url:Ljava/net/URL;

    .line 74
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/cache/URLTemplateSource;->conn:Ljava/net/URLConnection;

    .line 75
    return-void
.end method


# virtual methods
.method close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 136
    :try_start_1
    iget-object v0, p0, Lfreemarker/cache/URLTemplateSource;->inputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_f

    .line 137
    iget-object v0, p0, Lfreemarker/cache/URLTemplateSource;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_19

    .line 142
    :goto_a
    iput-object v1, p0, Lfreemarker/cache/URLTemplateSource;->inputStream:Ljava/io/InputStream;

    .line 143
    iput-object v1, p0, Lfreemarker/cache/URLTemplateSource;->conn:Ljava/net/URLConnection;

    .line 145
    return-void

    .line 139
    :cond_f
    :try_start_f
    iget-object v0, p0, Lfreemarker/cache/URLTemplateSource;->conn:Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_18
    .catchall {:try_start_f .. :try_end_18} :catchall_19

    goto :goto_a

    .line 142
    :catchall_19
    move-exception v0

    iput-object v1, p0, Lfreemarker/cache/URLTemplateSource;->inputStream:Ljava/io/InputStream;

    .line 143
    iput-object v1, p0, Lfreemarker/cache/URLTemplateSource;->conn:Ljava/net/URLConnection;

    throw v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 78
    instance-of v0, p1, Lfreemarker/cache/URLTemplateSource;

    if-eqz v0, :cond_f

    .line 79
    iget-object v0, p0, Lfreemarker/cache/URLTemplateSource;->url:Ljava/net/URL;

    check-cast p1, Lfreemarker/cache/URLTemplateSource;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v1, p1, Lfreemarker/cache/URLTemplateSource;->url:Ljava/net/URL;

    invoke-virtual {v0, v1}, Ljava/net/URL;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 81
    :goto_e
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method getInputStream()Ljava/io/InputStream;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    iget-object v0, p0, Lfreemarker/cache/URLTemplateSource;->conn:Ljava/net/URLConnection;

    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/cache/URLTemplateSource;->inputStream:Ljava/io/InputStream;

    .line 131
    iget-object v0, p0, Lfreemarker/cache/URLTemplateSource;->inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lfreemarker/cache/URLTemplateSource;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->hashCode()I

    move-result v0

    return v0
.end method

.method lastModified()J
    .registers 10

    .prologue
    const-wide/16 v6, -0x1

    .line 94
    iget-object v5, p0, Lfreemarker/cache/URLTemplateSource;->conn:Ljava/net/URLConnection;

    instance-of v5, v5, Ljava/net/JarURLConnection;

    if-eqz v5, :cond_56

    .line 98
    iget-object v5, p0, Lfreemarker/cache/URLTemplateSource;->conn:Ljava/net/URLConnection;

    check-cast v5, Ljava/net/JarURLConnection;

    invoke-virtual {v5}, Ljava/net/JarURLConnection;->getJarFileURL()Ljava/net/URL;

    move-result-object v2

    .line 99
    .local v2, "jarURL":Ljava/net/URL;
    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v5

    const-string v8, "file"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2a

    .line 101
    new-instance v5, Ljava/io/File;

    invoke-virtual {v2}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    .line 124
    .end local v2    # "jarURL":Ljava/net/URL;
    :cond_29
    :goto_29
    return-wide v3

    .line 104
    .restart local v2    # "jarURL":Ljava/net/URL;
    :cond_2a
    const/4 v1, 0x0

    .line 106
    .local v1, "jarConn":Ljava/net/URLConnection;
    :try_start_2b
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 107
    invoke-virtual {v1}, Ljava/net/URLConnection;->getLastModified()J
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_32} :catch_3f
    .catchall {:try_start_2b .. :try_end_32} :catchall_4b

    move-result-wide v3

    .line 112
    if-eqz v1, :cond_29

    :try_start_35
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_3c
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_3c} :catch_3d

    goto :goto_29

    .line 113
    :catch_3d
    move-exception v5

    goto :goto_29

    .line 108
    :catch_3f
    move-exception v0

    .line 112
    .local v0, "e":Ljava/io/IOException;
    if-eqz v1, :cond_49

    :try_start_42
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_49
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_49} :catch_80

    :cond_49
    :goto_49
    move-wide v3, v6

    .line 113
    goto :goto_29

    .line 111
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_4b
    move-exception v5

    .line 112
    if-eqz v1, :cond_55

    :try_start_4e
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_55
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_55} :catch_7e

    .line 113
    :cond_55
    :goto_55
    throw v5

    .line 117
    .end local v1    # "jarConn":Ljava/net/URLConnection;
    .end local v2    # "jarURL":Ljava/net/URL;
    :cond_56
    iget-object v5, p0, Lfreemarker/cache/URLTemplateSource;->conn:Ljava/net/URLConnection;

    invoke-virtual {v5}, Ljava/net/URLConnection;->getLastModified()J

    move-result-wide v3

    .line 118
    .local v3, "lastModified":J
    cmp-long v5, v3, v6

    if-nez v5, :cond_29

    iget-object v5, p0, Lfreemarker/cache/URLTemplateSource;->url:Ljava/net/URL;

    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v5

    const-string v6, "file"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_29

    .line 122
    new-instance v5, Ljava/io/File;

    iget-object v6, p0, Lfreemarker/cache/URLTemplateSource;->url:Ljava/net/URL;

    invoke-virtual {v6}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    goto :goto_29

    .line 113
    .end local v3    # "lastModified":J
    .restart local v1    # "jarConn":Ljava/net/URLConnection;
    .restart local v2    # "jarURL":Ljava/net/URL;
    :catch_7e
    move-exception v6

    goto :goto_55

    .restart local v0    # "e":Ljava/io/IOException;
    :catch_80
    move-exception v5

    goto :goto_49
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lfreemarker/cache/URLTemplateSource;->url:Ljava/net/URL;

    invoke-virtual {v0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
