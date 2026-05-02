.class public Lorg/ligi/tracedroid/TraceDroid;
.super Ljava/lang/Object;
.source "TraceDroid.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final deleteStacktraceFiles()V
    .registers 4

    .prologue
    .line 114
    invoke-static {}, Lorg/ligi/tracedroid/TraceDroid;->getStackTraceFiles()[Ljava/io/File;

    move-result-object v1

    .local v1, "arr$":[Ljava/io/File;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_10

    aget-object v0, v1, v2

    .line 115
    .local v0, "act_file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 114
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 117
    .end local v0    # "act_file":Ljava/io/File;
    :cond_10
    return-void
.end method

.method public static getEnsuredTraceDir()Ljava/io/File;
    .registers 2

    .prologue
    .line 50
    new-instance v0, Ljava/io/File;

    invoke-static {}, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->getFilesPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 53
    .local v0, "trace_files_dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_12

    .line 54
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 57
    :cond_12
    return-object v0
.end method

.method public static getStackTraceFiles()[Ljava/io/File;
    .registers 2

    .prologue
    .line 67
    new-instance v0, Lorg/ligi/tracedroid/TraceDroid$1;

    invoke-direct {v0}, Lorg/ligi/tracedroid/TraceDroid$1;-><init>()V

    .line 73
    .local v0, "filter":Ljava/io/FilenameFilter;
    invoke-static {}, Lorg/ligi/tracedroid/TraceDroid;->getEnsuredTraceDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v1

    return-object v1
.end method

.method public static getStackTraceText(I)Ljava/lang/String;
    .registers 12
    .param p0, "limit"    # I

    .prologue
    .line 77
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Searching Exceptions in: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->getFilesPath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lorg/ligi/tracedroid/logging/Log;->d(Ljava/lang/String;)V

    .line 79
    const-string v8, ""

    .line 80
    .local v8, "stack_trace_text":Ljava/lang/String;
    invoke-static {}, Lorg/ligi/tracedroid/TraceDroid;->getStackTraceFiles()[Ljava/io/File;

    move-result-object v1

    .local v1, "arr$":[Ljava/io/File;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    move v6, p0

    .end local p0    # "limit":I
    .local v6, "limit":I
    :goto_23
    if-ge v3, v5, :cond_c4

    aget-object v0, v1, v3

    .line 82
    .local v0, "act_file":Ljava/io/File;
    add-int/lit8 p0, v6, -0x1

    .end local v6    # "limit":I
    .restart local p0    # "limit":I
    if-lez v6, :cond_9f

    .line 84
    :try_start_2b
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "file: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 85
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "line.separator"

    invoke-static {v10}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_5c} :catch_c5

    move-result-object v8

    .line 87
    add-int/lit8 v6, p0, -0x1

    .end local p0    # "limit":I
    .restart local v6    # "limit":I
    if-lez p0, :cond_b0

    .line 89
    :try_start_61
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/FileReader;

    invoke-direct {v9, v0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v4, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_6b} :catch_a8

    .line 92
    .local v4, "input":Ljava/io/BufferedReader;
    const/4 v7, 0x0

    .line 93
    .local v7, "line":Ljava/lang/String;
    :goto_6c
    :try_start_6c
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_9b

    .line 94
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 95
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "line.separator"

    invoke-static {v10}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_99
    .catchall {:try_start_6c .. :try_end_99} :catchall_a3

    move-result-object v8

    goto :goto_6c

    .line 99
    :cond_9b
    :try_start_9b
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    .end local v4    # "input":Ljava/io/BufferedReader;
    .end local v7    # "line":Ljava/lang/String;
    :goto_9e
    move p0, v6

    .line 80
    .end local v6    # "limit":I
    .restart local p0    # "limit":I
    :cond_9f
    :goto_9f
    add-int/lit8 v3, v3, 0x1

    move v6, p0

    .end local p0    # "limit":I
    .restart local v6    # "limit":I
    goto :goto_23

    .line 99
    .restart local v4    # "input":Ljava/io/BufferedReader;
    .restart local v7    # "line":Ljava/lang/String;
    :catchall_a3
    move-exception v9

    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V

    throw v9
    :try_end_a8
    .catch Ljava/lang/Exception; {:try_start_9b .. :try_end_a8} :catch_a8

    .line 104
    .end local v4    # "input":Ljava/io/BufferedReader;
    .end local v7    # "line":Ljava/lang/String;
    :catch_a8
    move-exception v2

    move p0, v6

    .line 105
    .end local v6    # "limit":I
    .local v2, "e":Ljava/lang/Exception;
    .restart local p0    # "limit":I
    :goto_aa
    const-string v9, "problem loading stacktrace"

    invoke-static {v9, v2}, Lorg/ligi/tracedroid/logging/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_9f

    .line 102
    .end local v2    # "e":Ljava/lang/Exception;
    .end local p0    # "limit":I
    .restart local v6    # "limit":I
    :cond_b0
    :try_start_b0
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " discarded by limit"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_c2
    .catch Ljava/lang/Exception; {:try_start_b0 .. :try_end_c2} :catch_a8

    move-result-object v8

    goto :goto_9e

    .line 110
    .end local v0    # "act_file":Ljava/io/File;
    :cond_c4
    return-object v8

    .line 104
    .end local v6    # "limit":I
    .restart local v0    # "act_file":Ljava/io/File;
    .restart local p0    # "limit":I
    :catch_c5
    move-exception v2

    goto :goto_aa
.end method

.method public static init(Landroid/content/Context;)V
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-static {p0}, Lorg/ligi/tracedroid/collecting/TraceDroidMetaInfo;->init(Landroid/content/Context;)V

    .line 29
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    .line 31
    .local v0, "currentHandler":Ljava/lang/Thread$UncaughtExceptionHandler;
    if-eqz v0, :cond_27

    .line 32
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "current handler class="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/ligi/tracedroid/logging/Log;->d(Ljava/lang/String;)V

    .line 37
    :cond_27
    instance-of v2, v0, Lorg/ligi/tracedroid/collecting/UncaughtExceptionSaver;

    if-nez v2, :cond_33

    .line 39
    new-instance v1, Lorg/ligi/tracedroid/collecting/UncaughtExceptionSaver;

    invoke-direct {v1, v0}, Lorg/ligi/tracedroid/collecting/UncaughtExceptionSaver;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 40
    .local v1, "exceptionSaver":Lorg/ligi/tracedroid/collecting/UncaughtExceptionSaver;
    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 42
    .end local v1    # "exceptionSaver":Lorg/ligi/tracedroid/collecting/UncaughtExceptionSaver;
    :cond_33
    return-void
.end method
