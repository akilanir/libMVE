.class public Lorg/junit/runners/model/TestClass;
.super Ljava/lang/Object;
.source "TestClass.java"

# interfaces
.implements Lorg/junit/runners/model/Annotatable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/runners/model/TestClass$1;,
        Lorg/junit/runners/model/TestClass$MethodComparator;,
        Lorg/junit/runners/model/TestClass$FieldComparator;
    }
.end annotation


# static fields
.field private static final FIELD_COMPARATOR:Lorg/junit/runners/model/TestClass$FieldComparator;

.field private static final METHOD_COMPARATOR:Lorg/junit/runners/model/TestClass$MethodComparator;


# instance fields
.field private final clazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final fieldsForAnnotations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkField;",
            ">;>;"
        }
    .end annotation
.end field

.field private final methodsForAnnotations:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 32
    new-instance v0, Lorg/junit/runners/model/TestClass$FieldComparator;

    invoke-direct {v0, v1}, Lorg/junit/runners/model/TestClass$FieldComparator;-><init>(Lorg/junit/runners/model/TestClass$1;)V

    sput-object v0, Lorg/junit/runners/model/TestClass;->FIELD_COMPARATOR:Lorg/junit/runners/model/TestClass$FieldComparator;

    .line 33
    new-instance v0, Lorg/junit/runners/model/TestClass$MethodComparator;

    invoke-direct {v0, v1}, Lorg/junit/runners/model/TestClass$MethodComparator;-><init>(Lorg/junit/runners/model/TestClass$1;)V

    sput-object v0, Lorg/junit/runners/model/TestClass;->METHOD_COMPARATOR:Lorg/junit/runners/model/TestClass$MethodComparator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 45
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    .line 47
    if-eqz p1, :cond_17

    invoke-virtual {p1}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v2

    array-length v2, v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_17

    .line 48
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Test class can only have one constructor"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 52
    :cond_17
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 54
    .local v1, "methodsForAnnotations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 57
    .local v0, "fieldsForAnnotations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<Lorg/junit/runners/model/FrameworkField;>;>;"
    invoke-virtual {p0, v1, v0}, Lorg/junit/runners/model/TestClass;->scanAnnotatedMembers(Ljava/util/Map;Ljava/util/Map;)V

    .line 59
    invoke-static {v1}, Lorg/junit/runners/model/TestClass;->makeDeeplyUnmodifiable(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    iput-object v2, p0, Lorg/junit/runners/model/TestClass;->methodsForAnnotations:Ljava/util/Map;

    .line 60
    invoke-static {v0}, Lorg/junit/runners/model/TestClass;->makeDeeplyUnmodifiable(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v2

    iput-object v2, p0, Lorg/junit/runners/model/TestClass;->fieldsForAnnotations:Ljava/util/Map;

    .line 61
    return-void
.end method

.method protected static addToAnnotationLists(Lorg/junit/runners/model/FrameworkMember;Ljava/util/Map;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/junit/runners/model/FrameworkMember",
            "<TT;>;>(TT;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/List",
            "<TT;>;>;)V"
        }
    .end annotation

    .prologue
    .line 84
    .local p0, "member":Lorg/junit/runners/model/FrameworkMember;, "TT;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<TT;>;>;"
    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkMember;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/annotation/Annotation;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_19

    aget-object v1, v0, v2

    .line 85
    .local v1, "each":Ljava/lang/annotation/Annotation;
    invoke-interface {v1}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v5

    .line 86
    .local v5, "type":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    const/4 v6, 0x1

    invoke-static {p1, v5, v6}, Lorg/junit/runners/model/TestClass;->getAnnotatedMembers(Ljava/util/Map;Ljava/lang/Class;Z)Ljava/util/List;

    move-result-object v4

    .line 87
    .local v4, "members":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-virtual {p0, v4}, Lorg/junit/runners/model/FrameworkMember;->isShadowedBy(Ljava/util/List;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 96
    .end local v1    # "each":Ljava/lang/annotation/Annotation;
    .end local v4    # "members":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .end local v5    # "type":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    :cond_19
    return-void

    .line 90
    .restart local v1    # "each":Ljava/lang/annotation/Annotation;
    .restart local v4    # "members":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .restart local v5    # "type":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    :cond_1a
    invoke-static {v5}, Lorg/junit/runners/model/TestClass;->runsTopToBottom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_27

    .line 91
    const/4 v6, 0x0

    invoke-interface {v4, v6, p0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 84
    :goto_24
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 93
    :cond_27
    invoke-interface {v4, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_24
.end method

.method private collectValues(Ljava/util/Map;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<*",
            "Ljava/util/List",
            "<TT;>;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 149
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<*Ljava/util/List<TT;>;>;"
    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 150
    .local v2, "values":Ljava/util/Set;, "Ljava/util/Set<TT;>;"
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 151
    .local v0, "additionalValues":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-interface {v2, v0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_d

    .line 153
    .end local v0    # "additionalValues":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :cond_1d
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v3
.end method

.method private static getAnnotatedMembers(Ljava/util/Map;Ljava/lang/Class;Z)Ljava/util/List;
    .registers 5
    .param p2, "fillIfAbsent"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/List",
            "<TT;>;>;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;Z)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<TT;>;>;"
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    if-eqz p2, :cond_10

    .line 159
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    :cond_10
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 162
    .local v0, "members":Ljava/util/List;, "Ljava/util/List<TT;>;"
    if-nez v0, :cond_1c

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .end local v0    # "members":Ljava/util/List;, "Ljava/util/List<TT;>;"
    :cond_1c
    return-object v0
.end method

.method private static getSortedDeclaredFields(Ljava/lang/Class;)[Ljava/lang/reflect/Field;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/reflect/Field;"
        }
    .end annotation

    .prologue
    .line 77
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 78
    .local v0, "declaredFields":[Ljava/lang/reflect/Field;
    sget-object v1, Lorg/junit/runners/model/TestClass;->FIELD_COMPARATOR:Lorg/junit/runners/model/TestClass$FieldComparator;

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 79
    return-object v0
.end method

.method private static getSuperClasses(Ljava/lang/Class;)Ljava/util/List;
    .registers 3
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
    .line 171
    .local p0, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .local v1, "results":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Class<*>;>;"
    move-object v0, p0

    .line 173
    .local v0, "current":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_6
    if-eqz v0, :cond_10

    .line 174
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 175
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_6

    .line 177
    :cond_10
    return-object v1
.end method

.method private static makeDeeplyUnmodifiable(Ljava/util/Map;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lorg/junit/runners/model/FrameworkMember",
            "<TT;>;>(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/List",
            "<TT;>;>;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/List",
            "<TT;>;>;"
        }
    .end annotation

    .prologue
    .line 100
    .local p0, "source":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<TT;>;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 102
    .local v0, "copy":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<TT;>;>;"
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 103
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<TT;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 105
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<TT;>;>;"
    :cond_2b
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    return-object v3
.end method

.method private static runsTopToBottom(Ljava/lang/Class;)Z
    .registers 2
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
    .line 166
    .local p0, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    const-class v0, Lorg/junit/Before;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const-class v0, Lorg/junit/BeforeClass;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

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
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 282
    if-ne p0, p1, :cond_5

    .line 292
    :cond_4
    :goto_4
    return v1

    .line 285
    :cond_5
    if-nez p1, :cond_9

    move v1, v2

    .line 286
    goto :goto_4

    .line 288
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_15

    move v1, v2

    .line 289
    goto :goto_4

    :cond_15
    move-object v0, p1

    .line 291
    check-cast v0, Lorg/junit/runners/model/TestClass;

    .line 292
    .local v0, "other":Lorg/junit/runners/model/TestClass;
    iget-object v3, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    iget-object v4, v0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getAnnotatedFieldValues(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;
    .registers 11
    .param p1, "test"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 227
    .local p2, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    .local p3, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 228
    .local v4, "results":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-virtual {p0, p2}, Lorg/junit/runners/model/TestClass;->getAnnotatedFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_34

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/FrameworkField;

    .line 230
    .local v1, "each":Lorg/junit/runners/model/FrameworkField;
    :try_start_19
    invoke-virtual {v1, p1}, Lorg/junit/runners/model/FrameworkField;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 231
    .local v2, "fieldValue":Ljava/lang/Object;
    invoke-virtual {p3, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 232
    invoke-virtual {p3, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2a
    .catch Ljava/lang/IllegalAccessException; {:try_start_19 .. :try_end_2a} :catch_2b

    goto :goto_d

    .line 234
    .end local v2    # "fieldValue":Ljava/lang/Object;
    :catch_2b
    move-exception v0

    .line 235
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v5, Ljava/lang/RuntimeException;

    const-string v6, "How did getFields return a field we couldn\'t access?"

    invoke-direct {v5, v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 239
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "each":Lorg/junit/runners/model/FrameworkField;
    :cond_34
    return-object v4
.end method

.method public getAnnotatedFields()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->fieldsForAnnotations:Ljava/util/Map;

    invoke-direct {p0, v0}, Lorg/junit/runners/model/TestClass;->collectValues(Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotatedFields(Ljava/lang/Class;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->fieldsForAnnotations:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lorg/junit/runners/model/TestClass;->getAnnotatedMembers(Ljava/util/Map;Ljava/lang/Class;Z)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotatedMethodValues(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;
    .registers 12
    .param p1, "test"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 244
    .local p2, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    .local p3, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 245
    .local v4, "results":Ljava/util/List;, "Ljava/util/List<TT;>;"
    invoke-virtual {p0, p2}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_50

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/FrameworkMethod;

    .line 255
    .local v1, "each":Lorg/junit/runners/model/FrameworkMethod;
    :try_start_19
    invoke-virtual {v1}, Lorg/junit/runners/model/FrameworkMethod;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p3, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 256
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v5}, Lorg/junit/runners/model/FrameworkMethod;->invokeExplosively(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 257
    .local v2, "fieldValue":Ljava/lang/Object;
    invoke-virtual {p3, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_31
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_31} :catch_32

    goto :goto_d

    .line 259
    .end local v2    # "fieldValue":Ljava/lang/Object;
    :catch_32
    move-exception v0

    .line 260
    .local v0, "e":Ljava/lang/Throwable;
    new-instance v5, Ljava/lang/RuntimeException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception in "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lorg/junit/runners/model/FrameworkMethod;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 264
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v1    # "each":Lorg/junit/runners/model/FrameworkMethod;
    :cond_50
    return-object v4
.end method

.method public getAnnotatedMethods()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    iget-object v1, p0, Lorg/junit/runners/model/TestClass;->methodsForAnnotations:Ljava/util/Map;

    invoke-direct {p0, v1}, Lorg/junit/runners/model/TestClass;->collectValues(Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    .line 116
    .local v0, "methods":Ljava/util/List;, "Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;"
    sget-object v1, Lorg/junit/runners/model/TestClass;->METHOD_COMPARATOR:Lorg/junit/runners/model/TestClass$MethodComparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 117
    return-object v0
.end method

.method public getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 126
    .local p1, "annotationClass":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->methodsForAnnotations:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lorg/junit/runners/model/TestClass;->getAnnotatedMembers(Ljava/util/Map;Ljava/lang/Class;Z)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 219
    .local p1, "annotationType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    if-nez v0, :cond_6

    .line 220
    const/4 v0, 0x0

    .line 222
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    goto :goto_5
.end method

.method public getAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 2

    .prologue
    .line 212
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    if-nez v0, :cond_8

    .line 213
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/annotation/Annotation;

    .line 215
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v0

    goto :goto_7
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
    .line 184
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    if-nez v0, :cond_7

    .line 192
    const-string v0, "null"

    .line 194
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getOnlyConstructor()Ljava/lang/reflect/Constructor;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 203
    iget-object v1, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 204
    .local v0, "constructors":[Ljava/lang/reflect/Constructor;, "[Ljava/lang/reflect/Constructor<*>;"
    const-wide/16 v1, 0x1

    array-length v3, v0

    int-to-long v3, v3

    invoke-static {v1, v2, v3, v4}, Lorg/junit/Assert;->assertEquals(JJ)V

    .line 205
    const/4 v1, 0x0

    aget-object v1, v0, v1

    return-object v1
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 277
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_5
.end method

.method public isANonStaticInnerClass()Z
    .registers 2

    .prologue
    .line 272
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isMemberClass()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    if-nez v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public isPublic()Z
    .registers 2

    .prologue
    .line 268
    iget-object v0, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v0

    return v0
.end method

.method protected scanAnnotatedMembers(Ljava/util/Map;Ljava/util/Map;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lorg/junit/runners/model/FrameworkField;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "methodsForAnnotations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<Lorg/junit/runners/model/FrameworkMethod;>;>;"
    .local p2, "fieldsForAnnotations":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;Ljava/util/List<Lorg/junit/runners/model/FrameworkField;>;>;"
    iget-object v7, p0, Lorg/junit/runners/model/TestClass;->clazz:Ljava/lang/Class;

    invoke-static {v7}, Lorg/junit/runners/model/TestClass;->getSuperClasses(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_40

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 65
    .local v1, "eachClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v1}, Lorg/junit/internal/MethodSorter;->getDeclaredMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1c
    if-ge v5, v6, :cond_2b

    aget-object v3, v0, v5

    .line 66
    .local v3, "eachMethod":Ljava/lang/reflect/Method;
    new-instance v7, Lorg/junit/runners/model/FrameworkMethod;

    invoke-direct {v7, v3}, Lorg/junit/runners/model/FrameworkMethod;-><init>(Ljava/lang/reflect/Method;)V

    invoke-static {v7, p1}, Lorg/junit/runners/model/TestClass;->addToAnnotationLists(Lorg/junit/runners/model/FrameworkMember;Ljava/util/Map;)V

    .line 65
    add-int/lit8 v5, v5, 0x1

    goto :goto_1c

    .line 70
    .end local v3    # "eachMethod":Ljava/lang/reflect/Method;
    :cond_2b
    invoke-static {v1}, Lorg/junit/runners/model/TestClass;->getSortedDeclaredFields(Ljava/lang/Class;)[Ljava/lang/reflect/Field;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Field;
    array-length v6, v0

    const/4 v5, 0x0

    :goto_31
    if-ge v5, v6, :cond_a

    aget-object v2, v0, v5

    .line 71
    .local v2, "eachField":Ljava/lang/reflect/Field;
    new-instance v7, Lorg/junit/runners/model/FrameworkField;

    invoke-direct {v7, v2}, Lorg/junit/runners/model/FrameworkField;-><init>(Ljava/lang/reflect/Field;)V

    invoke-static {v7, p2}, Lorg/junit/runners/model/TestClass;->addToAnnotationLists(Lorg/junit/runners/model/FrameworkMember;Ljava/util/Map;)V

    .line 70
    add-int/lit8 v5, v5, 0x1

    goto :goto_31

    .line 74
    .end local v0    # "arr$":[Ljava/lang/reflect/Field;
    .end local v1    # "eachClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "eachField":Ljava/lang/reflect/Field;
    .end local v5    # "i$":I
    .end local v6    # "len$":I
    :cond_40
    return-void
.end method
