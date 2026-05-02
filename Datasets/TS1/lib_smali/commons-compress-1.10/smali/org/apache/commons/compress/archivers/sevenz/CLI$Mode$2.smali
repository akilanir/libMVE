.class final enum Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode$2;
.super Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;
.source "CLI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 5
    .param p3, "x0"    # Ljava/lang/String;

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/apache/commons/compress/archivers/sevenz/CLI$1;)V

    return-void
.end method


# virtual methods
.method public takeAction(Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)V
    .registers 16
    .param p1, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;
    .param p2, "entry"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    new-instance v4, Ljava/io/File;

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v4, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 72
    .local v4, "outFile":Ljava/io/File;
    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->isDirectory()Z

    move-result v9

    if-eqz v9, :cond_4d

    .line 73
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v9

    if-nez v9, :cond_34

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    move-result v9

    if-nez v9, :cond_34

    .line 74
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Cannot create directory "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 76
    :cond_34
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "created directory "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 105
    :goto_4c
    return-void

    .line 80
    :cond_4d
    sget-object v9, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "extracting to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 81
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    .line 82
    .local v5, "parent":Ljava/io/File;
    if-eqz v5, :cond_90

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_90

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    move-result v9

    if-nez v9, :cond_90

    .line 83
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Cannot create "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 85
    :cond_90
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 87
    .local v1, "fos":Ljava/io/FileOutputStream;
    :try_start_95
    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getSize()J

    move-result-wide v7

    .line 88
    .local v7, "total":J
    const-wide/16 v2, 0x0

    .line 89
    .local v2, "off":J
    :goto_9b
    cmp-long v9, v2, v7

    if-gez v9, :cond_f9

    .line 90
    sub-long v9, v7, v2

    # getter for: Lorg/apache/commons/compress/archivers/sevenz/CLI;->BUF:[B
    invoke-static {}, Lorg/apache/commons/compress/archivers/sevenz/CLI;->access$100()[B

    move-result-object v11

    array-length v11, v11

    int-to-long v11, v11

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    long-to-int v6, v9

    .line 91
    .local v6, "toRead":I
    # getter for: Lorg/apache/commons/compress/archivers/sevenz/CLI;->BUF:[B
    invoke-static {}, Lorg/apache/commons/compress/archivers/sevenz/CLI;->access$100()[B

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {p1, v9, v10, v6}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->read([BII)I

    move-result v0

    .line 92
    .local v0, "bytesRead":I
    const/4 v9, 0x1

    if-ge v0, v9, :cond_ee

    .line 93
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "reached end of entry "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " after "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " bytes, expected "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_e9
    .catchall {:try_start_95 .. :try_end_e9} :catchall_e9

    .line 103
    .end local v0    # "bytesRead":I
    .end local v2    # "off":J
    .end local v6    # "toRead":I
    .end local v7    # "total":J
    :catchall_e9
    move-exception v9

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    throw v9

    .line 99
    .restart local v0    # "bytesRead":I
    .restart local v2    # "off":J
    .restart local v6    # "toRead":I
    .restart local v7    # "total":J
    :cond_ee
    int-to-long v9, v0

    add-long/2addr v2, v9

    .line 100
    :try_start_f0
    # getter for: Lorg/apache/commons/compress/archivers/sevenz/CLI;->BUF:[B
    invoke-static {}, Lorg/apache/commons/compress/archivers/sevenz/CLI;->access$100()[B

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v1, v9, v10, v0}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_f8
    .catchall {:try_start_f0 .. :try_end_f8} :catchall_e9

    goto :goto_9b

    .line 103
    .end local v0    # "bytesRead":I
    .end local v6    # "toRead":I
    :cond_f9
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    goto/16 :goto_4c
.end method
