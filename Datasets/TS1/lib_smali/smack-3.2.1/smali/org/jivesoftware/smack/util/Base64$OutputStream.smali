.class public Lorg/jivesoftware/smack/util/Base64$OutputStream;
.super Ljava/io/FilterOutputStream;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OutputStream"
.end annotation


# instance fields
.field private alphabet:[B

.field private b4:[B

.field private breakLines:Z

.field private buffer:[B

.field private bufferLength:I

.field private decodabet:[B

.field private encode:Z

.field private lineLength:I

.field private options:I

.field private position:I

.field private suspendEncoding:Z


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;

    .prologue
    .line 1561
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    .line 1562
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .registers 8
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "options"    # I

    .prologue
    const/4 v3, 0x4

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1587
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1588
    and-int/lit8 v0, p2, 0x8

    const/16 v4, 0x8

    if-eq v0, v4, :cond_3b

    move v0, v1

    :goto_d
    iput-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->breakLines:Z

    .line 1589
    and-int/lit8 v0, p2, 0x1

    if-ne v0, v1, :cond_3d

    :goto_13
    iput-boolean v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->encode:Z

    .line 1590
    iget-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->encode:Z

    if-eqz v0, :cond_3f

    const/4 v0, 0x3

    :goto_1a
    iput v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->bufferLength:I

    .line 1591
    iget v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->bufferLength:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->buffer:[B

    .line 1592
    iput v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    .line 1593
    iput v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->lineLength:I

    .line 1594
    iput-boolean v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->suspendEncoding:Z

    .line 1595
    new-array v0, v3, [B

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->b4:[B

    .line 1596
    iput p2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->options:I

    .line 1597
    # invokes: Lorg/jivesoftware/smack/util/Base64;->getAlphabet(I)[B
    invoke-static {p2}, Lorg/jivesoftware/smack/util/Base64;->access$000(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->alphabet:[B

    .line 1598
    # invokes: Lorg/jivesoftware/smack/util/Base64;->getDecodabet(I)[B
    invoke-static {p2}, Lorg/jivesoftware/smack/util/Base64;->access$100(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->decodabet:[B

    .line 1599
    return-void

    :cond_3b
    move v0, v2

    .line 1588
    goto :goto_d

    :cond_3d
    move v1, v2

    .line 1589
    goto :goto_13

    :cond_3f
    move v0, v3

    .line 1590
    goto :goto_1a
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
    const/4 v0, 0x0

    .line 1723
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->flushBase64()V

    .line 1727
    invoke-super {p0}, Ljava/io/FilterOutputStream;->close()V

    .line 1729
    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->buffer:[B

    .line 1730
    iput-object v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->out:Ljava/io/OutputStream;

    .line 1731
    return-void
.end method

.method public flushBase64()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1699
    iget v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    if-lez v0, :cond_1c

    .line 1701
    iget-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->encode:Z

    if-eqz v0, :cond_1d

    .line 1703
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->out:Ljava/io/OutputStream;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->b4:[B

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->buffer:[B

    iget v3, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    iget v4, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->options:I

    # invokes: Lorg/jivesoftware/smack/util/Base64;->encode3to4([B[BII)[B
    invoke-static {v1, v2, v3, v4}, Lorg/jivesoftware/smack/util/Base64;->access$400([B[BII)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 1704
    const/4 v0, 0x0

    iput v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    .line 1712
    :cond_1c
    return-void

    .line 1708
    :cond_1d
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Base64 input not properly padded."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resumeEncoding()V
    .registers 2

    .prologue
    .line 1758
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->suspendEncoding:Z

    .line 1759
    return-void
.end method

.method public suspendEncoding()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1744
    invoke-virtual {p0}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->flushBase64()V

    .line 1745
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->suspendEncoding:Z

    .line 1746
    return-void
.end method

.method public write(I)V
    .registers 9
    .param p1, "theByte"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, -0x5

    const/4 v6, 0x0

    .line 1617
    iget-boolean v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->suspendEncoding:Z

    if-eqz v1, :cond_c

    .line 1619
    iget-object v1, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write(I)V

    .line 1662
    :cond_b
    :goto_b
    return-void

    .line 1624
    :cond_c
    iget-boolean v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->encode:Z

    if-eqz v1, :cond_4e

    .line 1626
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->buffer:[B

    iget v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 1627
    iget v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    iget v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->bufferLength:I

    if-lt v1, v2, :cond_b

    .line 1629
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->out:Ljava/io/OutputStream;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->b4:[B

    iget-object v3, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->buffer:[B

    iget v4, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->bufferLength:I

    iget v5, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->options:I

    # invokes: Lorg/jivesoftware/smack/util/Base64;->encode3to4([B[BII)[B
    invoke-static {v2, v3, v4, v5}, Lorg/jivesoftware/smack/util/Base64;->access$400([B[BII)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 1631
    iget v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->lineLength:I

    add-int/lit8 v1, v1, 0x4

    iput v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->lineLength:I

    .line 1632
    iget-boolean v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->breakLines:Z

    if-eqz v1, :cond_4b

    iget v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->lineLength:I

    const/16 v2, 0x4c

    if-lt v1, v2, :cond_4b

    .line 1634
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->out:Ljava/io/OutputStream;

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write(I)V

    .line 1635
    iput v6, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->lineLength:I

    .line 1638
    :cond_4b
    iput v6, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    goto :goto_b

    .line 1646
    :cond_4e
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->decodabet:[B

    and-int/lit8 v2, p1, 0x7f

    aget-byte v1, v1, v2

    if-le v1, v3, :cond_7b

    .line 1648
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->buffer:[B

    iget v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    int-to-byte v3, p1

    aput-byte v3, v1, v2

    .line 1649
    iget v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    iget v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->bufferLength:I

    if-lt v1, v2, :cond_b

    .line 1651
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->buffer:[B

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->b4:[B

    iget v3, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->options:I

    # invokes: Lorg/jivesoftware/smack/util/Base64;->decode4to3([BI[BII)I
    invoke-static {v1, v6, v2, v6, v3}, Lorg/jivesoftware/smack/util/Base64;->access$300([BI[BII)I

    move-result v0

    .line 1652
    .local v0, "len":I
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->out:Ljava/io/OutputStream;

    iget-object v2, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->b4:[B

    invoke-virtual {v1, v2, v6, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 1654
    iput v6, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->position:I

    goto :goto_b

    .line 1657
    .end local v0    # "len":I
    :cond_7b
    iget-object v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->decodabet:[B

    and-int/lit8 v2, p1, 0x7f

    aget-byte v1, v1, v2

    if-eq v1, v3, :cond_b

    .line 1659
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Invalid character in Base64 data."

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public write([BII)V
    .registers 6
    .param p1, "theBytes"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1678
    iget-boolean v1, p0, Lorg/jivesoftware/smack/util/Base64$OutputStream;->suspendEncoding:Z

    if-eqz v1, :cond_a

    .line 1680
    iget-object v1, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 1689
    :cond_9
    return-void

    .line 1684
    :cond_a
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, p3, :cond_9

    .line 1686
    add-int v1, p2, v0

    aget-byte v1, p1, v1

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smack/util/Base64$OutputStream;->write(I)V

    .line 1684
    add-int/lit8 v0, v0, 0x1

    goto :goto_b
.end method
