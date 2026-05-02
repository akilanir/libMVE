.class Lorg/simpleframework/xml/core/ModelList;
.super Ljava/util/ArrayList;
.source "ModelList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList",
        "<",
        "Lorg/simpleframework/xml/core/Model;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 43
    return-void
.end method


# virtual methods
.method public build()Lorg/simpleframework/xml/core/ModelList;
    .registers 5

    .prologue
    .line 53
    new-instance v1, Lorg/simpleframework/xml/core/ModelList;

    invoke-direct {v1}, Lorg/simpleframework/xml/core/ModelList;-><init>()V

    .line 55
    .local v1, "list":Lorg/simpleframework/xml/core/ModelList;
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/ModelList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/simpleframework/xml/core/Model;

    .line 56
    .local v2, "model":Lorg/simpleframework/xml/core/Model;
    invoke-virtual {v1, v2}, Lorg/simpleframework/xml/core/ModelList;->register(Lorg/simpleframework/xml/core/Model;)V

    goto :goto_9

    .line 58
    .end local v2    # "model":Lorg/simpleframework/xml/core/Model;
    :cond_19
    return-object v1
.end method

.method public isEmpty()Z
    .registers 4

    .prologue
    .line 70
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/ModelList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/Model;

    .line 71
    .local v1, "model":Lorg/simpleframework/xml/core/Model;
    if-eqz v1, :cond_4

    .line 72
    invoke-interface {v1}, Lorg/simpleframework/xml/core/Model;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    .line 73
    const/4 v2, 0x0

    .line 77
    .end local v1    # "model":Lorg/simpleframework/xml/core/Model;
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x1

    goto :goto_19
.end method

.method public lookup(I)Lorg/simpleframework/xml/core/Model;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 90
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/ModelList;->size()I

    move-result v0

    .line 92
    .local v0, "size":I
    if-gt p1, v0, :cond_f

    .line 93
    add-int/lit8 v1, p1, -0x1

    invoke-virtual {p0, v1}, Lorg/simpleframework/xml/core/ModelList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/simpleframework/xml/core/Model;

    .line 95
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public register(Lorg/simpleframework/xml/core/Model;)V
    .registers 6
    .param p1, "model"    # Lorg/simpleframework/xml/core/Model;

    .prologue
    .line 108
    invoke-interface {p1}, Lorg/simpleframework/xml/core/Model;->getIndex()I

    move-result v1

    .line 109
    .local v1, "index":I
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/ModelList;->size()I

    move-result v2

    .line 111
    .local v2, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    if-ge v0, v1, :cond_1d

    .line 112
    if-lt v0, v2, :cond_11

    .line 113
    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lorg/simpleframework/xml/core/ModelList;->add(Ljava/lang/Object;)Z

    .line 115
    :cond_11
    add-int/lit8 v3, v1, -0x1

    if-ne v0, v3, :cond_1a

    .line 116
    add-int/lit8 v3, v1, -0x1

    invoke-virtual {p0, v3, p1}, Lorg/simpleframework/xml/core/ModelList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 111
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 119
    :cond_1d
    return-void
.end method

.method public take()Lorg/simpleframework/xml/core/Model;
    .registers 3

    .prologue
    .line 129
    :cond_0
    invoke-virtual {p0}, Lorg/simpleframework/xml/core/ModelList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_14

    .line 130
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lorg/simpleframework/xml/core/ModelList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/simpleframework/xml/core/Model;

    .line 132
    .local v0, "model":Lorg/simpleframework/xml/core/Model;
    invoke-interface {v0}, Lorg/simpleframework/xml/core/Model;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 136
    .end local v0    # "model":Lorg/simpleframework/xml/core/Model;
    :goto_13
    return-object v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method
