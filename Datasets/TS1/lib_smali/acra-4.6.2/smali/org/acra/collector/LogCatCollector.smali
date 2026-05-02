.class Lorg/acra/collector/LogCatCollector;
.super Ljava/lang/Object;
.source "LogCatCollector.java"


# static fields
.field private static final DEFAULT_TAIL_COUNT:I = 0x64


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collectLogCat(Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p0, "bufferName"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v7

    .line 64
    .local v7, "myPid":I
    const/4 v8, 0x0

    .line 65
    .local v8, "myPidStr":Ljava/lang/String;
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->logcatFilterByPid()Z

    move-result v12

    if-eqz v12, :cond_28

    if-lez v7, :cond_28

    .line 66
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "):"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 69
    :cond_28
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .local v2, "commandLine":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v12, "logcat"

    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    if-eqz p0, :cond_3c

    .line 72
    const-string v12, "-b"

    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_3c
    new-instance v5, Ljava/util/ArrayList;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v12

    invoke-virtual {v12}, Lorg/acra/ACRAConfiguration;->logcatArguments()[Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    invoke-direct {v5, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 82
    .local v5, "logcatArgumentsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v12, "-t"

    invoke-interface {v5, v12}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v11

    .line 83
    .local v11, "tailIndex":I
    const/4 v12, -0x1

    if-le v11, v12, :cond_d1

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v12

    if-ge v11, v12, :cond_d1

    .line 84
    add-int/lit8 v12, v11, 0x1

    invoke-interface {v5, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    .line 85
    .local v10, "tailCount":I
    invoke-static {}, Lorg/acra/collector/Compatibility;->getAPILevel()I

    move-result v12

    const/16 v13, 0x8

    if-ge v12, v13, :cond_7d

    .line 86
    add-int/lit8 v12, v11, 0x1

    invoke-interface {v5, v12}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 87
    invoke-interface {v5, v11}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 88
    const-string v12, "-d"

    invoke-interface {v5, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_7d
    :goto_7d
    new-instance v6, Lorg/acra/util/BoundedLinkedList;

    if-lez v10, :cond_d3

    .end local v10    # "tailCount":I
    :goto_81
    invoke-direct {v6, v10}, Lorg/acra/util/BoundedLinkedList;-><init>(I)V

    .line 96
    .local v6, "logcatBuf":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-interface {v2, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 98
    const/4 v0, 0x0

    .line 101
    .local v0, "bufferedReader":Ljava/io/BufferedReader;
    :try_start_88
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v13

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v12

    new-array v12, v12, [Ljava/lang/String;

    invoke-interface {v2, v12}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v12

    check-cast v12, [Ljava/lang/String;

    invoke-virtual {v13, v12}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v9

    .line 102
    .local v9, "process":Ljava/lang/Process;
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v12, Ljava/io/InputStreamReader;

    invoke-virtual {v9}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v13, 0x2000

    invoke-direct {v1, v12, v13}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_ac
    .catch Ljava/io/IOException; {:try_start_88 .. :try_end_ac} :catch_10c
    .catchall {:try_start_88 .. :try_end_ac} :catchall_104

    .line 104
    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .local v1, "bufferedReader":Ljava/io/BufferedReader;
    :try_start_ac
    sget-object v12, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v13, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v14, "Retrieving logcat output..."

    invoke-interface {v12, v13, v14}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    new-instance v12, Ljava/lang/Thread;

    new-instance v13, Lorg/acra/collector/LogCatCollector$1;

    invoke-direct {v13, v9}, Lorg/acra/collector/LogCatCollector$1;-><init>(Ljava/lang/Process;)V

    invoke-direct {v12, v13}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v12}, Ljava/lang/Thread;->start()V

    .line 120
    :cond_c2
    :goto_c2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_c5
    .catch Ljava/io/IOException; {:try_start_ac .. :try_end_c5} :catch_f5
    .catchall {:try_start_ac .. :try_end_c5} :catchall_109

    move-result-object v4

    .line 121
    .local v4, "line":Ljava/lang/String;
    if-nez v4, :cond_d6

    .line 132
    invoke-static {v1}, Lorg/acra/collector/CollectorUtil;->safeClose(Ljava/io/Reader;)V

    move-object v0, v1

    .line 135
    .end local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v4    # "line":Ljava/lang/String;
    .end local v9    # "process":Ljava/lang/Process;
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    :goto_cc
    invoke-virtual {v6}, Ljava/util/LinkedList;->toString()Ljava/lang/String;

    move-result-object v12

    return-object v12

    .line 91
    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v6    # "logcatBuf":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_d1
    const/4 v10, -0x1

    .restart local v10    # "tailCount":I
    goto :goto_7d

    .line 94
    :cond_d3
    const/16 v10, 0x64

    goto :goto_81

    .line 124
    .end local v10    # "tailCount":I
    .restart local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v4    # "line":Ljava/lang/String;
    .restart local v6    # "logcatBuf":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    .restart local v9    # "process":Ljava/lang/Process;
    :cond_d6
    if-eqz v8, :cond_de

    :try_start_d8
    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v12

    if-eqz v12, :cond_c2

    .line 125
    :cond_de
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_f4
    .catch Ljava/io/IOException; {:try_start_d8 .. :try_end_f4} :catch_f5
    .catchall {:try_start_d8 .. :try_end_f4} :catchall_109

    goto :goto_c2

    .line 129
    .end local v4    # "line":Ljava/lang/String;
    :catch_f5
    move-exception v3

    move-object v0, v1

    .line 130
    .end local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v9    # "process":Ljava/lang/Process;
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .local v3, "e":Ljava/io/IOException;
    :goto_f7
    :try_start_f7
    sget-object v12, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v13, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v14, "LogCatCollector.collectLogCat could not retrieve data."

    invoke-interface {v12, v13, v14, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_100
    .catchall {:try_start_f7 .. :try_end_100} :catchall_104

    .line 132
    invoke-static {v0}, Lorg/acra/collector/CollectorUtil;->safeClose(Ljava/io/Reader;)V

    goto :goto_cc

    .end local v3    # "e":Ljava/io/IOException;
    :catchall_104
    move-exception v12

    :goto_105
    invoke-static {v0}, Lorg/acra/collector/CollectorUtil;->safeClose(Ljava/io/Reader;)V

    throw v12

    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v9    # "process":Ljava/lang/Process;
    :catchall_109
    move-exception v12

    move-object v0, v1

    .end local v1    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    goto :goto_105

    .line 129
    .end local v9    # "process":Ljava/lang/Process;
    :catch_10c
    move-exception v3

    goto :goto_f7
.end method
