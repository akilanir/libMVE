.class public Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;
.source "SecondaryDrawerItem.java"

# interfaces
.implements Lcom/mikepenz/materialdrawer/model/interfaces/ColorfulBadgeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;",
        ">;",
        "Lcom/mikepenz/materialdrawer/model/interfaces/ColorfulBadgeable",
        "<",
        "Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private badge:Ljava/lang/String;

.field private badgeBackgroundRes:I

.field private badgeTextColor:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 19
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;-><init>()V

    .line 22
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeTextColor:I

    .line 23
    iput v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeBackgroundRes:I

    .line 174
    return-void
.end method


# virtual methods
.method public convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 23
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 83
    invoke-virtual/range {p3 .. p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 87
    .local v2, "ctx":Landroid/content/Context;
    if-nez p2, :cond_144

    .line 88
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getLayoutRes()I

    move-result v3

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 89
    new-instance v18, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;

    const/4 v3, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v3}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;-><init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$1;)V

    .line 90
    .local v18, "viewHolder":Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 96
    :goto_24
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v15

    .line 99
    .local v15, "selectedColor":I
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_14c

    .line 100
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getTextColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getTextColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_secondary_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_secondary_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v13

    .line 104
    .local v13, "color":I
    :goto_4a
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedTextColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedTextColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v17

    .line 107
    .local v17, "selectedTextColor":I
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_15e

    .line 108
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getIconColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getIconColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_icon:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_icon:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v6

    .line 112
    .local v6, "iconColor":I
    :goto_70
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedIconColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedIconColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v11

    .line 115
    .local v11, "selectedIconColor":I
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v3

    invoke-static {v15}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getDrawerItemBackground(I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 118
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getNameRes()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_170

    .line 119
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getNameRes()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 125
    :goto_9d
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getBadge()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_17d

    .line 126
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getBadge()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 133
    :goto_b6
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move/from16 v0, v17

    invoke-static {v13, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 134
    move-object/from16 v0, p0

    iget v3, v0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeTextColor:I

    if-eqz v3, :cond_188

    .line 135
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeTextColor:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 140
    :goto_d4
    move-object/from16 v0, p0

    iget v3, v0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeBackgroundRes:I

    if-eqz v3, :cond_e5

    .line 141
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeBackgroundRes:I

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 145
    :cond_e5
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    if-eqz v3, :cond_101

    .line 146
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 147
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 151
    :cond_101
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getIconRes()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->isIconTinted()Z

    move-result v7

    invoke-static/range {v2 .. v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideIcon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Lcom/mikepenz/iconics/typeface/IIcon;IIZ)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    .line 152
    .local v14, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedIconRes()I

    move-result v10

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->isIconTinted()Z

    move-result v12

    move-object v7, v2

    invoke-static/range {v7 .. v12}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideIcon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Lcom/mikepenz/iconics/typeface/IIcon;IIZ)Landroid/graphics/drawable/Drawable;

    move-result-object v16

    .line 155
    .local v16, "selectedIcon":Landroid/graphics/drawable/Drawable;
    if-eqz v14, :cond_1b2

    .line 157
    if-eqz v16, :cond_197

    .line 158
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-static {v14, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getIconStateList(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 165
    :goto_13b
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 171
    :goto_143
    return-object p2

    .line 92
    .end local v6    # "iconColor":I
    .end local v11    # "selectedIconColor":I
    .end local v13    # "color":I
    .end local v14    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v15    # "selectedColor":I
    .end local v16    # "selectedIcon":Landroid/graphics/drawable/Drawable;
    .end local v17    # "selectedTextColor":I
    .end local v18    # "viewHolder":Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;
    :cond_144
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;

    .restart local v18    # "viewHolder":Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;
    goto/16 :goto_24

    .line 102
    .restart local v15    # "selectedColor":I
    :cond_14c
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getDisabledTextColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getDisabledTextColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_hint_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_hint_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v13

    .restart local v13    # "color":I
    goto/16 :goto_4a

    .line 110
    .restart local v17    # "selectedTextColor":I
    :cond_15e
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getDisabledIconColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getDisabledIconColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_hint_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_hint_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v6

    .restart local v6    # "iconColor":I
    goto/16 :goto_70

    .line 121
    .restart local v11    # "selectedIconColor":I
    :cond_170
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_9d

    .line 129
    :cond_17d
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_b6

    .line 137
    :cond_188
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->badge:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move/from16 v0, v17

    invoke-static {v13, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto/16 :goto_d4

    .line 159
    .restart local v14    # "icon":Landroid/graphics/drawable/Drawable;
    .restart local v16    # "selectedIcon":Landroid/graphics/drawable/Drawable;
    :cond_197
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->isIconTinted()Z

    move-result v3

    if-eqz v3, :cond_1aa

    .line 160
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    new-instance v4, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;

    invoke-direct {v4, v14, v6, v11}, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_13b

    .line 162
    :cond_1aa
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {v3, v14}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_13b

    .line 168
    :cond_1b2
    # getter for: Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;->access$400(Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_143
.end method

.method public getBadge()Ljava/lang/String;
    .registers 2

    .prologue
    .line 31
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badge:Ljava/lang/String;

    return-object v0
.end method

.method public getBadgeBackgroundResource()I
    .registers 2

    .prologue
    .line 62
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeBackgroundRes:I

    return v0
.end method

.method public getBadgeTextColor()I
    .registers 2

    .prologue
    .line 47
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeTextColor:I

    return v0
.end method

.method public getLayoutRes()I
    .registers 2

    .prologue
    .line 78
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_secondary:I

    return v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    const-string v0, "SECONDARY_ITEM"

    return-object v0
.end method

.method public setBadge(Ljava/lang/String;)V
    .registers 2
    .param p1, "badge"    # Ljava/lang/String;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badge:Ljava/lang/String;

    .line 37
    return-void
.end method

.method public setBadgeBackgroundResource(I)V
    .registers 2
    .param p1, "res"    # I

    .prologue
    .line 57
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeBackgroundRes:I

    .line 58
    return-void
.end method

.method public setBadgeTextColor(I)V
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 52
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeTextColor:I

    .line 53
    return-void
.end method

.method public withBadge(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;
    .registers 2
    .param p1, "badge"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badge:Ljava/lang/String;

    .line 27
    return-object p0
.end method

.method public bridge synthetic withBadge(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withBadge(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withBadgeBackgroundResource(I)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;
    .registers 2
    .param p1, "res"    # I

    .prologue
    .line 67
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeBackgroundRes:I

    .line 68
    return-object p0
.end method

.method public bridge synthetic withBadgeBackgroundResource(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withBadgeBackgroundResource(I)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withBadgeTextColor(I)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;
    .registers 2
    .param p1, "color"    # I

    .prologue
    .line 41
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->badgeTextColor:I

    .line 42
    return-object p0
.end method

.method public bridge synthetic withBadgeTextColor(I)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->withBadgeTextColor(I)Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    move-result-object v0

    return-object v0
.end method
