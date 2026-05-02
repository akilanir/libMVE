.class public Lcom/drew/tools/ProcessUrlUtility;
.super Ljava/lang/Object;
.source "ProcessUrlUtility.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 7
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/drew/imaging/jpeg/JpegProcessingException;
        }
    .end annotation

    .prologue
    .line 45
    array-length v4, p0

    if-nez v4, :cond_e

    .line 46
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v5, "Expects one or more URLs as arguments."

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 47
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/System;->exit(I)V

    .line 50
    :cond_e
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_11
    if-ge v1, v2, :cond_20

    aget-object v3, v0, v1

    .line 51
    .local v3, "url":Ljava/lang/String;
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v4}, Lcom/drew/tools/ProcessUrlUtility;->processUrl(Ljava/net/URL;)V

    .line 50
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 53
    .end local v3    # "url":Ljava/lang/String;
    :cond_20
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Completed."

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method private static processUrl(Ljava/net/URL;)V
    .registers 20
    .param p0, "url"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    invoke-virtual/range {p0 .. p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 61
    .local v1, "con":Ljava/net/URLConnection;
    invoke-virtual {v1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    .line 66
    .local v9, "in":Ljava/io/InputStream;
    :try_start_8
    invoke-static {v9}, Lcom/drew/imaging/ImageMetadataReader;->readMetadata(Ljava/io/InputStream;)Lcom/drew/metadata/Metadata;
    :try_end_b
    .catch Lcom/drew/imaging/ImageProcessingException; {:try_start_8 .. :try_end_b} :catch_63
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_b} :catch_8c

    move-result-object v10

    .line 78
    .local v10, "metadata":Lcom/drew/metadata/Metadata;
    invoke-virtual {v10}, Lcom/drew/metadata/Metadata;->hasErrors()Z

    move-result v14

    if-eqz v14, :cond_b2

    .line 79
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 80
    invoke-virtual {v10}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v14

    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_21
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_b2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/drew/metadata/Directory;

    .line 81
    .local v3, "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {v3}, Lcom/drew/metadata/Directory;->hasErrors()Z

    move-result v14

    if-eqz v14, :cond_21

    .line 83
    invoke-virtual {v3}, Lcom/drew/metadata/Directory;->getErrors()Ljava/lang/Iterable;

    move-result-object v14

    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_3b
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_21

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 84
    .local v6, "error":Ljava/lang/String;
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v15, "\t[%s] %s%n"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual {v3}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    aput-object v6, v16, v17

    invoke-virtual/range {v14 .. v16}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    goto :goto_3b

    .line 67
    .end local v3    # "directory":Lcom/drew/metadata/Directory;
    .end local v6    # "error":Ljava/lang/String;
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v10    # "metadata":Lcom/drew/metadata/Metadata;
    :catch_63
    move-exception v5

    .line 70
    .local v5, "e":Lcom/drew/imaging/ImageProcessingException;
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v15, "%s: %s [Error Extracting Metadata]\n\t%s%n"

    const/16 v16, 0x3

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    aput-object p0, v16, v17

    const/16 v17, 0x2

    invoke-virtual {v5}, Lcom/drew/imaging/ImageProcessingException;->getMessage()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-virtual/range {v14 .. v16}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 107
    .end local v5    # "e":Lcom/drew/imaging/ImageProcessingException;
    :cond_8b
    :goto_8b
    return-void

    .line 71
    :catch_8c
    move-exception v11

    .line 73
    .local v11, "t":Ljava/lang/Throwable;
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v15, "%s: %s [Error Extracting Metadata]%n"

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    aput-object p0, v16, v17

    invoke-virtual/range {v14 .. v16}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 74
    sget-object v14, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v11, v14}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    goto :goto_8b

    .line 90
    .end local v11    # "t":Ljava/lang/Throwable;
    .restart local v10    # "metadata":Lcom/drew/metadata/Metadata;
    :cond_b2
    invoke-virtual {v10}, Lcom/drew/metadata/Metadata;->getDirectories()Ljava/lang/Iterable;

    move-result-object v14

    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_ba
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_8b

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/drew/metadata/Directory;

    .line 91
    .restart local v3    # "directory":Lcom/drew/metadata/Directory;
    invoke-virtual {v3}, Lcom/drew/metadata/Directory;->getTags()Ljava/util/Collection;

    move-result-object v14

    invoke-interface {v14}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8    # "i$":Ljava/util/Iterator;
    :goto_ce
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_ba

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/drew/metadata/Tag;

    .line 92
    .local v12, "tag":Lcom/drew/metadata/Tag;
    invoke-virtual {v12}, Lcom/drew/metadata/Tag;->getTagName()Ljava/lang/String;

    move-result-object v13

    .line 93
    .local v13, "tagName":Ljava/lang/String;
    invoke-virtual {v3}, Lcom/drew/metadata/Directory;->getName()Ljava/lang/String;

    move-result-object v4

    .line 94
    .local v4, "directoryName":Ljava/lang/String;
    invoke-virtual {v12}, Lcom/drew/metadata/Tag;->getDescription()Ljava/lang/String;

    move-result-object v2

    .line 97
    .local v2, "description":Ljava/lang/String;
    if-eqz v2, :cond_10c

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v14

    const/16 v15, 0x400

    if-le v14, v15, :cond_10c

    .line 98
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v15, 0x0

    const/16 v16, 0x400

    move/from16 v0, v16

    invoke-virtual {v2, v15, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "..."

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 101
    :cond_10c
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v15, "[%s] %s = %s%n"

    const/16 v16, 0x3

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v4, v16, v17

    const/16 v17, 0x1

    aput-object v13, v16, v17

    const/16 v17, 0x2

    aput-object v2, v16, v17

    invoke-virtual/range {v14 .. v16}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    goto :goto_ce
.end method
