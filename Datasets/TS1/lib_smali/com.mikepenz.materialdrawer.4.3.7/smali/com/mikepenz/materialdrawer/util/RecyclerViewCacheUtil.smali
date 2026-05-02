.class public Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;
.super Ljava/lang/Object;
.source "RecyclerViewCacheUtil.java"


# static fields
.field private static SINGLETON:Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;


# instance fields
.field private CACHE:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Stack",
            "<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;>;"
        }
    .end annotation
.end field

.field private CACHE_SIZE:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const/4 v0, 0x0

    sput-object v0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->SINGLETON:Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x3

    iput v0, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE_SIZE:I

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE:Ljava/util/HashMap;

    .line 22
    return-void
.end method

.method public static getInstance()Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;
    .registers 1

    .prologue
    .line 25
    sget-object v0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->SINGLETON:Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;

    if-nez v0, :cond_b

    .line 26
    new-instance v0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;-><init>()V

    sput-object v0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->SINGLETON:Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;

    .line 28
    :cond_b
    sget-object v0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->SINGLETON:Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;

    return-object v0
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 58
    return-void
.end method

.method public varargs init(Landroid/support/v7/widget/RecyclerView;[Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 9
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 67
    if-eqz p2, :cond_53

    .line 68
    array-length v3, p2

    const/4 v1, 0x0

    move v2, v1

    :goto_5
    if-ge v2, v3, :cond_53

    aget-object v0, p2, v2

    .line 69
    .local v0, "d":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE:Ljava/util/HashMap;

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_23

    .line 70
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE:Ljava/util/HashMap;

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/util/Stack;

    invoke-direct {v5}, Ljava/util/Stack;-><init>()V

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    :cond_23
    iget v1, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE_SIZE:I

    const/4 v4, -0x1

    if-eq v1, v4, :cond_3c

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE:Ljava/util/HashMap;

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->size()I

    move-result v1

    iget v4, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE_SIZE:I

    if-gt v1, v4, :cond_4f

    .line 74
    :cond_3c
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE:Ljava/util/HashMap;

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Stack;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getViewHolder(Landroid/view/ViewGroup;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    :cond_4f
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_5

    .line 78
    .end local v0    # "d":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_53
    return-void
.end method

.method public init(Lcom/mikepenz/materialdrawer/Drawer;)V
    .registers 5
    .param p1, "drawer"    # Lcom/mikepenz/materialdrawer/Drawer;

    .prologue
    .line 48
    invoke-virtual {p1}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_21

    .line 49
    invoke-virtual {p1}, Lcom/mikepenz/materialdrawer/Drawer;->getRecyclerView()Landroid/support/v7/widget/RecyclerView;

    move-result-object v1

    invoke-virtual {p1}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItems()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-virtual {p0, v1, v0}, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->init(Landroid/support/v7/widget/RecyclerView;[Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 51
    :cond_21
    return-void
.end method

.method public obtain(Ljava/lang/String;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 87
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 88
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v0

    if-lez v0, :cond_25

    .line 89
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .line 92
    :goto_24
    return-object v0

    :cond_25
    const/4 v0, 0x0

    goto :goto_24
.end method

.method public withCacheSize(I)Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;
    .registers 2
    .param p1, "cacheSize"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/mikepenz/materialdrawer/util/RecyclerViewCacheUtil;->CACHE_SIZE:I

    .line 39
    return-object p0
.end method
