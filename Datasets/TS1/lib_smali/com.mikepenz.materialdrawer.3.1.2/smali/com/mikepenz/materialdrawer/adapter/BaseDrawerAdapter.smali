.class public abstract Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
.super Landroid/widget/BaseAdapter;
.source "BaseDrawerAdapter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public dataUpdated()V
    .registers 1

    .prologue
    .line 13
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapTypes()V

    .line 14
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyDataSetChanged()V

    .line 15
    return-void
.end method

.method public abstract getDrawerItems()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation
.end method

.method public getItemViewType(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 31
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v2

    if-eqz v2, :cond_43

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, p1, :cond_43

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getTypeMapper()Ljava/util/LinkedHashSet;

    move-result-object v2

    if-eqz v2, :cond_43

    .line 32
    const/4 v0, 0x0

    .line 33
    .local v0, "i":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getTypeMapper()Ljava/util/LinkedHashSet;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_43

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 34
    .local v1, "type":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_40

    .line 40
    .end local v0    # "i":I
    .end local v1    # "type":Ljava/lang/String;
    :goto_3f
    return v0

    .line 37
    .restart local v0    # "i":I
    .restart local v1    # "type":Ljava/lang/String;
    :cond_40
    add-int/lit8 v0, v0, 0x1

    .line 38
    goto :goto_1f

    .line 40
    .end local v0    # "i":I
    .end local v1    # "type":Ljava/lang/String;
    :cond_43
    const/4 v0, -0x1

    goto :goto_3f
.end method

.method public abstract getTypeMapper()Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public getViewTypeCount()I
    .registers 2

    .prologue
    .line 47
    const/16 v0, 0x32

    return v0
.end method

.method public mapTypes()V
    .registers 5

    .prologue
    .line 18
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getTypeMapper()Ljava/util/LinkedHashSet;

    move-result-object v1

    if-nez v1, :cond_e

    .line 19
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->setTypeMapper(Ljava/util/LinkedHashSet;)V

    .line 22
    :cond_e
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v1

    if-eqz v1, :cond_34

    .line 23
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_34

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 24
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getTypeMapper()Ljava/util/LinkedHashSet;

    move-result-object v2

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    .line 27
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_34
    return-void
.end method

.method public abstract resetAnimation()V
.end method

.method public abstract setDrawerItems(Ljava/util/ArrayList;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract setTypeMapper(Ljava/util/LinkedHashSet;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
