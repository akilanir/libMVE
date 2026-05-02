.class public Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
.super Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;
.source "ToggleDrawerItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/mikepenz/materialdrawer/model/BaseDrawerItem",
        "<",
        "Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;",
        ">;"
    }
.end annotation


# instance fields
.field private checkable:Z

.field private checked:Z

.field private checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

.field private description:Ljava/lang/String;

.field private descriptionRes:I

.field private onCheckedChangeListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;

.field private toggleEnabled:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 21
    invoke-direct {p0}, Lcom/mikepenz/materialdrawer/model/BaseDrawerItem;-><init>()V

    .line 23
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->descriptionRes:I

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    .line 27
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checkable:Z

    .line 28
    iput-boolean v1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;

    .line 243
    new-instance v0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$2;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$2;-><init>(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    return-void
.end method

.method static synthetic access$400(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;)Z
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    .prologue
    .line 21
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    return v0
.end method

.method static synthetic access$702(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .param p1, "x1"    # Z

    .prologue
    .line 21
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    return p1
.end method


# virtual methods
.method public convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 23
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 127
    invoke-virtual/range {p3 .. p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 130
    .local v2, "ctx":Landroid/content/Context;
    if-nez p2, :cond_167

    .line 131
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getLayoutRes()I

    move-result v3

    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 132
    new-instance v18, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;

    const/4 v3, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v3}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;-><init>(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;)V

    .line 133
    .local v18, "viewHolder":Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 139
    :goto_24
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getSelectedColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getSelectedColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v15

    .line 142
    .local v15, "selectedColor":I
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_16f

    .line 143
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getTextColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getTextColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v13

    .line 147
    .local v13, "color":I
    :goto_4a
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getSelectedTextColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getSelectedTextColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v17

    .line 150
    .local v17, "selectedTextColor":I
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_181

    .line 151
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getIconColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getIconColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_primary_icon:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_primary_icon:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v6

    .line 155
    .local v6, "iconColor":I
    :goto_70
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getSelectedIconColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getSelectedIconColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v11

    .line 158
    .local v11, "selectedIconColor":I
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v3

    invoke-static {v15}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getDrawerItemBackground(I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 161
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getNameRes()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_193

    .line 162
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getNameRes()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 168
    :goto_9d
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 169
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getDescriptionRes()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1a0

    .line 170
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getDescriptionRes()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 178
    :goto_b7
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->isCheckable()Z

    move-result v3

    if-nez v3, :cond_cd

    .line 179
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->view:Landroid/view/View;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$100(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/view/View;

    move-result-object v3

    new-instance v4, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v4, v0, v1}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$1;-><init>(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 189
    :cond_cd
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v3

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    invoke-virtual {v3, v4}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 190
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checkedChangeListener:Landroid/widget/CompoundButton$OnCheckedChangeListener;

    invoke-virtual {v3, v4}, Landroid/widget/ToggleButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 191
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->toggle:Landroid/widget/ToggleButton;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$500(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ToggleButton;

    move-result-object v3

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    invoke-virtual {v3, v4}, Landroid/widget/ToggleButton;->setEnabled(Z)V

    .line 194
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move/from16 v0, v17

    invoke-static {v13, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 195
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    move/from16 v0, v17

    invoke-static {v13, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getTextColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 198
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v3

    if-eqz v3, :cond_124

    .line 199
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 200
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 204
    :cond_124
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v4

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getIconRes()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->isIconTinted()Z

    move-result v7

    invoke-static/range {v2 .. v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideIcon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Lcom/mikepenz/iconics/typeface/IIcon;IIZ)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    .line 205
    .local v14, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getSelectedIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getIIcon()Lcom/mikepenz/iconics/typeface/IIcon;

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getSelectedIconRes()I

    move-result v10

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->isIconTinted()Z

    move-result v12

    move-object v7, v2

    invoke-static/range {v7 .. v12}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideIcon(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Lcom/mikepenz/iconics/typeface/IIcon;IIZ)Landroid/graphics/drawable/Drawable;

    move-result-object v16

    .line 208
    .local v16, "selectedIcon":Landroid/graphics/drawable/Drawable;
    if-eqz v14, :cond_1d9

    .line 210
    if-eqz v16, :cond_1be

    .line 211
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$600(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-static {v14, v0}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getIconStateList(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 218
    :goto_15e
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$600(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 224
    :goto_166
    return-object p2

    .line 135
    .end local v6    # "iconColor":I
    .end local v11    # "selectedIconColor":I
    .end local v13    # "color":I
    .end local v14    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v15    # "selectedColor":I
    .end local v16    # "selectedIcon":Landroid/graphics/drawable/Drawable;
    .end local v17    # "selectedTextColor":I
    .end local v18    # "viewHolder":Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;
    :cond_167
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;

    .restart local v18    # "viewHolder":Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;
    goto/16 :goto_24

    .line 145
    .restart local v15    # "selectedColor":I
    :cond_16f
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getDisabledTextColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getDisabledTextColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_hint_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_hint_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v13

    .restart local v13    # "color":I
    goto/16 :goto_4a

    .line 153
    .restart local v17    # "selectedTextColor":I
    :cond_181
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getDisabledIconColor()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getDisabledIconColorRes()I

    move-result v4

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_hint_text:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_hint_text:I

    invoke-static {v2, v3, v4, v5, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->decideColor(Landroid/content/Context;IIII)I

    move-result v6

    .restart local v6    # "iconColor":I
    goto/16 :goto_70

    .line 164
    .restart local v11    # "selectedIconColor":I
    :cond_193
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->name:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$200(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_9d

    .line 171
    :cond_1a0
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getDescription()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1b3

    .line 172
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->getDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_b7

    .line 174
    :cond_1b3
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->description:Landroid/widget/TextView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$300(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto/16 :goto_b7

    .line 212
    .restart local v14    # "icon":Landroid/graphics/drawable/Drawable;
    .restart local v16    # "selectedIcon":Landroid/graphics/drawable/Drawable;
    :cond_1be
    invoke-virtual/range {p0 .. p0}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->isIconTinted()Z

    move-result v3

    if-eqz v3, :cond_1d1

    .line 213
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$600(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    new-instance v4, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;

    invoke-direct {v4, v14, v6, v11}, Lcom/mikepenz/materialdrawer/util/PressedEffectStateListDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_15e

    .line 215
    :cond_1d1
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$600(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {v3, v14}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_15e

    .line 221
    :cond_1d9
    # getter for: Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->icon:Landroid/widget/ImageView;
    invoke-static/range {v18 .. v18}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;->access$600(Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem$ViewHolder;)Landroid/widget/ImageView;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_166
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getDescriptionRes()I
    .registers 2

    .prologue
    .line 73
    iget v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->descriptionRes:I

    return v0
.end method

.method public getLayoutRes()I
    .registers 2

    .prologue
    .line 122
    sget v0, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_toggle:I

    return v0
.end method

.method public getOnCheckedChangeListener()Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 117
    const-string v0, "TOGGLE_ITEM"

    return-object v0
.end method

.method public isCheckable()Z
    .registers 2

    .prologue
    .line 107
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checkable:Z

    return v0
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    return v0
.end method

.method public isToggleEnabled()Z
    .registers 2

    .prologue
    .line 90
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    return v0
.end method

.method public setCheckable(Z)V
    .registers 2
    .param p1, "checkable"    # Z

    .prologue
    .line 112
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checkable:Z

    .line 113
    return-void
.end method

.method public setChecked(Z)V
    .registers 2
    .param p1, "checked"    # Z

    .prologue
    .line 86
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    .line 87
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 68
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->descriptionRes:I

    .line 69
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->description:Ljava/lang/String;

    .line 70
    return-void
.end method

.method public setDescriptionRes(I)V
    .registers 3
    .param p1, "descriptionRes"    # I

    .prologue
    .line 77
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->description:Ljava/lang/String;

    .line 78
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->descriptionRes:I

    .line 79
    return-void
.end method

.method public setOnCheckedChangeListener(Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;)V
    .registers 2
    .param p1, "onCheckedChangeListener"    # Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;

    .line 103
    return-void
.end method

.method public setToggleEnabled(Z)V
    .registers 2
    .param p1, "toggleEnabled"    # Z

    .prologue
    .line 94
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    .line 95
    return-void
.end method

.method public withCheckable(Z)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .registers 2
    .param p1, "checkable"    # Z

    .prologue
    .line 59
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checkable:Z

    .line 60
    return-object p0
.end method

.method public bridge synthetic withCheckable(Z)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 21
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->withCheckable(Z)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;

    move-result-object v0

    return-object v0
.end method

.method public withChecked(Z)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .registers 2
    .param p1, "checked"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->checked:Z

    .line 45
    return-object p0
.end method

.method public withDescription(I)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .registers 3
    .param p1, "descriptionRes"    # I

    .prologue
    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->description:Ljava/lang/String;

    .line 39
    iput p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->descriptionRes:I

    .line 40
    return-object p0
.end method

.method public withDescription(Ljava/lang/String;)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .registers 3
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 32
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->descriptionRes:I

    .line 33
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->description:Ljava/lang/String;

    .line 34
    return-object p0
.end method

.method public withOnCheckedChangeListener(Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .registers 2
    .param p1, "onCheckedChangeListener"    # Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->onCheckedChangeListener:Lcom/mikepenz/materialdrawer/model/interfaces/OnCheckedChangeListener;

    .line 55
    return-object p0
.end method

.method public withToggleEnabled(Z)Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;
    .registers 2
    .param p1, "toggleEnabled"    # Z

    .prologue
    .line 49
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/model/ToggleDrawerItem;->toggleEnabled:Z

    .line 50
    return-object p0
.end method
