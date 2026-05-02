.class Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;
.super Ljava/lang/Object;
.source "AccountHeaderBuilder.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;)V
    .registers 2
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    .prologue
    .line 1228
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .registers 8
    .param p1, "view"    # Landroid/view/View;
    .param p2, "position"    # I
    .param p3, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    .line 1232
    if-eqz p3, :cond_69

    instance-of v2, p3, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v2, :cond_69

    invoke-interface {p3}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isSelectable()Z

    move-result v2

    if-eqz v2, :cond_69

    .line 1233
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    move-object v2, p3

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-virtual {v3, v2}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->switchProfiles(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z

    move-result v1

    .line 1238
    .local v1, "isCurrentSelectedProfile":Z
    :goto_15
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-boolean v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mResetDrawerOnProfileListClick:Z

    if-eqz v2, :cond_23

    .line 1239
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/mikepenz/materialdrawer/Drawer;->setOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)V

    .line 1243
    :cond_23
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-boolean v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mResetDrawerOnProfileListClick:Z

    if-eqz v2, :cond_40

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v2, :cond_40

    if-eqz p1, :cond_40

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    if-eqz v2, :cond_40

    .line 1244
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    # invokes: Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->resetDrawerContent(Landroid/content/Context;)V
    invoke-static {v2, v3}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->access$000(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;Landroid/content/Context;)V

    .line 1247
    :cond_40
    const/4 v0, 0x0

    .line 1248
    .local v0, "consumed":Z
    if-eqz p3, :cond_57

    instance-of v2, p3, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v2, :cond_57

    .line 1249
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;

    if-eqz v2, :cond_57

    .line 1250
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;

    check-cast p3, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .end local p3    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-interface {v2, p1, p3, v1}, Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;->onProfileChanged(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)Z

    move-result v0

    .line 1255
    :cond_57
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCloseDrawerOnProfileListClick:Ljava/lang/Boolean;

    if-eqz v2, :cond_6d

    .line 1256
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCloseDrawerOnProfileListClick:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_6b

    const/4 v2, 0x1

    .line 1258
    :goto_68
    return v2

    .line 1235
    .end local v0    # "consumed":Z
    .end local v1    # "isCurrentSelectedProfile":Z
    .restart local p3    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    :cond_69
    const/4 v1, 0x0

    .restart local v1    # "isCurrentSelectedProfile":Z
    goto :goto_15

    .line 1256
    .end local p3    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .restart local v0    # "consumed":Z
    :cond_6b
    const/4 v2, 0x0

    goto :goto_68

    :cond_6d
    move v2, v0

    .line 1258
    goto :goto_68
.end method
