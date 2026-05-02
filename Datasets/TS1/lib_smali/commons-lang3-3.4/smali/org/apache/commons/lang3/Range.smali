.class public final Lorg/apache/commons/lang3/Range;
.super Ljava/lang/Object;
.source "Range.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/Range$ComparableComparator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final comparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<TT;>;"
        }
    .end annotation
.end field

.field private transient hashCode:I

.field private final maximum:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final minimum:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private transient toString:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;",
            "Ljava/util/Comparator",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 146
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "element1":Ljava/lang/Object;, "TT;"
    .local p2, "element2":Ljava/lang/Object;, "TT;"
    .local p3, "comp":Ljava/util/Comparator;, "Ljava/util/Comparator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    if-eqz p1, :cond_7

    if-nez p2, :cond_2a

    .line 148
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Elements in a range must not be null: element1="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", element2="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 151
    :cond_2a
    if-nez p3, :cond_3e

    .line 152
    sget-object v0, Lorg/apache/commons/lang3/Range$ComparableComparator;->INSTANCE:Lorg/apache/commons/lang3/Range$ComparableComparator;

    iput-object v0, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    .line 156
    :goto_30
    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_41

    .line 157
    iput-object p1, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    .line 158
    iput-object p2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    .line 163
    :goto_3d
    return-void

    .line 154
    :cond_3e
    iput-object p3, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    goto :goto_30

    .line 160
    :cond_41
    iput-object p2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    .line 161
    iput-object p1, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    goto :goto_3d
.end method

.method public static between(Ljava/lang/Comparable;Ljava/lang/Comparable;)Lorg/apache/commons/lang3/Range;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<TT;>;>(TT;TT;)",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 114
    .local p0, "fromInclusive":Ljava/lang/Comparable;, "TT;"
    .local p1, "toInclusive":Ljava/lang/Comparable;, "TT;"
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/Range;->between(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/Range;

    move-result-object v0

    return-object v0
.end method

.method public static between(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/Range;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;",
            "Ljava/util/Comparator",
            "<TT;>;)",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "fromInclusive":Ljava/lang/Object;, "TT;"
    .local p1, "toInclusive":Ljava/lang/Object;, "TT;"
    .local p2, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<TT;>;"
    new-instance v0, Lorg/apache/commons/lang3/Range;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/lang3/Range;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)V

    return-object v0
.end method

.method public static is(Ljava/lang/Comparable;)Lorg/apache/commons/lang3/Range;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/Comparable",
            "<TT;>;>(TT;)",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "element":Ljava/lang/Comparable;, "TT;"
    const/4 v0, 0x0

    invoke-static {p0, p0, v0}, Lorg/apache/commons/lang3/Range;->between(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/Range;

    move-result-object v0

    return-object v0
.end method

.method public static is(Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/Range;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/util/Comparator",
            "<TT;>;)",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "element":Ljava/lang/Object;, "TT;"
    .local p1, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<TT;>;"
    invoke-static {p0, p0, p1}, Lorg/apache/commons/lang3/Range;->between(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/Range;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 220
    if-nez p1, :cond_5

    .line 223
    :goto_4
    return v1

    :cond_5
    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v3, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-interface {v2, p1, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    const/4 v3, -0x1

    if-le v2, v3, :cond_1c

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v3, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-interface {v2, p1, v3}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-ge v2, v0, :cond_1c

    :goto_1a
    move v1, v0

    goto :goto_4

    :cond_1c
    move v0, v1

    goto :goto_1a
.end method

.method public containsRange(Lorg/apache/commons/lang3/Range;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "otherRange":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    const/4 v0, 0x0

    .line 315
    if-nez p1, :cond_4

    .line 318
    :cond_3
    :goto_3
    return v0

    :cond_4
    iget-object v1, p1, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p1, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public elementCompareTo(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    .prologue
    .line 289
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    if-nez p1, :cond_a

    .line 291
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Element is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 293
    :cond_a
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/Range;->isAfter(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 294
    const/4 v0, -0x1

    .line 298
    :goto_11
    return v0

    .line 295
    :cond_12
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/Range;->isBefore(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    .line 296
    const/4 v0, 0x1

    goto :goto_11

    .line 298
    :cond_1a
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 409
    if-ne p1, p0, :cond_5

    .line 417
    :cond_4
    :goto_4
    return v1

    .line 411
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 412
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 416
    check-cast v0, Lorg/apache/commons/lang3/Range;

    .line 417
    .local v0, "range":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v3, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    iget-object v4, v0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    iget-object v3, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    iget-object v4, v0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_2a
    move v1, v2

    goto :goto_4
.end method

.method public getComparator()Ljava/util/Comparator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 195
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    return-object v0
.end method

.method public getMaximum()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 183
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    return-object v0
.end method

.method public getMinimum()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 174
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 429
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    iget v0, p0, Lorg/apache/commons/lang3/Range;->hashCode:I

    .line 430
    .local v0, "result":I
    iget v1, p0, Lorg/apache/commons/lang3/Range;->hashCode:I

    if-nez v1, :cond_28

    .line 431
    const/16 v0, 0x11

    .line 432
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/lit16 v0, v1, 0x275

    .line 433
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 434
    mul-int/lit8 v1, v0, 0x25

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 435
    iput v0, p0, Lorg/apache/commons/lang3/Range;->hashCode:I

    .line 437
    :cond_28
    return v0
.end method

.method public intersectionWith(Lorg/apache/commons/lang3/Range;)Lorg/apache/commons/lang3/Range;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;)",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 383
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "other":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/Range;->isOverlappedBy(Lorg/apache/commons/lang3/Range;)Z

    move-result v2

    if-nez v2, :cond_18

    .line 384
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Cannot calculate intersection with non-overlapping range %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 387
    :cond_18
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/Range;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 392
    .end local p0    # "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    :goto_1e
    return-object p0

    .line 390
    .restart local p0    # "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    :cond_1f
    invoke-virtual {p0}, Lorg/apache/commons/lang3/Range;->getComparator()Ljava/util/Comparator;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    iget-object v4, p1, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-gez v2, :cond_48

    iget-object v1, p1, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    .line 391
    .local v1, "min":Ljava/lang/Object;, "TT;"
    :goto_2f
    invoke-virtual {p0}, Lorg/apache/commons/lang3/Range;->getComparator()Ljava/util/Comparator;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    iget-object v4, p1, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-interface {v2, v3, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    if-gez v2, :cond_4b

    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    .line 392
    .local v0, "max":Ljava/lang/Object;, "TT;"
    :goto_3f
    invoke-virtual {p0}, Lorg/apache/commons/lang3/Range;->getComparator()Ljava/util/Comparator;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lorg/apache/commons/lang3/Range;->between(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/Range;

    move-result-object p0

    goto :goto_1e

    .line 390
    .end local v0    # "max":Ljava/lang/Object;, "TT;"
    .end local v1    # "min":Ljava/lang/Object;, "TT;"
    :cond_48
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    goto :goto_2f

    .line 391
    .restart local v1    # "min":Ljava/lang/Object;, "TT;"
    :cond_4b
    iget-object v0, p1, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    goto :goto_3f
.end method

.method public isAfter(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    .line 233
    if-nez p1, :cond_4

    .line 236
    :cond_3
    :goto_3
    return v0

    :cond_4
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-interface {v1, p1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-gez v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public isAfterRange(Lorg/apache/commons/lang3/Range;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 332
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "otherRange":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    if-nez p1, :cond_4

    .line 333
    const/4 v0, 0x0

    .line 335
    :goto_3
    return v0

    :cond_4
    iget-object v0, p1, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/Range;->isAfter(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public isBefore(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    .line 272
    if-nez p1, :cond_4

    .line 275
    :cond_3
    :goto_3
    return v0

    :cond_4
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-interface {v1, p1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-lez v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public isBeforeRange(Lorg/apache/commons/lang3/Range;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 369
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "otherRange":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    if-nez p1, :cond_4

    .line 370
    const/4 v0, 0x0

    .line 372
    :goto_3
    return v0

    :cond_4
    iget-object v0, p1, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/apache/commons/lang3/Range;->isBefore(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3
.end method

.method public isEndedBy(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    .line 259
    if-nez p1, :cond_4

    .line 262
    :cond_3
    :goto_3
    return v0

    :cond_4
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-interface {v1, p1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-nez v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public isNaturalOrdering()Z
    .registers 3

    .prologue
    .line 207
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v0, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    sget-object v1, Lorg/apache/commons/lang3/Range$ComparableComparator;->INSTANCE:Lorg/apache/commons/lang3/Range$ComparableComparator;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isOverlappedBy(Lorg/apache/commons/lang3/Range;)Z
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/lang3/Range",
            "<TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "otherRange":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    const/4 v0, 0x0

    .line 351
    if-nez p1, :cond_4

    .line 354
    :cond_3
    :goto_3
    return v0

    :cond_4
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-virtual {p1, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    iget-object v1, p1, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lorg/apache/commons/lang3/Range;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_1c
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public isStartedBy(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    .local p1, "element":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    .line 246
    if-nez p1, :cond_4

    .line 249
    :cond_3
    :goto_3
    return v0

    :cond_4
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-interface {v1, p1, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v1

    if-nez v1, :cond_3

    const/4 v0, 0x1

    goto :goto_3
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 449
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    iget-object v1, p0, Lorg/apache/commons/lang3/Range;->toString:Ljava/lang/String;

    .line 450
    .local v1, "result":Ljava/lang/String;
    if-nez v1, :cond_2a

    .line 451
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 452
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v2, 0x5b

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 453
    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 454
    const-string v2, ".."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 456
    const/16 v2, 0x5d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 457
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 458
    iput-object v1, p0, Lorg/apache/commons/lang3/Range;->toString:Ljava/lang/String;

    .line 460
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    :cond_2a
    return-object v1
.end method

.method public toString(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 476
    .local p0, "this":Lorg/apache/commons/lang3/Range;, "Lorg/apache/commons/lang3/Range<TT;>;"
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->minimum:Ljava/lang/Object;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->maximum:Ljava/lang/Object;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lorg/apache/commons/lang3/Range;->comparator:Ljava/util/Comparator;

    aput-object v2, v0, v1

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
