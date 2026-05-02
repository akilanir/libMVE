.class public abstract Lcom/github/paolorotolo/appintro/AppIntro2;
.super Landroid/support/v7/app/AppCompatActivity;
.source "AppIntro2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/paolorotolo/appintro/AppIntro2$TransformType;
    }
.end annotation


# static fields
.field public static final DEFAULT_COLOR:I = 0x1

.field private static final DEFAULT_SCROLL_DURATION_FACTOR:I = 0x1

.field private static final PERMISSIONS_REQUEST_ALL_PERMISSIONS:I = 0x1

.field private static TAG:Ljava/lang/String;


# instance fields
.field private STATUS_BAR_VISIBLE:Z

.field private argbEvaluator:Landroid/animation/ArgbEvaluator;

.field protected backgroundFrame:Landroid/widget/FrameLayout;

.field protected baseProgressButtonEnabled:Z

.field protected customBackgroundView:Landroid/view/View;

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

.field protected slidesNumber:I

.field private transitionColors:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected unselectedIndicatorColor:I

.field protected vibrateIntensity:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 435
    const-string v0, "AppIntro2"

    sput-object v0, Lcom/github/paolorotolo/appintro/AppIntro2;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 26
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 29
    iput-boolean v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->STATUS_BAR_VISIBLE:Z

    .line 33
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->fragments:Ljava/util/List;

    .line 38
    iput-boolean v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->isVibrateOn:Z

    .line 39
    const/16 v0, 0x14

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->vibrateIntensity:I

    .line 40
    iput-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->baseProgressButtonEnabled:Z

    .line 41
    iput-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    .line 42
    iput v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->selectedIndicatorColor:I

    .line 43
    iput v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->unselectedIndicatorColor:I

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->permissionsArray:Ljava/util/ArrayList;

    .line 52
    new-instance v0, Landroid/animation/ArgbEvaluator;

    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->argbEvaluator:Landroid/animation/ArgbEvaluator;

    .line 54
    return-void
.end method

.method static synthetic access$000(Lcom/github/paolorotolo/appintro/AppIntro2;)Ljava/util/ArrayList;
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->transitionColors:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/github/paolorotolo/appintro/AppIntro2;)Landroid/animation/ArgbEvaluator;
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->argbEvaluator:Landroid/animation/ArgbEvaluator;

    return-object v0
.end method

.method private initController()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 208
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    if-nez v1, :cond_c

    .line 209
    new-instance v1, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;

    invoke-direct {v1}, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;-><init>()V

    iput-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 211
    :cond_c
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->indicator_container:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 212
    .local v0, "indicatorContainer":Landroid/widget/FrameLayout;
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    invoke-interface {v1, p0}, Lcom/github/paolorotolo/appintro/IndicatorController;->newInstance(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 214
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    iget v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I

    invoke-interface {v1, v2}, Lcom/github/paolorotolo/appintro/IndicatorController;->initialize(I)V

    .line 215
    iget v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->selectedIndicatorColor:I

    if-eq v1, v3, :cond_2f

    .line 216
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    iget v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->selectedIndicatorColor:I

    invoke-interface {v1, v2}, Lcom/github/paolorotolo/appintro/IndicatorController;->setSelectedIndicatorColor(I)V

    .line 217
    :cond_2f
    iget v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->unselectedIndicatorColor:I

    if-eq v1, v3, :cond_3a

    .line 218
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    iget v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->unselectedIndicatorColor:I

    invoke-interface {v1, v2}, Lcom/github/paolorotolo/appintro/IndicatorController;->setUnselectedIndicatorColor(I)V

    .line 219
    :cond_3a
    return-void
.end method

.method private setButtonState(Landroid/view/View;Z)V
    .registers 4
    .param p1, "button"    # Landroid/view/View;
    .param p2, "show"    # Z

    .prologue
    .line 268
    if-eqz p2, :cond_7

    .line 269
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 273
    :goto_6
    return-void

    .line 271
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
    .line 222
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 223
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/PagerAdapter;->notifyDataSetChanged()V

    .line 224
    return-void
.end method

.method public askForPermissions([Ljava/lang/String;I)V
    .registers 7
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "slidesNumber"    # I

    .prologue
    .line 438
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_16

    .line 439
    if-nez p2, :cond_17

    .line 440
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Invalid Slide Number"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 447
    :cond_16
    :goto_16
    return-void

    .line 442
    :cond_17
    new-instance v0, Lcom/github/paolorotolo/appintro/PermissionObject;

    invoke-direct {v0, p1, p2}, Lcom/github/paolorotolo/appintro/PermissionObject;-><init>([Ljava/lang/String;I)V

    .line 443
    .local v0, "permission":Lcom/github/paolorotolo/appintro/PermissionObject;
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->permissionsArray:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 444
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->setSwipeLock(Z)V

    goto :goto_16
.end method

.method public getPager()Lcom/github/paolorotolo/appintro/AppIntroViewPager;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

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
    .line 228
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

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
    .line 264
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    return v0
.end method

.method protected final onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x1

    .line 64
    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro2;->requestWindowFeature(I)Z

    .line 65
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 66
    sget v0, Lcom/github/paolorotolo/appintro/R$layout;->intro_layout2:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->setContentView(I)V

    .line 68
    sget v0, Lcom/github/paolorotolo/appintro/R$id;->next:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->nextButton:Landroid/view/View;

    .line 69
    sget v0, Lcom/github/paolorotolo/appintro/R$id;->done:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->doneButton:Landroid/view/View;

    .line 70
    sget v0, Lcom/github/paolorotolo/appintro/R$id;->background:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->backgroundFrame:Landroid/widget/FrameLayout;

    .line 71
    const-string v0, "vibrator"

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mVibrator:Landroid/os/Vibrator;

    .line 72
    new-instance v0, Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->fragments:Ljava/util/List;

    invoke-direct {v0, v1, v2}, Lcom/github/paolorotolo/appintro/PagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    .line 73
    sget v0, Lcom/github/paolorotolo/appintro/R$id;->view_pager:I

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    .line 74
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 76
    if-eqz p1, :cond_53

    .line 77
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro2;->restoreLockingState(Landroid/os/Bundle;)V

    .line 80
    :cond_53
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->nextButton:Landroid/view/View;

    new-instance v1, Lcom/github/paolorotolo/appintro/AppIntro2$1;

    invoke-direct {v1, p0}, Lcom/github/paolorotolo/appintro/AppIntro2$1;-><init>(Lcom/github/paolorotolo/appintro/AppIntro2;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->doneButton:Landroid/view/View;

    new-instance v1, Lcom/github/paolorotolo/appintro/AppIntro2$2;

    invoke-direct {v1, p0}, Lcom/github/paolorotolo/appintro/AppIntro2$2;-><init>(Lcom/github/paolorotolo/appintro/AppIntro2;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    new-instance v1, Lcom/github/paolorotolo/appintro/AppIntro2$3;

    invoke-direct {v1, p0}, Lcom/github/paolorotolo/appintro/AppIntro2$3;-><init>(Lcom/github/paolorotolo/appintro/AppIntro2;)V

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 163
    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro2;->setScrollDurationFactor(I)V

    .line 165
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->savedCurrentItem:I

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setCurrentItem(I)V

    .line 167
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro2;->init(Landroid/os/Bundle;)V

    .line 168
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->fragments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I

    .line 170
    iget v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I

    if-ne v0, v3, :cond_90

    .line 171
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->setProgressButtonEnabled(Z)V

    .line 175
    :goto_8f
    return-void

    .line 173
    :cond_90
    invoke-direct {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->initController()V

    goto :goto_8f
.end method

.method public abstract onDonePressed()V
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "code"    # I
    .param p2, "kevent"    # Landroid/view/KeyEvent;

    .prologue
    .line 362
    const/16 v1, 0x42

    if-eq p1, v1, :cond_c

    const/16 v1, 0x60

    if-eq p1, v1, :cond_c

    const/16 v1, 0x17

    if-ne p1, v1, :cond_33

    .line 363
    :cond_c
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->view_pager:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    .line 364
    .local v0, "vp":Landroid/support/v4/view/ViewPager;
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_29

    .line 365
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->onDonePressed()V

    .line 369
    :goto_27
    const/4 v1, 0x0

    .line 371
    .end local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :goto_28
    return v1

    .line 367
    .restart local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :cond_29
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    goto :goto_27

    .line 371
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
    .line 451
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 452
    packed-switch p1, :pswitch_data_1c

    .line 457
    sget-object v0, Lcom/github/paolorotolo/appintro/AppIntro2;->TAG:Ljava/lang/String;

    const-string v1, "Unexpected request code"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 460
    :goto_d
    return-void

    .line 454
    :pswitch_e
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setCurrentItem(I)V

    goto :goto_d

    .line 452
    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_e
    .end packed-switch
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 183
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 184
    const-string v0, "baseProgressButtonEnabled"

    iget-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->baseProgressButtonEnabled:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 185
    const-string v0, "progressButtonEnabled"

    iget-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 186
    const-string v0, "nextEnabled"

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->isPagingEnabled()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 187
    const-string v0, "nextPagingEnabled"

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->isNextPagingEnabled()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 188
    const-string v0, "lockPage"

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getLockPage()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 189
    const-string v0, "currentItem"

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 190
    return-void
.end method

.method public abstract onSlideChanged()V
.end method

.method protected restoreLockingState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 194
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onRestoreInstanceState(Landroid/os/Bundle;)V

    .line 195
    const-string v0, "baseProgressButtonEnabled"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->baseProgressButtonEnabled:Z

    .line 196
    const-string v0, "progressButtonEnabled"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    .line 197
    const-string v0, "currentItem"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->savedCurrentItem:I

    .line 198
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const-string v1, "nextEnabled"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPagingEnabled(Z)V

    .line 199
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const-string v1, "nextPagingEnabled"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setNextPagingEnabled(Z)V

    .line 200
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const-string v1, "lockPage"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setLockPage(I)V

    .line 201
    return-void
.end method

.method public setAnimationColors(Ljava/util/ArrayList;)V
    .registers 2
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 432
    .local p1, "colors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->transitionColors:Ljava/util/ArrayList;

    .line 433
    return-void
.end method

.method public setBackgroundView(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 292
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->customBackgroundView:Landroid/view/View;

    .line 293
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->customBackgroundView:Landroid/view/View;

    if-eqz v0, :cond_d

    .line 294
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->backgroundFrame:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->customBackgroundView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 296
    :cond_d
    return-void
.end method

.method public setCustomIndicator(Lcom/github/paolorotolo/appintro/IndicatorController;)V
    .registers 2
    .param p1, "controller"    # Lcom/github/paolorotolo/appintro/IndicatorController;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 349
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 350
    return-void
.end method

.method public setCustomTransformer(Landroid/support/v4/view/ViewPager$PageTransformer;)V
    .registers 4
    .param p1, "transformer"    # Landroid/support/v4/view/ViewPager$PageTransformer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 327
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 328
    return-void
.end method

.method public setDepthAnimation()V
    .registers 5

    .prologue
    .line 323
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->DEPTH:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 324
    return-void
.end method

.method public setFadeAnimation()V
    .registers 5

    .prologue
    .line 307
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->FADE:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 308
    return-void
.end method

.method public setFlowAnimation()V
    .registers 5

    .prologue
    .line 315
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->FLOW:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 316
    return-void
.end method

.method public setIndicatorColor(II)V
    .registers 5
    .param p1, "selectedIndicatorColor"    # I
    .param p2, "unselectedIndicatorColor"    # I

    .prologue
    const/4 v1, 0x1

    .line 378
    iput p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->selectedIndicatorColor:I

    .line 379
    iput p2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->unselectedIndicatorColor:I

    .line 381
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    if-eqz v0, :cond_17

    .line 382
    if-eq p1, v1, :cond_10

    .line 383
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    invoke-interface {v0, p1}, Lcom/github/paolorotolo/appintro/IndicatorController;->setSelectedIndicatorColor(I)V

    .line 384
    :cond_10
    if-eq p2, v1, :cond_17

    .line 385
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    invoke-interface {v0, p2}, Lcom/github/paolorotolo/appintro/IndicatorController;->setUnselectedIndicatorColor(I)V

    .line 387
    :cond_17
    return-void
.end method

.method public setNavBarColor(Ljava/lang/String;)V
    .registers 4
    .param p1, "Color"    # Ljava/lang/String;

    .prologue
    .line 276
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_11

    .line 277
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 279
    :cond_11
    return-void
.end method

.method public setNextPageSwipeLock(Z)V
    .registers 5
    .param p1, "lockEnable"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 397
    if-eqz p1, :cond_18

    .line 399
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->baseProgressButtonEnabled:Z

    .line 400
    if-nez p1, :cond_16

    move v0, v1

    :goto_b
    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->setProgressButtonEnabled(Z)V

    .line 405
    :goto_e
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    if-nez p1, :cond_1e

    :goto_12
    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setNextPagingEnabled(Z)V

    .line 406
    return-void

    :cond_16
    move v0, v2

    .line 400
    goto :goto_b

    .line 403
    :cond_18
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->baseProgressButtonEnabled:Z

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->setProgressButtonEnabled(Z)V

    goto :goto_e

    :cond_1e
    move v1, v2

    .line 405
    goto :goto_12
.end method

.method public setOffScreenPageLimit(I)V
    .registers 3
    .param p1, "limit"    # I

    .prologue
    .line 331
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v0, p1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setOffscreenPageLimit(I)V

    .line 332
    return-void
.end method

.method public setProgressButtonEnabled(Z)V
    .registers 6
    .param p1, "progressButtonEnabled"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 248
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    .line 249
    if-eqz p1, :cond_28

    .line 250
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v0

    iget v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I

    add-int/lit8 v1, v1, -0x1

    if-ne v0, v1, :cond_1d

    .line 251
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->nextButton:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->setButtonState(Landroid/view/View;Z)V

    .line 252
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->doneButton:Landroid/view/View;

    invoke-direct {p0, v0, v3}, Lcom/github/paolorotolo/appintro/AppIntro2;->setButtonState(Landroid/view/View;Z)V

    .line 261
    :goto_1c
    return-void

    .line 254
    :cond_1d
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->nextButton:Landroid/view/View;

    invoke-direct {p0, v0, v3}, Lcom/github/paolorotolo/appintro/AppIntro2;->setButtonState(Landroid/view/View;Z)V

    .line 255
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->doneButton:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->setButtonState(Landroid/view/View;Z)V

    goto :goto_1c

    .line 258
    :cond_28
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->nextButton:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->setButtonState(Landroid/view/View;Z)V

    .line 259
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->doneButton:Landroid/view/View;

    invoke-direct {p0, v0, v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->setButtonState(Landroid/view/View;Z)V

    goto :goto_1c
.end method

.method public setProgressIndicator()V
    .registers 2

    .prologue
    .line 339
    new-instance v0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;

    invoke-direct {v0}, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 340
    return-void
.end method

.method protected setScrollDurationFactor(I)V
    .registers 5
    .param p1, "factor"    # I

    .prologue
    .line 178
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    int-to-double v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setScrollDurationFactor(D)V

    .line 179
    return-void
.end method

.method public setSlideOverAnimation()V
    .registers 5

    .prologue
    .line 319
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->SLIDE_OVER:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 320
    return-void
.end method

.method public setSwipeLock(Z)V
    .registers 4
    .param p1, "lockEnable"    # Z

    .prologue
    .line 415
    if-eqz p1, :cond_f

    .line 417
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->baseProgressButtonEnabled:Z

    .line 423
    :goto_6
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    if-nez p1, :cond_15

    const/4 v0, 0x1

    :goto_b
    invoke-virtual {v1, v0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPagingEnabled(Z)V

    .line 424
    return-void

    .line 421
    :cond_f
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->baseProgressButtonEnabled:Z

    invoke-virtual {p0, v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->setProgressButtonEnabled(Z)V

    goto :goto_6

    .line 423
    :cond_15
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public setVibrate(Z)V
    .registers 2
    .param p1, "vibrate"    # Z

    .prologue
    .line 299
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->isVibrateOn:Z

    .line 300
    return-void
.end method

.method public setVibrateIntensity(I)V
    .registers 2
    .param p1, "intensity"    # I

    .prologue
    .line 303
    iput p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->vibrateIntensity:I

    .line 304
    return-void
.end method

.method public setZoomAnimation()V
    .registers 5

    .prologue
    .line 311
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->ZOOM:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 312
    return-void
.end method

.method public showDoneButton(Z)V
    .registers 2
    .param p1, "showDone"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 238
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro2;->setProgressButtonEnabled(Z)V

    .line 239
    return-void
.end method

.method public showStatusBar(Z)V
    .registers 4
    .param p1, "isVisible"    # Z

    .prologue
    const/16 v1, 0x400

    .line 282
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->STATUS_BAR_VISIBLE:Z

    .line 284
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->STATUS_BAR_VISIBLE:Z

    if-eqz v0, :cond_10

    .line 285
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->clearFlags(I)V

    .line 290
    :goto_f
    return-void

    .line 287
    :cond_10
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    goto :goto_f
.end method
