.class Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;
.super Ljava/lang/Object;
.source "AccountHeaderBuilder.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    .prologue
    .line 1216
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .registers 12
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .param p6, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 1220
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    if-eqz p6, :cond_3d

    instance-of v1, p6, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v1, :cond_3d

    move-object v1, p6

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v1}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->isSelectable()Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 1221
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    move-object v1, p6

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v2, v1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->switchProfiles(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z

    move-result v0

    .line 1226
    .local v0, "isCurrentSelectedProfile":Z
    :goto_18
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-boolean v1, v1, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mResetDrawerOnProfileListClick:Z

    if-eqz v1, :cond_26

    .line 1227
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/Drawer;->setOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)V

    .line 1231
    :cond_26
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;

    invoke-direct {v2, p0, p2, p6, v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;-><init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Z)V

    const-wide/16 v3, 0x15e

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1246
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-boolean v1, v1, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mCloseDrawerOnProfileListClick:Z

    if-nez v1, :cond_3f

    const/4 v1, 0x1

    :goto_3c
    return v1

    .line 1223
    .end local v0    # "isCurrentSelectedProfile":Z
    :cond_3d
    const/4 v0, 0x0

    .restart local v0    # "isCurrentSelectedProfile":Z
    goto :goto_18

    .line 1246
    :cond_3f
    const/4 v1, 0x0

    goto :goto_3c
.end method
