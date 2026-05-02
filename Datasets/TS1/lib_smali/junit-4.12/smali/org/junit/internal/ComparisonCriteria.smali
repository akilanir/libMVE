.class public abstract Lorg/junit/internal/ComparisonCriteria;
.super Ljava/lang/Object;
.source "ComparisonCriteria.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private assertArraysAreSameLength(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)I
    .registers 8
    .param p1, "expecteds"    # Ljava/lang/Object;
    .param p2, "actuals"    # Ljava/lang/Object;
    .param p3, "header"    # Ljava/lang/String;

    .prologue
    .line 67
    if-nez p1, :cond_18

    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "expected array was null"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/junit/Assert;->fail(Ljava/lang/String;)V

    .line 70
    :cond_18
    if-nez p2, :cond_30

    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "actual array was null"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/junit/Assert;->fail(Ljava/lang/String;)V

    .line 73
    :cond_30
    invoke-static {p2}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 74
    .local v0, "actualsLength":I
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    .line 75
    .local v1, "expectedsLength":I
    if-eq v0, v1, :cond_5e

    .line 76
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "array lengths differed, expected.length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " actual.length="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/junit/Assert;->fail(Ljava/lang/String;)V

    .line 79
    :cond_5e
    return v1
.end method

.method private isArray(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "expected"    # Ljava/lang/Object;

    .prologue
    .line 62
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method


# virtual methods
.method public arrayEquals(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 13
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "expecteds"    # Ljava/lang/Object;
    .param p3, "actuals"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/internal/ArrayComparisonFailure;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 28
    if-eq p2, p3, :cond_12

    new-array v6, v7, [Ljava/lang/Object;

    aput-object p2, v6, v8

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p3, v7, v8

    invoke-static {v6, v7}, Ljava/util/Arrays;->deepEquals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13

    .line 59
    :cond_12
    return-void

    .line 35
    :cond_13
    if-nez p1, :cond_38

    const-string v4, ""

    .line 37
    .local v4, "header":Ljava/lang/String;
    :goto_17
    invoke-direct {p0, p2, p3, v4}, Lorg/junit/internal/ComparisonCriteria;->assertArraysAreSameLength(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)I

    move-result v3

    .line 40
    .local v3, "expectedsLength":I
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_1c
    if-ge v5, v3, :cond_12

    .line 41
    invoke-static {p2, v5}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    .line 42
    .local v2, "expected":Ljava/lang/Object;
    invoke-static {p3, v5}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    .line 44
    .local v0, "actual":Ljava/lang/Object;
    invoke-direct {p0, v2}, Lorg/junit/internal/ComparisonCriteria;->isArray(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_51

    invoke-direct {p0, v0}, Lorg/junit/internal/ComparisonCriteria;->isArray(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_51

    .line 46
    :try_start_32
    invoke-virtual {p0, p1, v2, v0}, Lorg/junit/internal/ComparisonCriteria;->arrayEquals(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_35
    .catch Lorg/junit/internal/ArrayComparisonFailure; {:try_start_32 .. :try_end_35} :catch_4c

    .line 40
    :goto_35
    add-int/lit8 v5, v5, 0x1

    goto :goto_1c

    .line 35
    .end local v0    # "actual":Ljava/lang/Object;
    .end local v2    # "expected":Ljava/lang/Object;
    .end local v3    # "expectedsLength":I
    .end local v4    # "header":Ljava/lang/String;
    .end local v5    # "i":I
    :cond_38
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_17

    .line 47
    .restart local v0    # "actual":Ljava/lang/Object;
    .restart local v2    # "expected":Ljava/lang/Object;
    .restart local v3    # "expectedsLength":I
    .restart local v4    # "header":Ljava/lang/String;
    .restart local v5    # "i":I
    :catch_4c
    move-exception v1

    .line 48
    .local v1, "e":Lorg/junit/internal/ArrayComparisonFailure;
    invoke-virtual {v1, v5}, Lorg/junit/internal/ArrayComparisonFailure;->addDimension(I)V

    .line 49
    throw v1

    .line 53
    .end local v1    # "e":Lorg/junit/internal/ArrayComparisonFailure;
    :cond_51
    :try_start_51
    invoke-virtual {p0, v2, v0}, Lorg/junit/internal/ComparisonCriteria;->assertElementsEqual(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_54
    .catch Ljava/lang/AssertionError; {:try_start_51 .. :try_end_54} :catch_55

    goto :goto_35

    .line 54
    :catch_55
    move-exception v1

    .line 55
    .local v1, "e":Ljava/lang/AssertionError;
    new-instance v6, Lorg/junit/internal/ArrayComparisonFailure;

    invoke-direct {v6, v4, v1, v5}, Lorg/junit/internal/ArrayComparisonFailure;-><init>(Ljava/lang/String;Ljava/lang/AssertionError;I)V

    throw v6
.end method

.method protected abstract assertElementsEqual(Ljava/lang/Object;Ljava/lang/Object;)V
.end method
