.class Lcom/mikepenz/materialdrawer/DrawerUtils;
.super Ljava/lang/Object;
.source "DrawerUtils.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildStickyDrawerItemFooter(Landroid/content/Context;Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/View$OnClickListener;)Landroid/view/ViewGroup;
    .registers 11
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p2, "onClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/4 v7, 0x1

    const/4 v6, -0x1

    const/4 v5, -0x2

    .line 344
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 345
    .local v2, "linearLayout":Landroid/widget/LinearLayout;
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 346
    invoke-virtual {v2, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 348
    sget v3, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_background:I

    sget v4, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_background:I

    invoke-static {p0, v3, v4}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 351
    iget-boolean v3, p1, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterDivider:Z

    if-eqz v3, :cond_47

    .line 352
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 353
    .local v0, "divider":Landroid/widget/LinearLayout;
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v6, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 356
    .local v1, "dividerParams":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, p0}, Lcom/mikepenz/materialize/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    .line 357
    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 358
    sget v3, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_divider:I

    sget v4, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_divider:I

    invoke-static {p0, v3, v4}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 359
    invoke-virtual {v2, v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 362
    .end local v0    # "divider":Landroid/widget/LinearLayout;
    .end local v1    # "dividerParams":Landroid/widget/LinearLayout$LayoutParams;
    :cond_47
    invoke-static {p1, v2, p2}, Lcom/mikepenz/materialdrawer/DrawerUtils;->fillStickyDrawerItemFooter(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V

    .line 364
    return-object v2
.end method

.method public static fillStickyDrawerItemFooter(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V
    .registers 12
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "onClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/4 v8, 0x0

    .line 376
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_74

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 378
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    sget v5, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v6, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v3, v5, v6}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v1

    .line 379
    .local v1, "selected_color":I
    instance-of v3, v0, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    if-eqz v3, :cond_5c

    move-object v3, v0

    .line 380
    check-cast v3, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/model/PrimaryDrawerItem;->getSelectedColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v3, v5, v6, v7}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v1

    .line 385
    :cond_36
    :goto_36
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-interface {v0, v3, p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->generateView(Landroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 386
    .local v2, "view":Landroid/view/View;
    invoke-virtual {v2, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 388
    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_55

    .line 389
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getSelectableBackground(Landroid/content/Context;I)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 390
    invoke-virtual {v2, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 393
    :cond_55
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 396
    invoke-static {v2}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->setDrawerVerticalPadding(Landroid/view/View;)V

    goto :goto_7

    .line 381
    .end local v2    # "view":Landroid/view/View;
    :cond_5c
    instance-of v3, v0, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    if-eqz v3, :cond_36

    move-object v3, v0

    .line 382
    check-cast v3, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/model/SecondaryDrawerItem;->getSelectedColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v3

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_selected:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_selected:I

    invoke-static {v3, v5, v6, v7}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I

    move-result v1

    goto :goto_36

    .line 399
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v1    # "selected_color":I
    :cond_74
    invoke-virtual {p1, v8, v8, v8, v8}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 400
    return-void
.end method

.method public static getPositionByIdentifier(Lcom/mikepenz/materialdrawer/DrawerBuilder;I)I
    .registers 5
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "identifier"    # I

    .prologue
    .line 142
    if-ltz p1, :cond_1b

    .line 143
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v0

    .line 144
    .local v0, "adapter":Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItemCount()I

    move-result v2

    if-ge v1, v2, :cond_1b

    .line 145
    invoke-virtual {v0, v1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->getItem(I)Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    move-result-object v2

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v2

    if-ne v2, p1, :cond_18

    .line 151
    .end local v0    # "adapter":Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
    .end local v1    # "i":I
    :goto_17
    return v1

    .line 144
    .restart local v0    # "adapter":Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
    .restart local v1    # "i":I
    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 151
    .end local v0    # "adapter":Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;
    .end local v1    # "i":I
    :cond_1b
    const/4 v1, -0x1

    goto :goto_17
.end method

.method public static getStickyFooterPositionByIdentifier(Lcom/mikepenz/materialdrawer/DrawerBuilder;I)I
    .registers 6
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "identifier"    # I

    .prologue
    .line 161
    if-ltz p1, :cond_31

    .line 162
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v3, :cond_31

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    instance-of v3, v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_31

    .line 163
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    .line 165
    .local v0, "footer":Landroid/widget/LinearLayout;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_31

    .line 166
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 167
    .local v2, "o":Ljava/lang/Object;
    if-eqz v2, :cond_2e

    instance-of v3, v2, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    if-eqz v3, :cond_2e

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;->getIdentifier()I

    move-result v3

    if-ne v3, p1, :cond_2e

    .line 174
    .end local v0    # "footer":Landroid/widget/LinearLayout;
    .end local v1    # "i":I
    :goto_2d
    return v1

    .line 165
    .restart local v0    # "footer":Landroid/widget/LinearLayout;
    .restart local v1    # "i":I
    :cond_2e
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 174
    .end local v0    # "footer":Landroid/widget/LinearLayout;
    .end local v1    # "i":I
    :cond_31
    const/4 v1, -0x1

    goto :goto_2d
.end method

.method public static handleFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/View$OnClickListener;)V
    .registers 14
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "onClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    const/4 v8, 0x2

    const/4 v7, -0x1

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 283
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 286
    .local v0, "ctx":Landroid/content/Context;
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    if-eqz v4, :cond_1c

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyDrawerItems:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_1c

    .line 287
    invoke-static {v0, p0, p1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->buildStickyDrawerItemFooter(Landroid/content/Context;Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/View$OnClickListener;)Landroid/view/ViewGroup;

    move-result-object v4

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    .line 291
    :cond_1c
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v4, :cond_b5

    .line 293
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v1, v7, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 294
    .local v1, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v4, 0xc

    invoke-virtual {v1, v4, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 295
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_sticky_footer:I

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->setId(I)V

    .line 296
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    invoke-virtual {v4, v5, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 298
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mTranslucentNavigationBar:Z

    if-nez v4, :cond_41

    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFullscreen:Z

    if-eqz v4, :cond_50

    :cond_41
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x13

    if-lt v4, v5, :cond_50

    .line 299
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    invoke-static {v0}, Lcom/mikepenz/materialize/util/UIUtils;->getNavigationBarHeight(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v4, v10, v10, v10, v5}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 303
    :cond_50
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 304
    .local v2, "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    sget v4, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_sticky_footer:I

    invoke-virtual {v2, v8, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 305
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 308
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadow:Z

    if-eqz v4, :cond_94

    .line 309
    new-instance v4, Landroid/view/View;

    invoke-direct {v4, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadowView:Landroid/view/View;

    .line 310
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadowView:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_shadow_top:I

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 311
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadowView:Landroid/view/View;

    const/high16 v6, 0x40800000    # 4.0f

    invoke-static {v6, v0}, Lcom/mikepenz/materialize/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v4, v5, v7, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;II)V

    .line 313
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadowView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 314
    .local v3, "lps":Landroid/widget/RelativeLayout$LayoutParams;
    sget v4, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_sticky_footer:I

    invoke-virtual {v3, v8, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 315
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterShadowView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 319
    .end local v3    # "lps":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_94
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v5

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v6

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v7

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_padding:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 323
    .end local v1    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2    # "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_b5
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    if-eqz v4, :cond_e5

    .line 324
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-nez v4, :cond_c5

    .line 325
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "can\'t use a footerView without a recyclerView"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 328
    :cond_c5
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterDivider:Z

    if-eqz v4, :cond_e6

    .line 329
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    new-array v5, v11, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    new-instance v6, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    invoke-direct {v6}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;-><init>()V

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    invoke-virtual {v6, v7}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withView(Landroid/view/View;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v6

    sget-object v7, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;->BOTTOM:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    invoke-virtual {v6, v7}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withViewPosition(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addFooterDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 334
    :cond_e5
    :goto_e5
    return-void

    .line 331
    :cond_e6
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    new-array v5, v11, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    new-instance v6, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    invoke-direct {v6}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;-><init>()V

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mFooterView:Landroid/view/View;

    invoke-virtual {v6, v7}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withView(Landroid/view/View;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v6

    sget-object v7, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;->NONE:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    invoke-virtual {v6, v7}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withViewPosition(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addFooterDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    goto :goto_e5
.end method

.method public static handleHeaderView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V
    .registers 14
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .prologue
    const/4 v12, 0x3

    const/4 v11, -0x1

    const/high16 v10, 0x40800000    # 4.0f

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 184
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    if-eqz v4, :cond_16

    .line 185
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeaderSticky:Z

    if-eqz v4, :cond_7a

    .line 186
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/AccountHeader;->getView()Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    .line 194
    :cond_16
    :goto_16
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    if-eqz v4, :cond_6a

    .line 196
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v0, v11, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 197
    .local v0, "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v4, 0xa

    invoke-virtual {v0, v4, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 198
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    sget v5, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_sticky_header:I

    invoke-virtual {v4, v5}, Landroid/view/View;->setId(I)V

    .line 199
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    invoke-virtual {v4, v5, v8, v0}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 202
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 203
    .local v1, "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    sget v4, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_sticky_header:I

    invoke-virtual {v1, v12, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 204
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 207
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    sget v6, Lcom/mikepenz/materialdrawer/R$attr;->material_drawer_background:I

    sget v7, Lcom/mikepenz/materialdrawer/R$color;->material_drawer_background:I

    invoke-static {v5, v6, v7}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 210
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-lt v4, v5, :cond_8b

    .line 211
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyHeaderView:Landroid/view/View;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v10, v5}, Lcom/mikepenz/materialize/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v5

    invoke-virtual {v4, v5}, Landroid/view/View;->setElevation(F)V

    .line 223
    :goto_65
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v8, v8, v8, v8}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 227
    .end local v0    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v1    # "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_6a
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    if-eqz v4, :cond_e9

    .line 228
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-nez v4, :cond_b2

    .line 229
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "can\'t use a headerView without a recyclerView"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 188
    :cond_7a
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    invoke-virtual {v4}, Lcom/mikepenz/materialdrawer/AccountHeader;->getView()Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    .line 189
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAccountHeader:Lcom/mikepenz/materialdrawer/AccountHeader;

    iget-object v4, v4, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-boolean v4, v4, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDividerBelowHeader:Z

    iput-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderDivider:Z

    goto :goto_16

    .line 213
    .restart local v0    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .restart local v1    # "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_8b
    new-instance v3, Landroid/view/View;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-direct {v3, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 214
    .local v3, "view":Landroid/view/View;
    sget v4, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_shadow_bottom:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundResource(I)V

    .line 215
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v10, v5}, Lcom/mikepenz/materialize/util/UIUtils;->convertDpToPixel(FLandroid/content/Context;)F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v4, v3, v11, v5}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;II)V

    .line 217
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/RelativeLayout$LayoutParams;

    .line 218
    .local v2, "lps":Landroid/widget/RelativeLayout$LayoutParams;
    sget v4, Lcom/mikepenz/materialdrawer/R$id;->material_drawer_sticky_header:I

    invoke-virtual {v2, v12, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 219
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_65

    .line 232
    .end local v0    # "layoutParams":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v1    # "layoutParamsListView":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v2    # "lps":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v3    # "view":Landroid/view/View;
    :cond_b2
    iget-boolean v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderDivider:Z

    if-eqz v4, :cond_ea

    .line 233
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    new-array v5, v9, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    new-instance v6, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    invoke-direct {v6}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;-><init>()V

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    invoke-virtual {v6, v7}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withView(Landroid/view/View;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v6

    sget-object v7, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;->TOP:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    invoke-virtual {v6, v7}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withViewPosition(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addHeaderDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    .line 238
    :goto_d2
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v5

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v6

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v7

    invoke-virtual {v4, v5, v8, v6, v7}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 240
    :cond_e9
    return-void

    .line 235
    :cond_ea
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    new-array v5, v9, [Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    new-instance v6, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    invoke-direct {v6}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;-><init>()V

    iget-object v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mHeaderView:Landroid/view/View;

    invoke-virtual {v6, v7}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withView(Landroid/view/View;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v6

    sget-object v7, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;->NONE:Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;

    invoke-virtual {v6, v7}, Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;->withViewPosition(Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem$Position;)Lcom/mikepenz/materialdrawer/model/ContainerDrawerItem;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-virtual {v4, v5}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->addHeaderDrawerItems([Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)V

    goto :goto_d2
.end method

.method public static onFooterDrawerItemClick(Lcom/mikepenz/materialdrawer/DrawerBuilder;Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;Ljava/lang/Boolean;)V
    .registers 12
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "fireOnClick"    # Ljava/lang/Boolean;

    .prologue
    const/4 v5, 0x1

    const/4 v7, -0x1

    .line 35
    if-eqz p1, :cond_11

    instance-of v4, p1, Lcom/mikepenz/materialdrawer/model/interfaces/Selectable;

    if-eqz v4, :cond_11

    move-object v4, p1

    check-cast v4, Lcom/mikepenz/materialdrawer/model/interfaces/Selectable;

    invoke-interface {v4}, Lcom/mikepenz/materialdrawer/model/interfaces/Selectable;->isSelectable()Z

    move-result v4

    if-eqz v4, :cond_63

    :cond_11
    move v0, v5

    .line 36
    .local v0, "checkable":Z
    :goto_12
    if-eqz v0, :cond_4a

    .line 37
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->resetStickyFooterSelection()V

    .line 39
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0xb

    if-lt v4, v6, :cond_20

    .line 40
    invoke-virtual {p2, v5}, Landroid/view/View;->setActivated(Z)V

    .line 42
    :cond_20
    invoke-virtual {p2, v5}, Landroid/view/View;->setSelected(Z)V

    .line 45
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->getAdapter()Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v7}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->handleSelection(Landroid/view/View;I)V

    .line 48
    iput v7, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 51
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v4, :cond_4a

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    instance-of v4, v4, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_4a

    .line 52
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v2, Landroid/widget/LinearLayout;

    .line 53
    .local v2, "footer":Landroid/widget/LinearLayout;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3c
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    if-ge v3, v4, :cond_4a

    .line 54
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    if-ne v4, p2, :cond_65

    .line 55
    iput v3, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentStickyFooterSelection:I

    .line 63
    .end local v2    # "footer":Landroid/widget/LinearLayout;
    .end local v3    # "i":I
    :cond_4a
    if-eqz p3, :cond_62

    .line 64
    const/4 v1, 0x0

    .line 65
    .local v1, "consumed":Z
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_5d

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    if-eqz v4, :cond_5d

    .line 66
    iget-object v4, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    invoke-interface {v4, p2, v7, p1}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v1

    .line 69
    :cond_5d
    if-nez v1, :cond_62

    .line 71
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->closeDrawerDelayed()V

    .line 74
    .end local v1    # "consumed":Z
    :cond_62
    return-void

    .line 35
    .end local v0    # "checkable":Z
    :cond_63
    const/4 v0, 0x0

    goto :goto_12

    .line 53
    .restart local v0    # "checkable":Z
    .restart local v2    # "footer":Landroid/widget/LinearLayout;
    .restart local v3    # "i":I
    :cond_65
    add-int/lit8 v3, v3, 0x1

    goto :goto_3c
.end method

.method public static processDrawerLayoutParams(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/support/v4/widget/DrawerLayout$LayoutParams;)Landroid/support/v4/widget/DrawerLayout$LayoutParams;
    .registers 6
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "params"    # Landroid/support/v4/widget/DrawerLayout$LayoutParams;

    .prologue
    const/16 v3, 0x11

    const/4 v2, 0x0

    .line 410
    if-eqz p1, :cond_6b

    .line 411
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    if-eqz v0, :cond_47

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1d

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerGravity:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const v1, 0x800005

    if-ne v0, v1, :cond_47

    .line 412
    :cond_1d
    iput v2, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->rightMargin:I

    .line 413
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v3, :cond_26

    .line 414
    invoke-virtual {p1, v2}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->setMarginEnd(I)V

    .line 417
    :cond_26
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_margin:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->leftMargin:I

    .line 418
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v3, :cond_47

    .line 419
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/mikepenz/materialdrawer/R$dimen;->material_drawer_margin:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->setMarginEnd(I)V

    .line 423
    :cond_47
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    if-eqz v0, :cond_62

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDisplayBelowStatusBar:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_62

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_62

    .line 424
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/mikepenz/materialize/util/UIUtils;->getStatusBarHeight(Landroid/content/Context;Z)I

    move-result v0

    iput v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->topMargin:I

    .line 427
    :cond_62
    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_6c

    .line 428
    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mDrawerWidth:I

    iput v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->width:I

    .line 434
    :cond_6b
    :goto_6b
    return-object p1

    .line 430
    :cond_6c
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/util/DrawerUIUtils;->getOptimalDrawerWidth(Landroid/content/Context;)I

    move-result v0

    iput v0, p1, Landroid/support/v4/widget/DrawerLayout$LayoutParams;->width:I

    goto :goto_6b
.end method

.method public static rebuildStickyFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V
    .registers 4
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;

    .prologue
    const/4 v2, 0x0

    .line 248
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mSliderLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_26

    .line 249
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v0, :cond_27

    .line 250
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 253
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    new-instance v1, Lcom/mikepenz/materialdrawer/DrawerUtils$1;

    invoke-direct {v1, p0}, Lcom/mikepenz/materialdrawer/DrawerUtils$1;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-static {p0, v0, v1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->fillStickyDrawerItemFooter(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V

    .line 261
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 273
    :goto_1d
    iget v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentStickyFooterSelection:I

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setStickyFooterSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;ILjava/lang/Boolean;)V

    .line 275
    :cond_26
    return-void

    .line 264
    :cond_27
    new-instance v0, Lcom/mikepenz/materialdrawer/DrawerUtils$2;

    invoke-direct {v0, p0}, Lcom/mikepenz/materialdrawer/DrawerUtils$2;-><init>(Lcom/mikepenz/materialdrawer/DrawerBuilder;)V

    invoke-static {p0, v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->handleFooterView(Lcom/mikepenz/materialdrawer/DrawerBuilder;Landroid/view/View$OnClickListener;)V

    goto :goto_1d
.end method

.method public static setRecyclerViewSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZ)Z
    .registers 4
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Z

    .prologue
    .line 85
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/mikepenz/materialdrawer/DrawerUtils;->setRecyclerViewSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v0

    return v0
.end method

.method public static setRecyclerViewSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;IZLcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z
    .registers 7
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Z
    .param p3, "drawerItem"    # Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 98
    if-lt p1, v1, :cond_21

    .line 100
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    if-eqz v0, :cond_14

    .line 101
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/DrawerBuilder;->resetStickyFooterSelection()V

    .line 102
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mAdapter:Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;

    invoke-virtual {v0, v2, p1}, Lcom/mikepenz/materialdrawer/adapter/BaseDrawerAdapter;->handleSelection(Landroid/view/View;I)V

    .line 103
    iput p1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentSelection:I

    .line 104
    iput v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mCurrentStickyFooterSelection:I

    .line 107
    :cond_14
    if-eqz p2, :cond_21

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    if-eqz v0, :cond_21

    .line 108
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mOnDrawerItemClickListener:Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;

    invoke-interface {v0, v2, p1, p3}, Lcom/mikepenz/materialdrawer/Drawer$OnDrawerItemClickListener;->onItemClick(Landroid/view/View;ILcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;)Z

    move-result v0

    .line 112
    :goto_20
    return v0

    :cond_21
    const/4 v0, 0x0

    goto :goto_20
.end method

.method public static setStickyFooterSelection(Lcom/mikepenz/materialdrawer/DrawerBuilder;ILjava/lang/Boolean;)V
    .registers 6
    .param p0, "drawer"    # Lcom/mikepenz/materialdrawer/DrawerBuilder;
    .param p1, "position"    # I
    .param p2, "fireOnClick"    # Ljava/lang/Boolean;

    .prologue
    .line 123
    const/4 v2, -0x1

    if-le p1, v2, :cond_2a

    .line 124
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    if-eqz v2, :cond_2a

    iget-object v2, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    instance-of v2, v2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_2a

    .line 125
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/DrawerBuilder;->mStickyFooterView:Landroid/view/ViewGroup;

    check-cast v1, Landroid/widget/LinearLayout;

    .line 127
    .local v1, "footer":Landroid/widget/LinearLayout;
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-le v2, p1, :cond_2a

    if-ltz p1, :cond_2a

    .line 128
    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;

    .line 129
    .local v0, "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {p0, v0, v2, p2}, Lcom/mikepenz/materialdrawer/DrawerUtils;->onFooterDrawerItemClick(Lcom/mikepenz/materialdrawer/DrawerBuilder;Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;Landroid/view/View;Ljava/lang/Boolean;)V

    .line 133
    .end local v0    # "drawerItem":Lcom/mikepenz/materialdrawer/model/interfaces/IDrawerItem;
    .end local v1    # "footer":Landroid/widget/LinearLayout;
    :cond_2a
    return-void
.end method
