.class public abstract Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
.super Ljava/lang/Object;
.source "AbstractDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Selectable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Tagable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Selectable",
        "<TT;>;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Tagable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected mEnabled:Z

.field protected mIdentifier:I

.field public mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

.field protected mOnPostBindViewListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;

.field protected mSelectable:Z

.field protected mSelected:Z

.field protected mTag:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mIdentifier:I

    .line 44
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mEnabled:Z

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mSelected:Z

    .line 69
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mSelectable:Z

    .line 82
    iput-object v2, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 101
    iput-object v2, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mOnPostBindViewListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Integer;)Z
    .registers 4
    .param p1, "id"    # Ljava/lang/Integer;

    .prologue
    .line 152
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mIdentifier:I

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 157
    if-ne p0, p1, :cond_5

    .line 160
    :cond_4
    :goto_4
    return v1

    .line 158
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 159
    check-cast v0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;

    .line 160
    .local v0, "that":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<*>;"
    iget v3, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mIdentifier:I

    iget v4, v0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mIdentifier:I

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public generateView(Landroid/content/Context;)Landroid/view/View;
    .registers 8
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 134
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;

    move-result-object v1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->getLayoutRes()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;->factory(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 135
    .local v0, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 136
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    return-object v1
.end method

.method public generateView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 8
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 141
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;

    move-result-object v1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->getLayoutRes()I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;->factory(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 142
    .local v0, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 143
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    return-object v1
.end method

.method public abstract getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
.end method

.method public getIdentifier()I
    .registers 2

    .prologue
    .line 29
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mIdentifier:I

    return v0
.end method

.method public getOnDrawerItemClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;
    .registers 2

    .prologue
    .line 85
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    return-object v0
.end method

.method public getOnPostBindViewListener()Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;
    .registers 2

    .prologue
    .line 104
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mOnPostBindViewListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;

    return-object v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 41
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mTag:Ljava/lang/Object;

    return-object v0
.end method

.method public getViewHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 148
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->getLayoutRes()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;->factory(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 165
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mIdentifier:I

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 53
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mEnabled:Z

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 79
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mSelectable:Z

    return v0
.end method

.method public isSelected()Z
    .registers 2

    .prologue
    .line 66
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mSelected:Z

    return v0
.end method

.method public onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 125
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mOnPostBindViewListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;

    if-eqz v0, :cond_9

    .line 126
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mOnPostBindViewListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;

    invoke-interface {v0, p1, p2}, Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;->onBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 128
    :cond_9
    return-void
.end method

.method public withEnabled(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mEnabled:Z

    .line 48
    return-object p0
.end method

.method public withIdentifier(I)Ljava/lang/Object;
    .registers 2
    .param p1, "identifier"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 23
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mIdentifier:I

    .line 24
    return-object p0
.end method

.method public withOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)Ljava/lang/Object;
    .registers 2
    .param p1, "onDrawerItemClickListener"    # Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 97
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    .line 98
    return-object p0
.end method

.method public withPostOnBindViewListener(Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;)Ljava/lang/Object;
    .registers 2
    .param p1, "onPostBindViewListener"    # Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 114
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mOnPostBindViewListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnPostBindViewListener;

    .line 115
    return-object p0
.end method

.method public withSelectable(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "selectable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 73
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mSelectable:Z

    .line 74
    return-object p0
.end method

.method public withSetSelected(Z)Ljava/lang/Object;
    .registers 2
    .param p1, "selected"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mSelected:Z

    .line 61
    return-object p0
.end method

.method public withTag(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 35
    .local p0, "this":Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;, "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem<TT;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;->mTag:Ljava/lang/Object;

    .line 36
    return-object p0
.end method
