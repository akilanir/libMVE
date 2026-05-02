.class public Lorg/apache/http/impl/io/ChunkedOutputStream;
.super Ljava/io/OutputStream;
.source "ChunkedOutputStream.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private cache:[B

.field private cachePosition:I

.field private closed:Z

.field private final out:Lorg/apache/http/io/SessionOutputBuffer;

.field private wroteLastChunk:Z


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionOutputBuffer;)V
    .registers 3
    .param p1, "out"    # Lorg/apache/http/io/SessionOutputBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    const/16 v0, 0x800

    invoke-direct {p0, p1, v0}, Lorg/apache/http/impl/io/ChunkedOutputStream;-><init>(Lorg/apache/http/io/SessionOutputBuffer;I)V

    .line 88
    return-void
.end method

.method public constructor <init>(Lorg/apache/http/io/SessionOutputBuffer;I)V
    .registers 4
    .param p1, "out"    # Lorg/apache/http/io/SessionOutputBuffer;
    .param p2, "bufferSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 73
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 56
    iput v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    .line 58
    iput-boolean v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->wroteLastChunk:Z

    .line 61
    iput-boolean v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->closed:Z

    .line 74
    new-array v0, p2, [B

    iput-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cache:[B

    .line 75
    iput-object p1, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    .line 76
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 186
    iget-boolean v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->closed:Z

    if-nez v0, :cond_f

    .line 187
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->closed:Z

    .line 188
    invoke-virtual {p0}, Lorg/apache/http/impl/io/ChunkedOutputStream;->finish()V

    .line 189
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/http/io/SessionOutputBuffer;->flush()V

    .line 191
    :cond_f
    return-void
.end method

.method public finish()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    iget-boolean v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->wroteLastChunk:Z

    if-nez v0, :cond_d

    .line 129
    invoke-virtual {p0}, Lorg/apache/http/impl/io/ChunkedOutputStream;->flushCache()V

    .line 130
    invoke-virtual {p0}, Lorg/apache/http/impl/io/ChunkedOutputStream;->writeClosingChunk()V

    .line 131
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->wroteLastChunk:Z

    .line 133
    :cond_d
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    invoke-virtual {p0}, Lorg/apache/http/impl/io/ChunkedOutputStream;->flushCache()V

    .line 178
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/http/io/SessionOutputBuffer;->flush()V

    .line 179
    return-void
.end method

.method protected flushCache()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 95
    iget v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    if-lez v0, :cond_22

    .line 96
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    iget v1, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    iget-object v1, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cache:[B

    iget v2, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    invoke-interface {v0, v1, v3, v2}, Lorg/apache/http/io/SessionOutputBuffer;->write([BII)V

    .line 98
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    const-string v1, ""

    invoke-interface {v0, v1}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Ljava/lang/String;)V

    .line 99
    iput v3, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    .line 101
    :cond_22
    return-void
.end method

.method protected flushCacheWithAppend([BII)V
    .registers 8
    .param p1, "bufferToAppend"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 108
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    iget v1, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    add-int/2addr v1, p3

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    iget-object v1, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cache:[B

    iget v2, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    invoke-interface {v0, v1, v3, v2}, Lorg/apache/http/io/SessionOutputBuffer;->write([BII)V

    .line 110
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/apache/http/io/SessionOutputBuffer;->write([BII)V

    .line 111
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    const-string v1, ""

    invoke-interface {v0, v1}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Ljava/lang/String;)V

    .line 112
    iput v3, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    .line 113
    return-void
.end method

.method public write(I)V
    .registers 5
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    iget-boolean v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->closed:Z

    if-eqz v0, :cond_c

    .line 139
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Attempted write to closed stream."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_c
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cache:[B

    iget v1, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    .line 142
    iget v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    .line 143
    iget v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    iget-object v1, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cache:[B

    array-length v1, v1

    if-ne v0, v1, :cond_23

    invoke-virtual {p0}, Lorg/apache/http/impl/io/ChunkedOutputStream;->flushCache()V

    .line 144
    :cond_23
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/impl/io/ChunkedOutputStream;->write([BII)V

    .line 153
    return-void
.end method

.method public write([BII)V
    .registers 6
    .param p1, "src"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    iget-boolean v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->closed:Z

    if-eqz v0, :cond_c

    .line 162
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Attempted write to closed stream."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    :cond_c
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cache:[B

    array-length v0, v0

    iget v1, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    sub-int/2addr v0, v1

    if-lt p3, v0, :cond_18

    .line 165
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/http/impl/io/ChunkedOutputStream;->flushCacheWithAppend([BII)V

    .line 170
    :goto_17
    return-void

    .line 167
    :cond_18
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cache:[B

    iget v1, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 168
    iget v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->cachePosition:I

    goto :goto_17
.end method

.method protected writeClosingChunk()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    const-string v1, "0"

    invoke-interface {v0, v1}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Ljava/lang/String;)V

    .line 118
    iget-object v0, p0, Lorg/apache/http/impl/io/ChunkedOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    const-string v1, ""

    invoke-interface {v0, v1}, Lorg/apache/http/io/SessionOutputBuffer;->writeLine(Ljava/lang/String;)V

    .line 119
    return-void
.end method
