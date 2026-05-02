.class Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;
.super Ljava/io/OutputStream;
.source "GridFSInputFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/gridfs/GridFSInputFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyOutputStream"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mongodb/gridfs/GridFSInputFile;


# direct methods
.method constructor <init>(Lcom/mongodb/gridfs/GridFSInputFile;)V
    .registers 2

    .prologue
    .line 351
    iput-object p1, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .prologue
    .line 398
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    const/4 v1, 0x1

    # invokes: Lcom/mongodb/gridfs/GridFSInputFile;->_dumpBuffer(Z)V
    invoke-static {v0, v1}, Lcom/mongodb/gridfs/GridFSInputFile;->access$200(Lcom/mongodb/gridfs/GridFSInputFile;Z)V

    .line 400
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    # invokes: Lcom/mongodb/gridfs/GridFSInputFile;->_finishData()V
    invoke-static {v0}, Lcom/mongodb/gridfs/GridFSInputFile;->access$300(Lcom/mongodb/gridfs/GridFSInputFile;)V

    .line 402
    iget-object v0, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    # invokes: Lcom/mongodb/gridfs/GridFSFile;->save()V
    invoke-static {v0}, Lcom/mongodb/gridfs/GridFSInputFile;->access$401(Lcom/mongodb/gridfs/GridFSInputFile;)V

    .line 403
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
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 360
    new-array v0, v3, [B

    .line 361
    .local v0, "byteArray":[B
    and-int/lit16 v1, p1, 0xff

    int-to-byte v1, v1

    aput-byte v1, v0, v2

    .line 362
    invoke-virtual {p0, v0, v2, v3}, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->write([BII)V

    .line 363
    return-void
.end method

.method public write([BII)V
    .registers 13
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 372
    move v1, p2

    .line 373
    .local v1, "offset":I
    move v0, p3

    .line 374
    .local v0, "length":I
    const/4 v2, 0x0

    .line 375
    .local v2, "toCopy":I
    :cond_3
    :goto_3
    if-lez v0, :cond_50

    .line 376
    move v2, v0

    .line 377
    int-to-long v3, v2

    iget-object v5, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    iget-wide v5, v5, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    iget-object v7, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    # getter for: Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I
    invoke-static {v7}, Lcom/mongodb/gridfs/GridFSInputFile;->access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I

    move-result v7

    int-to-long v7, v7

    sub-long/2addr v5, v7

    cmp-long v3, v3, v5

    if-lez v3, :cond_24

    .line 378
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    iget-wide v3, v3, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    long-to-int v3, v3

    iget-object v4, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    # getter for: Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I
    invoke-static {v4}, Lcom/mongodb/gridfs/GridFSInputFile;->access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I

    move-result v4

    sub-int v2, v3, v4

    .line 380
    :cond_24
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    # getter for: Lcom/mongodb/gridfs/GridFSInputFile;->_buffer:[B
    invoke-static {v3}, Lcom/mongodb/gridfs/GridFSInputFile;->access$100(Lcom/mongodb/gridfs/GridFSInputFile;)[B

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    # getter for: Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I
    invoke-static {v4}, Lcom/mongodb/gridfs/GridFSInputFile;->access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I

    move-result v4

    invoke-static {p1, v1, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 381
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    # += operator for: Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I
    invoke-static {v3, v2}, Lcom/mongodb/gridfs/GridFSInputFile;->access$012(Lcom/mongodb/gridfs/GridFSInputFile;I)I

    .line 382
    add-int/2addr v1, v2

    .line 383
    sub-int/2addr v0, v2

    .line 384
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    # getter for: Lcom/mongodb/gridfs/GridFSInputFile;->_currentBufferPosition:I
    invoke-static {v3}, Lcom/mongodb/gridfs/GridFSInputFile;->access$000(Lcom/mongodb/gridfs/GridFSInputFile;)I

    move-result v3

    int-to-long v3, v3

    iget-object v5, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    iget-wide v5, v5, Lcom/mongodb/gridfs/GridFSInputFile;->_chunkSize:J

    cmp-long v3, v3, v5

    if-nez v3, :cond_3

    .line 385
    iget-object v3, p0, Lcom/mongodb/gridfs/GridFSInputFile$MyOutputStream;->this$0:Lcom/mongodb/gridfs/GridFSInputFile;

    const/4 v4, 0x0

    # invokes: Lcom/mongodb/gridfs/GridFSInputFile;->_dumpBuffer(Z)V
    invoke-static {v3, v4}, Lcom/mongodb/gridfs/GridFSInputFile;->access$200(Lcom/mongodb/gridfs/GridFSInputFile;Z)V

    goto :goto_3

    .line 388
    :cond_50
    return-void
.end method
