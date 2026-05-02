.class Lcom/mikepenz/materialdrawer/DrawerBuilder$6;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


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
    .line 1480
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
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
            "IJ)Z"
        }
    .end annotation

    .prologue
    .line 1483
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    if-eqz v0, :cond_1f

    .line 1484
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    sub-int v3, p3, v1

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    const/4 v2, 0x1

    invoke-virtual {v1, p3, v2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getDrawerItem(IZ)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v6

    move-object v1, p1

    move-object v2, p2

    move-wide v4, p4

    invoke-interface/range {v0 .. v6}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v0

    .line 1486
    :goto_1e
    return v0

    :cond_1f
    const/4 v0, 0x0

    goto :goto_1e
.end method
