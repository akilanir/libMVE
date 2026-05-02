.class public Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;
.super Ljava/lang/Object;
.source "FilesDumperPlugin.java"

# interfaces
.implements Lcom/facebook/stetho/dumpapp/DumperPlugin;


# static fields
.field private static final NAME:Ljava/lang/String; = "files"


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    .line 41
    return-void
.end method

.method private addFiles(Ljava/util/zip/ZipOutputStream;[B[Ljava/io/File;)V
    .registers 10
    .param p1, "output"    # Ljava/util/zip/ZipOutputStream;
    .param p2, "buf"    # [B
    .param p3, "files"    # [Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    array-length v3, p3

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v3, :cond_3d

    aget-object v0, p3, v2

    .line 159
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_16

    .line 160
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v4

    invoke-direct {p0, p1, p2, v4}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->addFiles(Ljava/util/zip/ZipOutputStream;[B[Ljava/io/File;)V

    .line 158
    :goto_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 162
    :cond_16
    new-instance v4, Ljava/util/zip/ZipEntry;

    iget-object v5, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    .line 165
    invoke-static {v5}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    .line 164
    invoke-static {v5, v0}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->relativizePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 162
    invoke-virtual {p1, v4}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 167
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 169
    .local v1, "input":Ljava/io/FileInputStream;
    :try_start_31
    invoke-static {v1, p1, p2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
    :try_end_34
    .catchall {:try_start_31 .. :try_end_34} :catchall_38

    .line 171
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    goto :goto_13

    :catchall_38
    move-exception v2

    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    throw v2

    .line 175
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "input":Ljava/io/FileInputStream;
    :cond_3d
    return-void
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
    .registers 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    :goto_0
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .local v0, "n":I
    if-ltz v0, :cond_b

    .line 180
    const/4 v1, 0x0

    invoke-virtual {p1, p2, v1, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 182
    :cond_b
    return-void
.end method

.method private doDownload(Ljava/io/PrintStream;Ljava/util/Iterator;)V
    .registers 14
    .param p1, "writer"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/PrintStream;",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .prologue
    .local p2, "remainingArgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 119
    const-string v7, "Must specify output file or \'-\'"

    invoke-static {p2, v7}, Lcom/facebook/stetho/dumpapp/ArgsHelper;->nextArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 120
    .local v3, "outputPath":Ljava/lang/String;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v5, "selectedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    :goto_d
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_23

    .line 122
    iget-object v10, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v10, v7}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->resolvePossibleAppStoragePath(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 127
    :cond_23
    :try_start_23
    const-string v7, "-"

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_55

    .line 128
    move-object v4, p1

    .line 132
    .local v4, "outputStream":Ljava/io/OutputStream;
    :goto_2c
    new-instance v2, Ljava/util/zip/ZipOutputStream;

    new-instance v7, Ljava/io/BufferedOutputStream;

    invoke-direct {v7, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v2, v7}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_36
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_36} :catch_72

    .line 133
    .local v2, "output":Ljava/util/zip/ZipOutputStream;
    const/4 v6, 0x0

    .line 135
    .local v6, "success":Z
    const/16 v7, 0x800

    :try_start_39
    new-array v0, v7, [B

    .line 136
    .local v0, "buf":[B
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_5f

    .line 137
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Ljava/io/File;

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/io/File;

    invoke-direct {p0, v2, v0, v7}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->addFiles(Ljava/util/zip/ZipOutputStream;[B[Ljava/io/File;)V
    :try_end_50
    .catchall {:try_start_39 .. :try_end_50} :catchall_6d

    .line 141
    :goto_50
    const/4 v6, 0x1

    .line 144
    :try_start_51
    invoke-virtual {v2}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_54
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_54} :catch_79

    .line 155
    :cond_54
    return-void

    .line 130
    .end local v0    # "buf":[B
    .end local v2    # "output":Ljava/util/zip/ZipOutputStream;
    .end local v4    # "outputStream":Ljava/io/OutputStream;
    .end local v6    # "success":Z
    :cond_55
    :try_start_55
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-static {v3}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->resolvePossibleSdcardPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v7

    invoke-direct {v4, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_5e} :catch_72

    .restart local v4    # "outputStream":Ljava/io/OutputStream;
    goto :goto_2c

    .line 139
    .restart local v0    # "buf":[B
    .restart local v2    # "output":Ljava/util/zip/ZipOutputStream;
    .restart local v6    # "success":Z
    :cond_5f
    :try_start_5f
    iget-object v7, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    invoke-static {v7}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v7

    invoke-direct {p0, v2, v0, v7}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->addFiles(Ljava/util/zip/ZipOutputStream;[B[Ljava/io/File;)V
    :try_end_6c
    .catchall {:try_start_5f .. :try_end_6c} :catchall_6d

    goto :goto_50

    .line 143
    .end local v0    # "buf":[B
    :catchall_6d
    move-exception v7

    .line 144
    :try_start_6e
    invoke-virtual {v2}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_71} :catch_84

    .line 150
    :cond_71
    :try_start_71
    throw v7
    :try_end_72
    .catch Ljava/io/IOException; {:try_start_71 .. :try_end_72} :catch_72

    .line 152
    .end local v2    # "output":Ljava/util/zip/ZipOutputStream;
    .end local v4    # "outputStream":Ljava/io/OutputStream;
    .end local v6    # "success":Z
    :catch_72
    move-exception v1

    .line 153
    .local v1, "e":Ljava/io/IOException;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 145
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "buf":[B
    .restart local v2    # "output":Ljava/util/zip/ZipOutputStream;
    .restart local v4    # "outputStream":Ljava/io/OutputStream;
    .restart local v6    # "success":Z
    :catch_79
    move-exception v1

    .line 146
    .restart local v1    # "e":Ljava/io/IOException;
    if-nez v6, :cond_82

    :goto_7c
    :try_start_7c
    invoke-static {v4, v8}, Lcom/facebook/stetho/common/Util;->close(Ljava/io/Closeable;Z)V

    .line 147
    if-eqz v6, :cond_54

    .line 148
    throw v1

    :cond_82
    move v8, v9

    .line 146
    goto :goto_7c

    .line 145
    .end local v0    # "buf":[B
    .end local v1    # "e":Ljava/io/IOException;
    :catch_84
    move-exception v1

    .line 146
    .restart local v1    # "e":Ljava/io/IOException;
    if-nez v6, :cond_8d

    :goto_87
    invoke-static {v4, v8}, Lcom/facebook/stetho/common/Util;->close(Ljava/io/Closeable;Z)V

    .line 147
    if-eqz v6, :cond_71

    .line 148
    throw v1
    :try_end_8d
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_8d} :catch_72

    :cond_8d
    move v8, v9

    .line 146
    goto :goto_87
.end method

.method private doLs(Ljava/io/PrintStream;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 69
    .local v0, "baseDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_11

    .line 70
    const-string v1, ""

    invoke-static {v0, v1, p1}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printDirectoryText(Ljava/io/File;Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 72
    :cond_11
    return-void
.end method

.method private doTree(Ljava/io/PrintStream;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 76
    .local v0, "baseDir":Ljava/io/File;
    const/4 v1, 0x0

    invoke-static {v0, v1, p1}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printDirectoryVisual(Ljava/io/File;ILjava/io/PrintStream;)V

    .line 77
    return-void
.end method

.method private doUsage(Ljava/io/PrintStream;)V
    .registers 7
    .param p1, "writer"    # Ljava/io/PrintStream;

    .prologue
    .line 213
    const-string v1, "dumpapp files"

    .line 215
    .local v1, "cmdName":Ljava/lang/String;
    const-string v2, "Usage: dumpapp files "

    .line 216
    .local v2, "usagePrefix":Ljava/lang/String;
    const-string v0, "       dumpapp files "

    .line 217
    .local v0, "blankPrefix":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<command> [command-options]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 218
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "ls"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 219
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "tree"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 220
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "download <output.zip> [<path>...]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 221
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 222
    const-string v3, "dumpapp files ls: List files similar to the ls command"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 223
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 224
    const-string v3, "dumpapp files tree: List files similar to the tree command"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 225
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 226
    const-string v3, "dumpapp files download: Fetch internal application storage"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 227
    const-string v3, "    <output.zip>: Output location or \'-\' for stdout"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 228
    const-string v3, "    <path>: Fetch only those paths named (directories fetch recursively)"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 229
    return-void
.end method

.method private static getBaseDir(Landroid/content/Context;)Ljava/io/File;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 81
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private static printDirectoryText(Ljava/io/File;Ljava/lang/String;Ljava/io/PrintStream;)V
    .registers 8
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "writer"    # Ljava/io/PrintStream;

    .prologue
    .line 85
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 86
    .local v2, "listFiles":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v3, v2

    if-ge v1, v3, :cond_4a

    .line 87
    aget-object v0, v2, v1

    .line 88
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 89
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, p2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printDirectoryText(Ljava/io/File;Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 86
    :goto_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 91
    :cond_31
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2e

    .line 94
    .end local v0    # "file":Ljava/io/File;
    :cond_4a
    return-void
.end method

.method private static printDirectoryVisual(Ljava/io/File;ILjava/io/PrintStream;)V
    .registers 7
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "depth"    # I
    .param p2, "writer"    # Ljava/io/PrintStream;

    .prologue
    .line 97
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 98
    .local v2, "listFiles":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v3, v2

    if-ge v1, v3, :cond_2a

    .line 99
    invoke-static {p1, p2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printHeaderVisual(ILjava/io/PrintStream;)V

    .line 100
    aget-object v0, v2, v1

    .line 101
    .local v0, "file":Ljava/io/File;
    const-string v3, "+---"

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 102
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 103
    invoke-virtual {p2}, Ljava/io/PrintStream;->println()V

    .line 105
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_27

    .line 106
    add-int/lit8 v3, p1, 0x1

    invoke-static {v0, v3, p2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printDirectoryVisual(Ljava/io/File;ILjava/io/PrintStream;)V

    .line 98
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 109
    .end local v0    # "file":Ljava/io/File;
    :cond_2a
    return-void
.end method

.method private static printHeaderVisual(ILjava/io/PrintStream;)V
    .registers 4
    .param p0, "depth"    # I
    .param p1, "writer"    # Ljava/io/PrintStream;

    .prologue
    .line 112
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p0, :cond_b

    .line 113
    const-string v1, "|   "

    invoke-virtual {p1, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 112
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 115
    :cond_b
    return-void
.end method

.method private static relativizePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;
    .registers 5
    .param p0, "base"    # Ljava/io/File;
    .param p1, "path"    # Ljava/io/File;

    .prologue
    .line 186
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 187
    .local v0, "baseStr":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 189
    .local v1, "pathStr":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 190
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 192
    .end local v1    # "pathStr":Ljava/lang/String;
    :cond_18
    return-object v1
.end method

.method private static resolvePossibleAppStoragePath(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 197
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 198
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 200
    :goto_d
    return-object v0

    :cond_e
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_d
.end method

.method private static resolvePossibleSdcardPath(Ljava/lang/String;)Ljava/io/File;
    .registers 3
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 205
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 206
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 208
    :goto_d
    return-object v0

    :cond_e
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_d
.end method


# virtual methods
.method public dump(Lcom/facebook/stetho/dumpapp/DumperContext;)V
    .registers 7
    .param p1, "dumpContext"    # Lcom/facebook/stetho/dumpapp/DumperContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getArgsAsList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 52
    .local v0, "args":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v2, ""

    invoke-static {v0, v2}, Lcom/facebook/stetho/dumpapp/ArgsHelper;->nextOptionalArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 53
    .local v1, "command":Ljava/lang/String;
    const-string v2, "ls"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 54
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->doLs(Ljava/io/PrintStream;)V

    .line 65
    :cond_1d
    :goto_1d
    return-void

    .line 55
    :cond_1e
    const-string v2, "tree"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2e

    .line 56
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->doTree(Ljava/io/PrintStream;)V

    goto :goto_1d

    .line 57
    :cond_2e
    const-string v2, "download"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    .line 58
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v2

    invoke-direct {p0, v2, v0}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->doDownload(Ljava/io/PrintStream;Ljava/util/Iterator;)V

    goto :goto_1d

    .line 60
    :cond_3e
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->doUsage(Ljava/io/PrintStream;)V

    .line 61
    const-string v2, ""

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1d

    .line 62
    new-instance v2, Lcom/facebook/stetho/dumpapp/DumpUsageException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown command: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/stetho/dumpapp/DumpUsageException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    const-string v0, "files"

    return-object v0
.end method
