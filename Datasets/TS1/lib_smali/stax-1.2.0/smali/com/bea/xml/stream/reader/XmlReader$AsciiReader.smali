.class final Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;
.super Lcom/bea/xml/stream/reader/XmlReader$BaseReader;
.source "XmlReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bea/xml/stream/reader/XmlReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "AsciiReader"
.end annotation


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 791
    invoke-direct {p0, p1}, Lcom/bea/xml/stream/reader/XmlReader$BaseReader;-><init>(Ljava/io/InputStream;)V

    return-void
.end method


# virtual methods
.method public getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 793
    const-string v0, "US-ASCII"

    return-object v0
.end method

.method public read([CII)I
    .registers 12
    .param p1, "buf"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v3, -0x1

    .line 797
    iget-object v4, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->instream:Ljava/io/InputStream;

    if-nez v4, :cond_7

    .line 836
    :goto_6
    return v3

    .line 803
    :cond_7
    add-int v4, p2, p3

    array-length v5, p1

    if-gt v4, v5, :cond_e

    if-gez p2, :cond_14

    .line 804
    :cond_e
    new-instance v3, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v3}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>()V

    throw v3

    .line 811
    :cond_14
    iget v4, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->finish:I

    iget v5, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->start:I

    sub-int v0, v4, v5

    .line 812
    .local v0, "avail":I
    const/4 v4, 0x1

    if-ge v0, v4, :cond_68

    .line 813
    iput v7, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->start:I

    .line 814
    iget-object v4, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->instream:Ljava/io/InputStream;

    iget-object v5, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->buffer:[B

    iget-object v6, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->buffer:[B

    array-length v6, v6

    invoke-virtual {v4, v5, v7, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v4

    iput v4, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->finish:I

    .line 815
    iget v4, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->finish:I

    if-gtz v4, :cond_34

    .line 816
    invoke-virtual {p0}, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->close()V

    goto :goto_6

    .line 819
    :cond_34
    iget v3, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->finish:I

    if-le p3, v3, :cond_3a

    .line 820
    iget p3, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->finish:I

    .line 828
    :cond_3a
    :goto_3a
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3b
    if-ge v2, p3, :cond_74

    .line 829
    iget-object v3, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->buffer:[B

    iget v4, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->start:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/bea/xml/stream/reader/XmlReader$AsciiReader;->start:I

    aget-byte v1, v3, v4

    .line 830
    .local v1, "c":I
    if-gez v1, :cond_6c

    .line 831
    new-instance v3, Ljava/io/CharConversionException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Illegal ASCII character, 0x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    and-int/lit16 v5, v1, 0xff

    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/CharConversionException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 823
    .end local v1    # "c":I
    .end local v2    # "i":I
    :cond_68
    if-le p3, v0, :cond_3a

    .line 824
    move p3, v0

    goto :goto_3a

    .line 834
    .restart local v1    # "c":I
    .restart local v2    # "i":I
    :cond_6c
    add-int v3, p2, v2

    int-to-char v4, v1

    aput-char v4, p1, v3

    .line 828
    add-int/lit8 v2, v2, 0x1

    goto :goto_3b

    .end local v1    # "c":I
    :cond_74
    move v3, p3

    .line 836
    goto :goto_6
.end method
