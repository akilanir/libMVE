.class public abstract Lorg/apache/commons/lang3/tuple/Triple;
.super Ljava/lang/Object;
.source "Triple.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<",
        "L:Ljava/lang/Object;",
        "M:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/apache/commons/lang3/tuple/Triple",
        "<T",
        "L;",
        "TM;TR;>;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    .local p0, "this":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<TL;TM;TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static of(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/tuple/Triple;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            "M:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(T",
            "L;",
            "TM;TR;)",
            "Lorg/apache/commons/lang3/tuple/Triple",
            "<T",
            "L;",
            "TM;TR;>;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "left":Ljava/lang/Object;, "TL;"
    .local p1, "middle":Ljava/lang/Object;, "TM;"
    .local p2, "right":Ljava/lang/Object;, "TR;"
    new-instance v0, Lorg/apache/commons/lang3/tuple/ImmutableTriple;

    invoke-direct {v0, p0, p1, p2}, Lorg/apache/commons/lang3/tuple/ImmutableTriple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 41
    .local p0, "this":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<TL;TM;TR;>;"
    check-cast p1, Lorg/apache/commons/lang3/tuple/Triple;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/commons/lang3/tuple/Triple;->compareTo(Lorg/apache/commons/lang3/tuple/Triple;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/apache/commons/lang3/tuple/Triple;)I
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/commons/lang3/tuple/Triple",
            "<T",
            "L;",
            "TM;TR;>;)I"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<TL;TM;TR;>;"
    .local p1, "other":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<TL;TM;TR;>;"
    new-instance v0, Lorg/apache/commons/lang3/builder/CompareToBuilder;

    invoke-direct {v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getLeft()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/lang3/tuple/Triple;->getLeft()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getMiddle()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/lang3/tuple/Triple;->getMiddle()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getRight()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1}, Lorg/apache/commons/lang3/tuple/Triple;->getRight()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->toComparison()I

    move-result v0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<TL;TM;TR;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 111
    if-ne p1, p0, :cond_5

    .line 120
    :cond_4
    :goto_4
    return v1

    .line 114
    :cond_5
    instance-of v3, p1, Lorg/apache/commons/lang3/tuple/Triple;

    if-eqz v3, :cond_38

    move-object v0, p1

    .line 115
    check-cast v0, Lorg/apache/commons/lang3/tuple/Triple;

    .line 116
    .local v0, "other":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<***>;"
    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getLeft()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/lang3/tuple/Triple;->getLeft()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/apache/commons/lang3/ObjectUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getMiddle()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/lang3/tuple/Triple;->getMiddle()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/apache/commons/lang3/ObjectUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getRight()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/commons/lang3/tuple/Triple;->getRight()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/apache/commons/lang3/ObjectUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    :cond_36
    move v1, v2

    goto :goto_4

    .end local v0    # "other":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<***>;"
    :cond_38
    move v1, v2

    .line 120
    goto :goto_4
.end method

.method public abstract getLeft()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()T",
            "L;"
        }
    .end annotation
.end method

.method public abstract getMiddle()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TM;"
        }
    .end annotation
.end method

.method public abstract getRight()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TR;"
        }
    .end annotation
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<TL;TM;TR;>;"
    const/4 v1, 0x0

    .line 130
    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getLeft()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_18

    move v0, v1

    :goto_8
    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getMiddle()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_21

    move v2, v1

    :goto_f
    xor-int/2addr v0, v2

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getRight()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_2a

    :goto_16
    xor-int/2addr v0, v1

    return v0

    :cond_18
    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getLeft()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_8

    :cond_21
    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getMiddle()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_f

    :cond_2a
    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getRight()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_16
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .local p0, "this":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<TL;TM;TR;>;"
    const/16 v2, 0x2c

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getLeft()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getMiddle()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getRight()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 158
    .local p0, "this":Lorg/apache/commons/lang3/tuple/Triple;, "Lorg/apache/commons/lang3/tuple/Triple<TL;TM;TR;>;"
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getLeft()Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getMiddle()Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    invoke-virtual {p0}, Lorg/apache/commons/lang3/tuple/Triple;->getRight()Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
