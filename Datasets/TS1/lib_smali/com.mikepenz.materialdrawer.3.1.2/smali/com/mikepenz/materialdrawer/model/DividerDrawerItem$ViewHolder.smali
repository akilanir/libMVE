.class Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;
.super Ljava/lang/Object;
.source "DividerDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/DividerDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private divider:Landroid/view/View;

.field private view:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->view:Landroid/view/View;

    .line 72
    sget v0, Lcom/mikepenz/materialdrawer/R$id;->divider:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->divider:Landroid/view/View;

    .line 73
    return-void
.end method

.method synthetic constructor <init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/view/View;
    .param p2, "x1"    # Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$1;

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;)Landroid/view/View;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/DividerDrawerItem$ViewHolder;->divider:Landroid/view/View;

    return-object v0
.end method
