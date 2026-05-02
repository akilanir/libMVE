.class public Lcom/facebook/stetho/common/ProcessUtil;
.super Ljava/lang/Object;
.source "ProcessUtil.java"


# static fields
.field private static final CMDLINE_BUFFER_SIZE:I = 0x40

.field private static sProcessName:Ljava/lang/String;

.field private static sProcessNameRead:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getProcessName()Ljava/lang/String;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 35
    const-class v1, Lcom/facebook/stetho/common/ProcessUtil;

    monitor-enter v1

    :try_start_3
    sget-boolean v0, Lcom/facebook/stetho/common/ProcessUtil;->sProcessNameRead:Z

    if-nez v0, :cond_10

    .line 36
    const/4 v0, 0x1

    sput-boolean v0, Lcom/facebook/stetho/common/ProcessUtil;->sProcessNameRead:Z
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_14

    .line 38
    :try_start_a
    invoke-static {}, Lcom/facebook/stetho/common/ProcessUtil;->readProcessName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/common/ProcessUtil;->sProcessName:Ljava/lang/String;
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_10} :catch_17
    .catchall {:try_start_a .. :try_end_10} :catchall_14

    .line 42
    :cond_10
    :goto_10
    :try_start_10
    sget-object v0, Lcom/facebook/stetho/common/ProcessUtil;->sProcessName:Ljava/lang/String;
    :try_end_12
    .catchall {:try_start_10 .. :try_end_12} :catchall_14

    monitor-exit v1

    return-object v0

    .line 35
    :catchall_14
    move-exception v0

    monitor-exit v1

    throw v0

    .line 39
    :catch_17
    move-exception v0

    goto :goto_10
.end method

.method private static indexOf([BIIB)I
    .registers 6
    .param p0, "haystack"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "needle"    # B

    .prologue
    .line 62
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_c

    .line 63
    aget-byte v1, p0, v0

    if-ne v1, p3, :cond_9

    .line 67
    .end local v0    # "i":I
    :goto_8
    return v0

    .line 62
    .restart local v0    # "i":I
    :cond_9
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 67
    :cond_c
    const/4 v0, -0x1

    goto :goto_8
.end method

.method private static readProcessName()Ljava/lang/String;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 46
    const/16 v7, 0x40

    new-array v0, v7, [B

    .line 49
    .local v0, "cmdlineBuffer":[B
    new-instance v3, Ljava/io/FileInputStream;

    const-string v7, "/proc/self/cmdline"

    invoke-direct {v3, v7}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 50
    .local v3, "stream":Ljava/io/FileInputStream;
    const/4 v4, 0x0

    .line 52
    .local v4, "success":Z
    :try_start_e
    invoke-virtual {v3, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v2

    .line 53
    .local v2, "n":I
    const/4 v4, 0x1

    .line 54
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {v0, v7, v2, v8}, Lcom/facebook/stetho/common/ProcessUtil;->indexOf([BIIB)I

    move-result v1

    .line 55
    .local v1, "endIndex":I
    new-instance v7, Ljava/lang/String;

    const/4 v8, 0x0

    if-lez v1, :cond_27

    .end local v1    # "endIndex":I
    :goto_1e
    invoke-direct {v7, v0, v8, v1}, Ljava/lang/String;-><init>([BII)V
    :try_end_21
    .catchall {:try_start_e .. :try_end_21} :catchall_2b

    .line 57
    if-nez v4, :cond_29

    :goto_23
    invoke-static {v3, v5}, Lcom/facebook/stetho/common/Util;->close(Ljava/io/Closeable;Z)V

    return-object v7

    .restart local v1    # "endIndex":I
    :cond_27
    move v1, v2

    .line 55
    goto :goto_1e

    .end local v1    # "endIndex":I
    :cond_29
    move v5, v6

    .line 57
    goto :goto_23

    .end local v2    # "n":I
    :catchall_2b
    move-exception v7

    if-nez v4, :cond_32

    :goto_2e
    invoke-static {v3, v5}, Lcom/facebook/stetho/common/Util;->close(Ljava/io/Closeable;Z)V

    throw v7

    :cond_32
    move v5, v6

    goto :goto_2e
.end method
