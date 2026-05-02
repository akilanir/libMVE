.class final Lorg/acra/collector/DumpSysCollector;
.super Ljava/lang/Object;
.source "DumpSysCollector.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static collectMemInfo()Ljava/lang/String;
    .registers 7
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 47
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .local v2, "meminfo":Ljava/lang/StringBuilder;
    :try_start_5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .local v0, "commandLine":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v4, "dumpsys"

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    const-string v4, "meminfo"

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v3

    .line 55
    .local v3, "process":Ljava/lang/Process;
    invoke-virtual {v3}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lorg/acra/util/IOUtils;->streamToString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_3e} :catch_43

    .line 61
    .end local v0    # "commandLine":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "process":Ljava/lang/Process;
    :goto_3e
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 57
    :catch_43
    move-exception v1

    .line 58
    .local v1, "e":Ljava/io/IOException;
    sget-object v4, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v5, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v6, "DumpSysCollector.meminfo could not retrieve data"

    invoke-interface {v4, v5, v6, v1}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3e
.end method
