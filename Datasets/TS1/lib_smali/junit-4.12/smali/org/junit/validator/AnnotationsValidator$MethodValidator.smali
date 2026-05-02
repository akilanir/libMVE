.class Lorg/junit/validator/AnnotationsValidator$MethodValidator;
.super Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;
.source "AnnotationsValidator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/validator/AnnotationsValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MethodValidator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator",
        "<",
        "Lorg/junit/runners/model/FrameworkMethod;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 92
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;-><init>(Lorg/junit/validator/AnnotationsValidator$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/validator/AnnotationsValidator$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/junit/validator/AnnotationsValidator$1;

    .prologue
    .line 92
    invoke-direct {p0}, Lorg/junit/validator/AnnotationsValidator$MethodValidator;-><init>()V

    return-void
.end method


# virtual methods
.method getAnnotatablesForTestClass(Lorg/junit/runners/model/TestClass;)Ljava/lang/Iterable;
    .registers 3
    .param p1, "testClass"    # Lorg/junit/runners/model/TestClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runners/model/TestClass;",
            ")",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    invoke-virtual {p1}, Lorg/junit/runners/model/TestClass;->getAnnotatedMethods()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic validateAnnotatable(Lorg/junit/validator/AnnotationValidator;Lorg/junit/runners/model/Annotatable;)Ljava/util/List;
    .registers 4
    .param p1, "x0"    # Lorg/junit/validator/AnnotationValidator;
    .param p2, "x1"    # Lorg/junit/runners/model/Annotatable;

    .prologue
    .line 92
    check-cast p2, Lorg/junit/runners/model/FrameworkMethod;

    .end local p2    # "x1":Lorg/junit/runners/model/Annotatable;
    invoke-virtual {p0, p1, p2}, Lorg/junit/validator/AnnotationsValidator$MethodValidator;->validateAnnotatable(Lorg/junit/validator/AnnotationValidator;Lorg/junit/runners/model/FrameworkMethod;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method validateAnnotatable(Lorg/junit/validator/AnnotationValidator;Lorg/junit/runners/model/FrameworkMethod;)Ljava/util/List;
    .registers 4
    .param p1, "validator"    # Lorg/junit/validator/AnnotationValidator;
    .param p2, "method"    # Lorg/junit/runners/model/FrameworkMethod;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/validator/AnnotationValidator;",
            "Lorg/junit/runners/model/FrameworkMethod;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    invoke-virtual {p1, p2}, Lorg/junit/validator/AnnotationValidator;->validateAnnotatedMethod(Lorg/junit/runners/model/FrameworkMethod;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
