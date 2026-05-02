.class Lorg/junit/validator/AnnotationsValidator$FieldValidator;
.super Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;
.source "AnnotationsValidator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/validator/AnnotationsValidator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FieldValidator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator",
        "<",
        "Lorg/junit/runners/model/FrameworkField;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    .line 107
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;-><init>(Lorg/junit/validator/AnnotationsValidator$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/validator/AnnotationsValidator$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/junit/validator/AnnotationsValidator$1;

    .prologue
    .line 107
    invoke-direct {p0}, Lorg/junit/validator/AnnotationsValidator$FieldValidator;-><init>()V

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
            "Lorg/junit/runners/model/FrameworkField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    invoke-virtual {p1}, Lorg/junit/runners/model/TestClass;->getAnnotatedFields()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic validateAnnotatable(Lorg/junit/validator/AnnotationValidator;Lorg/junit/runners/model/Annotatable;)Ljava/util/List;
    .registers 4
    .param p1, "x0"    # Lorg/junit/validator/AnnotationValidator;
    .param p2, "x1"    # Lorg/junit/runners/model/Annotatable;

    .prologue
    .line 107
    check-cast p2, Lorg/junit/runners/model/FrameworkField;

    .end local p2    # "x1":Lorg/junit/runners/model/Annotatable;
    invoke-virtual {p0, p1, p2}, Lorg/junit/validator/AnnotationsValidator$FieldValidator;->validateAnnotatable(Lorg/junit/validator/AnnotationValidator;Lorg/junit/runners/model/FrameworkField;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method validateAnnotatable(Lorg/junit/validator/AnnotationValidator;Lorg/junit/runners/model/FrameworkField;)Ljava/util/List;
    .registers 4
    .param p1, "validator"    # Lorg/junit/validator/AnnotationValidator;
    .param p2, "field"    # Lorg/junit/runners/model/FrameworkField;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/validator/AnnotationValidator;",
            "Lorg/junit/runners/model/FrameworkField;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Exception;",
            ">;"
        }
    .end annotation

    .prologue
    .line 117
    invoke-virtual {p1, p2}, Lorg/junit/validator/AnnotationValidator;->validateAnnotatedField(Lorg/junit/runners/model/FrameworkField;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
