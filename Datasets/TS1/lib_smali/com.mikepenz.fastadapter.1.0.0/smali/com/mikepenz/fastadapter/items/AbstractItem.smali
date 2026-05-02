.class public abstract Lcom/mikepenz/fastadapter/items/AbstractItem;
.super Ljava/lang/Object;
.source "AbstractItem.java"

# interfaces
.implements Lcom/mikepenz/fastadapter/IItem;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item:",
        "Lcom/mikepenz/fastadapter/items/AbstractItem",
        "<**>;VH:",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/mikepenz/fastadapter/IItem",
        "<TItem;TVH;>;"
    }
.end annotation


# instance fields
.field protected mEnabled:Z

.field protected mFactory:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory",
            "<+TVH;>;"
        }
    .end annotation
.end field

.field protected mIdentifier:J

.field protected mSelectable:Z

.field protected mSelected:Z

.field protected mTag:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    const/4 v2, 0x1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mIdentifier:J

    .line 66
    iput-boolean v2, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mEnabled:Z

    .line 88
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mSelected:Z

    .line 111
    iput-boolean v2, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mSelectable:Z

    .line 273
    return-void
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 4
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;)V"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    .local p1, "holder":Landroid/support/v7/widget/RecyclerView$ViewHolder;, "TVH;"
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/items/AbstractItem;->isSelected()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 139
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 140
    return-void
.end method

.method public equals(I)Z
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 246
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    int-to-long v0, p1

    iget-wide v2, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mIdentifier:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 9
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 257
    if-ne p0, p1, :cond_5

    .line 260
    :cond_4
    :goto_4
    return v1

    .line 258
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

    .line 259
    check-cast v0, Lcom/mikepenz/fastadapter/items/AbstractItem;

    .line 260
    .local v0, "that":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<**>;"
    iget-wide v3, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mIdentifier:J

    iget-wide v5, v0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mIdentifier:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public generateView(Landroid/content/Context;)Landroid/view/View;
    .registers 7
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 150
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/items/AbstractItem;->getLayoutRes()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mikepenz/fastadapter/items/AbstractItem;->getViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 153
    .local v0, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/items/AbstractItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 156
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    return-object v1
.end method

.method public generateView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 168
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/items/AbstractItem;->getLayoutRes()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mikepenz/fastadapter/items/AbstractItem;->getViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 171
    .local v0, "viewHolder":Landroid/support/v7/widget/RecyclerView$ViewHolder;, "TVH;"
    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/items/AbstractItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 173
    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    return-object v1
.end method

.method public getFactory()Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory",
            "<+TVH;>;"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iget-object v1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mFactory:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;

    if-nez v1, :cond_f

    .line 209
    :try_start_4
    new-instance v1, Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory;

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/items/AbstractItem;->viewHolderType()Ljava/lang/Class;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/mikepenz/fastadapter/items/AbstractItem$ReflectionBasedViewHolderFactory;-><init>(Ljava/lang/Class;)V

    iput-object v1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mFactory:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_f} :catch_12

    .line 215
    :cond_f
    iget-object v1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mFactory:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;

    return-object v1

    .line 210
    :catch_12
    move-exception v0

    .line 211
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "please set a ViewHolderFactory"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getIdentifier()J
    .registers 3

    .prologue
    .line 40
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iget-wide v0, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mIdentifier:J

    return-wide v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 62
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iget-object v0, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mTag:Ljava/lang/Object;

    return-object v0
.end method

.method public getViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 3
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")TVH;"
        }
    .end annotation

    .prologue
    .line 235
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/items/AbstractItem;->getFactory()Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;->create(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public getViewHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 5
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            ")TVH;"
        }
    .end annotation

    .prologue
    .line 184
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mikepenz/fastadapter/items/AbstractItem;->getLayoutRes()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/fastadapter/items/AbstractItem;->getViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 270
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iget-wide v0, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mIdentifier:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 84
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mEnabled:Z

    return v0
.end method

.method public isSelectable()Z
    .registers 2

    .prologue
    .line 130
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mSelectable:Z

    return v0
.end method

.method public isSelected()Z
    .registers 2

    .prologue
    .line 107
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iget-boolean v0, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mSelected:Z

    return v0
.end method

.method protected viewHolderType()Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+TVH;>;"
        }
    .end annotation

    .prologue
    .line 224
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    check-cast v0, Ljava/lang/Class;

    return-object v0
.end method

.method public withEnabled(Z)Lcom/mikepenz/fastadapter/items/AbstractItem;
    .registers 2
    .param p1, "enabled"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TItem;"
        }
    .end annotation

    .prologue
    .line 75
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mEnabled:Z

    .line 76
    return-object p0
.end method

.method public bridge synthetic withEnabled(Z)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/items/AbstractItem;->withEnabled(Z)Lcom/mikepenz/fastadapter/items/AbstractItem;

    move-result-object v0

    return-object v0
.end method

.method public withFactory(Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;)Lcom/mikepenz/fastadapter/items/AbstractItem;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory",
            "<+TVH;>;)TItem;"
        }
    .end annotation

    .prologue
    .line 196
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    .local p1, "factory":Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;, "Lcom/mikepenz/fastadapter/utils/ViewHolderFactory<+TVH;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mFactory:Lcom/mikepenz/fastadapter/utils/ViewHolderFactory;

    .line 197
    return-object p0
.end method

.method public withIdentifier(J)Lcom/mikepenz/fastadapter/items/AbstractItem;
    .registers 3
    .param p1, "identifier"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TItem;"
        }
    .end annotation

    .prologue
    .line 31
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iput-wide p1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mIdentifier:J

    .line 32
    return-object p0
.end method

.method public bridge synthetic withIdentifier(J)Ljava/lang/Object;
    .registers 4

    .prologue
    .line 20
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/fastadapter/items/AbstractItem;->withIdentifier(J)Lcom/mikepenz/fastadapter/items/AbstractItem;

    move-result-object v0

    return-object v0
.end method

.method public withSelectable(Z)Lcom/mikepenz/fastadapter/items/AbstractItem;
    .registers 2
    .param p1, "selectable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TItem;"
        }
    .end annotation

    .prologue
    .line 121
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mSelectable:Z

    .line 122
    return-object p0
.end method

.method public bridge synthetic withSelectable(Z)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/items/AbstractItem;->withSelectable(Z)Lcom/mikepenz/fastadapter/items/AbstractItem;

    move-result-object v0

    return-object v0
.end method

.method public withSetSelected(Z)Lcom/mikepenz/fastadapter/items/AbstractItem;
    .registers 2
    .param p1, "selected"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TItem;"
        }
    .end annotation

    .prologue
    .line 98
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iput-boolean p1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mSelected:Z

    .line 99
    return-object p0
.end method

.method public bridge synthetic withSetSelected(Z)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/items/AbstractItem;->withSetSelected(Z)Lcom/mikepenz/fastadapter/items/AbstractItem;

    move-result-object v0

    return-object v0
.end method

.method public withTag(Ljava/lang/Object;)Lcom/mikepenz/fastadapter/items/AbstractItem;
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TItem;"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    iput-object p1, p0, Lcom/mikepenz/fastadapter/items/AbstractItem;->mTag:Ljava/lang/Object;

    .line 54
    return-object p0
.end method

.method public bridge synthetic withTag(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    .local p0, "this":Lcom/mikepenz/fastadapter/items/AbstractItem;, "Lcom/mikepenz/fastadapter/items/AbstractItem<TItem;TVH;>;"
    invoke-virtual {p0, p1}, Lcom/mikepenz/fastadapter/items/AbstractItem;->withTag(Ljava/lang/Object;)Lcom/mikepenz/fastadapter/items/AbstractItem;

    move-result-object v0

    return-object v0
.end method
