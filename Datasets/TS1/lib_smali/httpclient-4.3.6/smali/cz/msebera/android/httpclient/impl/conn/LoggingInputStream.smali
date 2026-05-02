.class Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;
.super Ljava/io/InputStream;
.source "LoggingInputStream.java"


# annotations
.annotation build Lcz/msebera/android/httpclient/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private final in:Ljava/io/InputStream;

.field private final wire:Lcz/msebera/android/httpclient/impl/conn/Wire;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lcz/msebera/android/httpclient/impl/conn/Wire;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "wire"    # Lcz/msebera/android/httpclient/impl/conn/Wire;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 48
    iput-object p1, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    .line 49
    iput-object p2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    .line 50
    return-void
.end method


# virtual methods
.method public available()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    :try_start_0
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->available()I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    return v1

    .line 114
    :catch_7
    move-exception v0

    .line 115
    .local v0, "ex":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[available] I/O error : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(Ljava/lang/String;)V

    .line 116
    throw v0
.end method

.method public close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    :try_start_0
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 143
    return-void

    .line 139
    :catch_6
    move-exception v0

    .line 140
    .local v0, "ex":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[close] I/O error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(Ljava/lang/String;)V

    .line 141
    throw v0
.end method

.method public mark(I)V
    .registers 2
    .param p1, "readlimit"    # I

    .prologue
    .line 122
    invoke-super {p0, p1}, Ljava/io/InputStream;->mark(I)V

    .line 123
    return-void
.end method

.method public markSupported()Z
    .registers 2

    .prologue
    .line 132
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    :try_start_0
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 56
    .local v0, "b":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_11

    .line 57
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    const-string v3, "end of stream"

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(Ljava/lang/String;)V

    .line 61
    :goto_10
    return v0

    .line 59
    :cond_11
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    invoke-virtual {v2, v0}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(I)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_16} :catch_17

    goto :goto_10

    .line 62
    .end local v0    # "b":I
    :catch_17
    move-exception v1

    .line 63
    .local v1, "ex":Ljava/io/IOException;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[read] I/O error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(Ljava/lang/String;)V

    .line 64
    throw v1
.end method

.method public read([B)I
    .registers 7
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 71
    :try_start_0
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    .line 72
    .local v0, "bytesRead":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_11

    .line 73
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    const-string v3, "end of stream"

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(Ljava/lang/String;)V

    .line 77
    :cond_10
    :goto_10
    return v0

    .line 74
    :cond_11
    if-lez v0, :cond_10

    .line 75
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3, v0}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input([BII)V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_19} :catch_1a

    goto :goto_10

    .line 78
    .end local v0    # "bytesRead":I
    :catch_1a
    move-exception v1

    .line 79
    .local v1, "ex":Ljava/io/IOException;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[read] I/O error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(Ljava/lang/String;)V

    .line 80
    throw v1
.end method

.method public read([BII)I
    .registers 9
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    :try_start_0
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v2, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 88
    .local v0, "bytesRead":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_11

    .line 89
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    const-string v3, "end of stream"

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(Ljava/lang/String;)V

    .line 93
    :cond_10
    :goto_10
    return v0

    .line 90
    :cond_11
    if-lez v0, :cond_10

    .line 91
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    invoke-virtual {v2, p1, p2, v0}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input([BII)V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_18} :catch_19

    goto :goto_10

    .line 94
    .end local v0    # "bytesRead":I
    :catch_19
    move-exception v1

    .line 95
    .local v1, "ex":Ljava/io/IOException;
    iget-object v2, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[read] I/O error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(Ljava/lang/String;)V

    .line 96
    throw v1
.end method

.method public reset()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-super {p0}, Ljava/io/InputStream;->reset()V

    .line 128
    return-void
.end method

.method public skip(J)J
    .registers 7
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    :try_start_0
    invoke-super {p0, p1, p2}, Ljava/io/InputStream;->skip(J)J
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-wide v1

    return-wide v1

    .line 104
    :catch_5
    move-exception v0

    .line 105
    .local v0, "ex":Ljava/io/IOException;
    iget-object v1, p0, Lcz/msebera/android/httpclient/impl/conn/LoggingInputStream;->wire:Lcz/msebera/android/httpclient/impl/conn/Wire;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[skip] I/O error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcz/msebera/android/httpclient/impl/conn/Wire;->input(Ljava/lang/String;)V

    .line 106
    throw v0
.end method
