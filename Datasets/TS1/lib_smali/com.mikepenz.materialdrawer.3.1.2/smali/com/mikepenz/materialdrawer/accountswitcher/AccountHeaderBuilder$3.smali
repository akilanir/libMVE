.class Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$3;
.super Ljava/lang/Object;
.source "AccountHeaderBuilder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onProfileClick(Landroid/view/View;Z)V
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
    .line 1120
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 1123
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    if-eqz v0, :cond_d

    .line 1124
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$3;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/Drawer;->closeDrawer()V

    .line 1126
    :cond_d
    return-void
.end method
