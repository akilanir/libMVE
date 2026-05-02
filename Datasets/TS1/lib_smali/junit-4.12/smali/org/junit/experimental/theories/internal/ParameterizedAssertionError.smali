.class public Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;
.super Ljava/lang/AssertionError;
.source "ParameterizedAssertionError.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public varargs constructor <init>(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "targetException"    # Ljava/lang/Throwable;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "params"    # [Ljava/lang/Object;

    .prologue
    .line 12
    const-string v0, "%s(%s)"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    const-string v3, ", "

    invoke-static {v3, p3}, Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;->join(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 13
    invoke-virtual {p0, p1}, Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 14
    return-void
.end method

.method public static join(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;
    .registers 6
    .param p0, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "values":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Object;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .local v2, "sb":Ljava/lang/StringBuilder;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 33
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/Object;>;"
    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_24

    .line 34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 35
    .local v1, "next":Ljava/lang/Object;
    invoke-static {v1}, Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;->stringValueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 37
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_9

    .line 40
    .end local v1    # "next":Ljava/lang/Object;
    :cond_24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static varargs join(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p0, "delimiter"    # Ljava/lang/String;
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 27
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {p0, v0}, Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;->join(Ljava/lang/String;Ljava/util/Collection;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static stringValueOf(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p0, "next"    # Ljava/lang/Object;

    .prologue
    .line 45
    :try_start_0
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 47
    :goto_4
    return-object v1

    .line 46
    :catch_5
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/Throwable;
    const-string v1, "[toString failed]"

    goto :goto_4
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 18
    instance-of v0, p1, Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;

    if-eqz v0, :cond_14

    invoke-virtual {p0}, Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 23
    invoke-virtual {p0}, Lorg/junit/experimental/theories/internal/ParameterizedAssertionError;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
