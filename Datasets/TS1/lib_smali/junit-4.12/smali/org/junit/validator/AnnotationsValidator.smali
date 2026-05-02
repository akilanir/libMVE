.class public final Lorg/junit/validator/AnnotationsValidator;
.super Ljava/lang/Object;
.source "AnnotationsValidator.java"

# interfaces
.implements Lorg/junit/validator/TestClassValidator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/junit/validator/AnnotationsValidator$1;,
        Lorg/junit/validator/AnnotationsValidator$FieldValidator;,
        Lorg/junit/validator/AnnotationsValidator$MethodValidator;,
        Lorg/junit/validator/AnnotationsValidator$ClassValidator;,
        Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;
    }
.end annotation


# static fields
.field private static final VALIDATORS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator",
            "<*>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x0

    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;

    const/4 v1, 0x0

    new-instance v2, Lorg/junit/validator/AnnotationsValidator$ClassValidator;

    invoke-direct {v2, v3}, Lorg/junit/validator/AnnotationsValidator$ClassValidator;-><init>(Lorg/junit/validator/AnnotationsValidator$1;)V

    aput-object v2, v0, v1

    const/4 v1, 0x1

    new-instance v2, Lorg/junit/validator/AnnotationsValidator$MethodValidator;

    invoke-direct {v2, v3}, Lorg/junit/validator/AnnotationsValidator$MethodValidator;-><init>(Lorg/junit/validator/AnnotationsValidator$1;)V

    aput-object v2, v0, v1

    const/4 v1, 0x2

    new-instance v2, Lorg/junit/validator/AnnotationsValidator$FieldValidator;

    invoke-direct {v2, v3}, Lorg/junit/validator/AnnotationsValidator$FieldValidator;-><init>(Lorg/junit/validator/AnnotationsValidator$1;)V

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lorg/junit/validator/AnnotationsValidator;->VALIDATORS:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    return-void
.end method


# virtual methods
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
    .line 34
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .local v2, "validationErrors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    sget-object v4, Lorg/junit/validator/AnnotationsValidator;->VALIDATORS:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;

    .line 36
    .local v3, "validator":Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;, "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator<*>;"
    invoke-virtual {v3, p1}, Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;->validateTestClass(Lorg/junit/runners/model/TestClass;)Ljava/util/List;

    move-result-object v0

    .line 38
    .local v0, "additionalErrors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_b

    .line 40
    .end local v0    # "additionalErrors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Exception;>;"
    .end local v3    # "validator":Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator;, "Lorg/junit/validator/AnnotationsValidator$AnnotatableValidator<*>;"
    :cond_1f
    return-object v2
.end method
