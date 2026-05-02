.class Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$2;
.super Ljava/lang/Object;
.source "AccountHeaderBuilder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 1100
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1103
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder$2;->this$0:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->onProfileClick(Landroid/view/View;Z)V

    .line 1104
    return-void
.end method
