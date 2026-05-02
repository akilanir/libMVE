.class public Lorg/junit/validator/AnnotationValidatorFactory;
.super Ljava/lang/Object;
.source "AnnotationValidatorFactory.java"


# static fields
.field private static final VALIDATORS_FOR_ANNOTATION_TYPES:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Lorg/junit/validator/ValidateWith;",
            "Lorg/junit/validator/AnnotationValidator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 11
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/junit/validator/AnnotationValidatorFactory;->VALIDATORS_FOR_ANNOTATION_TYPES:Ljava/util/concurrent/ConcurrentHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createAnnotationValidator(Lorg/junit/validator/ValidateWith;)Lorg/junit/validator/AnnotationValidator;
    .registers 9
    .param p1, "validateWithAnnotation"    # Lorg/junit/validator/ValidateWith;

    .prologue
    .line 24
    sget-object v4, Lorg/junit/validator/AnnotationValidatorFactory;->VALIDATORS_FOR_ANNOTATION_TYPES:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/junit/validator/AnnotationValidator;

    .line 25
    .local v3, "validator":Lorg/junit/validator/AnnotationValidator;
    if-eqz v3, :cond_b

    .line 36
    .end local v3    # "validator":Lorg/junit/validator/AnnotationValidator;
    :goto_a
    return-object v3

    .line 29
    .restart local v3    # "validator":Lorg/junit/validator/AnnotationValidator;
    :cond_b
    invoke-interface {p1}, Lorg/junit/validator/ValidateWith;->value()Ljava/lang/Class;

    move-result-object v1

    .line 30
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/junit/validator/AnnotationValidator;>;"
    if-nez v1, :cond_32

    .line 31
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t create validator, value is null in annotation "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 34
    :cond_32
    :try_start_32
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/validator/AnnotationValidator;

    .line 35
    .local v0, "annotationValidator":Lorg/junit/validator/AnnotationValidator;
    sget-object v4, Lorg/junit/validator/AnnotationValidatorFactory;->VALIDATORS_FOR_ANNOTATION_TYPES:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v4, Lorg/junit/validator/AnnotationValidatorFactory;->VALIDATORS_FOR_ANNOTATION_TYPES:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/junit/validator/AnnotationValidator;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_45} :catch_47

    move-object v3, v4

    goto :goto_a

    .line 37
    .end local v0    # "annotationValidator":Lorg/junit/validator/AnnotationValidator;
    :catch_47
    move-exception v2

    .line 38
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception received when creating AnnotationValidator class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method
