.class public Lorg/ligi/axt/extensions/URLAXT;
.super Ljava/lang/Object;
.source "URLAXT.java"


# instance fields
.field private final url:Ljava/net/URL;


# direct methods
.method public constructor <init>(Ljava/net/URL;)V
    .registers 2
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lorg/ligi/axt/extensions/URLAXT;->url:Ljava/net/URL;

    .line 16
    return-void
.end method

.method private readToStringAsUtf8(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 7
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    const-string v4, "UTF-8"

    invoke-direct {v3, p1, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 35
    .local v1, "reader":Ljava/io/BufferedReader;
    :try_start_c
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .local v2, "sb":Ljava/lang/StringBuilder;
    :goto_11
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .local v0, "line":Ljava/lang/String;
    if-eqz v0, :cond_26

    .line 39
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_20
    .catchall {:try_start_c .. :try_end_20} :catchall_21

    goto :goto_11

    .line 44
    .end local v0    # "line":Ljava/lang/String;
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :catchall_21
    move-exception v3

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    throw v3

    .line 42
    .restart local v0    # "line":Ljava/lang/String;
    .restart local v2    # "sb":Ljava/lang/StringBuilder;
    :cond_26
    :try_start_26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_29
    .catchall {:try_start_26 .. :try_end_29} :catchall_21

    move-result-object v3

    .line 44
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    return-object v3
.end method


# virtual methods
.method public downloadToString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 20
    :try_start_0
    iget-object v3, p0, Lorg/ligi/axt/extensions/URLAXT;->url:Ljava/net/URL;

    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    .line 21
    .local v0, "con":Ljava/net/URLConnection;
    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_17

    move-result-object v2

    .line 23
    .local v2, "in":Ljava/io/InputStream;
    :try_start_a
    invoke-direct {p0, v2}, Lorg/ligi/axt/extensions/URLAXT;->readToStringAsUtf8(Ljava/io/InputStream;)Ljava/lang/String;
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_12

    move-result-object v3

    .line 25
    :try_start_e
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 28
    .end local v0    # "con":Ljava/net/URLConnection;
    .end local v2    # "in":Ljava/io/InputStream;
    :goto_11
    return-object v3

    .line 25
    .restart local v0    # "con":Ljava/net/URLConnection;
    .restart local v2    # "in":Ljava/io/InputStream;
    :catchall_12
    move-exception v3

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v3
    :try_end_17
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_17} :catch_17

    .line 27
    .end local v0    # "con":Ljava/net/URLConnection;
    .end local v2    # "in":Ljava/io/InputStream;
    :catch_17
    move-exception v1

    .line 28
    .local v1, "e":Ljava/io/IOException;
    const/4 v3, 0x0

    goto :goto_11
.end method
