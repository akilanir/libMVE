.class public abstract Lcom/github/paolorotolo/appintro/AppIntro;
.super Landroid/support/v7/app/AppCompatActivity;
.source "AppIntro.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/paolorotolo/appintro/AppIntro$TransformType;
    }
.end annotation


# instance fields
.field private dots:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field private isVibrateOn:Z

.field private mController:Lcom/github/paolorotolo/appintro/IndicatorController;

.field private mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

.field private mVibrator:Landroid/os/Vibrator;

.field private pager:Landroid/support/v4/view/ViewPager;

.field private showDone:Z

.field private showSkip:Z

.field private slidesNumber:I

.field private vibrateIntensity:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 25
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 28
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->fragments:Ljava/util/List;

    .line 33
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->isVibrateOn:Z

    .line 34
    const/16 v0, 0x14

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->vibrateIntensity:I

    .line 35
    iput-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->showSkip:Z

    .line 36
    iput-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->showDone:Z

    .line 38
    return-void
.end method

.method static synthetic access$000(Lcom/github/paolorotolo/appintro/AppIntro;)Z
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->isVibrateOn:Z

    return v0
.end method

.method static synthetic access$100(Lcom/github/paolorotolo/appintro/AppIntro;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 25
    iget v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->vibrateIntensity:I

    return v0
.end method

.method static synthetic access$200(Lcom/github/paolorotolo/appintro/AppIntro;)Landroid/os/Vibrator;
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mVibrator:Landroid/os/Vibrator;

    return-object v0
.end method

.method static synthetic access$300(Lcom/github/paolorotolo/appintro/AppIntro;)Landroid/support/v4/view/ViewPager;
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/github/paolorotolo/appintro/AppIntro;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 25
    iget v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I

    return v0
.end method

.method static synthetic access$500(Lcom/github/paolorotolo/appintro/AppIntro;)Lcom/github/paolorotolo/appintro/IndicatorController;
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 25
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    return-object v0
.end method

.method static synthetic access$600(Lcom/github/paolorotolo/appintro/AppIntro;)Z
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->showDone:Z

    return v0
.end method

.method static synthetic access$700(Lcom/github/paolorotolo/appintro/AppIntro;)Z
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro;

    .prologue
    .line 25
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->showSkip:Z

    return v0
.end method

.method private initController()V
    .registers 4

    .prologue
    .line 150
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    if-nez v1, :cond_b

    .line 151
    new-instance v1, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;

    invoke-direct {v1}, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;-><init>()V

    iput-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 153
    :cond_b
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->indicator_container:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 154
    .local v0, "indicatorContainer":Landroid/widget/FrameLayout;
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    invoke-interface {v1, p0}, Lcom/github/paolorotolo/appintro/IndicatorController;->newInstance(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 156
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    iget v2, p0, Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I

    invoke-interface {v1, v2}, Lcom/github/paolorotolo/appintro/IndicatorController;->initialize(I)V

    .line 157
    return-void
.end method


# virtual methods
.method public addSlide(Landroid/support/v4/app/Fragment;)V
    .registers 3
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 169
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/PagerAdapter;->notifyDataSetChanged()V

    .line 171
    return-void
.end method

.method public getPager()Landroid/support/v4/view/ViewPager;
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

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
    .line 175
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

.method protected final onCreate(Landroid/os/Bundle;)V
    .registers 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v4, 0x400

    const/4 v6, 0x1

    .line 48
    invoke-virtual {p0, v6}, Lcom/github/paolorotolo/appintro/AppIntro;->requestWindowFeature(I)Z

    .line 50
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 52
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v4, v4}, Landroid/view/Window;->setFlags(II)V

    .line 54
    sget v3, Lcom/github/paolorotolo/appintro/R$layout;->intro_layout:I

    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->setContentView(I)V

    .line 56
    sget v3, Lcom/github/paolorotolo/appintro/R$id;->skip:I

    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 57
    .local v2, "skipButton":Landroid/widget/TextView;
    sget v3, Lcom/github/paolorotolo/appintro/R$id;->next:I

    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 58
    .local v1, "nextButton":Landroid/widget/ImageView;
    sget v3, Lcom/github/paolorotolo/appintro/R$id;->done:I

    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 59
    .local v0, "doneButton":Landroid/widget/TextView;
    const-string v3, "vibrator"

    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/Vibrator;

    iput-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mVibrator:Landroid/os/Vibrator;

    .line 61
    new-instance v3, Lcom/github/paolorotolo/appintro/AppIntro$1;

    invoke-direct {v3, p0}, Lcom/github/paolorotolo/appintro/AppIntro$1;-><init>(Lcom/github/paolorotolo/appintro/AppIntro;)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 71
    new-instance v3, Lcom/github/paolorotolo/appintro/AppIntro$2;

    invoke-direct {v3, p0}, Lcom/github/paolorotolo/appintro/AppIntro$2;-><init>(Lcom/github/paolorotolo/appintro/AppIntro;)V

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    new-instance v3, Lcom/github/paolorotolo/appintro/AppIntro$3;

    invoke-direct {v3, p0}, Lcom/github/paolorotolo/appintro/AppIntro$3;-><init>(Lcom/github/paolorotolo/appintro/AppIntro;)V

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 91
    new-instance v3, Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v4

    iget-object v5, p0, Lcom/github/paolorotolo/appintro/AppIntro;->fragments:Ljava/util/List;

    invoke-direct {v3, v4, v5}, Lcom/github/paolorotolo/appintro/PagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iput-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    .line 92
    sget v3, Lcom/github/paolorotolo/appintro/R$id;->view_pager:I

    invoke-virtual {p0, v3}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/support/v4/view/ViewPager;

    iput-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    .line 94
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    iget-object v4, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 98
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    new-instance v4, Lcom/github/paolorotolo/appintro/AppIntro$4;

    invoke-direct {v4, p0, v2, v1, v0}, Lcom/github/paolorotolo/appintro/AppIntro$4;-><init>(Lcom/github/paolorotolo/appintro/AppIntro;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    invoke-virtual {v3, v4}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 133
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro;->init(Landroid/os/Bundle;)V

    .line 134
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro;->fragments:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    iput v3, p0, Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I

    .line 136
    iget v3, p0, Lcom/github/paolorotolo/appintro/AppIntro;->slidesNumber:I

    if-ne v3, v6, :cond_90

    .line 137
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 138
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 142
    :goto_8f
    return-void

    .line 140
    :cond_90
    invoke-direct {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->initController()V

    goto :goto_8f
.end method

.method public abstract onDonePressed()V
.end method

.method public onDotSelected(I)V
    .registers 2
    .param p1, "index"    # I

    .prologue
    .line 271
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "code"    # I
    .param p2, "kvent"    # Landroid/view/KeyEvent;

    .prologue
    .line 275
    const/16 v1, 0x42

    if-eq p1, v1, :cond_8

    const/16 v1, 0x60

    if-ne p1, v1, :cond_2f

    .line 276
    :cond_8
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->view_pager:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    .line 277
    .local v0, "vp":Landroid/support/v4/view/ViewPager;
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_25

    .line 278
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->onDonePressed()V

    .line 282
    :goto_23
    const/4 v1, 0x0

    .line 284
    .end local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :goto_24
    return v1

    .line 280
    .restart local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :cond_25
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    goto :goto_23

    .line 284
    .end local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :cond_2f
    invoke-super {p0, p1, p2}, Landroid/support/v7/app/AppCompatActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_24
.end method

.method public abstract onSkipPressed()V
.end method

.method public selectDot(I)V
    .registers 7
    .param p1, "index"    # I

    .prologue
    .line 159
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 160
    .local v3, "res":Landroid/content/res/Resources;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    iget-object v4, p0, Lcom/github/paolorotolo/appintro/AppIntro;->fragments:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_26

    .line 161
    if-ne v2, p1, :cond_23

    sget v1, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_white:I

    .line 162
    .local v1, "drawableId":I
    :goto_11
    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 163
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v4, p0, Lcom/github/paolorotolo/appintro/AppIntro;->dots:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 160
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 161
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v1    # "drawableId":I
    :cond_23
    sget v1, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_grey:I

    goto :goto_11

    .line 165
    :cond_26
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro;->onDotSelected(I)V

    .line 166
    return-void
.end method

.method public setBarColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 179
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->bottom:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 180
    .local v0, "bottomBar":Landroid/widget/LinearLayout;
    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 181
    return-void
.end method

.method public setCustomIndicator(Lcom/github/paolorotolo/appintro/IndicatorController;)V
    .registers 2
    .param p1, "controller"    # Lcom/github/paolorotolo/appintro/IndicatorController;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 262
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 263
    return-void
.end method

.method public setCustomTransformer(Landroid/support/v4/view/ViewPager$PageTransformer;)V
    .registers 4
    .param p1, "transformer"    # Landroid/support/v4/view/ViewPager$PageTransformer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 240
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 241
    return-void
.end method

.method public setDepthAnimation()V
    .registers 5

    .prologue
    .line 235
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->DEPTH:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 236
    return-void
.end method

.method public setDoneText(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 194
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->done:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 195
    .local v0, "doneText":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    return-void
.end method

.method public setFadeAnimation()V
    .registers 5

    .prologue
    .line 223
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->FADE:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 224
    return-void
.end method

.method public setFlowAnimation()V
    .registers 5

    .prologue
    .line 229
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->FLOW:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 230
    return-void
.end method

.method public setOffScreenPageLimit(I)V
    .registers 3
    .param p1, "limit"    # I

    .prologue
    .line 244
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/ViewPager;->setOffscreenPageLimit(I)V

    .line 245
    return-void
.end method

.method public setProgressIndicator()V
    .registers 2

    .prologue
    .line 252
    new-instance v0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;

    invoke-direct {v0}, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 253
    return-void
.end method

.method public setSeparatorColor(I)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 184
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->bottom_separator:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 185
    .local v0, "separator":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    .line 186
    return-void
.end method

.method public setSkipText(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 189
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->skip:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 190
    .local v0, "skipText":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 191
    return-void
.end method

.method public setSlideOverAnimation()V
    .registers 5

    .prologue
    .line 232
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->SLIDE_OVER:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 233
    return-void
.end method

.method public setVibrate(Z)V
    .registers 2
    .param p1, "vibrate"    # Z

    .prologue
    .line 215
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->isVibrateOn:Z

    .line 216
    return-void
.end method

.method public setVibrateIntensity(I)V
    .registers 2
    .param p1, "intensity"    # I

    .prologue
    .line 219
    iput p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->vibrateIntensity:I

    .line 220
    return-void
.end method

.method public setZoomAnimation()V
    .registers 5

    .prologue
    .line 226
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->ZOOM:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 227
    return-void
.end method

.method public showDoneButton(Z)V
    .registers 4
    .param p1, "showDone"    # Z

    .prologue
    .line 207
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->showDone:Z

    .line 208
    if-nez p1, :cond_11

    .line 209
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->done:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 210
    .local v0, "done":Landroid/widget/TextView;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 212
    .end local v0    # "done":Landroid/widget/TextView;
    :cond_11
    return-void
.end method

.method public showSkipButton(Z)V
    .registers 4
    .param p1, "showButton"    # Z

    .prologue
    .line 199
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro;->showSkip:Z

    .line 200
    if-nez p1, :cond_10

    .line 201
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->skip:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 202
    .local v0, "skip":Landroid/widget/TextView;
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 204
    .end local v0    # "skip":Landroid/widget/TextView;
    :cond_10
    return-void
.end method
