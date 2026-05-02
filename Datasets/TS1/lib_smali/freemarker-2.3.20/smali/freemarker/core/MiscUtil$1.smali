.class final Lfreemarker/core/MiscUtil$1;
.super Ljava/lang/Object;
.source "MiscUtil.java"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 10
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 28
    move-object v0, p1

    check-cast v0, Ljava/util/Map$Entry;

    .line 29
    .local v0, "ent1":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/core/Expression;

    .local v2, "exp1":Lfreemarker/core/Expression;
    move-object v1, p2

    .line 31
    check-cast v1, Ljava/util/Map$Entry;

    .line 32
    .local v1, "ent2":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/core/Expression;

    .line 34
    .local v3, "exp2":Lfreemarker/core/Expression;
    iget v5, v2, Lfreemarker/core/Expression;->beginLine:I

    iget v6, v3, Lfreemarker/core/Expression;->beginLine:I

    sub-int v4, v5, v6

    .line 35
    .local v4, "res":I
    if-eqz v4, :cond_1c

    move v5, v4

    .line 42
    :goto_1b
    return v5

    .line 36
    :cond_1c
    iget v5, v2, Lfreemarker/core/Expression;->beginColumn:I

    iget v6, v3, Lfreemarker/core/Expression;->beginColumn:I

    sub-int v4, v5, v6

    .line 37
    if-eqz v4, :cond_26

    move v5, v4

    goto :goto_1b

    .line 39
    :cond_26
    if-ne v0, v1, :cond_2a

    const/4 v5, 0x0

    goto :goto_1b

    .line 42
    :cond_2a
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    goto :goto_1b
.end method
