.class Lorg/junit/runners/model/NoGenericTypeParametersValidator;
.super Ljava/lang/Object;
.source "NoGenericTypeParametersValidator.java"


# instance fields
.field private final method:Ljava/lang/reflect/Method;


# direct methods
.method constructor <init>(Ljava/lang/reflect/Method;)V
    .registers 2
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->method:Ljava/lang/reflect/Method;

    .line 16
    return-void
.end method

.method private validateNoTypeParameterOnGenericArrayType(Ljava/lang/reflect/GenericArrayType;Ljava/util/List;)V
    .registers 4
    .param p1, "arrayType"    # Ljava/lang/reflect/GenericArrayType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/GenericArrayType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->validateNoTypeParameterOnType(Ljava/lang/reflect/Type;Ljava/util/List;)V

    .line 57
    return-void
.end method

.method private validateNoTypeParameterOnParameterizedType(Ljava/lang/reflect/ParameterizedType;Ljava/util/List;)V
    .registers 7
    .param p1, "parameterized"    # Ljava/lang/reflect/ParameterizedType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/ParameterizedType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_10

    aget-object v1, v0, v2

    .line 40
    .local v1, "each":Ljava/lang/reflect/Type;
    invoke-direct {p0, v1, p2}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->validateNoTypeParameterOnType(Ljava/lang/reflect/Type;Ljava/util/List;)V

    .line 39
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 42
    .end local v1    # "each":Ljava/lang/reflect/Type;
    :cond_10
    return-void
.end method

.method private validateNoTypeParameterOnType(Ljava/lang/reflect/Type;Ljava/util/List;)V
    .registers 6
    .param p1, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    instance-of v0, p1, Ljava/lang/reflect/TypeVariable;

    if-eqz v0, :cond_30

    .line 26
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Method "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "() contains unresolved type variable "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .end local p1    # "type":Ljava/lang/reflect/Type;
    :cond_2f
    :goto_2f
    return-void

    .line 28
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_30
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_3a

    .line 29
    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    invoke-direct {p0, p1, p2}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->validateNoTypeParameterOnParameterizedType(Ljava/lang/reflect/ParameterizedType;Ljava/util/List;)V

    goto :goto_2f

    .line 30
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_3a
    instance-of v0, p1, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_44

    .line 31
    check-cast p1, Ljava/lang/reflect/WildcardType;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    invoke-direct {p0, p1, p2}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->validateNoTypeParameterOnWildcardType(Ljava/lang/reflect/WildcardType;Ljava/util/List;)V

    goto :goto_2f

    .line 32
    .restart local p1    # "type":Ljava/lang/reflect/Type;
    :cond_44
    instance-of v0, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v0, :cond_2f

    .line 33
    check-cast p1, Ljava/lang/reflect/GenericArrayType;

    .end local p1    # "type":Ljava/lang/reflect/Type;
    invoke-direct {p0, p1, p2}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->validateNoTypeParameterOnGenericArrayType(Ljava/lang/reflect/GenericArrayType;Ljava/util/List;)V

    goto :goto_2f
.end method

.method private validateNoTypeParameterOnWildcardType(Ljava/lang/reflect/WildcardType;Ljava/util/List;)V
    .registers 7
    .param p1, "wildcard"    # Ljava/lang/reflect/WildcardType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/WildcardType;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 46
    .local p2, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {p1}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_10

    aget-object v1, v0, v2

    .line 47
    .local v1, "each":Ljava/lang/reflect/Type;
    invoke-direct {p0, v1, p2}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->validateNoTypeParameterOnType(Ljava/lang/reflect/Type;Ljava/util/List;)V

    .line 46
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 49
    .end local v1    # "each":Ljava/lang/reflect/Type;
    :cond_10
    invoke-interface {p1}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    array-length v3, v0

    const/4 v2, 0x0

    :goto_16
    if-ge v2, v3, :cond_20

    aget-object v1, v0, v2

    .line 50
    .restart local v1    # "each":Ljava/lang/reflect/Type;
    invoke-direct {p0, v1, p2}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->validateNoTypeParameterOnType(Ljava/lang/reflect/Type;Ljava/util/List;)V

    .line 49
    add-int/lit8 v2, v2, 0x1

    goto :goto_16

    .line 52
    .end local v1    # "each":Ljava/lang/reflect/Type;
    :cond_20
    return-void
.end method


# virtual methods
.method validate(Ljava/util/List;)V
    .registers 7
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
    .line 19
    .local p1, "errors":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    iget-object v4, p0, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getGenericParameterTypes()[Ljava/lang/reflect/Type;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Type;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_8
    if-ge v2, v3, :cond_12

    aget-object v1, v0, v2

    .line 20
    .local v1, "each":Ljava/lang/reflect/Type;
    invoke-direct {p0, v1, p1}, Lorg/junit/runners/model/NoGenericTypeParametersValidator;->validateNoTypeParameterOnType(Ljava/lang/reflect/Type;Ljava/util/List;)V

    .line 19
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 22
    .end local v1    # "each":Ljava/lang/reflect/Type;
    :cond_12
    return-void
.end method
