.class public Lcz/msebera/android/httpclient/impl/client/cache/FileResource;
.super Ljava/lang/Object;
.source "FileResource.java"

# interfaces
.implements Lcz/msebera/android/httpclient/client/cache/Resource;


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/ThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x3958ae6717f23345L


# instance fields
.field private volatile disposed:Z

.field private final file:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/client/cache/FileResource;->file:Ljava/io/File;

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/FileResource;->disposed:Z

    .line 55
    return-void
.end method


# virtual methods
.method public declared-synchronized dispose()V
    .registers 2

    .prologue
    .line 70
    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/FileResource;->disposed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_10

    if-eqz v0, :cond_7

    .line 75
    :goto_5
    monitor-exit p0

    return-void

    .line 73
    :cond_7
    const/4 v0, 0x1

    :try_start_8
    iput-boolean v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/FileResource;->disposed:Z

    .line 74
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/FileResource;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_f
    .catchall {:try_start_8 .. :try_end_f} :catchall_10

    goto :goto_5

    .line 70
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getFile()Ljava/io/File;
    .registers 2

    .prologue
    .line 58
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/FileResource;->file:Ljava/io/File;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/client/cache/FileResource;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    return-object v0

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized length()J
    .registers 3

    .prologue
    .line 66
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcz/msebera/android/httpclient/impl/client/cache/FileResource;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_9

    move-result-wide v0

    monitor-exit p0

    return-wide v0

    :catchall_9
    move-exception v0

    monitor-exit p0

    throw v0
.end method
