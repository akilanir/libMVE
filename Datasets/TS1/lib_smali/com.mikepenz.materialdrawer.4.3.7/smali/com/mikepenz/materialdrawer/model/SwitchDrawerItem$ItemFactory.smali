.class public Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ItemFactory;
.super Ljava/lang/Object;
.source "SwitchDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ItemFactory"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic factory(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 3

    .prologue
    .line 103
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ItemFactory;->factory(Landroid/view/View;)Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public factory(Landroid/view/View;)Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 105
    new-instance v0, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$ViewHolder;-><init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/SwitchDrawerItem$1;)V

    return-object v0
.end method
