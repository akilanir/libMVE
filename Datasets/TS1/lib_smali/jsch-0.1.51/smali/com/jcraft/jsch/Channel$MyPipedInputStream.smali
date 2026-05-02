.class Lcom/jcraft/jsch/Channel$MyPipedInputStream;
.super Ljava/io/PipedInputStream;
.source "Channel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/Channel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyPipedInputStream"
.end annotation


# instance fields
.field private BUFFER_SIZE:I

.field private max_buffer_size:I

.field final synthetic this$0:Lcom/jcraft/jsch/Channel;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/Channel;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 331
    iput-object p1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->this$0:Lcom/jcraft/jsch/Channel;

    invoke-direct {p0}, Ljava/io/PipedInputStream;-><init>()V

    .line 329
    const/16 v0, 0x400

    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    .line 330
    iget v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->max_buffer_size:I

    .line 331
    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/Channel;I)V
    .registers 4
    .param p2, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 332
    iput-object p1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->this$0:Lcom/jcraft/jsch/Channel;

    .line 333
    invoke-direct {p0}, Ljava/io/PipedInputStream;-><init>()V

    .line 329
    const/16 v0, 0x400

    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    .line 330
    iget v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->max_buffer_size:I

    .line 334
    new-array v0, p2, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    .line 335
    iput p2, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    .line 336
    iput p2, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->max_buffer_size:I

    .line 337
    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/Channel;II)V
    .registers 4
    .param p2, "size"    # I
    .param p3, "max_buffer_size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 339
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;-><init>(Lcom/jcraft/jsch/Channel;I)V

    .line 340
    iput p3, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->max_buffer_size:I

    .line 341
    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedOutputStream;)V
    .registers 4
    .param p2, "out"    # Ljava/io/PipedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 342
    iput-object p1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->this$0:Lcom/jcraft/jsch/Channel;

    invoke-direct {p0, p2}, Ljava/io/PipedInputStream;-><init>(Ljava/io/PipedOutputStream;)V

    .line 329
    const/16 v0, 0x400

    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    .line 330
    iget v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->max_buffer_size:I

    .line 342
    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedOutputStream;I)V
    .registers 5
    .param p2, "out"    # Ljava/io/PipedOutputStream;
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 343
    iput-object p1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->this$0:Lcom/jcraft/jsch/Channel;

    .line 344
    invoke-direct {p0, p2}, Ljava/io/PipedInputStream;-><init>(Ljava/io/PipedOutputStream;)V

    .line 329
    const/16 v0, 0x400

    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    .line 330
    iget v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->max_buffer_size:I

    .line 345
    new-array v0, p3, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    .line 346
    iput p3, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    .line 347
    return-void
.end method

.method private freeSpace()I
    .registers 4

    .prologue
    .line 366
    const/4 v0, 0x0

    .line 367
    .local v0, "size":I
    iget v1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    iget v2, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    if-ge v1, v2, :cond_f

    .line 368
    iget-object v1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v1, v1

    iget v2, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    sub-int v0, v1, v2

    .line 374
    :cond_e
    :goto_e
    return v0

    .line 370
    :cond_f
    iget v1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    iget v2, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    if-ge v1, v2, :cond_e

    .line 371
    iget v1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1e

    iget-object v1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v0, v1

    goto :goto_e

    .line 372
    :cond_1e
    iget v1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    iget v2, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    sub-int v0, v1, v2

    goto :goto_e
.end method


# virtual methods
.method declared-synchronized checkSpace(I)V
    .registers 12
    .param p1, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 377
    monitor-enter p0

    :try_start_1
    invoke-direct {p0}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->freeSpace()I

    move-result v3

    .line 378
    .local v3, "size":I
    if-ge v3, p1, :cond_84

    .line 379
    iget-object v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v5, v5

    sub-int v0, v5, v3

    .line 380
    .local v0, "datasize":I
    iget-object v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v1, v5

    .line 381
    .local v1, "foo":I
    :goto_f
    sub-int v5, v1, v0

    if-ge v5, p1, :cond_16

    .line 382
    mul-int/lit8 v1, v1, 0x2

    goto :goto_f

    .line 385
    :cond_16
    iget v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->max_buffer_size:I

    if-le v1, v5, :cond_1c

    .line 386
    iget v1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->max_buffer_size:I
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_37

    .line 388
    :cond_1c
    sub-int v5, v1, v0

    if-ge v5, p1, :cond_22

    .line 417
    .end local v0    # "datasize":I
    .end local v1    # "foo":I
    :cond_20
    :goto_20
    monitor-exit p0

    return-void

    .line 390
    .restart local v0    # "datasize":I
    .restart local v1    # "foo":I
    :cond_22
    :try_start_22
    new-array v4, v1, [B

    .line 391
    .local v4, "tmp":[B
    iget v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    iget v6, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    if-ge v5, v6, :cond_3a

    .line 392
    iget-object v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v8, v8

    invoke-static {v5, v6, v4, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 409
    :cond_34
    :goto_34
    iput-object v4, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B
    :try_end_36
    .catchall {:try_start_22 .. :try_end_36} :catchall_37

    goto :goto_20

    .line 377
    .end local v0    # "datasize":I
    .end local v1    # "foo":I
    .end local v3    # "size":I
    .end local v4    # "tmp":[B
    :catchall_37
    move-exception v5

    monitor-exit p0

    throw v5

    .line 394
    .restart local v0    # "datasize":I
    .restart local v1    # "foo":I
    .restart local v3    # "size":I
    .restart local v4    # "tmp":[B
    :cond_3a
    :try_start_3a
    iget v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    iget v6, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    if-ge v5, v6, :cond_6e

    .line 395
    iget v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    const/4 v6, -0x1

    if-eq v5, v6, :cond_34

    .line 398
    iget-object v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget v8, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    invoke-static {v5, v6, v4, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 399
    iget-object v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    iget v6, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    array-length v7, v4

    iget-object v8, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v8, v8

    iget v9, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    sub-int/2addr v8, v9

    sub-int/2addr v7, v8

    iget-object v8, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v8, v8

    iget v9, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    sub-int/2addr v8, v9

    invoke-static {v5, v6, v4, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 402
    array-length v5, v4

    iget-object v6, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v6, v6

    iget v7, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    sub-int/2addr v6, v7

    sub-int/2addr v5, v6

    iput v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    goto :goto_34

    .line 405
    :cond_6e
    iget v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    iget v6, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    if-ne v5, v6, :cond_34

    .line 406
    iget-object v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    const/4 v6, 0x0

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v8, v8

    invoke-static {v5, v6, v4, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 407
    iget-object v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v5, v5

    iput v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    goto :goto_34

    .line 411
    .end local v0    # "datasize":I
    .end local v1    # "foo":I
    .end local v4    # "tmp":[B
    :cond_84
    iget-object v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    array-length v5, v5

    if-ne v5, v3, :cond_20

    iget v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    if-le v3, v5, :cond_20

    .line 412
    div-int/lit8 v2, v3, 0x2

    .line 413
    .local v2, "i":I
    iget v5, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    if-ge v2, v5, :cond_95

    iget v2, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->BUFFER_SIZE:I

    .line 414
    :cond_95
    new-array v4, v2, [B

    .line 415
    .restart local v4    # "tmp":[B
    iput-object v4, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B
    :try_end_99
    .catchall {:try_start_3a .. :try_end_99} :catchall_37

    goto :goto_20
.end method

.method public declared-synchronized updateReadSide()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 356
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->available()I
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_1e

    move-result v0

    if-eqz v0, :cond_9

    .line 363
    :goto_7
    monitor-exit p0

    return-void

    .line 359
    :cond_9
    const/4 v0, 0x0

    :try_start_a
    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    .line 360
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->out:I

    .line 361
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->buffer:[B

    iget v1, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->in:I

    const/4 v2, 0x0

    aput-byte v2, v0, v1

    .line 362
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->read()I
    :try_end_1d
    .catchall {:try_start_a .. :try_end_1d} :catchall_1e

    goto :goto_7

    .line 356
    :catchall_1e
    move-exception v0

    monitor-exit p0

    throw v0
.end method
