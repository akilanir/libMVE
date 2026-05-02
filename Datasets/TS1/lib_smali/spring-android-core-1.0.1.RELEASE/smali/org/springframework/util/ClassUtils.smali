.class public abstract Lorg/springframework/util/ClassUtils;
.super Ljava/lang/Object;
.source "ClassUtils.java"


# static fields
.field public static final ARRAY_SUFFIX:Ljava/lang/String; = "[]"

.field public static final CGLIB_CLASS_SEPARATOR:Ljava/lang/String; = "$$"

.field public static final CLASS_FILE_SUFFIX:Ljava/lang/String; = ".class"

.field private static final INNER_CLASS_SEPARATOR:C = '$'

.field private static final INTERNAL_ARRAY_PREFIX:Ljava/lang/String; = "["

.field private static final NON_PRIMITIVE_ARRAY_PREFIX:Ljava/lang/String; = "[L"

.field private static final PACKAGE_SEPARATOR:C = '.'

.field private static final commonClassCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private static final primitiveTypeNameMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private static final primitiveTypeToWrapperMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private static final primitiveWrapperTypeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 12

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/16 v9, 0x8

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 77
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4, v9}, Ljava/util/HashMap;-><init>(I)V

    sput-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    .line 82
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4, v9}, Ljava/util/HashMap;-><init>(I)V

    sput-object v4, Lorg/springframework/util/ClassUtils;->primitiveTypeToWrapperMap:Ljava/util/Map;

    .line 87
    new-instance v4, Ljava/util/HashMap;

    const/16 v5, 0x20

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(I)V

    sput-object v4, Lorg/springframework/util/ClassUtils;->primitiveTypeNameMap:Ljava/util/Map;

    .line 93
    new-instance v4, Ljava/util/HashMap;

    const/16 v5, 0x20

    invoke-direct {v4, v5}, Ljava/util/HashMap;-><init>(I)V

    sput-object v4, Lorg/springframework/util/ClassUtils;->commonClassCache:Ljava/util/Map;

    .line 97
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    const-class v5, Ljava/lang/Boolean;

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    const-class v5, Ljava/lang/Byte;

    sget-object v6, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    const-class v5, Ljava/lang/Character;

    sget-object v6, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    const-class v5, Ljava/lang/Double;

    sget-object v6, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    const-class v5, Ljava/lang/Float;

    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    const-class v5, Ljava/lang/Integer;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    const-class v5, Ljava/lang/Long;

    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    const-class v5, Ljava/lang/Short;

    sget-object v6, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_78
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 107
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/lang/Class<*>;>;"
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveTypeToWrapperMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    new-array v5, v8, [Ljava/lang/Class;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Class;

    aput-object v4, v5, v7

    invoke-static {v5}, Lorg/springframework/util/ClassUtils;->registerCommonClasses([Ljava/lang/Class;)V

    goto :goto_78

    .line 111
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Class<*>;Ljava/lang/Class<*>;>;"
    :cond_9f
    new-instance v3, Ljava/util/HashSet;

    const/16 v4, 0x20

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 112
    .local v3, "primitiveTypes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 113
    new-array v4, v9, [Ljava/lang/Class;

    const-class v5, [Z

    aput-object v5, v4, v7

    const-class v5, [B

    aput-object v5, v4, v8

    const-class v5, [C

    aput-object v5, v4, v10

    const-class v5, [D

    aput-object v5, v4, v11

    const/4 v5, 0x4

    const-class v6, [F

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-class v6, [I

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-class v6, [J

    aput-object v6, v4, v5

    const/4 v5, 0x7

    const-class v6, [S

    aput-object v6, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 114
    sget-object v4, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 115
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_e5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_fb

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 116
    .local v2, "primitiveType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Lorg/springframework/util/ClassUtils;->primitiveTypeNameMap:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e5

    .line 119
    .end local v2    # "primitiveType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_fb
    new-array v4, v9, [Ljava/lang/Class;

    const-class v5, [Ljava/lang/Boolean;

    aput-object v5, v4, v7

    const-class v5, [Ljava/lang/Byte;

    aput-object v5, v4, v8

    const-class v5, [Ljava/lang/Character;

    aput-object v5, v4, v10

    const-class v5, [Ljava/lang/Double;

    aput-object v5, v4, v11

    const/4 v5, 0x4

    const-class v6, [Ljava/lang/Float;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-class v6, [Ljava/lang/Integer;

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-class v6, [Ljava/lang/Long;

    aput-object v6, v4, v5

    const/4 v5, 0x7

    const-class v6, [Ljava/lang/Short;

    aput-object v6, v4, v5

    invoke-static {v4}, Lorg/springframework/util/ClassUtils;->registerCommonClasses([Ljava/lang/Class;)V

    .line 120
    new-array v4, v9, [Ljava/lang/Class;

    const-class v5, Ljava/lang/Number;

    aput-object v5, v4, v7

    const-class v5, [Ljava/lang/Number;

    aput-object v5, v4, v8

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v10

    const-class v5, [Ljava/lang/String;

    aput-object v5, v4, v11

    const/4 v5, 0x4

    const-class v6, Ljava/lang/Object;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-class v6, [Ljava/lang/Object;

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const-class v6, Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x7

    const-class v6, [Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-static {v4}, Lorg/springframework/util/ClassUtils;->registerCommonClasses([Ljava/lang/Class;)V

    .line 121
    const/4 v4, 0x6

    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Ljava/lang/Throwable;

    aput-object v5, v4, v7

    const-class v5, Ljava/lang/Exception;

    aput-object v5, v4, v8

    const-class v5, Ljava/lang/RuntimeException;

    aput-object v5, v4, v10

    const-class v5, Ljava/lang/Error;

    aput-object v5, v4, v11

    const/4 v5, 0x4

    const-class v6, Ljava/lang/StackTraceElement;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const-class v6, [Ljava/lang/StackTraceElement;

    aput-object v6, v4, v5

    invoke-static {v4}, Lorg/springframework/util/ClassUtils;->registerCommonClasses([Ljava/lang/Class;)V

    .line 122
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addResourcePathToPackagePath(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "resourceName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 807
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "Resource name must not be null"

    invoke-static {p1, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 808
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_29

    .line 809
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lorg/springframework/util/ClassUtils;->classPackageAsResourcePath(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 811
    :goto_28
    return-object v0

    :cond_29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lorg/springframework/util/ClassUtils;->classPackageAsResourcePath(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_28
.end method

.method public static classNamesToString(Ljava/util/Collection;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Class;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 864
    .local p0, "classes":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Class;>;"
    invoke-static {p0}, Lorg/springframework/util/CollectionUtils;->isEmpty(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 865
    const-string v3, "[]"

    .line 876
    :goto_8
    return-object v3

    .line 867
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 868
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Class;>;"
    :cond_14
    :goto_14
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_33

    .line 869
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 870
    .local v0, "clazz":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 871
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_14

    .line 872
    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_14

    .line 875
    .end local v0    # "clazz":Ljava/lang/Class;
    :cond_33
    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 876
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_8
.end method

.method public static varargs classNamesToString([Ljava/lang/Class;)Ljava/lang/String;
    .registers 2
    .param p0, "classes"    # [Ljava/lang/Class;

    .prologue
    .line 850
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/util/ClassUtils;->classNamesToString(Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static classPackageAsResourcePath(Ljava/lang/Class;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v4, 0x2e

    .line 827
    if-nez p0, :cond_7

    .line 828
    const-string v3, ""

    .line 836
    :goto_6
    return-object v3

    .line 830
    :cond_7
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 831
    .local v0, "className":Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 832
    .local v1, "packageEndIndex":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_15

    .line 833
    const-string v3, ""

    goto :goto_6

    .line 835
    :cond_15
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 836
    .local v2, "packageName":Ljava/lang/String;
    const/16 v3, 0x2f

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    goto :goto_6
.end method

.method public static convertClassNameToResourcePath(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    .line 788
    const-string v0, "Class name must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 789
    const/16 v0, 0x2e

    const/16 v1, 0x2f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static convertResourcePathToClassName(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "resourcePath"    # Ljava/lang/String;

    .prologue
    .line 778
    const-string v0, "Resource path must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 779
    const/16 v0, 0x2f

    const/16 v1, 0x2e

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static createCompositeInterface([Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 977
    .local p0, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v0, "Interfaces must not be empty"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notEmpty([Ljava/lang/Object;Ljava/lang/String;)V

    .line 978
    const-string v0, "ClassLoader must not be null"

    invoke-static {p1, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 979
    invoke-static {p1, p0}, Ljava/lang/reflect/Proxy;->getProxyClass(Ljava/lang/ClassLoader;[Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static forName(Ljava/lang/String;)Ljava/lang/Class;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/LinkageError;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 192
    invoke-static {}, Lorg/springframework/util/ClassUtils;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/springframework/util/ClassUtils;->forName(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static forName(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 13
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/LinkageError;
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 207
    const-string v8, "Name must not be null"

    invoke-static {p0, v8}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 209
    invoke-static {p0}, Lorg/springframework/util/ClassUtils;->resolvePrimitiveClassName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 210
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v1, :cond_14

    .line 211
    sget-object v8, Lorg/springframework/util/ClassUtils;->commonClassCache:Ljava/util/Map;

    invoke-interface {v8, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    check-cast v1, Ljava/lang/Class;

    .line 213
    .restart local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_14
    if-eqz v1, :cond_17

    .line 249
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_16
    return-object v1

    .line 218
    .restart local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_17
    const-string v8, "[]"

    invoke-virtual {p0, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3b

    .line 219
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    const-string v9, "[]"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {p0, v10, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 220
    .local v3, "elementClassName":Ljava/lang/String;
    invoke-static {v3, p1}, Lorg/springframework/util/ClassUtils;->forName(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    .line 221
    .local v2, "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v2, v10}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_16

    .line 225
    .end local v2    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "elementClassName":Ljava/lang/String;
    :cond_3b
    const-string v8, "[L"

    invoke-virtual {p0, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_68

    const-string v8, ";"

    invoke-virtual {p0, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_68

    .line 226
    const-string v8, "[L"

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-virtual {p0, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 227
    .local v4, "elementName":Ljava/lang/String;
    invoke-static {v4, p1}, Lorg/springframework/util/ClassUtils;->forName(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    .line 228
    .restart local v2    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v2, v10}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_16

    .line 232
    .end local v2    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "elementName":Ljava/lang/String;
    :cond_68
    const-string v8, "["

    invoke-virtual {p0, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_87

    .line 233
    const-string v8, "["

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {p0, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 234
    .restart local v4    # "elementName":Ljava/lang/String;
    invoke-static {v4, p1}, Lorg/springframework/util/ClassUtils;->forName(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2

    .line 235
    .restart local v2    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v2, v10}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_16

    .line 238
    .end local v2    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "elementName":Ljava/lang/String;
    :cond_87
    move-object v0, p1

    .line 239
    .local v0, "classLoaderToUse":Ljava/lang/ClassLoader;
    if-nez v0, :cond_8e

    .line 240
    invoke-static {}, Lorg/springframework/util/ClassUtils;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 243
    :cond_8e
    :try_start_8e
    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_91
    .catch Ljava/lang/ClassNotFoundException; {:try_start_8e .. :try_end_91} :catch_93

    move-result-object v1

    goto :goto_16

    .line 244
    :catch_93
    move-exception v5

    .line 245
    .local v5, "ex":Ljava/lang/ClassNotFoundException;
    const/16 v8, 0x2e

    invoke-virtual {p0, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v7

    .line 246
    .local v7, "lastDotIndex":I
    const/4 v8, -0x1

    if-eq v7, v8, :cond_c5

    .line 247
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v10, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x24

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    add-int/lit8 v9, v7, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 249
    .local v6, "innerClassName":Ljava/lang/String;
    :try_start_be
    invoke-virtual {v0, v6}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_c1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_be .. :try_end_c1} :catch_c4

    move-result-object v1

    goto/16 :goto_16

    .line 250
    :catch_c4
    move-exception v8

    .line 254
    .end local v6    # "innerClassName":Ljava/lang/String;
    :cond_c5
    throw v5
.end method

.method public static getAllInterfaces(Ljava/lang/Object;)[Ljava/lang/Class;
    .registers 2
    .param p0, "instance"    # Ljava/lang/Object;

    .prologue
    .line 887
    const-string v0, "Instance must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 888
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/util/ClassUtils;->getAllInterfacesForClass(Ljava/lang/Class;)[Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static getAllInterfacesAsSet(Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .param p0, "instance"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    .prologue
    .line 924
    const-string v0, "Instance must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 925
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/util/ClassUtils;->getAllInterfacesForClassAsSet(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static getAllInterfacesForClass(Ljava/lang/Class;)[Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 899
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/springframework/util/ClassUtils;->getAllInterfacesForClass(Ljava/lang/Class;Ljava/lang/ClassLoader;)[Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static getAllInterfacesForClass(Ljava/lang/Class;Ljava/lang/ClassLoader;)[Ljava/lang/Class;
    .registers 4
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/ClassLoader;",
            ")[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 913
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lorg/springframework/util/ClassUtils;->getAllInterfacesForClassAsSet(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/Set;

    move-result-object v0

    .line 914
    .local v0, "ifcs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class;>;"
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/Class;

    invoke-interface {v0, v1}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Class;

    return-object v1
.end method

.method public static getAllInterfacesForClassAsSet(Ljava/lang/Class;)Ljava/util/Set;
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    .prologue
    .line 937
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/springframework/util/ClassUtils;->getAllInterfacesForClassAsSet(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static getAllInterfacesForClassAsSet(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/Set;
    .registers 9
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation

    .prologue
    .line 951
    const-string v6, "Class must not be null"

    invoke-static {p0, v6}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 952
    invoke-virtual {p0}, Ljava/lang/Class;->isInterface()Z

    move-result v6

    if-eqz v6, :cond_16

    invoke-static {p0, p1}, Lorg/springframework/util/ClassUtils;->isVisible(Ljava/lang/Class;Ljava/lang/ClassLoader;)Z

    move-result v6

    if-eqz v6, :cond_16

    .line 953
    invoke-static {p0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v4

    .line 963
    :cond_15
    return-object v4

    .line 955
    :cond_16
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    .line 956
    .local v4, "interfaces":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class;>;"
    :goto_1b
    if-eqz p0, :cond_15

    .line 957
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v3

    .line 958
    .local v3, "ifcs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, v3

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_24
    if-ge v1, v5, :cond_32

    aget-object v2, v0, v1

    .line 959
    .local v2, "ifc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v2, p1}, Lorg/springframework/util/ClassUtils;->getAllInterfacesForClassAsSet(Ljava/lang/Class;Ljava/lang/ClassLoader;)Ljava/util/Set;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 958
    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    .line 961
    .end local v2    # "ifc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_32
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    .line 962
    goto :goto_1b
.end method

.method public static getClassFileName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 417
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "Class must not be null"

    invoke-static {p0, v2}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 418
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 419
    .local v0, "className":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 420
    .local v1, "lastDotIndex":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static varargs getConstructorIfAvailable(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Constructor",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 540
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p1, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v1, "Class must not be null"

    invoke-static {p0, v1}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 542
    :try_start_5
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_8
    .catch Ljava/lang/NoSuchMethodException; {:try_start_5 .. :try_end_8} :catch_a

    move-result-object v1

    .line 544
    :goto_9
    return-object v1

    .line 543
    :catch_a
    move-exception v0

    .line 544
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public static getDefaultClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 145
    const/4 v0, 0x0

    .line 147
    .local v0, "cl":Ljava/lang/ClassLoader;
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_8} :catch_12

    move-result-object v0

    .line 151
    :goto_9
    if-nez v0, :cond_11

    .line 153
    const-class v1, Lorg/springframework/util/ClassUtils;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 155
    :cond_11
    return-object v0

    .line 148
    :catch_12
    move-exception v1

    goto :goto_9
.end method

.method public static getDescriptiveType(Ljava/lang/Object;)Ljava/lang/String;
    .registers 6
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 484
    if-nez p0, :cond_4

    .line 485
    const/4 v4, 0x0

    .line 502
    :goto_3
    return-object v4

    .line 487
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 488
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v0}, Ljava/lang/reflect/Proxy;->isProxyClass(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_3f

    .line 489
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 490
    .local v3, "result":Ljava/lang/StringBuilder;
    const-string v4, " implementing "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 491
    invoke-virtual {v0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v2

    .line 492
    .local v2, "ifcs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_21
    array-length v4, v2

    if-ge v1, v4, :cond_3a

    .line 493
    aget-object v4, v2, v1

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 494
    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    if-ge v1, v4, :cond_37

    .line 495
    const/16 v4, 0x2c

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 492
    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 498
    :cond_3a
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 499
    .end local v1    # "i":I
    .end local v2    # "ifcs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "result":Ljava/lang/StringBuilder;
    :cond_3f
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 500
    invoke-static {v0}, Lorg/springframework/util/ClassUtils;->getQualifiedNameForArray(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 502
    :cond_4a
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    goto :goto_3
.end method

.method public static varargs getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 7
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 575
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v1, "Class must not be null"

    invoke-static {p0, v1}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 576
    const-string v1, "Method name must not be null"

    invoke-static {p1, v1}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 578
    :try_start_a
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v1

    return-object v1

    .line 579
    :catch_f
    move-exception v0

    .line 580
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected method not found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static getMethodCountForName(Ljava/lang/Class;Ljava/lang/String;)I
    .registers 11
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    .prologue
    .line 613
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v8, "Class must not be null"

    invoke-static {p0, v8}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 614
    const-string v8, "Method name must not be null"

    invoke-static {p1, v8}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 615
    const/4 v1, 0x0

    .line 616
    .local v1, "count":I
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    .line 617
    .local v2, "declaredMethods":[Ljava/lang/reflect/Method;
    move-object v0, v2

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v6, v0

    .local v6, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_12
    if-ge v3, v6, :cond_25

    aget-object v7, v0, v3

    .line 618
    .local v7, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_22

    .line 619
    add-int/lit8 v1, v1, 0x1

    .line 617
    :cond_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 622
    .end local v7    # "method":Ljava/lang/reflect/Method;
    :cond_25
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v5

    .line 623
    .local v5, "ifcs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v6, v0

    const/4 v3, 0x0

    :goto_2c
    if-ge v3, v6, :cond_38

    aget-object v4, v0, v3

    .line 624
    .local v4, "ifc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v4, p1}, Lorg/springframework/util/ClassUtils;->getMethodCountForName(Ljava/lang/Class;Ljava/lang/String;)I

    move-result v8

    add-int/2addr v1, v8

    .line 623
    add-int/lit8 v3, v3, 0x1

    goto :goto_2c

    .line 626
    .end local v4    # "ifc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_38
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v8

    if-eqz v8, :cond_47

    .line 627
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v8

    invoke-static {v8, p1}, Lorg/springframework/util/ClassUtils;->getMethodCountForName(Ljava/lang/Class;Ljava/lang/String;)I

    move-result v8

    add-int/2addr v1, v8

    .line 629
    :cond_47
    return v1
.end method

.method public static varargs getMethodIfAvailable(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 5
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 596
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v1, "Class must not be null"

    invoke-static {p0, v1}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 597
    const-string v1, "Method name must not be null"

    invoke-static {p1, v1}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 599
    :try_start_a
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_a .. :try_end_d} :catch_f

    move-result-object v1

    .line 601
    :goto_e
    return-object v1

    .line 600
    :catch_f
    move-exception v0

    .line 601
    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public static getPackageName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 430
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v2, "Class must not be null"

    invoke-static {p0, v2}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 431
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 432
    .local v0, "className":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    .line 433
    .local v1, "lastDotIndex":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_18

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :goto_17
    return-object v2

    :cond_18
    const-string v2, ""

    goto :goto_17
.end method

.method public static getQualifiedMethodName(Ljava/lang/reflect/Method;)Ljava/lang/String;
    .registers 3
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 473
    const-string v0, "Method must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 474
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getQualifiedName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 443
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "Class must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 444
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 445
    invoke-static {p0}, Lorg/springframework/util/ClassUtils;->getQualifiedNameForArray(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 447
    :goto_f
    return-object v0

    :cond_10
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_f
.end method

.method private static getQualifiedNameForArray(Ljava/lang/Class;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 457
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 458
    .local v0, "result":Ljava/lang/StringBuilder;
    :goto_5
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 459
    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p0

    .line 460
    const-string v1, "[]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 462
    :cond_15
    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 463
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static getShortName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 408
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lorg/springframework/util/ClassUtils;->getQualifiedName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/util/ClassUtils;->getShortName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getShortName(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x2e

    .line 391
    const-string v3, "Class name must not be empty"

    invoke-static {p0, v3}, Lorg/springframework/util/Assert;->hasLength(Ljava/lang/String;Ljava/lang/String;)V

    .line 392
    invoke-virtual {p0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 393
    .local v0, "lastDotIndex":I
    const-string v3, "$$"

    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 394
    .local v1, "nameEndIndex":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_18

    .line 395
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 397
    :cond_18
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 398
    .local v2, "shortName":Ljava/lang/String;
    const/16 v3, 0x24

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 399
    return-object v2
.end method

.method public static varargs getStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 7
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "args":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    .line 666
    const-string v3, "Class must not be null"

    invoke-static {p0, v3}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 667
    const-string v3, "Method name must not be null"

    invoke-static {p1, v3}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 669
    :try_start_b
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 670
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isStatic(I)Z
    :try_end_16
    .catch Ljava/lang/NoSuchMethodException; {:try_start_b .. :try_end_16} :catch_1c

    move-result v3

    if-eqz v3, :cond_1a

    .line 672
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_19
    return-object v1

    .restart local v1    # "method":Ljava/lang/reflect/Method;
    :cond_1a
    move-object v1, v2

    .line 670
    goto :goto_19

    .line 671
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :catch_1c
    move-exception v0

    .local v0, "ex":Ljava/lang/NoSuchMethodException;
    move-object v1, v2

    .line 672
    goto :goto_19
.end method

.method public static getUserClass(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 349
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p0, :cond_1d

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "$$"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 350
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    .line 351
    .local v0, "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_1d

    const-class v1, Ljava/lang/Object;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1d

    .line 355
    .end local v0    # "superClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1c
    return-object v0

    :cond_1d
    move-object v0, p0

    goto :goto_1c
.end method

.method public static getUserClass(Ljava/lang/Object;)Ljava/lang/Class;
    .registers 2
    .param p0, "instance"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 338
    const-string v0, "Instance must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 339
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/util/ClassUtils;->getUserClass(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static hasAtLeastOneMethodWithName(Ljava/lang/Class;Ljava/lang/String;)Z
    .registers 11
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v7, 0x1

    .line 640
    const-string v8, "Class must not be null"

    invoke-static {p0, v8}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 641
    const-string v8, "Method name must not be null"

    invoke-static {p1, v8}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 642
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    .line 643
    .local v1, "declaredMethods":[Ljava/lang/reflect/Method;
    move-object v0, v1

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_12
    if-ge v2, v5, :cond_24

    aget-object v6, v0, v2

    .line 644
    .local v6, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v6}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_21

    .line 654
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    .end local v6    # "method":Ljava/lang/reflect/Method;
    :cond_20
    :goto_20
    return v7

    .line 643
    .restart local v0    # "arr$":[Ljava/lang/reflect/Method;
    .restart local v6    # "method":Ljava/lang/reflect/Method;
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .line 648
    .end local v6    # "method":Ljava/lang/reflect/Method;
    :cond_24
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v4

    .line 649
    .local v4, "ifcs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, v4

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v5, v0

    const/4 v2, 0x0

    :goto_2b
    if-ge v2, v5, :cond_38

    aget-object v3, v0, v2

    .line 650
    .local v3, "ifc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v3, p1}, Lorg/springframework/util/ClassUtils;->hasAtLeastOneMethodWithName(Ljava/lang/Class;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_20

    .line 649
    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    .line 654
    .end local v3    # "ifc":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_38
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v8

    if-eqz v8, :cond_48

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v8

    invoke-static {v8, p1}, Lorg/springframework/util/ClassUtils;->hasAtLeastOneMethodWithName(Ljava/lang/Class;Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_20

    :cond_48
    const/4 v7, 0x0

    goto :goto_20
.end method

.method public static varargs hasConstructor(Ljava/lang/Class;[Ljava/lang/Class;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 526
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lorg/springframework/util/ClassUtils;->getConstructorIfAvailable(Ljava/lang/Class;[Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static varargs hasMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Z
    .registers 4
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 559
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {p0, p1, p2}, Lorg/springframework/util/ClassUtils;->getMethodIfAvailable(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "lhsType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p1, "rhsType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    .line 740
    const-string v3, "Left-hand side type must not be null"

    invoke-static {p0, v3}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 741
    const-string v3, "Right-hand side type must not be null"

    invoke-static {p1, v3}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 742
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 756
    :cond_11
    :goto_11
    return v2

    .line 745
    :cond_12
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 746
    sget-object v3, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 747
    .local v0, "resolvedPrimitive":Ljava/lang/Class;
    if-eqz v0, :cond_28

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_11

    .line 756
    .end local v0    # "resolvedPrimitive":Ljava/lang/Class;
    :cond_28
    const/4 v2, 0x0

    goto :goto_11

    .line 751
    :cond_2a
    sget-object v3, Lorg/springframework/util/ClassUtils;->primitiveTypeToWrapperMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 752
    .local v1, "resolvedWrapper":Ljava/lang/Class;
    if-eqz v1, :cond_28

    invoke-virtual {p0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_28

    goto :goto_11
.end method

.method public static isAssignableValue(Ljava/lang/Class;Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 767
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "Type must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 768
    if-eqz p1, :cond_10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/springframework/util/ClassUtils;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v0

    :goto_f
    return v0

    :cond_10
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_18

    const/4 v0, 0x1

    goto :goto_f

    :cond_18
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public static isCacheSafe(Ljava/lang/Class;Ljava/lang/ClassLoader;)Z
    .registers 7
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/ClassLoader;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 365
    const-string v4, "Class must not be null"

    invoke-static {p0, v4}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 366
    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 367
    .local v1, "target":Ljava/lang/ClassLoader;
    if-nez v1, :cond_e

    .line 380
    :cond_d
    :goto_d
    return v2

    .line 370
    :cond_e
    move-object v0, p1

    .line 371
    .local v0, "cur":Ljava/lang/ClassLoader;
    if-ne v0, v1, :cond_13

    move v2, v3

    .line 372
    goto :goto_d

    .line 374
    :cond_13
    if-eqz v0, :cond_d

    .line 375
    invoke-virtual {v0}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 376
    if-ne v0, v1, :cond_13

    move v2, v3

    .line 377
    goto :goto_d
.end method

.method public static isPresent(Ljava/lang/String;)Z
    .registers 2
    .param p0, "className"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 311
    invoke-static {}, Lorg/springframework/util/ClassUtils;->getDefaultClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/springframework/util/ClassUtils;->isPresent(Ljava/lang/String;Ljava/lang/ClassLoader;)Z

    move-result v0

    return v0
.end method

.method public static isPresent(Ljava/lang/String;Ljava/lang/ClassLoader;)Z
    .registers 4
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 323
    :try_start_0
    invoke-static {p0, p1}, Lorg/springframework/util/ClassUtils;->forName(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_5

    .line 324
    const/4 v1, 0x1

    .line 327
    :goto_4
    return v1

    .line 325
    :catch_5
    move-exception v0

    .line 327
    .local v0, "ex":Ljava/lang/Throwable;
    const/4 v1, 0x0

    goto :goto_4
.end method

.method public static isPrimitiveArray(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 705
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "Class must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 706
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public static isPrimitiveOrWrapper(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 694
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "Class must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 695
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-static {p0}, Lorg/springframework/util/ClassUtils;->isPrimitiveWrapper(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_13

    :cond_11
    const/4 v0, 0x1

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public static isPrimitiveWrapper(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 683
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "Class must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 684
    sget-object v0, Lorg/springframework/util/ClassUtils;->primitiveWrapperTypeMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isPrimitiveWrapperArray(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 716
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "Class must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 717
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/springframework/util/ClassUtils;->isPrimitiveWrapper(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x1

    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method public static isVisible(Ljava/lang/Class;Ljava/lang/ClassLoader;)Z
    .registers 7
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/ClassLoader;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 989
    if-nez p1, :cond_5

    .line 998
    :cond_4
    :goto_4
    return v2

    .line 993
    :cond_5
    :try_start_5
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_c} :catch_11

    move-result-object v0

    .line 994
    .local v0, "actualClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eq p0, v0, :cond_4

    move v2, v3

    goto :goto_4

    .line 996
    .end local v0    # "actualClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_11
    move-exception v1

    .local v1, "ex":Ljava/lang/ClassNotFoundException;
    move v2, v3

    .line 998
    goto :goto_4
.end method

.method public static matchesTypeName(Ljava/lang/Class;Ljava/lang/String;)Z
    .registers 3
    .param p1, "typeName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 512
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_28

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_26

    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_28

    invoke-static {p0}, Lorg/springframework/util/ClassUtils;->getQualifiedNameForArray(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    :cond_26
    const/4 v0, 0x1

    :goto_27
    return v0

    :cond_28
    const/4 v0, 0x0

    goto :goto_27
.end method

.method public static overrideThreadContextClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;
    .registers 4
    .param p0, "classLoaderToUse"    # Ljava/lang/ClassLoader;

    .prologue
    .line 165
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 166
    .local v0, "currentThread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 167
    .local v1, "threadContextClassLoader":Ljava/lang/ClassLoader;
    if-eqz p0, :cond_14

    invoke-virtual {p0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_14

    .line 168
    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setContextClassLoader(Ljava/lang/ClassLoader;)V

    .line 171
    .end local v1    # "threadContextClassLoader":Ljava/lang/ClassLoader;
    :goto_13
    return-object v1

    .restart local v1    # "threadContextClassLoader":Ljava/lang/ClassLoader;
    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method private static varargs registerCommonClasses([Ljava/lang/Class;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 129
    .local p0, "commonClasses":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_3
    if-ge v2, v3, :cond_13

    aget-object v1, v0, v2

    .line 130
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Lorg/springframework/util/ClassUtils;->commonClassCache:Ljava/util/Map;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 132
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    return-void
.end method

.method public static resolveClassName(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 6
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "classLoader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 273
    :try_start_0
    invoke-static {p0, p1}, Lorg/springframework/util/ClassUtils;->forName(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_3} :catch_25

    move-result-object v1

    return-object v1

    .line 274
    :catch_5
    move-exception v0

    .line 275
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot find class ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 276
    .end local v0    # "ex":Ljava/lang/ClassNotFoundException;
    :catch_25
    move-exception v0

    .line 277
    .local v0, "ex":Ljava/lang/LinkageError;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error loading class ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]: problem with class file or dependent class."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static resolvePrimitiveClassName(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 292
    const/4 v0, 0x0

    .line 295
    .local v0, "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p0, :cond_13

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x8

    if-gt v1, v2, :cond_13

    .line 297
    sget-object v1, Lorg/springframework/util/ClassUtils;->primitiveTypeNameMap:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    check-cast v0, Ljava/lang/Class;

    .line 299
    .restart local v0    # "result":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_13
    return-object v0
.end method

.method public static resolvePrimitiveIfNecessary(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 726
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "Class must not be null"

    invoke-static {p0, v0}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 727
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_18

    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_18

    sget-object v0, Lorg/springframework/util/ClassUtils;->primitiveTypeToWrapperMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    :goto_17
    return-object v0

    :cond_18
    move-object v0, p0

    goto :goto_17
.end method
