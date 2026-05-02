.class Lcom/mikepenz/materialdrawer/DrawerBuilder$5;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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
    .line 1453
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 14
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/4 v3, 0x1

    .line 1456
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0, p3, v3}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getDrawerItem(IZ)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v6

    .line 1458
    .local v6, "i":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    if-eqz v6, :cond_56

    instance-of v0, v6, Lcom/mikepenz/materialdrawer/model/interfaces/Checkable;

    if-eqz v0, :cond_56

    move-object v0, v6

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/Checkable;

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/Checkable;->isCheckable()Z

    move-result v0

    if-nez v0, :cond_56

    .line 1459
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v2, v2, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setSelection(I)V

    .line 1460
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v2, v2, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    add-int/2addr v1, v2

    invoke-virtual {v0, v1, v3}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 1467
    :goto_36
    const/4 v7, 0x0

    .line 1468
    .local v7, "consumed":Z
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    if-eqz v0, :cond_4e

    .line 1469
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v3, p3, v1

    move-object v1, p1

    move-object v2, p2

    move-wide v4, p4

    invoke-interface/range {v0 .. v6}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v7

    .line 1472
    :cond_4e
    if-nez v7, :cond_55

    .line 1474
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->closeDrawerDelayed()V

    .line 1476
    :cond_55
    return-void

    .line 1462
    .end local v7    # "consumed":Z
    :cond_56
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->resetStickyFooterSelection()V

    .line 1463
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v1, p3, v1

    iput v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 1464
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v1, -0x1

    iput v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentFooterSelection:I

    goto :goto_36
.end method
