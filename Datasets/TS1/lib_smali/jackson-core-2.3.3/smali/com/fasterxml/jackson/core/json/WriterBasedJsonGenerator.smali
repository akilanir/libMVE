.class public final Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;
.super Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;
.source "WriterBasedJsonGenerator.java"


# static fields
.field protected static final HEX_CHARS:[C

.field protected static final SHORT_WRITE:I = 0x20


# instance fields
.field protected _currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

.field protected _entityBuffer:[C

.field protected _outputBuffer:[C

.field protected _outputEnd:I

.field protected _outputHead:I

.field protected _outputTail:I

.field protected final _writer:Ljava/io/Writer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    invoke-static {}, Lcom/fasterxml/jackson/core/io/CharTypes;->copyHexChars()[C

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    return-void
.end method

.method public constructor <init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/ObjectCodec;Ljava/io/Writer;)V
    .registers 6

    .prologue
    const/4 v0, 0x0

    .line 74
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;-><init>(Lcom/fasterxml/jackson/core/io/IOContext;ILcom/fasterxml/jackson/core/ObjectCodec;)V

    .line 38
    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 44
    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 75
    iput-object p4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    .line 76
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/io/IOContext;->allocConcatBuffer()[C

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 77
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    array-length v0, v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    .line 78
    return-void
.end method

.method private _allocateEntityBuffer()[C
    .registers 6

    .prologue
    const/16 v4, 0x75

    const/16 v3, 0x30

    const/16 v2, 0x5c

    .line 1889
    const/16 v0, 0xe

    new-array v0, v0, [C

    .line 1891
    const/4 v1, 0x0

    aput-char v2, v0, v1

    .line 1893
    const/4 v1, 0x2

    aput-char v2, v0, v1

    .line 1894
    const/4 v1, 0x3

    aput-char v4, v0, v1

    .line 1895
    const/4 v1, 0x4

    aput-char v3, v0, v1

    .line 1896
    const/4 v1, 0x5

    aput-char v3, v0, v1

    .line 1898
    const/16 v1, 0x8

    aput-char v2, v0, v1

    .line 1899
    const/16 v1, 0x9

    aput-char v4, v0, v1

    .line 1900
    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1901
    return-object v0
.end method

.method private _appendCharacterEscape(CI)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x5c

    const/16 v4, 0x30

    .line 1837
    if-ltz p2, :cond_27

    .line 1838
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_11

    .line 1839
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1841
    :cond_11
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 1842
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    int-to-char v2, p2

    aput-char v2, v0, v1

    .line 1885
    :goto_26
    return-void

    .line 1845
    :cond_27
    const/4 v0, -0x2

    if-eq p2, v0, :cond_82

    .line 1846
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_35

    .line 1847
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1849
    :cond_35
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1850
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 1851
    add-int/lit8 v2, v0, 0x1

    aput-char v3, v1, v0

    .line 1852
    add-int/lit8 v0, v2, 0x1

    const/16 v3, 0x75

    aput-char v3, v1, v2

    .line 1854
    const/16 v2, 0xff

    if-le p1, v2, :cond_79

    .line 1855
    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    .line 1856
    add-int/lit8 v3, v0, 0x1

    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v5, v2, 0x4

    aget-char v4, v4, v5

    aput-char v4, v1, v0

    .line 1857
    add-int/lit8 v0, v3, 0x1

    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v2, v2, 0xf

    aget-char v2, v4, v2

    aput-char v2, v1, v3

    .line 1858
    and-int/lit16 v2, p1, 0xff

    int-to-char p1, v2

    .line 1863
    :goto_62
    add-int/lit8 v2, v0, 0x1

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v4, p1, 0x4

    aget-char v3, v3, v4

    aput-char v3, v1, v0

    .line 1864
    add-int/lit8 v0, v2, 0x1

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v4, p1, 0xf

    aget-char v3, v3, v4

    aput-char v3, v1, v2

    .line 1865
    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_26

    .line 1860
    :cond_79
    add-int/lit8 v2, v0, 0x1

    aput-char v4, v1, v0

    .line 1861
    add-int/lit8 v0, v2, 0x1

    aput-char v4, v1, v2

    goto :goto_62

    .line 1869
    :cond_82
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-nez v0, :cond_a9

    .line 1870
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v0

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1875
    :goto_90
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1876
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v2, v1

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v2, v3, :cond_b3

    .line 1877
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1878
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_b3

    .line 1879
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_26

    .line 1872
    :cond_a9
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1873
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    goto :goto_90

    .line 1883
    :cond_b3
    const/4 v2, 0x0

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {v0, v2, v1, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 1884
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto/16 :goto_26
.end method

.method private _prependOrWriteCharacterEscape([CIICI)I
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x30

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    const/4 v6, 0x6

    .line 1757
    if-ltz p5, :cond_29

    .line 1758
    if-le p2, v3, :cond_18

    if-ge p2, p3, :cond_18

    .line 1759
    add-int/lit8 p2, p2, -0x2

    .line 1760
    const/16 v0, 0x5c

    aput-char v0, p1, p2

    .line 1761
    add-int/lit8 v0, p2, 0x1

    int-to-char v1, p5

    aput-char v1, p1, v0

    .line 1827
    :goto_17
    return p2

    .line 1763
    :cond_18
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1764
    if-nez v0, :cond_20

    .line 1765
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_allocateEntityBuffer()[C

    move-result-object v0

    .line 1767
    :cond_20
    int-to-char v1, p5

    aput-char v1, v0, v3

    .line 1768
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v1, v0, v2, v4}, Ljava/io/Writer;->write([CII)V

    goto :goto_17

    .line 1772
    :cond_29
    const/4 v0, -0x2

    if-eq p5, v0, :cond_db

    .line 1773
    const/4 v0, 0x5

    if-le p2, v0, :cond_7c

    if-ge p2, p3, :cond_7c

    .line 1774
    add-int/lit8 v0, p2, -0x6

    .line 1775
    add-int/lit8 v1, v0, 0x1

    const/16 v2, 0x5c

    aput-char v2, p1, v0

    .line 1776
    add-int/lit8 v0, v1, 0x1

    const/16 v2, 0x75

    aput-char v2, p1, v1

    .line 1778
    const/16 v1, 0xff

    if-le p4, v1, :cond_73

    .line 1779
    shr-int/lit8 v1, p4, 0x8

    and-int/lit16 v1, v1, 0xff

    .line 1780
    add-int/lit8 v2, v0, 0x1

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v4, v1, 0x4

    aget-char v3, v3, v4

    aput-char v3, p1, v0

    .line 1781
    add-int/lit8 v0, v2, 0x1

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v1, v1, 0xf

    aget-char v1, v3, v1

    aput-char v1, p1, v2

    .line 1782
    and-int/lit16 v1, p4, 0xff

    int-to-char p4, v1

    .line 1787
    :goto_5e
    add-int/lit8 v1, v0, 0x1

    sget-object v2, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v3, p4, 0x4

    aget-char v2, v2, v3

    aput-char v2, p1, v0

    .line 1788
    sget-object v0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v2, p4, 0xf

    aget-char v0, v0, v2

    aput-char v0, p1, v1

    .line 1789
    add-int/lit8 p2, v1, -0x5

    goto :goto_17

    .line 1784
    :cond_73
    add-int/lit8 v1, v0, 0x1

    aput-char v5, p1, v0

    .line 1785
    add-int/lit8 v0, v1, 0x1

    aput-char v5, p1, v1

    goto :goto_5e

    .line 1792
    :cond_7c
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1793
    if-nez v0, :cond_84

    .line 1794
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_allocateEntityBuffer()[C

    move-result-object v0

    .line 1796
    :cond_84
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1797
    const/16 v1, 0xff

    if-le p4, v1, :cond_c3

    .line 1798
    shr-int/lit8 v1, p4, 0x8

    and-int/lit16 v1, v1, 0xff

    .line 1799
    and-int/lit16 v2, p4, 0xff

    .line 1800
    const/16 v3, 0xa

    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v5, v1, 0x4

    aget-char v4, v4, v5

    aput-char v4, v0, v3

    .line 1801
    const/16 v3, 0xb

    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v1, v1, 0xf

    aget-char v1, v4, v1

    aput-char v1, v0, v3

    .line 1802
    const/16 v1, 0xc

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v4, v2, 0x4

    aget-char v3, v3, v4

    aput-char v3, v0, v1

    .line 1803
    const/16 v1, 0xd

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v2, v2, 0xf

    aget-char v2, v3, v2

    aput-char v2, v0, v1

    .line 1804
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    const/16 v2, 0x8

    invoke-virtual {v1, v0, v2, v6}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_17

    .line 1806
    :cond_c3
    sget-object v1, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v2, p4, 0x4

    aget-char v1, v1, v2

    aput-char v1, v0, v6

    .line 1807
    const/4 v1, 0x7

    sget-object v2, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v3, p4, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 1808
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v1, v0, v4, v6}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_17

    .line 1814
    :cond_db
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-nez v0, :cond_f7

    .line 1815
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    invoke-virtual {v0, p4}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v0

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1820
    :goto_e9
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1821
    if-lt p2, v1, :cond_101

    if-ge p2, p3, :cond_101

    .line 1822
    sub-int/2addr p2, v1

    .line 1823
    invoke-virtual {v0, v2, v1, p1, p2}, Ljava/lang/String;->getChars(II[CI)V

    goto/16 :goto_17

    .line 1817
    :cond_f7
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1818
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    goto :goto_e9

    .line 1825
    :cond_101
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_17
.end method

.method private _prependOrWriteCharacterEscape(CI)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x5c

    const/16 v3, 0x30

    const/4 v5, 0x0

    const/4 v4, 0x2

    const/4 v6, 0x6

    .line 1666
    if-ltz p2, :cond_35

    .line 1667
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v0, v4, :cond_1f

    .line 1668
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, -0x2

    .line 1669
    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1670
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    add-int/lit8 v2, v0, 0x1

    aput-char v7, v1, v0

    .line 1671
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    int-to-char v1, p2

    aput-char v1, v0, v2

    .line 1744
    :goto_1e
    return-void

    .line 1675
    :cond_1f
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1676
    if-nez v0, :cond_27

    .line 1677
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_allocateEntityBuffer()[C

    move-result-object v0

    .line 1679
    :cond_27
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1680
    const/4 v1, 0x1

    int-to-char v2, p2

    aput-char v2, v0, v1

    .line 1681
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v1, v0, v5, v4}, Ljava/io/Writer;->write([CII)V

    goto :goto_1e

    .line 1684
    :cond_35
    const/4 v0, -0x2

    if-eq p2, v0, :cond_e8

    .line 1685
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v0, v6, :cond_89

    .line 1686
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 1687
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, -0x6

    .line 1688
    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1689
    aput-char v7, v1, v0

    .line 1690
    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x75

    aput-char v2, v1, v0

    .line 1692
    const/16 v2, 0xff

    if-le p1, v2, :cond_80

    .line 1693
    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    .line 1694
    add-int/lit8 v0, v0, 0x1

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v4, v2, 0x4

    aget-char v3, v3, v4

    aput-char v3, v1, v0

    .line 1695
    add-int/lit8 v0, v0, 0x1

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v2, v2, 0xf

    aget-char v2, v3, v2

    aput-char v2, v1, v0

    .line 1696
    and-int/lit16 v2, p1, 0xff

    int-to-char p1, v2

    .line 1701
    :goto_6b
    add-int/lit8 v0, v0, 0x1

    sget-object v2, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v3, p1, 0x4

    aget-char v2, v2, v3

    aput-char v2, v1, v0

    .line 1702
    add-int/lit8 v0, v0, 0x1

    sget-object v2, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v2, v2, v3

    aput-char v2, v1, v0

    goto :goto_1e

    .line 1698
    :cond_80
    add-int/lit8 v0, v0, 0x1

    aput-char v3, v1, v0

    .line 1699
    add-int/lit8 v0, v0, 0x1

    aput-char v3, v1, v0

    goto :goto_6b

    .line 1706
    :cond_89
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_entityBuffer:[C

    .line 1707
    if-nez v0, :cond_91

    .line 1708
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_allocateEntityBuffer()[C

    move-result-object v0

    .line 1710
    :cond_91
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1711
    const/16 v1, 0xff

    if-le p1, v1, :cond_d0

    .line 1712
    shr-int/lit8 v1, p1, 0x8

    and-int/lit16 v1, v1, 0xff

    .line 1713
    and-int/lit16 v2, p1, 0xff

    .line 1714
    const/16 v3, 0xa

    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v5, v1, 0x4

    aget-char v4, v4, v5

    aput-char v4, v0, v3

    .line 1715
    const/16 v3, 0xb

    sget-object v4, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v1, v1, 0xf

    aget-char v1, v4, v1

    aput-char v1, v0, v3

    .line 1716
    const/16 v1, 0xc

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v4, v2, 0x4

    aget-char v3, v3, v4

    aput-char v3, v0, v1

    .line 1717
    const/16 v1, 0xd

    sget-object v3, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v2, v2, 0xf

    aget-char v2, v3, v2

    aput-char v2, v0, v1

    .line 1718
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    const/16 v2, 0x8

    invoke-virtual {v1, v0, v2, v6}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_1e

    .line 1720
    :cond_d0
    sget-object v1, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    shr-int/lit8 v2, p1, 0x4

    aget-char v1, v1, v2

    aput-char v1, v0, v6

    .line 1721
    const/4 v1, 0x7

    sget-object v2, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->HEX_CHARS:[C

    and-int/lit8 v3, p1, 0xf

    aget-char v2, v2, v3

    aput-char v2, v0, v1

    .line 1722
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v1, v0, v4, v6}, Ljava/io/Writer;->write([CII)V

    goto/16 :goto_1e

    .line 1728
    :cond_e8
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-nez v0, :cond_10a

    .line 1729
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    invoke-virtual {v0, p1}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v0

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1734
    :goto_f6
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    .line 1735
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v2, v1, :cond_114

    .line 1736
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v2, v1

    .line 1737
    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1738
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v0, v5, v1, v3, v2}, Ljava/lang/String;->getChars(II[CI)V

    goto/16 :goto_1e

    .line 1731
    :cond_10a
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 1732
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    goto :goto_f6

    .line 1742
    :cond_114
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1743
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_1e
.end method

.method private _readMore(Ljava/io/InputStream;[BIII)I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1610
    const/4 v0, 0x0

    .line 1611
    :goto_1
    if-ge p3, p4, :cond_e

    .line 1612
    add-int/lit8 v1, v0, 0x1

    add-int/lit8 v2, p3, 0x1

    aget-byte v3, p2, p3

    aput-byte v3, p2, v0

    move v0, v1

    move p3, v2

    goto :goto_1

    .line 1616
    :cond_e
    array-length v1, p2

    invoke-static {p5, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 1619
    :cond_13
    sub-int v2, v1, v0

    .line 1620
    if-nez v2, :cond_18

    .line 1629
    :cond_17
    :goto_17
    return v0

    .line 1623
    :cond_18
    invoke-virtual {p1, p2, v0, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 1624
    if-ltz v2, :cond_17

    .line 1627
    add-int/2addr v0, v2

    .line 1628
    const/4 v2, 0x3

    if-lt v0, v2, :cond_13

    goto :goto_17
.end method

.method private _writeLongString(Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1002
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1005
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    move v0, v1

    .line 1008
    :cond_9
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    .line 1009
    add-int v4, v0, v2

    if-le v4, v3, :cond_11

    sub-int v2, v3, v0

    .line 1011
    :cond_11
    add-int v4, v0, v2

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {p1, v0, v4, v5, v1}, Ljava/lang/String;->getChars(II[CI)V

    .line 1012
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    if-eqz v4, :cond_23

    .line 1013
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeSegmentCustom(I)V

    .line 1019
    :goto_1f
    add-int/2addr v0, v2

    .line 1020
    if-lt v0, v3, :cond_9

    .line 1021
    return-void

    .line 1014
    :cond_23
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    if-eqz v4, :cond_2d

    .line 1015
    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    invoke-direct {p0, v2, v4}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeSegmentASCII(II)V

    goto :goto_1f

    .line 1017
    :cond_2d
    invoke-direct {p0, v2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeSegment(I)V

    goto :goto_1f
.end method

.method private _writeNull()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x6c

    .line 1640
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x4

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_d

    .line 1641
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1643
    :cond_d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1644
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 1645
    const/16 v2, 0x6e

    aput-char v2, v1, v0

    .line 1646
    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x75

    aput-char v2, v1, v0

    .line 1647
    add-int/lit8 v0, v0, 0x1

    aput-char v3, v1, v0

    .line 1648
    add-int/lit8 v0, v0, 0x1

    aput-char v3, v1, v0

    .line 1649
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1650
    return-void
.end method

.method private _writeQuotedInt(I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 621
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0xd

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_d

    .line 622
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 624
    :cond_d
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 625
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 626
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 627
    return-void
.end method

.method private _writeQuotedLong(J)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 646
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x17

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_d

    .line 647
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 649
    :cond_d
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 650
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputLong(J[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 651
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 652
    return-void
.end method

.method private _writeQuotedRaw(Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 734
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_b

    .line 735
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 737
    :cond_b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 738
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 739
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_25

    .line 740
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 742
    :cond_25
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 743
    return-void
.end method

.method private _writeQuotedShort(S)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 596
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x8

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_d

    .line 597
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 599
    :cond_d
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 600
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 601
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 602
    return-void
.end method

.method private _writeSegment(I)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 1035
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1036
    array-length v7, v6

    .line 1038
    const/4 v0, 0x0

    move v1, v0

    .line 1042
    :goto_5
    if-ge v0, p1, :cond_1e

    .line 1046
    :cond_7
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    aget-char v4, v2, v0

    .line 1047
    if-ge v4, v7, :cond_1f

    aget v2, v6, v4

    if-eqz v2, :cond_1f

    .line 1059
    :goto_11
    sub-int v2, v0, v1

    .line 1060
    if-lez v2, :cond_24

    .line 1061
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v3, v5, v1, v2}, Ljava/io/Writer;->write([CII)V

    .line 1062
    if-lt v0, p1, :cond_24

    .line 1070
    :cond_1e
    return-void

    .line 1050
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    if-lt v0, p1, :cond_7

    goto :goto_11

    .line 1066
    :cond_24
    add-int/lit8 v2, v0, 0x1

    .line 1068
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    aget v5, v6, v4

    move-object v0, p0

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape([CIICI)I

    move-result v0

    move v1, v0

    move v0, v2

    .line 1069
    goto :goto_5
.end method

.method private _writeSegmentASCII(II)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 1184
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1185
    array-length v1, v6

    add-int/lit8 v2, p2, 0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v7

    move v2, v0

    move v1, v0

    .line 1192
    :goto_c
    if-ge v1, p1, :cond_25

    .line 1196
    :cond_e
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    aget-char v4, v3, v1

    .line 1197
    if-ge v4, v7, :cond_26

    .line 1198
    aget v5, v6, v4

    .line 1199
    if-eqz v5, :cond_2a

    .line 1210
    :goto_18
    sub-int v0, v1, v2

    .line 1211
    if-lez v0, :cond_31

    .line 1212
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v3, v8, v2, v0}, Ljava/io/Writer;->write([CII)V

    .line 1213
    if-lt v1, p1, :cond_31

    .line 1220
    :cond_25
    return-void

    .line 1202
    :cond_26
    if-le v4, p2, :cond_2b

    .line 1203
    const/4 v5, -0x1

    .line 1204
    goto :goto_18

    :cond_2a
    move v0, v5

    .line 1206
    :cond_2b
    add-int/lit8 v1, v1, 0x1

    if-lt v1, p1, :cond_e

    move v5, v0

    .line 1207
    goto :goto_18

    .line 1217
    :cond_31
    add-int/lit8 v2, v1, 0x1

    .line 1218
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    move-object v0, p0

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape([CIICI)I

    move-result v0

    move v1, v2

    move v2, v0

    move v0, v5

    .line 1219
    goto :goto_c
.end method

.method private _writeSegmentCustom(I)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1335
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1336
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    const/4 v2, 0x1

    if-ge v0, v2, :cond_31

    const v0, 0xffff

    move v6, v0

    .line 1337
    :goto_c
    array-length v0, v7

    add-int/lit8 v2, v6, 0x1

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v8

    .line 1338
    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    move v2, v1

    move v0, v1

    .line 1345
    :goto_17
    if-ge v1, p1, :cond_30

    .line 1349
    :cond_19
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    aget-char v4, v3, v1

    .line 1350
    if-ge v4, v8, :cond_35

    .line 1351
    aget v5, v7, v4

    .line 1352
    if-eqz v5, :cond_43

    .line 1368
    :goto_23
    sub-int v0, v1, v2

    .line 1369
    if-lez v0, :cond_4a

    .line 1370
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v10, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v3, v10, v2, v0}, Ljava/io/Writer;->write([CII)V

    .line 1371
    if-lt v1, p1, :cond_4a

    .line 1378
    :cond_30
    return-void

    .line 1336
    :cond_31
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    move v6, v0

    goto :goto_c

    .line 1355
    :cond_35
    if-le v4, v6, :cond_39

    .line 1356
    const/4 v5, -0x1

    .line 1357
    goto :goto_23

    .line 1359
    :cond_39
    invoke-virtual {v9, v4}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v3

    iput-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-eqz v3, :cond_44

    .line 1360
    const/4 v5, -0x2

    .line 1361
    goto :goto_23

    :cond_43
    move v0, v5

    .line 1364
    :cond_44
    add-int/lit8 v1, v1, 0x1

    if-lt v1, p1, :cond_19

    move v5, v0

    .line 1365
    goto :goto_23

    .line 1375
    :cond_4a
    add-int/lit8 v2, v1, 0x1

    .line 1376
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    move-object v0, p0

    move v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape([CIICI)I

    move-result v0

    move v1, v2

    move v2, v0

    move v0, v5

    .line 1377
    goto :goto_17
.end method

.method private _writeString(Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 934
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 935
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v0, v1, :cond_c

    .line 936
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeLongString(Ljava/lang/String;)V

    .line 954
    :goto_b
    return-void

    .line 942
    :cond_c
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v1, v0

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v1, v2, :cond_16

    .line 943
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 945
    :cond_16
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v1, v0, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 947
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    if-eqz v1, :cond_26

    .line 948
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeStringCustom(I)V

    goto :goto_b

    .line 949
    :cond_26
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    if-eqz v1, :cond_30

    .line 950
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    invoke-direct {p0, v0, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeStringASCII(II)V

    goto :goto_b

    .line 952
    :cond_30
    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString2(I)V

    goto :goto_b
.end method

.method private _writeString([CII)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 1079
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    if-eqz v0, :cond_8

    .line 1080
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeStringCustom([CII)V

    .line 1131
    :cond_7
    :goto_7
    return-void

    .line 1083
    :cond_8
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    if-eqz v0, :cond_12

    .line 1084
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeStringASCII([CIII)V

    goto :goto_7

    .line 1092
    :cond_12
    add-int v2, p3, p2

    .line 1093
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1094
    array-length v4, v3

    move v1, p2

    .line 1095
    :goto_18
    if-ge v1, v2, :cond_7

    move v0, v1

    .line 1099
    :cond_1b
    aget-char v5, p1, v0

    .line 1100
    if-ge v5, v4, :cond_4d

    aget v5, v3, v5

    if-eqz v5, :cond_4d

    .line 1109
    :goto_23
    sub-int v5, v0, v1

    .line 1110
    const/16 v6, 0x20

    if-ge v5, v6, :cond_52

    .line 1112
    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v6, v5

    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v6, v7, :cond_33

    .line 1113
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1115
    :cond_33
    if-lez v5, :cond_41

    .line 1116
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v1, v6, v7, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1117
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v1, v5

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1124
    :cond_41
    :goto_41
    if-ge v0, v2, :cond_7

    .line 1128
    add-int/lit8 v1, v0, 0x1

    aget-char v0, p1, v0

    .line 1129
    aget v5, v3, v0

    invoke-direct {p0, v0, v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_appendCharacterEscape(CI)V

    goto :goto_18

    .line 1103
    :cond_4d
    add-int/lit8 v0, v0, 0x1

    if-lt v0, v2, :cond_1b

    goto :goto_23

    .line 1120
    :cond_52
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1121
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v6, p1, v1, v5}, Ljava/io/Writer;->write([CII)V

    goto :goto_41
.end method

.method private _writeString2(I)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 960
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, p1

    .line 961
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 962
    array-length v2, v1

    .line 965
    :goto_6
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-ge v3, v0, :cond_3e

    .line 969
    :cond_a
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aget-char v3, v3, v4

    .line 970
    if-ge v3, v2, :cond_36

    aget v3, v1, v3

    if-eqz v3, :cond_36

    .line 982
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    sub-int/2addr v3, v4

    .line 983
    if-lez v3, :cond_26

    .line 984
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    invoke-virtual {v4, v5, v6, v3}, Ljava/io/Writer;->write([CII)V

    .line 989
    :cond_26
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v5, v4, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aget-char v3, v3, v4

    .line 990
    aget v4, v1, v3

    invoke-direct {p0, v3, v4}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape(CI)V

    goto :goto_6

    .line 973
    :cond_36
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v3, v0, :cond_a

    .line 992
    :cond_3e
    return-void
.end method

.method private _writeStringASCII(II)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 1147
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int v1, v0, p1

    .line 1148
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1149
    array-length v0, v2

    add-int/lit8 v3, p2, 0x1

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1153
    :goto_d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-ge v0, v1, :cond_43

    .line 1158
    :cond_11
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aget-char v4, v0, v4

    .line 1159
    if-ge v4, v3, :cond_37

    .line 1160
    aget v0, v2, v4

    .line 1161
    if-eqz v0, :cond_3b

    .line 1172
    :goto_1d
    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    sub-int/2addr v5, v6

    .line 1173
    if-lez v5, :cond_2d

    .line 1174
    iget-object v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    invoke-virtual {v6, v7, v8, v5}, Ljava/io/Writer;->write([CII)V

    .line 1176
    :cond_2d
    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1177
    invoke-direct {p0, v4, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape(CI)V

    goto :goto_d

    .line 1164
    :cond_37
    if-le v4, p2, :cond_3b

    .line 1165
    const/4 v0, -0x1

    .line 1166
    goto :goto_1d

    .line 1168
    :cond_3b
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v0, v1, :cond_11

    .line 1179
    :cond_43
    return-void
.end method

.method private _writeStringASCII([CIII)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 1226
    add-int v3, p3, p2

    .line 1227
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1228
    array-length v0, v4

    add-int/lit8 v1, p4, 0x1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 1230
    const/4 v0, 0x0

    move v2, p2

    .line 1232
    :goto_d
    if-ge v2, v3, :cond_38

    move v1, v2

    .line 1237
    :cond_10
    aget-char v6, p1, v1

    .line 1238
    if-ge v6, v5, :cond_39

    .line 1239
    aget v0, v4, v6

    .line 1240
    if-eqz v0, :cond_3d

    .line 1253
    :goto_18
    sub-int v7, v1, v2

    .line 1254
    const/16 v8, 0x20

    if-ge v7, v8, :cond_42

    .line 1256
    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v8, v7

    iget v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v8, v9, :cond_28

    .line 1257
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1259
    :cond_28
    if-lez v7, :cond_36

    .line 1260
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v2, v8, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1261
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v2, v7

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1268
    :cond_36
    :goto_36
    if-lt v1, v3, :cond_4b

    .line 1275
    :cond_38
    return-void

    .line 1243
    :cond_39
    if-le v6, p4, :cond_3d

    .line 1244
    const/4 v0, -0x1

    .line 1245
    goto :goto_18

    .line 1247
    :cond_3d
    add-int/lit8 v1, v1, 0x1

    if-lt v1, v3, :cond_10

    goto :goto_18

    .line 1264
    :cond_42
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1265
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v8, p1, v2, v7}, Ljava/io/Writer;->write([CII)V

    goto :goto_36

    .line 1272
    :cond_4b
    add-int/lit8 v2, v1, 0x1

    .line 1273
    invoke-direct {p0, v6, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_appendCharacterEscape(CI)V

    goto :goto_d
.end method

.method private _writeStringCustom(I)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 1291
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int v2, v0, p1

    .line 1292
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1293
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_41

    const v0, 0xffff

    .line 1294
    :goto_e
    array-length v1, v3

    add-int/lit8 v4, v0, 0x1

    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 1296
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    .line 1299
    :goto_17
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-ge v1, v2, :cond_5a

    .line 1304
    :cond_1b
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aget-char v6, v1, v6

    .line 1305
    if-ge v6, v4, :cond_44

    .line 1306
    aget v1, v3, v6

    .line 1307
    if-eqz v1, :cond_52

    .line 1323
    :goto_27
    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    sub-int/2addr v7, v8

    .line 1324
    if-lez v7, :cond_37

    .line 1325
    iget-object v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v10, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    invoke-virtual {v8, v9, v10, v7}, Ljava/io/Writer;->write([CII)V

    .line 1327
    :cond_37
    iget v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1328
    invoke-direct {p0, v6, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_prependOrWriteCharacterEscape(CI)V

    goto :goto_17

    .line 1293
    :cond_41
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    goto :goto_e

    .line 1310
    :cond_44
    if-le v6, v0, :cond_48

    .line 1311
    const/4 v1, -0x1

    .line 1312
    goto :goto_27

    .line 1314
    :cond_48
    invoke-virtual {v5, v6}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v1

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-eqz v1, :cond_52

    .line 1315
    const/4 v1, -0x2

    .line 1316
    goto :goto_27

    .line 1319
    :cond_52
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-lt v1, v2, :cond_1b

    .line 1330
    :cond_5a
    return-void
.end method

.method private _writeStringCustom([CII)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 1383
    add-int v4, p3, p2

    .line 1384
    iget-object v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEscapes:[I

    .line 1385
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_43

    const v0, 0xffff

    .line 1386
    :goto_c
    array-length v1, v5

    add-int/lit8 v2, v0, 0x1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 1387
    iget-object v7, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_characterEscapes:Lcom/fasterxml/jackson/core/io/CharacterEscapes;

    .line 1389
    const/4 v1, 0x0

    move v3, p2

    .line 1391
    :goto_17
    if-ge v3, v4, :cond_42

    move v2, v3

    .line 1396
    :cond_1a
    aget-char v8, p1, v2

    .line 1397
    if-ge v8, v6, :cond_46

    .line 1398
    aget v1, v5, v8

    .line 1399
    if-eqz v1, :cond_54

    .line 1417
    :goto_22
    sub-int v9, v2, v3

    .line 1418
    const/16 v10, 0x20

    if-ge v9, v10, :cond_59

    .line 1420
    iget v10, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v10, v9

    iget v11, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v10, v11, :cond_32

    .line 1421
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1423
    :cond_32
    if-lez v9, :cond_40

    .line 1424
    iget-object v10, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v11, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v3, v10, v11, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1425
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v3, v9

    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1432
    :cond_40
    :goto_40
    if-lt v2, v4, :cond_62

    .line 1439
    :cond_42
    return-void

    .line 1385
    :cond_43
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_maximumNonEscapedChar:I

    goto :goto_c

    .line 1402
    :cond_46
    if-le v8, v0, :cond_4a

    .line 1403
    const/4 v1, -0x1

    .line 1404
    goto :goto_22

    .line 1406
    :cond_4a
    invoke-virtual {v7, v8}, Lcom/fasterxml/jackson/core/io/CharacterEscapes;->getEscapeSequence(I)Lcom/fasterxml/jackson/core/SerializableString;

    move-result-object v9

    iput-object v9, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_currentEscape:Lcom/fasterxml/jackson/core/SerializableString;

    if-eqz v9, :cond_54

    .line 1407
    const/4 v1, -0x2

    .line 1408
    goto :goto_22

    .line 1411
    :cond_54
    add-int/lit8 v2, v2, 0x1

    if-lt v2, v4, :cond_1a

    goto :goto_22

    .line 1428
    :cond_59
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1429
    iget-object v10, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v10, p1, v3, v9}, Ljava/io/Writer;->write([CII)V

    goto :goto_40

    .line 1436
    :cond_62
    add-int/lit8 v3, v2, 0x1

    .line 1437
    invoke-direct {p0, v8, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_appendCharacterEscape(CI)V

    goto :goto_17
.end method

.method private writeRawLong(Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 492
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int v1, v0, v1

    .line 494
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v5, v1, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 495
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 496
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 498
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v1

    .line 500
    :goto_1b
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-le v0, v2, :cond_32

    .line 501
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    .line 502
    add-int v3, v1, v2

    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {p1, v1, v3, v4, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 503
    iput v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 504
    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 505
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 506
    add-int/2addr v1, v2

    .line 507
    sub-int/2addr v0, v2

    .line 508
    goto :goto_1b

    .line 510
    :cond_32
    add-int v2, v1, v0

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {p1, v1, v2, v3, v5}, Ljava/lang/String;->getChars(II[CI)V

    .line 511
    iput v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 512
    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 513
    return-void
.end method


# virtual methods
.method protected _flushBuffer()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1906
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    sub-int/2addr v0, v1

    .line 1907
    if-lez v0, :cond_15

    .line 1908
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    .line 1909
    const/4 v2, 0x0

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputHead:I

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1910
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    invoke-virtual {v2, v3, v1, v0}, Ljava/io/Writer;->write([CII)V

    .line 1912
    :cond_15
    return-void
.end method

.method protected _releaseBuffers()V
    .registers 3

    .prologue
    .line 913
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 914
    if-eqz v0, :cond_c

    .line 915
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 916
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v1, v0}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseConcatBuffer([C)V

    .line 918
    :cond_c
    return-void
.end method

.method protected _verifyPrettyValueWrite(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 825
    packed-switch p2, :pswitch_data_36

    .line 844
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_throwInternal()V

    .line 847
    :cond_6
    :goto_6
    return-void

    .line 827
    :pswitch_7
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeArrayValueSeparator(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_6

    .line 830
    :pswitch_d
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeObjectFieldValueSeparator(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_6

    .line 833
    :pswitch_13
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeRootValueSeparator(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_6

    .line 837
    :pswitch_19
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->inArray()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 838
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->beforeArrayValues(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_6

    .line 839
    :cond_27
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->inObject()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 840
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->beforeObjectEntries(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_6

    .line 825
    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_19
        :pswitch_7
        :pswitch_d
        :pswitch_13
    .end packed-switch
.end method

.method protected _verifyValueWrite(Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 788
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeValue()I

    move-result v0

    .line 789
    const/4 v1, 0x5

    if-ne v0, v1, :cond_25

    .line 790
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Can not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", expecting field name"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 792
    :cond_25
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-nez v1, :cond_56

    .line 794
    packed-switch v0, :pswitch_data_5a

    .line 819
    :cond_2c
    :goto_2c
    return-void

    .line 796
    :pswitch_2d
    const/16 v0, 0x2c

    .line 810
    :goto_2f
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_38

    .line 811
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 813
    :cond_38
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v0, v1, v2

    .line 814
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_2c

    .line 799
    :pswitch_45
    const/16 v0, 0x3a

    .line 800
    goto :goto_2f

    .line 802
    :pswitch_48
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_rootValueSeparator:Lcom/fasterxml/jackson/core/SerializableString;

    if-eqz v0, :cond_2c

    .line 803
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_rootValueSeparator:Lcom/fasterxml/jackson/core/SerializableString;

    invoke-interface {v0}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    goto :goto_2c

    .line 818
    :cond_56
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyPrettyValueWrite(Ljava/lang/String;I)V

    goto :goto_2c

    .line 794
    :pswitch_data_5a
    .packed-switch 0x1
        :pswitch_2d
        :pswitch_45
        :pswitch_48
    .end packed-switch
.end method

.method protected _writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[B)I
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 1553
    .line 1555
    const/4 v0, -0x3

    .line 1559
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    add-int/lit8 v10, v1, -0x6

    .line 1560
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v1

    shr-int/lit8 v1, v1, 0x2

    move v9, v1

    move v8, v6

    move v4, v6

    move v3, v6

    .line 1564
    :goto_11
    if-le v3, v0, :cond_46

    .line 1565
    array-length v5, p3

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_readMore(Ljava/io/InputStream;[BIII)I

    move-result v4

    .line 1567
    const/4 v0, 0x3

    if-ge v4, v0, :cond_43

    .line 1589
    if-ge v6, v4, :cond_97

    .line 1590
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v0, v10, :cond_27

    .line 1591
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1593
    :cond_27
    aget-byte v0, p3, v6

    shl-int/lit8 v0, v0, 0x10

    .line 1595
    if-ge v7, v4, :cond_94

    .line 1596
    aget-byte v1, p3, v7

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v1, v0

    .line 1597
    const/4 v0, 0x2

    .line 1599
    :goto_35
    add-int v2, v8, v0

    .line 1600
    iget-object v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v1, v0, v3, v4}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Partial(II[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    move v0, v2

    .line 1602
    :goto_42
    return v0

    .line 1570
    :cond_43
    add-int/lit8 v0, v4, -0x3

    move v3, v6

    .line 1572
    :cond_46
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v1, v10, :cond_4d

    .line 1573
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1576
    :cond_4d
    add-int/lit8 v1, v3, 0x1

    aget-byte v2, p3, v3

    shl-int/lit8 v2, v2, 0x8

    .line 1577
    add-int/lit8 v5, v1, 0x1

    aget-byte v1, p3, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v1, v2

    .line 1578
    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v3, v5, 0x1

    aget-byte v2, p3, v5

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 1579
    add-int/lit8 v8, v8, 0x3

    .line 1580
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v1, v2, v5}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Chunk(I[CI)I

    move-result v1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1581
    add-int/lit8 v1, v9, -0x1

    if-gtz v1, :cond_91

    .line 1582
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v5, v2, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v5, 0x5c

    aput-char v5, v1, v2

    .line 1583
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v5, v2, 0x1

    iput v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v5, 0x6e

    aput-char v5, v1, v2

    .line 1584
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v1

    shr-int/lit8 v1, v1, 0x2

    :cond_91
    move v9, v1

    .line 1586
    goto/16 :goto_11

    :cond_94
    move v1, v0

    move v0, v7

    goto :goto_35

    :cond_97
    move v0, v8

    goto :goto_42
.end method

.method protected _writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[BI)I
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 1493
    const/4 v3, 0x0

    .line 1494
    const/4 v4, 0x0

    .line 1495
    const/4 v0, -0x3

    .line 1498
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    add-int/lit8 v7, v1, -0x6

    .line 1499
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v1

    shr-int/lit8 v1, v1, 0x2

    move v6, v1

    move v5, p4

    .line 1501
    :goto_f
    const/4 v1, 0x2

    if-le v5, v1, :cond_1f

    .line 1502
    if-le v3, v0, :cond_4f

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    .line 1503
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_readMore(Ljava/io/InputStream;[BIII)I

    move-result v4

    .line 1504
    const/4 v3, 0x0

    .line 1505
    const/4 v0, 0x3

    if-ge v4, v0, :cond_4d

    .line 1526
    :cond_1f
    if-lez v5, :cond_4c

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    .line 1527
    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_readMore(Ljava/io/InputStream;[BIII)I

    move-result v0

    .line 1528
    const/4 v1, 0x0

    .line 1529
    if-lez v0, :cond_4c

    .line 1530
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v2, v7, :cond_32

    .line 1531
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1533
    :cond_32
    const/4 v2, 0x1

    aget-byte v1, p3, v1

    shl-int/lit8 v1, v1, 0x10

    .line 1535
    if-ge v2, v0, :cond_9d

    .line 1536
    aget-byte v0, p3, v2

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    or-int/2addr v1, v0

    .line 1537
    const/4 v0, 0x2

    .line 1541
    :goto_41
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v1, v0, v2, v3}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Partial(II[CI)I

    move-result v1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1542
    sub-int/2addr v5, v0

    .line 1545
    :cond_4c
    return v5

    .line 1508
    :cond_4d
    add-int/lit8 v0, v4, -0x3

    .line 1510
    :cond_4f
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v1, v7, :cond_56

    .line 1511
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1513
    :cond_56
    add-int/lit8 v1, v3, 0x1

    aget-byte v2, p3, v3

    shl-int/lit8 v2, v2, 0x8

    .line 1514
    add-int/lit8 v8, v1, 0x1

    aget-byte v1, p3, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v1, v2

    .line 1515
    shl-int/lit8 v1, v1, 0x8

    add-int/lit8 v3, v8, 0x1

    aget-byte v2, p3, v8

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 1516
    add-int/lit8 v5, v5, -0x3

    .line 1517
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v8, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v1, v2, v8}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Chunk(I[CI)I

    move-result v1

    iput v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1518
    add-int/lit8 v1, v6, -0x1

    if-gtz v1, :cond_9a

    .line 1519
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v6, v2, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v6, 0x5c

    aput-char v6, v1, v2

    .line 1520
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v6, v2, 0x1

    iput v6, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v6, 0x6e

    aput-char v6, v1, v2

    .line 1521
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v1

    shr-int/lit8 v1, v1, 0x2

    :cond_9a
    move v6, v1

    .line 1523
    goto/16 :goto_f

    .line 1539
    :cond_9d
    const/4 v0, 0x1

    goto :goto_41
.end method

.method protected _writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;[BII)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 1451
    add-int/lit8 v1, p4, -0x3

    .line 1453
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    add-int/lit8 v2, v0, -0x6

    .line 1454
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v0

    shr-int/lit8 v0, v0, 0x2

    .line 1457
    :cond_c
    :goto_c
    if-gt p3, v1, :cond_58

    .line 1458
    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v3, v2, :cond_15

    .line 1459
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1462
    :cond_15
    add-int/lit8 v3, p3, 0x1

    aget-byte v4, p2, p3

    shl-int/lit8 v4, v4, 0x8

    .line 1463
    add-int/lit8 v5, v3, 0x1

    aget-byte v3, p2, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v3, v4

    .line 1464
    shl-int/lit8 v3, v3, 0x8

    add-int/lit8 p3, v5, 0x1

    aget-byte v4, p2, v5

    and-int/lit16 v4, v4, 0xff

    or-int/2addr v3, v4

    .line 1465
    iget-object v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v5, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v3, v4, v5}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Chunk(I[CI)I

    move-result v3

    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1466
    add-int/lit8 v0, v0, -0x1

    if-gtz v0, :cond_c

    .line 1468
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v4, 0x5c

    aput-char v4, v0, v3

    .line 1469
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v4, 0x6e

    aput-char v4, v0, v3

    .line 1470
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/Base64Variant;->getMaxLineLength()I

    move-result v0

    shr-int/lit8 v0, v0, 0x2

    goto :goto_c

    .line 1475
    :cond_58
    sub-int v1, p4, p3

    .line 1476
    if-lez v1, :cond_7f

    .line 1477
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    if-le v0, v2, :cond_63

    .line 1478
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 1480
    :cond_63
    add-int/lit8 v2, p3, 0x1

    aget-byte v0, p2, p3

    shl-int/lit8 v0, v0, 0x10

    .line 1481
    const/4 v3, 0x2

    if-ne v1, v3, :cond_75

    .line 1482
    add-int/lit8 v3, v2, 0x1

    aget-byte v2, p2, v2

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v0, v2

    .line 1484
    :cond_75
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/fasterxml/jackson/core/Base64Variant;->encodeBase64Partial(II[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 1486
    :cond_7f
    return-void
.end method

.method public _writeFieldName(Lcom/fasterxml/jackson/core/SerializableString;Z)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x22

    const/4 v4, 0x0

    .line 226
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_b

    .line 227
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writePPFieldName(Lcom/fasterxml/jackson/core/SerializableString;Z)V

    .line 261
    :goto_a
    return-void

    .line 231
    :cond_b
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_16

    .line 232
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 234
    :cond_16
    if-eqz p2, :cond_24

    .line 235
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x2c

    aput-char v2, v0, v1

    .line 240
    :cond_24
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedChars()[C

    move-result-object v0

    .line 241
    sget-object v1, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v1

    if-nez v1, :cond_35

    .line 242
    array-length v1, v0

    invoke-virtual {p0, v0, v4, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw([CII)V

    goto :goto_a

    .line 246
    :cond_35
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v5, v1, v2

    .line 248
    array-length v1, v0

    .line 249
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v2, v1

    add-int/lit8 v2, v2, 0x1

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v2, v3, :cond_60

    .line 250
    invoke-virtual {p0, v0, v4, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw([CII)V

    .line 252
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_55

    .line 253
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 255
    :cond_55
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v5, v0, v1

    goto :goto_a

    .line 257
    :cond_60
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {v0, v4, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 258
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 259
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v5, v0, v1

    goto :goto_a
.end method

.method protected _writeFieldName(Ljava/lang/String;Z)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 192
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_a

    .line 193
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writePPFieldName(Ljava/lang/String;Z)V

    .line 221
    :goto_9
    return-void

    .line 197
    :cond_a
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_15

    .line 198
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 200
    :cond_15
    if-eqz p2, :cond_23

    .line 201
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x2c

    aput-char v2, v0, v1

    .line 207
    :cond_23
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-nez v0, :cond_2f

    .line 208
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    goto :goto_9

    .line 213
    :cond_2f
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 215
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    .line 217
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_45

    .line 218
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 220
    :cond_45
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    goto :goto_9
.end method

.method protected _writePPFieldName(Lcom/fasterxml/jackson/core/SerializableString;Z)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x22

    const/4 v4, 0x0

    .line 294
    if-eqz p2, :cond_41

    .line 295
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeObjectEntrySeparator(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 300
    :goto_a
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedChars()[C

    move-result-object v0

    .line 301
    sget-object v1, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v1

    if-eqz v1, :cond_47

    .line 302
    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v1, v2, :cond_1f

    .line 303
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 305
    :cond_1f
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v5, v1, v2

    .line 306
    array-length v1, v0

    invoke-virtual {p0, v0, v4, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw([CII)V

    .line 307
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_36

    .line 308
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 310
    :cond_36
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v5, v0, v1

    .line 314
    :goto_40
    return-void

    .line 297
    :cond_41
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->beforeObjectEntries(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_a

    .line 312
    :cond_47
    array-length v1, v0

    invoke-virtual {p0, v0, v4, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw([CII)V

    goto :goto_40
.end method

.method protected _writePPFieldName(Ljava/lang/String;Z)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 270
    if-eqz p2, :cond_3b

    .line 271
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeObjectEntrySeparator(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 276
    :goto_9
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_FIELD_NAMES:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_41

    .line 277
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_1a

    .line 278
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 280
    :cond_1a
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 281
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    .line 282
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_30

    .line 283
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 285
    :cond_30
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 289
    :goto_3a
    return-void

    .line 273
    :cond_3b
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->beforeObjectEntries(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    goto :goto_9

    .line 287
    :cond_41
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    goto :goto_3a
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 871
    invoke-super {p0}, Lcom/fasterxml/jackson/core/json/JsonGeneratorImpl;->close()V

    .line 877
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    if-eqz v0, :cond_27

    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_JSON_CONTENT:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 880
    :goto_f
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->getOutputContext()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    .line 881
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inArray()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 882
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeEndArray()V

    goto :goto_f

    .line 883
    :cond_1d
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonStreamContext;->inObject()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 884
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeEndObject()V

    goto :goto_f

    .line 890
    :cond_27
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 898
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    if-eqz v0, :cond_43

    .line 899
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->isResourceManaged()Z

    move-result v0

    if-nez v0, :cond_3e

    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->AUTO_CLOSE_TARGET:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 900
    :cond_3e
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V

    .line 907
    :cond_43
    :goto_43
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_releaseBuffers()V

    .line 908
    return-void

    .line 901
    :cond_47
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->FLUSH_PASSED_TO_STREAM:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 903
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    goto :goto_43
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 859
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 860
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    if-eqz v0, :cond_14

    .line 861
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->FLUSH_PASSED_TO_STREAM:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 862
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 865
    :cond_14
    return-void
.end method

.method public getOutputTarget()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    return-object v0
.end method

.method public writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;I)I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x22

    .line 544
    const-string v0, "write binary value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 546
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_10

    .line 547
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 549
    :cond_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v4, v0, v1

    .line 550
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/io/IOContext;->allocBase64Buffer()[B

    move-result-object v1

    .line 553
    if-gez p3, :cond_3f

    .line 554
    :try_start_22
    invoke-virtual {p0, p1, p2, v1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[B)I
    :try_end_25
    .catchall {:try_start_22 .. :try_end_25} :catchall_6c

    move-result p3

    .line 563
    :cond_26
    :goto_26
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v0, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    .line 566
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_34

    .line 567
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 569
    :cond_34
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v4, v0, v1

    .line 570
    return p3

    .line 556
    :cond_3f
    :try_start_3f
    invoke-virtual {p0, p1, p2, v1, p3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;Ljava/io/InputStream;[BI)I

    move-result v0

    .line 557
    if-lez v0, :cond_26

    .line 558
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Too few bytes available: missing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " bytes (out of "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V
    :try_end_6b
    .catchall {:try_start_3f .. :try_end_6b} :catchall_6c

    goto :goto_26

    .line 563
    :catchall_6c
    move-exception v0

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_ioContext:Lcom/fasterxml/jackson/core/io/IOContext;

    invoke-virtual {v2, v1}, Lcom/fasterxml/jackson/core/io/IOContext;->releaseBase64Buffer([B)V

    throw v0
.end method

.method public writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;[BII)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 525
    const-string v0, "write binary value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 527
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_10

    .line 528
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 530
    :cond_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 531
    add-int v0, p3, p4

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeBinary(Lcom/fasterxml/jackson/core/Base64Variant;[BII)V

    .line 533
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_28

    .line 534
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 536
    :cond_28
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 537
    return-void
.end method

.method public writeBoolean(Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x65

    .line 749
    const-string v0, "write boolean value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 750
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x5

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_12

    .line 751
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 753
    :cond_12
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 754
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    .line 755
    if-eqz p1, :cond_31

    .line 756
    const/16 v2, 0x74

    aput-char v2, v1, v0

    .line 757
    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x72

    aput-char v2, v1, v0

    .line 758
    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x75

    aput-char v2, v1, v0

    .line 759
    add-int/lit8 v0, v0, 0x1

    aput-char v3, v1, v0

    .line 767
    :goto_2c
    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 768
    return-void

    .line 761
    :cond_31
    const/16 v2, 0x66

    aput-char v2, v1, v0

    .line 762
    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x61

    aput-char v2, v1, v0

    .line 763
    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x6c

    aput-char v2, v1, v0

    .line 764
    add-int/lit8 v0, v0, 0x1

    const/16 v2, 0x73

    aput-char v2, v1, v0

    .line 765
    add-int/lit8 v0, v0, 0x1

    aput-char v3, v1, v0

    goto :goto_2c
.end method

.method public writeEndArray()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 143
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->inArray()Z

    move-result v0

    if-nez v0, :cond_24

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current context not an ARRAY but "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 146
    :cond_24
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_3c

    .line 147
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getEntryCount()I

    move-result v1

    invoke-interface {v0, p0, v1}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeEndArray(Lcom/fasterxml/jackson/core/JsonGenerator;I)V

    .line 154
    :goto_33
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 155
    return-void

    .line 149
    :cond_3c
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_45

    .line 150
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 152
    :cond_45
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x5d

    aput-char v2, v0, v1

    goto :goto_33
.end method

.method public writeEndObject()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 175
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->inObject()Z

    move-result v0

    if-nez v0, :cond_24

    .line 176
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Current context not an object but "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getTypeDesc()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 178
    :cond_24
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_3c

    .line 179
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getEntryCount()I

    move-result v1

    invoke-interface {v0, p0, v1}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeEndObject(Lcom/fasterxml/jackson/core/JsonGenerator;I)V

    .line 186
    :goto_33
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->getParent()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 187
    return-void

    .line 181
    :cond_3c
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_45

    .line 182
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 184
    :cond_45
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x7d

    aput-char v2, v0, v1

    goto :goto_33
.end method

.method public writeFieldName(Lcom/fasterxml/jackson/core/SerializableString;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 112
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeFieldName(Ljava/lang/String;)I

    move-result v1

    .line 113
    const/4 v2, 0x4

    if-ne v1, v2, :cond_13

    .line 114
    const-string v2, "Can not write a field name, expecting a value"

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 116
    :cond_13
    if-ne v1, v0, :cond_19

    :goto_15
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeFieldName(Lcom/fasterxml/jackson/core/SerializableString;Z)V

    .line 117
    return-void

    .line 116
    :cond_19
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public writeFieldName(Ljava/lang/String;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 100
    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v1, p1}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->writeFieldName(Ljava/lang/String;)I

    move-result v1

    .line 101
    const/4 v2, 0x4

    if-ne v1, v2, :cond_f

    .line 102
    const-string v2, "Can not write a field name, expecting a value"

    invoke-virtual {p0, v2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportError(Ljava/lang/String;)V

    .line 104
    :cond_f
    if-ne v1, v0, :cond_15

    :goto_11
    invoke-virtual {p0, p1, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeFieldName(Ljava/lang/String;Z)V

    .line 105
    return-void

    .line 104
    :cond_15
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public writeNull()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 774
    const-string v0, "write null value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 775
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeNull()V

    .line 776
    return-void
.end method

.method public writeNumber(D)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 675
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-nez v0, :cond_18

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    if-nez v0, :cond_10

    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v0

    if-eqz v0, :cond_20

    :cond_10
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 679
    :cond_18
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeString(Ljava/lang/String;)V

    .line 685
    :goto_1f
    return-void

    .line 683
    :cond_20
    const-string v0, "write number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 684
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    goto :goto_1f
.end method

.method public writeNumber(F)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 691
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-nez v0, :cond_18

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_10

    invoke-static {p1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-eqz v0, :cond_20

    :cond_10
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->QUOTE_NON_NUMERIC_NUMBERS:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 695
    :cond_18
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeString(Ljava/lang/String;)V

    .line 701
    :goto_1f
    return-void

    .line 699
    :cond_20
    const-string v0, "write number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 700
    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    goto :goto_1f
.end method

.method public writeNumber(I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 608
    const-string v0, "write number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 609
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_d

    .line 610
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedInt(I)V

    .line 618
    :goto_c
    return-void

    .line 614
    :cond_d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0xb

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_18

    .line 615
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 617
    :cond_18
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_c
.end method

.method public writeNumber(J)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 633
    const-string v0, "write number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 634
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_d

    .line 635
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedLong(J)V

    .line 643
    :goto_c
    return-void

    .line 638
    :cond_d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x15

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_18

    .line 640
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 642
    :cond_18
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputLong(J[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_c
.end method

.method public writeNumber(Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 724
    const-string v0, "write number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 725
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_d

    .line 726
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedRaw(Ljava/lang/Object;)V

    .line 730
    :goto_c
    return-void

    .line 728
    :cond_d
    invoke-virtual {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    goto :goto_c
.end method

.method public writeNumber(Ljava/math/BigDecimal;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 708
    const-string v0, "write number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 709
    if-nez p1, :cond_b

    .line 710
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeNull()V

    .line 718
    :goto_a
    return-void

    .line 711
    :cond_b
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_13

    .line 712
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedRaw(Ljava/lang/Object;)V

    goto :goto_a

    .line 713
    :cond_13
    sget-object v0, Lcom/fasterxml/jackson/core/JsonGenerator$Feature;->WRITE_BIGDECIMAL_AS_PLAIN:Lcom/fasterxml/jackson/core/JsonGenerator$Feature;

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->isEnabled(Lcom/fasterxml/jackson/core/JsonGenerator$Feature;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 714
    invoke-virtual {p1}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    goto :goto_a

    .line 716
    :cond_23
    invoke-virtual {p1}, Ljava/math/BigDecimal;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    goto :goto_a
.end method

.method public writeNumber(Ljava/math/BigInteger;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 660
    const-string v0, "write number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 661
    if-nez p1, :cond_b

    .line 662
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeNull()V

    .line 668
    :goto_a
    return-void

    .line 663
    :cond_b
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_13

    .line 664
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedRaw(Ljava/lang/Object;)V

    goto :goto_a

    .line 666
    :cond_13
    invoke-virtual {p1}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    goto :goto_a
.end method

.method public writeNumber(S)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 583
    const-string v0, "write number"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 584
    iget-boolean v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgNumbersAsStrings:Z

    if-eqz v0, :cond_d

    .line 585
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeQuotedShort(S)V

    .line 593
    :goto_c
    return-void

    .line 589
    :cond_d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v0, v0, 0x6

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_18

    .line 590
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 592
    :cond_18
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, v0, v1}, Lcom/fasterxml/jackson/core/io/NumberOutput;->outputInt(I[CI)I

    move-result v0

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    goto :goto_c
.end method

.method public writeRaw(C)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 483
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_9

    .line 484
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 486
    :cond_9
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char p1, v0, v1

    .line 487
    return-void
.end method

.method public writeRaw(Lcom/fasterxml/jackson/core/SerializableString;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 457
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRaw(Ljava/lang/String;)V

    .line 458
    return-void
.end method

.method public writeRaw(Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 418
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 419
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v0, v2

    .line 421
    if-nez v0, :cond_13

    .line 422
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 423
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v0, v2

    .line 426
    :cond_13
    if-lt v0, v1, :cond_23

    .line 427
    const/4 v0, 0x0

    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, v0, v1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 428
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 432
    :goto_22
    return-void

    .line 430
    :cond_23
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRawLong(Ljava/lang/String;)V

    goto :goto_22
.end method

.method public writeRaw(Ljava/lang/String;II)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 439
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v0, v1

    .line 441
    if-ge v0, p3, :cond_f

    .line 442
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 443
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v0, v1

    .line 446
    :cond_f
    if-lt v0, p3, :cond_20

    .line 447
    add-int v0, p2, p3

    iget-object v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-virtual {p1, p2, v0, v1, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 448
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 452
    :goto_1f
    return-void

    .line 450
    :cond_20
    add-int v0, p2, p3

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->writeRawLong(Ljava/lang/String;)V

    goto :goto_1f
.end method

.method public writeRaw([CII)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 465
    const/16 v0, 0x20

    if-ge p3, v0, :cond_1b

    .line 466
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v0, v1

    .line 467
    if-le p3, v0, :cond_e

    .line 468
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 470
    :cond_e
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 471
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, p3

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 477
    :goto_1a
    return-void

    .line 475
    :cond_1b
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 476
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/Writer;->write([CII)V

    goto :goto_1a
.end method

.method public writeRawUTF8String([BII)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 396
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportUnsupportedOperation()V

    .line 397
    return-void
.end method

.method public writeStartArray()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 128
    const-string v0, "start an array"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 129
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->createChildArrayContext()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 130
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_17

    .line 131
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeStartArray(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 138
    :goto_16
    return-void

    .line 133
    :cond_17
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_20

    .line 134
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 136
    :cond_20
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x5b

    aput-char v2, v0, v1

    goto :goto_16
.end method

.method public writeStartObject()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 160
    const-string v0, "start an object"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 161
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/json/JsonWriteContext;->createChildObjectContext()Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    move-result-object v0

    iput-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeContext:Lcom/fasterxml/jackson/core/json/JsonWriteContext;

    .line 162
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    if-eqz v0, :cond_17

    .line 163
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_cfgPrettyPrinter:Lcom/fasterxml/jackson/core/PrettyPrinter;

    invoke-interface {v0, p0}, Lcom/fasterxml/jackson/core/PrettyPrinter;->writeStartObject(Lcom/fasterxml/jackson/core/JsonGenerator;)V

    .line 170
    :goto_16
    return-void

    .line 165
    :cond_17
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_20

    .line 166
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 168
    :cond_20
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    const/16 v2, 0x7b

    aput-char v2, v0, v1

    goto :goto_16
.end method

.method public writeString(Lcom/fasterxml/jackson/core/SerializableString;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v5, 0x22

    const/4 v4, 0x0

    .line 364
    const-string v0, "write text value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 365
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_11

    .line 366
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 368
    :cond_11
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v5, v0, v1

    .line 370
    invoke-interface {p1}, Lcom/fasterxml/jackson/core/SerializableString;->asQuotedChars()[C

    move-result-object v0

    .line 371
    array-length v1, v0

    .line 373
    const/16 v2, 0x20

    if-ge v1, v2, :cond_4e

    .line 374
    iget v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    sub-int/2addr v2, v3

    .line 375
    if-le v1, v2, :cond_2e

    .line 376
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 378
    :cond_2e
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v3, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    invoke-static {v0, v4, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 379
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    .line 385
    :goto_3a
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_43

    .line 386
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 388
    :cond_43
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v5, v0, v1

    .line 389
    return-void

    .line 382
    :cond_4e
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 383
    iget-object v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writer:Ljava/io/Writer;

    invoke-virtual {v2, v0, v4, v1}, Ljava/io/Writer;->write([CII)V

    goto :goto_3a
.end method

.method public writeString(Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 326
    const-string v0, "write text value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 327
    if-nez p1, :cond_d

    .line 328
    invoke-direct {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeNull()V

    .line 341
    :goto_c
    return-void

    .line 331
    :cond_d
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_16

    .line 332
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 334
    :cond_16
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 335
    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString(Ljava/lang/String;)V

    .line 337
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_2c

    .line 338
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 340
    :cond_2c
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    goto :goto_c
.end method

.method public writeString([CII)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    const/16 v3, 0x22

    .line 347
    const-string v0, "write text value"

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_verifyValueWrite(Ljava/lang/String;)V

    .line 348
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_10

    .line 349
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 351
    :cond_10
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 352
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_writeString([CII)V

    .line 354
    iget v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputEnd:I

    if-lt v0, v1, :cond_26

    .line 355
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_flushBuffer()V

    .line 357
    :cond_26
    iget-object v0, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputBuffer:[C

    iget v1, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_outputTail:I

    aput-char v3, v0, v1

    .line 358
    return-void
.end method

.method public writeUTF8String([BII)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/fasterxml/jackson/core/JsonGenerationException;
        }
    .end annotation

    .prologue
    .line 404
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/json/WriterBasedJsonGenerator;->_reportUnsupportedOperation()V

    .line 405
    return-void
.end method
