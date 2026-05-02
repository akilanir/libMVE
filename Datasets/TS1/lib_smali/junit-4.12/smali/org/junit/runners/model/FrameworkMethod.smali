.class public Lorg/junit/runners/model/FrameworkMethod;
.super Lorg/junit/runners/model/FrameworkMember;
.source "FrameworkMethod.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/junit/runners/model/FrameworkMember",
        "<",
        "Lorg/junit/runners/model/FrameworkMethod;",
        ">;"
    }
.end annotation


# instance fields
.field private final method:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Method;)V
    .registers 4
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/junit/runners/model/FrameworkMember;-><init>()V

    .line 26
    if-nez p1, :cond_d

    .line 27
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "FrameworkMethod cannot be created without an underlying method."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 30
    :cond_d
    iput-object p1, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    .line 31
    return-void
.end method

.method static synthetic access$000(Lorg/junit/runners/model/FrameworkMethod;)Ljava/lang/reflect/Method;
    .registers 2
    .param p0, "x0"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    .line 19
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method private getParameterTypes()[Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 180
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 153
    const-class v0, Lorg/junit/runners/model/FrameworkMethod;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    .line 154
    const/4 v0, 0x0

    .line 156
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_9
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_a
    check-cast p1, Lorg/junit/runners/model/FrameworkMethod;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-object v0, p1, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    iget-object v1, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_9
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
    .line 195
    .local p1, "annotationType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotations()[Ljava/lang/annotation/Annotation;
    .registers 2

    .prologue
    .line 187
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method public getDeclaringClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 128
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method protected getModifiers()I
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getReturnType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 112
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 120
    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkMethod;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->hashCode()I

    move-result v0

    return v0
.end method

.method public varargs invokeExplosively(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "params"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 47
    new-instance v0, Lorg/junit/runners/model/FrameworkMethod$1;

    invoke-direct {v0, p0, p1, p2}, Lorg/junit/runners/model/FrameworkMethod$1;-><init>(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;[Ljava/lang/Object;)V

    invoke-virtual {v0}, Lorg/junit/runners/model/FrameworkMethod$1;->run()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic isShadowedBy(Lorg/junit/runners/model/FrameworkMember;)Z
    .registers 3
    .param p1, "x0"    # Lorg/junit/runners/model/FrameworkMember;

    .prologue
    .line 19
    check-cast p1, Lorg/junit/runners/model/FrameworkMethod;

    .end local p1    # "x0":Lorg/junit/runners/model/FrameworkMember;
    invoke-virtual {p0, p1}, Lorg/junit/runners/model/FrameworkMethod;->isShadowedBy(Lorg/junit/runners/model/FrameworkMethod;)Z

    move-result v0

    return v0
.end method

.method public isShadowedBy(Lorg/junit/runners/model/FrameworkMethod;)Z
    .registers 6
    .param p1, "other"    # Lorg/junit/runners/model/FrameworkMethod;

    .prologue
    const/4 v1, 0x0

    .line 137
    invoke-virtual {p1}, Lorg/junit/runners/model/FrameworkMethod;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkMethod;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_10

    .line 148
    :cond_f
    :goto_f
    return v1

    .line 140
    :cond_10
    invoke-direct {p1}, Lorg/junit/runners/model/FrameworkMethod;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    array-length v2, v2

    invoke-direct {p0}, Lorg/junit/runners/model/FrameworkMethod;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    array-length v3, v3

    if-ne v2, v3, :cond_f

    .line 143
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1d
    invoke-direct {p1}, Lorg/junit/runners/model/FrameworkMethod;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_39

    .line 144
    invoke-direct {p1}, Lorg/junit/runners/model/FrameworkMethod;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    aget-object v2, v2, v0

    invoke-direct {p0}, Lorg/junit/runners/model/FrameworkMethod;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v3

    aget-object v3, v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 143
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 148
    :cond_39
    const/4 v1, 0x1

    goto :goto_f
.end method

.method public producesType(Ljava/lang/reflect/Type;)Z
    .registers 3
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 175
    invoke-direct {p0}, Lorg/junit/runners/model/FrameworkMethod;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_1b

    instance-of v0, p1, Ljava/lang/Class;

    if-eqz v0, :cond_1b

    check-cast p1, Ljava/lang/Class;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v0, 0x1

    :goto_1a
    return v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 200
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public validateNoTypeParametersOnArgs(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 132
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    new-instance v0, Lorg/junit/runners/model/NoGenericTypeParametersValidator;

    iget-object v1, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-direct {v0, v1}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;-><init>(Ljava/lang/reflect/Method;)V

    invoke-virtual {v0, p1}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->validate(Ljava/util/List;)V

    .line 133
    return-void
.end method

.method public validatePublicVoid(ZLjava/util/List;)V
    .registers 7
    .param p1, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 91
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkMethod;->isStatic()Z

    move-result v1

    if-eq v1, p1, :cond_3b

    .line 92
    if-eqz p1, :cond_9a

    const-string v0, "should"

    .line 93
    .local v0, "state":Ljava/lang/String;
    :goto_a
    new-instance v1, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Method "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "() "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " be static"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .end local v0    # "state":Ljava/lang/String;
    :cond_3b
    invoke-virtual {p0}, Lorg/junit/runners/model/FrameworkMethod;->isPublic()Z

    move-result v1

    if-nez v1, :cond_68

    .line 96
    new-instance v1, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Method "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "() should be public"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    :cond_68
    iget-object v1, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    sget-object v2, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-eq v1, v2, :cond_99

    .line 99
    new-instance v1, Ljava/lang/Exception;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Method "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "() should be void"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    :cond_99
    return-void

    .line 92
    :cond_9a
    const-string v0, "should not"

    goto/16 :goto_a
.end method

.method public validatePublicVoidNoArg(ZLjava/util/List;)V
    .registers 6
    .param p1, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 74
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p0, p1, p2}, Lorg/junit/runners/model/FrameworkMethod;->validatePublicVoid(ZLjava/util/List;)V

    .line 75
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    if-eqz v0, :cond_33

    .line 76
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Method "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/junit/runners/model/FrameworkMethod;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " should have no parameters"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    :cond_33
    return-void
.end method
