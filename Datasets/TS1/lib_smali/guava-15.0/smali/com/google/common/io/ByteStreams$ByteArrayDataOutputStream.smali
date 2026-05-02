.class Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;
.super Ljava/lang/Object;
.source "ByteStreams.java"

# interfaces
.implements Lcom/google/common/io/ByteArrayDataOutput;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/ByteStreams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteArrayDataOutputStream"
.end annotation


# instance fields
.field final byteArrayOutputSteam:Ljava/io/ByteArrayOutputStream;

.field final output:Ljava/io/DataOutput;


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 410
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-direct {p0, v0}, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;-><init>(Ljava/io/ByteArrayOutputStream;)V

    .line 411
    return-void
.end method

.method constructor <init>(I)V
    .registers 3
    .param p1, "size"    # I

    .prologue
    .line 414
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    invoke-direct {p0, v0}, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;-><init>(Ljava/io/ByteArrayOutputStream;)V

    .line 415
    return-void
.end method

.method constructor <init>(Ljava/io/ByteArrayOutputStream;)V
    .registers 3
    .param p1, "byteArrayOutputSteam"    # Ljava/io/ByteArrayOutputStream;

    .prologue
    .line 417
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 418
    iput-object p1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->byteArrayOutputSteam:Ljava/io/ByteArrayOutputStream;

    .line 419
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    .line 420
    return-void
.end method


# virtual methods
.method public toByteArray()[B
    .registers 2

    .prologue
    .line 535
    iget-object v0, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->byteArrayOutputSteam:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    return-object v0
.end method

.method public write(I)V
    .registers 4
    .param p1, "b"    # I

    .prologue
    .line 424
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->write(I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 428
    return-void

    .line 425
    :catch_6
    move-exception v0

    .line 426
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public write([B)V
    .registers 4
    .param p1, "b"    # [B

    .prologue
    .line 432
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->write([B)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 436
    return-void

    .line 433
    :catch_6
    move-exception v0

    .line 434
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public write([BII)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 440
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2, p3}, Ljava/io/DataOutput;->write([BII)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 444
    return-void

    .line 441
    :catch_6
    move-exception v0

    .line 442
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeBoolean(Z)V
    .registers 4
    .param p1, "v"    # Z

    .prologue
    .line 448
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeBoolean(Z)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 452
    return-void

    .line 449
    :catch_6
    move-exception v0

    .line 450
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeByte(I)V
    .registers 4
    .param p1, "v"    # I

    .prologue
    .line 456
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeByte(I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 460
    return-void

    .line 457
    :catch_6
    move-exception v0

    .line 458
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeBytes(Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 464
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeBytes(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 468
    return-void

    .line 465
    :catch_6
    move-exception v0

    .line 466
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeChar(I)V
    .registers 4
    .param p1, "v"    # I

    .prologue
    .line 472
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeChar(I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 476
    return-void

    .line 473
    :catch_6
    move-exception v0

    .line 474
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeChars(Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 480
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeChars(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 484
    return-void

    .line 481
    :catch_6
    move-exception v0

    .line 482
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeDouble(D)V
    .registers 5
    .param p1, "v"    # D

    .prologue
    .line 488
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2}, Ljava/io/DataOutput;->writeDouble(D)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 492
    return-void

    .line 489
    :catch_6
    move-exception v0

    .line 490
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeFloat(F)V
    .registers 4
    .param p1, "v"    # F

    .prologue
    .line 496
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeFloat(F)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 500
    return-void

    .line 497
    :catch_6
    move-exception v0

    .line 498
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeInt(I)V
    .registers 4
    .param p1, "v"    # I

    .prologue
    .line 504
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeInt(I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 508
    return-void

    .line 505
    :catch_6
    move-exception v0

    .line 506
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeLong(J)V
    .registers 5
    .param p1, "v"    # J

    .prologue
    .line 512
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1, p2}, Ljava/io/DataOutput;->writeLong(J)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 516
    return-void

    .line 513
    :catch_6
    move-exception v0

    .line 514
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeShort(I)V
    .registers 4
    .param p1, "v"    # I

    .prologue
    .line 520
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeShort(I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 524
    return-void

    .line 521
    :catch_6
    move-exception v0

    .line 522
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public writeUTF(Ljava/lang/String;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 528
    :try_start_0
    iget-object v1, p0, Lcom/google/common/io/ByteStreams$ByteArrayDataOutputStream;->output:Ljava/io/DataOutput;

    invoke-interface {v1, p1}, Ljava/io/DataOutput;->writeUTF(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 532
    return-void

    .line 529
    :catch_6
    move-exception v0

    .line 530
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method
