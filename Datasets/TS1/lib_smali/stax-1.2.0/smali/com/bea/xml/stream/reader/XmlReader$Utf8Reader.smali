.class final Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;
.super Lcom/bea/xml/stream/reader/XmlReader$BaseReader;
.source "XmlReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bea/xml/stream/reader/XmlReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Utf8Reader"
.end annotation


# instance fields
.field private nextChar:C


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 615
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/reader/XmlReader$BaseReader;-><init>(Ljava/io/InputStream;)V

    .line 616
    return-void
.end method


# virtual methods
.method public getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 618
    const-string v0, "UTF-8"

    return-object v0
.end method

.method public read([CII)I
    .registers 16
    .param p1, "buf"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 622
    const/4 v2, 0x0

    .local v2, "i":I
    const/4 v0, 0x0

    .line 624
    .local v0, "c":I
    if-gtz p3, :cond_6

    .line 625
    const/4 v3, 0x0

    .line 777
    :goto_5
    return v3

    .line 629
    :cond_6
    add-int v6, p2, p3

    array-length v7, p1

    if-gt v6, v7, :cond_d

    if-gez p2, :cond_13

    .line 630
    :cond_d
    new-instance v6, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v6}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v6

    .line 633
    :cond_13
    iget-char v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->nextChar:C

    if-eqz v6, :cond_1e2

    .line 634
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    add-int v6, p2, v2

    iget-char v7, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->nextChar:C

    aput-char v7, p1, v6

    .line 635
    const/4 v6, 0x0

    iput-char v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->nextChar:C

    .line 638
    :goto_22
    if-ge v3, p3, :cond_2f

    .line 640
    iget v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    iget v7, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    if-gt v6, v7, :cond_4d

    .line 641
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->instream:Ljava/io/InputStream;

    if-nez v6, :cond_33

    .line 642
    const/4 v0, -0x1

    .line 775
    :cond_2f
    :goto_2f
    if-lez v3, :cond_1d4

    move v2, v3

    .line 776
    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_5

    .line 645
    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_33
    const/4 v6, 0x0

    iput v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    .line 646
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->instream:Ljava/io/InputStream;

    iget-object v7, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    array-length v9, v9

    invoke-virtual {v6, v7, v8, v9}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    iput v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    .line 647
    iget v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    if-gtz v6, :cond_4d

    .line 648
    invoke-virtual {p0}, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->close()V

    .line 649
    const/4 v0, -0x1

    .line 650
    goto :goto_2f

    .line 663
    :cond_4d
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    iget v7, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    aget-byte v6, v6, v7

    and-int/lit16 v0, v6, 0xff

    .line 664
    and-int/lit16 v6, v0, 0x80

    if-nez v6, :cond_68

    .line 666
    iget v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    .line 667
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    add-int v6, p2, v3

    int-to-char v7, v0

    aput-char v7, p1, v6

    move v3, v2

    .line 668
    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto :goto_22

    .line 675
    :cond_68
    iget v4, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    .line 679
    .local v4, "off":I
    :try_start_6a
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    aget-byte v6, v6, v4

    and-int/lit16 v6, v6, 0xe0

    const/16 v7, 0xc0

    if-ne v6, v7, :cond_c1

    .line 680
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B
    :try_end_76
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_6a .. :try_end_76} :catch_146

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "off":I
    .local v5, "off":I
    :try_start_78
    aget-byte v6, v6, v4

    and-int/lit8 v6, v6, 0x1f

    shl-int/lit8 v0, v6, 0x6

    .line 681
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B
    :try_end_80
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_78 .. :try_end_80} :catch_1de

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "off":I
    .restart local v4    # "off":I
    :try_start_82
    aget-byte v6, v6, v5
    :try_end_84
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_82 .. :try_end_84} :catch_146

    and-int/lit8 v6, v6, 0x3f

    add-int/2addr v0, v6

    .line 737
    :cond_87
    :goto_87
    iget v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    if-le v4, v6, :cond_190

    .line 738
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    iget v7, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    iget-object v8, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    const/4 v9, 0x0

    iget v10, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    iget v11, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    sub-int/2addr v10, v11

    invoke-static {v6, v7, v8, v9, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 740
    iget v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    iget v7, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    sub-int/2addr v6, v7

    iput v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    .line 741
    const/4 v6, 0x0

    iput v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    .line 742
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->instream:Ljava/io/InputStream;

    iget-object v7, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    iget v8, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    iget-object v9, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    array-length v9, v9

    iget v10, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    sub-int/2addr v9, v10

    invoke-virtual {v6, v7, v8, v9}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    .line 744
    if-gez v4, :cond_189

    .line 745
    invoke-virtual {p0}, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->close()V

    .line 746
    new-instance v6, Ljava/io/CharConversionException;

    const-string v7, "Partial UTF-8 char"

    invoke-direct {v6, v7}, Ljava/io/CharConversionException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 686
    :cond_c1
    :try_start_c1
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    aget-byte v6, v6, v4

    and-int/lit16 v6, v6, 0xf0

    const/16 v7, 0xe0

    if-ne v6, v7, :cond_eb

    .line 687
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B
    :try_end_cd
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_c1 .. :try_end_cd} :catch_146

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "off":I
    .restart local v5    # "off":I
    :try_start_cf
    aget-byte v6, v6, v4

    and-int/lit8 v6, v6, 0xf

    shl-int/lit8 v0, v6, 0xc

    .line 688
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B
    :try_end_d7
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_cf .. :try_end_d7} :catch_1de

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "off":I
    .restart local v4    # "off":I
    :try_start_d9
    aget-byte v6, v6, v5

    and-int/lit8 v6, v6, 0x3f

    shl-int/lit8 v6, v6, 0x6

    add-int/2addr v0, v6

    .line 689
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B
    :try_end_e2
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_d9 .. :try_end_e2} :catch_146

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "off":I
    .restart local v5    # "off":I
    :try_start_e4
    aget-byte v6, v6, v4
    :try_end_e6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_e4 .. :try_end_e6} :catch_1de

    and-int/lit8 v6, v6, 0x3f

    add-int/2addr v0, v6

    move v4, v5

    .line 694
    .end local v5    # "off":I
    .restart local v4    # "off":I
    goto :goto_87

    :cond_eb
    :try_start_eb
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    aget-byte v6, v6, v4

    and-int/lit16 v6, v6, 0xf8

    const/16 v7, 0xf0

    if-ne v6, v7, :cond_164

    .line 695
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B
    :try_end_f7
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_eb .. :try_end_f7} :catch_146

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "off":I
    .restart local v5    # "off":I
    :try_start_f9
    aget-byte v6, v6, v4

    and-int/lit8 v6, v6, 0x7

    shl-int/lit8 v0, v6, 0x12

    .line 696
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B
    :try_end_101
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_f9 .. :try_end_101} :catch_1de

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "off":I
    .restart local v4    # "off":I
    :try_start_103
    aget-byte v6, v6, v5

    and-int/lit8 v6, v6, 0x3f

    shl-int/lit8 v6, v6, 0xc

    add-int/2addr v0, v6

    .line 697
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B
    :try_end_10c
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_103 .. :try_end_10c} :catch_146

    add-int/lit8 v5, v4, 0x1

    .end local v4    # "off":I
    .restart local v5    # "off":I
    :try_start_10e
    aget-byte v6, v6, v4

    and-int/lit8 v6, v6, 0x3f

    shl-int/lit8 v6, v6, 0x6

    add-int/2addr v0, v6

    .line 698
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B
    :try_end_117
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_10e .. :try_end_117} :catch_1de

    add-int/lit8 v4, v5, 0x1

    .end local v5    # "off":I
    .restart local v4    # "off":I
    :try_start_119
    aget-byte v6, v6, v5

    and-int/lit8 v6, v6, 0x3f

    add-int/2addr v0, v6

    .line 703
    const v6, 0x10ffff

    if-le v0, v6, :cond_14a

    .line 704
    new-instance v6, Ljava/io/CharConversionException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "UTF-8 encoding of character 0x00"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, " can\'t be converted to Unicode."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/CharConversionException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 726
    :catch_146
    move-exception v1

    .line 728
    .local v1, "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :goto_147
    const/4 v0, 0x0

    goto/16 :goto_87

    .line 710
    .end local v1    # "e":Ljava/lang/ArrayIndexOutOfBoundsException;
    :cond_14a
    const v6, 0xffff

    if-le v0, v6, :cond_87

    .line 712
    const/high16 v6, 0x10000

    sub-int/2addr v0, v6

    .line 713
    const v6, 0xdc00

    and-int/lit16 v7, v0, 0x3ff

    add-int/2addr v6, v7

    int-to-char v6, v6

    iput-char v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->nextChar:C

    .line 714
    const v6, 0xd800

    shr-int/lit8 v7, v0, 0xa

    add-int v0, v6, v7

    .line 715
    goto/16 :goto_87

    .line 719
    :cond_164
    new-instance v6, Ljava/io/CharConversionException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Unconvertible UTF-8 character beginning with 0x"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    iget v9, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    aget-byte v8, v8, v9

    and-int/lit16 v8, v8, 0xff

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/CharConversionException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_189
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_119 .. :try_end_189} :catch_146

    .line 749
    :cond_189
    iget v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    add-int/2addr v6, v4

    iput v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->finish:I

    goto/16 :goto_22

    .line 756
    :cond_190
    iget v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    :goto_196
    iget v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    if-ge v6, v4, :cond_1b8

    .line 757
    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->buffer:[B

    iget v7, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    aget-byte v6, v6, v7

    and-int/lit16 v6, v6, 0xc0

    const/16 v7, 0x80

    if-eq v6, v7, :cond_1b1

    .line 758
    invoke-virtual {p0}, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->close()V

    .line 759
    new-instance v6, Ljava/io/CharConversionException;

    const-string v7, "Malformed UTF-8 char -- is an XML encoding declaration missing?"

    invoke-direct {v6, v7}, Ljava/io/CharConversionException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 756
    :cond_1b1
    iget v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->start:I

    goto :goto_196

    .line 769
    :cond_1b8
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "i":I
    .restart local v2    # "i":I
    add-int v6, p2, v3

    int-to-char v7, v0

    aput-char v7, p1, v6

    .line 770
    iget-char v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->nextChar:C

    if-eqz v6, :cond_1d1

    if-ge v2, p3, :cond_1d1

    .line 771
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .restart local v3    # "i":I
    add-int v6, p2, v2

    iget-char v7, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->nextChar:C

    aput-char v7, p1, v6

    .line 772
    const/4 v6, 0x0

    iput-char v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Utf8Reader;->nextChar:C

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    :cond_1d1
    move v3, v2

    .line 774
    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto/16 :goto_22

    .line 777
    .end local v4    # "off":I
    :cond_1d4
    const/4 v6, -0x1

    if-ne v0, v6, :cond_1dc

    const/4 v6, -0x1

    :goto_1d8
    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    move v3, v6

    goto/16 :goto_5

    .end local v2    # "i":I
    .restart local v3    # "i":I
    :cond_1dc
    const/4 v6, 0x0

    goto :goto_1d8

    .line 726
    .restart local v5    # "off":I
    :catch_1de
    move-exception v1

    move v4, v5

    .end local v5    # "off":I
    .restart local v4    # "off":I
    goto/16 :goto_147

    .end local v3    # "i":I
    .end local v4    # "off":I
    .restart local v2    # "i":I
    :cond_1e2
    move v3, v2

    .end local v2    # "i":I
    .restart local v3    # "i":I
    goto/16 :goto_22
.end method
