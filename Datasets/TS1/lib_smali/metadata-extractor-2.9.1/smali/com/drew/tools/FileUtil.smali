.class public Lcom/drew/tools/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-class v0, Lcom/drew/tools/FileUtil;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/drew/tools/FileUtil;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static readBytes(Ljava/io/File;)[B
    .registers 9
    .param p0, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v6

    long-to-int v4, v6

    .line 64
    .local v4, "length":I
    sget-boolean v6, Lcom/drew/tools/FileUtil;->$assertionsDisabled:Z

    if-nez v6, :cond_11

    if-nez v4, :cond_11

    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6}, Ljava/lang/AssertionError;-><init>()V

    throw v6

    .line 65
    :cond_11
    new-array v0, v4, [B

    .line 67
    .local v0, "bytes":[B
    const/4 v5, 0x0

    .line 68
    .local v5, "totalBytesRead":I
    const/4 v2, 0x0

    .line 70
    .local v2, "inputStream":Ljava/io/FileInputStream;
    :try_start_15
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1a
    .catchall {:try_start_15 .. :try_end_1a} :catchall_2d

    .line 71
    .end local v2    # "inputStream":Ljava/io/FileInputStream;
    .local v3, "inputStream":Ljava/io/FileInputStream;
    :goto_1a
    if-eq v5, v4, :cond_25

    .line 72
    sub-int v6, v4, v5

    :try_start_1e
    invoke-virtual {v3, v0, v5, v6}, Ljava/io/FileInputStream;->read([BII)I
    :try_end_21
    .catchall {:try_start_1e .. :try_end_21} :catchall_34

    move-result v1

    .line 73
    .local v1, "bytesRead":I
    const/4 v6, -0x1

    if-ne v1, v6, :cond_2b

    .line 79
    .end local v1    # "bytesRead":I
    :cond_25
    if-eqz v3, :cond_2a

    .line 80
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 84
    :cond_2a
    return-object v0

    .line 76
    .restart local v1    # "bytesRead":I
    :cond_2b
    add-int/2addr v5, v1

    .line 77
    goto :goto_1a

    .line 79
    .end local v1    # "bytesRead":I
    .end local v3    # "inputStream":Ljava/io/FileInputStream;
    .restart local v2    # "inputStream":Ljava/io/FileInputStream;
    :catchall_2d
    move-exception v6

    :goto_2e
    if-eqz v2, :cond_33

    .line 80
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    :cond_33
    throw v6

    .line 79
    .end local v2    # "inputStream":Ljava/io/FileInputStream;
    .restart local v3    # "inputStream":Ljava/io/FileInputStream;
    :catchall_34
    move-exception v6

    move-object v2, v3

    .end local v3    # "inputStream":Ljava/io/FileInputStream;
    .restart local v2    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_2e
.end method

.method public static readBytes(Ljava/lang/String;)[B
    .registers 2
    .param p0, "filePath"    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 95
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/drew/tools/FileUtil;->readBytes(Ljava/io/File;)[B

    move-result-object v0

    return-object v0
.end method

.method public static saveBytes(Ljava/io/File;[B)V
    .registers 5
    .param p0, "file"    # Ljava/io/File;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p1, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    const/4 v0, 0x0

    .line 45
    .local v0, "stream":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_f

    .line 46
    .end local v0    # "stream":Ljava/io/FileOutputStream;
    .local v1, "stream":Ljava/io/FileOutputStream;
    :try_start_6
    invoke-virtual {v1, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_9
    .catchall {:try_start_6 .. :try_end_9} :catchall_16

    .line 48
    if-eqz v1, :cond_e

    .line 49
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 52
    :cond_e
    return-void

    .line 48
    .end local v1    # "stream":Ljava/io/FileOutputStream;
    .restart local v0    # "stream":Ljava/io/FileOutputStream;
    :catchall_f
    move-exception v2

    :goto_10
    if-eqz v0, :cond_15

    .line 49
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    :cond_15
    throw v2

    .line 48
    .end local v0    # "stream":Ljava/io/FileOutputStream;
    .restart local v1    # "stream":Ljava/io/FileOutputStream;
    :catchall_16
    move-exception v2

    move-object v0, v1

    .end local v1    # "stream":Ljava/io/FileOutputStream;
    .restart local v0    # "stream":Ljava/io/FileOutputStream;
    goto :goto_10
.end method
