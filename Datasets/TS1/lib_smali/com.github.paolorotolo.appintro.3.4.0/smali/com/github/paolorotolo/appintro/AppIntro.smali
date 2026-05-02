.class public abstract Lcom/github/paolorotolo/appintro/AppIntro;
.super Landroid/support/v7/app/AppCompatActivity;
.source "AppIntro.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/paolorotolo/appintro/AppIntro$TransformType;
    }
.end annotation


# static fields
.field public static final DEFAULT_COLOR:I = 0x1

.field private static final DEFAULT_SCROLL_DURATION_FACTOR:I = 0x1

.field private static final PERMISSIONS_REQUEST_ALL_PERMISSIONS:I = 0x1

.field private static TAG:Ljava/lang/String;


# instance fields
.field protected baseProgressButtonEnabled:Z

.field protected doneButton:Landroid/view/View;

.field protected dots:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field protected fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field protected isVibrateOn:Z

.field protected mController:Lcom/github/paolorotolo/appintro/IndicatorController;

.field protected mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

.field protected mVibrator:Landroid/os/Vibrator;

.field protected nextButton:Landroid/view/View;

.field protected pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

.field protected permissionsArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/github/paolorotolo/appintro/PermissionObject;",
            ">;"
        }
    .end annotation
.end field

.field protected progressButtonEnabled:Z

.field protected savedCurrentItem:I

.field protected selectedIndicatorColor:I

.field protected skipButton:Landroid/view/View;

.field protected skipButtonEnabled:Z

.field protected slidesNumber:I

.field protected unselectedIndicatorColor:I

.field protected vibrateIntensity:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 572
    const-string v0, "AppIntro1"

    sput-object v0, Lcom/github/paolorotolo/appintro/AppIntro;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 31
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 37
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->fragments:Ljava/util/List;

    .line 42
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->isVibrateOn:Z

    .line 43
    const/16 v0, 0x14

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->vibrateIntensity:I

    .line 44
    iput-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->skipButtonEnabled:Z

    .line 45
    iput-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->baseProgressButtonEnabled:Z

    .line 46
    iput-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->progressButtonEnabled:Z

    .line 47
    iput v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->selectedIndicatorColor:I

    .line 48
    iput v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->unselectedIndicatorColor:I

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->permissionsArray:Ljava/util/ArrayList;

    .line 56
    return-void
.end method

.method static synthetic access$000(Lcom/github/paolorotolo/appintro/AppIntro;Landroid/view/View;Z)V
    .registers 3
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro;
    .param p1, "x1"    # Landroid/view/View;
    .param p2, "x2"    # Z

    .prologue
    .line 31
    invoke-direct {p0, p1, p2}, Lcom/github/paolorotolo/appintro/AppIntro;->setButtonState(Landroid/view/View;Z)V

    return-void
.end method

.method private initController()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 218
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    if-nez v1, :cond_c

    .line 219
    new-instance v1, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;

    invoke-direct {v1}, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;-><init>()V

    iput-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 221
    :cond_c
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->indicator_container:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 222
    .local v0, "indicatorContainer":Landroid/widget/FrameLayout;
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    invoke-interface {v1, p0}, Lcom/github/paolorotolo/appintro/IndicatorController;->newInstance(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 224
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    iget v2, p0, Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I

    invoke-interface {v1, v2}, Lcom/github/paolorotolo/appintro/IndicatorController;->initialize(I)V

    .line 225
    iget v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->selectedIndicatorColor:I

    if-eq v1, v3, :cond_2f

    .line 226
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    iget v2, p0, Lcom/github/paolorotolo/appintro/AppIntro;->selectedIndicatorColor:I

    invoke-interface {v1, v2}, Lcom/github/paolorotolo/appintro/IndicatorController;->setSelectedIndicatorColor(I)V

    .line 227
    :cond_2f
    iget v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->unselectedIndicatorColor:I

    if-eq v1, v3, :cond_3a

    .line 228
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    iget v2, p0, Lcom/github/paolorotolo/appintro/AppIntro;->unselectedIndicatorColor:I

    invoke-interface {v1, v2}, Lcom/github/paolorotolo/appintro/IndicatorController;->setUnselectedIndicatorColor(I)V

    .line 229
    :cond_3a
    return-void
.end method

.method private setButtonState(Landroid/view/View;Z)V
    .registers 4
    .param p1, "button"    # Landroid/view/View;
    .param p2, "show"    # Z

    .prologue
    .line 250
    if-eqz p2, :cond_7

    .line 251
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 255
    :goto_6
    return-void

    .line 253
    :cond_7
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6
.end method


# virtual methods
.method public addSlide(Landroid/support/v4/app/Fragment;)V
    .registers 3
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 232
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 233
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/PagerAdapter;->notifyDataSetChanged()V

    .line 234
    return-void
.end method

.method public askForPermissions([Ljava/lang/String;I)V
    .registers 7
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "slidesNumber"    # I

    .prologue
    .line 575
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_16

    .line 576
    if-nez p2, :cond_17

    .line 577
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Invalid Slide Number"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 584
    :cond_16
    :goto_16
    return-void

    .line 579
    :cond_17
    new-instance v0, Lcom/github/paolorotolo/appintro/PermissionObject;

    invoke-direct {v0, p1, p2}, Lcom/github/paolorotolo/appintro/PermissionObject;-><init>([Ljava/lang/String;I)V

    .line 580
    .local v0, "permission":Lcom/github/paolorotolo/appintro/PermissionObject;
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->permissionsArray:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 581
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->setSwipeLock(Z)V

    goto :goto_16
.end method

.method public getPager()Lcom/github/paolorotolo/appintro/AppIntroViewPager;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    return-object v0
.end method

.method public getSlides()Ljava/util/List;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 238
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/PagerAdapter;->getFragments()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public abstract init(Landroid/os/Bundle;)V
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public isProgressButtonEnabled()Z
    .registers 2

    .prologue
    .line 242
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->progressButtonEnabled:Z

    return v0
.end method

.method public isSkipButtonEnabled()Z
    .registers 2

    .prologue
    .line 246
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->skipButtonEnabled:Z

    return v0
.end method

.method protected final onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 66
    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->requestWindowFeature(I)Z

    .line 68
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 70
    sget v0, Lcom/github/paolorotolo/appintro/R$layout;->intro_layout:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->setContentView(I)V

    .line 72
    sget v0, Lcom/github/paolorotolo/appintro/R$id;->skip:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->skipButton:Landroid/view/View;

    .line 73
    sget v0, Lcom/github/paolorotolo/appintro/R$id;->next:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->nextButton:Landroid/view/View;

    .line 74
    sget v0, Lcom/github/paolorotolo/appintro/R$id;->done:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->doneButton:Landroid/view/View;

    .line 75
    const-string v0, "vibrator"

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mVibrator:Landroid/os/Vibrator;

    .line 76
    new-instance v0, Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro;->fragments:Ljava/util/List;

    invoke-direct {v0, v1, v2}, Lcom/github/paolorotolo/appintro/PagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    .line 77
    sget v0, Lcom/github/paolorotolo/appintro/R$id;->view_pager:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    .line 78
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 80
    if-eqz p1, :cond_51

    .line 81
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro;->restoreLockingState(Landroid/os/Bundle;)V

    .line 84
    :cond_51
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->skipButton:Landroid/view/View;

    new-instance v1, Lcom/github/paolorotolo/appintro/AppIntro$1;

    invoke-direct {v1, p0}, Lcom/github/paolorotolo/appintro/AppIntro$1;-><init>(Lcom/github/paolorotolo/appintro/AppIntro;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->nextButton:Landroid/view/View;

    new-instance v1, Lcom/github/paolorotolo/appintro/AppIntro$2;

    invoke-direct {v1, p0}, Lcom/github/paolorotolo/appintro/AppIntro$2;-><init>(Lcom/github/paolorotolo/appintro/AppIntro;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->doneButton:Landroid/view/View;

    new-instance v1, Lcom/github/paolorotolo/appintro/AppIntro$3;

    invoke-direct {v1, p0}, Lcom/github/paolorotolo/appintro/AppIntro$3;-><init>(Lcom/github/paolorotolo/appintro/AppIntro;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    new-instance v1, Lcom/github/paolorotolo/appintro/AppIntro$4;

    invoke-direct {v1, p0}, Lcom/github/paolorotolo/appintro/AppIntro$4;-><init>(Lcom/github/paolorotolo/appintro/AppIntro;)V

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 170
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->savedCurrentItem:I

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setCurrentItem(I)V

    .line 172
    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->setScrollDurationFactor(I)V

    .line 174
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro;->init(Landroid/os/Bundle;)V

    .line 175
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I

    .line 177
    iget v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I

    if-ne v0, v3, :cond_98

    .line 178
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->progressButtonEnabled:Z

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->setProgressButtonEnabled(Z)V

    .line 182
    :goto_97
    return-void

    .line 180
    :cond_98
    invoke-direct {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->initController()V

    goto :goto_97
.end method

.method public abstract onDonePressed()V
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "code"    # I
    .param p2, "kvent"    # Landroid/view/KeyEvent;

    .prologue
    .line 273
    const/16 v1, 0x42

    if-eq p1, v1, :cond_c

    const/16 v1, 0x60

    if-eq p1, v1, :cond_c

    const/16 v1, 0x17

    if-ne p1, v1, :cond_33

    .line 274
    :cond_c
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->view_pager:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    .line 275
    .local v0, "vp":Landroid/support/v4/view/ViewPager;
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_29

    .line 276
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->onDonePressed()V

    .line 280
    :goto_27
    const/4 v1, 0x0

    .line 282
    .end local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :goto_28
    return v1

    .line 278
    .restart local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :cond_29
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    goto :goto_27

    .line 282
    .end local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :cond_33
    invoke-super {p0, p1, p2}, Landroid/support/v7/app/AppCompatActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_28
.end method

.method public abstract onNextPressed()V
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .registers 6
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "grantResults"    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 588
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 589
    packed-switch p1, :pswitch_data_1c

    .line 594
    sget-object v0, Lcom/github/paolorotolo/appintro/AppIntro;->TAG:Ljava/lang/String;

    const-string v1, "Unexpected request code"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 597
    :goto_d
    return-void

    .line 591
    :pswitch_e
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setCurrentItem(I)V

    goto :goto_d

    .line 589
    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_e
    .end packed-switch
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 191
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 192
    const-string v0, "baseProgressButtonEnabled"

    iget-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->baseProgressButtonEnabled:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 193
    const-string v0, "progressButtonEnabled"

    iget-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->progressButtonEnabled:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 194
    const-string v0, "skipButtonEnabled"

    iget-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->skipButtonEnabled:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 195
    const-string v0, "nextEnabled"

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->isPagingEnabled()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 196
    const-string v0, "nextPagingEnabled"

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->isNextPagingEnabled()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 197
    const-string v0, "lockPage"

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getLockPage()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 198
    const-string v0, "currentItem"

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 199
    return-void
.end method

.method public abstract onSkipPressed()V
.end method

.method public abstract onSlideChanged()V
.end method

.method protected restoreLockingState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 203
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 204
    const-string v0, "baseProgressButtonEnabled"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->baseProgressButtonEnabled:Z

    .line 205
    const-string v0, "progressButtonEnabled"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->progressButtonEnabled:Z

    .line 206
    const-string v0, "skipButtonEnabled"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->skipButtonEnabled:Z

    .line 207
    const-string v0, "currentItem"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->savedCurrentItem:I

    .line 208
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const-string v1, "nextEnabled"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPagingEnabled(Z)V

    .line 209
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const-string v1, "nextPagingEnabled"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setNextPagingEnabled(Z)V

    .line 210
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const-string v1, "lockPage"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setLockPage(I)V

    .line 211
    return-void
.end method

.method public setBarColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 313
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->bottom:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 314
    .local v0, "bottomBar":Landroid/widget/LinearLayout;
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 315
    return-void
.end method

.method public setColorDoneText(I)V
    .registers 4
    .param p1, "colorDoneText"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 353
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->done:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 354
    .local v0, "doneText":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 355
    return-void
.end method

.method public setColorSkipButton(I)V
    .registers 4
    .param p1, "colorSkipButton"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 363
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->skip:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 364
    .local v0, "skip":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 365
    return-void
.end method

.method public setCustomIndicator(Lcom/github/paolorotolo/appintro/IndicatorController;)V
    .registers 2
    .param p1, "controller"    # Lcom/github/paolorotolo/appintro/IndicatorController;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 468
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 469
    return-void
.end method

.method public setCustomTransformer(Landroid/support/v4/view/ViewPager$PageTransformer;)V
    .registers 4
    .param p1, "transformer"    # Landroid/support/v4/view/ViewPager$PageTransformer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 512
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 513
    return-void
.end method

.method public setDepthAnimation()V
    .registers 5

    .prologue
    .line 503
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->DEPTH:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 504
    return-void
.end method

.method public setDoneText(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 343
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->done:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 344
    .local v0, "doneText":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 345
    return-void
.end method

.method public setFadeAnimation()V
    .registers 5

    .prologue
    .line 475
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->FADE:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 476
    return-void
.end method

.method public setFlowAnimation()V
    .registers 5

    .prologue
    .line 489
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->FLOW:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 490
    return-void
.end method

.method public setImageNextButton(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "imageNextButton"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 373
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->next:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 374
    .local v0, "nextButton":Landroid/widget/ImageView;
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 376
    return-void
.end method

.method public setIndicatorColor(II)V
    .registers 5
    .param p1, "selectedIndicatorColor"    # I
    .param p2, "unselectedIndicatorColor"    # I

    .prologue
    const/4 v1, 0x1

    .line 524
    iput p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->selectedIndicatorColor:I

    .line 525
    iput p2, p0, Lcom/github/paolorotolo/appintro/AppIntro;->unselectedIndicatorColor:I

    .line 527
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    if-eqz v0, :cond_17

    .line 528
    if-eq p1, v1, :cond_10

    .line 529
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    invoke-interface {v0, p1}, Lcom/github/paolorotolo/appintro/IndicatorController;->setSelectedIndicatorColor(I)V

    .line 530
    :cond_10
    if-eq p2, v1, :cond_17

    .line 531
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    invoke-interface {v0, p2}, Lcom/github/paolorotolo/appintro/IndicatorController;->setUnselectedIndicatorColor(I)V

    .line 533
    :cond_17
    return-void
.end method

.method public setNavBarColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 395
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_11

    .line 396
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {p0, p1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 398
    :cond_11
    return-void
.end method

.method public setNavBarColor(Ljava/lang/String;)V
    .registers 4
    .param p1, "Color"    # Ljava/lang/String;

    .prologue
    .line 384
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_11

    .line 385
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 387
    :cond_11
    return-void
.end method

.method public setNextPageSwipeLock(Z)V
    .registers 5
    .param p1, "lockEnable"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 543
    if-eqz p1, :cond_18

    .line 545
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->progressButtonEnabled:Z

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->baseProgressButtonEnabled:Z

    .line 546
    if-nez p1, :cond_16

    move v0, v1

    :goto_b
    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->setProgressButtonEnabled(Z)V

    .line 551
    :goto_e
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    if-nez p1, :cond_1e

    :goto_12
    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setNextPagingEnabled(Z)V

    .line 552
    return-void

    :cond_16
    move v0, v2

    .line 546
    goto :goto_b

    .line 549
    :cond_18
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->baseProgressButtonEnabled:Z

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->setProgressButtonEnabled(Z)V

    goto :goto_e

    :cond_1e
    move v1, v2

    .line 551
    goto :goto_12
.end method

.method public setOffScreenPageLimit(I)V
    .registers 3
    .param p1, "limit"    # I

    .prologue
    .line 258
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v0, p1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setOffscreenPageLimit(I)V

    .line 259
    return-void
.end method

.method public setProgressButtonEnabled(Z)V
    .registers 6
    .param p1, "progressButtonEnabled"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 292
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->progressButtonEnabled:Z

    .line 293
    if-eqz p1, :cond_28

    .line 294
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v0

    iget v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_1d

    .line 295
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->nextButton:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/github/paolorotolo/appintro/AppIntro;->setButtonState(Landroid/view/View;Z)V

    .line 296
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->doneButton:Landroid/view/View;

    invoke-direct {p0, v0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->setButtonState(Landroid/view/View;Z)V

    .line 305
    :goto_1c
    return-void

    .line 298
    :cond_1d
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->nextButton:Landroid/view/View;

    invoke-direct {p0, v0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->setButtonState(Landroid/view/View;Z)V

    .line 299
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->doneButton:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/github/paolorotolo/appintro/AppIntro;->setButtonState(Landroid/view/View;Z)V

    goto :goto_1c

    .line 302
    :cond_28
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->nextButton:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/github/paolorotolo/appintro/AppIntro;->setButtonState(Landroid/view/View;Z)V

    .line 303
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->doneButton:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/github/paolorotolo/appintro/AppIntro;->setButtonState(Landroid/view/View;Z)V

    goto :goto_1c
.end method

.method public setProgressIndicator()V
    .registers 2

    .prologue
    .line 458
    new-instance v0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;

    invoke-direct {v0}, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 459
    return-void
.end method

.method protected setScrollDurationFactor(I)V
    .registers 5
    .param p1, "factor"    # I

    .prologue
    .line 186
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    int-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setScrollDurationFactor(D)V

    .line 187
    return-void
.end method

.method public setSeparatorColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 323
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->bottom_separator:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 324
    .local v0, "separator":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 325
    return-void
.end method

.method public setSkipText(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 333
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->skip:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 334
    .local v0, "skipText":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 335
    return-void
.end method

.method public setSlideOverAnimation()V
    .registers 5

    .prologue
    .line 496
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->SLIDE_OVER:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 497
    return-void
.end method

.method public setSwipeLock(Z)V
    .registers 4
    .param p1, "lockEnable"    # Z

    .prologue
    .line 561
    if-eqz p1, :cond_f

    .line 563
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->progressButtonEnabled:Z

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->baseProgressButtonEnabled:Z

    .line 569
    :goto_6
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    if-nez p1, :cond_15

    const/4 v0, 0x1

    :goto_b
    invoke-virtual {v1, v0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPagingEnabled(Z)V

    .line 570
    return-void

    .line 567
    :cond_f
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->baseProgressButtonEnabled:Z

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro;->setProgressButtonEnabled(Z)V

    goto :goto_6

    .line 569
    :cond_15
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public setVibrate(Z)V
    .registers 2
    .param p1, "vibrationEnabled"    # Z

    .prologue
    .line 441
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->isVibrateOn:Z

    .line 442
    return-void
.end method

.method public setVibrateIntensity(I)V
    .registers 2
    .param p1, "intensity"    # I

    .prologue
    .line 450
    iput p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->vibrateIntensity:I

    .line 451
    return-void
.end method

.method public setZoomAnimation()V
    .registers 5

    .prologue
    .line 482
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->ZOOM:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 483
    return-void
.end method

.method public showDoneButton(Z)V
    .registers 2
    .param p1, "showDone"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 432
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro;->setProgressButtonEnabled(Z)V

    .line 433
    return-void
.end method

.method public showSkipButton(Z)V
    .registers 3
    .param p1, "showButton"    # Z

    .prologue
    .line 421
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->skipButtonEnabled:Z

    .line 422
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->skipButton:Landroid/view/View;

    invoke-direct {p0, v0, p1}, Lcom/github/paolorotolo/appintro/AppIntro;->setButtonState(Landroid/view/View;Z)V

    .line 423
    return-void
.end method

.method public showStatusBar(Z)V
    .registers 4
    .param p1, "isVisible"    # Z

    .prologue
    const/16 v1, 0x400

    .line 406
    if-nez p1, :cond_c

    .line 407
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    .line 412
    :goto_b
    return-void

    .line 410
    :cond_c
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    goto :goto_b
.end method
