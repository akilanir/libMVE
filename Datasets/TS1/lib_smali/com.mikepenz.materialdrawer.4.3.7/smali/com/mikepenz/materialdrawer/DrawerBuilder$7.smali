.class Lcom/mikepenz/materialdrawer/DrawerBuilder$7;
.super Ljava/lang/Object;
.source "DrawerBuilder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/DrawerBuilder;->closeDrawerDelayed()V
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
    .line 1702
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 1705
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0}, Landroid/support/v4/widget/DrawerLayout;->closeDrawers()V

    .line 1707
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mScrollToTopAfterClick:Z

    if-eqz v0, :cond_15

    .line 1708
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder$7;->this$0:Lcom/mikepenz/materialdrawer/DrawerBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 1710
    :cond_15
    return-void
.end method
