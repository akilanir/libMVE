.class public Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;
.source "SectionDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;,
        Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ItemFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Nameable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private divider:Z

.field private name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

.field private textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/AbstractDrawerItem;-><init>()V

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->divider:Z

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 149
    return-void
.end method


# virtual methods
.method public bindView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 9
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v6, 0x0

    .line 106
    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .local v0, "ctx":Landroid/content/Context;
    move-object v1, p1

    .line 109
    check-cast v1, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;

    .line 112
    .local v1, "viewHolder":Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;
    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->getIdentifier()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setId(I)V

    .line 115
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/View;->setClickable(Z)V

    .line 116
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$000(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 119
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v3

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_secondary_text:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_secondary_text:I

    invoke-static {v3, v0, v4, v5}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 122
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;

    move-result-object v2

    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mikepenz/materialdrawer/holder/StringHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/StringHolder;Landroid/widget/TextView;)V

    .line 125
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->hasDivider()Z

    move-result v2

    if-eqz v2, :cond_61

    .line 126
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->divider:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 132
    :goto_4c
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->divider:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    sget v3, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v4, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {v0, v3, v4}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 135
    iget-object v2, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0, p0, v2}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->onPostBindView(Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;)V

    .line 136
    return-void

    .line 128
    :cond_61
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->divider:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4c
.end method

.method public getFactory()Lcom/mikepenz/materialdrawer/model/utils/ViewHolderFactory;
    .registers 2

    .prologue
    .line 140
    new-instance v0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ItemFactory;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ItemFactory;-><init>()V

    return-object v0
.end method

.method public getLayoutRes()I
    .registers 2
    .annotation build Landroid/support/annotation/LayoutRes;
    .end annotation

    .prologue
    .line 96
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_section:I

    return v0
.end method

.method public getName()Lcom/mikepenz/materialdrawer/holder/StringHolder;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    return-object v0
.end method

.method public getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 90
    const-string v0, "SECTION_ITEM"

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public hasDivider()Z
    .registers 2

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->divider:Z

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 80
    const/4 v0, 0x0

    return v0
.end method

.method public isSelected()Z
    .registers 2

    .prologue
    .line 85
    const/4 v0, 0x0

    return v0
.end method

.method public withDivider(Z)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 2
    .param p1, "divider"    # Z

    .prologue
    .line 47
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->divider:Z

    .line 48
    return-object p0
.end method

.method public withName(I)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 3
    .param p1, "nameRes"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 42
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 43
    return-object p0
.end method

.method public withName(Lcom/mikepenz/materialdrawer/holder/StringHolder;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 2
    .param p1, "name"    # Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 33
    return-object p0
.end method

.method public withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 37
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/StringHolder;

    invoke-direct {v0, p1}, Lcom/mikepenz/materialdrawer/holder/StringHolder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->name:Lcom/mikepenz/materialdrawer/holder/StringHolder;

    .line 38
    return-object p0
.end method

.method public bridge synthetic withName(I)Ljava/lang/Object;
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->withName(I)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withName(Lcom/mikepenz/materialdrawer/holder/StringHolder;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->withName(Lcom/mikepenz/materialdrawer/holder/StringHolder;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withName(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withTextColor(I)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 3
    .param p1, "textColor"    # I

    .prologue
    .line 52
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 53
    return-object p0
.end method

.method public withTextColorRes(I)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 3
    .param p1, "textColorRes"    # I

    .prologue
    .line 57
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 58
    return-object p0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 63
    return-object p0
.end method

.method public bridge synthetic withTypeface(Landroid/graphics/Typeface;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 22
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;

    move-result-object v0

    return-object v0
.end method
