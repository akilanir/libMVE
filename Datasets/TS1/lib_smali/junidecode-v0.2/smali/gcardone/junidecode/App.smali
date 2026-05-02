.class public Lgcardone/junidecode/App;
.super Ljava/lang/Object;
.source "App.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 10
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 59
    array-length v5, p0

    if-lez v5, :cond_2c

    .line 60
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .local v4, "sb":Ljava/lang/StringBuilder;
    array-length v6, p0

    const/4 v5, 0x0

    :goto_a
    if-ge v5, v6, :cond_1e

    aget-object v3, p0, v5

    .line 62
    .local v3, "s":Ljava/lang/String;
    invoke-static {v3}, Lgcardone/junidecode/Junidecode;->unidecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    add-int/lit8 v5, v5, 0x1

    goto :goto_a

    .line 64
    .end local v3    # "s":Ljava/lang/String;
    :cond_1e
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 76
    .end local v4    # "sb":Ljava/lang/StringBuilder;
    :cond_2b
    :goto_2b
    return-void

    .line 67
    :cond_2c
    :try_start_2c
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    sget-object v6, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 69
    .local v0, "br":Ljava/io/BufferedReader;
    :goto_38
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    .local v2, "line":Ljava/lang/String;
    if-eqz v2, :cond_2b

    .line 70
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v2}, Lgcardone/junidecode/Junidecode;->unidecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_2c .. :try_end_47} :catch_48

    goto :goto_38

    .line 72
    .end local v0    # "br":Ljava/io/BufferedReader;
    .end local v2    # "line":Ljava/lang/String;
    :catch_48
    move-exception v1

    .line 73
    .local v1, "ex":Ljava/io/IOException;
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1}, Ljava/io/IOException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2b
.end method
