.class final Lorg/apache/commons/beanutils/WrapDynaClass$2;
.super Ljava/util/HashMap;
.source "WrapDynaClass.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 175
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 177
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 178
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 180
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 183
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 186
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 189
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 192
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 195
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 198
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2

    .prologue
    .line 201
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 204
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .registers 3
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 207
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 208
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 210
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 213
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public values()Ljava/util/Collection;
    .registers 2

    .prologue
    .line 216
    invoke-static {}, Lorg/apache/commons/beanutils/WrapDynaClass;->access$000()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
