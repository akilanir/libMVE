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
    .registers 14
    .param p0, "bufferName"    # Ljava/lang/String;

    .prologue
    .line 63
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v6

    .line 64
    .local v6, "myPid":I
    const/4 v7, 0x0

    .line 65
    .local v7, "myPidStr":Ljava/lang/String;
    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v11

    invoke-virtual {v11}, Lorg/acra/ACRAConfiguration;->logcatFilterByPid()Z

    move-result v11

    if-eqz v11, :cond_28

    if-lez v6, :cond_28

    .line 66
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "):"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 69
    :cond_28
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .local v1, "commandLine":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v11, "logcat"

    invoke-interface {v1, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 71
    if-eqz p0, :cond_3c

    .line 72
    const-string v11, "-b"

    invoke-interface {v1, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    :cond_3c
    new-instance v4, Ljava/util/ArrayList;

    invoke-static {}, Lorg/acra/ACRA;->getConfig()Lorg/acra/ACRAConfiguration;

    move-result-object v11

    invoke-virtual {v11}, Lorg/acra/ACRAConfiguration;->logcatArguments()[Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-direct {v4, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 82
    .local v4, "logcatArgumentsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v11, "-t"

    invoke-interface {v4, v11}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v10

    .line 83
    .local v10, "tailIndex":I
    const/4 v11, -0x1

    if-le v10, v11, :cond_ca

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v11

    if-ge v10, v11, :cond_ca

    .line 84
    add-int/lit8 v11, v10, 0x1

    invoke-interface {v4, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .line 85
    .local v9, "tailCount":I
    invoke-static {}, Lorg/acra/collector/Compatibility;->getAPILevel()I

    move-result v11

    const/16 v12, 0x8

    if-ge v11, v12, :cond_7d

    .line 86
    add-int/lit8 v11, v10, 0x1

    invoke-interface {v4, v11}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 87
    invoke-interface {v4, v10}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 88
    const-string v11, "-d"

    invoke-interface {v4, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_7d
    :goto_7d
    new-instance v5, Lorg/acra/util/BoundedLinkedList;

    if-lez v9, :cond_cc

    .end local v9    # "tailCount":I
    :goto_81
    invoke-direct {v5, v9}, Lorg/acra/util/BoundedLinkedList;-><init>(I)V

    .line 96
    .local v5, "logcatBuf":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-interface {v1, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 99
    :try_start_87
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v12

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v11

    new-array v11, v11, [Ljava/lang/String;

    invoke-interface {v1, v11}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v11

    check-cast v11, [Ljava/lang/String;

    invoke-virtual {v12, v11}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v8

    .line 100
    .local v8, "process":Ljava/lang/Process;
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v11, Ljava/io/InputStreamReader;

    invoke-virtual {v8}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v12, 0x2000

    invoke-direct {v0, v11, v12}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 102
    .local v0, "bufferedReader":Ljava/io/BufferedReader;
    sget-object v11, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v12, "Retrieving logcat output..."

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    new-instance v11, Ljava/lang/Thread;

    new-instance v12, Lorg/acra/collector/LogCatCollector$1;

    invoke-direct {v12, v8}, Lorg/acra/collector/LogCatCollector$1;-><init>(Ljava/lang/Process;)V

    invoke-direct {v11, v12}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v11}, Ljava/lang/Thread;->start()V

    .line 118
    :cond_bf
    :goto_bf
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_c2
    .catch Ljava/io/IOException; {:try_start_87 .. :try_end_c2} :catch_ee

    move-result-object v3

    .line 119
    .local v3, "line":Ljava/lang/String;
    if-nez v3, :cond_cf

    .line 131
    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v3    # "line":Ljava/lang/String;
    .end local v8    # "process":Ljava/lang/Process;
    :goto_c5
    invoke-virtual {v5}, Ljava/util/LinkedList;->toString()Ljava/lang/String;

    move-result-object v11

    return-object v11

    .line 91
    .end local v5    # "logcatBuf":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_ca
    const/4 v9, -0x1

    .restart local v9    # "tailCount":I
    goto :goto_7d

    .line 94
    :cond_cc
    const/16 v9, 0x64

    goto :goto_81

    .line 122
    .end local v9    # "tailCount":I
    .restart local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .restart local v3    # "line":Ljava/lang/String;
    .restart local v5    # "logcatBuf":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    .restart local v8    # "process":Ljava/lang/Process;
    :cond_cf
    if-eqz v7, :cond_d7

    :try_start_d1
    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_bf

    .line 123
    :cond_d7
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v5, v11}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_ed
    .catch Ljava/io/IOException; {:try_start_d1 .. :try_end_ed} :catch_ee

    goto :goto_bf

    .line 127
    .end local v0    # "bufferedReader":Ljava/io/BufferedReader;
    .end local v3    # "line":Ljava/lang/String;
    .end local v8    # "process":Ljava/lang/Process;
    :catch_ee
    move-exception v2

    .line 128
    .local v2, "e":Ljava/io/IOException;
    sget-object v11, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v12, "LogCatCollector.collectLogCat could not retrieve data."

    invoke-static {v11, v12, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_c5
.end method
