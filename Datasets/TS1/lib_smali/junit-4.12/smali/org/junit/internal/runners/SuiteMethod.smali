.class public Lorg/junit/internal/runners/SuiteMethod;
.super Lorg/junit/internal/runners/JUnit38ClassRunner;
.source "SuiteMethod.java"


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 24
    .local p1, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p1}, Lorg/junit/internal/runners/SuiteMethod;->testFromSuiteMethod(Ljava/lang/Class;)Ljunit/framework/Test;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/junit/internal/runners/JUnit38ClassRunner;-><init>(Ljunit/framework/Test;)V

    .line 25
    return-void
.end method

.method public static testFromSuiteMethod(Ljava/lang/Class;)Ljunit/framework/Test;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljunit/framework/Test;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "klass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    .line 29
    .local v2, "suiteMethod":Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .line 31
    .local v1, "suite":Ljunit/framework/Test;
    :try_start_2
    const-string v3, "suite"

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Class;

    invoke-virtual {p0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 32
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v3

    invoke-static {v3}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v3

    if-nez v3, :cond_38

    .line 33
    new-instance v3, Ljava/lang/Exception;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".suite() must be static"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_32
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_32} :catch_32

    .line 36
    .end local v1    # "suite":Ljunit/framework/Test;
    :catch_32
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    throw v3

    .line 35
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    .restart local v1    # "suite":Ljunit/framework/Test;
    :cond_38
    const/4 v3, 0x0

    const/4 v4, 0x0

    :try_start_3a
    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "suite":Ljunit/framework/Test;
    check-cast v1, Ljunit/framework/Test;
    :try_end_42
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3a .. :try_end_42} :catch_32

    .line 39
    .restart local v1    # "suite":Ljunit/framework/Test;
    return-object v1
.end method
