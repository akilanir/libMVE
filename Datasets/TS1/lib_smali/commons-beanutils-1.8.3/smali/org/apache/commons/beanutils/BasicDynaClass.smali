.class public Lorg/apache/commons/beanutils/BasicDynaClass;
.super Ljava/lang/Object;
.source "BasicDynaClass.java"

# interfaces
.implements Lorg/apache/commons/beanutils/DynaClass;
.implements Ljava/io/Serializable;


# static fields
.field static class$org$apache$commons$beanutils$BasicDynaBean:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

.field static class$org$apache$commons$beanutils$DynaClass:Ljava/lang/Class;

.field protected static constructorTypes:[Ljava/lang/Class;


# instance fields
.field protected transient constructor:Ljava/lang/reflect/Constructor;

.field protected constructorValues:[Ljava/lang/Object;

.field protected dynaBeanClass:Ljava/lang/Class;

.field protected name:Ljava/lang/String;

.field protected properties:[Lorg/apache/commons/beanutils/DynaProperty;

.field protected propertiesMap:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 108
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    const/4 v2, 0x0

    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$DynaClass:Ljava/lang/Class;

    if-nez v0, :cond_15

    const-string v0, "org.apache.commons.beanutils.DynaClass"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$DynaClass:Ljava/lang/Class;

    :goto_10
    aput-object v0, v1, v2

    sput-object v1, Lorg/apache/commons/beanutils/BasicDynaClass;->constructorTypes:[Ljava/lang/Class;

    return-void

    :cond_15
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$DynaClass:Ljava/lang/Class;

    goto :goto_10
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0, v0, v0, v0}, Lorg/apache/commons/beanutils/BasicDynaClass;-><init>(Ljava/lang/String;Ljava/lang/Class;[Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "dynaBeanClass"    # Ljava/lang/Class;

    .prologue
    .line 64
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/commons/beanutils/BasicDynaClass;-><init>(Ljava/lang/String;Ljava/lang/Class;[Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Class;[Lorg/apache/commons/beanutils/DynaProperty;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "dynaBeanClass"    # Ljava/lang/Class;
    .param p3, "properties"    # [Lorg/apache/commons/beanutils/DynaProperty;

    .prologue
    const/4 v1, 0x0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->constructor:Ljava/lang/reflect/Constructor;

    .line 115
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v1

    iput-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->constructorValues:[Ljava/lang/Object;

    .line 122
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$BasicDynaBean:Ljava/lang/Class;

    if-nez v0, :cond_4c

    const-string v0, "org.apache.commons.beanutils.BasicDynaBean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$BasicDynaBean:Ljava/lang/Class;

    :goto_1a
    iput-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->dynaBeanClass:Ljava/lang/Class;

    .line 128
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->name:Ljava/lang/String;

    .line 134
    new-array v0, v1, [Lorg/apache/commons/beanutils/DynaProperty;

    iput-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    .line 142
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->propertiesMap:Ljava/util/HashMap;

    .line 80
    if-eqz p1, :cond_35

    .line 81
    iput-object p1, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->name:Ljava/lang/String;

    .line 83
    :cond_35
    if-nez p2, :cond_43

    .line 84
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$BasicDynaBean:Ljava/lang/Class;

    if-nez v0, :cond_4f

    const-string v0, "org.apache.commons.beanutils.BasicDynaBean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p2

    .end local p2    # "dynaBeanClass":Ljava/lang/Class;
    sput-object p2, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$BasicDynaBean:Ljava/lang/Class;

    .line 86
    .restart local p2    # "dynaBeanClass":Ljava/lang/Class;
    :cond_43
    :goto_43
    invoke-virtual {p0, p2}, Lorg/apache/commons/beanutils/BasicDynaClass;->setDynaBeanClass(Ljava/lang/Class;)V

    .line 87
    if-eqz p3, :cond_4b

    .line 88
    invoke-virtual {p0, p3}, Lorg/apache/commons/beanutils/BasicDynaClass;->setProperties([Lorg/apache/commons/beanutils/DynaProperty;)V

    .line 91
    :cond_4b
    return-void

    .line 122
    :cond_4c
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$BasicDynaBean:Ljava/lang/Class;

    goto :goto_1a

    .line 84
    :cond_4f
    sget-object p2, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$BasicDynaBean:Ljava/lang/Class;

    goto :goto_43
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 84
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getDynaBeanClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 243
    iget-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->dynaBeanClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getDynaProperties()[Lorg/apache/commons/beanutils/DynaProperty;
    .registers 2

    .prologue
    .line 197
    iget-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    return-object v0
.end method

.method public getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 175
    if-nez p1, :cond_a

    .line 176
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "No property name specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 179
    :cond_a
    iget-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->propertiesMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/beanutils/DynaProperty;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->name:Ljava/lang/String;

    return-object v0
.end method

.method public newInstance()Lorg/apache/commons/beanutils/DynaBean;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;,
            Ljava/lang/InstantiationException;
        }
    .end annotation

    .prologue
    .line 218
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->constructor:Ljava/lang/reflect/Constructor;

    if-nez v1, :cond_9

    .line 219
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->dynaBeanClass:Ljava/lang/Class;

    invoke-virtual {p0, v1}, Lorg/apache/commons/beanutils/BasicDynaClass;->setDynaBeanClass(Ljava/lang/Class;)V

    .line 222
    :cond_9
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->constructor:Ljava/lang/reflect/Constructor;

    iget-object v2, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->constructorValues:[Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/beanutils/DynaBean;
    :try_end_13
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_13} :catch_14

    return-object v1

    .line 223
    :catch_14
    move-exception v0

    .line 224
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/InstantiationException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/InstantiationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected setDynaBeanClass(Ljava/lang/Class;)V
    .registers 6
    .param p1, "dynaBeanClass"    # Ljava/lang/Class;

    .prologue
    .line 264
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 265
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " is an interface, not a class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 269
    :cond_29
    sget-object v1, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    if-nez v1, :cond_5e

    const-string v1, "org.apache.commons.beanutils.DynaBean"

    invoke-static {v1}, Lorg/apache/commons/beanutils/BasicDynaClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    :goto_35
    invoke-virtual {v1, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_61

    .line 270
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " does not implement DynaBean"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 269
    :cond_5e
    sget-object v1, Lorg/apache/commons/beanutils/BasicDynaClass;->class$org$apache$commons$beanutils$DynaBean:Ljava/lang/Class;

    goto :goto_35

    .line 277
    :cond_61
    :try_start_61
    sget-object v1, Lorg/apache/commons/beanutils/BasicDynaClass;->constructorTypes:[Ljava/lang/Class;

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->constructor:Ljava/lang/reflect/Constructor;
    :try_end_69
    .catch Ljava/lang/NoSuchMethodException; {:try_start_61 .. :try_end_69} :catch_6c

    .line 283
    iput-object p1, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->dynaBeanClass:Ljava/lang/Class;

    .line 285
    return-void

    .line 278
    :catch_6c
    move-exception v0

    .line 279
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " does not have an appropriate constructor"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected setProperties([Lorg/apache/commons/beanutils/DynaProperty;)V
    .registers 6
    .param p1, "properties"    # [Lorg/apache/commons/beanutils/DynaProperty;

    .prologue
    .line 295
    iput-object p1, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->properties:[Lorg/apache/commons/beanutils/DynaProperty;

    .line 296
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->propertiesMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 297
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v1, p1

    if-ge v0, v1, :cond_1b

    .line 298
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaClass;->propertiesMap:Ljava/util/HashMap;

    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/apache/commons/beanutils/DynaProperty;->getName()Ljava/lang/String;

    move-result-object v2

    aget-object v3, p1, v0

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 301
    :cond_1b
    return-void
.end method
