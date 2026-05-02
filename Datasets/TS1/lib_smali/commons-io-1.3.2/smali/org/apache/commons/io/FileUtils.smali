.class public Lorg/apache/commons/io/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# static fields
.field public static final EMPTY_FILE_ARRAY:[Ljava/io/File;

.field public static final ONE_GB:J = 0x40000000L

.field public static final ONE_KB:J = 0x400L

.field public static final ONE_MB:J = 0x100000L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 106
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/io/File;

    sput-object v0, Lorg/apache/commons/io/FileUtils;->EMPTY_FILE_ARRAY:[Ljava/io/File;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    return-void
.end method

.method public static byteCountToDisplaySize(J)Ljava/lang/String;
    .registers 13
    .param p0, "size"    # J

    .prologue
    const-wide/32 v9, 0x40000000

    const-wide/32 v7, 0x100000

    const-wide/16 v5, 0x400

    const-wide/16 v3, 0x0

    .line 192
    div-long v1, p0, v9

    cmp-long v1, v1, v3

    if-lez v1, :cond_2a

    .line 193
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    div-long v2, p0, v9

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " GB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, "displaySize":Ljava/lang/String;
    :goto_29
    return-object v0

    .line 194
    .end local v0    # "displaySize":Ljava/lang/String;
    :cond_2a
    div-long v1, p0, v7

    cmp-long v1, v1, v3

    if-lez v1, :cond_4a

    .line 195
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    div-long v2, p0, v7

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " MB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "displaySize":Ljava/lang/String;
    goto :goto_29

    .line 196
    .end local v0    # "displaySize":Ljava/lang/String;
    :cond_4a
    div-long v1, p0, v5

    cmp-long v1, v1, v3

    if-lez v1, :cond_6a

    .line 197
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    div-long v2, p0, v5

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " KB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "displaySize":Ljava/lang/String;
    goto :goto_29

    .line 199
    .end local v0    # "displaySize":Ljava/lang/String;
    :cond_6a
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " bytes"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "displaySize":Ljava/lang/String;
    goto :goto_29
.end method

.method public static checksum(Ljava/io/File;Ljava/util/zip/Checksum;)Ljava/util/zip/Checksum;
    .registers 6
    .param p0, "file"    # Ljava/io/File;
    .param p1, "checksum"    # Ljava/util/zip/Checksum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1557
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_e

    .line 1558
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Checksums can\'t be computed on directories"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1560
    :cond_e
    const/4 v0, 0x0

    .line 1562
    .local v0, "in":Ljava/io/InputStream;
    :try_start_f
    new-instance v1, Ljava/util/zip/CheckedInputStream;

    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2, p1}, Ljava/util/zip/CheckedInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Checksum;)V
    :try_end_19
    .catchall {:try_start_f .. :try_end_19} :catchall_25

    .line 1563
    .end local v0    # "in":Ljava/io/InputStream;
    .local v1, "in":Ljava/io/InputStream;
    :try_start_19
    new-instance v2, Lorg/apache/commons/io/output/NullOutputStream;

    invoke-direct {v2}, Lorg/apache/commons/io/output/NullOutputStream;-><init>()V

    invoke-static {v1, v2}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    :try_end_21
    .catchall {:try_start_19 .. :try_end_21} :catchall_2a

    .line 1565
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 1567
    return-object p1

    .line 1565
    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v0    # "in":Ljava/io/InputStream;
    :catchall_25
    move-exception v2

    :goto_26
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v2

    .end local v0    # "in":Ljava/io/InputStream;
    .restart local v1    # "in":Ljava/io/InputStream;
    :catchall_2a
    move-exception v2

    move-object v0, v1

    .end local v1    # "in":Ljava/io/InputStream;
    .restart local v0    # "in":Ljava/io/InputStream;
    goto :goto_26
.end method

.method public static checksumCRC32(Ljava/io/File;)J
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1534
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 1535
    .local v0, "crc":Ljava/util/zip/CRC32;
    invoke-static {p0, v0}, Lorg/apache/commons/io/FileUtils;->checksum(Ljava/io/File;Ljava/util/zip/Checksum;)Ljava/util/zip/Checksum;

    .line 1536
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    return-wide v1
.end method

.method public static cleanDirectory(Ljava/io/File;)V
    .registers 10
    .param p0, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 884
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1f

    .line 885
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " does not exist"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 886
    .local v5, "message":Ljava/lang/String;
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-direct {v6, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 889
    .end local v5    # "message":Ljava/lang/String;
    :cond_1f
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_3e

    .line 890
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " is not a directory"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 891
    .restart local v5    # "message":Ljava/lang/String;
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-direct {v6, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 894
    .end local v5    # "message":Ljava/lang/String;
    :cond_3e
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 895
    .local v2, "files":[Ljava/io/File;
    if-nez v2, :cond_5d

    .line 896
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Failed to list contents of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 899
    :cond_5d
    const/4 v0, 0x0

    .line 900
    .local v0, "exception":Ljava/io/IOException;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5f
    array-length v6, v2

    if-ge v3, v6, :cond_6d

    .line 901
    aget-object v1, v2, v3

    .line 903
    .local v1, "file":Ljava/io/File;
    :try_start_64
    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->forceDelete(Ljava/io/File;)V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_67} :catch_6a

    .line 900
    :goto_67
    add-int/lit8 v3, v3, 0x1

    goto :goto_5f

    .line 904
    :catch_6a
    move-exception v4

    .line 905
    .local v4, "ioe":Ljava/io/IOException;
    move-object v0, v4

    goto :goto_67

    .line 909
    .end local v1    # "file":Ljava/io/File;
    .end local v4    # "ioe":Ljava/io/IOException;
    :cond_6d
    if-eqz v0, :cond_70

    .line 910
    throw v0

    .line 912
    :cond_70
    return-void
.end method

.method private static cleanDirectoryOnExit(Ljava/io/File;)V
    .registers 10
    .param p0, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1292
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1f

    .line 1293
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " does not exist"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1294
    .local v5, "message":Ljava/lang/String;
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-direct {v6, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1297
    .end local v5    # "message":Ljava/lang/String;
    :cond_1f
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_3e

    .line 1298
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " is not a directory"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1299
    .restart local v5    # "message":Ljava/lang/String;
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-direct {v6, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1302
    .end local v5    # "message":Ljava/lang/String;
    :cond_3e
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 1303
    .local v2, "files":[Ljava/io/File;
    if-nez v2, :cond_5d

    .line 1304
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Failed to list contents of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1307
    :cond_5d
    const/4 v0, 0x0

    .line 1308
    .local v0, "exception":Ljava/io/IOException;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5f
    array-length v6, v2

    if-ge v3, v6, :cond_6d

    .line 1309
    aget-object v1, v2, v3

    .line 1311
    .local v1, "file":Ljava/io/File;
    :try_start_64
    invoke-static {v1}, Lorg/apache/commons/io/FileUtils;->forceDeleteOnExit(Ljava/io/File;)V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_67} :catch_6a

    .line 1308
    :goto_67
    add-int/lit8 v3, v3, 0x1

    goto :goto_5f

    .line 1312
    :catch_6a
    move-exception v4

    .line 1313
    .local v4, "ioe":Ljava/io/IOException;
    move-object v0, v4

    goto :goto_67

    .line 1317
    .end local v1    # "file":Ljava/io/File;
    .end local v4    # "ioe":Ljava/io/IOException;
    :cond_6d
    if-eqz v0, :cond_70

    .line 1318
    throw v0

    .line 1320
    :cond_70
    return-void
.end method

.method public static contentEquals(Ljava/io/File;Ljava/io/File;)Z
    .registers 13
    .param p0, "file1"    # Ljava/io/File;
    .param p1, "file2"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 415
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    .line 416
    .local v0, "file1Exists":Z
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v7

    if-eq v0, v7, :cond_d

    .line 449
    :cond_c
    :goto_c
    return v5

    .line 420
    :cond_d
    if-nez v0, :cond_11

    move v5, v6

    .line 422
    goto :goto_c

    .line 425
    :cond_11
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-nez v7, :cond_1d

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_25

    .line 427
    :cond_1d
    new-instance v5, Ljava/io/IOException;

    const-string v6, "Can\'t compare directories, only files"

    invoke-direct {v5, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 430
    :cond_25
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v7

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v9

    cmp-long v7, v7, v9

    if-nez v7, :cond_c

    .line 435
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_41

    move v5, v6

    .line 437
    goto :goto_c

    .line 440
    :cond_41
    const/4 v1, 0x0

    .line 441
    .local v1, "input1":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 443
    .local v3, "input2":Ljava/io/InputStream;
    :try_start_43
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_48
    .catchall {:try_start_43 .. :try_end_48} :catchall_58

    .line 444
    .end local v1    # "input1":Ljava/io/InputStream;
    .local v2, "input1":Ljava/io/InputStream;
    :try_start_48
    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_4d
    .catchall {:try_start_48 .. :try_end_4d} :catchall_60

    .line 445
    .end local v3    # "input2":Ljava/io/InputStream;
    .local v4, "input2":Ljava/io/InputStream;
    :try_start_4d
    invoke-static {v2, v4}, Lorg/apache/commons/io/IOUtils;->contentEquals(Ljava/io/InputStream;Ljava/io/InputStream;)Z
    :try_end_50
    .catchall {:try_start_4d .. :try_end_50} :catchall_63

    move-result v5

    .line 448
    invoke-static {v2}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 449
    invoke-static {v4}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    goto :goto_c

    .line 448
    .end local v2    # "input1":Ljava/io/InputStream;
    .end local v4    # "input2":Ljava/io/InputStream;
    .restart local v1    # "input1":Ljava/io/InputStream;
    .restart local v3    # "input2":Ljava/io/InputStream;
    :catchall_58
    move-exception v5

    :goto_59
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 449
    invoke-static {v3}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v5

    .line 448
    .end local v1    # "input1":Ljava/io/InputStream;
    .restart local v2    # "input1":Ljava/io/InputStream;
    :catchall_60
    move-exception v5

    move-object v1, v2

    .end local v2    # "input1":Ljava/io/InputStream;
    .restart local v1    # "input1":Ljava/io/InputStream;
    goto :goto_59

    .end local v1    # "input1":Ljava/io/InputStream;
    .end local v3    # "input2":Ljava/io/InputStream;
    .restart local v2    # "input1":Ljava/io/InputStream;
    .restart local v4    # "input2":Ljava/io/InputStream;
    :catchall_63
    move-exception v5

    move-object v3, v4

    .end local v4    # "input2":Ljava/io/InputStream;
    .restart local v3    # "input2":Ljava/io/InputStream;
    move-object v1, v2

    .end local v2    # "input1":Ljava/io/InputStream;
    .restart local v1    # "input1":Ljava/io/InputStream;
    goto :goto_59
.end method

.method public static convertFileCollectionToFileArray(Ljava/util/Collection;)[Ljava/io/File;
    .registers 2
    .param p0, "files"    # Ljava/util/Collection;

    .prologue
    .line 238
    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result v0

    new-array v0, v0, [Ljava/io/File;

    invoke-interface {p0, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/io/File;

    check-cast v0, [Ljava/io/File;

    return-object v0
.end method

.method public static copyDirectory(Ljava/io/File;Ljava/io/File;)V
    .registers 3
    .param p0, "srcDir"    # Ljava/io/File;
    .param p1, "destDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 744
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/io/FileUtils;->copyDirectory(Ljava/io/File;Ljava/io/File;Z)V

    .line 745
    return-void
.end method

.method public static copyDirectory(Ljava/io/File;Ljava/io/File;Z)V
    .registers 6
    .param p0, "srcDir"    # Ljava/io/File;
    .param p1, "destDir"    # Ljava/io/File;
    .param p2, "preserveFileDate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 769
    if-nez p0, :cond_a

    .line 770
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Source must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 772
    :cond_a
    if-nez p1, :cond_14

    .line 773
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Destination must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 775
    :cond_14
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_39

    .line 776
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Source \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' does not exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 778
    :cond_39
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_5e

    .line 779
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Source \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' exists but is not a directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 781
    :cond_5e
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_95

    .line 782
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Source \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' and destination \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' are the same"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 784
    :cond_95
    invoke-static {p0, p1, p2}, Lorg/apache/commons/io/FileUtils;->doCopyDirectory(Ljava/io/File;Ljava/io/File;Z)V

    .line 785
    return-void
.end method

.method public static copyDirectoryToDirectory(Ljava/io/File;Ljava/io/File;)V
    .registers 5
    .param p0, "srcDir"    # Ljava/io/File;
    .param p1, "destDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 709
    if-nez p0, :cond_a

    .line 710
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Source must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 712
    :cond_a
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_35

    .line 713
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Source \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' is not a directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 715
    :cond_35
    if-nez p1, :cond_3f

    .line 716
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Destination must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 718
    :cond_3f
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_6a

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_6a

    .line 719
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Destination \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' is not a directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 721
    :cond_6a
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lorg/apache/commons/io/FileUtils;->copyDirectory(Ljava/io/File;Ljava/io/File;Z)V

    .line 722
    return-void
.end method

.method public static copyFile(Ljava/io/File;Ljava/io/File;)V
    .registers 3
    .param p0, "srcFile"    # Ljava/io/File;
    .param p1, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 606
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/io/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Z)V

    .line 607
    return-void
.end method

.method public static copyFile(Ljava/io/File;Ljava/io/File;Z)V
    .registers 6
    .param p0, "srcFile"    # Ljava/io/File;
    .param p1, "destFile"    # Ljava/io/File;
    .param p2, "preserveFileDate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 629
    if-nez p0, :cond_a

    .line 630
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Source must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 632
    :cond_a
    if-nez p1, :cond_14

    .line 633
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Destination must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 635
    :cond_14
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_39

    .line 636
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Source \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' does not exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 638
    :cond_39
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_5e

    .line 639
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Source \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' exists but is a directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 641
    :cond_5e
    invoke-virtual {p0}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_95

    .line 642
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Source \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' and destination \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' are the same"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 644
    :cond_95
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_ce

    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_ce

    .line 645
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_ce

    .line 646
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Destination \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' directory cannot be created"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 649
    :cond_ce
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_f9

    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result v0

    if-nez v0, :cond_f9

    .line 650
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Destination \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' exists but is read-only"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 652
    :cond_f9
    invoke-static {p0, p1, p2}, Lorg/apache/commons/io/FileUtils;->doCopyFile(Ljava/io/File;Ljava/io/File;Z)V

    .line 653
    return-void
.end method

.method public static copyFileToDirectory(Ljava/io/File;Ljava/io/File;)V
    .registers 3
    .param p0, "srcFile"    # Ljava/io/File;
    .param p1, "destDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 557
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lorg/apache/commons/io/FileUtils;->copyFileToDirectory(Ljava/io/File;Ljava/io/File;Z)V

    .line 558
    return-void
.end method

.method public static copyFileToDirectory(Ljava/io/File;Ljava/io/File;Z)V
    .registers 6
    .param p0, "srcFile"    # Ljava/io/File;
    .param p1, "destDir"    # Ljava/io/File;
    .param p2, "preserveFileDate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 580
    if-nez p1, :cond_a

    .line 581
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Destination must not be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 583
    :cond_a
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_35

    .line 584
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Destination \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' is not a directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 586
    :cond_35
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {p0, v0, p2}, Lorg/apache/commons/io/FileUtils;->copyFile(Ljava/io/File;Ljava/io/File;Z)V

    .line 587
    return-void
.end method

.method public static copyURLToFile(Ljava/net/URL;Ljava/io/File;)V
    .registers 5
    .param p0, "source"    # Ljava/net/URL;
    .param p1, "destination"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 844
    invoke-virtual {p0}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v0

    .line 846
    .local v0, "input":Ljava/io/InputStream;
    :try_start_4
    invoke-static {p1}, Lorg/apache/commons/io/FileUtils;->openOutputStream(Ljava/io/File;)Ljava/io/FileOutputStream;
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_17

    move-result-object v1

    .line 848
    .local v1, "output":Ljava/io/FileOutputStream;
    :try_start_8
    invoke-static {v0, v1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    :try_end_b
    .catchall {:try_start_8 .. :try_end_b} :catchall_12

    .line 850
    :try_start_b
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_17

    .line 853
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 855
    return-void

    .line 850
    :catchall_12
    move-exception v2

    :try_start_13
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    throw v2
    :try_end_17
    .catchall {:try_start_13 .. :try_end_17} :catchall_17

    .line 853
    .end local v1    # "output":Ljava/io/FileOutputStream;
    :catchall_17
    move-exception v2

    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v2
.end method

.method public static deleteDirectory(Ljava/io/File;)V
    .registers 4
    .param p0, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 865
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_7

    .line 875
    :cond_6
    return-void

    .line 869
    :cond_7
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->cleanDirectory(Ljava/io/File;)V

    .line 870
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_6

    .line 871
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to delete directory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 873
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static deleteDirectoryOnExit(Ljava/io/File;)V
    .registers 2
    .param p0, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1276
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_7

    .line 1282
    :goto_6
    return-void

    .line 1280
    :cond_7
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->cleanDirectoryOnExit(Ljava/io/File;)V

    .line 1281
    invoke-virtual {p0}, Ljava/io/File;->deleteOnExit()V

    goto :goto_6
.end method

.method private static doCopyDirectory(Ljava/io/File;Ljava/io/File;Z)V
    .registers 9
    .param p0, "srcDir"    # Ljava/io/File;
    .param p1, "destDir"    # Ljava/io/File;
    .param p2, "preserveFileDate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 797
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 798
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_59

    .line 799
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Destination \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' exists but is not a directory"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 802
    :cond_2b
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-nez v3, :cond_50

    .line 803
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Destination \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' directory cannot be created"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 805
    :cond_50
    if-eqz p2, :cond_59

    .line 806
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Ljava/io/File;->setLastModified(J)Z

    .line 809
    :cond_59
    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result v3

    if-nez v3, :cond_7e

    .line 810
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Destination \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' cannot be written to"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 813
    :cond_7e
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 814
    .local v1, "files":[Ljava/io/File;
    if-nez v1, :cond_9d

    .line 815
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Failed to list contents of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 817
    :cond_9d
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9e
    array-length v3, v1

    if-ge v2, v3, :cond_c2

    .line 818
    new-instance v0, Ljava/io/File;

    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 819
    .local v0, "copiedFile":Ljava/io/File;
    aget-object v3, v1, v2

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_bc

    .line 820
    aget-object v3, v1, v2

    invoke-static {v3, v0, p2}, Lorg/apache/commons/io/FileUtils;->doCopyDirectory(Ljava/io/File;Ljava/io/File;Z)V

    .line 817
    :goto_b9
    add-int/lit8 v2, v2, 0x1

    goto :goto_9e

    .line 822
    :cond_bc
    aget-object v3, v1, v2

    invoke-static {v3, v0, p2}, Lorg/apache/commons/io/FileUtils;->doCopyFile(Ljava/io/File;Ljava/io/File;Z)V

    goto :goto_b9

    .line 825
    .end local v0    # "copiedFile":Ljava/io/File;
    :cond_c2
    return-void
.end method

.method private static doCopyFile(Ljava/io/File;Ljava/io/File;Z)V
    .registers 9
    .param p0, "srcFile"    # Ljava/io/File;
    .param p1, "destFile"    # Ljava/io/File;
    .param p2, "preserveFileDate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 664
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2b

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 665
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Destination \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' exists but is a directory"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 668
    :cond_2b
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 670
    .local v0, "input":Ljava/io/FileInputStream;
    :try_start_30
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_35
    .catchall {:try_start_30 .. :try_end_35} :catchall_78

    .line 672
    .local v1, "output":Ljava/io/FileOutputStream;
    :try_start_35
    invoke-static {v0, v1}, Lorg/apache/commons/io/IOUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)I
    :try_end_38
    .catchall {:try_start_35 .. :try_end_38} :catchall_73

    .line 674
    :try_start_38
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V
    :try_end_3b
    .catchall {:try_start_38 .. :try_end_3b} :catchall_78

    .line 677
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 680
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v4

    cmp-long v2, v2, v4

    if-eqz v2, :cond_7d

    .line 681
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Failed to copy full contents from \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\' to \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 674
    :catchall_73
    move-exception v2

    :try_start_74
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    throw v2
    :try_end_78
    .catchall {:try_start_74 .. :try_end_78} :catchall_78

    .line 677
    .end local v1    # "output":Ljava/io/FileOutputStream;
    :catchall_78
    move-exception v2

    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v2

    .line 684
    .restart local v1    # "output":Ljava/io/FileOutputStream;
    :cond_7d
    if-eqz p2, :cond_86

    .line 685
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Ljava/io/File;->setLastModified(J)Z

    .line 687
    :cond_86
    return-void
.end method

.method public static forceDelete(Ljava/io/File;)V
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1238
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_a

    .line 1239
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->deleteDirectory(Ljava/io/File;)V

    .line 1250
    :cond_9
    return-void

    .line 1241
    :cond_a
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_29

    .line 1242
    new-instance v1, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "File does not exist: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1244
    :cond_29
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_9

    .line 1245
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to delete file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1247
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static forceDeleteOnExit(Ljava/io/File;)V
    .registers 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1261
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1262
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->deleteDirectoryOnExit(Ljava/io/File;)V

    .line 1266
    :goto_9
    return-void

    .line 1264
    :cond_a
    invoke-virtual {p0}, Ljava/io/File;->deleteOnExit()V

    goto :goto_9
.end method

.method public static forceMkdir(Ljava/io/File;)V
    .registers 4
    .param p0, "directory"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1332
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_31

    .line 1333
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_50

    .line 1334
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "File "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " exists and is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "not a directory. Unable to create directory."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1339
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1342
    .end local v0    # "message":Ljava/lang/String;
    :cond_31
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_50

    .line 1343
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unable to create directory "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1345
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1348
    .end local v0    # "message":Ljava/lang/String;
    :cond_50
    return-void
.end method

.method private static innerListFiles(Ljava/util/Collection;Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;)V
    .registers 6
    .param p0, "files"    # Ljava/util/Collection;
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "filter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 252
    invoke-virtual {p1, p2}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v0

    .line 253
    .local v0, "found":[Ljava/io/File;
    if-eqz v0, :cond_20

    .line 254
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    array-length v2, v0

    if-ge v1, v2, :cond_20

    .line 255
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 256
    aget-object v2, v0, v1

    invoke-static {p0, v2, p2}, Lorg/apache/commons/io/FileUtils;->innerListFiles(Ljava/util/Collection;Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    .line 254
    :goto_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 258
    :cond_1a
    aget-object v2, v0, v1

    invoke-interface {p0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_17

    .line 262
    .end local v1    # "i":I
    :cond_20
    return-void
.end method

.method public static isFileNewer(Ljava/io/File;J)Z
    .registers 6
    .param p0, "file"    # Ljava/io/File;
    .param p1, "timeMillis"    # J

    .prologue
    const/4 v0, 0x0

    .line 1445
    if-nez p0, :cond_b

    .line 1446
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No specified file"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1448
    :cond_b
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_12

    .line 1451
    :cond_11
    :goto_11
    return v0

    :cond_12
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    cmp-long v1, v1, p1

    if-lez v1, :cond_11

    const/4 v0, 0x1

    goto :goto_11
.end method

.method public static isFileNewer(Ljava/io/File;Ljava/io/File;)Z
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "reference"    # Ljava/io/File;

    .prologue
    .line 1403
    if-nez p1, :cond_a

    .line 1404
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No specified reference file"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1406
    :cond_a
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_2f

    .line 1407
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "The reference file \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' doesn\'t exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1410
    :cond_2f
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/io/FileUtils;->isFileNewer(Ljava/io/File;J)Z

    move-result v0

    return v0
.end method

.method public static isFileNewer(Ljava/io/File;Ljava/util/Date;)Z
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 1426
    if-nez p1, :cond_a

    .line 1427
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No specified date"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1429
    :cond_a
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/io/FileUtils;->isFileNewer(Ljava/io/File;J)Z

    move-result v0

    return v0
.end method

.method public static isFileOlder(Ljava/io/File;J)Z
    .registers 6
    .param p0, "file"    # Ljava/io/File;
    .param p1, "timeMillis"    # J

    .prologue
    const/4 v0, 0x0

    .line 1512
    if-nez p0, :cond_b

    .line 1513
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No specified file"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1515
    :cond_b
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_12

    .line 1518
    :cond_11
    :goto_11
    return v0

    :cond_12
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    cmp-long v1, v1, p1

    if-gez v1, :cond_11

    const/4 v0, 0x1

    goto :goto_11
.end method

.method public static isFileOlder(Ljava/io/File;Ljava/io/File;)Z
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "reference"    # Ljava/io/File;

    .prologue
    .line 1470
    if-nez p1, :cond_a

    .line 1471
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No specified reference file"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1473
    :cond_a
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_2f

    .line 1474
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "The reference file \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' doesn\'t exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1477
    :cond_2f
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/io/FileUtils;->isFileOlder(Ljava/io/File;J)Z

    move-result v0

    return v0
.end method

.method public static isFileOlder(Ljava/io/File;Ljava/util/Date;)Z
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 1493
    if-nez p1, :cond_a

    .line 1494
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No specified date"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1496
    :cond_a
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lorg/apache/commons/io/FileUtils;->isFileOlder(Ljava/io/File;J)Z

    move-result v0

    return v0
.end method

.method public static iterateFiles(Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/Iterator;
    .registers 4
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "fileFilter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .param p2, "dirFilter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 338
    invoke-static {p0, p1, p2}, Lorg/apache/commons/io/FileUtils;->listFiles(Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public static iterateFiles(Ljava/io/File;[Ljava/lang/String;Z)Ljava/util/Iterator;
    .registers 4
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "extensions"    # [Ljava/lang/String;
    .param p2, "recursive"    # Z

    .prologue
    .line 395
    invoke-static {p0, p1, p2}, Lorg/apache/commons/io/FileUtils;->listFiles(Ljava/io/File;[Ljava/lang/String;Z)Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public static lineIterator(Ljava/io/File;)Lorg/apache/commons/io/LineIterator;
    .registers 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1090
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/io/FileUtils;->lineIterator(Ljava/io/File;Ljava/lang/String;)Lorg/apache/commons/io/LineIterator;

    move-result-object v0

    return-object v0
.end method

.method public static lineIterator(Ljava/io/File;Ljava/lang/String;)Lorg/apache/commons/io/LineIterator;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1067
    const/4 v1, 0x0

    .line 1069
    .local v1, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->openInputStream(Ljava/io/File;)Ljava/io/FileInputStream;

    move-result-object v1

    .line 1070
    invoke-static {v1, p1}, Lorg/apache/commons/io/IOUtils;->lineIterator(Ljava/io/InputStream;Ljava/lang/String;)Lorg/apache/commons/io/LineIterator;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_8} :catch_a
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_8} :catch_f

    move-result-object v2

    return-object v2

    .line 1071
    :catch_a
    move-exception v0

    .line 1072
    .local v0, "ex":Ljava/io/IOException;
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 1073
    throw v0

    .line 1074
    .end local v0    # "ex":Ljava/io/IOException;
    :catch_f
    move-exception v0

    .line 1075
    .local v0, "ex":Ljava/lang/RuntimeException;
    invoke-static {v1}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    .line 1076
    throw v0
.end method

.method public static listFiles(Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/Collection;
    .registers 8
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "fileFilter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;
    .param p2, "dirFilter"    # Lorg/apache/commons/io/filefilter/IOFileFilter;

    .prologue
    .line 291
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_e

    .line 292
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Parameter \'directory\' is not a directory"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 295
    :cond_e
    if-nez p1, :cond_18

    .line 296
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "Parameter \'fileFilter\' is null"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 300
    :cond_18
    sget-object v3, Lorg/apache/commons/io/filefilter/DirectoryFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    invoke-static {v3}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->notFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v3

    invoke-static {p1, v3}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->andFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v1

    .line 305
    .local v1, "effFileFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    if-nez p2, :cond_33

    .line 306
    sget-object v0, Lorg/apache/commons/io/filefilter/FalseFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 313
    .local v0, "effDirFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    :goto_26
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 314
    .local v2, "files":Ljava/util/Collection;
    invoke-static {v1, v0}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->orFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v3

    invoke-static {v2, p0, v3}, Lorg/apache/commons/io/FileUtils;->innerListFiles(Ljava/util/Collection;Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;)V

    .line 316
    return-object v2

    .line 308
    .end local v0    # "effDirFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    .end local v2    # "files":Ljava/util/Collection;
    :cond_33
    sget-object v3, Lorg/apache/commons/io/filefilter/DirectoryFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    invoke-static {p2, v3}, Lorg/apache/commons/io/filefilter/FileFilterUtils;->andFileFilter(Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Lorg/apache/commons/io/filefilter/IOFileFilter;

    move-result-object v0

    .restart local v0    # "effDirFilter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    goto :goto_26
.end method

.method public static listFiles(Ljava/io/File;[Ljava/lang/String;Z)Ljava/util/Collection;
    .registers 6
    .param p0, "directory"    # Ljava/io/File;
    .param p1, "extensions"    # [Ljava/lang/String;
    .param p2, "recursive"    # Z

    .prologue
    .line 371
    if-nez p1, :cond_d

    .line 372
    sget-object v0, Lorg/apache/commons/io/filefilter/TrueFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    .line 377
    .local v0, "filter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    :goto_4
    if-eqz p2, :cond_17

    sget-object v2, Lorg/apache/commons/io/filefilter/TrueFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    :goto_8
    invoke-static {p0, v0, v2}, Lorg/apache/commons/io/FileUtils;->listFiles(Ljava/io/File;Lorg/apache/commons/io/filefilter/IOFileFilter;Lorg/apache/commons/io/filefilter/IOFileFilter;)Ljava/util/Collection;

    move-result-object v2

    return-object v2

    .line 374
    .end local v0    # "filter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    :cond_d
    invoke-static {p1}, Lorg/apache/commons/io/FileUtils;->toSuffixes([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 375
    .local v1, "suffixes":[Ljava/lang/String;
    new-instance v0, Lorg/apache/commons/io/filefilter/SuffixFileFilter;

    invoke-direct {v0, v1}, Lorg/apache/commons/io/filefilter/SuffixFileFilter;-><init>([Ljava/lang/String;)V

    .restart local v0    # "filter":Lorg/apache/commons/io/filefilter/IOFileFilter;
    goto :goto_4

    .line 377
    .end local v1    # "suffixes":[Ljava/lang/String;
    :cond_17
    sget-object v2, Lorg/apache/commons/io/filefilter/FalseFileFilter;->INSTANCE:Lorg/apache/commons/io/filefilter/IOFileFilter;

    goto :goto_8
.end method

.method public static openInputStream(Ljava/io/File;)Ljava/io/FileInputStream;
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_50

    .line 129
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 130
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "File \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' exists but is a directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_2b
    invoke-virtual {p0}, Ljava/io/File;->canRead()Z

    move-result v0

    if-nez v0, :cond_6f

    .line 133
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "File \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' cannot be read"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 136
    :cond_50
    new-instance v0, Ljava/io/FileNotFoundException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "File \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\' does not exist"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_6f
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public static openOutputStream(Ljava/io/File;)Ljava/io/FileOutputStream;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 163
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_50

    .line 164
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 165
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "File \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' exists but is a directory"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 167
    :cond_2b
    invoke-virtual {p0}, Ljava/io/File;->canWrite()Z

    move-result v1

    if-nez v1, :cond_81

    .line 168
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "File \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' cannot be written to"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 171
    :cond_50
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 172
    .local v0, "parent":Ljava/io/File;
    if-eqz v0, :cond_81

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_81

    .line 173
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_81

    .line 174
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "File \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' could not be created"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 178
    .end local v0    # "parent":Ljava/io/File;
    :cond_81
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    return-object v1
.end method

.method public static readFileToByteArray(Ljava/io/File;)[B
    .registers 3
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 992
    const/4 v0, 0x0

    .line 994
    .local v0, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->openInputStream(Ljava/io/File;)Ljava/io/FileInputStream;

    move-result-object v0

    .line 995
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->toByteArray(Ljava/io/InputStream;)[B
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_d

    move-result-object v1

    .line 997
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    return-object v1

    :catchall_d
    move-exception v1

    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v1
.end method

.method public static readFileToString(Ljava/io/File;)Ljava/lang/String;
    .registers 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 979
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/io/FileUtils;->readFileToString(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static readFileToString(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 959
    const/4 v0, 0x0

    .line 961
    .local v0, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->openInputStream(Ljava/io/File;)Ljava/io/FileInputStream;

    move-result-object v0

    .line 962
    invoke-static {v0, p1}, Lorg/apache/commons/io/IOUtils;->toString(Ljava/io/InputStream;Ljava/lang/String;)Ljava/lang/String;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_d

    move-result-object v1

    .line 964
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    return-object v1

    :catchall_d
    move-exception v1

    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v1
.end method

.method public static readLines(Ljava/io/File;)Ljava/util/List;
    .registers 2
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1032
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/apache/commons/io/FileUtils;->readLines(Ljava/io/File;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static readLines(Ljava/io/File;Ljava/lang/String;)Ljava/util/List;
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1013
    const/4 v0, 0x0

    .line 1015
    .local v0, "in":Ljava/io/InputStream;
    :try_start_1
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->openInputStream(Ljava/io/File;)Ljava/io/FileInputStream;

    move-result-object v0

    .line 1016
    invoke-static {v0, p1}, Lorg/apache/commons/io/IOUtils;->readLines(Ljava/io/InputStream;Ljava/lang/String;)Ljava/util/List;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_d

    move-result-object v1

    .line 1018
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    return-object v1

    :catchall_d
    move-exception v1

    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/InputStream;)V

    throw v1
.end method

.method public static sizeOfDirectory(Ljava/io/File;)J
    .registers 9
    .param p0, "directory"    # Ljava/io/File;

    .prologue
    .line 1359
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1f

    .line 1360
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " does not exist"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1361
    .local v3, "message":Ljava/lang/String;
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-direct {v6, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1364
    .end local v3    # "message":Ljava/lang/String;
    :cond_1f
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-nez v6, :cond_3e

    .line 1365
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " is not a directory"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1366
    .restart local v3    # "message":Ljava/lang/String;
    new-instance v6, Ljava/lang/IllegalArgumentException;

    invoke-direct {v6, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 1369
    .end local v3    # "message":Ljava/lang/String;
    :cond_3e
    const-wide/16 v4, 0x0

    .line 1371
    .local v4, "size":J
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 1372
    .local v1, "files":[Ljava/io/File;
    if-nez v1, :cond_49

    .line 1373
    const-wide/16 v6, 0x0

    .line 1385
    :goto_48
    return-wide v6

    .line 1375
    :cond_49
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_4a
    array-length v6, v1

    if-ge v2, v6, :cond_63

    .line 1376
    aget-object v0, v1, v2

    .line 1378
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_5d

    .line 1379
    invoke-static {v0}, Lorg/apache/commons/io/FileUtils;->sizeOfDirectory(Ljava/io/File;)J

    move-result-wide v6

    add-long/2addr v4, v6

    .line 1375
    :goto_5a
    add-int/lit8 v2, v2, 0x1

    goto :goto_4a

    .line 1381
    :cond_5d
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v6

    add-long/2addr v4, v6

    goto :goto_5a

    .end local v0    # "file":Ljava/io/File;
    :cond_63
    move-wide v6, v4

    .line 1385
    goto :goto_48
.end method

.method public static toFile(Ljava/net/URL;)Ljava/io/File;
    .registers 8
    .param p0, "url"    # Ljava/net/URL;

    .prologue
    .line 467
    if-eqz p0, :cond_e

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    .line 468
    :cond_e
    const/4 v4, 0x0

    .line 479
    :goto_f
    return-object v4

    .line 470
    :cond_10
    invoke-virtual {p0}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x2f

    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 471
    .local v1, "filename":Ljava/lang/String;
    const/4 v3, 0x0

    .line 472
    .local v3, "pos":I
    :cond_1d
    :goto_1d
    const/16 v4, 0x25

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    if-ltz v3, :cond_5d

    .line 473
    add-int/lit8 v4, v3, 0x2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v4, v5, :cond_1d

    .line 474
    add-int/lit8 v4, v3, 0x1

    add-int/lit8 v5, v3, 0x3

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 475
    .local v2, "hexStr":Ljava/lang/String;
    const/16 v4, 0x10

    invoke-static {v2, v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    int-to-char v0, v4

    .line 476
    .local v0, "ch":C
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {v1, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v4

    add-int/lit8 v5, v3, 0x3

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 477
    goto :goto_1d

    .line 479
    .end local v0    # "ch":C
    .end local v2    # "hexStr":Ljava/lang/String;
    :cond_5d
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_f
.end method

.method public static toFiles([Ljava/net/URL;)[Ljava/io/File;
    .registers 7
    .param p0, "urls"    # [Ljava/net/URL;

    .prologue
    .line 503
    if-eqz p0, :cond_5

    array-length v3, p0

    if-nez v3, :cond_8

    .line 504
    :cond_5
    sget-object v0, Lorg/apache/commons/io/FileUtils;->EMPTY_FILE_ARRAY:[Ljava/io/File;

    .line 517
    :cond_7
    return-object v0

    .line 506
    :cond_8
    array-length v3, p0

    new-array v0, v3, [Ljava/io/File;

    .line 507
    .local v0, "files":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    array-length v3, p0

    if-ge v1, v3, :cond_7

    .line 508
    aget-object v2, p0, v1

    .line 509
    .local v2, "url":Ljava/net/URL;
    if-eqz v2, :cond_3e

    .line 510
    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    const-string v4, "file"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_38

    .line 511
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "URL could not be converted to a File: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 514
    :cond_38
    invoke-static {v2}, Lorg/apache/commons/io/FileUtils;->toFile(Ljava/net/URL;)Ljava/io/File;

    move-result-object v3

    aput-object v3, v0, v1

    .line 507
    :cond_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_c
.end method

.method private static toSuffixes([Ljava/lang/String;)[Ljava/lang/String;
    .registers 5
    .param p0, "extensions"    # [Ljava/lang/String;

    .prologue
    .line 350
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/String;

    .line 351
    .local v1, "suffixes":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p0

    if-ge v0, v2, :cond_21

    .line 352
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 351
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 354
    :cond_21
    return-object v1
.end method

.method public static toURLs([Ljava/io/File;)[Ljava/net/URL;
    .registers 4
    .param p0, "files"    # [Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 530
    array-length v2, p0

    new-array v1, v2, [Ljava/net/URL;

    .line 532
    .local v1, "urls":[Ljava/net/URL;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, v1

    if-ge v0, v2, :cond_12

    .line 533
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/io/File;->toURL()Ljava/net/URL;

    move-result-object v2

    aput-object v2, v1, v0

    .line 532
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 536
    :cond_12
    return-object v1
.end method

.method public static touch(Ljava/io/File;)V
    .registers 6
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_d

    .line 219
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->openOutputStream(Ljava/io/File;)Ljava/io/FileOutputStream;

    move-result-object v0

    .line 220
    .local v0, "out":Ljava/io/OutputStream;
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 222
    .end local v0    # "out":Ljava/io/OutputStream;
    :cond_d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Ljava/io/File;->setLastModified(J)Z

    move-result v1

    .line 223
    .local v1, "success":Z
    if-nez v1, :cond_30

    .line 224
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Unable to set the last modification time for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 226
    :cond_30
    return-void
.end method

.method public static waitFor(Ljava/io/File;I)Z
    .registers 9
    .param p0, "file"    # Ljava/io/File;
    .param p1, "seconds"    # I

    .prologue
    .line 927
    const/4 v3, 0x0

    .line 928
    .local v3, "timeout":I
    const/4 v1, 0x0

    .line 929
    .local v1, "tick":I
    :goto_2
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_20

    .line 930
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "tick":I
    .local v2, "tick":I
    const/16 v5, 0xa

    if-lt v1, v5, :cond_22

    .line 931
    const/4 v1, 0x0

    .line 932
    .end local v2    # "tick":I
    .restart local v1    # "tick":I
    add-int/lit8 v4, v3, 0x1

    .end local v3    # "timeout":I
    .local v4, "timeout":I
    if-le v3, p1, :cond_16

    .line 933
    const/4 v5, 0x0

    move v3, v4

    .line 944
    .end local v4    # "timeout":I
    .restart local v3    # "timeout":I
    :goto_15
    return v5

    .end local v3    # "timeout":I
    .restart local v4    # "timeout":I
    :cond_16
    move v3, v4

    .line 937
    .end local v4    # "timeout":I
    .restart local v3    # "timeout":I
    :goto_17
    const-wide/16 v5, 0x64

    :try_start_19
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1c
    .catch Ljava/lang/InterruptedException; {:try_start_19 .. :try_end_1c} :catch_1d
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1c} :catch_1f

    goto :goto_2

    .line 938
    :catch_1d
    move-exception v5

    goto :goto_2

    .line 940
    :catch_1f
    move-exception v0

    .line 944
    :cond_20
    const/4 v5, 0x1

    goto :goto_15

    .end local v1    # "tick":I
    .restart local v2    # "tick":I
    :cond_22
    move v1, v2

    .end local v2    # "tick":I
    .restart local v1    # "tick":I
    goto :goto_17
.end method

.method public static writeByteArrayToFile(Ljava/io/File;[B)V
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1139
    const/4 v0, 0x0

    .line 1141
    .local v0, "out":Ljava/io/OutputStream;
    :try_start_1
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->openOutputStream(Ljava/io/File;)Ljava/io/FileOutputStream;

    move-result-object v0

    .line 1142
    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_c

    .line 1144
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 1146
    return-void

    .line 1144
    :catchall_c
    move-exception v1

    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    throw v1
.end method

.method public static writeLines(Ljava/io/File;Ljava/lang/String;Ljava/util/Collection;)V
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "lines"    # Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1164
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lorg/apache/commons/io/FileUtils;->writeLines(Ljava/io/File;Ljava/lang/String;Ljava/util/Collection;Ljava/lang/String;)V

    .line 1165
    return-void
.end method

.method public static writeLines(Ljava/io/File;Ljava/lang/String;Ljava/util/Collection;Ljava/lang/String;)V
    .registers 6
    .param p0, "file"    # Ljava/io/File;
    .param p1, "encoding"    # Ljava/lang/String;
    .param p2, "lines"    # Ljava/util/Collection;
    .param p3, "lineEnding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1198
    const/4 v0, 0x0

    .line 1200
    .local v0, "out":Ljava/io/OutputStream;
    :try_start_1
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->openOutputStream(Ljava/io/File;)Ljava/io/FileOutputStream;

    move-result-object v0

    .line 1201
    invoke-static {p2, p3, v0, p1}, Lorg/apache/commons/io/IOUtils;->writeLines(Ljava/util/Collection;Ljava/lang/String;Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_c

    .line 1203
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 1205
    return-void

    .line 1203
    :catchall_c
    move-exception v1

    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    throw v1
.end method

.method public static writeLines(Ljava/io/File;Ljava/util/Collection;)V
    .registers 3
    .param p0, "file"    # Ljava/io/File;
    .param p1, "lines"    # Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1178
    invoke-static {p0, v0, p1, v0}, Lorg/apache/commons/io/FileUtils;->writeLines(Ljava/io/File;Ljava/lang/String;Ljava/util/Collection;Ljava/lang/String;)V

    .line 1179
    return-void
.end method

.method public static writeLines(Ljava/io/File;Ljava/util/Collection;Ljava/lang/String;)V
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "lines"    # Ljava/util/Collection;
    .param p2, "lineEnding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1219
    const/4 v0, 0x0

    invoke-static {p0, v0, p1, p2}, Lorg/apache/commons/io/FileUtils;->writeLines(Ljava/io/File;Ljava/lang/String;Ljava/util/Collection;Ljava/lang/String;)V

    .line 1220
    return-void
.end method

.method public static writeStringToFile(Ljava/io/File;Ljava/lang/String;)V
    .registers 3
    .param p0, "file"    # Ljava/io/File;
    .param p1, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1124
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/io/FileUtils;->writeStringToFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 1125
    return-void
.end method

.method public static writeStringToFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1107
    const/4 v0, 0x0

    .line 1109
    .local v0, "out":Ljava/io/OutputStream;
    :try_start_1
    invoke-static {p0}, Lorg/apache/commons/io/FileUtils;->openOutputStream(Ljava/io/File;)Ljava/io/FileOutputStream;

    move-result-object v0

    .line 1110
    invoke-static {p1, v0, p2}, Lorg/apache/commons/io/IOUtils;->write(Ljava/lang/String;Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_c

    .line 1112
    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    .line 1114
    return-void

    .line 1112
    :catchall_c
    move-exception v1

    invoke-static {v0}, Lorg/apache/commons/io/IOUtils;->closeQuietly(Ljava/io/OutputStream;)V

    throw v1
.end method
