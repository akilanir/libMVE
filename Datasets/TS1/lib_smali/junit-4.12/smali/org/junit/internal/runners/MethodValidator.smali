.class public Lorg/junit/internal/runners/MethodValidator;
.super Ljava/lang/Object;
.source "MethodValidator.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final errors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private testClass:Lorg/junit/internal/runners/TestClass;


# direct methods
.method public constructor <init>(Lorg/junit/internal/runners/TestClass;)V
    .registers 3
    .param p1, "testClass"    # Lorg/junit/internal/runners/TestClass;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    .line 29
    iput-object p1, p0, Lorg/junit/internal/runners/MethodValidator;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 30
    return-void
.end method

.method private validateTestMethods(Ljava/lang/Class;Z)V
    .registers 11
    .param p2, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p1, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    iget-object v4, p0, Lorg/junit/internal/runners/MethodValidator;->testClass:Lorg/junit/internal/runners/TestClass;

    invoke-virtual {v4, p1}, Lorg/junit/internal/runners/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    .line 73
    .local v2, "methods":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_a
    :goto_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_122

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    .line 74
    .local v0, "each":Ljava/lang/reflect/Method;
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v4

    if-eq v4, p2, :cond_55

    .line 75
    if-eqz p2, :cond_11e

    const-string v3, "should"

    .line 76
    .local v3, "state":Ljava/lang/String;
    :goto_24
    iget-object v4, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    new-instance v5, Ljava/lang/Exception;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Method "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "() "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " be static"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    .end local v3    # "state":Ljava/lang/String;
    :cond_55
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v4

    if-nez v4, :cond_8e

    .line 80
    iget-object v4, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    new-instance v5, Ljava/lang/Exception;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " should be public"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_8e
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v4

    invoke-static {v4}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v4

    if-nez v4, :cond_bf

    .line 84
    iget-object v4, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    new-instance v5, Ljava/lang/Exception;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Method "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " should be public"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    :cond_bf
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v4

    sget-object v5, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq v4, v5, :cond_ee

    .line 88
    iget-object v4, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    new-instance v5, Ljava/lang/Exception;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Method "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " should be void"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    :cond_ee
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v4

    array-length v4, v4

    if-eqz v4, :cond_a

    .line 92
    iget-object v4, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    new-instance v5, Ljava/lang/Exception;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Method "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " should have no parameters"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_a

    .line 75
    :cond_11e
    const-string v3, "should not"

    goto/16 :goto_24

    .line 96
    .end local v0    # "each":Ljava/lang/reflect/Method;
    :cond_122
    return-void
.end method


# virtual methods
.method public assertValid()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/internal/runners/InitializationError;
        }
    .end annotation

    .prologue
    .line 56
    iget-object v0, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10

    .line 57
    new-instance v0, Lorg/junit/internal/runners/InitializationError;

    iget-object v1, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    invoke-direct {v0, v1}, Lorg/junit/internal/runners/InitializationError;-><init>(Ljava/util/List;)V

    throw v0

    .line 59
    :cond_10
    return-void
.end method

.method public validateInstanceMethods()V
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 33
    const-class v1, Lorg/junit/After;

    invoke-direct {p0, v1, v2}, Lorg/junit/internal/runners/MethodValidator;->validateTestMethods(Ljava/lang/Class;Z)V

    .line 34
    const-class v1, Lorg/junit/Before;

    invoke-direct {p0, v1, v2}, Lorg/junit/internal/runners/MethodValidator;->validateTestMethods(Ljava/lang/Class;Z)V

    .line 35
    const-class v1, Lorg/junit/Test;

    invoke-direct {p0, v1, v2}, Lorg/junit/internal/runners/MethodValidator;->validateTestMethods(Ljava/lang/Class;Z)V

    .line 37
    iget-object v1, p0, Lorg/junit/internal/runners/MethodValidator;->testClass:Lorg/junit/internal/runners/TestClass;

    const-class v2, Lorg/junit/Test;

    invoke-virtual {v1, v2}, Lorg/junit/internal/runners/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 38
    .local v0, "methods":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_2a

    .line 39
    iget-object v1, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    new-instance v2, Ljava/lang/Exception;

    const-string v3, "No runnable methods"

    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    :cond_2a
    return-void
.end method

.method public validateMethodsForDefaultRunner()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    invoke-virtual {p0}, Lorg/junit/internal/runners/MethodValidator;->validateNoArgConstructor()V

    .line 50
    invoke-virtual {p0}, Lorg/junit/internal/runners/MethodValidator;->validateStaticMethods()V

    .line 51
    invoke-virtual {p0}, Lorg/junit/internal/runners/MethodValidator;->validateInstanceMethods()V

    .line 52
    iget-object v0, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    return-object v0
.end method

.method public validateNoArgConstructor()V
    .registers 5

    .prologue
    .line 63
    :try_start_0
    iget-object v1, p0, Lorg/junit/internal/runners/MethodValidator;->testClass:Lorg/junit/internal/runners/TestClass;

    invoke-virtual {v1}, Lorg/junit/internal/runners/TestClass;->getConstructor()Ljava/lang/reflect/Constructor;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    .line 67
    :goto_5
    return-void

    .line 64
    :catch_6
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lorg/junit/internal/runners/MethodValidator;->errors:Ljava/util/List;

    new-instance v2, Ljava/lang/Exception;

    const-string v3, "Test class should have public zero-argument constructor"

    invoke-direct {v2, v3, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5
.end method

.method public validateStaticMethods()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 44
    const-class v0, Lorg/junit/BeforeClass;

    invoke-direct {p0, v0, v1}, Lorg/junit/internal/runners/MethodValidator;->validateTestMethods(Ljava/lang/Class;Z)V

    .line 45
    const-class v0, Lorg/junit/AfterClass;

    invoke-direct {p0, v0, v1}, Lorg/junit/internal/runners/MethodValidator;->validateTestMethods(Ljava/lang/Class;Z)V

    .line 46
    return-void
.end method
