.class public Lcom/drew/lang/StreamReader;
.super Lcom/drew/lang/SequentialReader;
.source "StreamReader.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final _stream:Ljava/io/InputStream;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 34
    const-class v0, Lcom/drew/lang/StreamReader;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lcom/drew/lang/StreamReader;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "stream"    # Ljava/io/InputStream;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/drew/lang/SequentialReader;-><init>()V

    .line 42
    if-nez p1, :cond_b

    .line 43
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 45
    :cond_b
    iput-object p1, p0, Lcom/drew/lang/StreamReader;->_stream:Ljava/io/InputStream;

    .line 46
    return-void
.end method

.method private skipInternal(J)J
    .registers 12
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, 0x0

    .line 104
    const-wide/16 v2, 0x0

    .line 105
    .local v2, "skippedTotal":J
    :cond_4
    cmp-long v4, v2, p1

    if-eqz v4, :cond_23

    .line 106
    iget-object v4, p0, Lcom/drew/lang/StreamReader;->_stream:Ljava/io/InputStream;

    sub-long v5, p1, v2

    invoke-virtual {v4, v5, v6}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v0

    .line 107
    .local v0, "skipped":J
    sget-boolean v4, Lcom/drew/lang/StreamReader;->$assertionsDisabled:Z

    if-nez v4, :cond_1e

    cmp-long v4, v0, v7

    if-gez v4, :cond_1e

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 108
    :cond_1e
    add-long/2addr v2, v0

    .line 109
    cmp-long v4, v0, v7

    if-nez v4, :cond_4

    .line 112
    .end local v0    # "skipped":J
    :cond_23
    return-wide v2
.end method


# virtual methods
.method protected getByte()B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 51
    iget-object v1, p0, Lcom/drew/lang/StreamReader;->_stream:Ljava/io/InputStream;

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    .line 52
    .local v0, "value":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_11

    .line 53
    new-instance v1, Ljava/io/EOFException;

    const-string v2, "End of data reached."

    invoke-direct {v1, v2}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 54
    :cond_11
    int-to-byte v1, v0

    return v1
.end method

.method public getBytes(I)[B
    .registers 7
    .param p1, "count"    # I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    new-array v0, p1, [B

    .line 62
    .local v0, "bytes":[B
    const/4 v2, 0x0

    .line 64
    .local v2, "totalBytesRead":I
    :cond_3
    if-eq v2, p1, :cond_25

    .line 65
    iget-object v3, p0, Lcom/drew/lang/StreamReader;->_stream:Ljava/io/InputStream;

    sub-int v4, p1, v2

    invoke-virtual {v3, v0, v2, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 66
    .local v1, "bytesRead":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_18

    .line 67
    new-instance v3, Ljava/io/EOFException;

    const-string v4, "End of data reached."

    invoke-direct {v3, v4}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 68
    :cond_18
    add-int/2addr v2, v1

    .line 69
    sget-boolean v3, Lcom/drew/lang/StreamReader;->$assertionsDisabled:Z

    if-nez v3, :cond_3

    if-le v2, p1, :cond_3

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 72
    .end local v1    # "bytesRead":I
    :cond_25
    return-object v0
.end method

.method public skip(J)V
    .registers 10
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-gez v2, :cond_e

    .line 79
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "n must be zero or greater."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 81
    :cond_e
    invoke-direct {p0, p1, p2}, Lcom/drew/lang/StreamReader;->skipInternal(J)J

    move-result-wide v0

    .line 83
    .local v0, "skippedCount":J
    cmp-long v2, v0, p1

    if-eqz v2, :cond_33

    .line 84
    new-instance v2, Ljava/io/EOFException;

    const-string v3, "Unable to skip. Requested %d bytes but skipped %d."

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 85
    :cond_33
    return-void
.end method

.method public trySkip(J)Z
    .registers 5
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 90
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_e

    .line 91
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "n must be zero or greater."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_e
    invoke-direct {p0, p1, p2}, Lcom/drew/lang/StreamReader;->skipInternal(J)J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-nez v0, :cond_18

    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method
