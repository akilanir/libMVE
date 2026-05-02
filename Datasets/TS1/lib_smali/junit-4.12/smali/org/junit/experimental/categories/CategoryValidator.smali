.class public final Lorg/junit/experimental/categories/CategoryValidator;
.super Lorg/junit/validator/AnnotationValidator;
.source "CategoryValidator.java"


# static fields
.field private static final INCOMPATIBLE_ANNOTATIONS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 30
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Lorg/junit/BeforeClass;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-class v3, Lorg/junit/AfterClass;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-class v3, Lorg/junit/Before;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    const-class v3, Lorg/junit/After;

    aput-object v3, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lorg/junit/experimental/categories/CategoryValidator;->INCOMPATIBLE_ANNOTATIONS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/junit/validator/AnnotationValidator;-><init>()V

    return-void
.end method

.method private addErrorMessage(Ljava/util/List;Ljava/lang/Class;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "@%s can not be combined with @Category"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Ljava/lang/Exception;

    invoke-direct {v1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    return-void
.end method


# virtual methods
.method public validateAnnotatedMethod(Lorg/junit/runners/model/FrameworkMethod;)Ljava/util/List;
    .registers 11
    .param p1, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 45
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .local v4, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    invoke-virtual {p1}, Lorg/junit/runners/model/FrameworkMethod;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v1

    .line 47
    .local v1, "annotations":[Ljava/lang/annotation/Annotation;
    move-object v2, v1

    .local v2, "arr$":[Ljava/lang/annotation/Annotation;
    array-length v7, v2

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    move v6, v5

    .end local v5    # "i$":I
    .local v6, "i$":I
    :goto_d
    if-ge v6, v7, :cond_35

    aget-object v0, v2, v6

    .line 48
    .local v0, "annotation":Ljava/lang/annotation/Annotation;
    sget-object v8, Lorg/junit/experimental/categories/CategoryValidator;->INCOMPATIBLE_ANNOTATIONS:Ljava/util/Set;

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .end local v6    # "i$":I
    .local v5, "i$":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_31

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Class;

    .line 49
    .local v3, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-interface {v0}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-eqz v8, :cond_17

    .line 50
    invoke-direct {p0, v4, v3}, Lorg/junit/experimental/categories/CategoryValidator;->addErrorMessage(Ljava/util/List;Ljava/lang/Class;)V

    goto :goto_17

    .line 47
    .end local v3    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_31
    add-int/lit8 v5, v6, 0x1

    .local v5, "i$":I
    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_d

    .line 54
    .end local v0    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_35
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v8

    return-object v8
.end method
