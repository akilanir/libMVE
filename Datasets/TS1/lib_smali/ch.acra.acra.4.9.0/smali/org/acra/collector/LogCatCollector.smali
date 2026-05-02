.class Lorg/acra/collector/LogCatCollector;
.super Ljava/lang/Object;
.source "LogCatCollector.java"


# static fields
.field private static final DEFAULT_TAIL_COUNT:I = 0x64


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public collectLogCat(Lorg/acra/config/ACRAConfiguration;Ljava/lang/String;)Ljava/lang/String;
    .registers 16
    .param p1, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "bufferName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 65
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v5

    .line 66
    .local v5, "myPid":I
    const/4 v6, 0x0

    .line 67
    .local v6, "myPidStr":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/acra/config/ACRAConfiguration;->logcatFilterByPid()Z

    move-result v10

    if-eqz v10, :cond_24

    if-lez v5, :cond_24

    .line 68
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "):"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 71
    :cond_24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .local v0, "commandLine":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v10, "logcat"

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    if-eqz p2, :cond_38

    .line 74
    const-string v10, "-b"

    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    :cond_38
    invoke-virtual {p1}, Lorg/acra/config/ACRAConfiguration;->logcatArguments()Lorg/acra/collections/ImmutableList;

    move-result-object v3

    .line 83
    .local v3, "logcatArgumentsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v10, "-t"

    invoke-interface {v3, v10}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v9

    .line 84
    .local v9, "tailIndex":I
    const/4 v10, -0x1

    if-le v9, v10, :cond_b8

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_b8

    .line 85
    add-int/lit8 v10, v9, 0x1

    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 86
    .local v8, "tailCount":I
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0x8

    if-ge v10, v11, :cond_6a

    .line 87
    add-int/lit8 v10, v9, 0x1

    invoke-interface {v3, v10}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 88
    invoke-interface {v3, v9}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 89
    const-string v10, "-d"

    invoke-interface {v3, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    :cond_6a
    :goto_6a
    new-instance v4, Lorg/acra/collections/BoundedLinkedList;

    if-lez v8, :cond_ba

    .end local v8    # "tailCount":I
    :goto_6e
    invoke-direct {v4, v8}, Lorg/acra/collections/BoundedLinkedList;-><init>(I)V

    .line 97
    .local v4, "logcatBuf":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 100
    :try_start_74
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v11

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v10

    new-array v10, v10, [Ljava/lang/String;

    invoke-interface {v0, v10}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Ljava/lang/String;

    invoke-virtual {v11, v10}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v7

    .line 102
    .local v7, "process":Ljava/lang/Process;
    sget-boolean v10, Lorg/acra/ACRA;->DEV_LOGGING:Z

    if-eqz v10, :cond_95

    sget-object v10, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v11, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v12, "Retrieving logcat output..."

    invoke-interface {v10, v11, v12}, Lorg/acra/log/ACRALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    :cond_95
    new-instance v10, Ljava/lang/Thread;

    new-instance v11, Lorg/acra/collector/LogCatCollector$1;

    invoke-direct {v11, p0, v7}, Lorg/acra/collector/LogCatCollector$1;-><init>(Lorg/acra/collector/LogCatCollector;Ljava/lang/Process;)V

    invoke-direct {v10, v11}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 113
    invoke-virtual {v10}, Ljava/lang/Thread;->start()V

    .line 115
    move-object v2, v6

    .line 116
    .local v2, "finalMyPidStr":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    new-instance v11, Lorg/acra/collector/LogCatCollector$2;

    invoke-direct {v11, p0, v2}, Lorg/acra/collector/LogCatCollector$2;-><init>(Lorg/acra/collector/LogCatCollector;Ljava/lang/String;)V

    invoke-static {v10, v11}, Lorg/acra/util/IOUtils;->streamToString(Ljava/io/InputStream;Lcom/android/internal/util/Predicate;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_74 .. :try_end_b3} :catch_bd

    .line 127
    .end local v2    # "finalMyPidStr":Ljava/lang/String;
    .end local v7    # "process":Ljava/lang/Process;
    :goto_b3
    invoke-virtual {v4}, Ljava/util/LinkedList;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10

    .line 92
    .end local v4    # "logcatBuf":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :cond_b8
    const/4 v8, -0x1

    .restart local v8    # "tailCount":I
    goto :goto_6a

    .line 95
    :cond_ba
    const/16 v8, 0x64

    goto :goto_6e

    .line 123
    .end local v8    # "tailCount":I
    .restart local v4    # "logcatBuf":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/String;>;"
    :catch_bd
    move-exception v1

    .line 124
    .local v1, "e":Ljava/io/IOException;
    sget-object v10, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v11, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v12, "LogCatCollector.collectLogCat could not retrieve data."

    invoke-interface {v10, v11, v12, v1}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b3
.end method
