.class Lcom/google/common/net/TrieParser;
.super Ljava/lang/Object;
.source "TrieParser.java"


# annotations
.annotation build Lcom/google/common/annotations/GwtCompatible;
.end annotation


# static fields
.field private static final PREFIX_JOINER:Lcom/google/common/base/Joiner;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 32
    const-string v0, ""

    invoke-static {v0}, Lcom/google/common/base/Joiner;->on(Ljava/lang/String;)Lcom/google/common/base/Joiner;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/TrieParser;->PREFIX_JOINER:Lcom/google/common/base/Joiner;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static doParseTrieToBuilder(Ljava/util/List;Ljava/lang/CharSequence;Lcom/google/common/collect/ImmutableSet$Builder;)I
    .registers 11
    .param p1, "encoded"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/CharSequence;",
            ">;",
            "Ljava/lang/CharSequence;",
            "Lcom/google/common/collect/ImmutableSet$Builder",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .local p0, "stack":Ljava/util/List;, "Ljava/util/List<Ljava/lang/CharSequence;>;"
    .local p2, "builder":Lcom/google/common/collect/ImmutableSet$Builder;, "Lcom/google/common/collect/ImmutableSet$Builder<Ljava/lang/String;>;"
    const/16 v7, 0x21

    const/4 v6, 0x0

    const/16 v5, 0x3f

    .line 65
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 66
    .local v2, "encodedLen":I
    const/4 v3, 0x0

    .line 67
    .local v3, "idx":I
    const/4 v0, 0x0

    .line 70
    .local v0, "c":C
    :goto_b
    if-ge v3, v2, :cond_19

    .line 71
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    .line 72
    const/16 v4, 0x26

    if-eq v0, v4, :cond_19

    if-eq v0, v5, :cond_19

    if-ne v0, v7, :cond_52

    .line 77
    :cond_19
    invoke-interface {p1, v6, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Lcom/google/common/net/TrieParser;->reverse(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {p0, v6, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 79
    if-eq v0, v7, :cond_28

    if-ne v0, v5, :cond_37

    .line 82
    :cond_28
    sget-object v4, Lcom/google/common/net/TrieParser;->PREFIX_JOINER:Lcom/google/common/base/Joiner;

    invoke-virtual {v4, p0}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    .line 83
    .local v1, "domain":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_37

    .line 84
    invoke-virtual {p2, v1}, Lcom/google/common/collect/ImmutableSet$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet$Builder;

    .line 87
    .end local v1    # "domain":Ljava/lang/String;
    :cond_37
    add-int/lit8 v3, v3, 0x1

    .line 89
    if-eq v0, v5, :cond_4e

    .line 90
    :cond_3b
    if-ge v3, v2, :cond_4e

    .line 92
    invoke-interface {p1, v3, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {p0, v4, p2}, Lcom/google/common/net/TrieParser;->doParseTrieToBuilder(Ljava/util/List;Ljava/lang/CharSequence;Lcom/google/common/collect/ImmutableSet$Builder;)I

    move-result v4

    add-int/2addr v3, v4

    .line 93
    invoke-interface {p1, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    if-ne v4, v5, :cond_3b

    .line 95
    add-int/lit8 v3, v3, 0x1

    .line 100
    :cond_4e
    invoke-interface {p0, v6}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 101
    return v3

    .line 70
    :cond_52
    add-int/lit8 v3, v3, 0x1

    goto :goto_b
.end method

.method static parseTrie(Ljava/lang/CharSequence;)Lcom/google/common/collect/ImmutableSet;
    .registers 6
    .param p0, "encoded"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")",
            "Lcom/google/common/collect/ImmutableSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->builder()Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object v0

    .line 40
    .local v0, "builder":Lcom/google/common/collect/ImmutableSet$Builder;, "Lcom/google/common/collect/ImmutableSet$Builder<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 41
    .local v1, "encodedLen":I
    const/4 v2, 0x0

    .line 42
    .local v2, "idx":I
    :goto_9
    if-ge v2, v1, :cond_19

    .line 43
    invoke-static {}, Lcom/google/common/collect/Lists;->newLinkedList()Ljava/util/LinkedList;

    move-result-object v3

    invoke-interface {p0, v2, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v3, v4, v0}, Lcom/google/common/net/TrieParser;->doParseTrieToBuilder(Ljava/util/List;Ljava/lang/CharSequence;Lcom/google/common/collect/ImmutableSet$Builder;)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_9

    .line 48
    :cond_19
    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet$Builder;->build()Lcom/google/common/collect/ImmutableSet;

    move-result-object v3

    return-object v3
.end method

.method private static reverse(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 6
    .param p0, "s"    # Ljava/lang/CharSequence;

    .prologue
    .line 110
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    .line 111
    .local v2, "length":I
    const/4 v3, 0x1

    if-gt v2, v3, :cond_8

    .line 125
    .end local p0    # "s":Ljava/lang/CharSequence;
    :goto_7
    return-object p0

    .line 115
    .restart local p0    # "s":Ljava/lang/CharSequence;
    :cond_8
    new-array v0, v2, [C

    .line 116
    .local v0, "buffer":[C
    const/4 v3, 0x0

    add-int/lit8 v4, v2, -0x1

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    aput-char v4, v0, v3

    .line 118
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_14
    if-ge v1, v2, :cond_33

    .line 119
    add-int/lit8 v3, v2, -0x1

    sub-int/2addr v3, v1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    aput-char v3, v0, v1

    .line 120
    aget-char v3, v0, v1

    add-int/lit8 v4, v1, -0x1

    aget-char v4, v0, v4

    invoke-static {v3, v4}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 121
    add-int/lit8 v3, v1, -0x1

    invoke-static {v0, v3, v1}, Lcom/google/common/net/TrieParser;->swap([CII)V

    .line 118
    :cond_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 125
    :cond_33
    new-instance p0, Ljava/lang/String;

    .end local p0    # "s":Ljava/lang/CharSequence;
    invoke-direct {p0, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_7
.end method

.method private static swap([CII)V
    .registers 5
    .param p0, "buffer"    # [C
    .param p1, "f"    # I
    .param p2, "s"    # I

    .prologue
    .line 129
    aget-char v0, p0, p1

    .line 130
    .local v0, "tmp":C
    aget-char v1, p0, p2

    aput-char v1, p0, p1

    .line 131
    aput-char v0, p0, p2

    .line 132
    return-void
.end method
