.class Lkorex/mail/util/SharedFileInputStream$SharedFile;
.super Ljava/lang/Object;
.source "SharedFileInputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/util/SharedFileInputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SharedFile"
.end annotation


# instance fields
.field private cnt:I

.field private in:Ljava/io/RandomAccessFile;


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->in:Ljava/io/RandomAccessFile;

    .line 122
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "file"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->in:Ljava/io/RandomAccessFile;

    .line 118
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->cnt:I

    if-lez v0, :cond_12

    iget v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->cnt:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->cnt:I

    if-gtz v0, :cond_12

    .line 131
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->in:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 132
    :cond_12
    monitor-exit p0

    return-void

    .line 130
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected finalize()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 148
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 149
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->in:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 150
    return-void
.end method

.method public declared-synchronized forceClose()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->cnt:I

    if-lez v0, :cond_f

    .line 137
    const/4 v0, 0x0

    iput v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->cnt:I

    .line 138
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->in:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_17

    .line 145
    :goto_d
    monitor-exit p0

    return-void

    .line 142
    :cond_f
    :try_start_f
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->in:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_14} :catch_15
    .catchall {:try_start_f .. :try_end_14} :catchall_17

    goto :goto_d

    .line 143
    :catch_15
    move-exception v0

    goto :goto_d

    .line 135
    :catchall_17
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized open()Ljava/io/RandomAccessFile;
    .registers 2

    .prologue
    .line 125
    monitor-enter p0

    :try_start_1
    iget v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->cnt:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->cnt:I

    .line 126
    iget-object v0, p0, Lkorex/mail/util/SharedFileInputStream$SharedFile;->in:Ljava/io/RandomAccessFile;
    :try_end_9
    .catchall {:try_start_1 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-object v0

    .line 125
    :catchall_b
    move-exception v0

    monitor-exit p0

    throw v0
.end method
