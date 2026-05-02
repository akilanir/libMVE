.class public Lcom/github/zafarkhaja/semver/util/Stream;
.super Ljava/lang/Object;
.source "Stream.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/zafarkhaja/semver/util/Stream$ElementType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final elements:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TE;"
        }
    .end annotation
.end field

.field private offset:I


# direct methods
.method public constructor <init>([Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TE;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    .local p1, "elements":[Ljava/lang/Object;, "[TE;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    .line 81
    invoke-virtual {p1}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;

    .line 82
    return-void
.end method

.method static synthetic access$000(Lcom/github/zafarkhaja/semver/util/Stream;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/zafarkhaja/semver/util/Stream;

    .prologue
    .line 41
    iget v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    return v0
.end method

.method static synthetic access$100(Lcom/github/zafarkhaja/semver/util/Stream;)[Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/github/zafarkhaja/semver/util/Stream;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public consume()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 91
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    iget v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    iget-object v1, p0, Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;

    array-length v1, v1

    if-lt v0, v1, :cond_9

    .line 92
    const/4 v0, 0x0

    .line 94
    :goto_8
    return-object v0

    :cond_9
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;

    iget v1, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    aget-object v0, v0, v1

    goto :goto_8
.end method

.method public varargs consume([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
            "<TE;>;>([TT;)TE;"
        }
    .end annotation

    .prologue
    .line 109
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    .local p1, "expected":[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "[TT;"
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead(I)Ljava/lang/Object;

    move-result-object v0

    .line 110
    .local v0, "lookahead":Ljava/lang/Object;, "TE;"
    array-length v3, p1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v3, :cond_19

    aget-object v1, p1, v2

    .line 111
    .local v1, "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    invoke-interface {v1, v0}, Lcom/github/zafarkhaja/semver/util/Stream$ElementType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 112
    invoke-virtual {p0}, Lcom/github/zafarkhaja/semver/util/Stream;->consume()Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 110
    :cond_16
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 115
    .end local v1    # "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    :cond_19
    new-instance v2, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;

    iget v3, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    invoke-direct {v2, v0, v3, p1}, Lcom/github/zafarkhaja/semver/util/UnexpectedElementException;-><init>(Ljava/lang/Object;I[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)V

    throw v2
.end method

.method public currentOffset()I
    .registers 2

    .prologue
    .line 158
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    iget v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 244
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    new-instance v0, Lcom/github/zafarkhaja/semver/util/Stream$1;

    invoke-direct {v0, p0}, Lcom/github/zafarkhaja/semver/util/Stream$1;-><init>(Lcom/github/zafarkhaja/semver/util/Stream;)V

    return-object v0
.end method

.method public lookahead()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 133
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public lookahead(I)Ljava/lang/Object;
    .registers 4
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .prologue
    .line 145
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    iget v1, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    add-int/2addr v1, p1

    add-int/lit8 v0, v1, -0x1

    .line 146
    .local v0, "idx":I
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;

    array-length v1, v1

    if-ge v0, v1, :cond_f

    .line 147
    iget-object v1, p0, Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;

    aget-object v1, v1, v0

    .line 149
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public varargs positiveLookahead([Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
            "<TE;>;>([TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    .local p1, "expected":[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "[TT;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 172
    array-length v4, p1

    move v3, v2

    :goto_4
    if-ge v3, v4, :cond_16

    aget-object v0, p1, v3

    .line 173
    .local v0, "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    invoke-virtual {p0, v1}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v0, v5}, Lcom/github/zafarkhaja/semver/util/Stream$ElementType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 177
    .end local v0    # "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    :goto_12
    return v1

    .line 172
    .restart local v0    # "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    :cond_13
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .end local v0    # "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    :cond_16
    move v1, v2

    .line 177
    goto :goto_12
.end method

.method public varargs positiveLookaheadBefore(Lcom/github/zafarkhaja/semver/util/Stream$ElementType;[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
            "<TE;>;>(",
            "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
            "<TE;>;[TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    .local p1, "before":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    .local p2, "expected":[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "[TT;"
    const/4 v3, 0x0

    .line 197
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_2
    iget-object v4, p0, Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;

    array-length v4, v4

    if-gt v0, v4, :cond_11

    .line 198
    invoke-virtual {p0, v0}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead(I)Ljava/lang/Object;

    move-result-object v1

    .line 199
    .local v1, "lookahead":Ljava/lang/Object;, "TE;"
    invoke-interface {p1, v1}, Lcom/github/zafarkhaja/semver/util/Stream$ElementType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 208
    .end local v1    # "lookahead":Ljava/lang/Object;, "TE;"
    :cond_11
    :goto_11
    return v3

    .line 202
    .restart local v1    # "lookahead":Ljava/lang/Object;, "TE;"
    :cond_12
    array-length v5, p2

    move v4, v3

    :goto_14
    if-ge v4, v5, :cond_23

    aget-object v2, p2, v4

    .line 203
    .local v2, "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    invoke-interface {v2, v1}, Lcom/github/zafarkhaja/semver/util/Stream$ElementType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_20

    .line 204
    const/4 v3, 0x1

    goto :goto_11

    .line 202
    :cond_20
    add-int/lit8 v4, v4, 0x1

    goto :goto_14

    .line 197
    .end local v2    # "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    :cond_23
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public varargs positiveLookaheadUntil(I[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;)Z
    .registers 9
    .param p1, "until"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/github/zafarkhaja/semver/util/Stream$ElementType",
            "<TE;>;>(I[TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    .local p2, "expected":[Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "[TT;"
    const/4 v2, 0x0

    .line 227
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_2
    if-gt v0, p1, :cond_15

    .line 228
    array-length v4, p2

    move v3, v2

    :goto_6
    if-ge v3, v4, :cond_19

    aget-object v1, p2, v3

    .line 229
    .local v1, "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    invoke-virtual {p0, v0}, Lcom/github/zafarkhaja/semver/util/Stream;->lookahead(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v1, v5}, Lcom/github/zafarkhaja/semver/util/Stream$ElementType;->isMatchedBy(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 230
    const/4 v2, 0x1

    .line 234
    .end local v1    # "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    :cond_15
    return v2

    .line 228
    .restart local v1    # "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    :cond_16
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 227
    .end local v1    # "type":Lcom/github/zafarkhaja/semver/util/Stream$ElementType;, "Lcom/github/zafarkhaja/semver/util/Stream$ElementType<TE;>;"
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public pushBack()V
    .registers 2

    .prologue
    .line 122
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    iget v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    if-lez v0, :cond_a

    .line 123
    iget v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    .line 125
    :cond_a
    return-void
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[TE;"
        }
    .end annotation

    .prologue
    .line 294
    .local p0, "this":Lcom/github/zafarkhaja/semver/util/Stream;, "Lcom/github/zafarkhaja/semver/util/Stream<TE;>;"
    iget-object v0, p0, Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;

    iget v1, p0, Lcom/github/zafarkhaja/semver/util/Stream;->offset:I

    iget-object v2, p0, Lcom/github/zafarkhaja/semver/util/Stream;->elements:[Ljava/lang/Object;

    array-length v2, v2

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
