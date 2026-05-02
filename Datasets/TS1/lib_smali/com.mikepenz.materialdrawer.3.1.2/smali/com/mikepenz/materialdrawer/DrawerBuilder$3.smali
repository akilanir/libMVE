.class Lcom/mikepenz/materialdrawer/DrawerBuilder$3;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"

# interfaces
.implements Landroid/support/v4/widget/DrawerLayout$DrawerListener;


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
    .line 1214
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDrawerClosed(Landroid/view/View;)V
    .registers 3
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 1231
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    if-eqz v0, :cond_d

    .line 1232
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;->onDrawerClosed(Landroid/view/View;)V

    .line 1234
    :cond_d
    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .registers 3
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 1224
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    if-eqz v0, :cond_d

    .line 1225
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;->onDrawerOpened(Landroid/view/View;)V

    .line 1227
    :cond_d
    return-void
.end method

.method public onDrawerSlide(Landroid/view/View;F)V
    .registers 4
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    .line 1217
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    if-eqz v0, :cond_d

    .line 1218
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;

    invoke-interface {v0, p1, p2}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerListener;->onDrawerSlide(Landroid/view/View;F)V

    .line 1220
    :cond_d
    return-void
.end method

.method public onDrawerStateChanged(I)V
    .registers 2
    .param p1, "newState"    # I

    .prologue
    .line 1239
    return-void
.end method
