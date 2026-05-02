.class Lcom/sun/mail/pop3/AppendStream;
.super Ljava/io/OutputStream;
.source "TempFile.java"


# instance fields
.field private end:J

.field private raf:Ljava/io/RandomAccessFile;

.field private final start:J

.field private final tf:Lcom/sun/mail/pop3/WritableSharedFile;


# direct methods
.method public constructor <init>(Lcom/sun/mail/pop3/WritableSharedFile;)V
    .registers 5
    .param p1, "tf"    # Lcom/sun/mail/pop3/WritableSharedFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 168
    iput-object p1, p0, Lcom/sun/mail/pop3/AppendStream;->tf:Lcom/sun/mail/pop3/WritableSharedFile;

    .line 169
    invoke-virtual {p1}, Lcom/sun/mail/pop3/WritableSharedFile;->getWritableFile()Ljava/io/RandomAccessFile;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/pop3/AppendStream;->raf:Ljava/io/RandomAccessFile;

    .line 170
    iget-object v0, p0, Lcom/sun/mail/pop3/AppendStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sun/mail/pop3/AppendStream;->start:J

    .line 171
    iget-object v0, p0, Lcom/sun/mail/pop3/AppendStream;->raf:Ljava/io/RandomAccessFile;

    iget-wide v1, p0, Lcom/sun/mail/pop3/AppendStream;->start:J

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 172
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 187
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/AppendStream;->tf:Lcom/sun/mail/pop3/WritableSharedFile;

    invoke-virtual {v0}, Lcom/sun/mail/pop3/WritableSharedFile;->updateLength()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sun/mail/pop3/AppendStream;->end:J

    .line 188
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/mail/pop3/AppendStream;->raf:Ljava/io/RandomAccessFile;
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 189
    monitor-exit p0

    return-void

    .line 187
    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getInputStream()Ljava/io/InputStream;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 192
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/sun/mail/pop3/AppendStream;->tf:Lcom/sun/mail/pop3/WritableSharedFile;

    iget-wide v1, p0, Lcom/sun/mail/pop3/AppendStream;->start:J

    iget-wide v3, p0, Lcom/sun/mail/pop3/AppendStream;->end:J

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/sun/mail/pop3/WritableSharedFile;->newStream(JJ)Ljava/io/InputStream;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_d

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public write(I)V
    .registers 3
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 175
    iget-object v0, p0, Lcom/sun/mail/pop3/AppendStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1}, Ljava/io/RandomAccessFile;->write(I)V

    .line 176
    return-void
.end method

.method public write([B)V
    .registers 3
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    iget-object v0, p0, Lcom/sun/mail/pop3/AppendStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1}, Ljava/io/RandomAccessFile;->write([B)V

    .line 180
    return-void
.end method

.method public write([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lcom/sun/mail/pop3/AppendStream;->raf:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 184
    return-void
.end method
