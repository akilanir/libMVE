.class Lcom/mikepenz/materialdrawer/DrawerBuilder$1;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/DrawerBuilder;->build()Lcom/mikepenz/materialdrawer/Drawer;
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
    .line 1150
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1153
    const/4 v0, 0x0

    .line 1155
    .local v0, "handled":Z
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerNavigationListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActionBarDrawerToggle:Landroid/support/v7/app/ActionBarDrawerToggle;

    invoke-virtual {v1}, Landroid/support/v7/app/ActionBarDrawerToggle;->isDrawerIndicatorEnabled()Z

    move-result v1

    if-nez v1, :cond_1f

    .line 1156
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerNavigationListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;

    invoke-interface {v1, p1}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerNavigationListener;->onNavigationClickListener(Landroid/view/View;)Z

    move-result v0

    .line 1158
    :cond_1f
    if-nez v0, :cond_42

    .line 1159
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v1

    if-eqz v1, :cond_43

    .line 1160
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(I)V

    .line 1165
    :cond_42
    :goto_42
    return-void

    .line 1162
    :cond_43
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$1;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(I)V

    goto :goto_42
.end method
