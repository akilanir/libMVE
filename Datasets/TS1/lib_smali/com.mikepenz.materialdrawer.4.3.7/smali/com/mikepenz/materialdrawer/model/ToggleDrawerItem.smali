.class public Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;
.source "ToggleDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private checked:Z

.field private checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private onCheckedChangeListener:Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

.field private toggleEnabled:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem;-><init>()V

    .line 19
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    .line 125
    new-instance v0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$2;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$2;-><init>(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    return-void
.end method

.method static synthetic access$100(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    .prologue
    .line 18
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    return v0
.end method

.method static synthetic access$102(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .param p1, "x1"    # Z

    .prologue
    .line 18
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    return p1
.end method

.method static synthetic access$300(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;)Landroid/widget/CompoundButton$OnCheckedChangeListener;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    .prologue
    .line 18
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    return-object v0
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 5
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 77
    move-object v0, p1

    check-cast v0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;

    .local v0, "viewHolder":Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;
    move-object v1, p1

    .line 80
    check-cast v1, Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->bindViewHelper(Lcom/mikepenz/materialdrawer/model/BasePrimaryDrawerItem$BaseViewHolder;)V

    .line 83
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 84
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 85
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v1

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 86
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    invoke-virtual {v1, v2}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 89
    new-instance v1, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;

    invoke-direct {v1, p0, v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;-><init>(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)V

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->withOnDrawerItemClickListener(Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;)Ljava/lang/Object;

    .line 102
    iget-object v1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v1}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 103
    return-void
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 107
    new-instance v0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 71
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_toggle:I

    return v0
.end method

.method public getOnCheckedChangeListener()Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 65
    const-string v0, "TOGGLE_ITEM"

    return-object v0
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 40
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    return v0
.end method

.method public isToggleEnabled()Z
    .registers 2

    .prologue
    .line 48
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    return v0
.end method

.method public setChecked(Z)V
    .registers 2
    .param p1, "checked"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    .line 45
    return-void
.end method

.method public setOnCheckedChangeListener(Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;)V
    .registers 2
    .param p1, "onCheckedChangeListener"    # Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    .line 61
    return-void
.end method

.method public setToggleEnabled(Z)V
    .registers 2
    .param p1, "toggleEnabled"    # Z

    .prologue
    .line 52
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    .line 53
    return-void
.end method

.method public withChecked(Z)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .registers 2
    .param p1, "checked"    # Z

    .prologue
    .line 25
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    .line 26
    return-object p0
.end method

.method public withOnCheckedChangeListener(Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .registers 2
    .param p1, "onCheckedChangeListener"    # Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/interfaces/OnCheckedChangeListener;

    .line 36
    return-object p0
.end method

.method public withToggleEnabled(Z)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .registers 2
    .param p1, "toggleEnabled"    # Z

    .prologue
    .line 30
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    .line 31
    return-object p0
.end method
