.class public Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
.super Ljava/lang/Object;
.source "SectionDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Nameable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Tagable;
.implements Lcom/mikepenz/materialdrawer/model/interfaces/Typefaceable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Nameable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/Tagable",
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

.field private identifier:I

.field private name:Ljava/lang/String;

.field private nameRes:I

.field private tag:Ljava/lang/Object;

.field private textColor:I

.field private textColorRes:I

.field private typeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, -0x1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->identifier:I

    .line 25
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->nameRes:I

    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->divider:Z

    .line 29
    const/4 v0, 0x0

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColor:I

    .line 30
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColorRes:I

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 193
    return-void
.end method


# virtual methods
.method public convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v6, 0x0

    .line 159
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 162
    .local v0, "ctx":Landroid/content/Context;
    if-nez p2, :cond_74

    .line 163
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->getLayoutRes()I

    move-result v2

    invoke-virtual {p1, v2, p3, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 164
    new-instance v1, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;

    const/4 v2, 0x0

    invoke-direct {v1, p2, v2}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;-><init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$1;)V

    .line 165
    .local v1, "viewHolder":Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 170
    :goto_18
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/View;->setClickable(Z)V

    .line 171
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 173
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->getTextColor()I

    move-result v2

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->getTextColorRes()I

    move-result v3

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_secondary_text:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_secondary_text:I

    invoke-static {v0, v2, v3, v4, v5}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v2

    iput v2, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColor:I

    .line 174
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v2

    iget v3, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColor:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 176
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->getNameRes()I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_7b

    .line 177
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->getNameRes()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 182
    :goto_53
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->hasDivider()Z

    move-result v2

    if-eqz v2, :cond_87

    .line 183
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->divider:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 188
    :goto_60
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->divider:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {v3, v4, v5}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 190
    return-object p2

    .line 167
    .end local v1    # "viewHolder":Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;
    :cond_74
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;

    .restart local v1    # "viewHolder":Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;
    goto :goto_18

    .line 179
    :cond_7b
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_53

    .line 185
    :cond_87
    # getter for: Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->divider:Landroid/view/View;
    invoke-static {v1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SectionDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_60
.end method

.method public getIdentifier()I
    .registers 2

    .prologue
    .line 113
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->identifier:I

    return v0
.end method

.method public getLayoutRes()I
    .registers 2

    .prologue
    .line 128
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_section:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNameRes()I
    .registers 2

    .prologue
    .line 96
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->nameRes:I

    return v0
.end method

.method public getTag()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->tag:Ljava/lang/Object;

    return-object v0
.end method

.method public getTextColor()I
    .registers 2

    .prologue
    .line 132
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColor:I

    return v0
.end method

.method public getTextColorRes()I
    .registers 2

    .prologue
    .line 140
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColorRes:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 123
    const-string v0, "SECTION_ITEM"

    return-object v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .registers 2

    .prologue
    .line 149
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->typeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public hasDivider()Z
    .registers 2

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->divider:Z

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 118
    const/4 v0, 0x0

    return v0
.end method

.method public setDivider(Z)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 2
    .param p1, "divider"    # Z

    .prologue
    .line 57
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->divider:Z

    .line 58
    return-object p0
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->name:Ljava/lang/String;

    .line 102
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->nameRes:I

    .line 103
    return-void
.end method

.method public setNameRes(I)V
    .registers 3
    .param p1, "nameRes"    # I

    .prologue
    .line 107
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->nameRes:I

    .line 108
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->name:Ljava/lang/String;

    .line 109
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .registers 2
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->tag:Ljava/lang/Object;

    .line 85
    return-void
.end method

.method public setTextColor(I)V
    .registers 2
    .param p1, "textColor"    # I

    .prologue
    .line 136
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColor:I

    .line 137
    return-void
.end method

.method public setTextColorRes(I)V
    .registers 2
    .param p1, "textColorRes"    # I

    .prologue
    .line 144
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColorRes:I

    .line 145
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 155
    return-void
.end method

.method public withIdentifier(I)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 2
    .param p1, "identifier"    # I

    .prologue
    .line 35
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->identifier:I

    .line 36
    return-object p0
.end method

.method public withName(I)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 3
    .param p1, "nameRes"    # I

    .prologue
    .line 46
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->nameRes:I

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->name:Ljava/lang/String;

    .line 48
    return-object p0
.end method

.method public withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->name:Ljava/lang/String;

    .line 41
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->nameRes:I

    .line 42
    return-object p0
.end method

.method public bridge synthetic withName(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->withName(I)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withName(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->withName(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withTag(Ljava/lang/Object;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->tag:Ljava/lang/Object;

    .line 53
    return-object p0
.end method

.method public bridge synthetic withTag(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->withTag(Ljava/lang/Object;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withTextColor(I)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 2
    .param p1, "textColor"    # I

    .prologue
    .line 62
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColor:I

    .line 63
    return-object p0
.end method

.method public withTextColorRes(I)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 2
    .param p1, "textColorRes"    # I

    .prologue
    .line 67
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->textColorRes:I

    .line 68
    return-object p0
.end method

.method public withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;
    .registers 2
    .param p1, "typeface"    # Landroid/graphics/Typeface;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->typeface:Landroid/graphics/Typeface;

    .line 73
    return-object p0
.end method

.method public bridge synthetic withTypeface(Landroid/graphics/Typeface;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;->withTypeface(Landroid/graphics/Typeface;)Lcom/mikepenz/materialdrawer/model/SectionDrawerItem;

    move-result-object v0

    return-object v0
.end method
