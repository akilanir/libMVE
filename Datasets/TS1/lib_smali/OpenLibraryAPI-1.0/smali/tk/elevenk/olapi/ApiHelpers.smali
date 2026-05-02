.class public Ltk/elevenk/olapi/ApiHelpers;
.super Ljava/lang/Object;
.source "ApiHelpers.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertStreamToString(Ljava/io/InputStream;)Ljava/lang/String;
    .registers 7
    .param p0, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 35
    const/16 v4, 0x400

    new-array v1, v4, [C

    .line 36
    .local v1, "buff":[C
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 40
    .local v3, "stringWriter":Ljava/io/Writer;
    :try_start_9
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    const-string v5, "UTF-8"

    invoke-direct {v4, p0, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 42
    .local v0, "bReader":Ljava/io/Reader;
    :goto_15
    invoke-virtual {v0, v1}, Ljava/io/Reader;->read([C)I

    move-result v2

    .local v2, "n":I
    const/4 v4, -0x1

    if-eq v2, v4, :cond_29

    .line 43
    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4, v2}, Ljava/io/Writer;->write([CII)V
    :try_end_20
    .catchall {:try_start_9 .. :try_end_20} :catchall_21

    goto :goto_15

    .line 46
    .end local v0    # "bReader":Ljava/io/Reader;
    .end local v2    # "n":I
    :catchall_21
    move-exception v4

    invoke-virtual {v3}, Ljava/io/Writer;->close()V

    .line 47
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v4

    .line 46
    .restart local v0    # "bReader":Ljava/io/Reader;
    .restart local v2    # "n":I
    :cond_29
    invoke-virtual {v3}, Ljava/io/Writer;->close()V

    .line 47
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 49
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
