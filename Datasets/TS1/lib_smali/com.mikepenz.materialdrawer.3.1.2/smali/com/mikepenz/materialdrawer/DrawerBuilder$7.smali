.class Lcom/mikepenz/materialdrawer/DrawerBuilder$7;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


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
    .line 1491
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 13
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
    .line 1494
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemSelectedListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;

    if-eqz v0, :cond_1d

    .line 1495
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemSelectedListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v3, p3, v1

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x1

    invoke-virtual {v1, p3, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getDrawerItem(IZ)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v6

    move-object v1, p1

    move-object v2, p2

    move-wide v4, p4

    invoke-interface/range {v0 .. v6}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 1497
    :cond_1d
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v1, p3, v1

    iput v1, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 1498
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 1502
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemSelectedListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;

    if-eqz v0, :cond_d

    .line 1503
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemSelectedListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemSelectedListener;->onNothingSelected(Landroid/widget/AdapterView;)V

    .line 1505
    :cond_d
    return-void
.end method
