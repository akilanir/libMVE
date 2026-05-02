.class Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$1;
.super Ljava/lang/Object;
.source "DrawerItemViewHelper.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->build()Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$1;->this$0:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 81
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$1;->this$0:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;

    # getter for: Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->access$000(Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;)Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 82
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$1;->this$0:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;

    # getter for: Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;->access$000(Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper;)Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    invoke-interface {v1, p1, v0}, Lcom/mikepenz/materialdrawer/util/DrawerItemViewHelper$OnDrawerItemClickListener;->onItemClick(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 84
    :cond_17
    return-void
.end method
