.class Lorg/msgpack/template/builder/beans/Statement$MethodComparator;
.super Ljava/lang/Object;
.source "Statement.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/msgpack/template/builder/beans/Statement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MethodComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/reflect/Method;",
        ">;"
    }
.end annotation


# static fields
.field static INFINITY:I


# instance fields
.field private final cache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/reflect/Method;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private referenceMethodArgumentTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private referenceMethodName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 509
    const v0, 0x7fffffff

    sput v0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->INFINITY:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[Ljava/lang/Class;)V
    .registers 4
    .param p1, "refMethodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 518
    .local p2, "refArgumentTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 519
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodName:Ljava/lang/String;

    .line 520
    iput-object p2, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodArgumentTypes:[Ljava/lang/Class;

    .line 521
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->cache:Ljava/util/Map;

    .line 522
    return-void
.end method

.method private static getDistance(Ljava/lang/Class;Ljava/lang/Class;)I
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 582
    .local p0, "clz1":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "clz2":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget v8, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->INFINITY:I

    .line 583
    .local v8, "superDist":I
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-nez v9, :cond_b

    .line 584
    sget v9, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->INFINITY:I

    .line 607
    :goto_a
    return v9

    .line 586
    :cond_b
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1b

    .line 587
    const/4 v9, 0x0

    goto :goto_a

    .line 589
    :cond_1b
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v7

    .line 590
    .local v7, "superClz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v7, :cond_25

    .line 591
    invoke-static {v7, p1}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->getDistance(Ljava/lang/Class;Ljava/lang/Class;)I

    move-result v8

    .line 593
    :cond_25
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v9

    if-eqz v9, :cond_4f

    .line 594
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v5

    .line 595
    .local v5, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    sget v1, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->INFINITY:I

    .line 596
    .local v1, "bestDist":I
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_34
    if-ge v4, v6, :cond_42

    aget-object v3, v0, v4

    .line 597
    .local v3, "element":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v3, p1}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->getDistance(Ljava/lang/Class;Ljava/lang/Class;)I

    move-result v2

    .line 598
    .local v2, "curDist":I
    if-ge v2, v1, :cond_3f

    .line 599
    move v1, v2

    .line 596
    :cond_3f
    add-int/lit8 v4, v4, 0x1

    goto :goto_34

    .line 602
    .end local v2    # "curDist":I
    .end local v3    # "element":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_42
    if-ge v8, v1, :cond_45

    .line 603
    move v1, v8

    .line 605
    :cond_45
    sget v9, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->INFINITY:I

    if-eq v1, v9, :cond_4c

    add-int/lit8 v9, v1, 0x1

    goto :goto_a

    :cond_4c
    sget v9, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->INFINITY:I

    goto :goto_a

    .line 607
    .end local v0    # "arr$":[Ljava/lang/Class;
    .end local v1    # "bestDist":I
    .end local v4    # "i$":I
    .end local v5    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v6    # "len$":I
    :cond_4f
    sget v9, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->INFINITY:I

    if-eq v8, v9, :cond_56

    add-int/lit8 v9, v8, 0x2

    goto :goto_a

    :cond_56
    sget v9, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->INFINITY:I

    goto :goto_a
.end method

.method private getNorm(Ljava/lang/reflect/Method;)I
    .registers 8
    .param p1, "m"    # Ljava/lang/reflect/Method;

    .prologue
    .line 547
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    .line 548
    .local v2, "methodName":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 549
    .local v0, "argumentTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v3, 0x0

    .line 550
    .local v3, "totalNorm":I
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodName:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_17

    iget-object v4, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodArgumentTypes:[Ljava/lang/Class;

    array-length v4, v4

    array-length v5, v0

    if-eq v4, v5, :cond_1a

    .line 552
    :cond_17
    sget v4, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->INFINITY:I

    .line 568
    :goto_19
    return v4

    .line 554
    :cond_1a
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1b
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodArgumentTypes:[Ljava/lang/Class;

    array-length v4, v4

    if-ge v1, v4, :cond_5b

    .line 555
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodArgumentTypes:[Ljava/lang/Class;

    aget-object v4, v4, v1

    if-nez v4, :cond_29

    .line 554
    :goto_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_1b

    .line 559
    :cond_29
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodArgumentTypes:[Ljava/lang/Class;

    aget-object v4, v4, v1

    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 560
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodArgumentTypes:[Ljava/lang/Class;

    iget-object v5, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodArgumentTypes:[Ljava/lang/Class;

    aget-object v5, v5, v1

    # invokes: Lorg/msgpack/template/builder/beans/Statement;->getPrimitiveWrapper(Ljava/lang/Class;)Ljava/lang/Class;
    invoke-static {v5}, Lorg/msgpack/template/builder/beans/Statement;->access$000(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v5

    aput-object v5, v4, v1

    .line 562
    :cond_3f
    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-eqz v4, :cond_4f

    .line 563
    aget-object v4, v0, v1

    # invokes: Lorg/msgpack/template/builder/beans/Statement;->getPrimitiveWrapper(Ljava/lang/Class;)Ljava/lang/Class;
    invoke-static {v4}, Lorg/msgpack/template/builder/beans/Statement;->access$000(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v0, v1

    .line 565
    :cond_4f
    iget-object v4, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->referenceMethodArgumentTypes:[Ljava/lang/Class;

    aget-object v4, v4, v1

    aget-object v5, v0, v1

    invoke-static {v4, v5}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->getDistance(Ljava/lang/Class;Ljava/lang/Class;)I

    move-result v4

    add-int/2addr v3, v4

    goto :goto_26

    :cond_5b
    move v4, v3

    .line 568
    goto :goto_19
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 508
    check-cast p1, Ljava/lang/reflect/Method;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/lang/reflect/Method;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->compare(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)I
    .registers 7
    .param p1, "m1"    # Ljava/lang/reflect/Method;
    .param p2, "m2"    # Ljava/lang/reflect/Method;

    .prologue
    .line 525
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->cache:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 526
    .local v0, "norm1":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->cache:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 527
    .local v1, "norm2":Ljava/lang/Integer;
    if-nez v0, :cond_1f

    .line 528
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->getNorm(Ljava/lang/reflect/Method;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 529
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->cache:Ljava/util/Map;

    invoke-interface {v2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 531
    :cond_1f
    if-nez v1, :cond_2e

    .line 532
    invoke-direct {p0, p2}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->getNorm(Ljava/lang/reflect/Method;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 533
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->cache:Ljava/util/Map;

    invoke-interface {v2, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    :cond_2e
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sub-int/2addr v2, v3

    return v2
.end method
