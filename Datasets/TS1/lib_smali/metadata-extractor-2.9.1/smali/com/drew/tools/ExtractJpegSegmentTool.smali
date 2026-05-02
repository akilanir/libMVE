.class public Lcom/drew/tools/ExtractJpegSegmentTool;
.super Ljava/lang/Object;
.source "ExtractJpegSegmentTool.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 11
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/drew/imaging/jpeg/JpegProcessingException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 53
    array-length v5, p0

    if-ge v5, v8, :cond_b

    .line 54
    invoke-static {}, Lcom/drew/tools/ExtractJpegSegmentTool;->printUsage()V

    .line 55
    invoke-static {v8}, Ljava/lang/System;->exit(I)V

    .line 58
    :cond_b
    aget-object v0, p0, v9

    .line 60
    .local v0, "filePath":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_25

    .line 61
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v6, "File does not exist"

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 62
    invoke-static {}, Lcom/drew/tools/ExtractJpegSegmentTool;->printUsage()V

    .line 63
    invoke-static {v8}, Ljava/lang/System;->exit(I)V

    .line 66
    :cond_25
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 68
    .local v4, "segmentTypes":Ljava/util/Set;, "Ljava/util/Set<Lcom/drew/imaging/jpeg/JpegSegmentType;>;"
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_2b
    array-length v5, p0

    if-ge v1, v5, :cond_4d

    .line 69
    aget-object v5, p0, v1

    invoke-virtual {v5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/drew/imaging/jpeg/JpegSegmentType;->valueOf(Ljava/lang/String;)Lcom/drew/imaging/jpeg/JpegSegmentType;

    move-result-object v3

    .line 70
    .local v3, "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    iget-boolean v5, v3, Lcom/drew/imaging/jpeg/JpegSegmentType;->canContainMetadata:Z

    if-nez v5, :cond_47

    .line 71
    sget-object v5, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v6, "WARNING: Segment type %s cannot contain metadata so it may not be necessary to extract it%n"

    new-array v7, v8, [Ljava/lang/Object;

    aput-object v3, v7, v9

    invoke-virtual {v5, v6, v7}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 73
    :cond_47
    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 68
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 76
    .end local v3    # "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    :cond_4d
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v5

    if-nez v5, :cond_58

    .line 78
    sget-object v5, Lcom/drew/imaging/jpeg/JpegSegmentType;->canContainMetadataTypes:Ljava/util/Collection;

    invoke-interface {v4, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 81
    :cond_58
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Reading: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 83
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v5, v4}, Lcom/drew/imaging/jpeg/JpegSegmentReader;->readSegments(Ljava/io/File;Ljava/lang/Iterable;)Lcom/drew/imaging/jpeg/JpegSegmentData;

    move-result-object v2

    .line 85
    .local v2, "segmentData":Lcom/drew/imaging/jpeg/JpegSegmentData;
    invoke-static {v0, v2}, Lcom/drew/tools/ExtractJpegSegmentTool;->saveSegmentFiles(Ljava/lang/String;Lcom/drew/imaging/jpeg/JpegSegmentData;)V

    .line 86
    return-void
.end method

.method private static printUsage()V
    .registers 7

    .prologue
    .line 112
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "USAGE:\n"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 113
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "\tjava com.drew.tools.ExtractJpegSegmentTool <filename> [<segment> ...]\n"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 115
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Where <segment> is zero or more of:"

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 116
    const-class v4, Lcom/drew/imaging/jpeg/JpegSegmentType;

    invoke-virtual {v4}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/drew/imaging/jpeg/JpegSegmentType;

    .local v0, "arr$":[Lcom/drew/imaging/jpeg/JpegSegmentType;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1f
    if-ge v1, v2, :cond_46

    aget-object v3, v0, v1

    .line 117
    .local v3, "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    iget-boolean v4, v3, Lcom/drew/imaging/jpeg/JpegSegmentType;->canContainMetadata:Z

    if-eqz v4, :cond_43

    .line 118
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Lcom/drew/imaging/jpeg/JpegSegmentType;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 116
    :cond_43
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    .line 121
    .end local v3    # "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    :cond_46
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4}, Ljava/io/PrintStream;->println()V

    .line 122
    return-void
.end method

.method public static saveSegmentFiles(Ljava/lang/String;Lcom/drew/imaging/jpeg/JpegSegmentData;)V
    .registers 13
    .param p0, "jpegFilePath"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "segmentData"    # Lcom/drew/imaging/jpeg/JpegSegmentData;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 90
    invoke-virtual {p1}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegmentTypes()Ljava/lang/Iterable;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/drew/imaging/jpeg/JpegSegmentType;

    .line 91
    .local v3, "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    invoke-virtual {p1, v3}, Lcom/drew/imaging/jpeg/JpegSegmentData;->getSegments(Lcom/drew/imaging/jpeg/JpegSegmentType;)Ljava/lang/Iterable;

    move-result-object v5

    invoke-static {v5}, Lcom/drew/lang/Iterables;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    .line 92
    .local v4, "segments":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-eqz v5, :cond_b

    .line 96
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-le v5, v9, :cond_76

    .line 97
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2c
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-ge v0, v5, :cond_b

    .line 98
    const-string v5, "%s.%s.%d"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object p0, v6, v8

    invoke-virtual {v3}, Lcom/drew/imaging/jpeg/JpegSegmentType;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 99
    .local v2, "outputFilePath":Ljava/lang/String;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Writing: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 100
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    invoke-static {v6, v5}, Lcom/drew/tools/FileUtil;->saveBytes(Ljava/io/File;[B)V

    .line 97
    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    .line 103
    .end local v0    # "i":I
    .end local v2    # "outputFilePath":Ljava/lang/String;
    :cond_76
    const-string v5, "%s.%s"

    new-array v6, v10, [Ljava/lang/Object;

    aput-object p0, v6, v8

    invoke-virtual {v3}, Lcom/drew/imaging/jpeg/JpegSegmentType;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 104
    .restart local v2    # "outputFilePath":Ljava/lang/String;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Writing: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 105
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [B

    invoke-static {v6, v5}, Lcom/drew/tools/FileUtil;->saveBytes(Ljava/io/File;[B)V

    goto/16 :goto_b

    .line 108
    .end local v2    # "outputFilePath":Ljava/lang/String;
    .end local v3    # "segmentType":Lcom/drew/imaging/jpeg/JpegSegmentType;
    .end local v4    # "segments":Ljava/util/List;, "Ljava/util/List<[B>;"
    :cond_b2
    return-void
.end method
