.class Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$4;
.super Ljava/lang/Object;
.source "AccountHeaderBuilder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 1163
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$4;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 1166
    const/4 v0, 0x0

    .line 1167
    .local v0, "consumed":Z
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$4;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderSelectionViewClickListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderSelectionViewClickListener;

    if-eqz v1, :cond_17

    .line 1168
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$4;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v1, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderSelectionViewClickListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderSelectionViewClickListener;

    sget v1, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_profile_header:I

    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2, p1, v1}, Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderSelectionViewClickListener;->onClick(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z

    move-result v0

    .line 1171
    :cond_17
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$4;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountSwitcherArrow:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2c

    if-nez v0, :cond_2c

    .line 1172
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder$4;->this$0:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->toggleSelectionList(Landroid/content/Context;)V

    .line 1174
    :cond_2c
    return-void
.end method
