.class public abstract Lorg/junit/internal/matchers/TypeSafeMatcher;
.super Lorg/hamcrest/BaseMatcher;
.source "TypeSafeMatcher.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/hamcrest/BaseMatcher",
        "<TT;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private expectedType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 26
    .local p0, "this":Lorg/junit/internal/matchers/TypeSafeMatcher;, "Lorg/junit/internal/matchers/TypeSafeMatcher<TT;>;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/junit/internal/matchers/TypeSafeMatcher;->findExpectedType(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/internal/matchers/TypeSafeMatcher;->expectedType:Ljava/lang/Class;

    .line 28
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lorg/junit/internal/matchers/TypeSafeMatcher;, "Lorg/junit/internal/matchers/TypeSafeMatcher<TT;>;"
    .local p1, "expectedType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Lorg/hamcrest/BaseMatcher;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/junit/internal/matchers/TypeSafeMatcher;->expectedType:Ljava/lang/Class;

    .line 50
    return-void
.end method

.method private static findExpectedType(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 8
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
    .line 31
    .local p0, "fromClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v1, p0

    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    const-class v5, Ljava/lang/Object;

    if-eq v1, v5, :cond_25

    .line 32
    invoke-static {v1}, Lorg/junit/internal/MethodSorter;->getDeclaredMethods(Ljava/lang/Class;)[Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_b
    if-ge v2, v3, :cond_20

    aget-object v4, v0, v2

    .line 33
    .local v4, "method":Ljava/lang/reflect/Method;
    invoke-static {v4}, Lorg/junit/internal/matchers/TypeSafeMatcher;->isMatchesSafelyMethod(Ljava/lang/reflect/Method;)Z

    move-result v5

    if-eqz v5, :cond_1d

    .line 34
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    const/4 v6, 0x0

    aget-object v5, v5, v6

    return-object v5

    .line 32
    :cond_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 31
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :cond_20
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_1

    .line 39
    .end local v0    # "arr$":[Ljava/lang/reflect/Method;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :cond_25
    new-instance v5, Ljava/lang/Error;

    const-string v6, "Cannot determine correct type for matchesSafely() method."

    invoke-direct {v5, v6}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private static isMatchesSafelyMethod(Ljava/lang/reflect/Method;)Z
    .registers 4
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v0, 0x1

    .line 43
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "matchesSafely"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    array-length v1, v1

    if-ne v1, v0, :cond_1b

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->isSynthetic()Z

    move-result v1

    if-nez v1, :cond_1b

    :goto_1a
    return v0

    :cond_1b
    const/4 v0, 0x0

    goto :goto_1a
.end method


# virtual methods
.method public final matches(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "item"    # Ljava/lang/Object;

    .prologue
    .line 59
    .local p0, "this":Lorg/junit/internal/matchers/TypeSafeMatcher;, "Lorg/junit/internal/matchers/TypeSafeMatcher<TT;>;"
    if-eqz p1, :cond_12

    iget-object v0, p0, Lorg/junit/internal/matchers/TypeSafeMatcher;->expectedType:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-virtual {p0, p1}, Lorg/junit/internal/matchers/TypeSafeMatcher;->matchesSafely(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public abstract matchesSafely(Ljava/lang/Object;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation
.end method
