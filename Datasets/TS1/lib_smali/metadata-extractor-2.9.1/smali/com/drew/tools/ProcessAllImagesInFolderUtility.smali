.class public Lcom/drew/tools/ProcessAllImagesInFolderUtility;
.super Ljava/lang/Object;
.source "ProcessAllImagesInFolderUtility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/drew/tools/ProcessAllImagesInFolderUtility$BasicFileHandler;,
        Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;,
        Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;,
        Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;,
        Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandlerBase;,
        Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 621
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 19
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/drew/imaging/jpeg/JpegProcessingException;
        }
    .end annotation

    .prologue
    .line 47
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .local v2, "directories":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 50
    .local v4, "handler":Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 52
    .local v7, "log":Ljava/io/PrintStream;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_9
    move-object/from16 v0, p0

    array-length v10, v0

    if-ge v5, v10, :cond_67

    .line 53
    aget-object v1, p0, v5

    .line 54
    .local v1, "arg":Ljava/lang/String;
    const-string v10, "--text"

    invoke-virtual {v1, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_20

    .line 56
    new-instance v4, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;

    .end local v4    # "handler":Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    invoke-direct {v4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$TextFileOutputHandler;-><init>()V

    .line 52
    .restart local v4    # "handler":Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    :goto_1d
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    .line 57
    :cond_20
    const-string v10, "--markdown"

    invoke-virtual {v1, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_2e

    .line 59
    new-instance v4, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;

    .end local v4    # "handler":Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    invoke-direct {v4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$MarkdownTableOutputHandler;-><init>()V

    .restart local v4    # "handler":Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    goto :goto_1d

    .line 60
    :cond_2e
    const-string v10, "--unknown"

    invoke-virtual {v1, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3c

    .line 62
    new-instance v4, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;

    .end local v4    # "handler":Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    invoke-direct {v4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$UnknownTagHandler;-><init>()V

    .restart local v4    # "handler":Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    goto :goto_1d

    .line 63
    :cond_3c
    const-string v10, "--log-file"

    invoke-virtual {v1, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_63

    .line 64
    move-object/from16 v0, p0

    array-length v10, v0

    add-int/lit8 v10, v10, -0x1

    if-ne v5, v10, :cond_52

    .line 65
    invoke-static {}, Lcom/drew/tools/ProcessAllImagesInFolderUtility;->printUsage()V

    .line 66
    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/System;->exit(I)V

    .line 68
    :cond_52
    new-instance v7, Ljava/io/PrintStream;

    .end local v7    # "log":Ljava/io/PrintStream;
    new-instance v10, Ljava/io/FileOutputStream;

    add-int/lit8 v5, v5, 0x1

    aget-object v11, p0, v5

    const/4 v12, 0x0

    invoke-direct {v10, v11, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    const/4 v11, 0x1

    invoke-direct {v7, v10, v11}, Ljava/io/PrintStream;-><init>(Ljava/io/OutputStream;Z)V

    .restart local v7    # "log":Ljava/io/PrintStream;
    goto :goto_1d

    .line 71
    :cond_63
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 75
    .end local v1    # "arg":Ljava/lang/String;
    :cond_67
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_7b

    .line 76
    sget-object v10, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v11, "Expects one or more directories as arguments."

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 77
    invoke-static {}, Lcom/drew/tools/ProcessAllImagesInFolderUtility;->printUsage()V

    .line 78
    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/System;->exit(I)V

    .line 81
    :cond_7b
    if-nez v4, :cond_82

    .line 82
    new-instance v4, Lcom/drew/tools/ProcessAllImagesInFolderUtility$BasicFileHandler;

    .end local v4    # "handler":Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    invoke-direct {v4}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$BasicFileHandler;-><init>()V

    .line 85
    .restart local v4    # "handler":Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
    :cond_82
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 87
    .local v8, "start":J
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_8a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_a1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 88
    .local v3, "directory":Ljava/lang/String;
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v11, ""

    invoke-static {v10, v4, v11, v7}, Lcom/drew/tools/ProcessAllImagesInFolderUtility;->processDirectory(Ljava/io/File;Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;Ljava/lang/String;Ljava/io/PrintStream;)V

    goto :goto_8a

    .line 91
    .end local v3    # "directory":Ljava/lang/String;
    :cond_a1
    invoke-interface {v4, v7}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;->onScanCompleted(Ljava/io/PrintStream;)V

    .line 93
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v11, "Completed in %d ms"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    sub-long/2addr v14, v8

    const-wide/32 v16, 0xf4240

    div-long v14, v14, v16

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 95
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    if-eq v7, v10, :cond_ca

    .line 96
    invoke-virtual {v7}, Ljava/io/PrintStream;->close()V

    .line 98
    :cond_ca
    return-void
.end method

.method private static printUsage()V
    .registers 2

    .prologue
    .line 102
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Usage:"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 104
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "  java com.drew.tools.ProcessAllImagesInFolderUtility [--text|--markdown|--unknown] [--log-file <file-name>]"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method private static processDirectory(Ljava/io/File;Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;Ljava/lang/String;Ljava/io/PrintStream;)V
    .registers 14
    .param p0, "path"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "handler"    # Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "relativePath"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "log"    # Ljava/io/PrintStream;

    .prologue
    .line 109
    invoke-interface {p1, p0}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;->onStartingDirectory(Ljava/io/File;)V

    .line 111
    invoke-virtual {p0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v6

    .line 113
    .local v6, "pathItems":[Ljava/lang/String;
    if-nez v6, :cond_a

    .line 141
    :cond_9
    return-void

    .line 118
    :cond_a
    invoke-static {v6}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 120
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_10
    if-ge v2, v3, :cond_9

    aget-object v5, v0, v2

    .line 121
    .local v5, "pathItem":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 123
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_43

    .line 124
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_2b

    .end local v5    # "pathItem":Ljava/lang/String;
    :goto_25
    invoke-static {v1, p1, v5, p3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility;->processDirectory(Ljava/io/File;Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 120
    :cond_28
    :goto_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .line 124
    .restart local v5    # "pathItem":Ljava/lang/String;
    :cond_2b
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_25

    .line 125
    :cond_43
    invoke-interface {p1, v1}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;->shouldProcess(Ljava/io/File;)Z

    move-result v8

    if-eqz v8, :cond_28

    .line 127
    invoke-interface {p1, v1, p3, p2}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;->onBeforeExtraction(Ljava/io/File;Ljava/io/PrintStream;Ljava/lang/String;)V

    .line 132
    :try_start_4c
    invoke-static {v1}, Lcom/drew/imaging/ImageMetadataReader;->readMetadata(Ljava/io/File;)Lcom/drew/metadata/Metadata;
    :try_end_4f
    .catch Ljava/lang/Throwable; {:try_start_4c .. :try_end_4f} :catch_54

    move-result-object v4

    .line 138
    .local v4, "metadata":Lcom/drew/metadata/Metadata;
    invoke-interface {p1, v1, v4, p2, p3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;->onExtractionSuccess(Ljava/io/File;Lcom/drew/metadata/Metadata;Ljava/lang/String;Ljava/io/PrintStream;)V

    goto :goto_28

    .line 133
    .end local v4    # "metadata":Lcom/drew/metadata/Metadata;
    :catch_54
    move-exception v7

    .line 134
    .local v7, "t":Ljava/lang/Throwable;
    invoke-interface {p1, v1, v7, p3}, Lcom/drew/tools/ProcessAllImagesInFolderUtility$FileHandler;->onExtractionError(Ljava/io/File;Ljava/lang/Throwable;Ljava/io/PrintStream;)V

    goto :goto_28
.end method
