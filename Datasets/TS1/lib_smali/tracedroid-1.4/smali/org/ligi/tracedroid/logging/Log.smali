.class public Lorg/ligi/tracedroid/logging/Log;
.super Ljava/lang/Object;
.source "Log.java"


# static fields
.field public static final DEFAULT_LOG_CACHE_SIZE:I = 0x2a

.field private static TAG:Ljava/lang/String;

.field private static log_cache:[Ljava/lang/String;

.field private static log_cache_pos:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 13
    const-string v0, "TraceDroid"

    sput-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    .line 14
    const/16 v0, 0x2a

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lorg/ligi/tracedroid/logging/Log;->log_cache:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final d(Ljava/lang/String;)V
    .registers 2
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 53
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Lorg/ligi/tracedroid/logging/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public static final d(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 117
    const-string v0, "D"

    invoke-static {v0, p1}, Lorg/ligi/tracedroid/logging/Log;->doCachedLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    return-void
.end method

.method public static final d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 122
    const-string v0, "D"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/ligi/tracedroid/logging/Log;->doCachedLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    invoke-static {p0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 124
    return-void
.end method

.method public static final d(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 57
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lorg/ligi/tracedroid/logging/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    return-void
.end method

.method private static declared-synchronized doCachedLog(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p0, "symbol"    # Ljava/lang/String;
    .param p1, "what"    # Ljava/lang/String;

    .prologue
    .line 69
    const-class v1, Lorg/ligi/tracedroid/logging/Log;

    monitor-enter v1

    :try_start_3
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->log_cache:[Ljava/lang/String;

    sget v2, Lorg/ligi/tracedroid/logging/Log;->log_cache_pos:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    .line 70
    sget v0, Lorg/ligi/tracedroid/logging/Log;->log_cache_pos:I

    add-int/lit8 v0, v0, 0x1

    sget-object v2, Lorg/ligi/tracedroid/logging/Log;->log_cache:[Ljava/lang/String;

    array-length v2, v2

    rem-int/2addr v0, v2

    sput v0, Lorg/ligi/tracedroid/logging/Log;->log_cache_pos:I
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_2c

    .line 71
    monitor-exit v1

    return-void

    .line 69
    :catchall_2c
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static final e(Ljava/lang/String;)V
    .registers 2
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 28
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Lorg/ligi/tracedroid/logging/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public static final e(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 87
    const-string v0, "E"

    invoke-static {v0, p1}, Lorg/ligi/tracedroid/logging/Log;->doCachedLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    return-void
.end method

.method public static final e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 92
    const-string v0, "E"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/ligi/tracedroid/logging/Log;->doCachedLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-static {p0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 94
    return-void
.end method

.method public static final e(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 32
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lorg/ligi/tracedroid/logging/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 33
    return-void
.end method

.method public static declared-synchronized getCachedLog()Ljava/lang/String;
    .registers 6

    .prologue
    .line 74
    const-class v4, Lorg/ligi/tracedroid/logging/Log;

    monitor-enter v4

    :try_start_3
    const-string v2, ""

    .line 76
    .local v2, "res":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    sget-object v3, Lorg/ligi/tracedroid/logging/Log;->log_cache:[Ljava/lang/String;

    array-length v3, v3

    if-ge v0, v3, :cond_4d

    .line 77
    sget-object v3, Lorg/ligi/tracedroid/logging/Log;->log_cache:[Ljava/lang/String;

    array-length v3, v3

    sub-int/2addr v3, v0

    sget v5, Lorg/ligi/tracedroid/logging/Log;->log_cache_pos:I

    add-int/2addr v3, v5

    add-int/lit8 v3, v3, -0x1

    sget-object v5, Lorg/ligi/tracedroid/logging/Log;->log_cache:[Ljava/lang/String;

    array-length v5, v5

    rem-int v1, v3, v5

    .line 78
    .local v1, "pos_in_arr":I
    sget-object v3, Lorg/ligi/tracedroid/logging/Log;->log_cache:[Ljava/lang/String;

    aget-object v3, v3, v1

    if-eqz v3, :cond_4a

    .line 79
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, ""

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, " "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v5, Lorg/ligi/tracedroid/logging/Log;->log_cache:[Ljava/lang/String;

    aget-object v5, v5, v1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v5, "\n"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_49
    .catchall {:try_start_3 .. :try_end_49} :catchall_4f

    move-result-object v2

    .line 76
    :cond_4a
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 81
    .end local v1    # "pos_in_arr":I
    :cond_4d
    monitor-exit v4

    return-object v2

    .line 74
    :catchall_4f
    move-exception v3

    monitor-exit v4

    throw v3
.end method

.method public static getTAG()Ljava/lang/String;
    .registers 1

    .prologue
    .line 19
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static final i(Ljava/lang/String;)V
    .registers 2
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 44
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Lorg/ligi/tracedroid/logging/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public static final i(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 107
    const-string v0, "I"

    invoke-static {v0, p1}, Lorg/ligi/tracedroid/logging/Log;->doCachedLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    return-void
.end method

.method public static final i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 112
    const-string v0, "I"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/ligi/tracedroid/logging/Log;->doCachedLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    invoke-static {p0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 114
    return-void
.end method

.method public static final i(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 48
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lorg/ligi/tracedroid/logging/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 49
    return-void
.end method

.method public static setLogCacheSize(I)V
    .registers 2
    .param p0, "size"    # I

    .prologue
    .line 64
    const/4 v0, 0x0

    sput v0, Lorg/ligi/tracedroid/logging/Log;->log_cache_pos:I

    .line 65
    new-array v0, p0, [Ljava/lang/String;

    sput-object v0, Lorg/ligi/tracedroid/logging/Log;->log_cache:[Ljava/lang/String;

    .line 66
    return-void
.end method

.method public static setTAG(Ljava/lang/String;)V
    .registers 1
    .param p0, "tag"    # Ljava/lang/String;

    .prologue
    .line 23
    sput-object p0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    .line 24
    return-void
.end method

.method public static final w(Ljava/lang/String;)V
    .registers 2
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 36
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    invoke-static {v0, p0}, Lorg/ligi/tracedroid/logging/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    return-void
.end method

.method public static final w(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 97
    const-string v0, "W"

    invoke-static {v0, p1}, Lorg/ligi/tracedroid/logging/Log;->doCachedLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    return-void
.end method

.method public static final w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 102
    const-string v0, "W"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/ligi/tracedroid/logging/Log;->doCachedLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    invoke-static {p0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 104
    return-void
.end method

.method public static final w(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 40
    sget-object v0, Lorg/ligi/tracedroid/logging/Log;->TAG:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lorg/ligi/tracedroid/logging/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 41
    return-void
.end method
