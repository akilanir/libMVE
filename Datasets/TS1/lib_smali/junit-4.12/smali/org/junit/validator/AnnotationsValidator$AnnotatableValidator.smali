.class abstract Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;
.super Ljava/lang/Object;
.source "AnnotationsValidator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/validator/AnnotationsValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "AnnotatableValidator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lorg/junit/runners/model/Annotatable;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final ANNOTATION_VALIDATOR_FACTORY:Lorg/junit/validator/AnnotationValidatorFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    new-instance v0, Lorg/junit/validator/AnnotationValidatorFactory;

    invoke-direct {v0}, Lorg/junit/validator/AnnotationValidatorFactory;-><init>()V

    sput-object v0, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;->ANNOTATION_VALIDATOR_FACTORY:Lorg/junit/validator/AnnotationValidatorFactory;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 43
    .local p0, "this":Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;, "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/validator/AnnotationsValidator$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/junit/validator/AnnotationsValidator$1;

    .prologue
    .line 43
    .local p0, "this":Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;, "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator<TT;>;"
    invoke-direct {p0}, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;-><init>()V

    return-void
.end method

.method private validateAnnotatable(Lorg/junit/runners/model/Annotatable;)Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;, "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator<TT;>;"
    .local p1, "annotatable":Lorg/junit/runners/model/Annotatable;, "TT;"
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .local v8, "validationErrors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    invoke-interface {p1}, Lorg/junit/runners/model/Annotatable;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v3

    .local v3, "arr$":[Ljava/lang/annotation/Annotation;
    array-length v6, v3

    .local v6, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_b
    if-ge v5, v6, :cond_2d

    aget-object v0, v3, v5

    .line 63
    .local v0, "annotation":Ljava/lang/annotation/Annotation;
    invoke-interface {v0}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v1

    .line 65
    .local v1, "annotationType":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    const-class v9, Lorg/junit/validator/ValidateWith;

    invoke-virtual {v1, v9}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v7

    check-cast v7, Lorg/junit/validator/ValidateWith;

    .line 67
    .local v7, "validateWith":Lorg/junit/validator/ValidateWith;
    if-eqz v7, :cond_2a

    .line 68
    sget-object v9, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;->ANNOTATION_VALIDATOR_FACTORY:Lorg/junit/validator/AnnotationValidatorFactory;

    invoke-virtual {v9, v7}, Lorg/junit/validator/AnnotationValidatorFactory;->createAnnotationValidator(Lorg/junit/validator/ValidateWith;)Lorg/junit/validator/AnnotationValidator;

    move-result-object v2

    .line 70
    .local v2, "annotationValidator":Lorg/junit/validator/AnnotationValidator;
    invoke-virtual {p0, v2, p1}, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;->validateAnnotatable(Lorg/junit/validator/AnnotationValidator;Lorg/junit/runners/model/Annotatable;)Ljava/util/List;

    move-result-object v4

    .line 72
    .local v4, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    invoke-interface {v8, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 62
    .end local v2    # "annotationValidator":Lorg/junit/validator/AnnotationValidator;
    .end local v4    # "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    :cond_2a
    add-int/lit8 v5, v5, 0x1

    goto :goto_b

    .line 75
    .end local v0    # "annotation":Ljava/lang/annotation/Annotation;
    .end local v1    # "annotationType":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    .end local v7    # "validateWith":Lorg/junit/validator/ValidateWith;
    :cond_2d
    return-object v8
.end method


# virtual methods
.method abstract getAnnotatablesForTestClass(Lorg/junit/runners/model/TestClass;)Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/TestClass;",
            ")",
            "Ljava/lang/Iterable",
            "<TT;>;"
        }
    .end annotation
.end method

.method abstract validateAnnotatable(Lorg/junit/validator/AnnotationValidator;Lorg/junit/runners/model/Annotatable;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/validator/AnnotationValidator;",
            "TT;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation
.end method

.method public validateTestClass(Lorg/junit/runners/model/TestClass;)Ljava/util/List;
    .registers 7
    .param p1, "testClass"    # Lorg/junit/runners/model/TestClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/TestClass;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;, "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator<TT;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .local v3, "validationErrors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    invoke-virtual {p0, p1}, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;->getAnnotatablesForTestClass(Lorg/junit/runners/model/TestClass;)Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/junit/runners/model/Annotatable;

    .line 54
    .local v1, "annotatable":Lorg/junit/runners/model/Annotatable;, "TT;"
    invoke-direct {p0, v1}, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;->validateAnnotatable(Lorg/junit/runners/model/Annotatable;)Ljava/util/List;

    move-result-object v0

    .line 55
    .local v0, "additionalErrors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    invoke-interface {v3, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_d

    .line 57
    .end local v0    # "additionalErrors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    .end local v1    # "annotatable":Lorg/junit/runners/model/Annotatable;, "TT;"
    :cond_21
    return-object v3
.end method
