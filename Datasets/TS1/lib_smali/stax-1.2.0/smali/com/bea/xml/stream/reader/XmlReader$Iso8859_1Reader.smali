.class final Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;
.super Lcom/bea/xml/stream/reader/XmlReader$BaseReader;
.source "XmlReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bea/xml/stream/reader/XmlReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Iso8859_1Reader"
.end annotation


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 842
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/reader/XmlReader$BaseReader;-><init>(Ljava/io/InputStream;)V

    return-void
.end method


# virtual methods
.method public getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 844
    const-string v0, "ISO-8859-1"

    return-object v0
.end method

.method public read([CII)I
    .registers 11
    .param p1, "buf"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v2, -0x1

    .line 848
    iget-object v3, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->instream:Ljava/io/InputStream;

    if-nez v3, :cond_7

    .line 881
    :goto_6
    return v2

    .line 853
    :cond_7
    add-int v3, p2, p3

    array-length v4, p1

    if-gt v3, v4, :cond_e

    if-gez p2, :cond_14

    .line 854
    :cond_e
    new-instance v2, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v2

    .line 861
    :cond_14
    iget v3, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->finish:I

    iget v4, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->start:I

    sub-int v0, v3, v4

    .line 862
    .local v0, "avail":I
    const/4 v3, 0x1

    if-ge v0, v3, :cond_51

    .line 863
    iput v6, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->start:I

    .line 864
    iget-object v3, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->instream:Ljava/io/InputStream;

    iget-object v4, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->buffer:[B

    iget-object v5, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->buffer:[B

    array-length v5, v5

    invoke-virtual {v3, v4, v6, v5}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    iput v3, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->finish:I

    .line 865
    iget v3, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->finish:I

    if-gtz v3, :cond_34

    .line 866
    invoke-virtual {p0}, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->close()V

    goto :goto_6

    .line 869
    :cond_34
    iget v2, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->finish:I

    if-le p3, v2, :cond_3a

    .line 870
    iget p3, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->finish:I

    .line 878
    :cond_3a
    :goto_3a
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3b
    if-ge v1, p3, :cond_55

    .line 879
    add-int v2, p2, v1

    iget-object v3, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->buffer:[B

    iget v4, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->start:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/bea/xml/stream/reader/XmlReader$Iso8859_1Reader;->start:I

    aget-byte v3, v3, v4

    and-int/lit16 v3, v3, 0xff

    int-to-char v3, v3

    aput-char v3, p1, v2

    .line 878
    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    .line 873
    .end local v1    # "i":I
    :cond_51
    if-le p3, v0, :cond_3a

    .line 874
    move p3, v0

    goto :goto_3a

    .restart local v1    # "i":I
    :cond_55
    move v2, p3

    .line 881
    goto :goto_6
.end method
