.class Lcom/mikepenz/materialdrawer/DrawerBuilder$6;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnLongClickListener;


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
    .line 1665
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .registers 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "item"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 1668
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    if-eqz v0, :cond_15

    .line 1669
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemLongClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$6;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-virtual {v1, p2}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v1

    invoke-interface {v0, p1, p2, v1}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemLongClickListener;->onItemLongClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v0

    .line 1671
    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method
