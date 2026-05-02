.class public Lorg/apache/commons/io/input/Tailer;
.super Ljava/lang/Object;
.source "Tailer.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final delay:J

.field private final end:Z

.field private final file:Ljava/io/File;

.field private final listener:Lorg/apache/commons/io/input/TailerListener;

.field private volatile run:Z


# direct methods
.method public constructor <init>(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .param p2, "listener"    # Lorg/apache/commons/io/input/TailerListener;

    .prologue
    .line 140
    const-wide/16 v0, 0x3e8

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/apache/commons/io/input/Tailer;-><init>(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;J)V

    .line 141
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;J)V
    .registers 11
    .param p1, "file"    # Ljava/io/File;
    .param p2, "listener"    # Lorg/apache/commons/io/input/TailerListener;
    .param p3, "delay"    # J

    .prologue
    .line 150
    const-wide/16 v3, 0x3e8

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/io/input/Tailer;-><init>(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;JZ)V

    .line 151
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;JZ)V
    .registers 7
    .param p1, "file"    # Ljava/io/File;
    .param p2, "listener"    # Lorg/apache/commons/io/input/TailerListener;
    .param p3, "delay"    # J
    .param p5, "end"    # Z

    .prologue
    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/io/input/Tailer;->run:Z

    .line 162
    iput-object p1, p0, Lorg/apache/commons/io/input/Tailer;->file:Ljava/io/File;

    .line 163
    iput-wide p3, p0, Lorg/apache/commons/io/input/Tailer;->delay:J

    .line 164
    iput-boolean p5, p0, Lorg/apache/commons/io/input/Tailer;->end:Z

    .line 167
    iput-object p2, p0, Lorg/apache/commons/io/input/Tailer;->listener:Lorg/apache/commons/io/input/TailerListener;

    .line 168
    invoke-interface {p2, p0}, Lorg/apache/commons/io/input/TailerListener;->init(Lorg/apache/commons/io/input/Tailer;)V

    .line 169
    return-void
.end method

.method public static create(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;)Lorg/apache/commons/io/input/Tailer;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "listener"    # Lorg/apache/commons/io/input/TailerListener;

    .prologue
    .line 209
    const-wide/16 v0, 0x3e8

    const/4 v2, 0x0

    invoke-static {p0, p1, v0, v1, v2}, Lorg/apache/commons/io/input/Tailer;->create(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;JZ)Lorg/apache/commons/io/input/Tailer;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;J)Lorg/apache/commons/io/input/Tailer;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "listener"    # Lorg/apache/commons/io/input/TailerListener;
    .param p2, "delay"    # J

    .prologue
    .line 197
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/apache/commons/io/input/Tailer;->create(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;JZ)Lorg/apache/commons/io/input/Tailer;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;JZ)Lorg/apache/commons/io/input/Tailer;
    .registers 12
    .param p0, "file"    # Ljava/io/File;
    .param p1, "listener"    # Lorg/apache/commons/io/input/TailerListener;
    .param p2, "delay"    # J
    .param p4, "end"    # Z

    .prologue
    .line 181
    new-instance v0, Lorg/apache/commons/io/input/Tailer;

    move-object v1, p0

    move-object v2, p1

    move-wide v3, p2

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/io/input/Tailer;-><init>(Ljava/io/File;Lorg/apache/commons/io/input/TailerListener;JZ)V

    .line 182
    .local v0, "tailer":Lorg/apache/commons/io/input/Tailer;
    new-instance v6, Ljava/lang/Thread;

    invoke-direct {v6, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 183
    .local v6, "thread":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v6, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 184
    invoke-virtual {v6}, Ljava/lang/Thread;->start()V

    .line 185
    return-object v0
.end method

.method private readLines(Ljava/io/RandomAccessFile;)J
    .registers 5
    .param p1, "reader"    # Ljava/io/RandomAccessFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 338
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 339
    .local v0, "line":Ljava/lang/String;
    :goto_4
    if-eqz v0, :cond_10

    .line 340
    iget-object v1, p0, Lorg/apache/commons/io/input/Tailer;->listener:Lorg/apache/commons/io/input/TailerListener;

    invoke-interface {v1, v0}, Lorg/apache/commons/io/input/TailerListener;->handle(Ljava/lang/String;)V

    .line 341
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->readLine()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 343
    :cond_10
    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v1

    return-wide v1
.end method


# virtual methods
.method public getDelay()J
    .registers 3

    .prologue
    .line 227
    iget-wide v0, p0, Lorg/apache/commons/io/input/Tailer;->delay:J

    return-wide v0
.end method

.method public getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lorg/apache/commons/io/input/Tailer;->file:Ljava/io/File;

    return-object v0
.end method

.method public run()V
    .registers 13

    .prologue
    .line 234
    const/4 v7, 0x0

    .line 236
    .local v7, "reader":Ljava/io/RandomAccessFile;
    const-wide/16 v1, 0x0

    .line 237
    .local v1, "last":J
    const-wide/16 v5, 0x0

    .local v5, "position":J
    move-object v8, v7

    .line 239
    .end local v7    # "reader":Ljava/io/RandomAccessFile;
    .local v8, "reader":Ljava/io/RandomAccessFile;
    :goto_6
    :try_start_6
    iget-boolean v10, p0, Lorg/apache/commons/io/input/Tailer;->run:Z
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_8} :catch_9b
    .catchall {:try_start_6 .. :try_end_8} :catchall_a6

    if-eqz v10, :cond_3f

    if-nez v8, :cond_3f

    .line 241
    :try_start_c
    new-instance v7, Ljava/io/RandomAccessFile;

    iget-object v10, p0, Lorg/apache/commons/io/input/Tailer;->file:Ljava/io/File;

    const-string v11, "r"

    invoke-direct {v7, v10, v11}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/io/FileNotFoundException; {:try_start_c .. :try_end_15} :catch_1e
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_15} :catch_9b
    .catchall {:try_start_c .. :try_end_15} :catchall_a6

    .line 246
    .end local v8    # "reader":Ljava/io/RandomAccessFile;
    .restart local v7    # "reader":Ljava/io/RandomAccessFile;
    :goto_15
    if-nez v7, :cond_29

    .line 248
    :try_start_17
    iget-wide v10, p0, Lorg/apache/commons/io/input/Tailer;->delay:J

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1c
    .catch Ljava/lang/InterruptedException; {:try_start_17 .. :try_end_1c} :catch_26
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1c} :catch_ae
    .catchall {:try_start_17 .. :try_end_1c} :catchall_ac

    move-object v8, v7

    .line 250
    .end local v7    # "reader":Ljava/io/RandomAccessFile;
    .restart local v8    # "reader":Ljava/io/RandomAccessFile;
    goto :goto_6

    .line 242
    :catch_1e
    move-exception v0

    .line 243
    .local v0, "e":Ljava/io/FileNotFoundException;
    :try_start_1f
    iget-object v10, p0, Lorg/apache/commons/io/input/Tailer;->listener:Lorg/apache/commons/io/input/TailerListener;

    invoke-interface {v10}, Lorg/apache/commons/io/input/TailerListener;->fileNotFound()V
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_24} :catch_9b
    .catchall {:try_start_1f .. :try_end_24} :catchall_a6

    move-object v7, v8

    .end local v8    # "reader":Ljava/io/RandomAccessFile;
    .restart local v7    # "reader":Ljava/io/RandomAccessFile;
    goto :goto_15

    .line 249
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_26
    move-exception v10

    move-object v8, v7

    .line 250
    .end local v7    # "reader":Ljava/io/RandomAccessFile;
    .restart local v8    # "reader":Ljava/io/RandomAccessFile;
    goto :goto_6

    .line 253
    .end local v8    # "reader":Ljava/io/RandomAccessFile;
    .restart local v7    # "reader":Ljava/io/RandomAccessFile;
    :cond_29
    :try_start_29
    iget-boolean v10, p0, Lorg/apache/commons/io/input/Tailer;->end:Z

    if-eqz v10, :cond_3c

    iget-object v10, p0, Lorg/apache/commons/io/input/Tailer;->file:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v5

    .line 254
    :goto_33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 255
    invoke-virtual {v7, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_3a} :catch_ae
    .catchall {:try_start_29 .. :try_end_3a} :catchall_ac

    move-object v8, v7

    .end local v7    # "reader":Ljava/io/RandomAccessFile;
    .restart local v8    # "reader":Ljava/io/RandomAccessFile;
    goto :goto_6

    .line 253
    .end local v8    # "reader":Ljava/io/RandomAccessFile;
    .restart local v7    # "reader":Ljava/io/RandomAccessFile;
    :cond_3c
    const-wide/16 v5, 0x0

    goto :goto_33

    .line 260
    .end local v7    # "reader":Ljava/io/RandomAccessFile;
    .restart local v8    # "reader":Ljava/io/RandomAccessFile;
    :cond_3f
    :goto_3f
    :try_start_3f
    iget-boolean v10, p0, Lorg/apache/commons/io/input/Tailer;->run:Z

    if-eqz v10, :cond_96

    .line 263
    iget-object v10, p0, Lorg/apache/commons/io/input/Tailer;->file:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->length()J

    move-result-wide v3

    .line 265
    .local v3, "length":J
    cmp-long v10, v3, v5

    if-gez v10, :cond_6c

    .line 268
    iget-object v10, p0, Lorg/apache/commons/io/input/Tailer;->listener:Lorg/apache/commons/io/input/TailerListener;

    invoke-interface {v10}, Lorg/apache/commons/io/input/TailerListener;->fileRotated()V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_52} :catch_9b
    .catchall {:try_start_3f .. :try_end_52} :catchall_a6

    .line 273
    move-object v9, v8

    .line 274
    .local v9, "save":Ljava/io/RandomAccessFile;
    :try_start_53
    new-instance v7, Ljava/io/RandomAccessFile;

    iget-object v10, p0, Lorg/apache/commons/io/input/Tailer;->file:Ljava/io/File;

    const-string v11, "r"

    invoke-direct {v7, v10, v11}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_5c
    .catch Ljava/io/FileNotFoundException; {:try_start_53 .. :try_end_5c} :catch_63
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_5c} :catch_9b
    .catchall {:try_start_53 .. :try_end_5c} :catchall_a6

    .line 275
    .end local v8    # "reader":Ljava/io/RandomAccessFile;
    .restart local v7    # "reader":Ljava/io/RandomAccessFile;
    const-wide/16 v5, 0x0

    .line 277
    :try_start_5e
    invoke-static {v9}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_61
    .catch Ljava/io/FileNotFoundException; {:try_start_5e .. :try_end_61} :catch_b0
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_61} :catch_ae
    .catchall {:try_start_5e .. :try_end_61} :catchall_ac

    move-object v8, v7

    .line 281
    .end local v7    # "reader":Ljava/io/RandomAccessFile;
    .restart local v8    # "reader":Ljava/io/RandomAccessFile;
    goto :goto_3f

    .line 278
    :catch_63
    move-exception v0

    move-object v7, v8

    .line 280
    .end local v8    # "reader":Ljava/io/RandomAccessFile;
    .restart local v0    # "e":Ljava/io/FileNotFoundException;
    .restart local v7    # "reader":Ljava/io/RandomAccessFile;
    :goto_65
    :try_start_65
    iget-object v10, p0, Lorg/apache/commons/io/input/Tailer;->listener:Lorg/apache/commons/io/input/TailerListener;

    invoke-interface {v10}, Lorg/apache/commons/io/input/TailerListener;->fileNotFound()V
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_6a} :catch_ae
    .catchall {:try_start_65 .. :try_end_6a} :catchall_ac

    move-object v8, v7

    .line 282
    .end local v7    # "reader":Ljava/io/RandomAccessFile;
    .restart local v8    # "reader":Ljava/io/RandomAccessFile;
    goto :goto_3f

    .line 288
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    .end local v9    # "save":Ljava/io/RandomAccessFile;
    :cond_6c
    cmp-long v10, v3, v5

    if-lez v10, :cond_80

    .line 291
    :try_start_70
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 292
    invoke-direct {p0, v8}, Lorg/apache/commons/io/input/Tailer;->readLines(Ljava/io/RandomAccessFile;)J
    :try_end_77
    .catch Ljava/lang/Exception; {:try_start_70 .. :try_end_77} :catch_9b
    .catchall {:try_start_70 .. :try_end_77} :catchall_a6

    move-result-wide v5

    .line 309
    :cond_78
    :goto_78
    :try_start_78
    iget-wide v10, p0, Lorg/apache/commons/io/input/Tailer;->delay:J

    invoke-static {v10, v11}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7d
    .catch Ljava/lang/InterruptedException; {:try_start_78 .. :try_end_7d} :catch_7e
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_7d} :catch_9b
    .catchall {:try_start_78 .. :try_end_7d} :catchall_a6

    goto :goto_3f

    .line 310
    :catch_7e
    move-exception v10

    goto :goto_3f

    .line 294
    :cond_80
    :try_start_80
    iget-object v10, p0, Lorg/apache/commons/io/input/Tailer;->file:Ljava/io/File;

    invoke-static {v10, v1, v2}, Lorg/apache/commons/io/FileUtils;->isFileNewer(Ljava/io/File;J)Z

    move-result v10

    if-eqz v10, :cond_78

    .line 300
    const-wide/16 v5, 0x0

    .line 301
    invoke-virtual {v8, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 304
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 305
    invoke-direct {p0, v8}, Lorg/apache/commons/io/input/Tailer;->readLines(Ljava/io/RandomAccessFile;)J
    :try_end_94
    .catch Ljava/lang/Exception; {:try_start_80 .. :try_end_94} :catch_9b
    .catchall {:try_start_80 .. :try_end_94} :catchall_a6

    move-result-wide v5

    goto :goto_78

    .line 319
    .end local v3    # "length":J
    :cond_96
    invoke-static {v8}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    move-object v7, v8

    .line 321
    .end local v8    # "reader":Ljava/io/RandomAccessFile;
    .restart local v7    # "reader":Ljava/io/RandomAccessFile;
    :goto_9a
    return-void

    .line 314
    .end local v7    # "reader":Ljava/io/RandomAccessFile;
    .restart local v8    # "reader":Ljava/io/RandomAccessFile;
    :catch_9b
    move-exception v0

    move-object v7, v8

    .line 316
    .end local v8    # "reader":Ljava/io/RandomAccessFile;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v7    # "reader":Ljava/io/RandomAccessFile;
    :goto_9d
    :try_start_9d
    iget-object v10, p0, Lorg/apache/commons/io/input/Tailer;->listener:Lorg/apache/commons/io/input/TailerListener;

    invoke-interface {v10, v0}, Lorg/apache/commons/io/input/TailerListener;->handle(Ljava/lang/Exception;)V
    :try_end_a2
    .catchall {:try_start_9d .. :try_end_a2} :catchall_ac

    .line 319
    invoke-static {v7}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_9a

    .end local v0    # "e":Ljava/lang/Exception;
    .end local v7    # "reader":Ljava/io/RandomAccessFile;
    .restart local v8    # "reader":Ljava/io/RandomAccessFile;
    :catchall_a6
    move-exception v10

    move-object v7, v8

    .end local v8    # "reader":Ljava/io/RandomAccessFile;
    .restart local v7    # "reader":Ljava/io/RandomAccessFile;
    :goto_a8
    invoke-static {v7}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v10

    :catchall_ac
    move-exception v10

    goto :goto_a8

    .line 314
    :catch_ae
    move-exception v0

    goto :goto_9d

    .line 278
    .restart local v3    # "length":J
    .restart local v9    # "save":Ljava/io/RandomAccessFile;
    :catch_b0
    move-exception v0

    goto :goto_65
.end method

.method public stop()V
    .registers 2

    .prologue
    .line 327
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/io/input/Tailer;->run:Z

    .line 328
    return-void
.end method
