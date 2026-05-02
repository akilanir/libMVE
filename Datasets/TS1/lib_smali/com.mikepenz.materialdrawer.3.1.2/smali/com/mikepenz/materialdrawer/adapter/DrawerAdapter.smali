.class public Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;
.super Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
.source "DrawerAdapter.java"


# instance fields
.field private mAnimateDrawerItems:Z

.field private mDrawerAnimatedItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mDrawerItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation
.end field

.field private mInflater:Landroid/view/LayoutInflater;

.field private mTypeMapper:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 30
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;-><init>(Landroid/app/Activity;Z)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/util/ArrayList;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p2, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;Z)V

    .line 39
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/util/ArrayList;Z)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p3, "animateDrawerItems"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p2, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;-><init>()V

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mAnimateDrawerItems:Z

    .line 42
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mInflater:Landroid/view/LayoutInflater;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    .line 46
    iput-boolean p3, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mAnimateDrawerItems:Z

    .line 48
    invoke-virtual {p0, p2}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->setDrawerItems(Ljava/util/ArrayList;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Z)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "animateDrawerItems"    # Z

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;Z)V

    .line 35
    return-void
.end method


# virtual methods
.method public varargs add([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 5
    .param p1, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 53
    if-eqz p1, :cond_7

    .line 54
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-static {v1, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 57
    :cond_7
    if-eqz p1, :cond_1a

    .line 58
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    array-length v1, p1

    if-ge v0, v1, :cond_1a

    .line 59
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 58
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 63
    .end local v0    # "i":I
    :cond_1a
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mapTypes()V

    .line 64
    return-void
.end method

.method public areAllItemsEnabled()Z
    .registers 2

    .prologue
    .line 68
    const/4 v0, 0x0

    return v0
.end method

.method public getAnimatedItem(I)Ljava/lang/Boolean;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_15

    .line 88
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    .line 90
    :goto_14
    return-object v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public getCount()I
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_5
.end method

.method public getDrawerItems()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation

    .prologue
    .line 107
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 83
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_f

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 102
    int-to-long v0, p1

    return-wide v0
.end method

.method public getTypeMapper()Ljava/util/LinkedHashSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 126
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mTypeMapper:Ljava/util/LinkedHashSet;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 13
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v8, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    .line 143
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 145
    .local v2, "item":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mInflater:Landroid/view/LayoutInflater;

    invoke-interface {v2, v5, p2, p3}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 147
    .local v4, "view":Landroid/view/View;
    iget-boolean v5, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mAnimateDrawerItems:Z

    if-eqz v5, :cond_49

    .line 148
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->getAnimatedItem(I)Ljava/lang/Boolean;

    move-result-object v5

    if-eqz v5, :cond_23

    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->getAnimatedItem(I)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-nez v5, :cond_49

    .line 149
    :cond_23
    new-instance v1, Landroid/view/animation/AnimationSet;

    const/4 v5, 0x0

    invoke-direct {v1, v5}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 150
    .local v1, "animationSet":Landroid/view/animation/AnimationSet;
    const-wide/16 v5, 0x64

    invoke-virtual {v1, v5, v6}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 152
    new-instance v3, Landroid/view/animation/ScaleAnimation;

    invoke-direct {v3, v7, v7, v8, v7}, Landroid/view/animation/ScaleAnimation;-><init>(FFFF)V

    .line 153
    .local v3, "scaleAnimation":Landroid/view/animation/Animation;
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    invoke-direct {v0, v8, v7}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 155
    .local v0, "alphaAnimation":Landroid/view/animation/Animation;
    invoke-virtual {v1, v3}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 156
    invoke-virtual {v1, v0}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 158
    invoke-virtual {v4, v1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 159
    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {p0, p1, v5}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->setAnimatedItem(ILjava/lang/Boolean;)V

    .line 163
    .end local v0    # "alphaAnimation":Landroid/view/animation/Animation;
    .end local v1    # "animationSet":Landroid/view/animation/AnimationSet;
    .end local v3    # "scaleAnimation":Landroid/view/animation/Animation;
    :cond_49
    return-object v4
.end method

.method public isEnabled(I)Z
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 73
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_16

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public resetAnimation()V
    .registers 4

    .prologue
    .line 136
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_16

    .line 137
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 136
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 139
    :cond_16
    return-void
.end method

.method public setAnimatedItem(ILjava/lang/Boolean;)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "animated"    # Ljava/lang/Boolean;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_11

    .line 96
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 98
    :cond_11
    return-void
.end method

.method public setDrawerItems(Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 112
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    .line 114
    if-eqz p1, :cond_1d

    .line 115
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 116
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1d

    .line 117
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mDrawerAnimatedItems:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 121
    .end local v0    # "i":I
    :cond_1d
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mapTypes()V

    .line 122
    return-void
.end method

.method public setTypeMapper(Ljava/util/LinkedHashSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedHashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 131
    .local p1, "typeMapper":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/adapter/DrawerAdapter;->mTypeMapper:Ljava/util/LinkedHashSet;

    .line 132
    return-void
.end method
