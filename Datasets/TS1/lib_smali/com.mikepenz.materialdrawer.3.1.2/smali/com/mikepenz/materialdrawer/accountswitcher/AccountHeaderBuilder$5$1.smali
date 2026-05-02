.class Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;
.super Ljava/lang/Object;
.source "AccountHeaderBuilder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;

.field final synthetic val$drawerItem:Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

.field final synthetic val$isCurrentSelectedProfile:Z

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Z)V
    .registers 5
    .param p1, "this$1"    # Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;

    .prologue
    .line 1231
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->this$1:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;

    iput-object p2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$view:Landroid/view/View;

    iput-object p3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$drawerItem:Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    iput-boolean p4, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$isCurrentSelectedProfile:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 1234
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->this$1:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mResetDrawerOnProfileListClick:Z

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->this$1:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$view:Landroid/view/View;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$view:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_29

    .line 1235
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->this$1:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$view:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    # invokes: Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->resetDrawerContent(Landroid/content/Context;)V
    invoke-static {v0, v1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->access$000(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;Landroid/content/Context;)V

    .line 1237
    :cond_29
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$drawerItem:Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    if-eqz v0, :cond_4c

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$drawerItem:Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    instance-of v0, v0, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    if-eqz v0, :cond_4c

    .line 1238
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->this$1:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;

    if-eqz v0, :cond_4c

    .line 1239
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->this$1:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v1, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$view:Landroid/view/View;

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$drawerItem:Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$5$1;->val$isCurrentSelectedProfile:Z

    invoke-interface {v1, v2, v0, v3}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;->onProfileChanged(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)Z

    .line 1243
    :cond_4c
    return-void
.end method
