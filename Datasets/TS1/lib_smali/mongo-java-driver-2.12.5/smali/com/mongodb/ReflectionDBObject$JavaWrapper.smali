.class public Lcom/mongodb/ReflectionDBObject$JavaWrapper;
.super Ljava/lang/Object;
.source "ReflectionDBObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/ReflectionDBObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "JavaWrapper"
.end annotation


# instance fields
.field final _class:Ljava/lang/Class;

.field final _fields:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/mongodb/ReflectionDBObject$FieldInfo;",
            ">;"
        }
    .end annotation
.end field

.field final _keys:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final _name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/Class;)V
    .registers 12
    .param p1, "c"    # Ljava/lang/Class;

    .prologue
    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    iput-object p1, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_class:Ljava/lang/Class;

    .line 138
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_name:Ljava/lang/String;

    .line 140
    new-instance v8, Ljava/util/TreeMap;

    invoke-direct {v8}, Ljava/util/TreeMap;-><init>()V

    iput-object v8, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    .line 141
    invoke-virtual {p1}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_18
    if-ge v2, v3, :cond_8e

    aget-object v4, v0, v2

    .line 142
    .local v4, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "get"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_37

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "set"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_37

    .line 141
    :cond_34
    :goto_34
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 145
    :cond_37
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 146
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_34

    # getter for: Lcom/mongodb/ReflectionDBObject;->IGNORE_FIELDS:Ljava/util/Set;
    invoke-static {}, Lcom/mongodb/ReflectionDBObject;->access$000()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_34

    .line 149
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "get"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_83

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v7

    .line 151
    .local v7, "type":Ljava/lang/Class;
    :goto_60
    iget-object v8, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    invoke-interface {v8, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;

    .line 152
    .local v1, "fi":Lcom/mongodb/ReflectionDBObject$FieldInfo;
    if-nez v1, :cond_74

    .line 153
    new-instance v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;

    .end local v1    # "fi":Lcom/mongodb/ReflectionDBObject$FieldInfo;
    invoke-direct {v1, v5, v7}, Lcom/mongodb/ReflectionDBObject$FieldInfo;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 154
    .restart local v1    # "fi":Lcom/mongodb/ReflectionDBObject$FieldInfo;
    iget-object v8, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    invoke-interface {v8, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    :cond_74
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    const-string v9, "get"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8b

    .line 158
    iput-object v4, v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_getter:Ljava/lang/reflect/Method;

    goto :goto_34

    .line 149
    .end local v1    # "fi":Lcom/mongodb/ReflectionDBObject$FieldInfo;
    .end local v7    # "type":Ljava/lang/Class;
    :cond_83
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v8

    const/4 v9, 0x0

    aget-object v7, v8, v9

    goto :goto_60

    .line 160
    .restart local v1    # "fi":Lcom/mongodb/ReflectionDBObject$FieldInfo;
    .restart local v7    # "type":Ljava/lang/Class;
    :cond_8b
    iput-object v4, v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_setter:Ljava/lang/reflect/Method;

    goto :goto_34

    .line 163
    .end local v1    # "fi":Lcom/mongodb/ReflectionDBObject$FieldInfo;
    .end local v4    # "m":Ljava/lang/reflect/Method;
    .end local v5    # "name":Ljava/lang/String;
    .end local v7    # "type":Ljava/lang/Class;
    :cond_8e
    new-instance v6, Ljava/util/HashSet;

    iget-object v8, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 164
    .local v6, "names":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_9d
    :goto_9d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_bd

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 165
    .restart local v5    # "name":Ljava/lang/String;
    iget-object v8, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    invoke-interface {v8, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/mongodb/ReflectionDBObject$FieldInfo;

    invoke-virtual {v8}, Lcom/mongodb/ReflectionDBObject$FieldInfo;->ok()Z

    move-result v8

    if-nez v8, :cond_9d

    .line 166
    iget-object v8, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    invoke-interface {v8, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9d

    .line 168
    .end local v5    # "name":Ljava/lang/String;
    :cond_bd
    iget-object v8, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v8

    iput-object v8, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_keys:Ljava/util/Set;

    .line 169
    return-void
.end method


# virtual methods
.method public containsKey(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 180
    iget-object v0, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_keys:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Lcom/mongodb/ReflectionDBObject;Ljava/lang/String;)Ljava/lang/Object;
    .registers 8
    .param p1, "t"    # Lcom/mongodb/ReflectionDBObject;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 184
    iget-object v2, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;

    .line 185
    .local v1, "i":Lcom/mongodb/ReflectionDBObject$FieldInfo;
    if-nez v1, :cond_c

    .line 186
    const/4 v2, 0x0

    .line 188
    :goto_b
    return-object v2

    :cond_c
    :try_start_c
    iget-object v2, v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_getter:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_14} :catch_16

    move-result-object v2

    goto :goto_b

    .line 190
    :catch_16
    move-exception v0

    .line 191
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "could not invoke getter for ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] on ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method getInternalClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 9
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 208
    move-object v0, p1

    .line 209
    .local v0, "cur":Ljava/lang/String;
    const/4 v3, 0x0

    .line 210
    .local v3, "next":Ljava/lang/String;
    const-string v6, "."

    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 211
    .local v2, "idx":I
    if-ltz v2, :cond_16

    .line 212
    const/4 v6, 0x0

    invoke-virtual {p1, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 213
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 216
    :cond_16
    iget-object v6, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;

    .line 217
    .local v1, "fi":Lcom/mongodb/ReflectionDBObject$FieldInfo;
    if-nez v1, :cond_21

    .line 226
    :cond_20
    :goto_20
    return-object v5

    .line 220
    :cond_21
    if-nez v3, :cond_26

    .line 221
    iget-object v5, v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_class:Ljava/lang/Class;

    goto :goto_20

    .line 223
    :cond_26
    iget-object v6, v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_class:Ljava/lang/Class;

    invoke-static {v6}, Lcom/mongodb/ReflectionDBObject;->getWrapperIfReflectionObject(Ljava/lang/Class;)Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    move-result-object v4

    .line 224
    .local v4, "w":Lcom/mongodb/ReflectionDBObject$JavaWrapper;
    if-eqz v4, :cond_20

    .line 226
    invoke-virtual {v4, v3}, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->getInternalClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    goto :goto_20
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 172
    iget-object v0, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_keys:Ljava/util/Set;

    return-object v0
.end method

.method public set(Lcom/mongodb/ReflectionDBObject;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9
    .param p1, "t"    # Lcom/mongodb/ReflectionDBObject;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "val"    # Ljava/lang/Object;

    .prologue
    .line 196
    iget-object v2, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_fields:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;

    .line 197
    .local v1, "i":Lcom/mongodb/ReflectionDBObject$FieldInfo;
    if-nez v1, :cond_35

    .line 198
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "no field ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] on ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 200
    :cond_35
    :try_start_35
    iget-object v2, v1, Lcom/mongodb/ReflectionDBObject$FieldInfo;->_setter:Ljava/lang/reflect/Method;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p3, v3, v4

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_40} :catch_42

    move-result-object v2

    return-object v2

    .line 202
    :catch_42
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "could not invoke setter for ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] on ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->_name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
