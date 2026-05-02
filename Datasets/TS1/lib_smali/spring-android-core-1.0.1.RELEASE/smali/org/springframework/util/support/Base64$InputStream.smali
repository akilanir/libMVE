.class public Lorg/springframework/util/support/Base64$InputStream;
.super Ljava/io/FilterInputStream;
.source "Base64.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/springframework/util/support/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InputStream"
.end annotation


# instance fields
.field private breakLines:Z

.field private buffer:[B

.field private bufferLength:I

.field private decodabet:[B

.field private encode:Z

.field private lineLength:I

.field private numSigBytes:I

.field private options:I

.field private position:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 1661
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/springframework/util/support/Base64$InputStream;-><init>(Ljava/io/InputStream;I)V

    .line 1662
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .registers 6
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "options"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1687
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 1688
    iput p2, p0, Lorg/springframework/util/support/Base64$InputStream;->options:I

    .line 1689
    and-int/lit8 v0, p2, 0x8

    if-lez v0, :cond_2d

    move v0, v1

    :goto_c
    iput-boolean v0, p0, Lorg/springframework/util/support/Base64$InputStream;->breakLines:Z

    .line 1690
    and-int/lit8 v0, p2, 0x1

    if-lez v0, :cond_2f

    :goto_12
    iput-boolean v1, p0, Lorg/springframework/util/support/Base64$InputStream;->encode:Z

    .line 1691
    iget-boolean v0, p0, Lorg/springframework/util/support/Base64$InputStream;->encode:Z

    if-eqz v0, :cond_31

    const/4 v0, 0x4

    :goto_19
    iput v0, p0, Lorg/springframework/util/support/Base64$InputStream;->bufferLength:I

    .line 1692
    iget v0, p0, Lorg/springframework/util/support/Base64$InputStream;->bufferLength:I

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/springframework/util/support/Base64$InputStream;->buffer:[B

    .line 1693
    const/4 v0, -0x1

    iput v0, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    .line 1694
    iput v2, p0, Lorg/springframework/util/support/Base64$InputStream;->lineLength:I

    .line 1695
    # invokes: Lorg/springframework/util/support/Base64;->getDecodabet(I)[B
    invoke-static {p2}, Lorg/springframework/util/support/Base64;->access$000(I)[B

    move-result-object v0

    iput-object v0, p0, Lorg/springframework/util/support/Base64$InputStream;->decodabet:[B

    .line 1696
    return-void

    :cond_2d
    move v0, v2

    .line 1689
    goto :goto_c

    :cond_2f
    move v1, v2

    .line 1690
    goto :goto_12

    .line 1691
    :cond_31
    const/4 v0, 0x3

    goto :goto_19
.end method


# virtual methods
.method public read()I
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    const/4 v10, 0x4

    const/4 v9, -0x1

    const/4 v1, 0x0

    .line 1709
    iget v3, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    if-gez v3, :cond_30

    .line 1710
    iget-boolean v3, p0, Lorg/springframework/util/support/Base64$InputStream;->encode:Z

    if-eqz v3, :cond_3e

    .line 1711
    new-array v0, v4, [B

    .line 1712
    .local v0, "b3":[B
    const/4 v2, 0x0

    .line 1713
    .local v2, "numBinaryBytes":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_10
    if-ge v8, v4, :cond_22

    .line 1714
    iget-object v3, p0, Lorg/springframework/util/support/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v6

    .line 1717
    .local v6, "b":I
    if-ltz v6, :cond_22

    .line 1718
    int-to-byte v3, v6

    aput-byte v3, v0, v8

    .line 1719
    add-int/lit8 v2, v2, 0x1

    .line 1713
    add-int/lit8 v8, v8, 0x1

    goto :goto_10

    .line 1726
    .end local v6    # "b":I
    :cond_22
    if-lez v2, :cond_3c

    .line 1727
    iget-object v3, p0, Lorg/springframework/util/support/Base64$InputStream;->buffer:[B

    iget v5, p0, Lorg/springframework/util/support/Base64$InputStream;->options:I

    move v4, v1

    # invokes: Lorg/springframework/util/support/Base64;->encode3to4([BII[BII)[B
    invoke-static/range {v0 .. v5}, Lorg/springframework/util/support/Base64;->access$100([BII[BII)[B

    .line 1728
    iput v1, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    .line 1729
    iput v10, p0, Lorg/springframework/util/support/Base64$InputStream;->numSigBytes:I

    .line 1769
    .end local v0    # "b3":[B
    .end local v2    # "numBinaryBytes":I
    .end local v8    # "i":I
    :cond_30
    :goto_30
    iget v3, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    if-ltz v3, :cond_a7

    .line 1771
    iget v3, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    iget v4, p0, Lorg/springframework/util/support/Base64$InputStream;->numSigBytes:I

    if-lt v3, v4, :cond_79

    move v1, v9

    .line 1790
    :goto_3b
    return v1

    .restart local v0    # "b3":[B
    .restart local v2    # "numBinaryBytes":I
    .restart local v8    # "i":I
    :cond_3c
    move v1, v9

    .line 1732
    goto :goto_3b

    .line 1738
    .end local v0    # "b3":[B
    .end local v2    # "numBinaryBytes":I
    .end local v8    # "i":I
    :cond_3e
    new-array v7, v10, [B

    .line 1739
    .local v7, "b4":[B
    const/4 v8, 0x0

    .line 1740
    .restart local v8    # "i":I
    const/4 v8, 0x0

    :goto_42
    if-ge v8, v10, :cond_58

    .line 1742
    const/4 v6, 0x0

    .line 1743
    .restart local v6    # "b":I
    :cond_45
    iget-object v3, p0, Lorg/springframework/util/support/Base64$InputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v3}, Ljava/io/InputStream;->read()I

    move-result v6

    .line 1744
    if-ltz v6, :cond_56

    iget-object v3, p0, Lorg/springframework/util/support/Base64$InputStream;->decodabet:[B

    and-int/lit8 v4, v6, 0x7f

    aget-byte v3, v3, v4

    const/4 v4, -0x5

    if-le v3, v4, :cond_45

    .line 1746
    :cond_56
    if-gez v6, :cond_67

    .line 1753
    .end local v6    # "b":I
    :cond_58
    if-ne v8, v10, :cond_6d

    .line 1754
    iget-object v3, p0, Lorg/springframework/util/support/Base64$InputStream;->buffer:[B

    iget v4, p0, Lorg/springframework/util/support/Base64$InputStream;->options:I

    # invokes: Lorg/springframework/util/support/Base64;->decode4to3([BI[BII)I
    invoke-static {v7, v1, v3, v1, v4}, Lorg/springframework/util/support/Base64;->access$200([BI[BII)I

    move-result v3

    iput v3, p0, Lorg/springframework/util/support/Base64$InputStream;->numSigBytes:I

    .line 1755
    iput v1, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    goto :goto_30

    .line 1750
    .restart local v6    # "b":I
    :cond_67
    int-to-byte v3, v6

    aput-byte v3, v7, v8

    .line 1740
    add-int/lit8 v8, v8, 0x1

    goto :goto_42

    .line 1757
    .end local v6    # "b":I
    :cond_6d
    if-nez v8, :cond_71

    move v1, v9

    .line 1758
    goto :goto_3b

    .line 1762
    :cond_71
    new-instance v1, Ljava/io/IOException;

    const-string v3, "Improperly padded Base64 input."

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1775
    .end local v7    # "b4":[B
    .end local v8    # "i":I
    :cond_79
    iget-boolean v3, p0, Lorg/springframework/util/support/Base64$InputStream;->encode:Z

    if-eqz v3, :cond_8c

    iget-boolean v3, p0, Lorg/springframework/util/support/Base64$InputStream;->breakLines:Z

    if-eqz v3, :cond_8c

    iget v3, p0, Lorg/springframework/util/support/Base64$InputStream;->lineLength:I

    const/16 v4, 0x4c

    if-lt v3, v4, :cond_8c

    .line 1776
    iput v1, p0, Lorg/springframework/util/support/Base64$InputStream;->lineLength:I

    .line 1777
    const/16 v1, 0xa

    goto :goto_3b

    .line 1780
    :cond_8c
    iget v1, p0, Lorg/springframework/util/support/Base64$InputStream;->lineLength:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/springframework/util/support/Base64$InputStream;->lineLength:I

    .line 1784
    iget-object v1, p0, Lorg/springframework/util/support/Base64$InputStream;->buffer:[B

    iget v3, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    aget-byte v6, v1, v3

    .line 1786
    .restart local v6    # "b":I
    iget v1, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    iget v3, p0, Lorg/springframework/util/support/Base64$InputStream;->bufferLength:I

    if-lt v1, v3, :cond_a4

    .line 1787
    iput v9, p0, Lorg/springframework/util/support/Base64$InputStream;->position:I

    .line 1790
    :cond_a4
    and-int/lit16 v1, v6, 0xff

    goto :goto_3b

    .line 1797
    .end local v6    # "b":I
    :cond_a7
    new-instance v1, Ljava/io/IOException;

    const-string v3, "Error in Base64 code reading stream."

    invoke-direct {v1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public read([BII)I
    .registers 8
    .param p1, "dest"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1819
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, p3, :cond_14

    .line 1820
    invoke-virtual {p0}, Lorg/springframework/util/support/Base64$InputStream;->read()I

    move-result v0

    .line 1822
    .local v0, "b":I
    if-ltz v0, :cond_11

    .line 1823
    add-int v2, p2, v1

    int-to-byte v3, v0

    aput-byte v3, p1, v2

    .line 1819
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1825
    :cond_11
    if-nez v1, :cond_14

    .line 1826
    const/4 v1, -0x1

    .line 1832
    .end local v0    # "b":I
    .end local v1    # "i":I
    :cond_14
    return v1
.end method
