.class public Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;
.source "SecondarySwitchDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private checked:Z

.field private checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private onCheckedChangeListener:Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

.field private switchEnabled:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem;-><init>()V

    .line 20
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->switchEnabled:Z

    .line 22
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checked:Z

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    .line 118
    new-instance v0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$2;-><init>(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    return-void
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    .prologue
    .line 18
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checked:Z

    return v0
.end method

.method static synthetic access$102(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;
    .param p1, "x1"    # Z

    .prologue
    .line 18
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checked:Z

    return p1
.end method

.method static synthetic access$300(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;)Landroid/widget/CompoundButton$OnCheckedChangeListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    return-object v0
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 5
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 70
    move-object v0, p1

    check-cast v0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;

    .local v0, "viewHolder":Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;
    move-object v1, p1

    .line 73
    check-cast v1, Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->bindViewHelper(Lcom/mikepenz/materialdrawer/model/BaseSecondaryDrawerItem$BaseViewHolder;)V

    .line 76
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;)Landroid/support/v7/widget/SwitchCompat;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 77
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;)Landroid/support/v7/widget/SwitchCompat;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checked:Z

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SwitchCompat;->setChecked(Z)V

    .line 78
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;)Landroid/support/v7/widget/SwitchCompat;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SwitchCompat;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 79
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;->switchView:Landroid/support/v7/widget/SwitchCompat;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;)Landroid/support/v7/widget/SwitchCompat;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->switchEnabled:Z

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/SwitchCompat;->setEnabled(Z)V

    .line 82
    new-instance v1, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$1;

    invoke-direct {v1, p0, v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$1;-><init>(Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ViewHolder;)V

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->withOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)Ljava/lang/Object;

    .line 95
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v1}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 96
    return-void
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 100
    new-instance v0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 64
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_secondary_switch:I

    return v0
.end method

.method public getOnCheckedChangeListener()Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    const-string v0, "SECONDARY_SWITCH_ITEM"

    return-object v0
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 45
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checked:Z

    return v0
.end method

.method public isSwitchEnabled()Z
    .registers 2

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->switchEnabled:Z

    return v0
.end method

.method public withCheckable(Z)Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;
    .registers 3
    .param p1, "checkable"    # Z

    .prologue
    .line 41
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->withSelectable(Z)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;

    return-object v0
.end method

.method public withChecked(Z)Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;
    .registers 2
    .param p1, "checked"    # Z

    .prologue
    .line 26
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->checked:Z

    .line 27
    return-object p0
.end method

.method public withOnCheckedChangeListener(Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;)Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;
    .registers 2
    .param p1, "onCheckedChangeListener"    # Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    .line 37
    return-object p0
.end method

.method public withSwitchEnabled(Z)Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;
    .registers 2
    .param p1, "switchEnabled"    # Z

    .prologue
    .line 31
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/SecondarySwitchDrawerItem;->switchEnabled:Z

    .line 32
    return-object p0
.end method
