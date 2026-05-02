.class Lorg/junit/runner/FilterFactories;
.super Ljava/lang/Object;
.source "FilterFactories.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFilter(Ljava/lang/Class;Lorg/junit/runner/FilterFactoryParams;)Lorg/junit/runner/manipulation/Filter;
    .registers 4
    .param p1, "params"    # Lorg/junit/runner/FilterFactoryParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/junit/runner/FilterFactory;",
            ">;",
            "Lorg/junit/runner/FilterFactoryParams;",
            ")",
            "Lorg/junit/runner/manipulation/Filter;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/FilterFactory$FilterNotCreatedException;
        }
    .end annotation

    .prologue
    .line 57
    .local p0, "filterFactoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/junit/runner/FilterFactory;>;"
    invoke-static {p0}, Lorg/junit/runner/FilterFactories;->createFilterFactory(Ljava/lang/Class;)Lorg/junit/runner/FilterFactory;

    move-result-object v0

    .line 59
    .local v0, "filterFactory":Lorg/junit/runner/FilterFactory;
    invoke-interface {v0, p1}, Lorg/junit/runner/FilterFactory;->createFilter(Lorg/junit/runner/FilterFactoryParams;)Lorg/junit/runner/manipulation/Filter;

    move-result-object v1

    return-object v1
.end method

.method public static createFilter(Ljava/lang/String;Lorg/junit/runner/FilterFactoryParams;)Lorg/junit/runner/manipulation/Filter;
    .registers 4
    .param p0, "filterFactoryFqcn"    # Ljava/lang/String;
    .param p1, "params"    # Lorg/junit/runner/FilterFactoryParams;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/FilterFactory$FilterNotCreatedException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-static {p0}, Lorg/junit/runner/FilterFactories;->createFilterFactory(Ljava/lang/String;)Lorg/junit/runner/FilterFactory;

    move-result-object v0

    .line 45
    .local v0, "filterFactory":Lorg/junit/runner/FilterFactory;
    invoke-interface {v0, p1}, Lorg/junit/runner/FilterFactory;->createFilter(Lorg/junit/runner/FilterFactoryParams;)Lorg/junit/runner/manipulation/Filter;

    move-result-object v1

    return-object v1
.end method

.method static createFilterFactory(Ljava/lang/Class;)Lorg/junit/runner/FilterFactory;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/junit/runner/FilterFactory;",
            ">;)",
            "Lorg/junit/runner/FilterFactory;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/FilterFactory$FilterNotCreatedException;
        }
    .end annotation

    .prologue
    .line 77
    .local p0, "filterFactoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/junit/runner/FilterFactory;>;"
    const/4 v1, 0x0

    :try_start_1
    new-array v1, v1, [Ljava/lang/Class;

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runner/FilterFactory;
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_10} :catch_11

    return-object v1

    .line 78
    :catch_11
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lorg/junit/runner/FilterFactory$FilterNotCreatedException;

    invoke-direct {v1, v0}, Lorg/junit/runner/FilterFactory$FilterNotCreatedException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method

.method static createFilterFactory(Ljava/lang/String;)Lorg/junit/runner/FilterFactory;
    .registers 5
    .param p0, "filterFactoryFqcn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/FilterFactory$FilterNotCreatedException;
        }
    .end annotation

    .prologue
    .line 66
    :try_start_0
    invoke-static {p0}, Lorg/junit/internal/Classes;->getClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-class v3, Lorg/junit/runner/FilterFactory;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->asSubclass(Ljava/lang/Class;)Ljava/lang/Class;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_f

    move-result-object v1

    .line 71
    .local v1, "filterFactoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/junit/runner/FilterFactory;>;"
    invoke-static {v1}, Lorg/junit/runner/FilterFactories;->createFilterFactory(Ljava/lang/Class;)Lorg/junit/runner/FilterFactory;

    move-result-object v2

    return-object v2

    .line 67
    .end local v1    # "filterFactoryClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/junit/runner/FilterFactory;>;"
    :catch_f
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/junit/runner/FilterFactory$FilterNotCreatedException;

    invoke-direct {v2, v0}, Lorg/junit/runner/FilterFactory$FilterNotCreatedException;-><init>(Ljava/lang/Exception;)V

    throw v2
.end method

.method public static createFilterFromFilterSpec(Lorg/junit/runner/Request;Ljava/lang/String;)Lorg/junit/runner/manipulation/Filter;
    .registers 8
    .param p0, "request"    # Lorg/junit/runner/Request;
    .param p1, "filterSpec"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runner/FilterFactory$FilterNotCreatedException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 23
    invoke-virtual {p0}, Lorg/junit/runner/Request;->getRunner()Lorg/junit/runner/Runner;

    move-result-object v2

    invoke-virtual {v2}, Lorg/junit/runner/Runner;->getDescription()Lorg/junit/runner/Description;

    move-result-object v0

    .line 26
    .local v0, "topLevelDescription":Lorg/junit/runner/Description;
    const-string v2, "="

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 27
    const-string v2, "="

    invoke-virtual {p1, v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 32
    .local v1, "tuple":[Ljava/lang/String;
    :goto_19
    aget-object v2, v1, v3

    new-instance v3, Lorg/junit/runner/FilterFactoryParams;

    aget-object v4, v1, v4

    invoke-direct {v3, v0, v4}, Lorg/junit/runner/FilterFactoryParams;-><init>(Lorg/junit/runner/Description;Ljava/lang/String;)V

    invoke-static {v2, v3}, Lorg/junit/runner/FilterFactories;->createFilter(Ljava/lang/String;Lorg/junit/runner/FilterFactoryParams;)Lorg/junit/runner/manipulation/Filter;

    move-result-object v2

    return-object v2

    .line 29
    .end local v1    # "tuple":[Ljava/lang/String;
    :cond_27
    new-array v1, v5, [Ljava/lang/String;

    aput-object p1, v1, v3

    const-string v2, ""

    aput-object v2, v1, v4

    .restart local v1    # "tuple":[Ljava/lang/String;
    goto :goto_19
.end method
