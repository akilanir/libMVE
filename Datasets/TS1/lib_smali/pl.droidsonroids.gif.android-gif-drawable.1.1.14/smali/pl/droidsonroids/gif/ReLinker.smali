.class Lpl/droidsonroids/gif/ReLinker;
.super Ljava/lang/Object;
.source "ReLinker.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x9
.end annotation


# static fields
.field private static final COPY_BUFFER_SIZE:I = 0x2000

.field private static final LIB_DIR:Ljava/lang/String; = "lib"

.field private static final MAX_TRIES:I = 0x5


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    return-void
.end method

.method private static clearOldLibraryFiles(Ljava/io/File;Ljava/io/FilenameFilter;)V
    .registers 6
    .param p0, "outputFile"    # Ljava/io/File;
    .param p1, "filter"    # Ljava/io/FilenameFilter;

    .prologue
    .line 174
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v1

    .line 175
    .local v1, "fileList":[Ljava/io/File;
    if-eqz v1, :cond_16

    .line 176
    array-length v3, v1

    const/4 v2, 0x0

    :goto_c
    if-ge v2, v3, :cond_16

    aget-object v0, v1, v2

    .line 177
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 176
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 180
    .end local v0    # "file":Ljava/io/File;
    :cond_16
    return-void
.end method

.method private static closeSilently(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 216
    if-eqz p0, :cond_5

    .line 217
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 221
    :cond_5
    :goto_5
    return-void

    .line 219
    :catch_6
    move-exception v0

    goto :goto_5
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .registers 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    const/16 v2, 0x2000

    new-array v0, v2, [B

    .line 201
    .local v0, "buf":[B
    :goto_4
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 202
    .local v1, "bytesRead":I
    const/4 v2, -0x1

    if-ne v1, v2, :cond_c

    .line 207
    return-void

    .line 205
    :cond_c
    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_4
.end method

.method private static findLibraryEntry(Ljava/lang/String;Ljava/util/zip/ZipFile;)Ljava/util/zip/ZipEntry;
    .registers 7
    .param p0, "libName"    # Ljava/lang/String;
    .param p1, "zipFile"    # Ljava/util/zip/ZipFile;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 140
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_18

    .line 141
    sget-object v3, Landroid/os/Build;->SUPPORTED_ABIS:[Ljava/lang/String;

    array-length v4, v3

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v4, :cond_18

    aget-object v0, v3, v2

    .line 142
    .local v0, "abi":Ljava/lang/String;
    invoke-static {p0, p1, v0}, Lpl/droidsonroids/gif/ReLinker;->getEntry(Ljava/lang/String;Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v1

    .line 143
    .local v1, "libraryEntry":Ljava/util/zip/ZipEntry;
    if-eqz v1, :cond_15

    .line 148
    .end local v0    # "abi":Ljava/lang/String;
    .end local v1    # "libraryEntry":Ljava/util/zip/ZipEntry;
    :goto_14
    return-object v1

    .line 141
    .restart local v0    # "abi":Ljava/lang/String;
    .restart local v1    # "libraryEntry":Ljava/util/zip/ZipEntry;
    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 148
    .end local v0    # "abi":Ljava/lang/String;
    .end local v1    # "libraryEntry":Ljava/util/zip/ZipEntry;
    :cond_18
    sget-object v2, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    invoke-static {p0, p1, v2}, Lpl/droidsonroids/gif/ReLinker;->getEntry(Ljava/lang/String;Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v1

    goto :goto_14
.end method

.method private static getEntry(Ljava/lang/String;Ljava/util/zip/ZipFile;Ljava/lang/String;)Ljava/util/zip/ZipEntry;
    .registers 5
    .param p0, "libName"    # Ljava/lang/String;
    .param p1, "zipFile"    # Ljava/util/zip/ZipFile;
    .param p2, "abi"    # Ljava/lang/String;

    .prologue
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "lib/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v0

    return-object v0
.end method

.method static loadLibrary(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "library"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnsafeDynamicallyLoadedCode"
        }
    .end annotation

    .prologue
    .line 58
    invoke-static {p1}, Ljava/lang/System;->mapLibraryName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "libName":Ljava/lang/String;
    const-class v3, Lpl/droidsonroids/gif/ReLinker;

    monitor-enter v3

    .line 60
    :try_start_7
    invoke-static {p0, v0}, Lpl/droidsonroids/gif/ReLinker;->unpackLibrary(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 61
    .local v1, "workaroundFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/System;->load(Ljava/lang/String;)V

    .line 62
    monitor-exit v3

    .line 63
    return-void

    .line 62
    .end local v1    # "workaroundFile":Ljava/io/File;
    :catchall_14
    move-exception v2

    monitor-exit v3
    :try_end_16
    .catchall {:try_start_7 .. :try_end_16} :catchall_14

    throw v2
.end method

.method private static openZipFile(Ljava/io/File;)Ljava/util/zip/ZipFile;
    .registers 8
    .param p0, "apkFile"    # Ljava/io/File;

    .prologue
    .line 156
    const/4 v0, 0x0

    .line 157
    .local v0, "tries":I
    const/4 v2, 0x0

    .local v2, "zipFile":Ljava/util/zip/ZipFile;
    move v1, v0

    .line 158
    .end local v0    # "tries":I
    .local v1, "tries":I
    :goto_3
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "tries":I
    .restart local v0    # "tries":I
    const/4 v4, 0x5

    if-ge v1, v4, :cond_f

    .line 160
    :try_start_8
    new-instance v3, Ljava/util/zip/ZipFile;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;I)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_e} :catch_2e

    .end local v2    # "zipFile":Ljava/util/zip/ZipFile;
    .local v3, "zipFile":Ljava/util/zip/ZipFile;
    move-object v2, v3

    .line 166
    .end local v3    # "zipFile":Ljava/util/zip/ZipFile;
    .restart local v2    # "zipFile":Ljava/util/zip/ZipFile;
    :cond_f
    if-nez v2, :cond_31

    .line 167
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not open APK file: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 162
    :catch_2e
    move-exception v4

    move v1, v0

    .line 163
    .end local v0    # "tries":I
    .restart local v1    # "tries":I
    goto :goto_3

    .line 169
    .end local v1    # "tries":I
    .restart local v0    # "tries":I
    :cond_31
    return-object v2
.end method

.method private static setFilePermissions(Ljava/io/File;)V
    .registers 3
    .param p0, "outputFile"    # Ljava/io/File;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetWorldReadable"
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 186
    invoke-virtual {p0, v0, v1}, Ljava/io/File;->setReadable(ZZ)Z

    .line 187
    invoke-virtual {p0, v0, v1}, Ljava/io/File;->setExecutable(ZZ)Z

    .line 188
    invoke-virtual {p0, v0}, Ljava/io/File;->setWritable(Z)Z

    .line 189
    return-void
.end method

.method private static unpackLibrary(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .registers 19
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "libName"    # Ljava/lang/String;

    .prologue
    .line 73
    new-instance v10, Ljava/io/File;

    const-string v14, "lib"

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "1.1.14"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v10, v14, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 74
    .local v10, "outputFile":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->isFile()Z

    move-result v14

    if-eqz v14, :cond_2b

    move-object v3, v10

    .line 134
    :cond_2a
    :goto_2a
    return-object v3

    .line 78
    :cond_2b
    new-instance v3, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "1.1.14"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v3, v14, v15}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 79
    .local v3, "cachedLibraryFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v14

    if-nez v14, :cond_2a

    .line 83
    new-instance v7, Lpl/droidsonroids/gif/ReLinker$1;

    move-object/from16 v0, p1

    invoke-direct {v7, v0}, Lpl/droidsonroids/gif/ReLinker$1;-><init>(Ljava/lang/String;)V

    .line 89
    .local v7, "filter":Ljava/io/FilenameFilter;
    invoke-static {v10, v7}, Lpl/droidsonroids/gif/ReLinker;->clearOldLibraryFiles(Ljava/io/File;Ljava/io/FilenameFilter;)V

    .line 90
    invoke-static {v3, v7}, Lpl/droidsonroids/gif/ReLinker;->clearOldLibraryFiles(Ljava/io/File;Ljava/io/FilenameFilter;)V

    .line 92
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    .line 93
    .local v2, "appInfo":Landroid/content/pm/ApplicationInfo;
    new-instance v1, Ljava/io/File;

    iget-object v14, v2, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    invoke-direct {v1, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 94
    .local v1, "apkFile":Ljava/io/File;
    const/4 v13, 0x0

    .line 96
    .local v13, "zipFile":Ljava/util/zip/ZipFile;
    :try_start_68
    invoke-static {v1}, Lpl/droidsonroids/gif/ReLinker;->openZipFile(Ljava/io/File;)Ljava/util/zip/ZipFile;

    move-result-object v13

    .line 98
    const/4 v11, 0x0

    .local v11, "tries":I
    move v12, v11

    .line 99
    .end local v11    # "tries":I
    .local v12, "tries":I
    :goto_6e
    add-int/lit8 v11, v12, 0x1

    .end local v12    # "tries":I
    .restart local v11    # "tries":I
    const/4 v14, 0x5

    if-ge v12, v14, :cond_ba

    .line 100
    move-object/from16 v0, p1

    invoke-static {v0, v13}, Lpl/droidsonroids/gif/ReLinker;->findLibraryEntry(Ljava/lang/String;Ljava/util/zip/ZipFile;)Ljava/util/zip/ZipEntry;

    move-result-object v9

    .line 101
    .local v9, "libraryEntry":Ljava/util/zip/ZipEntry;
    if-nez v9, :cond_a3

    .line 102
    new-instance v14, Ljava/lang/IllegalStateException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Library "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " for supported ABIs not found in APK file"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_9c
    .catchall {:try_start_68 .. :try_end_9c} :catchall_9c

    .line 127
    .end local v9    # "libraryEntry":Ljava/util/zip/ZipEntry;
    .end local v11    # "tries":I
    :catchall_9c
    move-exception v14

    .line 128
    if-eqz v13, :cond_a2

    .line 129
    :try_start_9f
    invoke-virtual {v13}, Ljava/util/zip/ZipFile;->close()V
    :try_end_a2
    .catch Ljava/io/IOException; {:try_start_9f .. :try_end_a2} :catch_d9

    .line 132
    :cond_a2
    :goto_a2
    throw v14

    .line 105
    .restart local v9    # "libraryEntry":Ljava/util/zip/ZipEntry;
    .restart local v11    # "tries":I
    :cond_a3
    const/4 v8, 0x0

    .line 106
    .local v8, "inputStream":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 108
    .local v5, "fileOut":Ljava/io/FileOutputStream;
    :try_start_a5
    invoke-virtual {v13, v9}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v8

    .line 109
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_ae
    .catch Ljava/io/IOException; {:try_start_a5 .. :try_end_ae} :catch_c2
    .catchall {:try_start_a5 .. :try_end_ae} :catchall_cf

    .line 110
    .end local v5    # "fileOut":Ljava/io/FileOutputStream;
    .local v6, "fileOut":Ljava/io/FileOutputStream;
    :try_start_ae
    invoke-static {v8, v6}, Lpl/droidsonroids/gif/ReLinker;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_b1
    .catch Ljava/io/IOException; {:try_start_ae .. :try_end_b1} :catch_de
    .catchall {:try_start_ae .. :try_end_b1} :catchall_db

    .line 117
    :try_start_b1
    invoke-static {v8}, Lpl/droidsonroids/gif/ReLinker;->closeSilently(Ljava/io/Closeable;)V

    .line 118
    invoke-static {v6}, Lpl/droidsonroids/gif/ReLinker;->closeSilently(Ljava/io/Closeable;)V

    .line 120
    invoke-static {v10}, Lpl/droidsonroids/gif/ReLinker;->setFilePermissions(Ljava/io/File;)V
    :try_end_ba
    .catchall {:try_start_b1 .. :try_end_ba} :catchall_9c

    .line 128
    .end local v6    # "fileOut":Ljava/io/FileOutputStream;
    .end local v8    # "inputStream":Ljava/io/InputStream;
    .end local v9    # "libraryEntry":Ljava/util/zip/ZipEntry;
    :cond_ba
    if-eqz v13, :cond_bf

    .line 129
    :try_start_bc
    invoke-virtual {v13}, Ljava/util/zip/ZipFile;->close()V
    :try_end_bf
    .catch Ljava/io/IOException; {:try_start_bc .. :try_end_bf} :catch_d7

    :cond_bf
    :goto_bf
    move-object v3, v10

    .line 134
    goto/16 :goto_2a

    .line 111
    .restart local v5    # "fileOut":Ljava/io/FileOutputStream;
    .restart local v8    # "inputStream":Ljava/io/InputStream;
    .restart local v9    # "libraryEntry":Ljava/util/zip/ZipEntry;
    :catch_c2
    move-exception v4

    .line 112
    .local v4, "e":Ljava/io/IOException;
    :goto_c3
    const/4 v14, 0x2

    if-le v11, v14, :cond_c7

    .line 113
    move-object v10, v3

    .line 117
    :cond_c7
    :try_start_c7
    invoke-static {v8}, Lpl/droidsonroids/gif/ReLinker;->closeSilently(Ljava/io/Closeable;)V

    .line 118
    invoke-static {v5}, Lpl/droidsonroids/gif/ReLinker;->closeSilently(Ljava/io/Closeable;)V

    move v12, v11

    .end local v11    # "tries":I
    .restart local v12    # "tries":I
    goto :goto_6e

    .line 117
    .end local v4    # "e":Ljava/io/IOException;
    .end local v12    # "tries":I
    .restart local v11    # "tries":I
    :catchall_cf
    move-exception v14

    :goto_d0
    invoke-static {v8}, Lpl/droidsonroids/gif/ReLinker;->closeSilently(Ljava/io/Closeable;)V

    .line 118
    invoke-static {v5}, Lpl/droidsonroids/gif/ReLinker;->closeSilently(Ljava/io/Closeable;)V

    throw v14
    :try_end_d7
    .catchall {:try_start_c7 .. :try_end_d7} :catchall_9c

    .line 131
    .end local v5    # "fileOut":Ljava/io/FileOutputStream;
    .end local v8    # "inputStream":Ljava/io/InputStream;
    .end local v9    # "libraryEntry":Ljava/util/zip/ZipEntry;
    :catch_d7
    move-exception v14

    goto :goto_bf

    .end local v11    # "tries":I
    :catch_d9
    move-exception v15

    goto :goto_a2

    .line 117
    .restart local v6    # "fileOut":Ljava/io/FileOutputStream;
    .restart local v8    # "inputStream":Ljava/io/InputStream;
    .restart local v9    # "libraryEntry":Ljava/util/zip/ZipEntry;
    .restart local v11    # "tries":I
    :catchall_db
    move-exception v14

    move-object v5, v6

    .end local v6    # "fileOut":Ljava/io/FileOutputStream;
    .restart local v5    # "fileOut":Ljava/io/FileOutputStream;
    goto :goto_d0

    .line 111
    .end local v5    # "fileOut":Ljava/io/FileOutputStream;
    .restart local v6    # "fileOut":Ljava/io/FileOutputStream;
    :catch_de
    move-exception v4

    move-object v5, v6

    .end local v6    # "fileOut":Ljava/io/FileOutputStream;
    .restart local v5    # "fileOut":Ljava/io/FileOutputStream;
    goto :goto_c3
.end method
