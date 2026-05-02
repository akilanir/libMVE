.class Lcom/mikepenz/materialdrawer/MiniDrawer$1;
.super Ljava/lang/Object;
.source "MiniDrawer.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/MiniDrawer;->createItems()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/MiniDrawer;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/MiniDrawer;

    .prologue
    .line 297
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V
    .registers 8
    .param p1, "v"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "item"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    const/4 v2, 0x1

    .line 300
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    invoke-virtual {v1, p3}, Lcom/mikepenz/materialdrawer/MiniDrawer;->getMiniDrawerType(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)I

    move-result v0

    .line 301
    .local v0, "type":I
    const/4 v1, 0x2

    if-ne v0, v1, :cond_42

    .line 303
    invoke-interface {p3}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isSelectable()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 304
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    # getter for: Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/MiniDrawer;->access$000(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/Drawer;

    move-result-object v1

    invoke-virtual {v1, p3, v2}, Lcom/mikepenz/materialdrawer/Drawer;->setSelection(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Z)Z

    .line 317
    :cond_19
    :goto_19
    return-void

    .line 305
    :cond_1a
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    # getter for: Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/MiniDrawer;->access$000(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/Drawer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/Drawer;->getOnDrawerItemClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    move-result-object v1

    if-eqz v1, :cond_19

    .line 307
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    # getter for: Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/MiniDrawer;->access$000(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/Drawer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/Drawer;->getOnDrawerItemClickListener()Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    # getter for: Lcom/mikepenz/materialdrawer/MiniDrawer;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;
    invoke-static {v2}, Lcom/mikepenz/materialdrawer/MiniDrawer;->access$000(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/Drawer;

    move-result-object v2

    invoke-interface {p3}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/mikepenz/materialdrawer/Drawer;->getDrawerItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v2

    invoke-interface {v1, p1, p2, v2}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    goto :goto_19

    .line 309
    :cond_42
    if-ne v0, v2, :cond_19

    .line 310
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    # getter for: Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/MiniDrawer;->access$100(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/AccountHeader;

    move-result-object v1

    if-eqz v1, :cond_65

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    # getter for: Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/MiniDrawer;->access$100(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/AccountHeader;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/AccountHeader;->isSelectionListShown()Z

    move-result v1

    if-nez v1, :cond_65

    .line 311
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    # getter for: Lcom/mikepenz/materialdrawer/MiniDrawer;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/MiniDrawer;->access$100(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/AccountHeader;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/AccountHeader;->toggleSelectionList(Landroid/content/Context;)V

    .line 313
    :cond_65
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    # getter for: Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/MiniDrawer;->access$200(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    move-result-object v1

    if-eqz v1, :cond_19

    .line 314
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/MiniDrawer$1;->this$0:Lcom/mikepenz/materialdrawer/MiniDrawer;

    # getter for: Lcom/mikepenz/materialdrawer/MiniDrawer;->mCrossFader:Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/MiniDrawer;->access$200(Lcom/mikepenz/materialdrawer/MiniDrawer;)Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;

    move-result-object v1

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/interfaces/ICrossfader;->crossfade()V

    goto :goto_19
.end method
