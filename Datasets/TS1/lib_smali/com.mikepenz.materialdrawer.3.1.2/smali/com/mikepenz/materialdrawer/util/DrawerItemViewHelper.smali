.class public Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;
.super Ljava/lang/Object;
.source "DrawerItemViewHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDivider:Z

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

.field private mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mDrawerItems:Ljava/util/ArrayList;

    .line 38
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mDivider:Z

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;

    .line 23
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mContext:Landroid/content/Context;

    .line 24
    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;)Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;

    return-object v0
.end method


# virtual methods
.method public build()Landroid/view/View;
    .registers 10

    .prologue
    const/4 v8, 0x1

    const/4 v7, -0x1

    const/4 v6, -0x2

    .line 54
    new-instance v3, Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mContext:Landroid/content/Context;

    invoke-direct {v3, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 55
    .local v3, "linearLayout":Landroid/widget/LinearLayout;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 59
    iget-boolean v5, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mDivider:Z

    if-eqz v5, :cond_47

    .line 60
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mContext:Landroid/content/Context;

    invoke-direct {v0, v5}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 61
    .local v0, "divider":Landroid/widget/LinearLayout;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v7, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    const/high16 v5, 0x3f800000    # 1.0f

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mContext:Landroid/content/Context;

    invoke-static {v5, v6}, Lcom/mikepenz/materialdrawer/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 63
    invoke-virtual {v0, v8}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 64
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mContext:Landroid/content/Context;

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {v5, v6, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v5

    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 65
    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 69
    .end local v0    # "divider":Landroid/widget/LinearLayout;
    :cond_47
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mContext:Landroid/content/Context;

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 72
    .local v2, "layoutInflater":Landroid/view/LayoutInflater;
    iget-object v5, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_53
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_82

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 73
    .local v1, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    const/4 v6, 0x0

    invoke-interface {v1, v2, v6, v3}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .line 74
    .local v4, "view":Landroid/view/View;
    invoke-virtual {v4, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 76
    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_7e

    .line 77
    iget-object v6, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mContext:Landroid/content/Context;

    invoke-static {v6}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getSelectableBackground(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v4, v6}, Landroid/view/View;->setBackgroundResource(I)V

    .line 78
    new-instance v6, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$1;

    invoke-direct {v6, p0}, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$1;-><init>(Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    :cond_7e
    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_53

    .line 91
    .end local v1    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v4    # "view":Landroid/view/View;
    :cond_82
    return-object v3
.end method

.method public withDivider(Z)Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;
    .registers 2
    .param p1, "divider"    # Z

    .prologue
    .line 41
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mDivider:Z

    .line 42
    return-object p0
.end method

.method public withDrawerItems(Ljava/util/ArrayList;)Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ">;)",
            "Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;"
        }
    .end annotation

    .prologue
    .line 29
    .local p1, "drawerItems":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;>;"
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mDrawerItems:Ljava/util/ArrayList;

    .line 30
    return-object p0
.end method

.method public varargs withDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;
    .registers 3
    .param p1, "drawerItems"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mDrawerItems:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 35
    return-object p0
.end method

.method public withOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;)Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;
    .registers 2
    .param p1, "onDrawerItemClickListener"    # Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;

    .line 49
    return-object p0
.end method
