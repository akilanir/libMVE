.class public final Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;
.super Ljava/lang/Object;
.source "TokenBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/databind/util/TokenBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "Segment"
.end annotation


# static fields
.field public static final TOKENS_PER_SEGMENT:I = 0x10

.field private static final TOKEN_TYPES_BY_INDEX:[Lcom/fasterxml/jackson/core/JsonToken;


# instance fields
.field protected _nativeIds:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field protected _next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

.field protected _tokenTypes:J

.field protected final _tokens:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x1

    .line 1552
    const/16 v1, 0x10

    new-array v1, v1, [Lcom/fasterxml/jackson/core/JsonToken;

    sput-object v1, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->TOKEN_TYPES_BY_INDEX:[Lcom/fasterxml/jackson/core/JsonToken;

    .line 1553
    invoke-static {}, Lcom/fasterxml/jackson/core/JsonToken;->values()[Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 1555
    .local v0, "t":[Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->TOKEN_TYPES_BY_INDEX:[Lcom/fasterxml/jackson/core/JsonToken;

    const/16 v2, 0xf

    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1556
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 1580
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1573
    const/16 v0, 0x10

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokens:[Ljava/lang/Object;

    .line 1580
    return-void
.end method

.method private final _objectIdIndex(I)I
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 1783
    add-int v0, p1, p1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private final _typeIdIndex(I)I
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 1782
    add-int v0, p1, p1

    return v0
.end method

.method private final assignNativeIds(ILjava/lang/Object;Ljava/lang/Object;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "objectId"    # Ljava/lang/Object;
    .param p3, "typeId"    # Ljava/lang/Object;

    .prologue
    .line 1757
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_nativeIds:Ljava/util/TreeMap;

    if-nez v0, :cond_b

    .line 1758
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_nativeIds:Ljava/util/TreeMap;

    .line 1760
    :cond_b
    if-eqz p2, :cond_1a

    .line 1761
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_nativeIds:Ljava/util/TreeMap;

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_objectIdIndex(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1763
    :cond_1a
    if-eqz p3, :cond_29

    .line 1764
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_nativeIds:Ljava/util/TreeMap;

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_typeIdIndex(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1766
    :cond_29
    return-void
.end method

.method private set(IILjava/lang/Object;)V
    .registers 8
    .param p1, "index"    # I
    .param p2, "rawTokenType"    # I
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 1736
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokens:[Ljava/lang/Object;

    aput-object p3, v2, p1

    .line 1737
    int-to-long v0, p2

    .line 1738
    .local v0, "typeCode":J
    if-lez p1, :cond_a

    .line 1739
    shl-int/lit8 v2, p1, 0x2

    shl-long/2addr v0, v2

    .line 1741
    :cond_a
    iget-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    or-long/2addr v2, v0

    iput-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    .line 1742
    return-void
.end method

.method private set(IILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10
    .param p1, "index"    # I
    .param p2, "rawTokenType"    # I
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "objectId"    # Ljava/lang/Object;
    .param p5, "typeId"    # Ljava/lang/Object;

    .prologue
    .line 1746
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokens:[Ljava/lang/Object;

    aput-object p3, v2, p1

    .line 1747
    int-to-long v0, p2

    .line 1748
    .local v0, "typeCode":J
    if-lez p1, :cond_a

    .line 1749
    shl-int/lit8 v2, p1, 0x2

    shl-long/2addr v0, v2

    .line 1751
    :cond_a
    iget-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    or-long/2addr v2, v0

    iput-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    .line 1752
    invoke-direct {p0, p1, p4, p5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->assignNativeIds(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1753
    return-void
.end method

.method private set(ILcom/fasterxml/jackson/core/JsonToken;)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "tokenType"    # Lcom/fasterxml/jackson/core/JsonToken;

    .prologue
    .line 1694
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v2

    int-to-long v0, v2

    .line 1695
    .local v0, "typeCode":J
    if-lez p1, :cond_a

    .line 1696
    shl-int/lit8 v2, p1, 0x2

    shl-long/2addr v0, v2

    .line 1698
    :cond_a
    iget-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    or-long/2addr v2, v0

    iput-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    .line 1699
    return-void
.end method

.method private set(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;)V
    .registers 8
    .param p1, "index"    # I
    .param p2, "tokenType"    # Lcom/fasterxml/jackson/core/JsonToken;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 1714
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokens:[Ljava/lang/Object;

    aput-object p3, v2, p1

    .line 1715
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v2

    int-to-long v0, v2

    .line 1716
    .local v0, "typeCode":J
    if-lez p1, :cond_e

    .line 1717
    shl-int/lit8 v2, p1, 0x2

    shl-long/2addr v0, v2

    .line 1719
    :cond_e
    iget-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    or-long/2addr v2, v0

    iput-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    .line 1720
    return-void
.end method

.method private set(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 9
    .param p1, "index"    # I
    .param p2, "tokenType"    # Lcom/fasterxml/jackson/core/JsonToken;
    .param p3, "objectId"    # Ljava/lang/Object;
    .param p4, "typeId"    # Ljava/lang/Object;

    .prologue
    .line 1704
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v2

    int-to-long v0, v2

    .line 1705
    .local v0, "typeCode":J
    if-lez p1, :cond_a

    .line 1706
    shl-int/lit8 v2, p1, 0x2

    shl-long/2addr v0, v2

    .line 1708
    :cond_a
    iget-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    or-long/2addr v2, v0

    iput-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    .line 1709
    invoke-direct {p0, p1, p3, p4}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->assignNativeIds(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1710
    return-void
.end method

.method private set(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10
    .param p1, "index"    # I
    .param p2, "tokenType"    # Lcom/fasterxml/jackson/core/JsonToken;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "objectId"    # Ljava/lang/Object;
    .param p5, "typeId"    # Ljava/lang/Object;

    .prologue
    .line 1725
    iget-object v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokens:[Ljava/lang/Object;

    aput-object p3, v2, p1

    .line 1726
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v2

    int-to-long v0, v2

    .line 1727
    .local v0, "typeCode":J
    if-lez p1, :cond_e

    .line 1728
    shl-int/lit8 v2, p1, 0x2

    shl-long/2addr v0, v2

    .line 1730
    :cond_e
    iget-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    or-long/2addr v2, v0

    iput-wide v2, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    .line 1731
    invoke-direct {p0, p1, p4, p5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->assignNativeIds(ILjava/lang/Object;Ljava/lang/Object;)V

    .line 1732
    return-void
.end method


# virtual methods
.method public append(ILcom/fasterxml/jackson/core/JsonToken;)Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;
    .registers 5
    .param p1, "index"    # I
    .param p2, "tokenType"    # Lcom/fasterxml/jackson/core/JsonToken;

    .prologue
    .line 1622
    const/16 v0, 0x10

    if-ge p1, v0, :cond_9

    .line 1623
    invoke-direct {p0, p1, p2}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(ILcom/fasterxml/jackson/core/JsonToken;)V

    .line 1624
    const/4 v0, 0x0

    .line 1628
    :goto_8
    return-object v0

    .line 1626
    :cond_9
    new-instance v0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    .line 1627
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p2}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(ILcom/fasterxml/jackson/core/JsonToken;)V

    .line 1628
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    goto :goto_8
.end method

.method public append(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;
    .registers 6
    .param p1, "index"    # I
    .param p2, "tokenType"    # Lcom/fasterxml/jackson/core/JsonToken;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 1645
    const/16 v0, 0x10

    if-ge p1, v0, :cond_9

    .line 1646
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;)V

    .line 1647
    const/4 v0, 0x0

    .line 1651
    :goto_8
    return-object v0

    .line 1649
    :cond_9
    new-instance v0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    .line 1650
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p2, p3}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;)V

    .line 1651
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    goto :goto_8
.end method

.method public append(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;
    .registers 7
    .param p1, "index"    # I
    .param p2, "tokenType"    # Lcom/fasterxml/jackson/core/JsonToken;
    .param p3, "objectId"    # Ljava/lang/Object;
    .param p4, "typeId"    # Ljava/lang/Object;

    .prologue
    .line 1634
    const/16 v0, 0x10

    if-ge p1, v0, :cond_9

    .line 1635
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1636
    const/4 v0, 0x0

    .line 1640
    :goto_8
    return-object v0

    .line 1638
    :cond_9
    new-instance v0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    .line 1639
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p2, p3, p4}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1640
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    goto :goto_8
.end method

.method public append(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;
    .registers 12
    .param p1, "index"    # I
    .param p2, "tokenType"    # Lcom/fasterxml/jackson/core/JsonToken;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "objectId"    # Ljava/lang/Object;
    .param p5, "typeId"    # Ljava/lang/Object;

    .prologue
    .line 1657
    const/16 v0, 0x10

    if-ge p1, v0, :cond_9

    .line 1658
    invoke-direct/range {p0 .. p5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1659
    const/4 v0, 0x0

    .line 1663
    :goto_8
    return-object v0

    .line 1661
    :cond_9
    new-instance v0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    .line 1662
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    const/4 v1, 0x0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(ILcom/fasterxml/jackson/core/JsonToken;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1663
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    goto :goto_8
.end method

.method public appendRaw(IILjava/lang/Object;)Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;
    .registers 6
    .param p1, "index"    # I
    .param p2, "rawTokenType"    # I
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 1668
    const/16 v0, 0x10

    if-ge p1, v0, :cond_9

    .line 1669
    invoke-direct {p0, p1, p2, p3}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(IILjava/lang/Object;)V

    .line 1670
    const/4 v0, 0x0

    .line 1674
    :goto_8
    return-object v0

    .line 1672
    :cond_9
    new-instance v0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    .line 1673
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p2, p3}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(IILjava/lang/Object;)V

    .line 1674
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    goto :goto_8
.end method

.method public appendRaw(IILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;
    .registers 12
    .param p1, "index"    # I
    .param p2, "rawTokenType"    # I
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "objectId"    # Ljava/lang/Object;
    .param p5, "typeId"    # Ljava/lang/Object;

    .prologue
    .line 1680
    const/16 v0, 0x10

    if-ge p1, v0, :cond_9

    .line 1681
    invoke-direct/range {p0 .. p5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(IILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1682
    const/4 v0, 0x0

    .line 1686
    :goto_8
    return-object v0

    .line 1684
    :cond_9
    new-instance v0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;-><init>()V

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    .line 1685
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    const/4 v1, 0x0

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->set(IILjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 1686
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    goto :goto_8
.end method

.method public findObjectId(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 1772
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_nativeIds:Ljava/util/TreeMap;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_nativeIds:Ljava/util/TreeMap;

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_objectIdIndex(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5
.end method

.method public findTypeId(I)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 1779
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_nativeIds:Ljava/util/TreeMap;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_nativeIds:Ljava/util/TreeMap;

    invoke-direct {p0, p1}, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_typeIdIndex(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_5
.end method

.method public get(I)Ljava/lang/Object;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 1605
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokens:[Ljava/lang/Object;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public hasIds()Z
    .registers 2

    .prologue
    .line 1615
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_nativeIds:Ljava/util/TreeMap;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public next()Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;
    .registers 2

    .prologue
    .line 1608
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_next:Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;

    return-object v0
.end method

.method public rawType(I)I
    .registers 6
    .param p1, "index"    # I

    .prologue
    .line 1596
    iget-wide v1, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    .line 1597
    .local v1, "l":J
    if-lez p1, :cond_7

    .line 1598
    shl-int/lit8 v3, p1, 0x2

    shr-long/2addr v1, v3

    .line 1600
    :cond_7
    long-to-int v3, v1

    and-int/lit8 v0, v3, 0xf

    .line 1601
    .local v0, "ix":I
    return v0
.end method

.method public type(I)Lcom/fasterxml/jackson/core/JsonToken;
    .registers 6
    .param p1, "index"    # I

    .prologue
    .line 1586
    iget-wide v1, p0, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->_tokenTypes:J

    .line 1587
    .local v1, "l":J
    if-lez p1, :cond_7

    .line 1588
    shl-int/lit8 v3, p1, 0x2

    shr-long/2addr v1, v3

    .line 1590
    :cond_7
    long-to-int v3, v1

    and-int/lit8 v0, v3, 0xf

    .line 1591
    .local v0, "ix":I
    sget-object v3, Lcom/fasterxml/jackson/databind/util/TokenBuffer$Segment;->TOKEN_TYPES_BY_INDEX:[Lcom/fasterxml/jackson/core/JsonToken;

    aget-object v3, v3, v0

    return-object v3
.end method
