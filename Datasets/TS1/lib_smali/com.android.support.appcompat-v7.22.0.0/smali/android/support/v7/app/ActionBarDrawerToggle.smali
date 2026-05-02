.class public Landroid/support/v7/app/ActionBarDrawerToggle;
.super Ljava/lang/Object;
.source "ActionBarDrawerToggle.java"

# interfaces
.implements Landroid/support/v4/widget/DrawerLayout$DrawerListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/app/ActionBarDrawerToggle$DummyDelegate;,
        Landroid/support/v7/app/ActionBarDrawerToggle$ToolbarCompatDelegate;,
        Landroid/support/v7/app/ActionBarDrawerToggle$JellybeanMr2Delegate;,
        Landroid/support/v7/app/ActionBarDrawerToggle$HoneycombDelegate;,
        Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;,
        Landroid/support/v7/app/ActionBarDrawerToggle$DrawerArrowDrawableToggle;,
        Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;,
        Landroid/support/v7/app/ActionBarDrawerToggle$TmpDelegateProvider;,
        Landroid/support/v7/app/ActionBarDrawerToggle$DelegateProvider;
    }
.end annotation


# instance fields
.field private final mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

.field private final mCloseDrawerContentDescRes:I

.field private mDrawerIndicatorEnabled:Z

.field private final mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

.field private mHasCustomUpIndicator:Z

.field private mHomeAsUpIndicator:Landroid/graphics/drawable/Drawable;

.field private final mOpenDrawerContentDescRes:I

.field private mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

.field private mToolbarNavigationClickListener:Landroid/view/View$OnClickListener;

.field private mWarnedForDisplayHomeAsUp:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;II)V
    .registers 12
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "drawerLayout"    # Landroid/support/v4/widget/DrawerLayout;
    .param p3, "openDrawerContentDescRes"    # I
    .param p4, "closeDrawerContentDescRes"    # I

    .prologue
    const/4 v2, 0x0

    .line 160
    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, v2

    move v5, p3

    move v6, p4

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/app/ActionBarDrawerToggle;-><init>(Landroid/app/Activity;Landroid/support/v7/widget/Toolbar;Landroid/support/v4/widget/DrawerLayout;Landroid/graphics/drawable/Drawable;II)V

    .line 162
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Landroid/support/v4/widget/DrawerLayout;Landroid/support/v7/widget/Toolbar;II)V
    .registers 13
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "drawerLayout"    # Landroid/support/v4/widget/DrawerLayout;
    .param p3, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p4, "openDrawerContentDescRes"    # I
    .param p5, "closeDrawerContentDescRes"    # I

    .prologue
    .line 191
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p2

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Landroid/support/v7/app/ActionBarDrawerToggle;-><init>(Landroid/app/Activity;Landroid/support/v7/widget/Toolbar;Landroid/support/v4/widget/DrawerLayout;Landroid/graphics/drawable/Drawable;II)V

    .line 193
    return-void
.end method

.method constructor <init>(Landroid/app/Activity;Landroid/support/v7/widget/Toolbar;Landroid/support/v4/widget/DrawerLayout;Landroid/graphics/drawable/Drawable;II)V
    .registers 10
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "toolbar"    # Landroid/support/v7/widget/Toolbar;
    .param p3, "drawerLayout"    # Landroid/support/v4/widget/DrawerLayout;
    .param p5, "openDrawerContentDescRes"    # I
    .param p6, "closeDrawerContentDescRes"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/graphics/drawable/Drawable;",
            ":",
            "Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;",
            ">(",
            "Landroid/app/Activity;",
            "Landroid/support/v7/widget/Toolbar;",
            "Landroid/support/v4/widget/DrawerLayout;",
            "TT;II)V"
        }
    .end annotation

    .prologue
    .local p4, "slider":Landroid/graphics/drawable/Drawable;, "TT;"
    const/4 v2, 0x0

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    .line 137
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mWarnedForDisplayHomeAsUp:Z

    .line 204
    if-eqz p2, :cond_37

    .line 205
    new-instance v0, Landroid/support/v7/app/ActionBarDrawerToggle$ToolbarCompatDelegate;

    invoke-direct {v0, p2}, Landroid/support/v7/app/ActionBarDrawerToggle$ToolbarCompatDelegate;-><init>(Landroid/support/v7/widget/Toolbar;)V

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    .line 206
    new-instance v0, Landroid/support/v7/app/ActionBarDrawerToggle$1;

    invoke-direct {v0, p0}, Landroid/support/v7/app/ActionBarDrawerToggle$1;-><init>(Landroid/support/v7/app/ActionBarDrawerToggle;)V

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 228
    :goto_1b
    iput-object p3, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    .line 229
    iput p5, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mOpenDrawerContentDescRes:I

    .line 230
    iput p6, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mCloseDrawerContentDescRes:I

    .line 231
    if-nez p4, :cond_77

    .line 232
    new-instance v0, Landroid/support/v7/app/ActionBarDrawerToggle$DrawerArrowDrawableToggle;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    invoke-interface {v1}, Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;->getActionBarThemedContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Landroid/support/v7/app/ActionBarDrawerToggle$DrawerArrowDrawableToggle;-><init>(Landroid/app/Activity;Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    .line 238
    .end local p4    # "slider":Landroid/graphics/drawable/Drawable;, "TT;"
    :goto_30
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarDrawerToggle;->getThemeUpIndicator()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mHomeAsUpIndicator:Landroid/graphics/drawable/Drawable;

    .line 239
    return-void

    .line 216
    .restart local p4    # "slider":Landroid/graphics/drawable/Drawable;, "TT;"
    :cond_37
    instance-of v0, p1, Landroid/support/v7/app/ActionBarDrawerToggle$DelegateProvider;

    if-eqz v0, :cond_45

    move-object v0, p1

    .line 217
    check-cast v0, Landroid/support/v7/app/ActionBarDrawerToggle$DelegateProvider;

    invoke-interface {v0}, Landroid/support/v7/app/ActionBarDrawerToggle$DelegateProvider;->getDrawerToggleDelegate()Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    goto :goto_1b

    .line 218
    :cond_45
    instance-of v0, p1, Landroid/support/v7/app/ActionBarDrawerToggle$TmpDelegateProvider;

    if-eqz v0, :cond_53

    move-object v0, p1

    .line 219
    check-cast v0, Landroid/support/v7/app/ActionBarDrawerToggle$TmpDelegateProvider;

    invoke-interface {v0}, Landroid/support/v7/app/ActionBarDrawerToggle$TmpDelegateProvider;->getV7DrawerToggleDelegate()Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    goto :goto_1b

    .line 220
    :cond_53
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x12

    if-lt v0, v1, :cond_61

    .line 221
    new-instance v0, Landroid/support/v7/app/ActionBarDrawerToggle$JellybeanMr2Delegate;

    invoke-direct {v0, p1, v2}, Landroid/support/v7/app/ActionBarDrawerToggle$JellybeanMr2Delegate;-><init>(Landroid/app/Activity;Landroid/support/v7/app/ActionBarDrawerToggle$1;)V

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    goto :goto_1b

    .line 222
    :cond_61
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_6f

    .line 223
    new-instance v0, Landroid/support/v7/app/ActionBarDrawerToggle$HoneycombDelegate;

    invoke-direct {v0, p1, v2}, Landroid/support/v7/app/ActionBarDrawerToggle$HoneycombDelegate;-><init>(Landroid/app/Activity;Landroid/support/v7/app/ActionBarDrawerToggle$1;)V

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    goto :goto_1b

    .line 225
    :cond_6f
    new-instance v0, Landroid/support/v7/app/ActionBarDrawerToggle$DummyDelegate;

    invoke-direct {v0, p1}, Landroid/support/v7/app/ActionBarDrawerToggle$DummyDelegate;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    goto :goto_1b

    .line 235
    :cond_77
    check-cast p4, Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    .end local p4    # "slider":Landroid/graphics/drawable/Drawable;, "TT;"
    iput-object p4, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    goto :goto_30
.end method

.method static synthetic access$000(Landroid/support/v7/app/ActionBarDrawerToggle;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarDrawerToggle;

    .prologue
    .line 65
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    return v0
.end method

.method static synthetic access$100(Landroid/support/v7/app/ActionBarDrawerToggle;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarDrawerToggle;

    .prologue
    .line 65
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarDrawerToggle;->toggle()V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v7/app/ActionBarDrawerToggle;)Landroid/view/View$OnClickListener;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/app/ActionBarDrawerToggle;

    .prologue
    .line 65
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mToolbarNavigationClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method private toggle()V
    .registers 3

    .prologue
    const v1, 0x800003

    .line 297
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->isDrawerVisible(I)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 298
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->closeDrawer(I)V

    .line 302
    :goto_10
    return-void

    .line 300
    :cond_11
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v1}, Landroid/support/v4/widget/DrawerLayout;->openDrawer(I)V

    goto :goto_10
.end method


# virtual methods
.method getThemeUpIndicator()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 476
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    invoke-interface {v0}, Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;->getThemeUpIndicator()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getToolbarNavigationClickListener()Landroid/view/View$OnClickListener;
    .registers 2

    .prologue
    .line 444
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mToolbarNavigationClickListener:Landroid/view/View$OnClickListener;

    return-object v0
.end method

.method public isDrawerIndicatorEnabled()Z
    .registers 2

    .prologue
    .line 353
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 273
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mHasCustomUpIndicator:Z

    if-nez v0, :cond_a

    .line 274
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarDrawerToggle;->getThemeUpIndicator()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mHomeAsUpIndicator:Landroid/graphics/drawable/Drawable;

    .line 276
    :cond_a
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarDrawerToggle;->syncState()V

    .line 277
    return-void
.end method

.method public onDrawerClosed(Landroid/view/View;)V
    .registers 4
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 417
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;->setPosition(F)V

    .line 418
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eqz v0, :cond_f

    .line 419
    iget v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mOpenDrawerContentDescRes:I

    invoke-virtual {p0, v0}, Landroid/support/v7/app/ActionBarDrawerToggle;->setActionBarDescription(I)V

    .line 421
    :cond_f
    return-void
.end method

.method public onDrawerOpened(Landroid/view/View;)V
    .registers 4
    .param p1, "drawerView"    # Landroid/view/View;

    .prologue
    .line 402
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-interface {v0, v1}, Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;->setPosition(F)V

    .line 403
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eqz v0, :cond_10

    .line 404
    iget v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mCloseDrawerContentDescRes:I

    invoke-virtual {p0, v0}, Landroid/support/v7/app/ActionBarDrawerToggle;->setActionBarDescription(I)V

    .line 406
    :cond_10
    return-void
.end method

.method public onDrawerSlide(Landroid/view/View;F)V
    .registers 6
    .param p1, "drawerView"    # Landroid/view/View;
    .param p2, "slideOffset"    # F

    .prologue
    .line 390
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-static {v2, p2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-interface {v0, v1}, Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;->setPosition(F)V

    .line 391
    return-void
.end method

.method public onDrawerStateChanged(I)V
    .registers 2
    .param p1, "newState"    # I

    .prologue
    .line 432
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 289
    if-eqz p1, :cond_14

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_14

    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eqz v0, :cond_14

    .line 290
    invoke-direct {p0}, Landroid/support/v7/app/ActionBarDrawerToggle;->toggle()V

    .line 291
    const/4 v0, 0x1

    .line 293
    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method setActionBarDescription(I)V
    .registers 3
    .param p1, "contentDescRes"    # I

    .prologue
    .line 472
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    invoke-interface {v0, p1}, Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;->setActionBarDescription(I)V

    .line 473
    return-void
.end method

.method setActionBarUpIndicator(Landroid/graphics/drawable/Drawable;I)V
    .registers 5
    .param p1, "upDrawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "contentDescRes"    # I

    .prologue
    .line 462
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mWarnedForDisplayHomeAsUp:Z

    if-nez v0, :cond_16

    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    invoke-interface {v0}, Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;->isNavigationVisible()Z

    move-result v0

    if-nez v0, :cond_16

    .line 463
    const-string v0, "ActionBarDrawerToggle"

    const-string v1, "DrawerToggle may not show up because NavigationIcon is not visible. You may need to call actionbar.setDisplayHomeAsUpEnabled(true);"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mWarnedForDisplayHomeAsUp:Z

    .line 468
    :cond_16
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mActivityImpl:Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;

    invoke-interface {v0, p1, p2}, Landroid/support/v7/app/ActionBarDrawerToggle$Delegate;->setActionBarUpIndicator(Landroid/graphics/drawable/Drawable;I)V

    .line 469
    return-void
.end method

.method public setDrawerIndicatorEnabled(Z)V
    .registers 5
    .param p1, "enable"    # Z

    .prologue
    .line 367
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eq p1, v0, :cond_1c

    .line 368
    if-eqz p1, :cond_20

    .line 369
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    check-cast v0, Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    const v2, 0x800003

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v1

    if-eqz v1, :cond_1d

    iget v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mCloseDrawerContentDescRes:I

    :goto_17
    invoke-virtual {p0, v0, v1}, Landroid/support/v7/app/ActionBarDrawerToggle;->setActionBarUpIndicator(Landroid/graphics/drawable/Drawable;I)V

    .line 375
    :goto_1a
    iput-boolean p1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    .line 377
    :cond_1c
    return-void

    .line 369
    :cond_1d
    iget v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mOpenDrawerContentDescRes:I

    goto :goto_17

    .line 373
    :cond_20
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mHomeAsUpIndicator:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/app/ActionBarDrawerToggle;->setActionBarUpIndicator(Landroid/graphics/drawable/Drawable;I)V

    goto :goto_1a
.end method

.method public setHomeAsUpIndicator(I)V
    .registers 4
    .param p1, "resId"    # I

    .prologue
    .line 341
    const/4 v0, 0x0

    .line 342
    .local v0, "indicator":Landroid/graphics/drawable/Drawable;
    if-eqz p1, :cond_d

    .line 343
    iget-object v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v1}, Landroid/support/v4/widget/DrawerLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 345
    :cond_d
    invoke-virtual {p0, v0}, Landroid/support/v7/app/ActionBarDrawerToggle;->setHomeAsUpIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 346
    return-void
.end method

.method public setHomeAsUpIndicator(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "indicator"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v1, 0x0

    .line 316
    if-nez p1, :cond_15

    .line 317
    invoke-virtual {p0}, Landroid/support/v7/app/ActionBarDrawerToggle;->getThemeUpIndicator()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mHomeAsUpIndicator:Landroid/graphics/drawable/Drawable;

    .line 318
    iput-boolean v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mHasCustomUpIndicator:Z

    .line 324
    :goto_b
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-nez v0, :cond_14

    .line 325
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mHomeAsUpIndicator:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/app/ActionBarDrawerToggle;->setActionBarUpIndicator(Landroid/graphics/drawable/Drawable;I)V

    .line 327
    :cond_14
    return-void

    .line 320
    :cond_15
    iput-object p1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mHomeAsUpIndicator:Landroid/graphics/drawable/Drawable;

    .line 321
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mHasCustomUpIndicator:Z

    goto :goto_b
.end method

.method public setToolbarNavigationClickListener(Landroid/view/View$OnClickListener;)V
    .registers 2
    .param p1, "onToolbarNavigationClickListener"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 458
    iput-object p1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mToolbarNavigationClickListener:Landroid/view/View$OnClickListener;

    .line 459
    return-void
.end method

.method public syncState()V
    .registers 4

    .prologue
    const v2, 0x800003

    .line 251
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v0, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 252
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-interface {v0, v1}, Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;->setPosition(F)V

    .line 256
    :goto_12
    iget-boolean v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerIndicatorEnabled:Z

    if-eqz v0, :cond_27

    .line 257
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    check-cast v0, Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mDrawerLayout:Landroid/support/v4/widget/DrawerLayout;

    invoke-virtual {v1, v2}, Landroid/support/v4/widget/DrawerLayout;->isDrawerOpen(I)Z

    move-result v1

    if-eqz v1, :cond_2f

    iget v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mCloseDrawerContentDescRes:I

    :goto_24
    invoke-virtual {p0, v0, v1}, Landroid/support/v7/app/ActionBarDrawerToggle;->setActionBarUpIndicator(Landroid/graphics/drawable/Drawable;I)V

    .line 261
    :cond_27
    return-void

    .line 254
    :cond_28
    iget-object v0, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mSlider:Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/support/v7/app/ActionBarDrawerToggle$DrawerToggle;->setPosition(F)V

    goto :goto_12

    .line 257
    :cond_2f
    iget v1, p0, Landroid/support/v7/app/ActionBarDrawerToggle;->mOpenDrawerContentDescRes:I

    goto :goto_24
.end method
