.class public Landroid/support/design/widget/NavigationView;
.super Landroid/support/design/internal/ScrimInsetsFrameLayout;
.source "NavigationView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/NavigationView$SavedState;,
        Landroid/support/design/widget/NavigationView$OnNavigationItemSelectedListener;
    }
.end annotation


# static fields
.field private static final CHECKED_STATE_SET:[I

.field private static final DISABLED_STATE_SET:[I

.field private static final PRESENTER_NAVIGATION_VIEW_ID:I = 0x1


# instance fields
.field private mListener:Landroid/support/design/widget/NavigationView$OnNavigationItemSelectedListener;

.field private mMaxWidth:I

.field private final mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field private mMenuInflater:Landroid/view/MenuInflater;

.field private final mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 70
    new-array v0, v3, [I

    const v1, 0x10100a0

    aput v1, v0, v2

    sput-object v0, Landroid/support/design/widget/NavigationView;->CHECKED_STATE_SET:[I

    .line 71
    new-array v0, v3, [I

    const v1, -0x101009e

    aput v1, v0, v2

    sput-object v0, Landroid/support/design/widget/NavigationView;->DISABLED_STATE_SET:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 84
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/NavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 85
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/design/widget/NavigationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 89
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v6, 0x0

    .line 92
    invoke-direct {p0, p1, p2, p3}, Landroid/support/design/internal/ScrimInsetsFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 95
    new-instance v4, Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-direct {v4, p1}, Landroid/support/v7/internal/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Landroid/support/design/widget/NavigationView;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 98
    sget-object v4, Landroid/support/design/R$styleable;->NavigationView:[I

    sget v5, Landroid/support/design/R$style;->Widget_Design_NavigationView:I

    invoke-virtual {p1, p2, v4, p3, v5}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 103
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v4, Landroid/support/design/R$styleable;->NavigationView_android_background:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/support/design/widget/NavigationView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 104
    sget v4, Landroid/support/design/R$styleable;->NavigationView_elevation:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 105
    sget v4, Landroid/support/design/R$styleable;->NavigationView_elevation:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    int-to-float v4, v4

    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setElevation(Landroid/view/View;F)V

    .line 108
    :cond_2e
    sget v4, Landroid/support/design/R$styleable;->NavigationView_android_fitsSystemWindows:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    invoke-static {p0, v4}, Landroid/support/v4/view/ViewCompat;->setFitsSystemWindows(Landroid/view/View;Z)V

    .line 111
    sget v4, Landroid/support/design/R$styleable;->NavigationView_android_maxWidth:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Landroid/support/design/widget/NavigationView;->mMaxWidth:I

    .line 114
    sget v4, Landroid/support/design/R$styleable;->NavigationView_itemIconTint:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_c6

    .line 115
    sget v4, Landroid/support/design/R$styleable;->NavigationView_itemIconTint:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .line 121
    .local v2, "itemIconTint":Landroid/content/res/ColorStateList;
    :goto_4d
    sget v4, Landroid/support/design/R$styleable;->NavigationView_itemTextColor:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_ce

    .line 122
    sget v4, Landroid/support/design/R$styleable;->NavigationView_itemTextColor:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .line 127
    .local v3, "itemTextColor":Landroid/content/res/ColorStateList;
    :goto_5b
    sget v4, Landroid/support/design/R$styleable;->NavigationView_itemBackground:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 129
    .local v1, "itemBackground":Landroid/graphics/drawable/Drawable;
    sget v4, Landroid/support/design/R$styleable;->NavigationView_menu:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_72

    .line 130
    sget v4, Landroid/support/design/R$styleable;->NavigationView_menu:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/support/design/widget/NavigationView;->inflateMenu(I)V

    .line 133
    :cond_72
    iget-object v4, p0, Landroid/support/design/widget/NavigationView;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    new-instance v5, Landroid/support/design/widget/NavigationView$1;

    invoke-direct {v5, p0}, Landroid/support/design/widget/NavigationView$1;-><init>(Landroid/support/design/widget/NavigationView;)V

    invoke-virtual {v4, v5}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setCallback(Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V

    .line 142
    new-instance v4, Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-direct {v4}, Landroid/support/design/internal/NavigationMenuPresenter;-><init>()V

    iput-object v4, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    .line 143
    iget-object v4, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/support/design/internal/NavigationMenuPresenter;->setId(I)V

    .line 144
    iget-object v4, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    iget-object v5, p0, Landroid/support/design/widget/NavigationView;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v4, p1, v5}, Landroid/support/design/internal/NavigationMenuPresenter;->initForMenu(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;)V

    .line 145
    iget-object v4, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v4, v2}, Landroid/support/design/internal/NavigationMenuPresenter;->setItemIconTintList(Landroid/content/res/ColorStateList;)V

    .line 146
    iget-object v4, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v4, v3}, Landroid/support/design/internal/NavigationMenuPresenter;->setItemTextColor(Landroid/content/res/ColorStateList;)V

    .line 147
    iget-object v4, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v4, v1}, Landroid/support/design/internal/NavigationMenuPresenter;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    .line 148
    iget-object v4, p0, Landroid/support/design/widget/NavigationView;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v5, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v4, v5}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;)V

    .line 149
    iget-object v4, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v4, p0}, Landroid/support/design/internal/NavigationMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/internal/view/menu/MenuView;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {p0, v4}, Landroid/support/design/widget/NavigationView;->addView(Landroid/view/View;)V

    .line 151
    sget v4, Landroid/support/design/R$styleable;->NavigationView_headerLayout:I

    invoke-virtual {v0, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_c2

    .line 152
    sget v4, Landroid/support/design/R$styleable;->NavigationView_headerLayout:I

    invoke-virtual {v0, v4, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/support/design/widget/NavigationView;->inflateHeaderView(I)Landroid/view/View;

    .line 155
    :cond_c2
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 156
    return-void

    .line 117
    .end local v1    # "itemBackground":Landroid/graphics/drawable/Drawable;
    .end local v2    # "itemIconTint":Landroid/content/res/ColorStateList;
    .end local v3    # "itemTextColor":Landroid/content/res/ColorStateList;
    :cond_c6
    const v4, 0x1010038

    invoke-direct {p0, v4}, Landroid/support/design/widget/NavigationView;->createDefaultColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    .restart local v2    # "itemIconTint":Landroid/content/res/ColorStateList;
    goto :goto_4d

    .line 124
    :cond_ce
    const v4, 0x1010036

    invoke-direct {p0, v4}, Landroid/support/design/widget/NavigationView;->createDefaultColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    .restart local v3    # "itemTextColor":Landroid/content/res/ColorStateList;
    goto :goto_5b
.end method

.method static synthetic access$000(Landroid/support/design/widget/NavigationView;)Landroid/support/design/widget/NavigationView$OnNavigationItemSelectedListener;
    .registers 2
    .param p0, "x0"    # Landroid/support/design/widget/NavigationView;

    .prologue
    .line 68
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mListener:Landroid/support/design/widget/NavigationView$OnNavigationItemSelectedListener;

    return-object v0
.end method

.method private createDefaultColorStateList(I)Landroid/content/res/ColorStateList;
    .registers 13
    .param p1, "baseColorThemeAttr"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v7, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 341
    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    .line 342
    .local v3, "value":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/support/design/widget/NavigationView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    invoke-virtual {v5, p1, v3, v8}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v5

    if-nez v5, :cond_19

    .line 351
    :cond_18
    :goto_18
    return-object v4

    .line 345
    :cond_19
    invoke-virtual {p0}, Landroid/support/design/widget/NavigationView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    iget v6, v3, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    .line 346
    .local v0, "baseColor":Landroid/content/res/ColorStateList;
    invoke-virtual {p0}, Landroid/support/design/widget/NavigationView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    sget v6, Landroid/support/design/R$attr;->colorPrimary:I

    invoke-virtual {v5, v6, v3, v8}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 349
    iget v1, v3, Landroid/util/TypedValue;->data:I

    .line 350
    .local v1, "colorPrimary":I
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    .line 351
    .local v2, "defaultColor":I
    new-instance v4, Landroid/content/res/ColorStateList;

    new-array v5, v7, [[I

    sget-object v6, Landroid/support/design/widget/NavigationView;->DISABLED_STATE_SET:[I

    aput-object v6, v5, v9

    sget-object v6, Landroid/support/design/widget/NavigationView;->CHECKED_STATE_SET:[I

    aput-object v6, v5, v8

    sget-object v6, Landroid/support/design/widget/NavigationView;->EMPTY_STATE_SET:[I

    aput-object v6, v5, v10

    new-array v6, v7, [I

    sget-object v7, Landroid/support/design/widget/NavigationView;->DISABLED_STATE_SET:[I

    invoke-virtual {v0, v7, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v7

    aput v7, v6, v9

    aput v1, v6, v8

    aput v2, v6, v10

    invoke-direct {v4, v5, v6}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    goto :goto_18
.end method

.method private getMenuInflater()Landroid/view/MenuInflater;
    .registers 3

    .prologue
    .line 334
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mMenuInflater:Landroid/view/MenuInflater;

    if-nez v0, :cond_f

    .line 335
    new-instance v0, Landroid/support/v7/internal/view/SupportMenuInflater;

    invoke-virtual {p0}, Landroid/support/design/widget/NavigationView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/internal/view/SupportMenuInflater;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/design/widget/NavigationView;->mMenuInflater:Landroid/view/MenuInflater;

    .line 337
    :cond_f
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mMenuInflater:Landroid/view/MenuInflater;

    return-object v0
.end method


# virtual methods
.method public addHeaderView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 243
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/NavigationMenuPresenter;->addHeaderView(Landroid/view/View;)V

    .line 244
    return-void
.end method

.method public getItemBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 309
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter;->getItemBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getItemIconTintList()Landroid/content/res/ColorStateList;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 264
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter;->getItemTintList()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getItemTextColor()Landroid/content/res/ColorStateList;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 287
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter;->getItemTextColor()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getMenu()Landroid/view/Menu;
    .registers 2

    .prologue
    .line 224
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    return-object v0
.end method

.method public inflateHeaderView(I)Landroid/view/View;
    .registers 3
    .param p1, "res"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param

    .prologue
    .line 234
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/NavigationMenuPresenter;->inflateHeaderView(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public inflateMenu(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    const/4 v2, 0x0

    .line 210
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    if-eqz v0, :cond_b

    .line 211
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/design/internal/NavigationMenuPresenter;->setUpdateSuspended(Z)V

    .line 213
    :cond_b
    invoke-direct {p0}, Landroid/support/design/widget/NavigationView;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    iget-object v1, p0, Landroid/support/design/widget/NavigationView;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p1, v1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 214
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    if-eqz v0, :cond_22

    .line 215
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0, v2}, Landroid/support/design/internal/NavigationMenuPresenter;->setUpdateSuspended(Z)V

    .line 216
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0, v2}, Landroid/support/design/internal/NavigationMenuPresenter;->updateMenuView(Z)V

    .line 218
    :cond_22
    return-void
.end method

.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthSpec"    # I
    .param p2, "heightSpec"    # I

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 185
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    sparse-switch v0, :sswitch_data_24

    .line 198
    :goto_9
    :sswitch_9
    invoke-super {p0, p1, p2}, Landroid/support/design/internal/ScrimInsetsFrameLayout;->onMeasure(II)V

    .line 199
    return-void

    .line 190
    :sswitch_d
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    iget v1, p0, Landroid/support/design/widget/NavigationView;->mMaxWidth:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 192
    goto :goto_9

    .line 194
    :sswitch_1c
    iget v0, p0, Landroid/support/design/widget/NavigationView;->mMaxWidth:I

    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    goto :goto_9

    .line 185
    nop

    :sswitch_data_24
    .sparse-switch
        -0x80000000 -> :sswitch_d
        0x0 -> :sswitch_1c
        0x40000000 -> :sswitch_9
    .end sparse-switch
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 5
    .param p1, "savedState"    # Landroid/os/Parcelable;

    .prologue
    .line 169
    move-object v0, p1

    check-cast v0, Landroid/support/design/widget/NavigationView$SavedState;

    .line 170
    .local v0, "state":Landroid/support/design/widget/NavigationView$SavedState;
    invoke-virtual {v0}, Landroid/support/design/widget/NavigationView$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/support/design/internal/ScrimInsetsFrameLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 171
    iget-object v1, p0, Landroid/support/design/widget/NavigationView;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v2, v0, Landroid/support/design/widget/NavigationView$SavedState;->menuState:Landroid/os/Bundle;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->restorePresenterStates(Landroid/os/Bundle;)V

    .line 172
    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    .prologue
    .line 160
    invoke-super {p0}, Landroid/support/design/internal/ScrimInsetsFrameLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    .line 161
    .local v1, "superState":Landroid/os/Parcelable;
    new-instance v0, Landroid/support/design/widget/NavigationView$SavedState;

    invoke-direct {v0, v1}, Landroid/support/design/widget/NavigationView$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 162
    .local v0, "state":Landroid/support/design/widget/NavigationView$SavedState;
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, v0, Landroid/support/design/widget/NavigationView$SavedState;->menuState:Landroid/os/Bundle;

    .line 163
    iget-object v2, p0, Landroid/support/design/widget/NavigationView;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v3, v0, Landroid/support/design/widget/NavigationView$SavedState;->menuState:Landroid/os/Bundle;

    invoke-virtual {v2, v3}, Landroid/support/v7/internal/view/menu/MenuBuilder;->savePresenterStates(Landroid/os/Bundle;)V

    .line 164
    return-object v0
.end method

.method public removeHeaderView(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 252
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/NavigationMenuPresenter;->removeHeaderView(Landroid/view/View;)V

    .line 253
    return-void
.end method

.method public setItemBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "itemBackground"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 330
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/NavigationMenuPresenter;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    .line 331
    return-void
.end method

.method public setItemBackgroundResource(I)V
    .registers 3
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 320
    invoke-virtual {p0}, Landroid/support/design/widget/NavigationView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/NavigationView;->setItemBackground(Landroid/graphics/drawable/Drawable;)V

    .line 321
    return-void
.end method

.method public setItemIconTintList(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "tint"    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 275
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/NavigationMenuPresenter;->setItemIconTintList(Landroid/content/res/ColorStateList;)V

    .line 276
    return-void
.end method

.method public setItemTextColor(Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p1, "textColor"    # Landroid/content/res/ColorStateList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 298
    iget-object v0, p0, Landroid/support/design/widget/NavigationView;->mPresenter:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-virtual {v0, p1}, Landroid/support/design/internal/NavigationMenuPresenter;->setItemTextColor(Landroid/content/res/ColorStateList;)V

    .line 299
    return-void
.end method

.method public setNavigationItemSelectedListener(Landroid/support/design/widget/NavigationView$OnNavigationItemSelectedListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/design/widget/NavigationView$OnNavigationItemSelectedListener;

    .prologue
    .line 180
    iput-object p1, p0, Landroid/support/design/widget/NavigationView;->mListener:Landroid/support/design/widget/NavigationView$OnNavigationItemSelectedListener;

    .line 181
    return-void
.end method
