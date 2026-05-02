.class Lcom/mikepenz/materialdrawer/DrawerBuilder$5;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/DrawerBuilder;->createContent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .prologue
    .line 1643
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 7
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "item"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 1646
    if-eqz p3, :cond_f

    instance-of v1, p3, Lcom/mikepenz/materialdrawer/model/interfaces/Selectable;

    if-eqz v1, :cond_f

    move-object v1, p3

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/Selectable;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/Selectable;->isSelectable()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 1647
    :cond_f
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->resetStickyFooterSelection()V

    .line 1648
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iput p2, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 1649
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, -0x1

    iput v2, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentStickyFooterSelection:I

    .line 1652
    :cond_1d
    const/4 v0, 0x0

    .line 1653
    .local v0, "consumed":Z
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    if-eqz v1, :cond_2c

    .line 1654
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    invoke-interface {v1, p1, p2, p3}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v0

    .line 1657
    :cond_2c
    if-nez v0, :cond_33

    .line 1659
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->closeDrawerDelayed()V

    .line 1661
    :cond_33
    return-void
.end method
