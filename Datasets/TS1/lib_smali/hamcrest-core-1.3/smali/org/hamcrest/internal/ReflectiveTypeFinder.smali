.class public Lorg/hamcrest/internal/ReflectiveTypeFinder;
.super Ljava/lang/Object;
.source "ReflectiveTypeFinder.java"


# instance fields
.field private final expectedNumberOfParameters:I

.field private final methodName:Ljava/lang/String;

.field private final typedParameter:I


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "expectedNumberOfParameters"    # I
    .param p3, "typedParameter"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/hamcrest/internal/ReflectiveTypeFinder;->methodName:Ljava/lang/String;

    .line 37
    iput p2, p0, Lorg/hamcrest/internal/ReflectiveTypeFinder;->expectedNumberOfParameters:I

    .line 38
    iput p3, p0, Lorg/hamcrest/internal/ReflectiveTypeFinder;->typedParameter:I

    .line 39
    return-void
.end method


# virtual methods
.method protected canObtainExpectedTypeFrom(Ljava/lang/reflect/Method;)Z
    .registers 4
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 57
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/hamcrest/internal/ReflectiveTypeFinder;->methodName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    iget v1, p0, Lorg/hamcrest/internal/ReflectiveTypeFinder;->expectedNumberOfParameters:I

    if-ne v0, v1, :cond_1d

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->isSynthetic()Z

    move-result v0

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    :goto_1c
    return v0

    :cond_1d
    const/4 v0, 0x0

    goto :goto_1c
.end method

.method protected expectedTypeFrom(Ljava/lang/reflect/Method;)Ljava/lang/Class;
    .registers 4
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    iget v1, p0, Lorg/hamcrest/internal/ReflectiveTypeFinder;->typedParameter:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method public findExpectedType(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 10
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
    .line 42
    .local p1, "fromClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v1, p1

    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    const-class v5, Ljava/lang/Object;

    if-eq v1, v5, :cond_22

    .line 43
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_b
    if-ge v2, v3, :cond_1d

    aget-object v4, v0, v2

    .line 44
    .local v4, "method":Ljava/lang/reflect/Method;
    invoke-virtual {p0, v4}, Lorg/hamcrest/internal/ReflectiveTypeFinder;->canObtainExpectedTypeFrom(Ljava/lang/reflect/Method;)Z

    move-result v5

    if-eqz v5, :cond_1a

    .line 45
    invoke-virtual {p0, v4}, Lorg/hamcrest/internal/ReflectiveTypeFinder;->expectedTypeFrom(Ljava/lang/reflect/Method;)Ljava/lang/Class;

    move-result-object v5

    return-object v5

    .line 43
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 42
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :cond_1d
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_1

    .line 49
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_22
    new-instance v5, Ljava/lang/Error;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cannot determine correct type for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lorg/hamcrest/internal/ReflectiveTypeFinder;->methodName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "() method."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v5
.end method
