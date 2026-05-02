.class Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;
.super Ljava/io/InputStream;
.source "Framer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/dumpapp/Framer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FramingInputStream"
.end annotation


# instance fields
.field private final mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

.field final synthetic this$0:Lcom/facebook/stetho/dumpapp/Framer;


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/dumpapp/Framer;)V
    .registers 4

    .prologue
    .line 137
    iput-object p1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 138
    new-instance v0, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;-><init>(Lcom/facebook/stetho/dumpapp/Framer$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/dumpapp/Framer;Lcom/facebook/stetho/dumpapp/Framer$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/facebook/stetho/dumpapp/Framer;
    .param p2, "x1"    # Lcom/facebook/stetho/dumpapp/Framer$1;

    .prologue
    .line 137
    invoke-direct {p0, p1}, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;-><init>(Lcom/facebook/stetho/dumpapp/Framer;)V

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
    .line 198
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    invoke-virtual {v0}, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;->close()V

    .line 199
    return-void
.end method

.method public read()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    const/4 v1, 0x1

    new-array v0, v1, [B

    .line 143
    .local v0, "buf":[B
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->read([B)I

    move-result v1

    if-nez v1, :cond_b

    .line 144
    const/4 v1, -0x1

    .line 146
    :goto_a
    return v1

    :cond_b
    const/4 v1, 0x0

    aget-byte v1, v0, v1

    goto :goto_a
.end method

.method public read([B)I
    .registers 4
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 10
    .param p1, "buffer"    # [B
    .param p2, "byteOffset"    # I
    .param p3, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x2d

    .line 156
    iget-object v2, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    invoke-virtual {v2}, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;->throwIfClosed()V

    .line 158
    iget-object v3, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    monitor-enter v3

    .line 160
    :try_start_a
    iget-object v2, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    const/16 v4, 0x5f

    invoke-virtual {v2, v4, p3}, Lcom/facebook/stetho/dumpapp/Framer;->writeIntFrame(BI)V

    .line 161
    iget-object v2, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    invoke-virtual {v2}, Lcom/facebook/stetho/dumpapp/Framer;->readFrameType()B

    move-result v0

    .line 162
    .local v0, "b":B
    if-eq v0, v5, :cond_24

    .line 163
    new-instance v2, Lcom/facebook/stetho/dumpapp/UnexpectedFrameException;

    const/16 v4, 0x2d

    invoke-direct {v2, v4, v0}, Lcom/facebook/stetho/dumpapp/UnexpectedFrameException;-><init>(BB)V

    throw v2

    .line 176
    .end local v0    # "b":B
    :catchall_21
    move-exception v2

    monitor-exit v3
    :try_end_23
    .catchall {:try_start_a .. :try_end_23} :catchall_21

    throw v2

    .line 167
    .restart local v0    # "b":B
    :cond_24
    :try_start_24
    iget-object v2, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    invoke-virtual {v2}, Lcom/facebook/stetho/dumpapp/Framer;->readInt()I

    move-result v1

    .line 168
    .local v1, "length":I
    if-lez v1, :cond_5a

    .line 169
    if-le v1, p3, :cond_51

    .line 170
    new-instance v2, Lcom/facebook/stetho/dumpapp/DumpappFramingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected at most "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes, got: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/facebook/stetho/dumpapp/DumpappFramingException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 173
    :cond_51
    iget-object v2, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    # getter for: Lcom/facebook/stetho/dumpapp/Framer;->mInput:Ljava/io/DataInputStream;
    invoke-static {v2}, Lcom/facebook/stetho/dumpapp/Framer;->access$200(Lcom/facebook/stetho/dumpapp/Framer;)Ljava/io/DataInputStream;

    move-result-object v2

    invoke-virtual {v2, p1, p2, v1}, Ljava/io/DataInputStream;->readFully([BII)V

    .line 175
    :cond_5a
    monitor-exit v3
    :try_end_5b
    .catchall {:try_start_24 .. :try_end_5b} :catchall_21

    return v1
.end method

.method public skip(J)J
    .registers 12
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 181
    const-wide/16 v3, 0x0

    .line 182
    .local v3, "skipped":J
    const-wide/16 v5, 0x800

    invoke-static {p1, p2, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v1, v5

    .line 183
    .local v1, "bufSize":I
    new-array v0, v1, [B

    .line 184
    .local v0, "buf":[B
    iget-object v6, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    monitor-enter v6

    .line 185
    :goto_e
    cmp-long v5, v3, p1

    if-gez v5, :cond_18

    .line 186
    :try_start_12
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->read([B)I

    move-result v2

    .line 187
    .local v2, "n":I
    if-gez v2, :cond_1a

    .line 192
    .end local v2    # "n":I
    :cond_18
    monitor-exit v6

    .line 193
    return-wide v3

    .line 190
    .restart local v2    # "n":I
    :cond_1a
    int-to-long v7, v2

    add-long/2addr v3, v7

    .line 191
    goto :goto_e

    .line 192
    .end local v2    # "n":I
    :catchall_1d
    move-exception v5

    monitor-exit v6
    :try_end_1f
    .catchall {:try_start_12 .. :try_end_1f} :catchall_1d

    throw v5
.end method
