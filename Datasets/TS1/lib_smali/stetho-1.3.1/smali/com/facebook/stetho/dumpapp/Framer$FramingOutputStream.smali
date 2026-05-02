.class Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;
.super Ljava/io/OutputStream;
.source "Framer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/dumpapp/Framer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FramingOutputStream"
.end annotation


# instance fields
.field private final mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

.field private final mPrefix:B

.field final synthetic this$0:Lcom/facebook/stetho/dumpapp/Framer;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/dumpapp/Framer;B)V
    .registers 5
    .param p2, "prefix"    # B

    .prologue
    .line 207
    iput-object p1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 205
    new-instance v0, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;-><init>(Lcom/facebook/stetho/dumpapp/Framer$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    .line 208
    iput-byte p2, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->mPrefix:B

    .line 209
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
    .line 242
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    invoke-virtual {v0}, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;->close()V

    .line 243
    return-void
.end method

.method public write(I)V
    .registers 5
    .param p1, "oneByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 231
    const/4 v1, 0x1

    new-array v0, v1, [B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 232
    .local v0, "buffer":[B
    array-length v1, v0

    invoke-virtual {p0, v0, v2, v1}, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->write([BII)V

    .line 233
    return-void
.end method

.method public write([B)V
    .registers 4
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 237
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->write([BII)V

    .line 238
    return-void
.end method

.method public write([BII)V
    .registers 8
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    invoke-virtual {v1}, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;->throwIfClosed()V

    .line 214
    if-lez p3, :cond_20

    .line 216
    :try_start_7
    iget-object v2, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    monitor-enter v2
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_a} :catch_24

    .line 217
    :try_start_a
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    iget-byte v3, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->mPrefix:B

    invoke-virtual {v1, v3, p3}, Lcom/facebook/stetho/dumpapp/Framer;->writeIntFrame(BI)V

    .line 218
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    invoke-virtual {v1, p1, p2, p3}, Lcom/facebook/stetho/dumpapp/Framer;->writeBlob([BII)V

    .line 219
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingOutputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    # getter for: Lcom/facebook/stetho/dumpapp/Framer;->mMultiplexedOutputStream:Ljava/io/DataOutputStream;
    invoke-static {v1}, Lcom/facebook/stetho/dumpapp/Framer;->access$300(Lcom/facebook/stetho/dumpapp/Framer;)Ljava/io/DataOutputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 220
    monitor-exit v2

    .line 227
    :cond_20
    return-void

    .line 220
    :catchall_21
    move-exception v1

    monitor-exit v2
    :try_end_23
    .catchall {:try_start_a .. :try_end_23} :catchall_21

    :try_start_23
    throw v1
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_24} :catch_24

    .line 221
    :catch_24
    move-exception v0

    .line 224
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/facebook/stetho/dumpapp/DumpappOutputBrokenException;

    invoke-direct {v1, v0}, Lcom/facebook/stetho/dumpapp/DumpappOutputBrokenException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
