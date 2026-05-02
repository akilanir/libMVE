.class Lcom/jcraft/jsch/Channel$1;
.super Ljava/io/OutputStream;
.source "Channel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jcraft/jsch/Channel;->getOutputStream()Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field b:[B

.field private buffer:Lcom/jcraft/jsch/Buffer;

.field private closed:Z

.field private dataLen:I

.field private packet:Lcom/jcraft/jsch/Packet;

.field final synthetic this$0:Lcom/jcraft/jsch/Channel;

.field final synthetic val$channel:Lcom/jcraft/jsch/Channel;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/Channel;Lcom/jcraft/jsch/Channel;)V
    .registers 5

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 229
    iput-object p1, p0, Lcom/jcraft/jsch/Channel$1;->this$0:Lcom/jcraft/jsch/Channel;

    iput-object p2, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 230
    iput v0, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    .line 231
    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    .line 232
    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    .line 233
    iput-boolean v0, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    .line 246
    const/4 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/jcraft/jsch/Channel$1;->b:[B

    return-void
.end method

.method private declared-synchronized init()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    monitor-enter p0

    :try_start_1
    new-instance v1, Lcom/jcraft/jsch/Buffer;

    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->this$0:Lcom/jcraft/jsch/Channel;

    iget v2, v2, Lcom/jcraft/jsch/Channel;->rmpsize:I

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/Buffer;-><init>(I)V

    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    .line 236
    new-instance v1, Lcom/jcraft/jsch/Packet;

    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    invoke-direct {v1, v2}, Lcom/jcraft/jsch/Packet;-><init>(Lcom/jcraft/jsch/Buffer;)V

    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    .line 238
    iget-object v1, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v1, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 239
    .local v0, "_buf":[B
    array-length v1, v0

    add-int/lit8 v1, v1, -0xe

    add-int/lit8 v1, v1, -0x54

    if-gtz v1, :cond_31

    .line 240
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    .line 241
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    .line 242
    new-instance v1, Ljava/io/IOException;

    const-string v2, "failed to initialize the channel."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2e
    .catchall {:try_start_1 .. :try_end_2e} :catchall_2e

    .line 235
    .end local v0    # "_buf":[B
    :catchall_2e
    move-exception v1

    monitor-exit p0

    throw v1

    .line 245
    .restart local v0    # "_buf":[B
    :cond_31
    monitor-exit p0

    return-void
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
    .line 306
    iget-object v1, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    if-nez v1, :cond_7

    .line 308
    :try_start_4
    invoke-direct {p0}, Lcom/jcraft/jsch/Channel$1;->init()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_7} :catch_c

    .line 315
    :cond_7
    iget-boolean v1, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    if-eqz v1, :cond_e

    .line 323
    :goto_b
    return-void

    .line 310
    :catch_c
    move-exception v0

    .line 312
    .local v0, "e":Ljava/io/IOException;
    goto :goto_b

    .line 318
    .end local v0    # "e":Ljava/io/IOException;
    :cond_e
    iget v1, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    if-lez v1, :cond_15

    .line 319
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel$1;->flush()V

    .line 321
    :cond_15
    iget-object v1, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    invoke-virtual {v1}, Lcom/jcraft/jsch/Channel;->eof()V

    .line 322
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    goto :goto_b
.end method

.method public flush()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 281
    iget-boolean v2, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    if-eqz v2, :cond_c

    .line 282
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Already closed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 284
    :cond_c
    iget v2, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    if-nez v2, :cond_11

    .line 304
    :goto_10
    return-void

    .line 286
    :cond_11
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Packet;->reset()V

    .line 287
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    const/16 v3, 0x5e

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putByte(B)V

    .line 288
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v3, p0, Lcom/jcraft/jsch/Channel$1;->this$0:Lcom/jcraft/jsch/Channel;

    iget v3, v3, Lcom/jcraft/jsch/Channel;->recipient:I

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 289
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->putInt(I)V

    .line 290
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    invoke-virtual {v2, v3}, Lcom/jcraft/jsch/Buffer;->skip(I)V

    .line 292
    :try_start_34
    iget v1, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    .line 293
    .local v1, "foo":I
    const/4 v2, 0x0

    iput v2, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    .line 294
    iget-object v3, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    monitor-enter v3
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_3c} :catch_54

    .line 295
    :try_start_3c
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    iget-boolean v2, v2, Lcom/jcraft/jsch/Channel;->close:Z

    if-nez v2, :cond_4f

    .line 296
    iget-object v2, p0, Lcom/jcraft/jsch/Channel$1;->this$0:Lcom/jcraft/jsch/Channel;

    invoke-virtual {v2}, Lcom/jcraft/jsch/Channel;->getSession()Lcom/jcraft/jsch/Session;

    move-result-object v2

    iget-object v4, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    iget-object v5, p0, Lcom/jcraft/jsch/Channel$1;->val$channel:Lcom/jcraft/jsch/Channel;

    invoke-virtual {v2, v4, v5, v1}, Lcom/jcraft/jsch/Session;->write(Lcom/jcraft/jsch/Packet;Lcom/jcraft/jsch/Channel;I)V

    .line 297
    :cond_4f
    monitor-exit v3

    goto :goto_10

    :catchall_51
    move-exception v2

    monitor-exit v3
    :try_end_53
    .catchall {:try_start_3c .. :try_end_53} :catchall_51

    :try_start_53
    throw v2
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_54} :catch_54

    .line 299
    .end local v1    # "foo":I
    :catch_54
    move-exception v0

    .line 300
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel$1;->close()V

    .line 301
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public write(I)V
    .registers 5
    .param p1, "w"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 248
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$1;->b:[B

    int-to-byte v1, p1

    aput-byte v1, v0, v2

    .line 249
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$1;->b:[B

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v2, v1}, Lcom/jcraft/jsch/Channel$1;->write([BII)V

    .line 250
    return-void
.end method

.method public write([BII)V
    .registers 9
    .param p1, "buf"    # [B
    .param p2, "s"    # I
    .param p3, "l"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 252
    iget-object v3, p0, Lcom/jcraft/jsch/Channel$1;->packet:Lcom/jcraft/jsch/Packet;

    if-nez v3, :cond_7

    .line 253
    invoke-direct {p0}, Lcom/jcraft/jsch/Channel$1;->init()V

    .line 256
    :cond_7
    iget-boolean v3, p0, Lcom/jcraft/jsch/Channel$1;->closed:Z

    if-eqz v3, :cond_13

    .line 257
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Already closed"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 260
    :cond_13
    iget-object v3, p0, Lcom/jcraft/jsch/Channel$1;->buffer:Lcom/jcraft/jsch/Buffer;

    iget-object v0, v3, Lcom/jcraft/jsch/Buffer;->buffer:[B

    .line 261
    .local v0, "_buf":[B
    array-length v1, v0

    .line 262
    .local v1, "_bufl":I
    :goto_18
    if-lez p3, :cond_42

    .line 263
    move v2, p3

    .line 264
    .local v2, "_l":I
    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    add-int/lit8 v3, v3, 0xe

    sub-int v3, v1, v3

    add-int/lit8 v3, v3, -0x54

    if-le p3, v3, :cond_2d

    .line 265
    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    add-int/lit8 v3, v3, 0xe

    sub-int v3, v1, v3

    add-int/lit8 v2, v3, -0x54

    .line 268
    :cond_2d
    if-gtz v2, :cond_33

    .line 269
    invoke-virtual {p0}, Lcom/jcraft/jsch/Channel$1;->flush()V

    goto :goto_18

    .line 273
    :cond_33
    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    add-int/lit8 v3, v3, 0xe

    invoke-static {p1, p2, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 274
    iget v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    add-int/2addr v3, v2

    iput v3, p0, Lcom/jcraft/jsch/Channel$1;->dataLen:I

    .line 275
    add-int/2addr p2, v2

    .line 276
    sub-int/2addr p3, v2

    .line 277
    goto :goto_18

    .line 278
    .end local v2    # "_l":I
    :cond_42
    return-void
.end method
