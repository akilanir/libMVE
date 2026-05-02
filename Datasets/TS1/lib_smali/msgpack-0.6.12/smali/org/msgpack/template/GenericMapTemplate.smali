.class public Lorg/msgpack/template/GenericMapTemplate;
.super Ljava/lang/Object;
.source "GenericMapTemplate.java"

# interfaces
.implements Lorg/msgpack/template/GenericTemplate;


# instance fields
.field constructor:Ljava/lang/reflect/Constructor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<+",
            "Lorg/msgpack/template/Template;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/msgpack/template/TemplateRegistry;Ljava/lang/Class;)V
    .registers 8
    .param p1, "registry"    # Lorg/msgpack/template/TemplateRegistry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/msgpack/template/TemplateRegistry;",
            "Ljava/lang/Class",
            "<+",
            "Lorg/msgpack/template/Template;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 28
    .local p2, "tmpl":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/msgpack/template/Template;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const/4 v1, 0x2

    :try_start_4
    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Lorg/msgpack/template/Template;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-class v3, Lorg/msgpack/template/Template;

    aput-object v3, v1, v2

    invoke-virtual {p2, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    iput-object v1, p0, Lorg/msgpack/template/GenericMapTemplate;->constructor:Ljava/lang/reflect/Constructor;

    .line 31
    iget-object v1, p0, Lorg/msgpack/template/GenericMapTemplate;->constructor:Ljava/lang/reflect/Constructor;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    new-instance v4, Lorg/msgpack/template/AnyTemplate;

    invoke-direct {v4, p1}, Lorg/msgpack/template/AnyTemplate;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Lorg/msgpack/template/AnyTemplate;

    invoke-direct {v4, p1}, Lorg/msgpack/template/AnyTemplate;-><init>(Lorg/msgpack/template/TemplateRegistry;)V

    aput-object v4, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_2e} :catch_2f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_2e} :catch_36
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_2e} :catch_3d
    .catch Ljava/lang/InstantiationException; {:try_start_4 .. :try_end_2e} :catch_44

    .line 43
    return-void

    .line 34
    :catch_2f
    move-exception v0

    .line 35
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 36
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_36
    move-exception v0

    .line 37
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 38
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_3d
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 40
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_44
    move-exception v0

    .line 41
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public build([Lorg/msgpack/template/Template;)Lorg/msgpack/template/Template;
    .registers 4
    .param p1, "params"    # [Lorg/msgpack/template/Template;

    .prologue
    .line 48
    :try_start_0
    iget-object v1, p0, Lorg/msgpack/template/GenericMapTemplate;->constructor:Ljava/lang/reflect/Constructor;

    check-cast p1, [Ljava/lang/Object;

    .end local p1    # "params":[Lorg/msgpack/template/Template;
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/msgpack/template/Template;
    :try_end_a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_a} :catch_b
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_a} :catch_12
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_a} :catch_19

    return-object v1

    .line 49
    :catch_b
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 51
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_12
    move-exception v0

    .line 52
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 53
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_19
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
