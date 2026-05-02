.class public Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;
.source "PrimaryDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/ColorfulBadgeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/ColorfulBadgeable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private badge:Ljava/lang/String;

.field private badgeBackgroundRes:I

.field private badgeTextColor:I

.field private description:Ljava/lang/String;

.field private descriptionRes:I

.field private descriptionTextColor:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 19
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;-><init>()V

    .line 21
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionTextColor:I

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionRes:I

    .line 25
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeTextColor:I

    .line 26
    iput v1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeBackgroundRes:I

    .line 240
    return-void
.end method


# virtual methods
.method public convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 23
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 133
    invoke-virtual/range {p3 .. p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 137
    .local v2, "ctx":Landroid/content/Context;
    if-nez p2, :cond_17a

    .line 138
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getLayoutRes()I

    move-result v3

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 139
    new-instance v18, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;

    const/4 v3, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v3}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;-><init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$1;)V

    .line 140
    .local v18, "viewHolder":Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 146
    :goto_24
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v15

    .line 149
    .local v15, "selectedColor":I
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_182

    .line 150
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getTextColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getTextColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v13

    .line 154
    .local v13, "color":I
    :goto_4a
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedTextColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedTextColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v17

    .line 157
    .local v17, "selectedTextColor":I
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_194

    .line 158
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getIconColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getIconColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_icon:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_icon:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v6

    .line 162
    .local v6, "iconColor":I
    :goto_70
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedIconColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedIconColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v11

    .line 165
    .local v11, "selectedIconColor":I
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v3

    invoke-static {v15}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getDrawerItemBackground(I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 168
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getNameRes()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1a6

    .line 169
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getNameRes()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 175
    :goto_9d
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 176
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getDescriptionRes()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1b3

    .line 177
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getDescriptionRes()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 185
    :goto_b7
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getBadge()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1d1

    .line 186
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getBadge()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 193
    :goto_d0
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move/from16 v0, v17

    invoke-static {v13, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 194
    move-object/from16 v0, p0

    iget v3, v0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionTextColor:I

    if-eqz v3, :cond_1dc

    .line 195
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionTextColor:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 199
    :goto_ee
    move-object/from16 v0, p0

    iget v3, v0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeTextColor:I

    if-eqz v3, :cond_1eb

    .line 200
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeTextColor:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 205
    :goto_ff
    move-object/from16 v0, p0

    iget v3, v0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeBackgroundRes:I

    if-eqz v3, :cond_110

    .line 206
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeBackgroundRes:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 210
    :cond_110
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    if-eqz v3, :cond_137

    .line 211
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 212
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 213
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 217
    :cond_137
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getIconRes()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->isIconTinted()Z

    move-result v7

    invoke-static/range {v2 .. v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideIcon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Lcom/mikepenz/iconics/typeface/IIcon;IIZ)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    .line 218
    .local v14, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedIconRes()I

    move-result v10

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->isIconTinted()Z

    move-result v12

    move-object v7, v2

    invoke-static/range {v7 .. v12}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideIcon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Lcom/mikepenz/iconics/typeface/IIcon;IIZ)Landroid/graphics/drawable/Drawable;

    move-result-object v16

    .line 221
    .local v16, "selectedIcon":Landroid/graphics/drawable/Drawable;
    if-eqz v14, :cond_217

    .line 223
    if-eqz v16, :cond_1fa

    .line 224
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-static {v14, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getIconStateList(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 231
    :goto_171
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 237
    :goto_179
    return-object p2

    .line 142
    .end local v6    # "iconColor":I
    .end local v11    # "selectedIconColor":I
    .end local v13    # "color":I
    .end local v14    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v15    # "selectedColor":I
    .end local v16    # "selectedIcon":Landroid/graphics/drawable/Drawable;
    .end local v17    # "selectedTextColor":I
    .end local v18    # "viewHolder":Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;
    :cond_17a
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;

    .restart local v18    # "viewHolder":Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;
    goto/16 :goto_24

    .line 152
    .restart local v15    # "selectedColor":I
    :cond_182
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getDisabledTextColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getDisabledTextColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_hint_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_hint_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v13

    .restart local v13    # "color":I
    goto/16 :goto_4a

    .line 160
    .restart local v17    # "selectedTextColor":I
    :cond_194
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getDisabledIconColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getDisabledIconColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_hint_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_hint_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v6

    .restart local v6    # "iconColor":I
    goto/16 :goto_70

    .line 171
    .restart local v11    # "selectedIconColor":I
    :cond_1a6
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_9d

    .line 178
    :cond_1b3
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getDescription()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1c6

    .line 179
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_b7

    .line 181
    :cond_1c6
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_b7

    .line 189
    :cond_1d1
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_d0

    .line 197
    :cond_1dc
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move/from16 v0, v17

    invoke-static {v13, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto/16 :goto_ee

    .line 202
    :cond_1eb
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move/from16 v0, v17

    invoke-static {v13, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto/16 :goto_ff

    .line 225
    .restart local v14    # "icon":Landroid/graphics/drawable/Drawable;
    .restart local v16    # "selectedIcon":Landroid/graphics/drawable/Drawable;
    :cond_1fa
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->isIconTinted()Z

    move-result v3

    if-eqz v3, :cond_20e

    .line 226
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    new-instance v4, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;

    invoke-direct {v4, v14, v6, v11}, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_171

    .line 228
    :cond_20e
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {v3, v14}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_171

    .line 234
    :cond_217
    # getter for: Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto/16 :goto_179
.end method

.method public getBadge()Ljava/lang/String;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badge:Ljava/lang/String;

    return-object v0
.end method

.method public getBadgeBackgroundResource()I
    .registers 2

    .prologue
    .line 65
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeBackgroundRes:I

    return v0
.end method

.method public getBadgeTextColor()I
    .registers 2

    .prologue
    .line 107
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeTextColor:I

    return v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getDescriptionRes()I
    .registers 2

    .prologue
    .line 85
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionRes:I

    return v0
.end method

.method public getDescriptionTextColor()I
    .registers 2

    .prologue
    .line 94
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionTextColor:I

    return v0
.end method

.method public getLayoutRes()I
    .registers 2

    .prologue
    .line 128
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_primary:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 123
    const-string v0, "PRIMARY_ITEM"

    return-object v0
.end method

.method public setBadge(Ljava/lang/String;)V
    .registers 2
    .param p1, "badge"    # Ljava/lang/String;

    .prologue
    .line 117
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badge:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public setBadgeBackgroundResource(I)V
    .registers 2
    .param p1, "res"    # I

    .prologue
    .line 60
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeBackgroundRes:I

    .line 61
    return-void
.end method

.method public setBadgeTextColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 112
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeTextColor:I

    .line 113
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 80
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionRes:I

    .line 81
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->description:Ljava/lang/String;

    .line 82
    return-void
.end method

.method public setDescriptionRes(I)V
    .registers 3
    .param p1, "descriptionRes"    # I

    .prologue
    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->description:Ljava/lang/String;

    .line 90
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionRes:I

    .line 91
    return-void
.end method

.method public setDescriptionTextColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 98
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionTextColor:I

    .line 99
    return-void
.end method

.method public withBadge(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;
    .registers 2
    .param p1, "badge"    # Ljava/lang/String;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badge:Ljava/lang/String;

    .line 48
    return-object p0
.end method

.method public bridge synthetic withBadge(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withBadge(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withBadgeBackgroundResource(I)Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;
    .registers 2
    .param p1, "res"    # I

    .prologue
    .line 70
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeBackgroundRes:I

    .line 71
    return-object p0
.end method

.method public bridge synthetic withBadgeBackgroundResource(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withBadgeBackgroundResource(I)Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withBadgeTextColor(I)Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 53
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->badgeTextColor:I

    .line 54
    return-object p0
.end method

.method public bridge synthetic withBadgeTextColor(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->withBadgeTextColor(I)Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withDescription(I)Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;
    .registers 3
    .param p1, "descriptionRes"    # I

    .prologue
    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->description:Ljava/lang/String;

    .line 36
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionRes:I

    .line 37
    return-object p0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 29
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionRes:I

    .line 30
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->description:Ljava/lang/String;

    .line 31
    return-object p0
.end method

.method public withDescriptionTextColor(I)Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 41
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->descriptionTextColor:I

    .line 42
    return-object p0
.end method
