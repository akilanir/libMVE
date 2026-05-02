.class public Lorg/apache/http/impl/io/ContentLengthOutputStream;
.super Ljava/io/OutputStream;
.source "ContentLengthOutputStream.java"


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# instance fields
.field private closed:Z

.field private final contentLength:J

.field private final out:Lorg/apache/http/io/SessionOutputBuffer;

.field private total:J


# direct methods
.method public constructor <init>(Lorg/apache/http/io/SessionOutputBuffer;J)V
    .registers 7
    .param p1, "out"    # Lorg/apache/http/io/SessionOutputBuffer;
    .param p2, "contentLength"    # J

    .prologue
    const-wide/16 v1, 0x0

    .line 80
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 64
    iput-wide v1, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->total:J

    .line 67
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->closed:Z

    .line 81
    if-nez p1, :cond_14

    .line 82
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Session output buffer may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_14
    cmp-long v0, p2, v1

    if-gez v0, :cond_20

    .line 85
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Content length may not be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_20
    iput-object p1, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    .line 88
    iput-wide p2, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->contentLength:J

    .line 89
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
    .line 98
    iget-boolean v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->closed:Z

    if-nez v0, :cond_c

    .line 99
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->closed:Z

    .line 100
    iget-object v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/http/io/SessionOutputBuffer;->flush()V

    .line 102
    :cond_c
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
    .line 106
    iget-object v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0}, Lorg/apache/http/io/SessionOutputBuffer;->flush()V

    .line 107
    return-void
.end method

.method public write(I)V
    .registers 6
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    iget-boolean v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->closed:Z

    if-eqz v0, :cond_c

    .line 132
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Attempted write to closed stream."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_c
    iget-wide v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->total:J

    iget-wide v2, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->contentLength:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_20

    .line 135
    iget-object v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v0, p1}, Lorg/apache/http/io/SessionOutputBuffer;->write(I)V

    .line 136
    iget-wide v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->total:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->total:J

    .line 138
    :cond_20
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
    .line 126
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lorg/apache/http/impl/io/ContentLengthOutputStream;->write([BII)V

    .line 127
    return-void
.end method

.method public write([BII)V
    .registers 10
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-boolean v2, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->closed:Z

    if-eqz v2, :cond_c

    .line 112
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Attempted write to closed stream."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 114
    :cond_c
    iget-wide v2, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->total:J

    iget-wide v4, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->contentLength:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_2b

    .line 115
    iget-wide v2, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->contentLength:J

    iget-wide v4, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->total:J

    sub-long v0, v2, v4

    .line 116
    .local v0, "max":J
    int-to-long v2, p3

    cmp-long v2, v2, v0

    if-lez v2, :cond_20

    .line 117
    long-to-int p3, v0

    .line 119
    :cond_20
    iget-object v2, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->out:Lorg/apache/http/io/SessionOutputBuffer;

    invoke-interface {v2, p1, p2, p3}, Lorg/apache/http/io/SessionOutputBuffer;->write([BII)V

    .line 120
    iget-wide v2, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->total:J

    int-to-long v4, p3

    add-long/2addr v2, v4

    iput-wide v2, p0, Lorg/apache/http/impl/io/ContentLengthOutputStream;->total:J

    .line 122
    .end local v0    # "max":J
    :cond_2b
    return-void
.end method
