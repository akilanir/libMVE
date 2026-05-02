.class public Lorg/apache/commons/beanutils/WrapDynaBean;
.super Ljava/lang/Object;
.source "WrapDynaBean.java"

# interfaces
.implements Lorg/apache/commons/beanutils/DynaBean;
.implements Ljava/io/Serializable;


# instance fields
.field protected transient dynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;

.field protected instance:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3
    .param p1, "instance"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->dynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;

    .line 82
    iput-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    .line 63
    iput-object p1, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    .line 64
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/WrapDynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/beanutils/WrapDynaClass;

    iput-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->dynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;

    .line 66
    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 102
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "WrapDynaBean does not support contains()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 119
    const/4 v3, 0x0

    .line 121
    .local v3, "value":Ljava/lang/Object;
    :try_start_1
    iget-object v4, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    invoke-static {v4, p1}, Lorg/apache/commons/beanutils/PropertyUtils;->getSimpleProperty(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_6} :catch_8
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_6} :catch_30

    move-result-object v3

    .line 132
    return-object v3

    .line 122
    :catch_8
    move-exception v1

    .line 123
    .local v1, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 124
    .local v0, "cause":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Error reading property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' nested exception - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 127
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v1    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :catch_30
    move-exception v2

    .line 128
    .local v2, "t":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Error reading property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\', exception - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public get(Ljava/lang/String;I)Ljava/lang/Object;
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 155
    const/4 v4, 0x0

    .line 157
    .local v4, "value":Ljava/lang/Object;
    :try_start_1
    iget-object v5, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    invoke-static {v5, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtils;->getIndexedProperty(Ljava/lang/Object;Ljava/lang/String;I)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_6} :catch_8
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_6} :catch_a
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_6} :catch_32

    move-result-object v4

    .line 170
    return-object v4

    .line 158
    :catch_8
    move-exception v1

    .line 159
    .local v1, "e":Ljava/lang/IndexOutOfBoundsException;
    throw v1

    .line 160
    .end local v1    # "e":Ljava/lang/IndexOutOfBoundsException;
    :catch_a
    move-exception v2

    .line 161
    .local v2, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 162
    .local v0, "cause":Ljava/lang/Throwable;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Error reading indexed property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\' nested exception - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 165
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v2    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :catch_32
    move-exception v3

    .line 166
    .local v3, "t":Ljava/lang/Throwable;
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Error reading indexed property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\', exception - "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 190
    const/4 v3, 0x0

    .line 192
    .local v3, "value":Ljava/lang/Object;
    :try_start_1
    iget-object v4, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    invoke-static {v4, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtils;->getMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    :try_end_6
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_6} :catch_8
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_6} :catch_30

    move-result-object v3

    .line 203
    return-object v3

    .line 193
    :catch_8
    move-exception v1

    .line 194
    .local v1, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 195
    .local v0, "cause":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Error reading mapped property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' nested exception - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 198
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v1    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :catch_30
    move-exception v2

    .line 199
    .local v2, "t":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Error reading mapped property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\', exception - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public getDynaClass()Lorg/apache/commons/beanutils/DynaClass;
    .registers 2

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->dynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;

    if-nez v0, :cond_10

    .line 216
    iget-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/beanutils/WrapDynaClass;->createDynaClass(Ljava/lang/Class;)Lorg/apache/commons/beanutils/WrapDynaClass;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->dynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;

    .line 219
    :cond_10
    iget-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->dynaClass:Lorg/apache/commons/beanutils/WrapDynaClass;

    return-object v0
.end method

.method protected getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 371
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/WrapDynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 372
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_29

    .line 373
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Invalid property name \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 376
    :cond_29
    return-object v0
.end method

.method public getInstance()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 353
    iget-object v0, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    return-object v0
.end method

.method public remove(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 238
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "WrapDynaBean does not support remove()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set(Ljava/lang/String;ILjava/lang/Object;)V
    .registers 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 294
    :try_start_0
    iget-object v4, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    invoke-static {v4, p1, p2, p3}, Lorg/apache/commons/beanutils/PropertyUtils;->setIndexedProperty(Ljava/lang/Object;Ljava/lang/String;ILjava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_5} :catch_6
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_5} :catch_8
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_5} :catch_30

    .line 308
    return-void

    .line 295
    :catch_6
    move-exception v1

    .line 296
    .local v1, "e":Ljava/lang/IndexOutOfBoundsException;
    throw v1

    .line 297
    .end local v1    # "e":Ljava/lang/IndexOutOfBoundsException;
    :catch_8
    move-exception v2

    .line 298
    .local v2, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 299
    .local v0, "cause":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Error setting indexed property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' nested exception - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 302
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v2    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :catch_30
    move-exception v3

    .line 303
    .local v3, "t":Ljava/lang/Throwable;
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Error setting indexed property \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\', exception - "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 260
    :try_start_0
    iget-object v3, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    invoke-static {v3, p1, p2}, Lorg/apache/commons/beanutils/PropertyUtils;->setSimpleProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_5} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_5} :catch_2e

    .line 272
    return-void

    .line 261
    :catch_6
    move-exception v1

    .line 262
    .local v1, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 263
    .local v0, "cause":Ljava/lang/Throwable;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Error setting property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' nested exception -"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 266
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v1    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :catch_2e
    move-exception v2

    .line 267
    .local v2, "t":Ljava/lang/Throwable;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Error setting property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\', exception - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 328
    :try_start_0
    iget-object v3, p0, Lorg/apache/commons/beanutils/WrapDynaBean;->instance:Ljava/lang/Object;

    invoke-static {v3, p1, p2, p3}, Lorg/apache/commons/beanutils/PropertyUtils;->setMappedProperty(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_5
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_5} :catch_6
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_5} :catch_2e

    .line 340
    return-void

    .line 329
    :catch_6
    move-exception v1

    .line 330
    .local v1, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v0

    .line 331
    .local v0, "cause":Ljava/lang/Throwable;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Error setting mapped property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\' nested exception - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 334
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v1    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :catch_2e
    move-exception v2

    .line 335
    .local v2, "t":Ljava/lang/Throwable;
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Error setting mapped property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "\', exception - "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
