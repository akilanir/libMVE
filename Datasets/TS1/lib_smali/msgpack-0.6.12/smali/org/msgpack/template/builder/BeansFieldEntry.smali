.class public Lorg/msgpack/template/builder/BeansFieldEntry;
.super Lorg/msgpack/template/builder/FieldEntry;
.source "BeansFieldEntry.java"


# instance fields
.field protected desc:Lorg/msgpack/template/builder/beans/PropertyDescriptor;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Lorg/msgpack/template/builder/FieldEntry;-><init>()V

    .line 16
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/builder/BeansFieldEntry;)V
    .registers 3
    .param p1, "e"    # Lorg/msgpack/template/builder/BeansFieldEntry;

    .prologue
    .line 19
    iget-object v0, p1, Lorg/msgpack/template/builder/BeansFieldEntry;->option:Lorg/msgpack/template/FieldOption;

    invoke-direct {p0, v0}, Lorg/msgpack/template/builder/FieldEntry;-><init>(Lorg/msgpack/template/FieldOption;)V

    .line 20
    invoke-virtual {p1}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/msgpack/template/builder/BeansFieldEntry;->desc:Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 21
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/builder/beans/PropertyDescriptor;)V
    .registers 3
    .param p1, "desc"    # Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .prologue
    .line 24
    sget-object v0, Lorg/msgpack/template/FieldOption;->DEFAULT:Lorg/msgpack/template/FieldOption;

    invoke-direct {p0, p1, v0}, Lorg/msgpack/template/builder/BeansFieldEntry;-><init>(Lorg/msgpack/template/builder/beans/PropertyDescriptor;Lorg/msgpack/template/FieldOption;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Lorg/msgpack/template/builder/beans/PropertyDescriptor;Lorg/msgpack/template/FieldOption;)V
    .registers 3
    .param p1, "desc"    # Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .param p2, "option"    # Lorg/msgpack/template/FieldOption;

    .prologue
    .line 28
    invoke-direct {p0, p2}, Lorg/msgpack/template/builder/FieldEntry;-><init>(Lorg/msgpack/template/FieldOption;)V

    .line 29
    iput-object p1, p0, Lorg/msgpack/template/builder/BeansFieldEntry;->desc:Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    .line 30
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 62
    :try_start_0
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_e} :catch_10
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_e} :catch_17
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_e} :catch_1e

    move-result-object v1

    return-object v1

    .line 63
    :catch_10
    move-exception v0

    .line 64
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 65
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_17
    move-exception v0

    .line 66
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 67
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1e
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getGenericType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;

    move-result-object v0

    return-object v0
.end method

.method public getGetterName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 33
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lorg/msgpack/template/builder/BeansFieldEntry;->desc:Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    return-object v0
.end method

.method public getSetterName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 37
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

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
    .line 51
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 75
    :try_start_0
    invoke-virtual {p0}, Lorg/msgpack/template/builder/BeansFieldEntry;->getPropertyDescriptor()Lorg/msgpack/template/builder/beans/PropertyDescriptor;

    move-result-object v1

    invoke-virtual {v1}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_11} :catch_12
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_11} :catch_19
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_11} :catch_20

    .line 83
    return-void

    .line 76
    :catch_12
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 78
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_19
    move-exception v0

    .line 79
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 80
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_20
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Lorg/msgpack/MessageTypeException;

    invoke-direct {v1, v0}, Lorg/msgpack/MessageTypeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
