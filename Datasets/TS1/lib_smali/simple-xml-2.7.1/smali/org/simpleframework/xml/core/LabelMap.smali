.class Lorg/simpleframework/xml/core/LabelMap;
.super Ljava/util/LinkedHashMap;
.source "LabelMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap",
        "<",
        "Ljava/lang/String;",
        "Lorg/simpleframework/xml/core/Label;",
        ">;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/simpleframework/xml/core/Label;",
        ">;"
    }
.end annotation


# instance fields
.field private final policy:Lorg/simpleframework/xml/core/Policy;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/simpleframework/xml/core/LabelMap;-><init>(Lorg/simpleframework/xml/core/Policy;)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/simpleframework/xml/core/Policy;)V
    .registers 2
    .param p1, "policy"    # Lorg/simpleframework/xml/core/Policy;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/simpleframework/xml/core/LabelMap;->policy:Lorg/simpleframework/xml/core/Policy;

    .line 60
    return-void
.end method

.method private getArray(Ljava/util/Set;)[Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 162
    .local p1, "list":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getKeys()[Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 99
    .local v2, "list":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/LabelMap;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/Label;

    .line 100
    .local v1, "label":Lorg/simpleframework/xml/core/Label;
    if-eqz v1, :cond_9

    .line 101
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 102
    .local v4, "path":Ljava/lang/String;
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getName()Ljava/lang/String;

    move-result-object v3

    .line 104
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 105
    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 108
    .end local v1    # "label":Lorg/simpleframework/xml/core/Label;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "path":Ljava/lang/String;
    :cond_26
    invoke-direct {p0, v2}, Lorg/simpleframework/xml/core/LabelMap;->getArray(Ljava/util/Set;)[Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public getLabel(Ljava/lang/String;)Lorg/simpleframework/xml/core/Label;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 85
    invoke-virtual {p0, p1}, Lorg/simpleframework/xml/core/LabelMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/simpleframework/xml/core/Label;

    return-object v0
.end method

.method public getLabels()Lorg/simpleframework/xml/core/LabelMap;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 140
    new-instance v2, Lorg/simpleframework/xml/core/LabelMap;

    iget-object v4, p0, Lorg/simpleframework/xml/core/LabelMap;->policy:Lorg/simpleframework/xml/core/Policy;

    invoke-direct {v2, v4}, Lorg/simpleframework/xml/core/LabelMap;-><init>(Lorg/simpleframework/xml/core/Policy;)V

    .line 142
    .local v2, "map":Lorg/simpleframework/xml/core/LabelMap;
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/LabelMap;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_b
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/Label;

    .line 143
    .local v1, "label":Lorg/simpleframework/xml/core/Label;
    if-eqz v1, :cond_b

    .line 144
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 146
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v2, v3, v1}, Lorg/simpleframework/xml/core/LabelMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    .line 149
    .end local v1    # "label":Lorg/simpleframework/xml/core/Label;
    .end local v3    # "name":Ljava/lang/String;
    :cond_21
    return-object v2
.end method

.method public getPaths()[Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 121
    .local v2, "list":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/LabelMap;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/Label;

    .line 122
    .local v1, "label":Lorg/simpleframework/xml/core/Label;
    if-eqz v1, :cond_9

    .line 123
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Label;->getPath()Ljava/lang/String;

    move-result-object v3

    .line 125
    .local v3, "path":Ljava/lang/String;
    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 128
    .end local v1    # "label":Lorg/simpleframework/xml/core/Label;
    .end local v3    # "path":Ljava/lang/String;
    :cond_1f
    invoke-direct {p0, v2}, Lorg/simpleframework/xml/core/LabelMap;->getArray(Ljava/util/Set;)[Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public isStrict(Lorg/simpleframework/xml/core/Context;)Z
    .registers 3
    .param p1, "context"    # Lorg/simpleframework/xml/core/Context;

    .prologue
    .line 178
    iget-object v0, p0, Lorg/simpleframework/xml/core/LabelMap;->policy:Lorg/simpleframework/xml/core/Policy;

    if-nez v0, :cond_9

    .line 179
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Context;->isStrict()Z

    move-result v0

    .line 181
    :goto_8
    return v0

    :cond_9
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Context;->isStrict()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object v0, p0, Lorg/simpleframework/xml/core/LabelMap;->policy:Lorg/simpleframework/xml/core/Policy;

    invoke-interface {v0}, Lorg/simpleframework/xml/core/Policy;->isStrict()Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    goto :goto_8

    :cond_19
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/simpleframework/xml/core/Label;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/LabelMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
