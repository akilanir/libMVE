.class public final Lcom/alibaba/fastjson/serializer/SerializeWriter;
.super Ljava/io/Writer;
.source "SerializeWriter.java"


# static fields
.field private static final bufLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[C>;"
        }
    .end annotation
.end field

.field private static final bytesBufLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<[B>;"
        }
    .end annotation
.end field

.field static final nonDirectFeautres:I


# instance fields
.field protected beanToArray:Z

.field protected buf:[C

.field protected count:I

.field protected disableCircularReferenceDetect:Z

.field protected features:I

.field protected keySeperator:C

.field protected notWriteDefaultValue:Z

.field protected quoteFieldNames:Z

.field protected sortField:Z

.field protected useSingleQuotes:Z

.field protected writeDirect:Z

.field protected writeEnumUsingName:Z

.field protected writeEnumUsingToString:Z

.field protected writeNonStringValueAsString:Z

.field private final writer:Ljava/io/Writer;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 36
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bufLocal:Ljava/lang/ThreadLocal;

    .line 37
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bytesBufLocal:Ljava/lang/ThreadLocal;

    .line 140
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/lit8 v0, v0, 0x0

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/2addr v0, v1

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/2addr v0, v1

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/2addr v0, v1

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/2addr v0, v1

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNonStringValueAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/2addr v0, v1

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/2addr v0, v1

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->IgnoreErrorGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/2addr v0, v1

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/2addr v0, v1

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->NotWriteDefaultValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v1, v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    or-int/2addr v0, v1

    sput v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->nonDirectFeautres:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 64
    const/4 v0, 0x0

    check-cast v0, Ljava/io/Writer;

    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;)V

    .line 65
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "initialSize"    # I

    .prologue
    .line 110
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I)V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;

    .prologue
    .line 68
    sget v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_GENERATE_FEATURE:I

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->EMPTY:[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-direct {p0, p1, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;I)V
    .registers 6
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "initialSize"    # I

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 114
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 116
    if-gtz p2, :cond_20

    .line 117
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Negative initial size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 119
    :cond_20
    new-array v0, p2, [C

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 122
    return-void
.end method

.method public varargs constructor <init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 9
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "defaultFeatures"    # I
    .param p3, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 86
    iput-object p1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    .line 88
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bufLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [C

    iput-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 90
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    if-eqz v2, :cond_28

    .line 91
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bufLocal:Ljava/lang/ThreadLocal;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 96
    :goto_19
    move v1, p2

    .line 97
    .local v1, "featuresValue":I
    array-length v3, p3

    const/4 v2, 0x0

    :goto_1c
    if-ge v2, v3, :cond_2f

    aget-object v0, p3, v2

    .line 98
    .local v0, "feature":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v4

    or-int/2addr v1, v4

    .line 97
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 93
    .end local v0    # "feature":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .end local v1    # "featuresValue":I
    :cond_28
    const/16 v2, 0x800

    new-array v2, v2, [C

    iput-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    goto :goto_19

    .line 100
    .restart local v1    # "featuresValue":I
    :cond_2f
    iput v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 102
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->computeFeatures()V

    .line 103
    return-void
.end method

.method public varargs constructor <init>(Ljava/io/Writer;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 4
    .param p1, "writer"    # Ljava/io/Writer;
    .param p2, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 76
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;I[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 77
    return-void
.end method

.method public varargs constructor <init>([Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 3
    .param p1, "features"    # [Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 72
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;[Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 73
    return-void
.end method

.method private encodeToUTF8(Ljava/io/OutputStream;)I
    .registers 10
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 369
    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    int-to-double v3, v3

    const-wide/high16 v5, 0x4008000000000000L    # 3.0

    mul-double/2addr v3, v5

    double-to-int v1, v3

    .line 370
    .local v1, "bytesLength":I
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bytesBufLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 372
    .local v0, "bytes":[B
    if-nez v0, :cond_1b

    .line 373
    const/16 v3, 0x2000

    new-array v0, v3, [B

    .line 374
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bytesBufLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v3, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 377
    :cond_1b
    array-length v3, v0

    if-ge v3, v1, :cond_20

    .line 378
    new-array v0, v1, [B

    .line 381
    :cond_20
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-static {v3, v7, v4, v0}, Lcom/alibaba/fastjson/util/IOUtils;->encodeUTF8([CII[B)I

    move-result v2

    .line 382
    .local v2, "position":I
    invoke-virtual {p1, v0, v7, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 383
    return v2
.end method

.method private encodeToUTF8Bytes()[B
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 387
    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    int-to-double v4, v4

    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    mul-double/2addr v4, v6

    double-to-int v1, v4

    .line 388
    .local v1, "bytesLength":I
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bytesBufLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    .line 390
    .local v0, "bytes":[B
    if-nez v0, :cond_1b

    .line 391
    const/16 v4, 0x2000

    new-array v0, v4, [B

    .line 392
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bytesBufLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v4, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 395
    :cond_1b
    array-length v4, v0

    if-ge v4, v1, :cond_20

    .line 396
    new-array v0, v1, [B

    .line 399
    :cond_20
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-static {v4, v8, v5, v0}, Lcom/alibaba/fastjson/util/IOUtils;->encodeUTF8([CII[B)I

    move-result v3

    .line 400
    .local v3, "position":I
    new-array v2, v3, [B

    .line 401
    .local v2, "copy":[B
    invoke-static {v0, v8, v2, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 402
    return-object v2
.end method

.method static isSpecial(CI)Z
    .registers 6
    .param p0, "ch"    # C
    .param p1, "features"    # I

    .prologue
    const/16 v3, 0x5c

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1551
    const/16 v2, 0x20

    if-ne p0, v2, :cond_9

    .line 1572
    :cond_8
    :goto_8
    return v1

    .line 1555
    :cond_9
    const/16 v2, 0x2f

    if-ne p0, v2, :cond_18

    .line 1556
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v2, v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v2, p1

    if-eqz v2, :cond_16

    :goto_14
    move v1, v0

    goto :goto_8

    :cond_16
    move v0, v1

    goto :goto_14

    .line 1559
    :cond_18
    const/16 v2, 0x23

    if-le p0, v2, :cond_1e

    if-ne p0, v3, :cond_8

    .line 1565
    :cond_1e
    const/16 v2, 0x1f

    if-le p0, v2, :cond_28

    if-eq p0, v3, :cond_28

    const/16 v2, 0x22

    if-ne p0, v2, :cond_8

    :cond_28
    move v1, v0

    .line 1569
    goto :goto_8
.end method

.method private writeEnumFieldValue(CLjava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 1595
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v0, :cond_8

    .line 1596
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    .line 1600
    :goto_7
    return-void

    .line 1598
    :cond_8
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValueStringWithDoubleQuote(CLjava/lang/String;Ljava/lang/String;)V

    goto :goto_7
.end method

.method private writeKeyWithSingleQuoteIfHasSpecial(Ljava/lang/String;)V
    .registers 16
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1752
    sget-object v7, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_singleQuotes:[B

    .line 1754
    .local v7, "specicalFlags_singleQuotes":[B
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 1755
    .local v4, "len":I
    iget v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v9, v4

    add-int/lit8 v6, v9, 0x1

    .line 1756
    .local v6, "newcount":I
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v9, v9

    if-le v6, v9, :cond_71

    .line 1757
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v9, :cond_6e

    .line 1758
    if-nez v4, :cond_26

    .line 1759
    const/16 v9, 0x27

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1760
    const/16 v9, 0x27

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1761
    const/16 v9, 0x3a

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1850
    :goto_25
    return-void

    .line 1765
    :cond_26
    const/4 v2, 0x0

    .line 1766
    .local v2, "hasSpecial":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_28
    if-ge v3, v4, :cond_36

    .line 1767
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1768
    .local v0, "ch":C
    array-length v9, v7

    if-ge v0, v9, :cond_5a

    aget-byte v9, v7, v0

    if-eqz v9, :cond_5a

    .line 1769
    const/4 v2, 0x1

    .line 1774
    .end local v0    # "ch":C
    :cond_36
    if-eqz v2, :cond_3d

    .line 1775
    const/16 v9, 0x27

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1777
    :cond_3d
    const/4 v3, 0x0

    :goto_3e
    if-ge v3, v4, :cond_61

    .line 1778
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1779
    .restart local v0    # "ch":C
    array-length v9, v7

    if-ge v0, v9, :cond_5d

    aget-byte v9, v7, v0

    if-eqz v9, :cond_5d

    .line 1780
    const/16 v9, 0x5c

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1781
    sget-object v9, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v9, v9, v0

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1777
    :goto_57
    add-int/lit8 v3, v3, 0x1

    goto :goto_3e

    .line 1766
    :cond_5a
    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    .line 1783
    :cond_5d
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_57

    .line 1786
    .end local v0    # "ch":C
    :cond_61
    if-eqz v2, :cond_68

    .line 1787
    const/16 v9, 0x27

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1789
    :cond_68
    const/16 v9, 0x3a

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_25

    .line 1793
    .end local v2    # "hasSpecial":Z
    .end local v3    # "i":I
    :cond_6e
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1796
    :cond_71
    if-nez v4, :cond_a9

    .line 1797
    iget v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v5, v9, 0x3

    .line 1798
    .local v5, "newCount":I
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v9, v9

    if-le v5, v9, :cond_83

    .line 1799
    iget v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v9, v9, 0x3

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1801
    :cond_83
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    const/16 v11, 0x27

    aput-char v11, v9, v10

    .line 1802
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    const/16 v11, 0x27

    aput-char v11, v9, v10

    .line 1803
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    const/16 v11, 0x3a

    aput-char v11, v9, v10

    goto/16 :goto_25

    .line 1807
    .end local v5    # "newCount":I
    :cond_a9
    iget v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1808
    .local v8, "start":I
    add-int v1, v8, v4

    .line 1810
    .local v1, "end":I
    const/4 v9, 0x0

    iget-object v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-virtual {p1, v9, v4, v10, v8}, Ljava/lang/String;->getChars(II[CI)V

    .line 1811
    iput v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1813
    const/4 v2, 0x0

    .line 1815
    .restart local v2    # "hasSpecial":Z
    move v3, v8

    .restart local v3    # "i":I
    :goto_b7
    if-ge v3, v1, :cond_13e

    .line 1816
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aget-char v0, v9, v3

    .line 1817
    .restart local v0    # "ch":C
    array-length v9, v7

    if-ge v0, v9, :cond_10f

    aget-byte v9, v7, v0

    if-eqz v9, :cond_10f

    .line 1818
    if-nez v2, :cond_112

    .line 1819
    add-int/lit8 v6, v6, 0x3

    .line 1820
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v9, v9

    if-le v6, v9, :cond_d0

    .line 1821
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1823
    :cond_d0
    iput v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1825
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v10, v3, 0x1

    iget-object v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v12, v3, 0x3

    sub-int v13, v1, v3

    add-int/lit8 v13, v13, -0x1

    invoke-static {v9, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1826
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/4 v12, 0x1

    invoke-static {v9, v10, v11, v12, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1827
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/16 v10, 0x27

    aput-char v10, v9, v8

    .line 1828
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v3, v3, 0x1

    const/16 v10, 0x5c

    aput-char v10, v9, v3

    .line 1829
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v3, v3, 0x1

    sget-object v10, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v10, v10, v0

    aput-char v10, v9, v3

    .line 1830
    add-int/lit8 v1, v1, 0x2

    .line 1831
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v10, v10, -0x2

    const/16 v11, 0x27

    aput-char v11, v9, v10

    .line 1833
    const/4 v2, 0x1

    .line 1815
    :cond_10f
    :goto_10f
    add-int/lit8 v3, v3, 0x1

    goto :goto_b7

    .line 1835
    :cond_112
    add-int/lit8 v6, v6, 0x1

    .line 1836
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v9, v9

    if-le v6, v9, :cond_11c

    .line 1837
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1839
    :cond_11c
    iput v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1841
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v10, v3, 0x1

    iget-object v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v12, v3, 0x2

    sub-int v13, v1, v3

    invoke-static {v9, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1842
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/16 v10, 0x5c

    aput-char v10, v9, v3

    .line 1843
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v3, v3, 0x1

    sget-object v10, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v10, v10, v0

    aput-char v10, v9, v3

    .line 1844
    add-int/lit8 v1, v1, 0x1

    goto :goto_10f

    .line 1849
    .end local v0    # "ch":C
    :cond_13e
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v10, v6, -0x1

    const/16 v11, 0x3a

    aput-char v11, v9, v10

    goto/16 :goto_25
.end method


# virtual methods
.method public append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .registers 2
    .param p1, "c"    # C

    .prologue
    .line 267
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 268
    return-object p0
.end method

.method public append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .registers 5
    .param p1, "csq"    # Ljava/lang/CharSequence;

    .prologue
    .line 255
    if-nez p1, :cond_d

    const-string v0, "null"

    .line 256
    .local v0, "s":Ljava/lang/String;
    :goto_4
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;II)V

    .line 257
    return-object p0

    .line 255
    .end local v0    # "s":Ljava/lang/String;
    :cond_d
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method

.method public append(Ljava/lang/CharSequence;II)Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .registers 7
    .param p1, "csq"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 261
    if-nez p1, :cond_4

    const-string p1, "null"

    .end local p1    # "csq":Ljava/lang/CharSequence;
    :cond_4
    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 262
    .local v0, "s":Ljava/lang/String;
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;II)V

    .line 263
    return-object p0
.end method

.method public bridge synthetic append(C)Ljava/io/Writer;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/io/Writer;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/io/Writer;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;II)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(C)Ljava/lang/Appendable;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;II)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object v0

    return-object v0
.end method

.method public close()V
    .registers 3

    .prologue
    .line 418
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v0, :cond_b

    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    if-lez v0, :cond_b

    .line 419
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->flush()V

    .line 421
    :cond_b
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v0, v0

    const/16 v1, 0x2000

    if-gt v0, v1, :cond_19

    .line 422
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->bufLocal:Ljava/lang/ThreadLocal;

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 425
    :cond_19
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 426
    return-void
.end method

.method protected computeFeatures()V
    .registers 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 153
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->QuoteFieldNames:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_8c

    move v0, v1

    :goto_c
    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    .line 154
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_8f

    move v0, v1

    :goto_18
    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    .line 155
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->SortField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_91

    move v0, v1

    :goto_24
    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sortField:Z

    .line 156
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_93

    move v0, v1

    :goto_30
    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->disableCircularReferenceDetect:Z

    .line 157
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BeanToArray:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_95

    move v0, v1

    :goto_3c
    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->beanToArray:Z

    .line 158
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNonStringValueAsString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_97

    move v0, v1

    :goto_48
    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNonStringValueAsString:Z

    .line 159
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->NotWriteDefaultValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_99

    move v0, v1

    :goto_54
    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->notWriteDefaultValue:Z

    .line 160
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_9b

    move v0, v1

    :goto_60
    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingName:Z

    .line 161
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v3, v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_9d

    move v0, v1

    :goto_6c
    iput-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    .line 163
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-eqz v0, :cond_9f

    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget v3, Lcom/alibaba/fastjson/serializer/SerializeWriter;->nonDirectFeautres:I

    and-int/2addr v0, v3

    if-nez v0, :cond_9f

    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->beanToArray:Z

    if-nez v0, :cond_81

    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingName:Z

    if-eqz v0, :cond_9f

    :cond_81
    :goto_81
    iput-boolean v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeDirect:Z

    .line 168
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v0, :cond_a1

    const/16 v0, 0x27

    :goto_89
    iput-char v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    .line 169
    return-void

    :cond_8c
    move v0, v2

    .line 153
    goto/16 :goto_c

    :cond_8f
    move v0, v2

    .line 154
    goto :goto_18

    :cond_91
    move v0, v2

    .line 155
    goto :goto_24

    :cond_93
    move v0, v2

    .line 156
    goto :goto_30

    :cond_95
    move v0, v2

    .line 157
    goto :goto_3c

    :cond_97
    move v0, v2

    .line 158
    goto :goto_48

    :cond_99
    move v0, v2

    .line 159
    goto :goto_54

    :cond_9b
    move v0, v2

    .line 160
    goto :goto_60

    :cond_9d
    move v0, v2

    .line 161
    goto :goto_6c

    :cond_9f
    move v1, v2

    .line 163
    goto :goto_81

    .line 168
    :cond_a1
    const/16 v0, 0x22

    goto :goto_89
.end method

.method public config(Lcom/alibaba/fastjson/serializer/SerializerFeature;Z)V
    .registers 5
    .param p1, "feature"    # Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .param p2, "state"    # Z

    .prologue
    .line 125
    if-eqz p2, :cond_32

    .line 126
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    invoke-virtual {p1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v1

    or-int/2addr v0, v1

    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 128
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    if-ne p1, v0, :cond_20

    .line 129
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v1

    xor-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    .line 137
    :cond_1c
    :goto_1c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->computeFeatures()V

    .line 138
    return-void

    .line 130
    :cond_20
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    if-ne p1, v0, :cond_1c

    .line 131
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v1

    xor-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    goto :goto_1c

    .line 134
    :cond_32
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    invoke-virtual {p1}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->getMask()I

    move-result v1

    xor-int/lit8 v1, v1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    goto :goto_1c
.end method

.method public expandCapacity(I)V
    .registers 7
    .param p1, "minimumCapacity"    # I

    .prologue
    const/4 v4, 0x0

    .line 244
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x3

    div-int/lit8 v2, v2, 0x2

    add-int/lit8 v0, v2, 0x1

    .line 246
    .local v0, "newCapacity":I
    if-ge v0, p1, :cond_d

    .line 247
    move v0, p1

    .line 249
    :cond_d
    new-array v1, v0, [C

    .line 250
    .local v1, "newValue":[C
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-static {v2, v4, v1, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 251
    iput-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    .line 252
    return-void
.end method

.method public flush()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 1853
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-nez v1, :cond_6

    .line 1864
    :goto_5
    return-void

    .line 1858
    :cond_6
    :try_start_6
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/4 v3, 0x0

    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-virtual {v1, v2, v3, v4}, Ljava/io/Writer;->write([CII)V

    .line 1859
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_15} :catch_18

    .line 1863
    iput v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    goto :goto_5

    .line 1860
    :catch_18
    move-exception v0

    .line 1861
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getBufferLength()I
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v0, v0

    return v0
.end method

.method public isEnabled(I)Z
    .registers 3
    .param p1, "feature"    # I

    .prologue
    .line 184
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z
    .registers 4
    .param p1, "feature"    # Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 180
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    iget v1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v0, v1

    if-eqz v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isNotWriteDefaultValue()Z
    .registers 2

    .prologue
    .line 176
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->notWriteDefaultValue:Z

    return v0
.end method

.method public isSortField()Z
    .registers 2

    .prologue
    .line 172
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->sortField:Z

    return v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 406
    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    return v0
.end method

.method public toBytes(Ljava/lang/String;)[B
    .registers 3
    .param p1, "charsetName"    # Ljava/lang/String;

    .prologue
    .line 350
    if-eqz p1, :cond_a

    const-string v0, "UTF-8"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    :cond_a
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    :goto_c
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->toBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    return-object v0

    .line 352
    :cond_11
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    goto :goto_c
.end method

.method public toBytes(Ljava/nio/charset/Charset;)[B
    .registers 6
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 356
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v0, :cond_c

    .line 357
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "writer not null"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 360
    :cond_c
    sget-object v0, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    if-ne p1, v0, :cond_15

    .line 361
    invoke-direct {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->encodeToUTF8Bytes()[B

    move-result-object v0

    .line 363
    :goto_14
    return-object v0

    :cond_15
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/4 v2, 0x0

    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    goto :goto_14
.end method

.method public toCharArray()[C
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 340
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v1, :cond_d

    .line 341
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v2, "writer not null"

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 344
    :cond_d
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    new-array v0, v1, [C

    .line 345
    .local v0, "newValue":[C
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 346
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 410
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/4 v2, 0x0

    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method public write(I)V
    .registers 6
    .param p1, "c"    # I

    .prologue
    .line 191
    iget v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v0, v1, 0x1

    .line 192
    .local v0, "newcount":I
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v1, v1

    if-le v0, v1, :cond_10

    .line 193
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-nez v1, :cond_1a

    .line 194
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 200
    :cond_10
    :goto_10
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    int-to-char v3, p1

    aput-char v3, v1, v2

    .line 201
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 202
    return-void

    .line 196
    :cond_1a
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->flush()V

    .line 197
    const/4 v0, 0x1

    goto :goto_10
.end method

.method public write(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 429
    if-nez p1, :cond_6

    .line 430
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 435
    :goto_5
    return-void

    .line 434
    :cond_6
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;II)V

    goto :goto_5
.end method

.method public write(Ljava/lang/String;II)V
    .registers 9
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 279
    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int v0, v2, p3

    .line 280
    .local v0, "newcount":I
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    if-le v0, v2, :cond_10

    .line 281
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-nez v2, :cond_1c

    .line 282
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 295
    :cond_10
    :goto_10
    add-int v2, p2, p3

    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-virtual {p1, p2, v2, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 296
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 297
    return-void

    .line 285
    :cond_1c
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    sub-int v1, v2, v3

    .line 286
    .local v1, "rest":I
    add-int v2, p2, v1

    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-virtual {p1, p2, v2, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 287
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    iput v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 288
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->flush()V

    .line 289
    sub-int/2addr p3, v1

    .line 290
    add-int/2addr p2, v1

    .line 291
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    if-gt p3, v2, :cond_1c

    .line 292
    move v0, p3

    goto :goto_10
.end method

.method public write(Ljava/util/List;)V
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1081
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_c

    .line 1082
    const-string v10, "[]"

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 1144
    :goto_b
    return-void

    .line 1086
    :cond_c
    iget v7, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1087
    .local v7, "offset":I
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    .local v5, "list_size":I
    move v8, v7

    .end local v7    # "offset":I
    .local v8, "offset":I
    :goto_14
    if-ge v2, v5, :cond_c5

    .line 1088
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 1090
    .local v9, "text":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1091
    .local v1, "hasSpecial":Z
    if-nez v9, :cond_45

    .line 1092
    const/4 v1, 0x1

    .line 1105
    :cond_20
    if-eqz v1, :cond_73

    .line 1106
    const/16 v10, 0x5b

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1107
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_28
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    if-ge v3, v10, :cond_6d

    .line 1108
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "text":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 1109
    .restart local v9    # "text":Ljava/lang/String;
    if-eqz v3, :cond_3b

    .line 1110
    const/16 v10, 0x2c

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1113
    :cond_3b
    if-nez v9, :cond_68

    .line 1114
    const-string v10, "null"

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 1107
    :goto_42
    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    .line 1094
    .end local v3    # "j":I
    :cond_45
    const/4 v3, 0x0

    .restart local v3    # "j":I
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v4

    .local v4, "len":I
    :goto_4a
    if-ge v3, v4, :cond_20

    .line 1095
    invoke-virtual {v9, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1096
    .local v0, "ch":C
    const/16 v10, 0x20

    if-lt v0, v10, :cond_60

    const/16 v10, 0x7e

    if-gt v0, v10, :cond_60

    const/16 v10, 0x22

    if-eq v0, v10, :cond_60

    const/16 v10, 0x5c

    if-ne v0, v10, :cond_66

    :cond_60
    const/4 v1, 0x1

    :goto_61
    if-nez v1, :cond_20

    .line 1094
    add-int/lit8 v3, v3, 0x1

    goto :goto_4a

    .line 1096
    :cond_66
    const/4 v1, 0x0

    goto :goto_61

    .line 1116
    .end local v0    # "ch":C
    .end local v4    # "len":I
    :cond_68
    const/4 v10, 0x0

    invoke-virtual {p0, v9, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    goto :goto_42

    .line 1119
    :cond_6d
    const/16 v10, 0x5d

    invoke-virtual {p0, v10}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_b

    .line 1123
    .end local v3    # "j":I
    :cond_73
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    add-int/2addr v10, v8

    add-int/lit8 v6, v10, 0x3

    .line 1124
    .local v6, "newcount":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    if-ne v2, v10, :cond_84

    .line 1125
    add-int/lit8 v6, v6, 0x1

    .line 1127
    :cond_84
    iget-object v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v10, v10

    if-le v6, v10, :cond_8e

    .line 1128
    iput v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1129
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1132
    :cond_8e
    if-nez v2, :cond_bc

    .line 1133
    iget-object v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "offset":I
    .restart local v7    # "offset":I
    const/16 v11, 0x5b

    aput-char v11, v10, v8

    .line 1137
    :goto_98
    iget-object v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v8, v7, 0x1

    .end local v7    # "offset":I
    .restart local v8    # "offset":I
    const/16 v11, 0x22

    aput-char v11, v10, v7

    .line 1138
    const/4 v10, 0x0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v11

    iget-object v12, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-virtual {v9, v10, v11, v12, v8}, Ljava/lang/String;->getChars(II[CI)V

    .line 1139
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    add-int v7, v8, v10

    .line 1140
    .end local v8    # "offset":I
    .restart local v7    # "offset":I
    iget-object v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v8, v7, 0x1

    .end local v7    # "offset":I
    .restart local v8    # "offset":I
    const/16 v11, 0x22

    aput-char v11, v10, v7

    .line 1087
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_14

    .line 1135
    :cond_bc
    iget-object v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "offset":I
    .restart local v7    # "offset":I
    const/16 v11, 0x2c

    aput-char v11, v10, v8

    goto :goto_98

    .line 1142
    .end local v1    # "hasSpecial":Z
    .end local v6    # "newcount":I
    .end local v7    # "offset":I
    .end local v9    # "text":Ljava/lang/String;
    .restart local v8    # "offset":I
    :cond_c5
    iget-object v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v7, v8, 0x1

    .end local v8    # "offset":I
    .restart local v7    # "offset":I
    const/16 v11, 0x5d

    aput-char v11, v10, v8

    .line 1143
    iput v7, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    goto/16 :goto_b
.end method

.method public write(Z)V
    .registers 3
    .param p1, "value"    # Z

    .prologue
    .line 1194
    if-eqz p1, :cond_8

    .line 1195
    const-string v0, "true"

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 1199
    :goto_7
    return-void

    .line 1197
    :cond_8
    const-string v0, "false"

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_7
.end method

.method public write([CII)V
    .registers 8
    .param p1, "c"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 212
    if-ltz p2, :cond_10

    array-length v2, p1

    if-gt p2, v2, :cond_10

    if-ltz p3, :cond_10

    add-int v2, p2, p3

    array-length v3, p1

    if-gt v2, v3, :cond_10

    add-int v2, p2, p3

    if-gez v2, :cond_16

    .line 217
    :cond_10
    new-instance v2, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {v2}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw v2

    .line 218
    :cond_16
    if-nez p3, :cond_19

    .line 241
    :goto_18
    return-void

    .line 222
    :cond_19
    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int v0, v2, p3

    .line 223
    .local v0, "newcount":I
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    if-le v0, v2, :cond_29

    .line 224
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-nez v2, :cond_33

    .line 225
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 238
    :cond_29
    :goto_29
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-static {p1, p2, v2, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 239
    iput v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    goto :goto_18

    .line 228
    :cond_33
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    sub-int v1, v2, v3

    .line 229
    .local v1, "rest":I
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-static {p1, p2, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 230
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    iput v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 231
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->flush()V

    .line 232
    sub-int/2addr p3, v1

    .line 233
    add-int/2addr p2, v1

    .line 234
    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v2, v2

    if-gt p3, v2, :cond_33

    .line 235
    move v0, p3

    goto :goto_29
.end method

.method public writeByteArray([B)V
    .registers 22
    .param p1, "bytes"    # [B

    .prologue
    .line 463
    move-object/from16 v0, p1

    array-length v3, v0

    .line 464
    .local v3, "bytesLen":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    move/from16 v17, v0

    if-eqz v17, :cond_1f

    const/16 v14, 0x27

    .line 466
    .local v14, "quote":C
    :goto_d
    if-nez v3, :cond_25

    .line 467
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    move/from16 v17, v0

    if-eqz v17, :cond_22

    const-string v8, "\'\'"

    .line 468
    .local v8, "emptyString":Ljava/lang/String;
    :goto_19
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 540
    .end local v8    # "emptyString":Ljava/lang/String;
    :goto_1e
    return-void

    .line 464
    .end local v14    # "quote":C
    :cond_1f
    const/16 v14, 0x22

    goto :goto_d

    .line 467
    .restart local v14    # "quote":C
    :cond_22
    const-string v8, "\"\""

    goto :goto_19

    .line 472
    :cond_25
    sget-object v2, Lcom/alibaba/fastjson/util/IOUtils;->CA:[C

    .line 474
    .local v2, "CA":[C
    div-int/lit8 v17, v3, 0x3

    mul-int/lit8 v7, v17, 0x3

    .line 475
    .local v7, "eLen":I
    add-int/lit8 v17, v3, -0x1

    div-int/lit8 v17, v17, 0x3

    add-int/lit8 v17, v17, 0x1

    shl-int/lit8 v4, v17, 0x2

    .line 477
    .local v4, "charsLen":I
    move-object/from16 v0, p0

    iget v12, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 478
    .local v12, "offset":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v17, v0

    add-int v17, v17, v4

    add-int/lit8 v11, v17, 0x2

    .line 479
    .local v11, "newcount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-le v11, v0, :cond_125

    .line 480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    move-object/from16 v17, v0

    if-eqz v17, :cond_120

    .line 481
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 483
    const/4 v15, 0x0

    .local v15, "s":I
    move/from16 v16, v15

    .end local v15    # "s":I
    .local v16, "s":I
    :goto_60
    move/from16 v0, v16

    if-ge v0, v7, :cond_bf

    .line 485
    add-int/lit8 v15, v16, 0x1

    .end local v16    # "s":I
    .restart local v15    # "s":I
    aget-byte v17, p1, v16

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0xff

    move/from16 v17, v0

    shl-int/lit8 v17, v17, 0x10

    add-int/lit8 v16, v15, 0x1

    .end local v15    # "s":I
    .restart local v16    # "s":I
    aget-byte v18, p1, v15

    move/from16 v0, v18

    and-int/lit16 v0, v0, 0xff

    move/from16 v18, v0

    shl-int/lit8 v18, v18, 0x8

    or-int v17, v17, v18

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "s":I
    .restart local v15    # "s":I
    aget-byte v18, p1, v16

    move/from16 v0, v18

    and-int/lit16 v0, v0, 0xff

    move/from16 v18, v0

    or-int v9, v17, v18

    .line 488
    .local v9, "i":I
    ushr-int/lit8 v17, v9, 0x12

    and-int/lit8 v17, v17, 0x3f

    aget-char v17, v2, v17

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 489
    ushr-int/lit8 v17, v9, 0xc

    and-int/lit8 v17, v17, 0x3f

    aget-char v17, v2, v17

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 490
    ushr-int/lit8 v17, v9, 0x6

    and-int/lit8 v17, v17, 0x3f

    aget-char v17, v2, v17

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 491
    and-int/lit8 v17, v9, 0x3f

    aget-char v17, v2, v17

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    move/from16 v16, v15

    .line 492
    .end local v15    # "s":I
    .restart local v16    # "s":I
    goto :goto_60

    .line 495
    .end local v9    # "i":I
    :cond_bf
    sub-int v10, v3, v7

    .line 496
    .local v10, "left":I
    if-lez v10, :cond_113

    .line 498
    aget-byte v17, p1, v7

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0xff

    move/from16 v17, v0

    shl-int/lit8 v18, v17, 0xa

    const/16 v17, 0x2

    move/from16 v0, v17

    if-ne v10, v0, :cond_11a

    add-int/lit8 v17, v3, -0x1

    aget-byte v17, p1, v17

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0xff

    move/from16 v17, v0

    shl-int/lit8 v17, v17, 0x2

    :goto_df
    or-int v9, v18, v17

    .line 501
    .restart local v9    # "i":I
    shr-int/lit8 v17, v9, 0xc

    aget-char v17, v2, v17

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 502
    ushr-int/lit8 v17, v9, 0x6

    and-int/lit8 v17, v17, 0x3f

    aget-char v17, v2, v17

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 503
    const/16 v17, 0x2

    move/from16 v0, v17

    if-ne v10, v0, :cond_11d

    and-int/lit8 v17, v9, 0x3f

    aget-char v17, v2, v17

    :goto_103
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 504
    const/16 v17, 0x3d

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 507
    .end local v9    # "i":I
    :cond_113
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_1e

    .line 498
    :cond_11a
    const/16 v17, 0x0

    goto :goto_df

    .line 503
    .restart local v9    # "i":I
    :cond_11d
    const/16 v17, 0x3d

    goto :goto_103

    .line 510
    .end local v9    # "i":I
    .end local v10    # "left":I
    .end local v16    # "s":I
    :cond_120
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 512
    :cond_125
    move-object/from16 v0, p0

    iput v11, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 513
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    add-int/lit8 v13, v12, 0x1

    .end local v12    # "offset":I
    .local v13, "offset":I
    aput-char v14, v17, v12

    .line 516
    const/4 v15, 0x0

    .restart local v15    # "s":I
    move v5, v13

    .local v5, "d":I
    move v6, v5

    .end local v5    # "d":I
    .local v6, "d":I
    move/from16 v16, v15

    .end local v15    # "s":I
    .restart local v16    # "s":I
    :goto_138
    move/from16 v0, v16

    if-ge v0, v7, :cond_1a3

    .line 518
    add-int/lit8 v15, v16, 0x1

    .end local v16    # "s":I
    .restart local v15    # "s":I
    aget-byte v17, p1, v16

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0xff

    move/from16 v17, v0

    shl-int/lit8 v17, v17, 0x10

    add-int/lit8 v16, v15, 0x1

    .end local v15    # "s":I
    .restart local v16    # "s":I
    aget-byte v18, p1, v15

    move/from16 v0, v18

    and-int/lit16 v0, v0, 0xff

    move/from16 v18, v0

    shl-int/lit8 v18, v18, 0x8

    or-int v17, v17, v18

    add-int/lit8 v15, v16, 0x1

    .end local v16    # "s":I
    .restart local v15    # "s":I
    aget-byte v18, p1, v16

    move/from16 v0, v18

    and-int/lit16 v0, v0, 0xff

    move/from16 v18, v0

    or-int v9, v17, v18

    .line 521
    .restart local v9    # "i":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "d":I
    .restart local v5    # "d":I
    ushr-int/lit8 v18, v9, 0x12

    and-int/lit8 v18, v18, 0x3f

    aget-char v18, v2, v18

    aput-char v18, v17, v6

    .line 522
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "d":I
    .restart local v6    # "d":I
    ushr-int/lit8 v18, v9, 0xc

    and-int/lit8 v18, v18, 0x3f

    aget-char v18, v2, v18

    aput-char v18, v17, v5

    .line 523
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "d":I
    .restart local v5    # "d":I
    ushr-int/lit8 v18, v9, 0x6

    and-int/lit8 v18, v18, 0x3f

    aget-char v18, v2, v18

    aput-char v18, v17, v6

    .line 524
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "d":I
    .restart local v6    # "d":I
    and-int/lit8 v18, v9, 0x3f

    aget-char v18, v2, v18

    aput-char v18, v17, v5

    move/from16 v16, v15

    .line 525
    .end local v15    # "s":I
    .restart local v16    # "s":I
    goto :goto_138

    .line 528
    .end local v9    # "i":I
    :cond_1a3
    sub-int v10, v3, v7

    .line 529
    .restart local v10    # "left":I
    if-lez v10, :cond_203

    .line 531
    aget-byte v17, p1, v7

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0xff

    move/from16 v17, v0

    shl-int/lit8 v18, v17, 0xa

    const/16 v17, 0x2

    move/from16 v0, v17

    if-ne v10, v0, :cond_20f

    add-int/lit8 v17, v3, -0x1

    aget-byte v17, p1, v17

    move/from16 v0, v17

    and-int/lit16 v0, v0, 0xff

    move/from16 v17, v0

    shl-int/lit8 v17, v17, 0x2

    :goto_1c3
    or-int v9, v18, v17

    .line 534
    .restart local v9    # "i":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    add-int/lit8 v18, v11, -0x5

    shr-int/lit8 v19, v9, 0xc

    aget-char v19, v2, v19

    aput-char v19, v17, v18

    .line 535
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    add-int/lit8 v18, v11, -0x4

    ushr-int/lit8 v19, v9, 0x6

    and-int/lit8 v19, v19, 0x3f

    aget-char v19, v2, v19

    aput-char v19, v17, v18

    .line 536
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v18, v0

    add-int/lit8 v19, v11, -0x3

    const/16 v17, 0x2

    move/from16 v0, v17

    if-ne v10, v0, :cond_212

    and-int/lit8 v17, v9, 0x3f

    aget-char v17, v2, v17

    :goto_1f5
    aput-char v17, v18, v19

    .line 537
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    add-int/lit8 v18, v11, -0x2

    const/16 v19, 0x3d

    aput-char v19, v17, v18

    .line 539
    .end local v9    # "i":I
    :cond_203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v17, v0

    add-int/lit8 v18, v11, -0x1

    aput-char v14, v17, v18

    goto/16 :goto_1e

    .line 531
    :cond_20f
    const/16 v17, 0x0

    goto :goto_1c3

    .line 536
    .restart local v9    # "i":I
    :cond_212
    const/16 v17, 0x3d

    goto :goto_1f5
.end method

.method public writeDouble(DZ)V
    .registers 7
    .param p1, "doubleValue"    # D
    .param p3, "checkWriteClassName"    # Z

    .prologue
    .line 560
    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-nez v1, :cond_c

    .line 561
    invoke-static {p1, p2}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 562
    :cond_c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 575
    :cond_f
    :goto_f
    return-void

    .line 564
    :cond_10
    invoke-static {p1, p2}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object v0

    .line 565
    .local v0, "doubleText":Ljava/lang/String;
    const-string v1, ".0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 566
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 569
    :cond_27
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 571
    if-eqz p3, :cond_f

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 572
    const/16 v1, 0x44

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_f
.end method

.method public writeEnum(Ljava/lang/Enum;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 578
    .local p1, "value":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    if-nez p1, :cond_6

    .line 579
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 598
    :goto_5
    return-void

    .line 583
    :cond_6
    const/4 v1, 0x0

    .line 584
    .local v1, "strVal":Ljava/lang/String;
    iget-boolean v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingName:Z

    if-eqz v2, :cond_29

    iget-boolean v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    if-nez v2, :cond_29

    .line 585
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    .line 590
    :cond_13
    :goto_13
    if-eqz v1, :cond_35

    .line 591
    sget-object v2, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v2

    if-eqz v2, :cond_32

    const/16 v0, 0x27

    .line 592
    .local v0, "quote":C
    :goto_1f
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 593
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 594
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_5

    .line 586
    .end local v0    # "quote":C
    :cond_29
    iget-boolean v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    if-eqz v2, :cond_13

    .line 587
    invoke-virtual {p1}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 591
    :cond_32
    const/16 v0, 0x22

    goto :goto_1f

    .line 596
    :cond_35
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    goto :goto_5
.end method

.method public writeFieldName(Ljava/lang/String;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1713
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;Z)V

    .line 1714
    return-void
.end method

.method public writeFieldName(Ljava/lang/String;Z)V
    .registers 9
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "checkSpecial"    # Z

    .prologue
    const/4 v3, 0x0

    const/16 v5, 0x3a

    .line 1717
    if-nez p1, :cond_b

    .line 1718
    const-string v3, "null:"

    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 1749
    :goto_a
    return-void

    .line 1722
    :cond_b
    iget-boolean v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v4, :cond_1e

    .line 1723
    iget-boolean v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-eqz v3, :cond_1a

    .line 1724
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithSingleQuote(Ljava/lang/String;)V

    .line 1725
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_a

    .line 1727
    :cond_1a
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeKeyWithSingleQuoteIfHasSpecial(Ljava/lang/String;)V

    goto :goto_a

    .line 1730
    :cond_1e
    iget-boolean v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-eqz v4, :cond_26

    .line 1731
    invoke-virtual {p0, p1, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    goto :goto_a

    .line 1733
    :cond_26
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_45

    const/4 v1, 0x1

    .line 1734
    .local v1, "hashSpecial":Z
    :goto_2d
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2e
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_3f

    .line 1735
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1736
    .local v0, "ch":C
    invoke-static {v0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isSpecial(CI)Z

    move-result v4

    if-eqz v4, :cond_47

    .line 1737
    const/4 v1, 0x1

    .line 1741
    .end local v0    # "ch":C
    :cond_3f
    if-eqz v1, :cond_4a

    .line 1742
    invoke-virtual {p0, p1, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    goto :goto_a

    .end local v1    # "hashSpecial":Z
    .end local v2    # "i":I
    :cond_45
    move v1, v3

    .line 1733
    goto :goto_2d

    .line 1734
    .restart local v0    # "ch":C
    .restart local v1    # "hashSpecial":Z
    .restart local v2    # "i":I
    :cond_47
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 1744
    .end local v0    # "ch":C
    :cond_4a
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 1745
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_a
.end method

.method public writeFieldNameDirect(Ljava/lang/String;)V
    .registers 8
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x22

    .line 1063
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 1064
    .local v0, "len":I
    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v3, v0

    add-int/lit8 v1, v3, 0x3

    .line 1066
    .local v1, "newcount":I
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v3, v3

    if-le v1, v3, :cond_13

    .line 1067
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1070
    :cond_13
    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v2, v3, 0x1

    .line 1072
    .local v2, "start":I
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    aput-char v5, v3, v4

    .line 1073
    const/4 v3, 0x0

    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-virtual {p1, v3, v0, v4, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 1075
    iput v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1076
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v4, v4, -0x2

    aput-char v5, v3, v4

    .line 1077
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v4, v4, -0x1

    const/16 v5, 0x3a

    aput-char v5, v3, v4

    .line 1078
    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;C)V
    .registers 5
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # C

    .prologue
    .line 1148
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1149
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1150
    if-nez p3, :cond_e

    .line 1151
    const-string v0, "\u0000"

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 1155
    :goto_d
    return-void

    .line 1153
    :cond_e
    invoke-static {p3}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto :goto_d
.end method

.method public writeFieldValue(CLjava/lang/String;D)V
    .registers 6
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # D

    .prologue
    .line 1286
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1287
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1288
    const/4 v0, 0x0

    invoke-virtual {p0, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeDouble(DZ)V

    .line 1289
    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;F)V
    .registers 5
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # F

    .prologue
    .line 1280
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1281
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1282
    const/4 v0, 0x0

    invoke-virtual {p0, p3, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFloat(FZ)V

    .line 1283
    return-void
.end method

.method public writeFieldValue(CLjava/lang/String;I)V
    .registers 12
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # I

    .prologue
    .line 1202
    const/high16 v5, -0x80000000

    if-eq p3, v5, :cond_8

    iget-boolean v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-nez v5, :cond_12

    .line 1203
    :cond_8
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1204
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1205
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    .line 1238
    :goto_11
    return-void

    .line 1209
    :cond_12
    if-gez p3, :cond_39

    neg-int v5, p3

    invoke-static {v5}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(I)I

    move-result v5

    add-int/lit8 v0, v5, 0x1

    .line 1211
    .local v0, "intSize":I
    :goto_1b
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 1212
    .local v2, "nameLen":I
    iget v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v5, v2

    add-int/lit8 v5, v5, 0x4

    add-int v3, v5, v0

    .line 1213
    .local v3, "newcount":I
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v5, v5

    if-le v3, v5, :cond_41

    .line 1214
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v5, :cond_3e

    .line 1215
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1216
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1217
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeInt(I)V

    goto :goto_11

    .line 1209
    .end local v0    # "intSize":I
    .end local v2    # "nameLen":I
    .end local v3    # "newcount":I
    :cond_39
    invoke-static {p3}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(I)I

    move-result v0

    goto :goto_1b

    .line 1220
    .restart local v0    # "intSize":I
    .restart local v2    # "nameLen":I
    .restart local v3    # "newcount":I
    :cond_3e
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1223
    :cond_41
    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1224
    .local v4, "start":I
    iput v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1226
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char p1, v5, v4

    .line 1228
    add-int v5, v4, v2

    add-int/lit8 v1, v5, 0x1

    .line 1230
    .local v1, "nameEnd":I
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v6, v4, 0x1

    iget-char v7, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v7, v5, v6

    .line 1232
    const/4 v5, 0x0

    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v7, v4, 0x2

    invoke-virtual {p2, v5, v2, v6, v7}, Ljava/lang/String;->getChars(II[CI)V

    .line 1234
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v6, v1, 0x1

    iget-char v7, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v7, v5, v6

    .line 1235
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v6, v1, 0x2

    const/16 v7, 0x3a

    aput-char v7, v5, v6

    .line 1237
    iget v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {p3, v5, v6}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    goto :goto_11
.end method

.method public writeFieldValue(CLjava/lang/String;J)V
    .registers 13
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # J

    .prologue
    .line 1241
    const-wide/high16 v5, -0x8000000000000000L

    cmp-long v5, p3, v5

    if-eqz v5, :cond_a

    iget-boolean v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-nez v5, :cond_14

    .line 1242
    :cond_a
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1243
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1244
    invoke-virtual {p0, p3, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 1277
    :goto_13
    return-void

    .line 1248
    :cond_14
    const-wide/16 v5, 0x0

    cmp-long v5, p3, v5

    if-gez v5, :cond_3f

    neg-long v5, p3

    invoke-static {v5, v6}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(J)I

    move-result v5

    add-int/lit8 v0, v5, 0x1

    .line 1250
    .local v0, "intSize":I
    :goto_21
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 1251
    .local v2, "nameLen":I
    iget v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v5, v2

    add-int/lit8 v5, v5, 0x4

    add-int v3, v5, v0

    .line 1252
    .local v3, "newcount":I
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v5, v5

    if-le v3, v5, :cond_47

    .line 1253
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v5, :cond_44

    .line 1254
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1255
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1256
    invoke-virtual {p0, p3, p4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    goto :goto_13

    .line 1248
    .end local v0    # "intSize":I
    .end local v2    # "nameLen":I
    .end local v3    # "newcount":I
    :cond_3f
    invoke-static {p3, p4}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(J)I

    move-result v0

    goto :goto_21

    .line 1259
    .restart local v0    # "intSize":I
    .restart local v2    # "nameLen":I
    .restart local v3    # "newcount":I
    :cond_44
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1262
    :cond_47
    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1263
    .local v4, "start":I
    iput v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1265
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char p1, v5, v4

    .line 1267
    add-int v5, v4, v2

    add-int/lit8 v1, v5, 0x1

    .line 1269
    .local v1, "nameEnd":I
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v6, v4, 0x1

    iget-char v7, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v7, v5, v6

    .line 1271
    const/4 v5, 0x0

    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v7, v4, 0x2

    invoke-virtual {p2, v5, v2, v6, v7}, Ljava/lang/String;->getChars(II[CI)V

    .line 1273
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v6, v1, 0x1

    iget-char v7, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v7, v5, v6

    .line 1274
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v6, v1, 0x2

    const/16 v7, 0x3a

    aput-char v7, v5, v6

    .line 1276
    iget v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {p3, p4, v5, v6}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(JI[C)V

    goto :goto_13
.end method

.method public writeFieldValue(CLjava/lang/String;Ljava/lang/Enum;)V
    .registers 5
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(C",
            "Ljava/lang/String;",
            "Ljava/lang/Enum",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1578
    .local p3, "value":Ljava/lang/Enum;, "Ljava/lang/Enum<*>;"
    if-nez p3, :cond_c

    .line 1579
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1580
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1581
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 1592
    :goto_b
    return-void

    .line 1585
    :cond_c
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingName:Z

    if-eqz v0, :cond_1c

    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    if-nez v0, :cond_1c

    .line 1586
    invoke-virtual {p3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    goto :goto_b

    .line 1587
    :cond_1c
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumUsingToString:Z

    if-eqz v0, :cond_28

    .line 1588
    invoke-virtual {p3}, Ljava/lang/Enum;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeEnumFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    goto :goto_b

    .line 1590
    :cond_28
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    goto :goto_b
.end method

.method public writeFieldValue(CLjava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x3a

    const/4 v1, 0x0

    .line 1292
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->quoteFieldNames:Z

    if-eqz v0, :cond_43

    .line 1293
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v0, :cond_1b

    .line 1294
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1295
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1296
    if-nez p3, :cond_17

    .line 1297
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 1323
    :goto_16
    return-void

    .line 1299
    :cond_17
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto :goto_16

    .line 1302
    :cond_1b
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 1303
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1304
    invoke-virtual {p0, p2, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 1305
    invoke-virtual {p0, p3, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    goto :goto_16

    .line 1306
    :cond_2d
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 1307
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1308
    invoke-virtual {p0, p2, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 1309
    invoke-virtual {p0, p3, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    goto :goto_16

    .line 1311
    :cond_3f
    invoke-virtual {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValueStringWithDoubleQuoteCheck(CLjava/lang/String;Ljava/lang/String;)V

    goto :goto_16

    .line 1315
    :cond_43
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1316
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1317
    if-nez p3, :cond_4f

    .line 1318
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    goto :goto_16

    .line 1320
    :cond_4f
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto :goto_16
.end method

.method public writeFieldValue(CLjava/lang/String;Ljava/math/BigDecimal;)V
    .registers 5
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/math/BigDecimal;

    .prologue
    .line 1603
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1604
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 1605
    if-nez p3, :cond_c

    .line 1606
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 1610
    :goto_b
    return-void

    .line 1608
    :cond_c
    invoke-virtual {p3}, Ljava/math/BigDecimal;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_b
.end method

.method public writeFieldValue(CLjava/lang/String;Z)V
    .registers 14
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Z

    .prologue
    const/4 v5, 0x5

    const/4 v9, 0x0

    .line 1158
    if-eqz p3, :cond_28

    const/4 v0, 0x4

    .line 1160
    .local v0, "intSize":I
    :goto_5
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    .line 1161
    .local v2, "nameLen":I
    iget v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v6, v2

    add-int/lit8 v6, v6, 0x4

    add-int v3, v6, v0

    .line 1162
    .local v3, "newcount":I
    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v6, v6

    if-le v3, v6, :cond_2d

    .line 1163
    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v6, :cond_2a

    .line 1164
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1165
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 1166
    const/16 v5, 0x3a

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1167
    invoke-virtual {p0, p3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Z)V

    .line 1191
    :goto_27
    return-void

    .end local v0    # "intSize":I
    .end local v2    # "nameLen":I
    .end local v3    # "newcount":I
    :cond_28
    move v0, v5

    .line 1158
    goto :goto_5

    .line 1170
    .restart local v0    # "intSize":I
    .restart local v2    # "nameLen":I
    .restart local v3    # "newcount":I
    :cond_2a
    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1173
    :cond_2d
    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1174
    .local v4, "start":I
    iput v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1176
    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aput-char p1, v6, v4

    .line 1178
    add-int v6, v4, v2

    add-int/lit8 v1, v6, 0x1

    .line 1180
    .local v1, "nameEnd":I
    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v7, v4, 0x1

    iget-char v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v8, v6, v7

    .line 1182
    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v7, v4, 0x2

    invoke-virtual {p2, v9, v2, v6, v7}, Ljava/lang/String;->getChars(II[CI)V

    .line 1184
    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v7, v1, 0x1

    iget-char v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->keySeperator:C

    aput-char v8, v6, v7

    .line 1186
    if-eqz p3, :cond_60

    .line 1187
    const-string v6, ":true"

    invoke-virtual {v6}, Ljava/lang/String;->toCharArray()[C

    move-result-object v6

    iget-object v7, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v8, v1, 0x2

    invoke-static {v6, v9, v7, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_27

    .line 1189
    :cond_60
    const-string v5, ":false"

    invoke-virtual {v5}, Ljava/lang/String;->toCharArray()[C

    move-result-object v5

    iget-object v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v7, v1, 0x2

    const/4 v8, 0x6

    invoke-static {v5, v9, v6, v7, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_27
.end method

.method public writeFieldValueStringWithDoubleQuote(CLjava/lang/String;Ljava/lang/String;)V
    .registers 15
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 1507
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    .line 1510
    .local v3, "nameLen":I
    iget v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1512
    .local v5, "newcount":I
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v6

    .line 1513
    .local v6, "valueLen":I
    add-int v8, v3, v6

    add-int/lit8 v8, v8, 0x6

    add-int/2addr v5, v8

    .line 1515
    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v8, v8

    if-le v5, v8, :cond_28

    .line 1516
    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v8, :cond_25

    .line 1517
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1518
    const/16 v8, 0x3a

    invoke-virtual {p0, p2, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 1519
    const/4 v8, 0x0

    invoke-virtual {p0, p3, v8}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 1544
    :goto_24
    return-void

    .line 1522
    :cond_25
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1525
    :cond_28
    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    aput-char p1, v8, v9

    .line 1527
    iget v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v4, v8, 0x2

    .line 1528
    .local v4, "nameStart":I
    add-int v2, v4, v3

    .line 1530
    .local v2, "nameEnd":I
    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v9, v9, 0x1

    const/16 v10, 0x22

    aput-char v10, v8, v9

    .line 1531
    const/4 v8, 0x0

    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-virtual {p2, v8, v3, v9, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 1533
    iput v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1535
    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/16 v9, 0x22

    aput-char v9, v8, v2

    .line 1537
    add-int/lit8 v0, v2, 0x1

    .line 1538
    .local v0, "index":I
    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v1, v0, 0x1

    .end local v0    # "index":I
    .local v1, "index":I
    const/16 v9, 0x3a

    aput-char v9, v8, v0

    .line 1539
    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v0, v1, 0x1

    .end local v1    # "index":I
    .restart local v0    # "index":I
    const/16 v9, 0x22

    aput-char v9, v8, v1

    .line 1541
    move v7, v0

    .line 1542
    .local v7, "valueStart":I
    const/4 v8, 0x0

    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-virtual {p3, v8, v6, v9, v7}, Ljava/lang/String;->getChars(II[CI)V

    .line 1543
    iget-object v8, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v9, v9, -0x1

    const/16 v10, 0x22

    aput-char v10, v8, v9

    goto :goto_24
.end method

.method public writeFieldValueStringWithDoubleQuoteCheck(CLjava/lang/String;Ljava/lang/String;)V
    .registers 33
    .param p1, "seperator"    # C
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 1326
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v17

    .line 1329
    .local v17, "nameLen":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v19, v0

    .line 1331
    .local v19, "newcount":I
    if-nez p3, :cond_45

    .line 1332
    const/16 v24, 0x4

    .line 1333
    .local v24, "valueLen":I
    add-int/lit8 v26, v17, 0x8

    add-int v19, v19, v26

    .line 1339
    :goto_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v19

    move/from16 v1, v26

    if-le v0, v1, :cond_57

    .line 1340
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    move-object/from16 v26, v0

    if-eqz v26, :cond_50

    .line 1341
    invoke-virtual/range {p0 .. p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1342
    const/16 v26, 0x3a

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 1343
    const/16 v26, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    .line 1504
    :goto_44
    return-void

    .line 1335
    .end local v24    # "valueLen":I
    :cond_45
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v24

    .line 1336
    .restart local v24    # "valueLen":I
    add-int v26, v17, v24

    add-int/lit8 v26, v26, 0x6

    add-int v19, v19, v26

    goto :goto_12

    .line 1346
    :cond_50
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1349
    :cond_57
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v27, v0

    aput-char p1, v26, v27

    .line 1351
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v26, v0

    add-int/lit8 v18, v26, 0x2

    .line 1352
    .local v18, "nameStart":I
    add-int v16, v18, v17

    .line 1354
    .local v16, "nameEnd":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, 0x1

    const/16 v28, 0x22

    aput-char v28, v26, v27

    .line 1355
    const/16 v26, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v27, v0

    move-object/from16 v0, p2

    move/from16 v1, v26

    move/from16 v2, v17

    move-object/from16 v3, v27

    move/from16 v4, v18

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 1357
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1359
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    const/16 v27, 0x22

    aput-char v27, v26, v16

    .line 1361
    add-int/lit8 v12, v16, 0x1

    .line 1362
    .local v12, "index":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v13, v12, 0x1

    .end local v12    # "index":I
    .local v13, "index":I
    const/16 v27, 0x3a

    aput-char v27, v26, v12

    .line 1364
    if-nez p3, :cond_e8

    .line 1365
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v12, v13, 0x1

    .end local v13    # "index":I
    .restart local v12    # "index":I
    const/16 v27, 0x6e

    aput-char v27, v26, v13

    .line 1366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v13, v12, 0x1

    .end local v12    # "index":I
    .restart local v13    # "index":I
    const/16 v27, 0x75

    aput-char v27, v26, v12

    .line 1367
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v12, v13, 0x1

    .end local v13    # "index":I
    .restart local v12    # "index":I
    const/16 v27, 0x6c

    aput-char v27, v26, v13

    .line 1368
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v13, v12, 0x1

    .end local v12    # "index":I
    .restart local v13    # "index":I
    const/16 v27, 0x6c

    aput-char v27, v26, v12

    goto/16 :goto_44

    .line 1372
    :cond_e8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v12, v13, 0x1

    .end local v13    # "index":I
    .restart local v12    # "index":I
    const/16 v27, 0x22

    aput-char v27, v26, v13

    .line 1374
    move/from16 v25, v12

    .line 1375
    .local v25, "valueStart":I
    add-int v23, v25, v24

    .line 1377
    .local v23, "valueEnd":I
    const/16 v26, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v27, v0

    move-object/from16 v0, p3

    move/from16 v1, v26

    move/from16 v2, v24

    move-object/from16 v3, v27

    move/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 1379
    const/16 v20, 0x0

    .line 1380
    .local v20, "specialCount":I
    const/4 v15, -0x1

    .line 1381
    .local v15, "lastSpecialIndex":I
    const/4 v10, -0x1

    .line 1382
    .local v10, "firstSpecialIndex":I
    const/4 v14, 0x0

    .line 1384
    .local v14, "lastSpecial":C
    move/from16 v11, v25

    .local v11, "i":I
    :goto_114
    move/from16 v0, v23

    if-ge v11, v0, :cond_17b

    .line 1385
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    aget-char v8, v26, v11

    .line 1387
    .local v8, "ch":C
    const/16 v26, 0x5d

    move/from16 v0, v26

    if-lt v8, v0, :cond_148

    .line 1388
    const/16 v26, 0x7f

    move/from16 v0, v26

    if-lt v8, v0, :cond_145

    const/16 v26, 0x2028

    move/from16 v0, v26

    if-eq v8, v0, :cond_138

    const/16 v26, 0xa0

    move/from16 v0, v26

    if-gt v8, v0, :cond_145

    .line 1391
    :cond_138
    const/16 v26, -0x1

    move/from16 v0, v26

    if-ne v10, v0, :cond_13f

    .line 1392
    move v10, v11

    .line 1395
    :cond_13f
    add-int/lit8 v20, v20, 0x1

    .line 1396
    move v15, v11

    .line 1397
    move v14, v8

    .line 1398
    add-int/lit8 v19, v19, 0x4

    .line 1384
    :cond_145
    :goto_145
    add-int/lit8 v11, v11, 0x1

    goto :goto_114

    .line 1403
    :cond_148
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    move/from16 v26, v0

    move/from16 v0, v26

    invoke-static {v8, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isSpecial(CI)Z

    move-result v26

    if-eqz v26, :cond_145

    .line 1404
    add-int/lit8 v20, v20, 0x1

    .line 1405
    move v15, v11

    .line 1406
    move v14, v8

    .line 1408
    sget-object v26, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v8, v0, :cond_173

    sget-object v26, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v26, v26, v8

    const/16 v27, 0x4

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_173

    .line 1411
    add-int/lit8 v19, v19, 0x4

    .line 1414
    :cond_173
    const/16 v26, -0x1

    move/from16 v0, v26

    if-ne v10, v0, :cond_145

    .line 1415
    move v10, v11

    goto :goto_145

    .line 1420
    .end local v8    # "ch":C
    :cond_17b
    if-lez v20, :cond_20e

    .line 1421
    add-int v19, v19, v20

    .line 1422
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v19

    move/from16 v1, v26

    if-le v0, v1, :cond_197

    .line 1423
    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1425
    :cond_197
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1427
    const/16 v26, 0x1

    move/from16 v0, v20

    move/from16 v1, v26

    if-ne v0, v1, :cond_2ef

    .line 1428
    const/16 v26, 0x2028

    move/from16 v0, v26

    if-ne v14, v0, :cond_222

    .line 1429
    add-int/lit8 v21, v15, 0x1

    .line 1430
    .local v21, "srcPos":I
    add-int/lit8 v9, v15, 0x6

    .line 1431
    .local v9, "destPos":I
    sub-int v26, v23, v15

    add-int/lit8 v5, v26, -0x1

    .line 1432
    .local v5, "LengthOfCopy":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v27, v0

    move-object/from16 v0, v26

    move/from16 v1, v21

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2, v9, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1433
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    const/16 v27, 0x5c

    aput-char v27, v26, v15

    .line 1434
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v15, v15, 0x1

    const/16 v27, 0x75

    aput-char v27, v26, v15

    .line 1435
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v15, v15, 0x1

    const/16 v27, 0x32

    aput-char v27, v26, v15

    .line 1436
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v15, v15, 0x1

    const/16 v27, 0x30

    aput-char v27, v26, v15

    .line 1437
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v15, v15, 0x1

    const/16 v27, 0x32

    aput-char v27, v26, v15

    .line 1438
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v15, v15, 0x1

    const/16 v27, 0x38

    aput-char v27, v26, v15

    .line 1503
    .end local v5    # "LengthOfCopy":I
    .end local v9    # "destPos":I
    .end local v21    # "srcPos":I
    :cond_20e
    :goto_20e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, -0x1

    const/16 v28, 0x22

    aput-char v28, v26, v27

    goto/16 :goto_44

    .line 1440
    :cond_222
    move v8, v14

    .line 1441
    .restart local v8    # "ch":C
    sget-object v26, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v8, v0, :cond_2b8

    sget-object v26, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v26, v26, v8

    const/16 v27, 0x4

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_2b8

    .line 1443
    add-int/lit8 v21, v15, 0x1

    .line 1444
    .restart local v21    # "srcPos":I
    add-int/lit8 v9, v15, 0x6

    .line 1445
    .restart local v9    # "destPos":I
    sub-int v26, v23, v15

    add-int/lit8 v5, v26, -0x1

    .line 1446
    .restart local v5    # "LengthOfCopy":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v27, v0

    move-object/from16 v0, v26

    move/from16 v1, v21

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2, v9, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1448
    move v6, v15

    .line 1449
    .local v6, "bufIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .local v7, "bufIndex":I
    const/16 v27, 0x5c

    aput-char v27, v26, v6

    .line 1450
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    const/16 v27, 0x75

    aput-char v27, v26, v7

    .line 1451
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v28, v8, 0xc

    and-int/lit8 v28, v28, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v6

    .line 1452
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v28, v8, 0x8

    and-int/lit8 v28, v28, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v7

    .line 1453
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v28, v8, 0x4

    and-int/lit8 v28, v28, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v6

    .line 1454
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v28, v8, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v7

    goto/16 :goto_20e

    .line 1456
    .end local v5    # "LengthOfCopy":I
    .end local v6    # "bufIndex":I
    .end local v9    # "destPos":I
    .end local v21    # "srcPos":I
    :cond_2b8
    add-int/lit8 v21, v15, 0x1

    .line 1457
    .restart local v21    # "srcPos":I
    add-int/lit8 v9, v15, 0x2

    .line 1458
    .restart local v9    # "destPos":I
    sub-int v26, v23, v15

    add-int/lit8 v5, v26, -0x1

    .line 1459
    .restart local v5    # "LengthOfCopy":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v27, v0

    move-object/from16 v0, v26

    move/from16 v1, v21

    move-object/from16 v2, v27

    invoke-static {v0, v1, v2, v9, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1460
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    const/16 v27, 0x5c

    aput-char v27, v26, v15

    .line 1461
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v15, v15, 0x1

    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v27, v27, v8

    aput-char v27, v26, v15

    goto/16 :goto_20e

    .line 1464
    .end local v5    # "LengthOfCopy":I
    .end local v8    # "ch":C
    .end local v9    # "destPos":I
    .end local v21    # "srcPos":I
    :cond_2ef
    const/16 v26, 0x1

    move/from16 v0, v20

    move/from16 v1, v26

    if-le v0, v1, :cond_20e

    .line 1465
    sub-int v22, v10, v25

    .line 1466
    .local v22, "textIndex":I
    move v6, v10

    .line 1467
    .restart local v6    # "bufIndex":I
    move/from16 v11, v22

    :goto_2fc
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v26

    move/from16 v0, v26

    if-ge v11, v0, :cond_20e

    .line 1468
    move-object/from16 v0, p3

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v8

    .line 1470
    .restart local v8    # "ch":C
    sget-object v26, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    move-object/from16 v0, v26

    array-length v0, v0

    move/from16 v26, v0

    move/from16 v0, v26

    if-ge v8, v0, :cond_31b

    sget-object v26, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v26, v26, v8

    if-nez v26, :cond_32d

    :cond_31b
    const/16 v26, 0x2f

    move/from16 v0, v26

    if-ne v8, v0, :cond_3ae

    sget-object v26, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 1472
    move-object/from16 v0, p0

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v26

    if-eqz v26, :cond_3ae

    .line 1473
    :cond_32d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    const/16 v27, 0x5c

    aput-char v27, v26, v6

    .line 1474
    sget-object v26, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v26, v26, v8

    const/16 v27, 0x4

    move/from16 v0, v26

    move/from16 v1, v27

    if-ne v0, v1, :cond_39d

    .line 1475
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    const/16 v27, 0x75

    aput-char v27, v26, v7

    .line 1476
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v28, v8, 0xc

    and-int/lit8 v28, v28, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v6

    .line 1477
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v28, v8, 0x8

    and-int/lit8 v28, v28, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v7

    .line 1478
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v28, v8, 0x4

    and-int/lit8 v28, v28, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v6

    .line 1479
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v28, v8, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v7

    .line 1480
    add-int/lit8 v23, v23, 0x5

    .line 1467
    :goto_399
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_2fc

    .line 1482
    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    :cond_39d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v27, v27, v8

    aput-char v27, v26, v7

    .line 1483
    add-int/lit8 v23, v23, 0x1

    goto :goto_399

    .line 1486
    :cond_3ae
    const/16 v26, 0x2028

    move/from16 v0, v26

    if-ne v8, v0, :cond_415

    .line 1487
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    const/16 v27, 0x5c

    aput-char v27, v26, v6

    .line 1488
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    const/16 v27, 0x75

    aput-char v27, v26, v7

    .line 1489
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v28, v8, 0xc

    and-int/lit8 v28, v28, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v6

    .line 1490
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v28, v8, 0x8

    and-int/lit8 v28, v28, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v7

    .line 1491
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v28, v8, 0x4

    and-int/lit8 v28, v28, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v6

    .line 1492
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v27, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v28, v8, 0xf

    aget-char v27, v27, v28

    aput-char v27, v26, v7

    .line 1493
    add-int/lit8 v23, v23, 0x5

    goto :goto_399

    .line 1495
    :cond_415
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v26, v0

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v7    # "bufIndex":I
    aput-char v8, v26, v6

    move v6, v7

    .end local v7    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    goto/16 :goto_399
.end method

.method public writeFloat(FZ)V
    .registers 6
    .param p1, "value"    # F
    .param p2, "checkWriteClassName"    # Z

    .prologue
    .line 543
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_c

    .line 544
    invoke-static {p1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 545
    :cond_c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 557
    :cond_f
    :goto_f
    return-void

    .line 547
    :cond_10
    invoke-static {p1}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    .line 548
    .local v0, "floatText":Ljava/lang/String;
    const-string v1, ".0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 549
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 551
    :cond_27
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 553
    if-eqz p2, :cond_f

    sget-object v1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 554
    const/16 v1, 0x46

    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_f
.end method

.method public writeInt(I)V
    .registers 7
    .param p1, "i"    # I

    .prologue
    .line 438
    const/high16 v3, -0x80000000

    if-ne p1, v3, :cond_a

    .line 439
    const-string v3, "-2147483648"

    invoke-virtual {p0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 460
    :goto_9
    return-void

    .line 443
    :cond_a
    if-gez p1, :cond_2b

    neg-int v3, p1

    invoke-static {v3}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(I)I

    move-result v3

    add-int/lit8 v2, v3, 0x1

    .line 445
    .local v2, "size":I
    :goto_13
    iget v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int v1, v3, v2

    .line 446
    .local v1, "newcount":I
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v3, v3

    if-le v1, v3, :cond_23

    .line 447
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-nez v3, :cond_30

    .line 448
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 457
    :cond_23
    iget-object v3, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {p1, v1, v3}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 459
    iput v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    goto :goto_9

    .line 443
    .end local v1    # "newcount":I
    .end local v2    # "size":I
    :cond_2b
    invoke-static {p1}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(I)I

    move-result v2

    goto :goto_13

    .line 450
    .restart local v1    # "newcount":I
    .restart local v2    # "size":I
    :cond_30
    new-array v0, v2, [C

    .line 451
    .local v0, "chars":[C
    invoke-static {p1, v2, v0}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 452
    const/4 v3, 0x0

    array-length v4, v0

    invoke-virtual {p0, v0, v3, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write([CII)V

    goto :goto_9
.end method

.method public writeLong(J)V
    .registers 11
    .param p1, "i"    # J

    .prologue
    const/4 v4, 0x0

    const/16 v7, 0x22

    .line 601
    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v5

    if-eqz v5, :cond_34

    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 602
    invoke-virtual {p0, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v5

    if-nez v5, :cond_34

    const-wide v5, 0x1fffffffffffffL

    cmp-long v5, p1, v5

    if-gtz v5, :cond_25

    const-wide v5, -0x1fffffffffffffL

    cmp-long v5, p1, v5

    if-gez v5, :cond_34

    :cond_25
    const/4 v1, 0x1

    .line 605
    .local v1, "needQuotationMark":Z
    :goto_26
    const-wide/high16 v5, -0x8000000000000000L

    cmp-long v5, p1, v5

    if-nez v5, :cond_3c

    .line 606
    if-eqz v1, :cond_36

    const-string v4, "\"-9223372036854775808\""

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 641
    :goto_33
    return-void

    .end local v1    # "needQuotationMark":Z
    :cond_34
    move v1, v4

    .line 602
    goto :goto_26

    .line 607
    .restart local v1    # "needQuotationMark":Z
    :cond_36
    const-string v4, "-9223372036854775808"

    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_33

    .line 611
    :cond_3c
    const-wide/16 v5, 0x0

    cmp-long v5, p1, v5

    if-gez v5, :cond_75

    neg-long v5, p1

    invoke-static {v5, v6}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(J)I

    move-result v5

    add-int/lit8 v3, v5, 0x1

    .line 613
    .local v3, "size":I
    :goto_49
    iget v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int v2, v5, v3

    .line 614
    .local v2, "newcount":I
    if-eqz v1, :cond_51

    add-int/lit8 v2, v2, 0x2

    .line 615
    :cond_51
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v5, v5

    if-le v2, v5, :cond_5d

    .line 616
    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-nez v5, :cond_7a

    .line 617
    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 632
    :cond_5d
    if-eqz v1, :cond_91

    .line 633
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    aput-char v7, v4, v5

    .line 634
    add-int/lit8 v4, v2, -0x1

    iget-object v5, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {p1, p2, v4, v5}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(JI[C)V

    .line 635
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v5, v2, -0x1

    aput-char v7, v4, v5

    .line 640
    :goto_72
    iput v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    goto :goto_33

    .line 611
    .end local v2    # "newcount":I
    .end local v3    # "size":I
    :cond_75
    invoke-static {p1, p2}, Lcom/alibaba/fastjson/util/IOUtils;->stringSize(J)I

    move-result v3

    goto :goto_49

    .line 619
    .restart local v2    # "newcount":I
    .restart local v3    # "size":I
    :cond_7a
    new-array v0, v3, [C

    .line 620
    .local v0, "chars":[C
    invoke-static {p1, p2, v3, v0}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(JI[C)V

    .line 621
    if-eqz v1, :cond_8c

    .line 622
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 623
    array-length v5, v0

    invoke-virtual {p0, v0, v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write([CII)V

    .line 624
    invoke-virtual {p0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_33

    .line 626
    :cond_8c
    array-length v5, v0

    invoke-virtual {p0, v0, v4, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write([CII)V

    goto :goto_33

    .line 637
    .end local v0    # "chars":[C
    :cond_91
    iget-object v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-static {p1, p2, v2, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(JI[C)V

    goto :goto_72
.end method

.method public writeNull()V
    .registers 2

    .prologue
    .line 644
    const-string v0, "null"

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 645
    return-void
.end method

.method public writeNull(II)V
    .registers 4
    .param p1, "beanFeatures"    # I
    .param p2, "feature"    # I

    .prologue
    .line 652
    and-int v0, p1, p2

    if-nez v0, :cond_d

    iget v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    and-int/2addr v0, p2

    if-nez v0, :cond_d

    .line 654
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 669
    :goto_c
    return-void

    .line 658
    :cond_d
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    if-ne p2, v0, :cond_19

    .line 659
    const-string v0, "[]"

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_c

    .line 660
    :cond_19
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullStringAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    if-ne p2, v0, :cond_25

    .line 661
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto :goto_c

    .line 662
    :cond_25
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullBooleanAsFalse:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    if-ne p2, v0, :cond_31

    .line 663
    const-string v0, "false"

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    goto :goto_c

    .line 664
    :cond_31
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullNumberAsZero:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    if-ne p2, v0, :cond_3d

    .line 665
    const/16 v0, 0x30

    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_c

    .line 667
    :cond_3d
    invoke-virtual {p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    goto :goto_c
.end method

.method public writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V
    .registers 4
    .param p1, "feature"    # Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .prologue
    .line 648
    const/4 v0, 0x0

    iget v1, p1, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-virtual {p0, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(II)V

    .line 649
    return-void
.end method

.method public writeString(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1622
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v0, :cond_8

    .line 1623
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithSingleQuote(Ljava/lang/String;)V

    .line 1627
    :goto_7
    return-void

    .line 1625
    :cond_8
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    goto :goto_7
.end method

.method public writeString(Ljava/lang/String;C)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "seperator"    # C

    .prologue
    .line 1613
    iget-boolean v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->useSingleQuotes:Z

    if-eqz v0, :cond_b

    .line 1614
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithSingleQuote(Ljava/lang/String;)V

    .line 1615
    invoke-virtual {p0, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1619
    :goto_a
    return-void

    .line 1617
    :cond_b
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeStringWithDoubleQuote(Ljava/lang/String;C)V

    goto :goto_a
.end method

.method public writeStringWithDoubleQuote(Ljava/lang/String;C)V
    .registers 28
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "seperator"    # C

    .prologue
    .line 672
    if-nez p1, :cond_f

    .line 673
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 674
    if-eqz p2, :cond_e

    .line 675
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1060
    :cond_e
    :goto_e
    return-void

    .line 680
    :cond_f
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v14

    .line 681
    .local v14, "len":I
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v20, v0

    add-int v20, v20, v14

    add-int/lit8 v15, v20, 0x2

    .line 682
    .local v15, "newcount":I
    if-eqz p2, :cond_21

    .line 683
    add-int/lit8 v15, v15, 0x1

    .line 686
    :cond_21
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-le v15, v0, :cond_279

    .line 687
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    move-object/from16 v20, v0

    if-eqz v20, :cond_274

    .line 688
    const/16 v20, 0x22

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 690
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_42
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_260

    .line 691
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 693
    .local v7, "ch":C
    sget-object v20, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v20

    if-eqz v20, :cond_e2

    .line 694
    const/16 v20, 0x30

    move/from16 v0, v20

    if-lt v7, v0, :cond_68

    const/16 v20, 0x39

    move/from16 v0, v20

    if-le v7, v0, :cond_259

    :cond_68
    const/16 v20, 0x61

    move/from16 v0, v20

    if-lt v7, v0, :cond_74

    const/16 v20, 0x7a

    move/from16 v0, v20

    if-le v7, v0, :cond_259

    :cond_74
    const/16 v20, 0x41

    move/from16 v0, v20

    if-lt v7, v0, :cond_80

    const/16 v20, 0x5a

    move/from16 v0, v20

    if-le v7, v0, :cond_259

    :cond_80
    const/16 v20, 0x2c

    move/from16 v0, v20

    if-eq v7, v0, :cond_259

    const/16 v20, 0x2e

    move/from16 v0, v20

    if-eq v7, v0, :cond_259

    const/16 v20, 0x5f

    move/from16 v0, v20

    if-eq v7, v0, :cond_259

    .line 696
    const/16 v20, 0x5c

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 697
    const/16 v20, 0x75

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 698
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v21, v7, 0xc

    and-int/lit8 v21, v21, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 699
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v21, v7, 0x8

    and-int/lit8 v21, v21, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 700
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v21, v7, 0x4

    and-int/lit8 v21, v21, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 701
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v21, v7, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 690
    :goto_de
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_42

    .line 704
    :cond_e2
    sget-object v20, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v20

    if-eqz v20, :cond_1cf

    .line 705
    const/16 v20, 0x8

    move/from16 v0, v20

    if-eq v7, v0, :cond_11e

    const/16 v20, 0xc

    move/from16 v0, v20

    if-eq v7, v0, :cond_11e

    const/16 v20, 0xa

    move/from16 v0, v20

    if-eq v7, v0, :cond_11e

    const/16 v20, 0xd

    move/from16 v0, v20

    if-eq v7, v0, :cond_11e

    const/16 v20, 0x9

    move/from16 v0, v20

    if-eq v7, v0, :cond_11e

    const/16 v20, 0x22

    move/from16 v0, v20

    if-eq v7, v0, :cond_11e

    const/16 v20, 0x2f

    move/from16 v0, v20

    if-eq v7, v0, :cond_11e

    const/16 v20, 0x5c

    move/from16 v0, v20

    if-ne v7, v0, :cond_133

    .line 713
    :cond_11e
    const/16 v20, 0x5c

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 714
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v20, v20, v7

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_de

    .line 718
    :cond_133
    const/16 v20, 0x20

    move/from16 v0, v20

    if-ge v7, v0, :cond_17b

    .line 719
    const/16 v20, 0x5c

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 720
    const/16 v20, 0x75

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 721
    const/16 v20, 0x30

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 722
    const/16 v20, 0x30

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 723
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    mul-int/lit8 v21, v7, 0x2

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 724
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    mul-int/lit8 v21, v7, 0x2

    add-int/lit8 v21, v21, 0x1

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_de

    .line 728
    :cond_17b
    const/16 v20, 0x7f

    move/from16 v0, v20

    if-lt v7, v0, :cond_259

    .line 729
    const/16 v20, 0x5c

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 730
    const/16 v20, 0x75

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 731
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v21, v7, 0xc

    and-int/lit8 v21, v21, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 732
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v21, v7, 0x8

    and-int/lit8 v21, v21, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 733
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v21, v7, 0x4

    and-int/lit8 v21, v21, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 734
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v21, v7, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_de

    .line 738
    :cond_1cf
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v7, v0, :cond_1e0

    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v20, v20, v7

    if-nez v20, :cond_1f2

    :cond_1e0
    const/16 v20, 0x2f

    move/from16 v0, v20

    if-ne v7, v0, :cond_259

    sget-object v20, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 740
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v20

    if-eqz v20, :cond_259

    .line 741
    :cond_1f2
    const/16 v20, 0x5c

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 742
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v20, v20, v7

    const/16 v21, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_24c

    .line 743
    const/16 v20, 0x75

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 744
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v21, v7, 0xc

    and-int/lit8 v21, v21, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 745
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v21, v7, 0x8

    and-int/lit8 v21, v21, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 746
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v21, v7, 0x4

    and-int/lit8 v21, v21, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 747
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v21, v7, 0xf

    aget-char v20, v20, v21

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_de

    .line 749
    :cond_24c
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v20, v20, v7

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_de

    .line 755
    :cond_259
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_de

    .line 758
    .end local v7    # "ch":C
    :cond_260
    const/16 v20, 0x22

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 759
    if-eqz p2, :cond_e

    .line 760
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_e

    .line 764
    .end local v11    # "i":I
    :cond_274
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 767
    :cond_279
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v20, v0

    add-int/lit8 v18, v20, 0x1

    .line 768
    .local v18, "start":I
    add-int v9, v18, v14

    .line 770
    .local v9, "end":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    const/16 v22, 0x22

    aput-char v22, v20, v21

    .line 771
    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    move/from16 v1, v20

    move-object/from16 v2, v21

    move/from16 v3, v18

    invoke-virtual {v0, v1, v14, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 773
    move-object/from16 v0, p0

    iput v15, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 775
    sget-object v20, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserSecure:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v20

    if-eqz v20, :cond_40d

    .line 776
    const/4 v13, -0x1

    .line 778
    .local v13, "lastSpecialIndex":I
    move/from16 v11, v18

    .restart local v11    # "i":I
    :goto_2b9
    if-ge v11, v9, :cond_2ff

    .line 779
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    aget-char v7, v20, v11

    .line 781
    .restart local v7    # "ch":C
    const/16 v20, 0x30

    move/from16 v0, v20

    if-lt v7, v0, :cond_2cf

    const/16 v20, 0x39

    move/from16 v0, v20

    if-le v7, v0, :cond_2fc

    :cond_2cf
    const/16 v20, 0x61

    move/from16 v0, v20

    if-lt v7, v0, :cond_2db

    const/16 v20, 0x7a

    move/from16 v0, v20

    if-le v7, v0, :cond_2fc

    :cond_2db
    const/16 v20, 0x41

    move/from16 v0, v20

    if-lt v7, v0, :cond_2e7

    const/16 v20, 0x5a

    move/from16 v0, v20

    if-le v7, v0, :cond_2fc

    :cond_2e7
    const/16 v20, 0x2c

    move/from16 v0, v20

    if-eq v7, v0, :cond_2fc

    const/16 v20, 0x2e

    move/from16 v0, v20

    if-eq v7, v0, :cond_2fc

    const/16 v20, 0x5f

    move/from16 v0, v20

    if-eq v7, v0, :cond_2fc

    .line 783
    move v13, v11

    .line 784
    add-int/lit8 v15, v15, 0x5

    .line 778
    :cond_2fc
    add-int/lit8 v11, v11, 0x1

    goto :goto_2b9

    .line 789
    .end local v7    # "ch":C
    :cond_2ff
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-le v15, v0, :cond_313

    .line 790
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 792
    :cond_313
    move-object/from16 v0, p0

    iput v15, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 794
    move v11, v13

    :goto_318
    move/from16 v0, v18

    if-lt v11, v0, :cond_3d3

    .line 795
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    aget-char v7, v20, v11

    .line 797
    .restart local v7    # "ch":C
    const/16 v20, 0x30

    move/from16 v0, v20

    if-lt v7, v0, :cond_330

    const/16 v20, 0x39

    move/from16 v0, v20

    if-le v7, v0, :cond_3cf

    :cond_330
    const/16 v20, 0x61

    move/from16 v0, v20

    if-lt v7, v0, :cond_33c

    const/16 v20, 0x7a

    move/from16 v0, v20

    if-le v7, v0, :cond_3cf

    :cond_33c
    const/16 v20, 0x41

    move/from16 v0, v20

    if-lt v7, v0, :cond_348

    const/16 v20, 0x5a

    move/from16 v0, v20

    if-le v7, v0, :cond_3cf

    :cond_348
    const/16 v20, 0x2c

    move/from16 v0, v20

    if-eq v7, v0, :cond_3cf

    const/16 v20, 0x2e

    move/from16 v0, v20

    if-eq v7, v0, :cond_3cf

    const/16 v20, 0x5f

    move/from16 v0, v20

    if-eq v7, v0, :cond_3cf

    .line 799
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v22, v0

    add-int/lit8 v23, v11, 0x6

    sub-int v24, v9, v11

    add-int/lit8 v24, v24, -0x1

    invoke-static/range {v20 .. v24}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 800
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    const/16 v21, 0x5c

    aput-char v21, v20, v11

    .line 801
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    const/16 v22, 0x75

    aput-char v22, v20, v21

    .line 802
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x2

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v23, v7, 0xc

    and-int/lit8 v23, v23, 0xf

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 803
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x3

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v23, v7, 0x8

    and-int/lit8 v23, v23, 0xf

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 804
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x4

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v23, v7, 0x4

    and-int/lit8 v23, v23, 0xf

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 805
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x5

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v23, v7, 0xf

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 806
    add-int/lit8 v9, v9, 0x5

    .line 794
    :cond_3cf
    add-int/lit8 v11, v11, -0x1

    goto/16 :goto_318

    .line 810
    .end local v7    # "ch":C
    :cond_3d3
    if-eqz p2, :cond_3f9

    .line 811
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x2

    const/16 v22, 0x22

    aput-char v22, v20, v21

    .line 812
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    aput-char p2, v20, v21

    goto/16 :goto_e

    .line 814
    :cond_3f9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    const/16 v22, 0x22

    aput-char v22, v20, v21

    goto/16 :goto_e

    .line 820
    .end local v11    # "i":I
    .end local v13    # "lastSpecialIndex":I
    :cond_40d
    sget-object v20, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BrowserCompatible:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v20

    if-eqz v20, :cond_653

    .line 821
    const/4 v13, -0x1

    .line 823
    .restart local v13    # "lastSpecialIndex":I
    move/from16 v11, v18

    .restart local v11    # "i":I
    :goto_41c
    if-ge v11, v9, :cond_474

    .line 824
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    aget-char v7, v20, v11

    .line 826
    .restart local v7    # "ch":C
    const/16 v20, 0x22

    move/from16 v0, v20

    if-eq v7, v0, :cond_438

    const/16 v20, 0x2f

    move/from16 v0, v20

    if-eq v7, v0, :cond_438

    const/16 v20, 0x5c

    move/from16 v0, v20

    if-ne v7, v0, :cond_43e

    .line 829
    :cond_438
    move v13, v11

    .line 830
    add-int/lit8 v15, v15, 0x1

    .line 823
    :cond_43b
    :goto_43b
    add-int/lit8 v11, v11, 0x1

    goto :goto_41c

    .line 834
    :cond_43e
    const/16 v20, 0x8

    move/from16 v0, v20

    if-eq v7, v0, :cond_45c

    const/16 v20, 0xc

    move/from16 v0, v20

    if-eq v7, v0, :cond_45c

    const/16 v20, 0xa

    move/from16 v0, v20

    if-eq v7, v0, :cond_45c

    const/16 v20, 0xd

    move/from16 v0, v20

    if-eq v7, v0, :cond_45c

    const/16 v20, 0x9

    move/from16 v0, v20

    if-ne v7, v0, :cond_460

    .line 839
    :cond_45c
    move v13, v11

    .line 840
    add-int/lit8 v15, v15, 0x1

    .line 841
    goto :goto_43b

    .line 844
    :cond_460
    const/16 v20, 0x20

    move/from16 v0, v20

    if-ge v7, v0, :cond_46a

    .line 845
    move v13, v11

    .line 846
    add-int/lit8 v15, v15, 0x5

    .line 847
    goto :goto_43b

    .line 850
    :cond_46a
    const/16 v20, 0x7f

    move/from16 v0, v20

    if-lt v7, v0, :cond_43b

    .line 851
    move v13, v11

    .line 852
    add-int/lit8 v15, v15, 0x5

    .line 853
    goto :goto_43b

    .line 857
    .end local v7    # "ch":C
    :cond_474
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-le v15, v0, :cond_488

    .line 858
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 860
    :cond_488
    move-object/from16 v0, p0

    iput v15, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 862
    move v11, v13

    :goto_48d
    move/from16 v0, v18

    if-lt v11, v0, :cond_619

    .line 863
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    aget-char v7, v20, v11

    .line 865
    .restart local v7    # "ch":C
    const/16 v20, 0x8

    move/from16 v0, v20

    if-eq v7, v0, :cond_4b7

    const/16 v20, 0xc

    move/from16 v0, v20

    if-eq v7, v0, :cond_4b7

    const/16 v20, 0xa

    move/from16 v0, v20

    if-eq v7, v0, :cond_4b7

    const/16 v20, 0xd

    move/from16 v0, v20

    if-eq v7, v0, :cond_4b7

    const/16 v20, 0x9

    move/from16 v0, v20

    if-ne v7, v0, :cond_4eb

    .line 870
    :cond_4b7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v22, v0

    add-int/lit8 v23, v11, 0x2

    sub-int v24, v9, v11

    add-int/lit8 v24, v24, -0x1

    invoke-static/range {v20 .. v24}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 871
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    const/16 v21, 0x5c

    aput-char v21, v20, v11

    .line 872
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v22, v22, v7

    aput-char v22, v20, v21

    .line 873
    add-int/lit8 v9, v9, 0x1

    .line 862
    :cond_4e8
    :goto_4e8
    add-int/lit8 v11, v11, -0x1

    goto :goto_48d

    .line 877
    :cond_4eb
    const/16 v20, 0x22

    move/from16 v0, v20

    if-eq v7, v0, :cond_4fd

    const/16 v20, 0x2f

    move/from16 v0, v20

    if-eq v7, v0, :cond_4fd

    const/16 v20, 0x5c

    move/from16 v0, v20

    if-ne v7, v0, :cond_52b

    .line 880
    :cond_4fd
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v22, v0

    add-int/lit8 v23, v11, 0x2

    sub-int v24, v9, v11

    add-int/lit8 v24, v24, -0x1

    invoke-static/range {v20 .. v24}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 881
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    const/16 v21, 0x5c

    aput-char v21, v20, v11

    .line 882
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    aput-char v7, v20, v21

    .line 883
    add-int/lit8 v9, v9, 0x1

    .line 884
    goto :goto_4e8

    .line 887
    :cond_52b
    const/16 v20, 0x20

    move/from16 v0, v20

    if-ge v7, v0, :cond_59c

    .line 888
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v22, v0

    add-int/lit8 v23, v11, 0x6

    sub-int v24, v9, v11

    add-int/lit8 v24, v24, -0x1

    invoke-static/range {v20 .. v24}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 889
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    const/16 v21, 0x5c

    aput-char v21, v20, v11

    .line 890
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    const/16 v22, 0x75

    aput-char v22, v20, v21

    .line 891
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x2

    const/16 v22, 0x30

    aput-char v22, v20, v21

    .line 892
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x3

    const/16 v22, 0x30

    aput-char v22, v20, v21

    .line 893
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x4

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    mul-int/lit8 v23, v7, 0x2

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 894
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x5

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->ASCII_CHARS:[C

    mul-int/lit8 v23, v7, 0x2

    add-int/lit8 v23, v23, 0x1

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 895
    add-int/lit8 v9, v9, 0x5

    .line 896
    goto/16 :goto_4e8

    .line 899
    :cond_59c
    const/16 v20, 0x7f

    move/from16 v0, v20

    if-lt v7, v0, :cond_4e8

    .line 900
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v22, v0

    add-int/lit8 v23, v11, 0x6

    sub-int v24, v9, v11

    add-int/lit8 v24, v24, -0x1

    invoke-static/range {v20 .. v24}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 901
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    const/16 v21, 0x5c

    aput-char v21, v20, v11

    .line 902
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x1

    const/16 v22, 0x75

    aput-char v22, v20, v21

    .line 903
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x2

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v23, v7, 0xc

    and-int/lit8 v23, v23, 0xf

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 904
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x3

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v23, v7, 0x8

    and-int/lit8 v23, v23, 0xf

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 905
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x4

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v23, v7, 0x4

    and-int/lit8 v23, v23, 0xf

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 906
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v21, v11, 0x5

    sget-object v22, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v23, v7, 0xf

    aget-char v22, v22, v23

    aput-char v22, v20, v21

    .line 907
    add-int/lit8 v9, v9, 0x5

    goto/16 :goto_4e8

    .line 911
    .end local v7    # "ch":C
    :cond_619
    if-eqz p2, :cond_63f

    .line 912
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x2

    const/16 v22, 0x22

    aput-char v22, v20, v21

    .line 913
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    aput-char p2, v20, v21

    goto/16 :goto_e

    .line 915
    :cond_63f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    const/16 v22, 0x22

    aput-char v22, v20, v21

    goto/16 :goto_e

    .line 921
    .end local v11    # "i":I
    .end local v13    # "lastSpecialIndex":I
    :cond_653
    const/16 v16, 0x0

    .line 922
    .local v16, "specialCount":I
    const/4 v13, -0x1

    .line 923
    .restart local v13    # "lastSpecialIndex":I
    const/4 v10, -0x1

    .line 924
    .local v10, "firstSpecialIndex":I
    const/4 v12, 0x0

    .line 926
    .local v12, "lastSpecial":C
    move/from16 v11, v18

    .restart local v11    # "i":I
    :goto_65a
    if-ge v11, v9, :cond_6cd

    .line 927
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    aget-char v7, v20, v11

    .line 929
    .restart local v7    # "ch":C
    const/16 v20, 0x2028

    move/from16 v0, v20

    if-ne v7, v0, :cond_67a

    .line 930
    add-int/lit8 v16, v16, 0x1

    .line 931
    move v13, v11

    .line 932
    move v12, v7

    .line 933
    add-int/lit8 v15, v15, 0x4

    .line 935
    const/16 v20, -0x1

    move/from16 v0, v20

    if-ne v10, v0, :cond_677

    .line 936
    move v10, v11

    .line 926
    :cond_677
    :goto_677
    add-int/lit8 v11, v11, 0x1

    goto :goto_65a

    .line 941
    :cond_67a
    const/16 v20, 0x5d

    move/from16 v0, v20

    if-lt v7, v0, :cond_69a

    .line 942
    const/16 v20, 0x7f

    move/from16 v0, v20

    if-lt v7, v0, :cond_677

    const/16 v20, 0xa0

    move/from16 v0, v20

    if-gt v7, v0, :cond_677

    .line 943
    const/16 v20, -0x1

    move/from16 v0, v20

    if-ne v10, v0, :cond_693

    .line 944
    move v10, v11

    .line 947
    :cond_693
    add-int/lit8 v16, v16, 0x1

    .line 948
    move v13, v11

    .line 949
    move v12, v7

    .line 950
    add-int/lit8 v15, v15, 0x4

    goto :goto_677

    .line 955
    :cond_69a
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->features:I

    move/from16 v20, v0

    move/from16 v0, v20

    invoke-static {v7, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isSpecial(CI)Z

    move-result v20

    if-eqz v20, :cond_677

    .line 956
    add-int/lit8 v16, v16, 0x1

    .line 957
    move v13, v11

    .line 958
    move v12, v7

    .line 960
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v7, v0, :cond_6c5

    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v20, v20, v7

    const/16 v21, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_6c5

    .line 963
    add-int/lit8 v15, v15, 0x4

    .line 966
    :cond_6c5
    const/16 v20, -0x1

    move/from16 v0, v20

    if-ne v10, v0, :cond_677

    .line 967
    move v10, v11

    goto :goto_677

    .line 972
    .end local v7    # "ch":C
    :cond_6cd
    if-lez v16, :cond_75a

    .line 973
    add-int v15, v15, v16

    .line 974
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-le v15, v0, :cond_6e5

    .line 975
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 977
    :cond_6e5
    move-object/from16 v0, p0

    iput v15, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 979
    const/16 v20, 0x1

    move/from16 v0, v16

    move/from16 v1, v20

    if-ne v0, v1, :cond_84d

    .line 980
    const/16 v20, 0x2028

    move/from16 v0, v20

    if-ne v12, v0, :cond_780

    .line 981
    add-int/lit8 v17, v13, 0x1

    .line 982
    .local v17, "srcPos":I
    add-int/lit8 v8, v13, 0x6

    .line 983
    .local v8, "destPos":I
    sub-int v20, v9, v13

    add-int/lit8 v4, v20, -0x1

    .line 984
    .local v4, "LengthOfCopy":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move/from16 v1, v17

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 985
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    const/16 v21, 0x5c

    aput-char v21, v20, v13

    .line 986
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v13, v13, 0x1

    const/16 v21, 0x75

    aput-char v21, v20, v13

    .line 987
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v13, v13, 0x1

    const/16 v21, 0x32

    aput-char v21, v20, v13

    .line 988
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v13, v13, 0x1

    const/16 v21, 0x30

    aput-char v21, v20, v13

    .line 989
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v13, v13, 0x1

    const/16 v21, 0x32

    aput-char v21, v20, v13

    .line 990
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v13, v13, 0x1

    const/16 v21, 0x38

    aput-char v21, v20, v13

    .line 1054
    .end local v4    # "LengthOfCopy":I
    .end local v8    # "destPos":I
    .end local v17    # "srcPos":I
    :cond_75a
    :goto_75a
    if-eqz p2, :cond_980

    .line 1055
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x2

    const/16 v22, 0x22

    aput-char v22, v20, v21

    .line 1056
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    aput-char p2, v20, v21

    goto/16 :goto_e

    .line 992
    :cond_780
    move v7, v12

    .line 993
    .restart local v7    # "ch":C
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v7, v0, :cond_816

    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v20, v20, v7

    const/16 v21, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_816

    .line 995
    add-int/lit8 v17, v13, 0x1

    .line 996
    .restart local v17    # "srcPos":I
    add-int/lit8 v8, v13, 0x6

    .line 997
    .restart local v8    # "destPos":I
    sub-int v20, v9, v13

    add-int/lit8 v4, v20, -0x1

    .line 998
    .restart local v4    # "LengthOfCopy":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move/from16 v1, v17

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1000
    move v5, v13

    .line 1001
    .local v5, "bufIndex":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .local v6, "bufIndex":I
    const/16 v21, 0x5c

    aput-char v21, v20, v5

    .line 1002
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    const/16 v21, 0x75

    aput-char v21, v20, v6

    .line 1003
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v22, v7, 0xc

    and-int/lit8 v22, v22, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v5

    .line 1004
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v22, v7, 0x8

    and-int/lit8 v22, v22, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v6

    .line 1005
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v22, v7, 0x4

    and-int/lit8 v22, v22, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v5

    .line 1006
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v22, v7, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v6

    goto/16 :goto_75a

    .line 1008
    .end local v4    # "LengthOfCopy":I
    .end local v5    # "bufIndex":I
    .end local v8    # "destPos":I
    .end local v17    # "srcPos":I
    :cond_816
    add-int/lit8 v17, v13, 0x1

    .line 1009
    .restart local v17    # "srcPos":I
    add-int/lit8 v8, v13, 0x2

    .line 1010
    .restart local v8    # "destPos":I
    sub-int v20, v9, v13

    add-int/lit8 v4, v20, -0x1

    .line 1011
    .restart local v4    # "LengthOfCopy":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v21, v0

    move-object/from16 v0, v20

    move/from16 v1, v17

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2, v8, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1012
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    const/16 v21, 0x5c

    aput-char v21, v20, v13

    .line 1013
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v13, v13, 0x1

    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v21, v21, v7

    aput-char v21, v20, v13

    goto/16 :goto_75a

    .line 1016
    .end local v4    # "LengthOfCopy":I
    .end local v7    # "ch":C
    .end local v8    # "destPos":I
    .end local v17    # "srcPos":I
    :cond_84d
    const/16 v20, 0x1

    move/from16 v0, v16

    move/from16 v1, v20

    if-le v0, v1, :cond_75a

    .line 1017
    sub-int v19, v10, v18

    .line 1018
    .local v19, "textIndex":I
    move v5, v10

    .line 1019
    .restart local v5    # "bufIndex":I
    move/from16 v11, v19

    :goto_85a
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v20

    move/from16 v0, v20

    if-ge v11, v0, :cond_75a

    .line 1020
    move-object/from16 v0, p1

    invoke-virtual {v0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 1022
    .restart local v7    # "ch":C
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v20

    if-ge v7, v0, :cond_879

    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v20, v20, v7

    if-nez v20, :cond_88b

    :cond_879
    const/16 v20, 0x2f

    move/from16 v0, v20

    if-ne v7, v0, :cond_90c

    sget-object v20, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 1024
    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v20

    if-eqz v20, :cond_90c

    .line 1025
    :cond_88b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    const/16 v21, 0x5c

    aput-char v21, v20, v5

    .line 1026
    sget-object v20, Lcom/alibaba/fastjson/util/IOUtils;->specicalFlags_doubleQuotes:[B

    aget-byte v20, v20, v7

    const/16 v21, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_8fb

    .line 1027
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    const/16 v21, 0x75

    aput-char v21, v20, v6

    .line 1028
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v22, v7, 0xc

    and-int/lit8 v22, v22, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v5

    .line 1029
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v22, v7, 0x8

    and-int/lit8 v22, v22, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v6

    .line 1030
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v22, v7, 0x4

    and-int/lit8 v22, v22, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v5

    .line 1031
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v22, v7, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v6

    .line 1032
    add-int/lit8 v9, v9, 0x5

    .line 1019
    :goto_8f7
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_85a

    .line 1034
    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    :cond_8fb
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v21, v21, v7

    aput-char v21, v20, v6

    .line 1035
    add-int/lit8 v9, v9, 0x1

    goto :goto_8f7

    .line 1038
    :cond_90c
    const/16 v20, 0x2028

    move/from16 v0, v20

    if-ne v7, v0, :cond_973

    .line 1039
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    const/16 v21, 0x5c

    aput-char v21, v20, v5

    .line 1040
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    const/16 v21, 0x75

    aput-char v21, v20, v6

    .line 1041
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v22, v7, 0xc

    and-int/lit8 v22, v22, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v5

    .line 1042
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v22, v7, 0x8

    and-int/lit8 v22, v22, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v6

    .line 1043
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    ushr-int/lit8 v22, v7, 0x4

    and-int/lit8 v22, v22, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v5

    .line 1044
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    sget-object v21, Lcom/alibaba/fastjson/util/IOUtils;->DIGITS:[C

    and-int/lit8 v22, v7, 0xf

    aget-char v21, v21, v22

    aput-char v21, v20, v6

    .line 1045
    add-int/lit8 v9, v9, 0x5

    goto :goto_8f7

    .line 1047
    :cond_973
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "bufIndex":I
    .restart local v6    # "bufIndex":I
    aput-char v7, v20, v5

    move v5, v6

    .end local v6    # "bufIndex":I
    .restart local v5    # "bufIndex":I
    goto/16 :goto_8f7

    .line 1058
    .end local v5    # "bufIndex":I
    .end local v7    # "ch":C
    .end local v19    # "textIndex":I
    :cond_980
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x1

    const/16 v22, 0x22

    aput-char v22, v20, v21

    goto/16 :goto_e
.end method

.method protected writeStringWithSingleQuote(Ljava/lang/String;)V
    .registers 16
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 1630
    if-nez p1, :cond_1c

    .line 1631
    iget v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v6, v9, 0x4

    .line 1632
    .local v6, "newcount":I
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v9, v9

    if-le v6, v9, :cond_e

    .line 1633
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1635
    :cond_e
    const-string v9, "null"

    const/4 v10, 0x0

    const/4 v11, 0x4

    iget-object v12, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v13, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-virtual {v9, v10, v11, v12, v13}, Ljava/lang/String;->getChars(II[CI)V

    .line 1636
    iput v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1710
    :goto_1b
    return-void

    .line 1640
    .end local v6    # "newcount":I
    :cond_1c
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 1641
    .local v5, "len":I
    iget v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/2addr v9, v5

    add-int/lit8 v6, v9, 0x2

    .line 1642
    .restart local v6    # "newcount":I
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v9, v9

    if-le v6, v9, :cond_72

    .line 1643
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v9, :cond_6f

    .line 1644
    const/16 v9, 0x27

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1645
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_34
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v2, v9, :cond_69

    .line 1646
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1647
    .local v0, "ch":C
    const/16 v9, 0xd

    if-le v0, v9, :cond_56

    const/16 v9, 0x5c

    if-eq v0, v9, :cond_56

    const/16 v9, 0x27

    if-eq v0, v9, :cond_56

    const/16 v9, 0x2f

    if-ne v0, v9, :cond_65

    sget-object v9, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 1648
    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v9

    if-eqz v9, :cond_65

    .line 1649
    :cond_56
    const/16 v9, 0x5c

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1650
    sget-object v9, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v9, v9, v0

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 1645
    :goto_62
    add-int/lit8 v2, v2, 0x1

    goto :goto_34

    .line 1652
    :cond_65
    invoke-virtual {p0, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_62

    .line 1655
    .end local v0    # "ch":C
    :cond_69
    const/16 v9, 0x27

    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_1b

    .line 1658
    .end local v2    # "i":I
    :cond_6f
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1661
    :cond_72
    iget v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v8, v9, 0x1

    .line 1662
    .local v8, "start":I
    add-int v1, v8, v5

    .line 1664
    .local v1, "end":I
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    const/16 v11, 0x27

    aput-char v11, v9, v10

    .line 1665
    const/4 v9, 0x0

    iget-object v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    invoke-virtual {p1, v9, v5, v10, v8}, Ljava/lang/String;->getChars(II[CI)V

    .line 1666
    iput v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1668
    const/4 v7, 0x0

    .line 1669
    .local v7, "specialCount":I
    const/4 v4, -0x1

    .line 1670
    .local v4, "lastSpecialIndex":I
    const/4 v3, 0x0

    .line 1671
    .local v3, "lastSpecial":C
    move v2, v8

    .restart local v2    # "i":I
    :goto_8c
    if-ge v2, v1, :cond_b1

    .line 1672
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aget-char v0, v9, v2

    .line 1673
    .restart local v0    # "ch":C
    const/16 v9, 0xd

    if-le v0, v9, :cond_aa

    const/16 v9, 0x5c

    if-eq v0, v9, :cond_aa

    const/16 v9, 0x27

    if-eq v0, v9, :cond_aa

    const/16 v9, 0x2f

    if-ne v0, v9, :cond_ae

    sget-object v9, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 1674
    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v9

    if-eqz v9, :cond_ae

    .line 1675
    :cond_aa
    add-int/lit8 v7, v7, 0x1

    .line 1676
    move v4, v2

    .line 1677
    move v3, v0

    .line 1671
    :cond_ae
    add-int/lit8 v2, v2, 0x1

    goto :goto_8c

    .line 1681
    .end local v0    # "ch":C
    :cond_b1
    add-int/2addr v6, v7

    .line 1682
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    array-length v9, v9

    if-le v6, v9, :cond_ba

    .line 1683
    invoke-virtual {p0, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->expandCapacity(I)V

    .line 1685
    :cond_ba
    iput v6, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    .line 1687
    const/4 v9, 0x1

    if-ne v7, v9, :cond_ea

    .line 1688
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v10, v4, 0x1

    iget-object v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v12, v4, 0x2

    sub-int v13, v1, v4

    add-int/lit8 v13, v13, -0x1

    invoke-static {v9, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1689
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/16 v10, 0x5c

    aput-char v10, v9, v4

    .line 1690
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v4, v4, 0x1

    sget-object v10, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v10, v10, v3

    aput-char v10, v9, v4

    .line 1709
    :cond_de
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    iget v10, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    add-int/lit8 v10, v10, -0x1

    const/16 v11, 0x27

    aput-char v11, v9, v10

    goto/16 :goto_1b

    .line 1691
    :cond_ea
    const/4 v9, 0x1

    if-le v7, v9, :cond_de

    .line 1692
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v10, v4, 0x1

    iget-object v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v12, v4, 0x2

    sub-int v13, v1, v4

    add-int/lit8 v13, v13, -0x1

    invoke-static {v9, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1693
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/16 v10, 0x5c

    aput-char v10, v9, v4

    .line 1694
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v4, v4, 0x1

    sget-object v10, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v10, v10, v3

    aput-char v10, v9, v4

    .line 1695
    add-int/lit8 v1, v1, 0x1

    .line 1696
    add-int/lit8 v2, v4, -0x2

    :goto_110
    if-lt v2, v8, :cond_de

    .line 1697
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    aget-char v0, v9, v2

    .line 1699
    .restart local v0    # "ch":C
    const/16 v9, 0xd

    if-le v0, v9, :cond_12e

    const/16 v9, 0x5c

    if-eq v0, v9, :cond_12e

    const/16 v9, 0x27

    if-eq v0, v9, :cond_12e

    const/16 v9, 0x2f

    if-ne v0, v9, :cond_14f

    sget-object v9, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteSlashAsSpecial:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    .line 1700
    invoke-virtual {p0, v9}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v9

    if-eqz v9, :cond_14f

    .line 1701
    :cond_12e
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v10, v2, 0x1

    iget-object v11, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v12, v2, 0x2

    sub-int v13, v1, v2

    add-int/lit8 v13, v13, -0x1

    invoke-static {v9, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1702
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/16 v10, 0x5c

    aput-char v10, v9, v2

    .line 1703
    iget-object v9, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    add-int/lit8 v10, v2, 0x1

    sget-object v11, Lcom/alibaba/fastjson/util/IOUtils;->replaceChars:[C

    aget-char v11, v11, v0

    aput-char v11, v9, v10

    .line 1704
    add-int/lit8 v1, v1, 0x1

    .line 1696
    :cond_14f
    add-int/lit8 v2, v2, -0x1

    goto :goto_110
.end method

.method public writeTo(Ljava/io/OutputStream;Ljava/lang/String;)V
    .registers 4
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "charsetName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 313
    invoke-static {p2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeTo(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 314
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 317
    invoke-virtual {p0, p1, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeToEx(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)I

    .line 318
    return-void
.end method

.method public writeTo(Ljava/io/Writer;)V
    .registers 5
    .param p1, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 306
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v0, :cond_c

    .line 307
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "writer not null"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 309
    :cond_c
    iget-object v0, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/4 v1, 0x0

    iget v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/Writer;->write([CII)V

    .line 310
    return-void
.end method

.method public writeToEx(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)I
    .registers 8
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 321
    iget-object v1, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writer:Ljava/io/Writer;

    if-eqz v1, :cond_c

    .line 322
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v2, "writer not null"

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 325
    :cond_c
    sget-object v1, Lcom/alibaba/fastjson/util/IOUtils;->UTF8:Ljava/nio/charset/Charset;

    if-ne p2, v1, :cond_15

    .line 326
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->encodeToUTF8(Ljava/io/OutputStream;)I

    move-result v1

    .line 330
    :goto_14
    return v1

    .line 328
    :cond_15
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->buf:[C

    const/4 v3, 0x0

    iget v4, p0, Lcom/alibaba/fastjson/serializer/SerializeWriter;->count:I

    invoke-direct {v1, v2, v3, v4}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 329
    .local v0, "bytes":[B
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 330
    array-length v1, v0

    goto :goto_14
.end method
