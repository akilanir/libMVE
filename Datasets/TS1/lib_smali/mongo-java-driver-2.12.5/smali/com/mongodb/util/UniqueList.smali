.class public Lcom/mongodb/util/UniqueList;
.super Ljava/util/ArrayList;
.source "UniqueList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/ArrayList",
        "<TT;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    .local p0, "this":Lcom/mongodb/util/UniqueList;, "Lcom/mongodb/util/UniqueList<TT;>;"
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lcom/mongodb/util/UniqueList;, "Lcom/mongodb/util/UniqueList<TT;>;"
    .local p1, "t":Ljava/lang/Object;, "TT;"
    invoke-virtual {p0, p1}, Lcom/mongodb/util/UniqueList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 34
    const/4 v0, 0x0

    .line 35
    :goto_7
    return v0

    :cond_8
    invoke-super {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_7
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+TT;>;)Z"
        }
    .end annotation

    .prologue
    .line 39
    .local p0, "this":Lcom/mongodb/util/UniqueList;, "Lcom/mongodb/util/UniqueList<TT;>;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<+TT;>;"
    const/4 v0, 0x0

    .line 40
    .local v0, "added":Z
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 41
    .local v2, "t":Ljava/lang/Object;, "TT;"
    if-nez v0, :cond_17

    invoke-virtual {p0, v2}, Lcom/mongodb/util/UniqueList;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    :cond_17
    const/4 v0, 0x1

    :goto_18
    goto :goto_5

    :cond_19
    const/4 v0, 0x0

    goto :goto_18

    .line 42
    .end local v2    # "t":Ljava/lang/Object;, "TT;"
    :cond_1b
    return v0
.end method
