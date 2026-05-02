.class public Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;
.super Lorg/msgpack/template/builder/beans/PropertyDescriptor;
.source "IndexedPropertyDescriptor.java"


# instance fields
.field private indexedGetter:Ljava/lang/reflect/Method;

.field private indexedPropertyType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private indexedSetter:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 6
    .param p1, "propertyName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 144
    .local p2, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 145
    const-string v0, "get"

    invoke-static {p1}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->initialUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "set"

    invoke-static {p1}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->initialUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p2, v0, v1}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->setIndexedByName(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p3, "getterName"    # Ljava/lang/String;
    .param p4, "setterName"    # Ljava/lang/String;
    .param p5, "indexedGetterName"    # Ljava/lang/String;
    .param p6, "indexedSetterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 53
    .local p2, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    invoke-direct {p0, p2, p5, p6}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->setIndexedByName(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    .registers 8
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "getter"    # Ljava/lang/reflect/Method;
    .param p3, "setter"    # Ljava/lang/reflect/Method;
    .param p4, "indexedGetter"    # Ljava/lang/reflect/Method;
    .param p5, "indexedSetter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    .line 118
    invoke-direct {p0, p1, p2, p3}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V

    .line 119
    if-eqz p4, :cond_1e

    .line 120
    invoke-direct {p0, p4}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->internalSetIndexedReadMethod(Ljava/lang/reflect/Method;)V

    .line 121
    invoke-direct {p0, p5, v0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->internalSetIndexedWriteMethod(Ljava/lang/reflect/Method;Z)V

    .line 127
    :goto_c
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->isCompatible()Z

    move-result v0

    if-nez v0, :cond_25

    .line 129
    new-instance v0, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v1, "custom.beans.57"

    invoke-static {v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_1e
    invoke-direct {p0, p5, v0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->internalSetIndexedWriteMethod(Ljava/lang/reflect/Method;Z)V

    .line 124
    invoke-direct {p0, p4}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->internalSetIndexedReadMethod(Ljava/lang/reflect/Method;)V

    goto :goto_c

    .line 131
    :cond_25
    return-void
.end method

.method private static initialUpperCase(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "string"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 376
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isUpperCase(C)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 381
    .end local p0    # "string":Ljava/lang/String;
    :goto_c
    return-object p0

    .line 380
    .restart local p0    # "string":Ljava/lang/String;
    :cond_d
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    .line 381
    .local v0, "initial":Ljava/lang/String;
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_c
.end method

.method private internalSetIndexedReadMethod(Ljava/lang/reflect/Method;)V
    .registers 6
    .param p1, "indexGetter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 256
    if-nez p1, :cond_1f

    .line 257
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    if-nez v1, :cond_1c

    .line 258
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v1

    if-eqz v1, :cond_1a

    .line 260
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.5A"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 263
    :cond_1a
    iput-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    .line 265
    :cond_1c
    iput-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    .line 298
    :goto_1e
    return-void

    .line 269
    :cond_1f
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    array-length v1, v1

    if-ne v1, v3, :cond_31

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v1, v2, :cond_3d

    .line 272
    :cond_31
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.5B"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 274
    :cond_3d
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    .line 275
    .local v0, "indexedReadType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_51

    .line 277
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.5B"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 278
    :cond_51
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_6f

    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    aget-object v2, v2, v3

    if-eq v1, v2, :cond_6f

    .line 282
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.5A"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 287
    :cond_6f
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    if-nez v1, :cond_78

    .line 288
    iput-object v0, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    .line 297
    :cond_75
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    goto :goto_1e

    .line 290
    :cond_78
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    if-eq v1, v0, :cond_75

    .line 292
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.5A"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private internalSetIndexedWriteMethod(Ljava/lang/reflect/Method;Z)V
    .registers 7
    .param p1, "indexSetter"    # Ljava/lang/reflect/Method;
    .param p2, "initialize"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 335
    if-nez p1, :cond_1e

    .line 336
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    if-nez v2, :cond_1b

    .line 337
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_19

    .line 339
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.5E"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 342
    :cond_19
    iput-object v3, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    .line 344
    :cond_1b
    iput-object v3, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    .line 373
    :goto_1d
    return-void

    .line 349
    :cond_1e
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 350
    .local v0, "indexedSetterArgs":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v2, v0

    const/4 v3, 0x2

    if-eq v2, v3, :cond_32

    .line 352
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.5F"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 354
    :cond_32
    const/4 v2, 0x0

    aget-object v2, v0, v2

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v2, v3, :cond_45

    .line 356
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.60"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 361
    :cond_45
    const/4 v2, 0x1

    aget-object v1, v0, v2

    .line 362
    .local v1, "indexedWriteType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p2, :cond_53

    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    if-nez v2, :cond_53

    .line 363
    iput-object v1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    .line 372
    :cond_50
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    goto :goto_1d

    .line 365
    :cond_53
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    if-eq v2, v1, :cond_50

    .line 367
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.61"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private isCompatible()Z
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 83
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v1

    .line 85
    .local v1, "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v1, :cond_9

    .line 86
    const/4 v2, 0x1

    .line 96
    :cond_8
    :goto_8
    return v2

    .line 88
    :cond_9
    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 89
    .local v0, "componentTypeOfProperty":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_8

    .line 92
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    if-eqz v3, :cond_8

    .line 96
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_8
.end method

.method private setIndexedByName(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p2, "indexedGetterName"    # Ljava/lang/String;
    .param p3, "indexedSetterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 60
    .local p1, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object v0, p2

    .line 61
    .local v0, "theIndexedGetterName":Ljava/lang/String;
    if-nez v0, :cond_1a

    .line 62
    if-eqz p3, :cond_8

    .line 63
    invoke-direct {p0, p1, p3}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->setIndexedWriteMethod(Ljava/lang/Class;Ljava/lang/String;)V

    .line 76
    :cond_8
    :goto_8
    invoke-direct {p0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->isCompatible()Z

    move-result v1

    if-nez v1, :cond_40

    .line 78
    new-instance v1, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v2, "custom.beans.57"

    invoke-static {v2}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 66
    :cond_1a
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_35

    .line 67
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "get"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 69
    :cond_35
    invoke-direct {p0, p1, v0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->setIndexedReadMethod(Ljava/lang/Class;Ljava/lang/String;)V

    .line 70
    if-eqz p3, :cond_8

    .line 71
    iget-object v1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    invoke-direct {p0, p1, p3, v1}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->setIndexedWriteMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V

    goto :goto_8

    .line 80
    :cond_40
    return-void
.end method

.method private setIndexedReadMethod(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 8
    .param p2, "indexedGetterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 241
    .local p1, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    :try_start_1
    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {p1, p2, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_b} :catch_10
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_b} :catch_1d

    move-result-object v1

    .line 250
    .local v1, "getter":Ljava/lang/reflect/Method;
    invoke-direct {p0, v1}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->internalSetIndexedReadMethod(Ljava/lang/reflect/Method;)V

    .line 251
    return-void

    .line 243
    .end local v1    # "getter":Ljava/lang/reflect/Method;
    :catch_10
    move-exception v0

    .line 245
    .local v0, "exception":Ljava/lang/NoSuchMethodException;
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.58"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 246
    .end local v0    # "exception":Ljava/lang/NoSuchMethodException;
    :catch_1d
    move-exception v0

    .line 248
    .local v0, "exception":Ljava/lang/SecurityException;
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.59"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private setIndexedWriteMethod(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 9
    .param p2, "indexedSetterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .local p1, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v5, 0x1

    .line 302
    const/4 v1, 0x0

    .line 304
    .local v1, "setter":Ljava/lang/reflect/Method;
    const/4 v2, 0x2

    :try_start_3
    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p1, p2, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_18
    .catch Ljava/lang/SecurityException; {:try_start_3 .. :try_end_18} :catch_1d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_18} :catch_2a

    move-result-object v1

    .line 313
    invoke-direct {p0, v1, v5}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->internalSetIndexedWriteMethod(Ljava/lang/reflect/Method;Z)V

    .line 314
    return-void

    .line 306
    :catch_1d
    move-exception v0

    .line 308
    .local v0, "e":Ljava/lang/SecurityException;
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.5C"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 309
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_2a
    move-exception v0

    .line 311
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.5D"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private setIndexedWriteMethod(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)V
    .registers 9
    .param p2, "indexedSetterName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 320
    .local p1, "beanClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "argType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x2

    :try_start_1
    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    invoke-virtual {p1, p2, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 322
    .local v1, "setter":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->internalSetIndexedWriteMethod(Ljava/lang/reflect/Method;Z)V
    :try_end_13
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_13} :catch_14
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_13} :catch_21

    .line 330
    return-void

    .line 323
    .end local v1    # "setter":Ljava/lang/reflect/Method;
    :catch_14
    move-exception v0

    .line 325
    .local v0, "exception":Ljava/lang/NoSuchMethodException;
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.5D"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 326
    .end local v0    # "exception":Ljava/lang/NoSuchMethodException;
    :catch_21
    move-exception v0

    .line 328
    .local v0, "exception":Ljava/lang/SecurityException;
    new-instance v2, Lorg/msgpack/template/builder/beans/IntrospectionException;

    const-string v3, "custom.beans.5C"

    invoke-static {v3}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/msgpack/template/builder/beans/IntrospectionException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 204
    instance-of v2, p1, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    if-nez v2, :cond_6

    .line 210
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 208
    check-cast v0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;

    .line 210
    .local v0, "other":Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;
    invoke-super {p0, v0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    if-nez v2, :cond_29

    iget-object v2, v0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    if-nez v2, :cond_5

    :goto_17
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    if-nez v2, :cond_34

    iget-object v2, v0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    if-nez v2, :cond_5

    :goto_1f
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    if-nez v2, :cond_3f

    iget-object v2, v0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    if-nez v2, :cond_5

    :goto_27
    const/4 v1, 0x1

    goto :goto_5

    :cond_29
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    iget-object v3, v0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_17

    :cond_34
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    iget-object v3, v0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_1f

    :cond_3f
    iget-object v2, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    iget-object v3, v0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    goto :goto_27
.end method

.method public getIndexedPropertyType()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 234
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    return-object v0
.end method

.method public getIndexedReadMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 189
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public getIndexedWriteMethod()Ljava/lang/reflect/Method;
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 223
    invoke-super {p0}, Lorg/msgpack/template/builder/beans/PropertyDescriptor;->hashCode()I

    move-result v0

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedPropertyType:Ljava/lang/Class;

    invoke-static {v1}, Lorg/apache/harmony/beans/BeansUtils;->getHashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedGetter:Ljava/lang/reflect/Method;

    invoke-static {v1}, Lorg/apache/harmony/beans/BeansUtils;->getHashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->indexedSetter:Ljava/lang/reflect/Method;

    invoke-static {v1}, Lorg/apache/harmony/beans/BeansUtils;->getHashCode(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public setIndexedReadMethod(Ljava/lang/reflect/Method;)V
    .registers 2
    .param p1, "indexedGetter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 159
    invoke-direct {p0, p1}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->internalSetIndexedReadMethod(Ljava/lang/reflect/Method;)V

    .line 160
    return-void
.end method

.method public setIndexedWriteMethod(Ljava/lang/reflect/Method;)V
    .registers 3
    .param p1, "indexedSetter"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/msgpack/template/builder/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 171
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/msgpack/template/builder/beans/IndexedPropertyDescriptor;->internalSetIndexedWriteMethod(Ljava/lang/reflect/Method;Z)V

    .line 172
    return-void
.end method
