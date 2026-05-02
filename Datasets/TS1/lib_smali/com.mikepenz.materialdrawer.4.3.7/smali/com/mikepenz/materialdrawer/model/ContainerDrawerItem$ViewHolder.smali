.class Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "ContainerDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private view:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 116
    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 117
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->view:Landroid/view/View;

    .line 118
    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$1;

    .prologue
    .line 112
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$000(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$ViewHolder;->view:Landroid/view/View;

    return-object v0
.end method
