.class public Lorg/junit/experimental/runners/Enclosed;
.super Lorg/junit/runners/Suite;
.source "Enclosed.java"


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lorg/junit/runners/model/RunnerBuilder;)V
    .registers 4
    .param p2, "builder"    # Lorg/junit/runners/model/RunnerBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/junit/runners/model/RunnerBuilder;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getClasses()[Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/junit/experimental/runners/Enclosed;->filterAbstractClasses([Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, p2, p1, v0}, Lorg/junit/runners/Suite;-><init>(Lorg/junit/runners/model/RunnerBuilder;Ljava/lang/Class;[Ljava/lang/Class;)V

    .line 32
    return-void
.end method

.method private static filterAbstractClasses([Ljava/lang/Class;)[Ljava/lang/Class;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v2, Ljava/util/ArrayList;

    array-length v5, p0

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 37
    .local v2, "filteredList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_9
    if-ge v3, v4, :cond_1d

    aget-object v1, v0, v3

    .line 38
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getModifiers()I

    move-result v5

    invoke-static {v5}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v5

    if-nez v5, :cond_1a

    .line 39
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    :cond_1a
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 43
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1d
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/Class;

    invoke-interface {v2, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/Class;

    return-object v5
.end method
