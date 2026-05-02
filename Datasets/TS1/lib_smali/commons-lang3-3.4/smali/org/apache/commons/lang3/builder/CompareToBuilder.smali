.class public Lorg/apache/commons/lang3/builder/CompareToBuilder;
.super Ljava/lang/Object;
.source "CompareToBuilder.java"

# interfaces
.implements Lorg/apache/commons/lang3/builder/Builder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/commons/lang3/builder/Builder",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private comparison:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    .line 113
    return-void
.end method

.method private static reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang3/builder/CompareToBuilder;Z[Ljava/lang/String;)V
    .registers 12
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p3, "builder"    # Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .param p4, "useTransients"    # Z
    .param p5, "excludeFields"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/apache/commons/lang3/builder/CompareToBuilder;",
            "Z[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 321
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    .line 322
    .local v2, "fields":[Ljava/lang/reflect/Field;
    const/4 v4, 0x1

    invoke-static {v2, v4}, Ljava/lang/reflect/AccessibleObject;->setAccessible([Ljava/lang/reflect/AccessibleObject;Z)V

    .line 323
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_9
    array-length v4, v2

    if-ge v3, v4, :cond_56

    iget v4, p3, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v4, :cond_56

    .line 324
    aget-object v1, v2, v3

    .line 325
    .local v1, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p5, v4}, Lorg/apache/commons/lang3/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4a

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x24

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_4a

    if-nez p4, :cond_35

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v4

    if-nez v4, :cond_4a

    :cond_35
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-nez v4, :cond_4a

    .line 330
    :try_start_3f
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p3, v4, v5}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    :try_end_4a
    .catch Ljava/lang/IllegalAccessException; {:try_start_3f .. :try_end_4a} :catch_4d

    .line 323
    :cond_4a
    add-int/lit8 v3, v3, 0x1

    goto :goto_9

    .line 331
    :catch_4d
    move-exception v0

    .line 334
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v4, Ljava/lang/InternalError;

    const-string v5, "Unexpected IllegalAccessException"

    invoke-direct {v4, v5}, Ljava/lang/InternalError;-><init>(Ljava/lang/String;)V

    throw v4

    .line 338
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :cond_56
    return-void
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 5
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 143
    const/4 v0, 0x0

    new-array v1, v2, [Ljava/lang/String;

    invoke-static {p0, p1, v2, v0, v1}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Collection;)I
    .registers 4
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 208
    .local p2, "excludeFields":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {p2}, Lorg/apache/commons/lang3/builder/ReflectionToStringBuilder;->toNoNullStringArray(Ljava/util/Collection;)[Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;Z)I
    .registers 5
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "compareTransients"    # Z

    .prologue
    .line 175
    const/4 v0, 0x0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {p0, p1, p2, v0, v1}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static varargs reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I
    .registers 11
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "compareTransients"    # Z
    .param p4, "excludeFields"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Z",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 283
    .local p3, "reflectUpToClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-ne p0, p1, :cond_4

    .line 284
    const/4 v0, 0x0

    .line 299
    :goto_3
    return v0

    .line 286
    :cond_4
    if-eqz p0, :cond_8

    if-nez p1, :cond_e

    .line 287
    :cond_8
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 289
    :cond_e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 290
    .local v2, "lhsClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 291
    new-instance v0, Ljava/lang/ClassCastException;

    invoke-direct {v0}, Ljava/lang/ClassCastException;-><init>()V

    throw v0

    .line 293
    :cond_1e
    new-instance v3, Lorg/apache/commons/lang3/builder/CompareToBuilder;

    invoke-direct {v3}, Lorg/apache/commons/lang3/builder/CompareToBuilder;-><init>()V

    .local v3, "compareToBuilder":Lorg/apache/commons/lang3/builder/CompareToBuilder;
    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p4

    .line 294
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang3/builder/CompareToBuilder;Z[Ljava/lang/String;)V

    .line 295
    :goto_2a
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_3e

    if-eq v2, p3, :cond_3e

    .line 296
    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move-object v5, p4

    .line 297
    invoke-static/range {v0 .. v5}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionAppend(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Class;Lorg/apache/commons/lang3/builder/CompareToBuilder;Z[Ljava/lang/String;)V

    goto :goto_2a

    .line 299
    :cond_3e
    invoke-virtual {v3}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->toComparison()I

    move-result v0

    goto :goto_3
.end method

.method public static varargs reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/String;)I
    .registers 5
    .param p0, "lhs"    # Ljava/lang/Object;
    .param p1, "rhs"    # Ljava/lang/Object;
    .param p2, "excludeFields"    # [Ljava/lang/String;

    .prologue
    .line 241
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p0, p1, v0, v1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->reflectionCompare(Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Class;[Ljava/lang/String;)I

    move-result v0

    return v0
.end method


# virtual methods
.method public append(BB)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 4
    .param p1, "lhs"    # B
    .param p2, "rhs"    # B

    .prologue
    .line 535
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_5

    .line 539
    :goto_4
    return-object p0

    .line 538
    :cond_5
    if-ge p1, p2, :cond_b

    const/4 v0, -0x1

    :goto_8
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4

    :cond_b
    if-le p1, p2, :cond_f

    const/4 v0, 0x1

    goto :goto_8

    :cond_f
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public append(CC)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 4
    .param p1, "lhs"    # C
    .param p2, "rhs"    # C

    .prologue
    .line 519
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_5

    .line 523
    :goto_4
    return-object p0

    .line 522
    :cond_5
    if-ge p1, p2, :cond_b

    const/4 v0, -0x1

    :goto_8
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4

    :cond_b
    if-le p1, p2, :cond_f

    const/4 v0, 0x1

    goto :goto_8

    :cond_f
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public append(DD)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 6
    .param p1, "lhs"    # D
    .param p3, "rhs"    # D

    .prologue
    .line 556
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_5

    .line 560
    :goto_4
    return-object p0

    .line 559
    :cond_5
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Double;->compare(DD)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4
.end method

.method public append(FF)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 4
    .param p1, "lhs"    # F
    .param p2, "rhs"    # F

    .prologue
    .line 577
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_5

    .line 581
    :goto_4
    return-object p0

    .line 580
    :cond_5
    invoke-static {p1, p2}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4
.end method

.method public append(II)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 4
    .param p1, "lhs"    # I
    .param p2, "rhs"    # I

    .prologue
    .line 487
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_5

    .line 491
    :goto_4
    return-object p0

    .line 490
    :cond_5
    if-ge p1, p2, :cond_b

    const/4 v0, -0x1

    :goto_8
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4

    :cond_b
    if-le p1, p2, :cond_f

    const/4 v0, 0x1

    goto :goto_8

    :cond_f
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public append(JJ)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 6
    .param p1, "lhs"    # J
    .param p3, "rhs"    # J

    .prologue
    .line 471
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_5

    .line 475
    :goto_4
    return-object p0

    .line 474
    :cond_5
    cmp-long v0, p1, p3

    if-gez v0, :cond_d

    const/4 v0, -0x1

    :goto_a
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4

    :cond_d
    cmp-long v0, p1, p3

    if-lez v0, :cond_13

    const/4 v0, 0x1

    goto :goto_a

    :cond_13
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public append(Ljava/lang/Object;Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 4
    .param p1, "lhs"    # Ljava/lang/Object;
    .param p2, "rhs"    # Ljava/lang/Object;

    .prologue
    .line 378
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 7
    .param p1, "lhs"    # Ljava/lang/Object;
    .param p2, "rhs"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/Comparator",
            "<*>;)",
            "Lorg/apache/commons/lang3/builder/CompareToBuilder;"
        }
    .end annotation

    .prologue
    .line 407
    .local p3, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<*>;"
    iget v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v2, :cond_5

    .line 458
    .end local p1    # "lhs":Ljava/lang/Object;
    .end local p2    # "rhs":Ljava/lang/Object;
    :cond_4
    :goto_4
    return-object p0

    .line 410
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_5
    if-eq p1, p2, :cond_4

    .line 413
    if-nez p1, :cond_d

    .line 414
    const/4 v2, -0x1

    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4

    .line 417
    :cond_d
    if-nez p2, :cond_13

    .line 418
    const/4 v2, 0x1

    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4

    .line 421
    :cond_13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_ac

    .line 425
    instance-of v2, p1, [J

    if-eqz v2, :cond_2d

    .line 426
    check-cast p1, [J

    .end local p1    # "lhs":Ljava/lang/Object;
    check-cast p1, [J

    check-cast p2, [J

    .end local p2    # "rhs":Ljava/lang/Object;
    check-cast p2, [J

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([J[J)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_4

    .line 427
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_2d
    instance-of v2, p1, [I

    if-eqz v2, :cond_3d

    .line 428
    check-cast p1, [I

    .end local p1    # "lhs":Ljava/lang/Object;
    check-cast p1, [I

    check-cast p2, [I

    .end local p2    # "rhs":Ljava/lang/Object;
    check-cast p2, [I

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([I[I)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_4

    .line 429
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_3d
    instance-of v2, p1, [S

    if-eqz v2, :cond_4d

    .line 430
    check-cast p1, [S

    .end local p1    # "lhs":Ljava/lang/Object;
    check-cast p1, [S

    check-cast p2, [S

    .end local p2    # "rhs":Ljava/lang/Object;
    check-cast p2, [S

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([S[S)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_4

    .line 431
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_4d
    instance-of v2, p1, [C

    if-eqz v2, :cond_5d

    .line 432
    check-cast p1, [C

    .end local p1    # "lhs":Ljava/lang/Object;
    check-cast p1, [C

    check-cast p2, [C

    .end local p2    # "rhs":Ljava/lang/Object;
    check-cast p2, [C

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([C[C)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_4

    .line 433
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_5d
    instance-of v2, p1, [B

    if-eqz v2, :cond_6d

    .line 434
    check-cast p1, [B

    .end local p1    # "lhs":Ljava/lang/Object;
    check-cast p1, [B

    check-cast p2, [B

    .end local p2    # "rhs":Ljava/lang/Object;
    check-cast p2, [B

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([B[B)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_4

    .line 435
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_6d
    instance-of v2, p1, [D

    if-eqz v2, :cond_7d

    .line 436
    check-cast p1, [D

    .end local p1    # "lhs":Ljava/lang/Object;
    check-cast p1, [D

    check-cast p2, [D

    .end local p2    # "rhs":Ljava/lang/Object;
    check-cast p2, [D

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([D[D)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto :goto_4

    .line 437
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_7d
    instance-of v2, p1, [F

    if-eqz v2, :cond_8e

    .line 438
    check-cast p1, [F

    .end local p1    # "lhs":Ljava/lang/Object;
    check-cast p1, [F

    check-cast p2, [F

    .end local p2    # "rhs":Ljava/lang/Object;
    check-cast p2, [F

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([F[F)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto/16 :goto_4

    .line 439
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_8e
    instance-of v2, p1, [Z

    if-eqz v2, :cond_9f

    .line 440
    check-cast p1, [Z

    .end local p1    # "lhs":Ljava/lang/Object;
    check-cast p1, [Z

    check-cast p2, [Z

    .end local p2    # "rhs":Ljava/lang/Object;
    check-cast p2, [Z

    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([Z[Z)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto/16 :goto_4

    .line 444
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_9f
    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "lhs":Ljava/lang/Object;
    check-cast p1, [Ljava/lang/Object;

    check-cast p2, [Ljava/lang/Object;

    .end local p2    # "rhs":Ljava/lang/Object;
    check-cast p2, [Ljava/lang/Object;

    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([Ljava/lang/Object;[Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    goto/16 :goto_4

    .line 448
    .restart local p1    # "lhs":Ljava/lang/Object;
    .restart local p2    # "rhs":Ljava/lang/Object;
    :cond_ac
    if-nez p3, :cond_b9

    move-object v0, p1

    .line 450
    check-cast v0, Ljava/lang/Comparable;

    .line 451
    .local v0, "comparable":Ljava/lang/Comparable;, "Ljava/lang/Comparable<Ljava/lang/Object;>;"
    invoke-interface {v0, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v2

    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto/16 :goto_4

    .line 454
    .end local v0    # "comparable":Ljava/lang/Comparable;, "Ljava/lang/Comparable<Ljava/lang/Object;>;"
    :cond_b9
    move-object v1, p3

    .line 455
    .local v1, "comparator2":Ljava/util/Comparator;, "Ljava/util/Comparator<Ljava/lang/Object;>;"
    invoke-interface {v1, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto/16 :goto_4
.end method

.method public append(SS)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 4
    .param p1, "lhs"    # S
    .param p2, "rhs"    # S

    .prologue
    .line 503
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_5

    .line 507
    :goto_4
    return-object p0

    .line 506
    :cond_5
    if-ge p1, p2, :cond_b

    const/4 v0, -0x1

    :goto_8
    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4

    :cond_b
    if-le p1, p2, :cond_f

    const/4 v0, 0x1

    goto :goto_8

    :cond_f
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public append(ZZ)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 4
    .param p1, "lhs"    # Z
    .param p2, "rhs"    # Z

    .prologue
    .line 593
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_5

    .line 604
    :cond_4
    :goto_4
    return-object p0

    .line 596
    :cond_5
    if-eq p1, p2, :cond_4

    .line 599
    if-nez p1, :cond_d

    .line 600
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4

    .line 602
    :cond_d
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4
.end method

.method public append([B[B)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 8
    .param p1, "lhs"    # [B
    .param p2, "rhs"    # [B

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 856
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_7

    .line 877
    :cond_6
    :goto_6
    return-object p0

    .line 859
    :cond_7
    if-eq p1, p2, :cond_6

    .line 862
    if-nez p1, :cond_e

    .line 863
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 866
    :cond_e
    if-nez p2, :cond_13

    .line 867
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 870
    :cond_13
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_20

    .line 871
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_1e

    :goto_1b
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    :cond_1e
    move v1, v2

    goto :goto_1b

    .line 874
    :cond_20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 875
    aget-byte v1, p1, v0

    aget-byte v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(BB)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 874
    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method public append([C[C)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 8
    .param p1, "lhs"    # [C
    .param p2, "rhs"    # [C

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 816
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_7

    .line 837
    :cond_6
    :goto_6
    return-object p0

    .line 819
    :cond_7
    if-eq p1, p2, :cond_6

    .line 822
    if-nez p1, :cond_e

    .line 823
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 826
    :cond_e
    if-nez p2, :cond_13

    .line 827
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 830
    :cond_13
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_20

    .line 831
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_1e

    :goto_1b
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    :cond_1e
    move v1, v2

    goto :goto_1b

    .line 834
    :cond_20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 835
    aget-char v1, p1, v0

    aget-char v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(CC)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 834
    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method public append([D[D)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 8
    .param p1, "lhs"    # [D
    .param p2, "rhs"    # [D

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 896
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_7

    .line 917
    :cond_6
    :goto_6
    return-object p0

    .line 899
    :cond_7
    if-eq p1, p2, :cond_6

    .line 902
    if-nez p1, :cond_e

    .line 903
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 906
    :cond_e
    if-nez p2, :cond_13

    .line 907
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 910
    :cond_13
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_20

    .line 911
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_1e

    :goto_1b
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    :cond_1e
    move v1, v2

    goto :goto_1b

    .line 914
    :cond_20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 915
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(DD)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 914
    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method public append([F[F)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 8
    .param p1, "lhs"    # [F
    .param p2, "rhs"    # [F

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 936
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_7

    .line 957
    :cond_6
    :goto_6
    return-object p0

    .line 939
    :cond_7
    if-eq p1, p2, :cond_6

    .line 942
    if-nez p1, :cond_e

    .line 943
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 946
    :cond_e
    if-nez p2, :cond_13

    .line 947
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 950
    :cond_13
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_20

    .line 951
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_1e

    :goto_1b
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    :cond_1e
    move v1, v2

    goto :goto_1b

    .line 954
    :cond_20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 955
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(FF)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 954
    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method public append([I[I)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 8
    .param p1, "lhs"    # [I
    .param p2, "rhs"    # [I

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 736
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_7

    .line 757
    :cond_6
    :goto_6
    return-object p0

    .line 739
    :cond_7
    if-eq p1, p2, :cond_6

    .line 742
    if-nez p1, :cond_e

    .line 743
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 746
    :cond_e
    if-nez p2, :cond_13

    .line 747
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 750
    :cond_13
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_20

    .line 751
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_1e

    :goto_1b
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    :cond_1e
    move v1, v2

    goto :goto_1b

    .line 754
    :cond_20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 755
    aget v1, p1, v0

    aget v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(II)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 754
    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method public append([J[J)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 8
    .param p1, "lhs"    # [J
    .param p2, "rhs"    # [J

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 696
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_7

    .line 717
    :cond_6
    :goto_6
    return-object p0

    .line 699
    :cond_7
    if-eq p1, p2, :cond_6

    .line 702
    if-nez p1, :cond_e

    .line 703
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 706
    :cond_e
    if-nez p2, :cond_13

    .line 707
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 710
    :cond_13
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_20

    .line 711
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_1e

    :goto_1b
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    :cond_1e
    move v1, v2

    goto :goto_1b

    .line 714
    :cond_20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 715
    aget-wide v1, p1, v0

    aget-wide v3, p2, v0

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(JJ)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 714
    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method public append([Ljava/lang/Object;[Ljava/lang/Object;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 4
    .param p1, "lhs"    # [Ljava/lang/Object;
    .param p2, "rhs"    # [Ljava/lang/Object;

    .prologue
    .line 629
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append([Ljava/lang/Object;[Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    move-result-object v0

    return-object v0
.end method

.method public append([Ljava/lang/Object;[Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 9
    .param p1, "lhs"    # [Ljava/lang/Object;
    .param p2, "rhs"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            "Ljava/util/Comparator",
            "<*>;)",
            "Lorg/apache/commons/lang3/builder/CompareToBuilder;"
        }
    .end annotation

    .prologue
    .local p3, "comparator":Ljava/util/Comparator;, "Ljava/util/Comparator<*>;"
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 656
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_7

    .line 677
    :cond_6
    :goto_6
    return-object p0

    .line 659
    :cond_7
    if-eq p1, p2, :cond_6

    .line 662
    if-nez p1, :cond_e

    .line 663
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 666
    :cond_e
    if-nez p2, :cond_13

    .line 667
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 670
    :cond_13
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_20

    .line 671
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_1e

    :goto_1b
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    :cond_1e
    move v1, v2

    goto :goto_1b

    .line 674
    :cond_20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 675
    aget-object v1, p1, v0

    aget-object v2, p2, v0

    invoke-virtual {p0, v1, v2, p3}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 674
    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method public append([S[S)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 8
    .param p1, "lhs"    # [S
    .param p2, "rhs"    # [S

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 776
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_7

    .line 797
    :cond_6
    :goto_6
    return-object p0

    .line 779
    :cond_7
    if-eq p1, p2, :cond_6

    .line 782
    if-nez p1, :cond_e

    .line 783
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 786
    :cond_e
    if-nez p2, :cond_13

    .line 787
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 790
    :cond_13
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_20

    .line 791
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_1e

    :goto_1b
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    :cond_1e
    move v1, v2

    goto :goto_1b

    .line 794
    :cond_20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 795
    aget-short v1, p1, v0

    aget-short v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(SS)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 794
    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method public append([Z[Z)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 8
    .param p1, "lhs"    # [Z
    .param p2, "rhs"    # [Z

    .prologue
    const/4 v2, 0x1

    const/4 v1, -0x1

    .line 976
    iget v3, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v3, :cond_7

    .line 997
    :cond_6
    :goto_6
    return-object p0

    .line 979
    :cond_7
    if-eq p1, p2, :cond_6

    .line 982
    if-nez p1, :cond_e

    .line 983
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 986
    :cond_e
    if-nez p2, :cond_13

    .line 987
    iput v2, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    .line 990
    :cond_13
    array-length v3, p1

    array-length v4, p2

    if-eq v3, v4, :cond_20

    .line 991
    array-length v3, p1

    array-length v4, p2

    if-ge v3, v4, :cond_1e

    :goto_1b
    iput v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_6

    :cond_1e
    move v1, v2

    goto :goto_1b

    .line 994
    :cond_20
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_21
    array-length v1, p1

    if-ge v0, v1, :cond_6

    iget v1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-nez v1, :cond_6

    .line 995
    aget-boolean v1, p1, v0

    aget-boolean v2, p2, v0

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->append(ZZ)Lorg/apache/commons/lang3/builder/CompareToBuilder;

    .line 994
    add-int/lit8 v0, v0, 0x1

    goto :goto_21
.end method

.method public appendSuper(I)Lorg/apache/commons/lang3/builder/CompareToBuilder;
    .registers 3
    .param p1, "superCompareTo"    # I

    .prologue
    .line 350
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    if-eqz v0, :cond_5

    .line 354
    :goto_4
    return-object p0

    .line 353
    :cond_5
    iput p1, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    goto :goto_4
.end method

.method public build()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 1026
    invoke-virtual {p0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->toComparison()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic build()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/apache/commons/lang3/builder/CompareToBuilder;->build()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public toComparison()I
    .registers 2

    .prologue
    .line 1011
    iget v0, p0, Lorg/apache/commons/lang3/builder/CompareToBuilder;->comparison:I

    return v0
.end method
