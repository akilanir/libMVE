.class Lcom/danikula/videocache/file/Files;
.super Ljava/lang/Object;
.source "Files.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/danikula/videocache/file/Files$1;,
        Lcom/danikula/videocache/file/Files$LastModifiedComparator;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    return-void
.end method

.method static getLruListFiles(Ljava/io/File;)Ljava/util/List;
    .registers 5
    .param p0, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .prologue
    .line 33
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 34
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 35
    .local v0, "files":[Ljava/io/File;
    if-eqz v0, :cond_18

    .line 36
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 37
    new-instance v2, Lcom/danikula/videocache/file/Files$LastModifiedComparator;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/danikula/videocache/file/Files$LastModifiedComparator;-><init>(Lcom/danikula/videocache/file/Files$1;)V

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 39
    :cond_18
    return-object v1
.end method

.method static makeDir(Ljava/io/File;)V
    .registers 7
    .param p0, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 21
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_47

    .line 22
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "File "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not directory!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 25
    :cond_2b
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    .line 26
    .local v0, "isCreated":Z
    if-nez v0, :cond_47

    .line 27
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Directory %s can\'t be created"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 30
    .end local v0    # "isCreated":Z
    :cond_47
    return-void
.end method

.method static modify(Ljava/io/File;)V
    .registers 9
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v6, 0x1

    .line 56
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    .line 57
    .local v2, "size":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_10

    .line 58
    invoke-static {p0}, Lcom/danikula/videocache/file/Files;->recreateZeroSizeFile(Ljava/io/File;)V

    .line 68
    :goto_f
    return-void

    .line 62
    :cond_10
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v4, "rwd"

    invoke-direct {v0, p0, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 63
    .local v0, "accessFile":Ljava/io/RandomAccessFile;
    sub-long v4, v2, v6

    invoke-virtual {v0, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 64
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->readByte()B

    move-result v1

    .line 65
    .local v1, "lastByte":B
    sub-long v4, v2, v6

    invoke-virtual {v0, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 66
    invoke-virtual {v0, v1}, Ljava/io/RandomAccessFile;->write(I)V

    .line 67
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    goto :goto_f
.end method

.method private static recreateZeroSizeFile(Ljava/io/File;)V
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z

    move-result v0

    if-nez v0, :cond_25

    .line 72
    :cond_c
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error recreate zero-size file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_25
    return-void
.end method

.method static setLastModifiedNow(Ljava/io/File;)V
    .registers 7
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_34

    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 45
    .local v1, "now":J
    invoke-virtual {p0, v1, v2}, Ljava/io/File;->setLastModified(J)Z

    move-result v0

    .line 46
    .local v0, "modified":Z
    if-nez v0, :cond_34

    .line 47
    invoke-static {p0}, Lcom/danikula/videocache/file/Files;->modify(Ljava/io/File;)V

    .line 48
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    cmp-long v3, v3, v1

    if-gez v3, :cond_34

    .line 49
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error set last modified date to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 53
    .end local v0    # "modified":Z
    .end local v1    # "now":J
    :cond_34
    return-void
.end method
