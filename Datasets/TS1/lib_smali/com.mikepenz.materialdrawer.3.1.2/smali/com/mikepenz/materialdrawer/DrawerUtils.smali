.class Lcom/mikepenz/materialdrawer/DrawerUtils;
.super Ljava/lang/Object;
.source "DrawerUtils.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildStickyDrawerItemFooter(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/View$OnClickListener;)Landroid/view/ViewGroup;
    .registers 11
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "onClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/4 v8, -0x1

    const/4 v7, -0x2

    const/4 v6, 0x1

    .line 358
    new-instance v2, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-direct {v2, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 359
    .local v2, "linearLayout":Landroid/widget/LinearLayout;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 360
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 362
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_background:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_background:I

    invoke-static {v3, v4, v5}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 364
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_6e

    .line 366
    const/high16 v3, 0x40800000    # 4.0f

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v3, v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 375
    :cond_33
    :goto_33
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Ljava/lang/Boolean;

    if-eqz v3, :cond_6a

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_6a

    .line 376
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 377
    .local v0, "divider":Landroid/widget/LinearLayout;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 380
    .local v1, "dividerParams":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v3, 0x3f800000    # 1.0f

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v3, v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 381
    invoke-virtual {v0, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 382
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v4, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v5, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {v3, v4, v5}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 383
    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 386
    .end local v0    # "divider":Landroid/widget/LinearLayout;
    .end local v1    # "dividerParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_6a
    invoke-static {p0, v2, p1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->fillStickyDrawerItemFooter(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V

    .line 388
    return-object v2

    .line 369
    :cond_6e
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Ljava/lang/Boolean;

    if-nez v3, :cond_33

    .line 370
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Ljava/lang/Boolean;

    goto :goto_33
.end method

.method public static fillStickyDrawerItemFooter(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V
    .registers 13
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "onClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/4 v9, -0x1

    const/4 v8, 0x0

    .line 400
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 403
    .local v1, "layoutInflater":Landroid/view/LayoutInflater;
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_10
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_af

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 405
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v4, v6, v7}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v2

    .line 406
    .local v2, "selected_color":I
    instance-of v4, v0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    if-eqz v4, :cond_7b

    .line 407
    if-nez v2, :cond_6a

    move-object v4, v0

    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedColorRes()I

    move-result v4

    if-eq v4, v9, :cond_6a

    .line 408
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    move-object v4, v0

    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedColorRes()I

    move-result v4

    invoke-virtual {v6, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    .line 420
    :cond_4a
    :goto_4a
    const/4 v4, 0x0

    invoke-interface {v0, v1, v4, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->convertView(Landroid/view/LayoutInflater;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 421
    .local v3, "view":Landroid/view/View;
    invoke-virtual {v3, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 423
    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_66

    .line 424
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getSelectableBackground(Landroid/content/Context;I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 425
    invoke-virtual {v3, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 428
    :cond_66
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_10

    .end local v3    # "view":Landroid/view/View;
    :cond_6a
    move-object v4, v0

    .line 409
    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedColor()I

    move-result v4

    if-eqz v4, :cond_4a

    move-object v4, v0

    .line 410
    check-cast v4, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedColor()I

    move-result v2

    goto :goto_4a

    .line 412
    :cond_7b
    instance-of v4, v0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    if-eqz v4, :cond_4a

    .line 413
    if-nez v2, :cond_9e

    move-object v4, v0

    check-cast v4, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedColorRes()I

    move-result v4

    if-eq v4, v9, :cond_9e

    .line 414
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    move-object v4, v0

    check-cast v4, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedColorRes()I

    move-result v4

    invoke-virtual {v6, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    goto :goto_4a

    :cond_9e
    move-object v4, v0

    .line 415
    check-cast v4, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedColor()I

    move-result v4

    if-eqz v4, :cond_4a

    move-object v4, v0

    .line 416
    check-cast v4, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedColor()I

    move-result v2

    goto :goto_4a

    .line 431
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v2    # "selected_color":I
    :cond_af
    invoke-virtual {p1, v8, v8, v8, v8}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 432
    return-void
.end method

.method public static getFooterPositionFromIdentifier(Lcom/mikepenz/materialdrawer/DrawerBuilder;I)I
    .registers 6
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "identifier"    # I

    .prologue
    .line 163
    if-ltz p1, :cond_31

    .line 164
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v3, :cond_31

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    instance-of v3, v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_31

    .line 165
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    .line 167
    .local v0, "footer":Landroid/widget/LinearLayout;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_31

    .line 168
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 169
    .local v2, "o":Ljava/lang/Object;
    if-eqz v2, :cond_2e

    instance-of v3, v2, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    if-eqz v3, :cond_2e

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v3

    if-ne v3, p1, :cond_2e

    .line 176
    .end local v0    # "footer":Landroid/widget/LinearLayout;
    .end local v1    # "i":I
    :goto_2d
    return v1

    .line 167
    .restart local v0    # "footer":Landroid/widget/LinearLayout;
    .restart local v1    # "i":I
    :cond_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 176
    .end local v0    # "footer":Landroid/widget/LinearLayout;
    .end local v1    # "i":I
    :cond_31
    const/4 v1, -0x1

    goto :goto_2d
.end method

.method public static getPositionFromIdentifier(Lcom/mikepenz/materialdrawer/DrawerBuilder;I)I
    .registers 6
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "identifier"    # I

    .prologue
    .line 141
    if-ltz p1, :cond_23

    .line 142
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    if-eqz v2, :cond_23

    .line 143
    const/4 v1, 0x0

    .line 144
    .local v1, "position":I
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 145
    .local v0, "i":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v3

    if-ne v3, p1, :cond_20

    .line 153
    .end local v0    # "i":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v1    # "position":I
    :goto_1f
    return v1

    .line 148
    .restart local v0    # "i":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .restart local v1    # "position":I
    :cond_20
    add-int/lit8 v1, v1, 0x1

    .line 149
    goto :goto_d

    .line 153
    .end local v0    # "i":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v1    # "position":I
    :cond_23
    const/4 v1, -0x1

    goto :goto_1f
.end method

.method public static handleFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/View$OnClickListener;)V
    .registers 14
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "onClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/4 v11, 0x0

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 304
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v3, :cond_15

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_15

    .line 305
    invoke-static {p0, p1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->buildStickyDrawerItemFooter(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/View$OnClickListener;)Landroid/view/ViewGroup;

    move-result-object v3

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    .line 309
    :cond_15
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v3, :cond_82

    .line 311
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v1, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 312
    .local v1, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v3, 0xc

    invoke-virtual {v1, v3, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 313
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->sticky_footer:I

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setId(I)V

    .line 314
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    invoke-virtual {v3, v4, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 316
    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    if-nez v3, :cond_3b

    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    if-eqz v3, :cond_4c

    :cond_3b
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x13

    if-lt v3, v4, :cond_4c

    .line 317
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v4}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v3, v9, v9, v9, v4}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 321
    :cond_4c
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 322
    .local v2, "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v3, 0x2

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->sticky_footer:I

    invoke-virtual {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 323
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v2}, Landroid/widget/ListView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 326
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getPaddingLeft()I

    move-result v4

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getPaddingTop()I

    move-result v5

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v6}, Landroid/widget/ListView;->getPaddingRight()I

    move-result v6

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v7}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_padding:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 330
    .end local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2    # "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_82
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    if-eqz v3, :cond_c7

    .line 331
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    if-nez v3, :cond_92

    .line 332
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "can\'t use a footerView without a listView"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 335
    :cond_92
    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterDivider:Z

    if-eqz v3, :cond_c8

    .line 336
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    sget v4, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_footer:I

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v4, v5, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 337
    .local v0, "footerContainer":Landroid/widget/LinearLayout;
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    invoke-virtual {v0, v3, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 339
    sget v3, Lcom/mikepenz/materialdrawer/R$id;->divider:I

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v6, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {v4, v5, v6}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 341
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterClickable:Z

    invoke-virtual {v3, v0, v11, v4}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 343
    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    .line 348
    .end local v0    # "footerContainer":Landroid/widget/LinearLayout;
    :cond_c7
    :goto_c7
    return-void

    .line 345
    :cond_c8
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    iget-boolean v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterClickable:Z

    invoke-virtual {v3, v4, v11, v5}, Landroid/widget/ListView;->addFooterView(Landroid/view/View;Ljava/lang/Object;Z)V

    goto :goto_c7
.end method

.method public static handleHeaderView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V
    .registers 10
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 225
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;

    if-eqz v3, :cond_12

    .line 226
    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeaderSticky:Z

    if-eqz v3, :cond_59

    .line 227
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->getView()Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    .line 234
    :cond_12
    :goto_12
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    if-eqz v3, :cond_49

    .line 236
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v1, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 237
    .local v1, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v3, 0xa

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 238
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->sticky_header:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setId(I)V

    .line 239
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    invoke-virtual {v3, v4, v7, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 242
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 243
    .local v2, "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    const/4 v3, 0x3

    sget v4, Lcom/mikepenz/materialdrawer/R$id;->sticky_header:I

    invoke-virtual {v2, v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 244
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v2}, Landroid/widget/ListView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 247
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v7, v7, v7, v7}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 251
    .end local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2    # "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_49
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    if-eqz v3, :cond_ae

    .line 252
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    if-nez v3, :cond_62

    .line 253
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "can\'t use a headerView without a listView"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 229
    :cond_59
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->getView()Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    goto :goto_12

    .line 256
    :cond_62
    iget-boolean v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderDivider:Z

    if-eqz v3, :cond_af

    .line 257
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    sget v4, Lcom/mikepenz/materialdrawer/R$layout;->material_drawer_item_header:I

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v3, v4, v5, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 258
    .local v0, "headerContainer":Landroid/widget/LinearLayout;
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    invoke-virtual {v0, v3, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 260
    sget v3, Lcom/mikepenz/materialdrawer/R$id;->divider:I

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v6, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {v4, v5, v6}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 262
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderClickable:Z

    invoke-virtual {v3, v0, v8, v4}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 264
    iput-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    .line 269
    .end local v0    # "headerContainer":Landroid/widget/LinearLayout;
    :goto_97
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v4}, Landroid/widget/ListView;->getPaddingLeft()I

    move-result v4

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getPaddingRight()I

    move-result v5

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v6}, Landroid/widget/ListView;->getPaddingBottom()I

    move-result v6

    invoke-virtual {v3, v4, v7, v5, v6}, Landroid/widget/ListView;->setPadding(IIII)V

    .line 271
    :cond_ae
    return-void

    .line 266
    :cond_af
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    iget-boolean v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderClickable:Z

    invoke-virtual {v3, v4, v8, v5}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    goto :goto_97
.end method

.method public static onFooterDrawerItemClick(Lcom/mikepenz/materialdrawer/DrawerBuilder;Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;Z)V
    .registers 15
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "fireOnClick"    # Z

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, -0x1

    .line 34
    if-eqz p1, :cond_12

    instance-of v0, p1, Lcom/mikepenz/materialdrawer/model/interfaces/Checkable;

    if-eqz v0, :cond_12

    move-object v0, p1

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/Checkable;

    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/Checkable;->isCheckable()Z

    move-result v0

    if-eqz v0, :cond_6a

    :cond_12
    move v7, v2

    .line 35
    .local v7, "checkable":Z
    :goto_13
    if-eqz v7, :cond_52

    .line 36
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->resetStickyFooterSelection()V

    .line 38
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v0, v4, :cond_21

    .line 39
    invoke-virtual {p2, v2}, Landroid/view/View;->setActivated(Z)V

    .line 41
    :cond_21
    invoke-virtual {p2, v2}, Landroid/view/View;->setSelected(Z)V

    .line 44
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    invoke-virtual {v0, v3}, Landroid/widget/ListView;->setSelection(I)V

    .line 45
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    iget v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    add-int/2addr v2, v4

    invoke-virtual {v0, v2, v1}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 48
    iput v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 51
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_52

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    instance-of v0, v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_52

    .line 52
    iget-object v9, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v9, Landroid/widget/LinearLayout;

    .line 53
    .local v9, "footer":Landroid/widget/LinearLayout;
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_44
    invoke-virtual {v9}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-ge v10, v0, :cond_52

    .line 54
    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-ne v0, p2, :cond_6c

    .line 55
    iput v10, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentFooterSelection:I

    .line 63
    .end local v9    # "footer":Landroid/widget/LinearLayout;
    .end local v10    # "i":I
    :cond_52
    const/4 v8, 0x0

    .line 64
    .local v8, "consumed":Z
    if-eqz p3, :cond_64

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    if-eqz v0, :cond_64

    .line 65
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    const/4 v1, 0x0

    const-wide/16 v4, -0x1

    move-object v2, p2

    move-object v6, p1

    invoke-interface/range {v0 .. v6}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v8

    .line 68
    :cond_64
    if-nez v8, :cond_69

    .line 70
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->closeDrawerDelayed()V

    .line 72
    :cond_69
    return-void

    .end local v7    # "checkable":Z
    .end local v8    # "consumed":Z
    :cond_6a
    move v7, v1

    .line 34
    goto :goto_13

    .line 53
    .restart local v7    # "checkable":Z
    .restart local v9    # "footer":Landroid/widget/LinearLayout;
    .restart local v10    # "i":I
    :cond_6c
    add-int/lit8 v10, v10, 0x1

    goto :goto_44
.end method

.method public static processDrawerLayoutParams(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/support/v4/widget/DrawerLayout$LayoutParams;)Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    .registers 7
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "params"    # Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .prologue
    const/16 v4, 0x11

    const/4 v3, 0x0

    .line 442
    if-eqz p1, :cond_67

    .line 443
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    if-eqz v1, :cond_47

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x5

    if-eq v1, v2, :cond_1d

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const v2, 0x800005

    if-ne v1, v2, :cond_47

    .line 444
    :cond_1d
    iput v3, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->rightMargin:I

    .line 445
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v4, :cond_26

    .line 446
    invoke-virtual {p1, v3}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->setMarginEnd(I)V

    .line 449
    :cond_26
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_margin:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    .line 450
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v4, :cond_47

    .line 451
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_margin:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->setMarginEnd(I)V

    .line 455
    :cond_47
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentActionBarCompatibility:Z

    if-eqz v1, :cond_68

    .line 456
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getActionBarHeight(Landroid/content/Context;)I

    move-result v0

    .line 457
    .local v0, "topMargin":I
    iget-boolean v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentStatusBar:Z

    if-eqz v1, :cond_5c

    .line 458
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;)I

    move-result v1

    add-int/2addr v0, v1

    .line 460
    :cond_5c
    iput v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    .line 465
    .end local v0    # "topMargin":I
    :cond_5e
    :goto_5e
    iget v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    const/4 v2, -0x1

    if-le v1, v2, :cond_7e

    .line 466
    iget v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    iput v1, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->width:I

    .line 472
    :cond_67
    :goto_67
    return-object p1

    .line 461
    :cond_68
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    if-eqz v1, :cond_5e

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_5e

    .line 462
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;Z)I

    move-result v1

    iput v1, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    goto :goto_5e

    .line 468
    :cond_7e
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v1}, Lcom/mikepenz/materialdrawer/util/UIUtils;->getOptimalDrawerWidth(Landroid/content/Context;)I

    move-result v1

    iput v1, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->width:I

    goto :goto_67
.end method

.method public static rebuildFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V
    .registers 3
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .prologue
    .line 279
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_25

    .line 280
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_15

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_15

    .line 281
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 285
    :cond_15
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    new-instance v1, Lcom/mikepenz/materialdrawer/DrawerUtils$1;

    invoke-direct {v1, p0}, Lcom/mikepenz/materialdrawer/DrawerUtils$1;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-static {p0, v0, v1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->fillStickyDrawerItemFooter(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V

    .line 293
    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentFooterSelection:I

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setFooterSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)V

    .line 295
    :cond_25
    return-void
.end method

.method public static setFlag(Landroid/app/Activity;IZ)V
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "bits"    # I
    .param p2, "on"    # Z

    .prologue
    .line 208
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 209
    .local v0, "win":Landroid/view/Window;
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 210
    .local v1, "winParams":Landroid/view/WindowManager$LayoutParams;
    if-eqz p2, :cond_13

    .line 211
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/2addr v2, p1

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 215
    :goto_f
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 216
    return-void

    .line 213
    :cond_13
    iget v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    xor-int/lit8 v3, p1, -0x1

    and-int/2addr v2, v3

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_f
.end method

.method public static setFooterSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)V
    .registers 6
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 122
    const/4 v2, -0x1

    if-le p1, v2, :cond_2a

    .line 123
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v2, :cond_2a

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    instance-of v2, v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_2a

    .line 124
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    .line 126
    .local v1, "footer":Landroid/widget/LinearLayout;
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-le v2, p1, :cond_2a

    if-ltz p1, :cond_2a

    .line 127
    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 128
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {p0, v0, v2, p2}, Lcom/mikepenz/materialdrawer/DrawerUtils;->onFooterDrawerItemClick(Lcom/mikepenz/materialdrawer/DrawerBuilder;Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;Z)V

    .line 132
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v1    # "footer":Landroid/widget/LinearLayout;
    :cond_2a
    return-void
.end method

.method public static setListSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)Z
    .registers 4
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 83
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setListSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v0

    return v0
.end method

.method public static setListSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .registers 11
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Z
    .param p3, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    const/4 v1, 0x0

    const/4 v4, -0x1

    .line 96
    if-lt p1, v4, :cond_37

    .line 98
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    if-eqz v0, :cond_25

    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    add-int/2addr v0, p1

    if-le v0, v4, :cond_25

    .line 99
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->resetStickyFooterSelection()V

    .line 100
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    add-int/2addr v2, p1

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setSelection(I)V

    .line 101
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mListView:Landroid/widget/ListView;

    iget v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderOffset:I

    add-int/2addr v2, p1

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 102
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 103
    iput v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentFooterSelection:I

    .line 106
    :cond_25
    if-eqz p2, :cond_37

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    if-eqz v0, :cond_37

    .line 107
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    const-wide/16 v4, -0x1

    move-object v2, v1

    move v3, p1

    move-object v6, p3

    invoke-interface/range {v0 .. v6}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v0

    .line 111
    :goto_36
    return v0

    :cond_37
    const/4 v0, 0x0

    goto :goto_36
.end method

.method public static setTranslucentNavigationFlag(Landroid/app/Activity;Z)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "on"    # Z

    .prologue
    .line 196
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 197
    const/high16 v0, 0x8000000

    invoke-static {p0, v0, p1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setFlag(Landroid/app/Activity;IZ)V

    .line 199
    :cond_b
    return-void
.end method

.method public static setTranslucentStatusFlag(Landroid/app/Activity;Z)V
    .registers 4
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "on"    # Z

    .prologue
    .line 185
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_b

    .line 186
    const/high16 v0, 0x4000000

    invoke-static {p0, v0, p1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setFlag(Landroid/app/Activity;IZ)V

    .line 188
    :cond_b
    return-void
.end method
