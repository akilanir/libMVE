.class public Landroid/support/v7/internal/widget/ActionBarContextView;
.super Landroid/support/v7/internal/widget/AbsActionBarView;
.source "ActionBarContextView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ActionBarContextView"


# instance fields
.field private mClose:Landroid/view/View;

.field private mCustomView:Landroid/view/View;

.field private mSplitBackground:Landroid/graphics/drawable/Drawable;

.field private mSubtitle:Ljava/lang/CharSequence;

.field private mSubtitleStyleRes:I

.field private mSubtitleView:Landroid/widget/TextView;

.field private mTitle:Ljava/lang/CharSequence;

.field private mTitleLayout:Landroid/widget/LinearLayout;

.field private mTitleOptional:Z

.field private mTitleStyleRes:I

.field private mTitleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 59
    sget v0, Landroid/support/v7/appcompat/R$attr;->actionModeStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 60
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v2, 0x0

    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/internal/widget/AbsActionBarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 65
    sget-object v1, Landroid/support/v7/appcompat/R$styleable;->ActionMode:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 66
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleStyleRes:I

    .line 70
    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitleStyleRes:I

    .line 73
    invoke-virtual {v0, v2, v2}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mContentHeight:I

    .line 76
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    .line 79
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 80
    return-void
.end method

.method private initTitle()V
    .registers 10

    .prologue
    const/16 v6, 0x8

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 167
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-nez v3, :cond_59

    .line 168
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 169
    .local v2, "inflater":Landroid/view/LayoutInflater;
    sget v3, Landroid/support/v7/appcompat/R$layout;->abc_action_bar_title_item:I

    invoke-virtual {v2, v3, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 170
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p0, v3}, Landroid/support/v7/internal/widget/ActionBarContextView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    iput-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    .line 171
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    sget v7, Landroid/support/v7/appcompat/R$id;->action_bar_title:I

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleView:Landroid/widget/TextView;

    .line 172
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    sget v7, Landroid/support/v7/appcompat/R$id;->action_bar_subtitle:I

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitleView:Landroid/widget/TextView;

    .line 173
    iget v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleStyleRes:I

    if-eqz v3, :cond_4a

    .line 174
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v7

    iget v8, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleStyleRes:I

    invoke-virtual {v3, v7, v8}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 176
    :cond_4a
    iget v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitleStyleRes:I

    if-eqz v3, :cond_59

    .line 177
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitleView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v7

    iget v8, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitleStyleRes:I

    invoke-virtual {v3, v7, v8}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 181
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :cond_59
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleView:Landroid/widget/TextView;

    iget-object v7, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitleView:Landroid/widget/TextView;

    iget-object v7, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitle:Ljava/lang/CharSequence;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitle:Ljava/lang/CharSequence;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_99

    move v1, v4

    .line 185
    .local v1, "hasTitle":Z
    :goto_70
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitle:Ljava/lang/CharSequence;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_9b

    move v0, v4

    .line 186
    .local v0, "hasSubtitle":Z
    :goto_79
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitleView:Landroid/widget/TextView;

    if-eqz v0, :cond_9d

    move v3, v5

    :goto_7e
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 187
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-nez v1, :cond_87

    if-eqz v0, :cond_88

    :cond_87
    move v6, v5

    :cond_88
    invoke-virtual {v3, v6}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 188
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-nez v3, :cond_98

    .line 189
    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v3}, Landroid/support/v7/internal/widget/ActionBarContextView;->addView(Landroid/view/View;)V

    .line 191
    :cond_98
    return-void

    .end local v0    # "hasSubtitle":Z
    .end local v1    # "hasTitle":Z
    :cond_99
    move v1, v5

    .line 184
    goto :goto_70

    .restart local v1    # "hasTitle":Z
    :cond_9b
    move v0, v5

    .line 185
    goto :goto_79

    .restart local v0    # "hasSubtitle":Z
    :cond_9d
    move v3, v6

    .line 186
    goto :goto_7e
.end method


# virtual methods
.method public bridge synthetic animateToVisibility(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 37
    invoke-super {p0, p1}, Landroid/support/v7/internal/widget/AbsActionBarView;->animateToVisibility(I)V

    return-void
.end method

.method public closeMode()V
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    if-nez v0, :cond_7

    .line 242
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->killMode()V

    .line 245
    :cond_7
    return-void
.end method

.method public bridge synthetic dismissPopupMenus()V
    .registers 1

    .prologue
    .line 37
    invoke-super {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->dismissPopupMenus()V

    return-void
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .registers 4

    .prologue
    .line 284
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .registers 4
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 290
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public bridge synthetic getAnimatedVisibility()I
    .registers 2

    .prologue
    .line 37
    invoke-super {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->getAnimatedVisibility()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getContentHeight()I
    .registers 2

    .prologue
    .line 37
    invoke-super {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->getContentHeight()I

    move-result v0

    return v0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 163
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public hideOverflowMenu()Z
    .registers 2

    .prologue
    .line 266
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    if-eqz v0, :cond_b

    .line 267
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->hideOverflowMenu()Z

    move-result v0

    .line 269
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public initForMode(Landroid/support/v7/view/ActionMode;)V
    .registers 10
    .param p1, "mode"    # Landroid/support/v7/view/ActionMode;

    .prologue
    const/4 v7, 0x1

    const/4 v6, -0x1

    .line 194
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    if-nez v4, :cond_70

    .line 195
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 196
    .local v1, "inflater":Landroid/view/LayoutInflater;
    sget v4, Landroid/support/v7/appcompat/R$layout;->abc_action_mode_close_item:I

    const/4 v5, 0x0

    invoke-virtual {v1, v4, p0, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    iput-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    .line 197
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {p0, v4}, Landroid/support/v7/internal/widget/ActionBarContextView;->addView(Landroid/view/View;)V

    .line 202
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :cond_1c
    :goto_1c
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    sget v5, Landroid/support/v7/appcompat/R$id;->action_mode_close_button:I

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 203
    .local v0, "closeButton":Landroid/view/View;
    new-instance v4, Landroid/support/v7/internal/widget/ActionBarContextView$1;

    invoke-direct {v4, p0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView$1;-><init>(Landroid/support/v7/internal/widget/ActionBarContextView;Landroid/support/v7/view/ActionMode;)V

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 209
    invoke-virtual {p1}, Landroid/support/v7/view/ActionMode;->getMenu()Landroid/view/Menu;

    move-result-object v3

    check-cast v3, Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 210
    .local v3, "menu":Landroid/support/v7/internal/view/menu/MenuBuilder;
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    if-eqz v4, :cond_3b

    .line 211
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v4}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->dismissPopupMenus()Z

    .line 213
    :cond_3b
    new-instance v4, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    .line 214
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v4, v7}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->setReserveOverflow(Z)V

    .line 216
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v4, -0x2

    invoke-direct {v2, v4, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 219
    .local v2, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    iget-boolean v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSplitActionBar:Z

    if-nez v4, :cond_7e

    .line 220
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v3, v4}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    .line 221
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v4, p0}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/internal/view/menu/MenuView;

    move-result-object v4

    check-cast v4, Landroid/support/v7/internal/view/menu/ActionMenuView;

    iput-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    .line 222
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/support/v7/internal/view/menu/ActionMenuView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 223
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {p0, v4, v2}, Landroid/support/v7/internal/widget/ActionBarContextView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 238
    :goto_6f
    return-void

    .line 198
    .end local v0    # "closeButton":Landroid/view/View;
    .end local v2    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v3    # "menu":Landroid/support/v7/internal/view/menu/MenuBuilder;
    :cond_70
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    if-nez v4, :cond_1c

    .line 199
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {p0, v4}, Landroid/support/v7/internal/widget/ActionBarContextView;->addView(Landroid/view/View;)V

    goto :goto_1c

    .line 226
    .restart local v0    # "closeButton":Landroid/view/View;
    .restart local v2    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .restart local v3    # "menu":Landroid/support/v7/internal/view/menu/MenuBuilder;
    :cond_7e
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v4, v5, v7}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->setWidthLimit(IZ)V

    .line 229
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    const v5, 0x7fffffff

    invoke-virtual {v4, v5}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->setItemLimit(I)V

    .line 231
    iput v6, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 232
    iget v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mContentHeight:I

    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 233
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v3, v4}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    .line 234
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v4, p0}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/internal/view/menu/MenuView;

    move-result-object v4

    check-cast v4, Landroid/support/v7/internal/view/menu/ActionMenuView;

    iput-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    .line 235
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    iget-object v5, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v5}, Landroid/support/v7/internal/view/menu/ActionMenuView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 236
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    iget-object v5, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {v4, v5, v2}, Landroid/support/v7/internal/widget/ActionBarContainer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_6f
.end method

.method public isOverflowMenuShowing()Z
    .registers 2

    .prologue
    .line 274
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    if-eqz v0, :cond_b

    .line 275
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result v0

    .line 277
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public bridge synthetic isOverflowReserved()Z
    .registers 2

    .prologue
    .line 37
    invoke-super {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->isOverflowReserved()Z

    move-result v0

    return v0
.end method

.method public isTitleOptional()Z
    .registers 2

    .prologue
    .line 414
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleOptional:Z

    return v0
.end method

.method public killMode()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 248
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->removeAllViews()V

    .line 249
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    if-eqz v0, :cond_f

    .line 250
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarContainer;->removeView(Landroid/view/View;)V

    .line 252
    :cond_f
    iput-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    .line 253
    iput-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    .line 254
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 84
    invoke-super {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->onDetachedFromWindow()V

    .line 85
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    if-eqz v0, :cond_11

    .line 86
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->hideOverflowMenu()Z

    .line 87
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->hideSubMenus()Z

    .line 89
    :cond_11
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 13
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    const/16 v6, 0x8

    .line 378
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getPaddingLeft()I

    move-result v2

    .line 379
    .local v2, "x":I
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getPaddingTop()I

    move-result v3

    .line 380
    .local v3, "y":I
    sub-int v4, p5, p3

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getPaddingBottom()I

    move-result v5

    sub-int v0, v4, v5

    .line 382
    .local v0, "contentHeight":I
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    if-eqz v4, :cond_38

    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v4

    if-eq v4, v6, :cond_38

    .line 383
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 385
    .local v1, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v2, v4

    .line 386
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    invoke-virtual {p0, v4, v2, v3, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->positionChild(Landroid/view/View;III)I

    move-result v4

    add-int/2addr v2, v4

    .line 387
    iget v4, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v2, v4

    .line 391
    .end local v1    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_38
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-eqz v4, :cond_4f

    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    if-nez v4, :cond_4f

    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getVisibility()I

    move-result v4

    if-eq v4, v6, :cond_4f

    .line 392
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v4, v2, v3, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->positionChild(Landroid/view/View;III)I

    move-result v4

    add-int/2addr v2, v4

    .line 395
    :cond_4f
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    if-eqz v4, :cond_5a

    .line 396
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    invoke-virtual {p0, v4, v2, v3, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->positionChild(Landroid/view/View;III)I

    move-result v4

    add-int/2addr v2, v4

    .line 399
    :cond_5a
    sub-int v4, p4, p2

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getPaddingRight()I

    move-result v5

    sub-int v2, v4, v5

    .line 401
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    if-eqz v4, :cond_6d

    .line 402
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {p0, v4, v2, v3, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->positionChildInverse(Landroid/view/View;III)I

    move-result v4

    sub-int/2addr v2, v4

    .line 404
    :cond_6d
    return-void
.end method

.method protected onMeasure(II)V
    .registers 30
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 295
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v23

    .line 296
    .local v23, "widthMode":I
    const/high16 v24, 0x40000000    # 2.0f

    move/from16 v0, v23

    move/from16 v1, v24

    if-eq v0, v1, :cond_33

    .line 297
    new-instance v24, Ljava/lang/IllegalStateException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " can only be used "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "with android:layout_width=\"FILL_PARENT\" (or fill_parent)"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 301
    :cond_33
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v12

    .line 302
    .local v12, "heightMode":I
    if-nez v12, :cond_60

    .line 303
    new-instance v24, Ljava/lang/IllegalStateException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " can only be used "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, "with android:layout_height=\"wrap_content\""

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 307
    :cond_60
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .line 309
    .local v5, "contentWidth":I
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mContentHeight:I

    move/from16 v24, v0

    if-lez v24, :cond_1c5

    move-object/from16 v0, p0

    iget v15, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mContentHeight:I

    .line 312
    .local v15, "maxHeight":I
    :goto_70
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getPaddingTop()I

    move-result v24

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getPaddingBottom()I

    move-result v25

    add-int v22, v24, v25

    .line 313
    .local v22, "verticalPadding":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getPaddingLeft()I

    move-result v24

    sub-int v24, v5, v24

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getPaddingRight()I

    move-result v25

    sub-int v3, v24, v25

    .line 314
    .local v3, "availableWidth":I
    sub-int v11, v15, v22

    .line 315
    .local v11, "height":I
    const/high16 v24, -0x80000000

    move/from16 v0, v24

    invoke-static {v11, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 318
    .local v4, "childSpecHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    move-object/from16 v24, v0

    if-eqz v24, :cond_c2

    .line 319
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/support/v7/internal/widget/ActionBarContextView;->measureChildView(Landroid/view/View;III)I

    move-result v3

    .line 320
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mClose:Landroid/view/View;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    check-cast v14, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 322
    .local v14, "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v0, v14, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    move/from16 v24, v0

    iget v0, v14, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    move/from16 v25, v0

    add-int v24, v24, v25

    sub-int v3, v3, v24

    .line 325
    .end local v14    # "lp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_c2
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    move-object/from16 v24, v0

    if-eqz v24, :cond_ec

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/support/v7/internal/view/menu/ActionMenuView;->getParent()Landroid/view/ViewParent;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    if-ne v0, v1, :cond_ec

    .line 326
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/support/v7/internal/widget/ActionBarContextView;->measureChildView(Landroid/view/View;III)I

    move-result v3

    .line 330
    :cond_ec
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    move-object/from16 v24, v0

    if-eqz v24, :cond_13e

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    move-object/from16 v24, v0

    if-nez v24, :cond_13e

    .line 331
    move-object/from16 v0, p0

    iget-boolean v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleOptional:Z

    move/from16 v24, v0

    if-eqz v24, :cond_1d3

    .line 332
    const/16 v24, 0x0

    const/16 v25, 0x0

    invoke-static/range {v24 .. v25}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v20

    .line 334
    .local v20, "titleWidthSpec":I
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move/from16 v1, v20

    invoke-virtual {v0, v1, v4}, Landroid/widget/LinearLayout;->measure(II)V

    .line 335
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/widget/LinearLayout;->getMeasuredWidth()I

    move-result v19

    .line 336
    .local v19, "titleWidth":I
    move/from16 v0, v19

    if-gt v0, v3, :cond_1cb

    const/16 v18, 0x1

    .line 337
    .local v18, "titleFits":Z
    :goto_129
    if-eqz v18, :cond_12d

    .line 338
    sub-int v3, v3, v19

    .line 340
    :cond_12d
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    move-object/from16 v25, v0

    if-eqz v18, :cond_1cf

    const/16 v24, 0x0

    :goto_137
    move-object/from16 v0, v25

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 346
    .end local v18    # "titleFits":Z
    .end local v19    # "titleWidth":I
    .end local v20    # "titleWidthSpec":I
    :cond_13e
    :goto_13e
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    move-object/from16 v24, v0

    if-eqz v24, :cond_19d

    .line 347
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v14

    .line 348
    .local v14, "lp":Landroid/view/ViewGroup$LayoutParams;
    iget v0, v14, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v24, v0

    const/16 v25, -0x2

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_1e7

    const/high16 v10, 0x40000000    # 2.0f

    .line 350
    .local v10, "customWidthMode":I
    :goto_15e
    iget v0, v14, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v24, v0

    if-ltz v24, :cond_1eb

    iget v0, v14, Landroid/view/ViewGroup$LayoutParams;->width:I

    move/from16 v24, v0

    move/from16 v0, v24

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v9

    .line 352
    .local v9, "customWidth":I
    :goto_16e
    iget v0, v14, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v24, v0

    const/16 v25, -0x2

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_1ed

    const/high16 v8, 0x40000000    # 2.0f

    .line 354
    .local v8, "customHeightMode":I
    :goto_17c
    iget v0, v14, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v24, v0

    if-ltz v24, :cond_1f0

    iget v0, v14, Landroid/view/ViewGroup$LayoutParams;->height:I

    move/from16 v24, v0

    move/from16 v0, v24

    invoke-static {v0, v11}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 356
    .local v7, "customHeight":I
    :goto_18c
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    move-object/from16 v24, v0

    invoke-static {v9, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v25

    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v26

    invoke-virtual/range {v24 .. v26}, Landroid/view/View;->measure(II)V

    .line 360
    .end local v7    # "customHeight":I
    .end local v8    # "customHeightMode":I
    .end local v9    # "customWidth":I
    .end local v10    # "customWidthMode":I
    .end local v14    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_19d
    move-object/from16 v0, p0

    iget v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mContentHeight:I

    move/from16 v24, v0

    if-gtz v24, :cond_1fa

    .line 361
    const/16 v16, 0x0

    .line 362
    .local v16, "measuredHeight":I
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getChildCount()I

    move-result v6

    .line 363
    .local v6, "count":I
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_1ac
    if-ge v13, v6, :cond_1f2

    .line 364
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Landroid/support/v7/internal/widget/ActionBarContextView;->getChildAt(I)Landroid/view/View;

    move-result-object v21

    .line 365
    .local v21, "v":Landroid/view/View;
    invoke-virtual/range {v21 .. v21}, Landroid/view/View;->getMeasuredHeight()I

    move-result v24

    add-int v17, v24, v22

    .line 366
    .local v17, "paddedViewHeight":I
    move/from16 v0, v17

    move/from16 v1, v16

    if-le v0, v1, :cond_1c2

    .line 367
    move/from16 v16, v17

    .line 363
    :cond_1c2
    add-int/lit8 v13, v13, 0x1

    goto :goto_1ac

    .line 309
    .end local v3    # "availableWidth":I
    .end local v4    # "childSpecHeight":I
    .end local v6    # "count":I
    .end local v11    # "height":I
    .end local v13    # "i":I
    .end local v15    # "maxHeight":I
    .end local v16    # "measuredHeight":I
    .end local v17    # "paddedViewHeight":I
    .end local v21    # "v":Landroid/view/View;
    .end local v22    # "verticalPadding":I
    :cond_1c5
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v15

    goto/16 :goto_70

    .line 336
    .restart local v3    # "availableWidth":I
    .restart local v4    # "childSpecHeight":I
    .restart local v11    # "height":I
    .restart local v15    # "maxHeight":I
    .restart local v19    # "titleWidth":I
    .restart local v20    # "titleWidthSpec":I
    .restart local v22    # "verticalPadding":I
    :cond_1cb
    const/16 v18, 0x0

    goto/16 :goto_129

    .line 340
    .restart local v18    # "titleFits":Z
    :cond_1cf
    const/16 v24, 0x8

    goto/16 :goto_137

    .line 342
    .end local v18    # "titleFits":Z
    .end local v19    # "titleWidth":I
    .end local v20    # "titleWidthSpec":I
    :cond_1d3
    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v3, v4, v2}, Landroid/support/v7/internal/widget/ActionBarContextView;->measureChildView(Landroid/view/View;III)I

    move-result v3

    goto/16 :goto_13e

    .line 348
    .restart local v14    # "lp":Landroid/view/ViewGroup$LayoutParams;
    :cond_1e7
    const/high16 v10, -0x80000000

    goto/16 :goto_15e

    .restart local v10    # "customWidthMode":I
    :cond_1eb
    move v9, v3

    .line 350
    goto :goto_16e

    .line 352
    .restart local v9    # "customWidth":I
    :cond_1ed
    const/high16 v8, -0x80000000

    goto :goto_17c

    .restart local v8    # "customHeightMode":I
    :cond_1f0
    move v7, v11

    .line 354
    goto :goto_18c

    .line 370
    .end local v8    # "customHeightMode":I
    .end local v9    # "customWidth":I
    .end local v10    # "customWidthMode":I
    .end local v14    # "lp":Landroid/view/ViewGroup$LayoutParams;
    .restart local v6    # "count":I
    .restart local v13    # "i":I
    .restart local v16    # "measuredHeight":I
    :cond_1f2
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v5, v1}, Landroid/support/v7/internal/widget/ActionBarContextView;->setMeasuredDimension(II)V

    .line 374
    .end local v6    # "count":I
    .end local v13    # "i":I
    .end local v16    # "measuredHeight":I
    :goto_1f9
    return-void

    .line 372
    :cond_1fa
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v15}, Landroid/support/v7/internal/widget/ActionBarContextView;->setMeasuredDimension(II)V

    goto :goto_1f9
.end method

.method public bridge synthetic postShowOverflowMenu()V
    .registers 1

    .prologue
    .line 37
    invoke-super {p0}, Landroid/support/v7/internal/widget/AbsActionBarView;->postShowOverflowMenu()V

    return-void
.end method

.method public setContentHeight(I)V
    .registers 2
    .param p1, "height"    # I

    .prologue
    .line 130
    iput p1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mContentHeight:I

    .line 131
    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 134
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_9

    .line 135
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->removeView(Landroid/view/View;)V

    .line 137
    :cond_9
    iput-object p1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mCustomView:Landroid/view/View;

    .line 138
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_17

    .line 139
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->removeView(Landroid/view/View;)V

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleLayout:Landroid/widget/LinearLayout;

    .line 142
    :cond_17
    if-eqz p1, :cond_1c

    .line 143
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/widget/ActionBarContextView;->addView(Landroid/view/View;)V

    .line 145
    :cond_1c
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->requestLayout()V

    .line 146
    return-void
.end method

.method public setSplitActionBar(Z)V
    .registers 8
    .param p1, "split"    # Z

    .prologue
    const/4 v5, -0x1

    .line 93
    iget-boolean v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSplitActionBar:Z

    if-eq v2, p1, :cond_38

    .line 94
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    if-eqz v2, :cond_35

    .line 96
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v0, v2, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 99
    .local v0, "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    if-nez p1, :cond_39

    .line 100
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v2, p0}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/internal/view/menu/MenuView;

    move-result-object v2

    check-cast v2, Landroid/support/v7/internal/view/menu/ActionMenuView;

    iput-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    .line 101
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/support/v7/internal/view/menu/ActionMenuView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 102
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/ActionMenuView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 103
    .local v1, "oldParent":Landroid/view/ViewGroup;
    if-eqz v1, :cond_30

    .line 104
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 106
    :cond_30
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {p0, v2, v0}, Landroid/support/v7/internal/widget/ActionBarContextView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 125
    .end local v0    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    .end local v1    # "oldParent":Landroid/view/ViewGroup;
    :cond_35
    :goto_35
    invoke-super {p0, p1}, Landroid/support/v7/internal/widget/AbsActionBarView;->setSplitActionBar(Z)V

    .line 127
    :cond_38
    return-void

    .line 109
    .restart local v0    # "layoutParams":Landroid/view/ViewGroup$LayoutParams;
    :cond_39
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->setWidthLimit(IZ)V

    .line 112
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    const v3, 0x7fffffff

    invoke-virtual {v2, v3}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->setItemLimit(I)V

    .line 114
    iput v5, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 115
    iget v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mContentHeight:I

    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 116
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v2, p0}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/internal/view/menu/MenuView;

    move-result-object v2

    check-cast v2, Landroid/support/v7/internal/view/menu/ActionMenuView;

    iput-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    .line 117
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSplitBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v3}, Landroid/support/v7/internal/view/menu/ActionMenuView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 118
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/ActionMenuView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 119
    .restart local v1    # "oldParent":Landroid/view/ViewGroup;
    if-eqz v1, :cond_7b

    .line 120
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 122
    :cond_7b
    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSplitView:Landroid/support/v7/internal/widget/ActionBarContainer;

    iget-object v3, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mMenuView:Landroid/support/v7/internal/view/menu/ActionMenuView;

    invoke-virtual {v2, v3, v0}, Landroid/support/v7/internal/widget/ActionBarContainer;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_35
.end method

.method public bridge synthetic setSplitView(Landroid/support/v7/internal/widget/ActionBarContainer;)V
    .registers 2
    .param p1, "x0"    # Landroid/support/v7/internal/widget/ActionBarContainer;

    .prologue
    .line 37
    invoke-super {p0, p1}, Landroid/support/v7/internal/widget/AbsActionBarView;->setSplitView(Landroid/support/v7/internal/widget/ActionBarContainer;)V

    return-void
.end method

.method public bridge synthetic setSplitWhenNarrow(Z)V
    .registers 2
    .param p1, "x0"    # Z

    .prologue
    .line 37
    invoke-super {p0, p1}, Landroid/support/v7/internal/widget/AbsActionBarView;->setSplitWhenNarrow(Z)V

    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "subtitle"    # Ljava/lang/CharSequence;

    .prologue
    .line 154
    iput-object p1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mSubtitle:Ljava/lang/CharSequence;

    .line 155
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->initTitle()V

    .line 156
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 149
    iput-object p1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitle:Ljava/lang/CharSequence;

    .line 150
    invoke-direct {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->initTitle()V

    .line 151
    return-void
.end method

.method public setTitleOptional(Z)V
    .registers 3
    .param p1, "titleOptional"    # Z

    .prologue
    .line 407
    iget-boolean v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleOptional:Z

    if-eq p1, v0, :cond_7

    .line 408
    invoke-virtual {p0}, Landroid/support/v7/internal/widget/ActionBarContextView;->requestLayout()V

    .line 410
    :cond_7
    iput-boolean p1, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mTitleOptional:Z

    .line 411
    return-void
.end method

.method public bridge synthetic setVisibility(I)V
    .registers 2
    .param p1, "x0"    # I

    .prologue
    .line 37
    invoke-super {p0, p1}, Landroid/support/v7/internal/widget/AbsActionBarView;->setVisibility(I)V

    return-void
.end method

.method public showOverflowMenu()Z
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    if-eqz v0, :cond_b

    .line 259
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarContextView;->mActionMenuPresenter:Landroid/support/v7/internal/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/ActionMenuPresenter;->showOverflowMenu()Z

    move-result v0

    .line 261
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
