.class public Lorg/apache/commons/beanutils/BasicDynaBean;
.super Ljava/lang/Object;
.source "BasicDynaBean.java"

# interfaces
.implements Lorg/apache/commons/beanutils/DynaBean;
.implements Ljava/io/Serializable;


# static fields
.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;


# instance fields
.field protected dynaClass:Lorg/apache/commons/beanutils/DynaClass;

.field private transient mapDecorator:Ljava/util/Map;

.field protected values:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lorg/apache/commons/beanutils/DynaClass;)V
    .registers 3
    .param p1, "dynaClass"    # Lorg/apache/commons/beanutils/DynaClass;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->dynaClass:Lorg/apache/commons/beanutils/DynaClass;

    .line 77
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->values:Ljava/util/HashMap;

    .line 59
    iput-object p1, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->dynaClass:Lorg/apache/commons/beanutils/DynaClass;

    .line 61
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 419
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
.method public contains(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 119
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->values:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 120
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_31

    .line 121
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No mapped value for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 123
    :cond_31
    instance-of v1, v0, Ljava/util/Map;

    if-eqz v1, :cond_3c

    .line 124
    check-cast v0, Ljava/util/Map;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    return v1

    .line 126
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_3c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-mapped property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 145
    iget-object v2, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->values:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 146
    .local v1, "value":Ljava/lang/Object;
    if-eqz v1, :cond_a

    .line 174
    .end local v1    # "value":Ljava/lang/Object;
    :cond_9
    :goto_9
    return-object v1

    .line 151
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_a
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/BasicDynaBean;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v0

    .line 152
    .local v0, "type":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 157
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v0, v2, :cond_1f

    .line 158
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_9

    .line 159
    :cond_1f
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne v0, v2, :cond_29

    .line 160
    new-instance v1, Ljava/lang/Byte;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-direct {v1, v3}, Ljava/lang/Byte;-><init>(B)V

    goto :goto_9

    .line 161
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_29
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne v0, v2, :cond_33

    .line 162
    new-instance v1, Ljava/lang/Character;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-direct {v1, v3}, Ljava/lang/Character;-><init>(C)V

    goto :goto_9

    .line 163
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_33
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v0, v2, :cond_3f

    .line 164
    new-instance v1, Ljava/lang/Double;

    .end local v1    # "value":Ljava/lang/Object;
    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Ljava/lang/Double;-><init>(D)V

    goto :goto_9

    .line 165
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_3f
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v0, v2, :cond_4a

    .line 166
    new-instance v1, Ljava/lang/Float;

    .end local v1    # "value":Ljava/lang/Object;
    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/lang/Float;-><init>(F)V

    goto :goto_9

    .line 167
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_4a
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v0, v2, :cond_54

    .line 168
    new-instance v1, Ljava/lang/Integer;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-direct {v1, v3}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_9

    .line 169
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_54
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v0, v2, :cond_60

    .line 170
    new-instance v1, Ljava/lang/Long;

    .end local v1    # "value":Ljava/lang/Object;
    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Ljava/lang/Long;-><init>(J)V

    goto :goto_9

    .line 171
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_60
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne v0, v2, :cond_6a

    .line 172
    new-instance v1, Ljava/lang/Short;

    .end local v1    # "value":Ljava/lang/Object;
    invoke-direct {v1, v3}, Ljava/lang/Short;-><init>(S)V

    goto :goto_9

    .line 174
    .restart local v1    # "value":Ljava/lang/Object;
    :cond_6a
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public get(Ljava/lang/String;I)Ljava/lang/Object;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I

    .prologue
    .line 198
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->values:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 199
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_31

    .line 200
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No indexed value for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 202
    :cond_31
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_40

    .line 203
    invoke-static {v0, p2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 205
    .end local v0    # "value":Ljava/lang/Object;
    :goto_3f
    return-object v1

    .line 204
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_40
    instance-of v1, v0, Ljava/util/List;

    if-eqz v1, :cond_4b

    .line 205
    check-cast v0, Ljava/util/List;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_3f

    .line 207
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_4b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-indexed property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 229
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->values:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 230
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_31

    .line 231
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No mapped value for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 233
    :cond_31
    instance-of v1, v0, Ljava/util/Map;

    if-eqz v1, :cond_3c

    .line 234
    check-cast v0, Ljava/util/Map;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 236
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_3c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-mapped property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getDynaClass()Lorg/apache/commons/beanutils/DynaClass;
    .registers 2

    .prologue
    .line 251
    iget-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->dynaClass:Lorg/apache/commons/beanutils/DynaClass;

    return-object v0
.end method

.method protected getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 398
    invoke-virtual {p0}, Lorg/apache/commons/beanutils/BasicDynaBean;->getDynaClass()Lorg/apache/commons/beanutils/DynaClass;

    move-result-object v1

    invoke-interface {v1, p1}, Lorg/apache/commons/beanutils/DynaClass;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 399
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez v0, :cond_29

    .line 400
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

    .line 403
    :cond_29
    return-object v0
.end method

.method public getMap()Ljava/util/Map;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->mapDecorator:Ljava/util/Map;

    if-nez v0, :cond_b

    .line 96
    new-instance v0, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;

    invoke-direct {v0, p0}, Lorg/apache/commons/beanutils/DynaBeanMapDecorator;-><init>(Lorg/apache/commons/beanutils/DynaBean;)V

    iput-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->mapDecorator:Ljava/util/Map;

    .line 98
    :cond_b
    iget-object v0, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->mapDecorator:Ljava/util/Map;

    return-object v0
.end method

.method protected isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 4
    .param p1, "dest"    # Ljava/lang/Class;
    .param p2, "source"    # Ljava/lang/Class;

    .prologue
    .line 418
    invoke-virtual {p1, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_96

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_18

    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v0, :cond_98

    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_16
    if-eq p2, v0, :cond_96

    :cond_18
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_2a

    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v0, :cond_9c

    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_28
    if-eq p2, v0, :cond_96

    :cond_2a
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_3c

    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v0, :cond_9f

    const-string v0, "java.lang.Character"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Character:Ljava/lang/Class;

    :goto_3a
    if-eq p2, v0, :cond_96

    :cond_3c
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_4e

    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v0, :cond_a2

    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Double:Ljava/lang/Class;

    :goto_4c
    if-eq p2, v0, :cond_96

    :cond_4e
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_60

    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v0, :cond_a5

    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Float:Ljava/lang/Class;

    :goto_5e
    if-eq p2, v0, :cond_96

    :cond_60
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_72

    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v0, :cond_a8

    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_70
    if-eq p2, v0, :cond_96

    :cond_72
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_84

    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v0, :cond_ab

    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Long:Ljava/lang/Class;

    :goto_82
    if-eq p2, v0, :cond_96

    :cond_84
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p1, v0, :cond_b1

    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v0, :cond_ae

    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lorg/apache/commons/beanutils/BasicDynaBean;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Short:Ljava/lang/Class;

    :goto_94
    if-ne p2, v0, :cond_b1

    .line 427
    :cond_96
    const/4 v0, 0x1

    .line 429
    :goto_97
    return v0

    .line 418
    :cond_98
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Boolean:Ljava/lang/Class;

    goto/16 :goto_16

    :cond_9c
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_28

    :cond_9f
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_3a

    :cond_a2
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_4c

    :cond_a5
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_5e

    :cond_a8
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_70

    :cond_ab
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_82

    :cond_ae
    sget-object v0, Lorg/apache/commons/beanutils/BasicDynaBean;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_94

    .line 429
    :cond_b1
    const/4 v0, 0x0

    goto :goto_97
.end method

.method public remove(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 269
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->values:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 270
    .local v0, "value":Ljava/lang/Object;
    if-nez v0, :cond_31

    .line 271
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No mapped value for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 273
    :cond_31
    instance-of v1, v0, Ljava/util/Map;

    if-eqz v1, :cond_3b

    .line 274
    check-cast v0, Ljava/util/Map;

    .end local v0    # "value":Ljava/lang/Object;
    invoke-interface {v0, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    return-void

    .line 276
    .restart local v0    # "value":Ljava/lang/Object;
    :cond_3b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-mapped property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public set(Ljava/lang/String;ILjava/lang/Object;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "index"    # I
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 334
    iget-object v2, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->values:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 335
    .local v1, "prop":Ljava/lang/Object;
    if-nez v1, :cond_31

    .line 336
    new-instance v2, Ljava/lang/NullPointerException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No indexed value for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 338
    :cond_31
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 339
    invoke-static {v1, p2, p3}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 351
    .end local v1    # "prop":Ljava/lang/Object;
    :goto_3e
    return-void

    .line 340
    .restart local v1    # "prop":Ljava/lang/Object;
    :cond_3f
    instance-of v2, v1, Ljava/util/List;

    if-eqz v2, :cond_54

    .line 342
    :try_start_43
    check-cast v1, Ljava/util/List;

    .end local v1    # "prop":Ljava/lang/Object;
    invoke-interface {v1, p2, p3}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_48
    .catch Ljava/lang/ClassCastException; {:try_start_43 .. :try_end_48} :catch_49

    goto :goto_3e

    .line 343
    :catch_49
    move-exception v0

    .line 344
    .local v0, "e":Ljava/lang/ClassCastException;
    new-instance v2, Lorg/apache/commons/beanutils/ConversionException;

    invoke-virtual {v0}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 347
    .end local v0    # "e":Ljava/lang/ClassCastException;
    .restart local v1    # "prop":Ljava/lang/Object;
    :cond_54
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Non-indexed property for \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 298
    invoke-virtual {p0, p1}, Lorg/apache/commons/beanutils/BasicDynaBean;->getDynaProperty(Ljava/lang/String;)Lorg/apache/commons/beanutils/DynaProperty;

    move-result-object v0

    .line 299
    .local v0, "descriptor":Lorg/apache/commons/beanutils/DynaProperty;
    if-nez p2, :cond_2f

    .line 300
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_80

    .line 301
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Primitive value for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 304
    :cond_2f
    invoke-virtual {v0}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lorg/apache/commons/beanutils/BasicDynaBean;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_80

    .line 305
    new-instance v1, Lorg/apache/commons/beanutils/ConversionException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Cannot assign value of type \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' to property \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\' of type \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/commons/beanutils/DynaProperty;->getType()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/beanutils/ConversionException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 311
    :cond_80
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->values:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 370
    iget-object v1, p0, Lorg/apache/commons/beanutils/BasicDynaBean;->values:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 371
    .local v0, "prop":Ljava/lang/Object;
    if-nez v0, :cond_31

    .line 372
    new-instance v1, Ljava/lang/NullPointerException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "No mapped value for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 374
    :cond_31
    instance-of v1, v0, Ljava/util/Map;

    if-eqz v1, :cond_3b

    .line 375
    check-cast v0, Ljava/util/Map;

    .end local v0    # "prop":Ljava/lang/Object;
    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 381
    return-void

    .line 377
    .restart local v0    # "prop":Ljava/lang/Object;
    :cond_3b
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Non-mapped property for \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ")\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
