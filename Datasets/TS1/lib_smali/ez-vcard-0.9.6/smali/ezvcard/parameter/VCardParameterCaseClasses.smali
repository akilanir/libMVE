.class public Lezvcard/parameter/VCardParameterCaseClasses;
.super Lezvcard/util/CaseClasses;
.source "VCardParameterCaseClasses.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lezvcard/parameter/VCardParameter;",
        ">",
        "Lezvcard/util/CaseClasses",
        "<TT;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p0, "this":Lezvcard/parameter/VCardParameterCaseClasses;, "Lezvcard/parameter/VCardParameterCaseClasses<TT;>;"
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1}, Lezvcard/util/CaseClasses;-><init>(Ljava/lang/Class;)V

    .line 42
    return-void
.end method


# virtual methods
.method protected create(Ljava/lang/String;)Lezvcard/parameter/VCardParameter;
    .registers 9
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 49
    .local p0, "this":Lezvcard/parameter/VCardParameterCaseClasses;, "Lezvcard/parameter/VCardParameterCaseClasses<TT;>;"
    :try_start_0
    iget-object v3, p0, Lezvcard/parameter/VCardParameterCaseClasses;->clazz:Ljava/lang/Class;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 50
    .local v0, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 51
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lezvcard/parameter/VCardParameter;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e} :catch_1f

    .line 57
    :goto_1e
    return-object v3

    .line 52
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    :catch_1f
    move-exception v1

    .line 55
    .local v1, "e":Ljava/lang/Exception;
    :try_start_20
    iget-object v3, p0, Lezvcard/parameter/VCardParameterCaseClasses;->clazz:Ljava/lang/Class;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, [Lezvcard/VCardVersion;

    aput-object v6, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 56
    .restart local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    .line 57
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    const/4 v5, 0x0

    new-array v5, v5, [Lezvcard/VCardVersion;

    aput-object v5, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lezvcard/parameter/VCardParameter;
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_49} :catch_4a

    goto :goto_1e

    .line 58
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<TT;>;"
    :catch_4a
    move-exception v2

    .line 59
    .local v2, "e2":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method protected bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 39
    .local p0, "this":Lezvcard/parameter/VCardParameterCaseClasses;, "Lezvcard/parameter/VCardParameterCaseClasses<TT;>;"
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lezvcard/parameter/VCardParameterCaseClasses;->create(Ljava/lang/String;)Lezvcard/parameter/VCardParameter;

    move-result-object v0

    return-object v0
.end method

.method protected matches(Lezvcard/parameter/VCardParameter;Ljava/lang/String;)Z
    .registers 4
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lezvcard/parameter/VCardParameterCaseClasses;, "Lezvcard/parameter/VCardParameterCaseClasses<TT;>;"
    .local p1, "object":Lezvcard/parameter/VCardParameter;, "TT;"
    invoke-virtual {p1}, Lezvcard/parameter/VCardParameter;->getValue()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic matches(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 39
    .local p0, "this":Lezvcard/parameter/VCardParameterCaseClasses;, "Lezvcard/parameter/VCardParameterCaseClasses<TT;>;"
    check-cast p1, Lezvcard/parameter/VCardParameter;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/lang/String;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lezvcard/parameter/VCardParameterCaseClasses;->matches(Lezvcard/parameter/VCardParameter;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
