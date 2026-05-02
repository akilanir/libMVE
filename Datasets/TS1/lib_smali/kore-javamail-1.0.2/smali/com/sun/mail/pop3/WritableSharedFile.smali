.class Lcom/sun/mail/pop3/WritableSharedFile;
.super Lkorex/mail/util/SharedFileInputStream;
.source "TempFile.java"


# instance fields
.field private af:Lcom/sun/mail/pop3/AppendStream;

.field private raf:Ljava/io/RandomAccessFile;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 5
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 104
    invoke-direct {p0, p1}, Lkorex/mail/util/SharedFileInputStream;-><init>(Ljava/io/File;)V

    .line 106
    :try_start_3
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "rw"

    invoke-direct {v1, p1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/sun/mail/pop3/WritableSharedFile;->raf:Ljava/io/RandomAccessFile;
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_c} :catch_d

    .line 112
    :goto_c
    return-void

    .line 107
    :catch_d
    move-exception v0

    .line 110
    .local v0, "ex":Ljava/io/IOException;
    invoke-super {p0}, Lkorex/mail/util/SharedFileInputStream;->close()V

    goto :goto_c
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    :try_start_0
    invoke-super {p0}, Lkorex/mail/util/SharedFileInputStream;->close()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_9

    .line 128
    iget-object v0, p0, Lcom/sun/mail/pop3/WritableSharedFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 130
    return-void

    .line 128
    :catchall_9
    move-exception v0

    iget-object v1, p0, Lcom/sun/mail/pop3/WritableSharedFile;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->close()V

    throw v0
.end method

.method public declared-synchronized getAppendStream()Lcom/sun/mail/pop3/AppendStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 147
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/WritableSharedFile;->af:Lcom/sun/mail/pop3/AppendStream;

    if-eqz v0, :cond_10

    .line 148
    new-instance v0, Ljava/io/IOException;

    const-string v1, "POP3 file cache only supports single threaded access"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    .line 147
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 150
    :cond_10
    :try_start_10
    new-instance v0, Lcom/sun/mail/pop3/AppendStream;

    invoke-direct {v0, p0}, Lcom/sun/mail/pop3/AppendStream;-><init>(Lcom/sun/mail/pop3/WritableSharedFile;)V

    iput-object v0, p0, Lcom/sun/mail/pop3/WritableSharedFile;->af:Lcom/sun/mail/pop3/AppendStream;

    .line 151
    iget-object v0, p0, Lcom/sun/mail/pop3/WritableSharedFile;->af:Lcom/sun/mail/pop3/AppendStream;
    :try_end_19
    .catchall {:try_start_10 .. :try_end_19} :catchall_d

    monitor-exit p0

    return-object v0
.end method

.method public getWritableFile()Ljava/io/RandomAccessFile;
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/sun/mail/pop3/WritableSharedFile;->raf:Ljava/io/RandomAccessFile;

    return-object v0
.end method

.method declared-synchronized updateLength()J
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/WritableSharedFile;->in:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sun/mail/pop3/WritableSharedFile;->datalen:J

    .line 139
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/pop3/WritableSharedFile;->af:Lcom/sun/mail/pop3/AppendStream;

    .line 140
    iget-wide v0, p0, Lcom/sun/mail/pop3/WritableSharedFile;->datalen:J
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_10

    monitor-exit p0

    return-wide v0

    .line 138
    :catchall_10
    move-exception v0

    monitor-exit p0

    throw v0
.end method
