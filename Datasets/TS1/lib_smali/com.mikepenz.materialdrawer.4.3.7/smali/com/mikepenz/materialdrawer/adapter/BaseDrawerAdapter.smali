.class public abstract Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "BaseDrawerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;,
        Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
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

.field private mFooterDrawerItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation
.end field

.field private mHeaderDrawerItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation
.end field

.field private mOnClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;

.field private mOnLongClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;

.field private mTypeIds:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mTypeInstances:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;"
        }
    .end annotation
.end field

.field private previousSelection:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeIds:Ljava/util/LinkedList;

    .line 27
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeInstances:Ljava/util/LinkedHashMap;

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->previousSelection:I

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 3
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
    .line 37
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeIds:Ljava/util/LinkedList;

    .line 27
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeInstances:Ljava/util/LinkedHashMap;

    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->previousSelection:I

    .line 38
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->setDrawerItems(Ljava/util/ArrayList;)V

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;)Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mOnClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;

    return-object v0
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;)Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    .prologue
    .line 21
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mOnLongClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;

    return-object v0
.end method

.method private mapPossibleType(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 4
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 162
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeInstances:Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    .line 163
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeIds:Ljava/util/LinkedList;

    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 164
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeInstances:Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    :cond_1e
    return-void
.end method

.method private mapPossibleTypes(Ljava/util/List;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 151
    .local p1, "drawerItemList":Ljava/util/List;, "Ljava/util/List<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    if-eqz p1, :cond_16

    .line 152
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 153
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-direct {p0, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleType(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    goto :goto_6

    .line 156
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_16
    return-void
.end method


# virtual methods
.method public addDrawerItem(ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 5
    .param p1, "position"    # I
    .param p2, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {v0, v1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 82
    invoke-direct {p0, p2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleType(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 83
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemInserted(I)V

    .line 84
    return-void
.end method

.method public addDrawerItem(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 3
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleType(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 77
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemInserted(I)V

    .line 78
    return-void
.end method

.method public varargs addDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 4
    .param p1, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 60
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 61
    .local v0, "length":I
    if-eqz p1, :cond_16

    .line 62
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-static {v1, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 63
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleTypes(Ljava/util/List;)V

    .line 64
    array-length v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRangeInserted(II)V

    .line 66
    :cond_16
    return-void
.end method

.method public varargs addFooterDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 4
    .param p1, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 140
    if-eqz p1, :cond_c

    .line 141
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 142
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRangeInserted(II)V

    .line 144
    :cond_c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleTypes(Ljava/util/List;)V

    .line 145
    return-void
.end method

.method public varargs addHeaderDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 4
    .param p1, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 122
    if-eqz p1, :cond_c

    .line 123
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 124
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRangeInserted(II)V

    .line 126
    :cond_c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleTypes(Ljava/util/List;)V

    .line 127
    return-void
.end method

.method public clearDrawerItems()V
    .registers 3

    .prologue
    .line 92
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 93
    .local v0, "count":I
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 94
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v1

    invoke-virtual {p0, v1, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRangeRemoved(II)V

    .line 95
    return-void
.end method

.method public clearFooterItems()V
    .registers 4

    .prologue
    .line 106
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 107
    .local v0, "count":I
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 108
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v1

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItemCount()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0, v1, v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRangeRemoved(II)V

    .line 109
    return-void
.end method

.method public clearHeaderItems()V
    .registers 3

    .prologue
    .line 98
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 99
    .local v0, "size":I
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 100
    if-lez v0, :cond_11

    .line 101
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRemoved(I)V

    .line 103
    :cond_11
    return-void
.end method

.method protected getDrawerItemCount()I
    .registers 2

    .prologue
    .line 311
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

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
    .line 50
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getFooterDrawerItems()Ljava/util/ArrayList;
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
    .line 130
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method protected getFooterItemCount()I
    .registers 2

    .prologue
    .line 315
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_5
.end method

.method public getHeaderDrawerItems()Ljava/util/ArrayList;
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
    .line 112
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method protected getHeaderItemCount()I
    .registers 2

    .prologue
    .line 307
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return v0

    :cond_6
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_5
.end method

.method public getHeaderOffset()I
    .registers 2

    .prologue
    .line 303
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 269
    if-ltz p1, :cond_8

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItemCount()I

    move-result v0

    if-lt p1, v0, :cond_a

    .line 270
    :cond_8
    const/4 v0, 0x0

    .line 278
    :goto_9
    return-object v0

    .line 273
    :cond_a
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v0

    if-ge p1, v0, :cond_19

    .line 274
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    goto :goto_9

    .line 275
    :cond_19
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItemCount()I

    move-result v1

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_33

    .line 276
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    goto :goto_9

    .line 278
    :cond_33
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItemCount()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    goto :goto_9
.end method

.method public getItemCount()I
    .registers 3

    .prologue
    .line 293
    const/4 v0, 0x0

    .line 295
    .local v0, "itemCount":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v1

    add-int/2addr v0, v1

    .line 296
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItemCount()I

    move-result v1

    add-int/2addr v0, v1

    .line 297
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getFooterItemCount()I

    move-result v1

    add-int/2addr v0, v1

    .line 299
    return v0
.end method

.method public getItemId(I)J
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 284
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    .line 285
    .local v0, "item":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v0, :cond_13

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_13

    .line 286
    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v1

    int-to-long v1, v1

    .line 288
    :goto_12
    return-wide v1

    :cond_13
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v1

    goto :goto_12
.end method

.method public getItemViewType(I)I
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 170
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeIds:Ljava/util/LinkedList;

    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v1

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public handleSelection(Landroid/view/View;I)V
    .registers 8
    .param p1, "v"    # Landroid/view/View;
    .param p2, "pos"    # I

    .prologue
    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 234
    iget v2, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->previousSelection:I

    if-le v2, v3, :cond_17

    .line 235
    iget v2, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->previousSelection:I

    invoke-virtual {p0, v2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v1

    .line 236
    .local v1, "prev":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v1, :cond_12

    .line 237
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->withSetSelected(Z)Ljava/lang/Object;

    .line 239
    :cond_12
    iget v2, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->previousSelection:I

    invoke-virtual {p0, v2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemChanged(I)V

    .line 243
    .end local v1    # "prev":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_17
    if-le p2, v3, :cond_2d

    .line 244
    invoke-virtual {p0, p2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    .line 245
    .local v0, "cur":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v0, :cond_22

    .line 246
    invoke-interface {v0, v4}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->withSetSelected(Z)Ljava/lang/Object;

    .line 248
    :cond_22
    invoke-virtual {p0, p2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemChanged(I)V

    .line 250
    if-eqz p1, :cond_2d

    .line 251
    invoke-virtual {p1, v4}, Landroid/view/View;->setSelected(Z)V

    .line 252
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 255
    .end local v0    # "cur":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_2d
    iput p2, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->previousSelection:I

    .line 256
    return-void
.end method

.method public isEnabled(I)Z
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 259
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    .line 260
    .local v0, "item":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v0, :cond_e

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 v1, 0x1

    :goto_d
    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public isSelected(I)Z
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 264
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    .line 265
    .local v0, "item":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v0, :cond_e

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isSelected()Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 v1, 0x1

    :goto_d
    return v1

    :cond_e
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 5
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 186
    invoke-virtual {p0, p2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 188
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;

    invoke-direct {v1, p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$1;-><init>(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 220
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$2;

    invoke-direct {v1, p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$2;-><init>(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 230
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 176
    invoke-static {}, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->getInstance()Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;

    move-result-object v2

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeIds:Ljava/util/LinkedList;

    invoke-virtual {v1, p2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->obtain(Ljava/lang/String;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 177
    .local v0, "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    if-nez v0, :cond_24

    .line 178
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeInstances:Ljava/util/LinkedHashMap;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mTypeIds:Ljava/util/LinkedList;

    invoke-virtual {v2, p2}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-interface {v1, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getViewHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    .line 180
    .end local v0    # "vh":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    :cond_24
    return-object v0
.end method

.method public removeDrawerItem(I)V
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 88
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRemoved(I)V

    .line 89
    return-void
.end method

.method public setDrawerItem(ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 5
    .param p1, "position"    # I
    .param p2, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v1

    sub-int v1, p1, v1

    invoke-virtual {v0, v1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 70
    invoke-direct {p0, p2}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleType(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 71
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemChanged(I)V

    .line 72
    return-void
.end method

.method public setDrawerItems(Ljava/util/ArrayList;)V
    .registers 4
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
    .line 54
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mDrawerItems:Ljava/util/ArrayList;

    .line 55
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleTypes(Ljava/util/List;)V

    .line 56
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getHeaderItemCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getDrawerItemCount()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRangeChanged(II)V

    .line 57
    return-void
.end method

.method public setFooterDrawerItems(Ljava/util/ArrayList;)V
    .registers 4
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
    .line 134
    .local p1, "mFooterDrawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mFooterDrawerItems:Ljava/util/ArrayList;

    .line 135
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRangeInserted(II)V

    .line 136
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleTypes(Ljava/util/List;)V

    .line 137
    return-void
.end method

.method public setHeaderDrawerItems(Ljava/util/ArrayList;)V
    .registers 4
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
    .line 116
    .local p1, "mHeaderDrawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mHeaderDrawerItems:Ljava/util/ArrayList;

    .line 117
    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->notifyItemRangeInserted(II)V

    .line 118
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mapPossibleTypes(Ljava/util/List;)V

    .line 119
    return-void
.end method

.method public setOnClickListener(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;)V
    .registers 2
    .param p1, "mOnClickListener"    # Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mOnClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;

    .line 43
    return-void
.end method

.method public setOnLongClickListener(Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;)V
    .registers 2
    .param p1, "mOnLongClickListener"    # Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->mOnLongClickListener:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;

    .line 47
    return-void
.end method
