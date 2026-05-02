.class public Lorg/junit/internal/runners/TestClass;
.super Ljava/lang/Object;
.source "TestClass.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final klass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 26
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lorg/junit/internal/runners/TestClass;->klass:Ljava/lang/Class;

    .line 28
    return-void
.end method

.method private getSuperClasses(Ljava/lang/Class;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 88
    .local p1, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .local v1, "results":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Class<*>;>;"
    move-object v0, p1

    .line 90
    .local v0, "current":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_6
    if-eqz v0, :cond_10

    .line 91
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_6

    .line 94
    :cond_10
    return-object v1
.end method

.method private isShadowed(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)Z
    .registers 7
    .param p1, "current"    # Ljava/lang/reflect/Method;
    .param p2, "previous"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v1, 0x0

    .line 73
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    .line 84
    :cond_f
    :goto_f
    return v1

    .line 76
    :cond_10
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    array-length v2, v2

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    array-length v3, v3

    if-ne v2, v3, :cond_f

    .line 79
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_39

    .line 80
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    aget-object v2, v2, v0

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 79
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 84
    :cond_39
    const/4 v1, 0x1

    goto :goto_f
.end method

.method private isShadowed(Ljava/lang/reflect/Method;Ljava/util/List;)Z
    .registers 6
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 64
    .local p2, "results":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    .line 65
    .local v0, "each":Ljava/lang/reflect/Method;
    invoke-direct {p0, p1, v0}, Lorg/junit/internal/runners/TestClass;->isShadowed(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 66
    const/4 v2, 0x1

    .line 69
    .end local v0    # "each":Ljava/lang/reflect/Method;
    :goto_17
    return v2

    :cond_18
    const/4 v2, 0x0

    goto :goto_17
.end method

.method private runsTopToBottom(Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 60
    .local p1, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    const-class v0, Lorg/junit/Before;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const-class v0, Lorg/junit/BeforeClass;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method


# virtual methods
.method getAfters()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .prologue
    .line 39
    const-class v0, Lorg/junit/AfterClass;

    invoke-virtual {p0, v0}, Lorg/junit/internal/runners/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .local v8, "results":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    iget-object v9, p0, Lorg/junit/internal/runners/TestClass;->klass:Ljava/lang/Class;

    invoke-direct {p0, v9}, Lorg/junit/internal/runners/TestClass;->getSuperClasses(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_38

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 45
    .local v2, "eachClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v2}, Lorg/junit/internal/MethodSorter;->getDeclaredMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v7

    .line 46
    .local v7, "methods":[Ljava/lang/reflect/Method;
    move-object v1, v7

    .local v1, "arr$":[Ljava/lang/reflect/Method;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_22
    if-ge v5, v6, :cond_f

    aget-object v3, v1, v5

    .line 47
    .local v3, "eachMethod":Ljava/lang/reflect/Method;
    invoke-virtual {v3, p1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    .line 48
    .local v0, "annotation":Ljava/lang/annotation/Annotation;
    if-eqz v0, :cond_35

    invoke-direct {p0, v3, v8}, Lorg/junit/internal/runners/TestClass;->isShadowed(Ljava/lang/reflect/Method;Ljava/util/List;)Z

    move-result v9

    if-nez v9, :cond_35

    .line 49
    invoke-interface {v8, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    :cond_35
    add-int/lit8 v5, v5, 0x1

    goto :goto_22

    .line 53
    .end local v0    # "annotation":Ljava/lang/annotation/Annotation;
    .end local v1    # "arr$":[Ljava/lang/reflect/Method;
    .end local v2    # "eachClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "eachMethod":Ljava/lang/reflect/Method;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    .end local v7    # "methods":[Ljava/lang/reflect/Method;
    :cond_38
    invoke-direct {p0, p1}, Lorg/junit/internal/runners/TestClass;->runsTopToBottom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_41

    .line 54
    invoke-static {v8}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 56
    :cond_41
    return-object v8
.end method

.method getBefores()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .prologue
    .line 35
    const-class v0, Lorg/junit/BeforeClass;

    invoke-virtual {p0, v0}, Lorg/junit/internal/runners/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getConstructor()Ljava/lang/reflect/Constructor;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 98
    iget-object v0, p0, Lorg/junit/internal/runners/TestClass;->klass:Ljava/lang/Class;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    return-object v0
.end method

.method public getJavaClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 102
    iget-object v0, p0, Lorg/junit/internal/runners/TestClass;->klass:Ljava/lang/Class;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lorg/junit/internal/runners/TestClass;->klass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTestMethods()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .prologue
    .line 31
    const-class v0, Lorg/junit/Test;

    invoke-virtual {p0, v0}, Lorg/junit/internal/runners/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
