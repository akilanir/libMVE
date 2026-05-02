.class Lcom/mikepenz/materialdrawer/DrawerBuilder$2;
.super Landroid/support/v7/app/ActionBarDrawerToggle;
.source "DrawerBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/DrawerBuilder;->handleDrawerNavigation(Landroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;


# direct methods
.method constructor <init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;Landroid/support/v7/widget/Toolbar;II)V
    .registers 13
    .param p1, "this$0"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p2, "arg0"    # Landroid/app/Activity;
    .param p3, "arg1"    # Landroid/support/v4/widget/DrawerLayout;
    .param p4, "arg2"    # Landroid/support/v7/widget/Toolbar;
    .param p5, "arg3"    # I
    .param p6, "arg4"    # I

    .prologue
    .line 1328
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move v4, p5

    move v5, p6

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/app/ActionBarDrawerToggle;-><init>(Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;Landroid/support/v7/widget/Toolbar;II)V

    return-void
.end method


# virtual methods
.method public onDrawerClosed(Landroid/view/View;)V
    .registers 3
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 1339
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    if-eqz v0, :cond_d

    .line 1340
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;->onDrawerClosed(Landroid/view/View;)V

    .line 1342
    :cond_d
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarDrawerToggle;->onDrawerClosed(Landroid/view/View;)V

    .line 1343
    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .registers 3
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 1331
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    if-eqz v0, :cond_d

    .line 1332
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;->onDrawerOpened(Landroid/view/View;)V

    .line 1334
    :cond_d
    invoke-super {p0, p1}, Landroid/support/v7/app/ActionBarDrawerToggle;->onDrawerOpened(Landroid/view/View;)V

    .line 1335
    return-void
.end method

.method public onDrawerSlide(Landroid/view/View;F)V
    .registers 4
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    .line 1347
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    if-eqz v0, :cond_d

    .line 1348
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    invoke-interface {v0, p1, p2}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;->onDrawerSlide(Landroid/view/View;F)V

    .line 1351
    :cond_d
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAnimateActionBarDrawerToggle:Z

    if-nez v0, :cond_18

    .line 1352
    const/4 v0, 0x0

    invoke-super {p0, p1, v0}, Landroid/support/v7/app/ActionBarDrawerToggle;->onDrawerSlide(Landroid/view/View;F)V

    .line 1356
    :goto_17
    return-void

    .line 1354
    :cond_18
    invoke-super {p0, p1, p2}, Landroid/support/v7/app/ActionBarDrawerToggle;->onDrawerSlide(Landroid/view/View;F)V

    goto :goto_17
.end method
