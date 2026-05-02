.class final Lorg/acra/collector/DumpSysCollector;
.super Ljava/lang/Object;
.source "DumpSysCollector.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collectMemInfo()Ljava/lang/String;
    .registers 10

    .prologue
    .line 45
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .local v5, "meminfo":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 48
    .local v0, "bufferedReader":Ljava/io/BufferedReader;
    :try_start_6
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v2, "commandLine":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v7, "dumpsys"

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    const-string v7, "meminfo"

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v8

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    new-array v7, v7, [Ljava/lang/String;

    invoke-interface {v2, v7}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    invoke-virtual {v8, v7}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v6

    .line 54
    .local v6, "process":Ljava/lang/Process;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    invoke-virtual {v6}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v8, 0x2000

    invoke-direct {v1, v7, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_44} :catch_68

    .line 57
    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .local v1, "bufferedReader":Ljava/io/BufferedReader;
    :goto_44
    :try_start_44
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_47} :catch_5c

    move-result-object v4

    .line 58
    .local v4, "line":Ljava/lang/String;
    if-nez v4, :cond_53

    move-object v0, v1

    .line 69
    .end local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v2    # "commandLine":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "line":Ljava/lang/String;
    .end local v6    # "process":Ljava/lang/Process;
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    :goto_4b
    invoke-static {v0}, Lorg/acra/collector/CollectorUtil;->safeClose(Ljava/io/Reader;)V

    .line 71
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 61
    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v2    # "commandLine":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v4    # "line":Ljava/lang/String;
    .restart local v6    # "process":Ljava/lang/Process;
    :cond_53
    :try_start_53
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    const-string v7, "\n"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_53 .. :try_end_5b} :catch_5c

    goto :goto_44

    .line 65
    .end local v4    # "line":Ljava/lang/String;
    :catch_5c
    move-exception v3

    move-object v0, v1

    .line 66
    .end local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v2    # "commandLine":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v6    # "process":Ljava/lang/Process;
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .local v3, "e":Ljava/io/IOException;
    :goto_5e
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "DumpSysCollector.meminfo could not retrieve data"

    invoke-interface {v7, v8, v9, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4b

    .line 65
    .end local v3    # "e":Ljava/io/IOException;
    :catch_68
    move-exception v3

    goto :goto_5e
.end method
