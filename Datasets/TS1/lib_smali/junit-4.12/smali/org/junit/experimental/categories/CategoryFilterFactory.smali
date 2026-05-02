.class abstract Lorg/junit/experimental/categories/CategoryFilterFactory;
.super Ljava/lang/Object;
.source "CategoryFilterFactory.java"

# interfaces
.implements Lorg/junit/runner/FilterFactory;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private parseCategories(Ljava/lang/String;)Ljava/util/List;
    .registers 9
    .param p1, "categories"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 37
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .local v3, "categoryClasses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Class<*>;>;"
    const-string v6, ","

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_d
    if-ge v4, v5, :cond_1b

    aget-object v1, v0, v4

    .line 40
    .local v1, "category":Ljava/lang/String;
    invoke-static {v1}, Lorg/junit/internal/Classes;->getClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 42
    .local v2, "categoryClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    .line 45
    .end local v1    # "category":Ljava/lang/String;
    .end local v2    # "categoryClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1b
    return-object v3
.end method


# virtual methods
.method protected abstract createFilter(Ljava/util/List;)Lorg/junit/runner/manipulation/Filter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)",
            "Lorg/junit/runner/manipulation/Filter;"
        }
    .end annotation
.end method

.method public createFilter(Lorg/junit/runner/FilterFactoryParams;)Lorg/junit/runner/manipulation/Filter;
    .registers 4
    .param p1, "params"    # Lorg/junit/runner/FilterFactoryParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/FilterFactory$FilterNotCreatedException;
        }
    .end annotation

    .prologue
    .line 23
    :try_start_0
    invoke-virtual {p1}, Lorg/junit/runner/FilterFactoryParams;->getArgs()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/junit/experimental/categories/CategoryFilterFactory;->parseCategories(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/junit/experimental/categories/CategoryFilterFactory;->createFilter(Ljava/util/List;)Lorg/junit/runner/manipulation/Filter;
    :try_end_b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_b} :catch_d

    move-result-object v1

    return-object v1

    .line 24
    :catch_d
    move-exception v0

    .line 25
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Lorg/junit/runner/FilterFactory$FilterNotCreatedException;

    invoke-direct {v1, v0}, Lorg/junit/runner/FilterFactory$FilterNotCreatedException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method
