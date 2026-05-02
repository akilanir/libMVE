.class public Lorg/junit/internal/runners/TestMethod;
.super Ljava/lang/Object;
.source "TestMethod.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final method:Ljava/lang/reflect/Method;

.field private testClass:Lorg/junit/internal/runners/TestClass;


# direct methods
.method public constructor <init>(Ljava/lang/reflect/Method;Lorg/junit/internal/runners/TestClass;)V
    .registers 3
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "testClass"    # Lorg/junit/internal/runners/TestClass;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lorg/junit/internal/runners/TestMethod;->method:Ljava/lang/reflect/Method;

    .line 26
    iput-object p2, p0, Lorg/junit/internal/runners/TestMethod;->testClass:Lorg/junit/internal/runners/TestClass;

    .line 27
    return-void
.end method


# virtual methods
.method expectsException()Z
    .registers 2

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/junit/internal/runners/TestMethod;->getExpectedException()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method getAfters()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .prologue
    .line 64
    iget-object v0, p0, Lorg/junit/internal/runners/TestMethod;->testClass:Lorg/junit/internal/runners/TestClass;

    const-class v1, Lorg/junit/After;

    invoke-virtual {v0, v1}, Lorg/junit/internal/runners/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method getBefores()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lorg/junit/internal/runners/TestMethod;->testClass:Lorg/junit/internal/runners/TestClass;

    const-class v1, Lorg/junit/Before;

    invoke-virtual {v0, v1}, Lorg/junit/internal/runners/TestClass;->getAnnotatedMethods(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getExpectedException()Ljava/lang/Class;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v1, p0, Lorg/junit/internal/runners/TestMethod;->method:Ljava/lang/reflect/Method;

    const-class v2, Lorg/junit/Test;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/junit/Test;

    .line 44
    .local v0, "annotation":Lorg/junit/Test;
    if-eqz v0, :cond_14

    invoke-interface {v0}, Lorg/junit/Test;->expected()Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lorg/junit/Test$None;

    if-ne v1, v2, :cond_16

    .line 45
    :cond_14
    const/4 v1, 0x0

    .line 47
    :goto_15
    return-object v1

    :cond_16
    invoke-interface {v0}, Lorg/junit/Test;->expected()Ljava/lang/Class;

    move-result-object v1

    goto :goto_15
.end method

.method public getTimeout()J
    .registers 6

    .prologue
    .line 34
    iget-object v3, p0, Lorg/junit/internal/runners/TestMethod;->method:Ljava/lang/reflect/Method;

    const-class v4, Lorg/junit/Test;

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/junit/Test;

    .line 35
    .local v0, "annotation":Lorg/junit/Test;
    if-nez v0, :cond_f

    .line 36
    const-wide/16 v1, 0x0

    .line 39
    :goto_e
    return-wide v1

    .line 38
    :cond_f
    invoke-interface {v0}, Lorg/junit/Test;->timeout()J

    move-result-wide v1

    .line 39
    .local v1, "timeout":J
    goto :goto_e
.end method

.method public invoke(Ljava/lang/Object;)V
    .registers 4
    .param p1, "test"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .prologue
    .line 68
    iget-object v0, p0, Lorg/junit/internal/runners/TestMethod;->method:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    return-void
.end method

.method public isIgnored()Z
    .registers 3

    .prologue
    .line 30
    iget-object v0, p0, Lorg/junit/internal/runners/TestMethod;->method:Ljava/lang/reflect/Method;

    const-class v1, Lorg/junit/Ignore;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method isUnexpected(Ljava/lang/Throwable;)Z
    .registers 4
    .param p1, "exception"    # Ljava/lang/Throwable;

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/junit/internal/runners/TestMethod;->getExpectedException()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method
