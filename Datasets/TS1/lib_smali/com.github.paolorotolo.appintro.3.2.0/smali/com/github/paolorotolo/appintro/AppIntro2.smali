.class public abstract Lcom/github/paolorotolo/appintro/AppIntro2;
.super Landroid/support/v7/app/AppCompatActivity;
.source "AppIntro2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/paolorotolo/appintro/AppIntro2$TransformType;
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

.field private slidesNumber:I

.field private vibrateIntensity:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 25
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->fragments:Ljava/util/List;

    .line 30
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->isVibrateOn:Z

    .line 31
    const/16 v0, 0x14

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->vibrateIntensity:I

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->showDone:Z

    .line 34
    return-void
.end method

.method static synthetic access$000(Lcom/github/paolorotolo/appintro/AppIntro2;)Z
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->isVibrateOn:Z

    return v0
.end method

.method static synthetic access$100(Lcom/github/paolorotolo/appintro/AppIntro2;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 22
    iget v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->vibrateIntensity:I

    return v0
.end method

.method static synthetic access$200(Lcom/github/paolorotolo/appintro/AppIntro2;)Landroid/os/Vibrator;
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mVibrator:Landroid/os/Vibrator;

    return-object v0
.end method

.method static synthetic access$300(Lcom/github/paolorotolo/appintro/AppIntro2;)Landroid/support/v4/view/ViewPager;
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    return-object v0
.end method

.method static synthetic access$400(Lcom/github/paolorotolo/appintro/AppIntro2;)I
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 22
    iget v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I

    return v0
.end method

.method static synthetic access$500(Lcom/github/paolorotolo/appintro/AppIntro2;)Lcom/github/paolorotolo/appintro/IndicatorController;
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 22
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    return-object v0
.end method

.method static synthetic access$600(Lcom/github/paolorotolo/appintro/AppIntro2;)Z
    .registers 2
    .param p0, "x0"    # Lcom/github/paolorotolo/appintro/AppIntro2;

    .prologue
    .line 22
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->showDone:Z

    return v0
.end method

.method private initController()V
    .registers 4

    .prologue
    .line 126
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    if-nez v1, :cond_b

    .line 127
    new-instance v1, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;

    invoke-direct {v1}, Lcom/github/paolorotolo/appintro/DefaultIndicatorController;-><init>()V

    iput-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 129
    :cond_b
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->indicator_container:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 130
    .local v0, "indicatorContainer":Landroid/widget/FrameLayout;
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    invoke-interface {v1, p0}, Lcom/github/paolorotolo/appintro/IndicatorController;->newInstance(Landroid/content/Context;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 132
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    iget v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I

    invoke-interface {v1, v2}, Lcom/github/paolorotolo/appintro/IndicatorController;->initialize(I)V

    .line 133
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
    .line 145
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->fragments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/PagerAdapter;->notifyDataSetChanged()V

    .line 147
    return-void
.end method

.method public getPager()Landroid/support/v4/view/ViewPager;
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

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
    .line 151
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

.method protected final onCreate(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v3, 0x400

    const/4 v5, 0x1

    .line 44
    invoke-virtual {p0, v5}, Lcom/github/paolorotolo/appintro/AppIntro2;->requestWindowFeature(I)Z

    .line 46
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 48
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v3, v3}, Landroid/view/Window;->setFlags(II)V

    .line 50
    sget v2, Lcom/github/paolorotolo/appintro/R$layout;->intro_layout2:I

    invoke-virtual {p0, v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->setContentView(I)V

    .line 52
    sget v2, Lcom/github/paolorotolo/appintro/R$id;->next:I

    invoke-virtual {p0, v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 53
    .local v1, "nextButton":Landroid/widget/ImageView;
    sget v2, Lcom/github/paolorotolo/appintro/R$id;->done:I

    invoke-virtual {p0, v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 54
    .local v0, "doneButton":Landroid/widget/ImageView;
    const-string v2, "vibrator"

    invoke-virtual {p0, v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Vibrator;

    iput-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mVibrator:Landroid/os/Vibrator;

    .line 56
    new-instance v2, Lcom/github/paolorotolo/appintro/AppIntro2$1;

    invoke-direct {v2, p0}, Lcom/github/paolorotolo/appintro/AppIntro2$1;-><init>(Lcom/github/paolorotolo/appintro/AppIntro2;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    new-instance v2, Lcom/github/paolorotolo/appintro/AppIntro2$2;

    invoke-direct {v2, p0}, Lcom/github/paolorotolo/appintro/AppIntro2$2;-><init>(Lcom/github/paolorotolo/appintro/AppIntro2;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    new-instance v2, Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v3

    iget-object v4, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->fragments:Ljava/util/List;

    invoke-direct {v2, v3, v4}, Lcom/github/paolorotolo/appintro/PagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;Ljava/util/List;)V

    iput-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    .line 77
    sget v2, Lcom/github/paolorotolo/appintro/R$id;->view_pager:I

    invoke-virtual {p0, v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/v4/view/ViewPager;

    iput-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    .line 78
    iget-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mPagerAdapter:Lcom/github/paolorotolo/appintro/PagerAdapter;

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 83
    iget-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    new-instance v3, Lcom/github/paolorotolo/appintro/AppIntro2$3;

    invoke-direct {v3, p0, v1, v0}, Lcom/github/paolorotolo/appintro/AppIntro2$3;-><init>(Lcom/github/paolorotolo/appintro/AppIntro2;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    invoke-virtual {v2, v3}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 110
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro2;->init(Landroid/os/Bundle;)V

    .line 111
    iget-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->fragments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iput v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I

    .line 113
    iget v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I

    if-ne v2, v5, :cond_80

    .line 114
    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 115
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 119
    :goto_7f
    return-void

    .line 117
    :cond_80
    invoke-direct {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->initController()V

    goto :goto_7f
.end method

.method public abstract onDonePressed()V
.end method

.method public onDotSelected(I)V
    .registers 2
    .param p1, "index"    # I

    .prologue
    .line 217
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "code"    # I
    .param p2, "kevent"    # Landroid/view/KeyEvent;

    .prologue
    .line 221
    const/16 v1, 0x42

    if-eq p1, v1, :cond_8

    const/16 v1, 0x60

    if-ne p1, v1, :cond_2f

    .line 222
    :cond_8
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->view_pager:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    .line 223
    .local v0, "vp":Landroid/support/v4/view/ViewPager;
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_25

    .line 224
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->onDonePressed()V

    .line 228
    :goto_23
    const/4 v1, 0x0

    .line 230
    .end local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :goto_24
    return v1

    .line 226
    .restart local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :cond_25
    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    goto :goto_23

    .line 230
    .end local v0    # "vp":Landroid/support/v4/view/ViewPager;
    :cond_2f
    invoke-super {p0, p1, p2}, Landroid/support/v7/app/AppCompatActivity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v1

    goto :goto_24
.end method

.method public selectDot(I)V
    .registers 7
    .param p1, "index"    # I

    .prologue
    .line 135
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntro2;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 136
    .local v3, "res":Landroid/content/res/Resources;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    iget-object v4, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->fragments:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_26

    .line 137
    if-ne v2, p1, :cond_23

    sget v1, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_white:I

    .line 138
    .local v1, "drawableId":I
    :goto_11
    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 139
    .local v0, "drawable":Landroid/graphics/drawable/Drawable;
    iget-object v4, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->dots:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 136
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 137
    .end local v0    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v1    # "drawableId":I
    :cond_23
    sget v1, Lcom/github/paolorotolo/appintro/R$drawable;->indicator_dot_grey:I

    goto :goto_11

    .line 141
    :cond_26
    invoke-virtual {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntro2;->onDotSelected(I)V

    .line 142
    return-void
.end method

.method public setCustomIndicator(Lcom/github/paolorotolo/appintro/IndicatorController;)V
    .registers 2
    .param p1, "controller"    # Lcom/github/paolorotolo/appintro/IndicatorController;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 210
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 211
    return-void
.end method

.method public setCustomTransformer(Landroid/support/v4/view/ViewPager$PageTransformer;)V
    .registers 4
    .param p1, "transformer"    # Landroid/support/v4/view/ViewPager$PageTransformer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 188
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 189
    return-void
.end method

.method public setDepthAnimation()V
    .registers 5

    .prologue
    .line 184
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->DEPTH:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 185
    return-void
.end method

.method public setFadeAnimation()V
    .registers 5

    .prologue
    .line 171
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->FADE:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 172
    return-void
.end method

.method public setFlowAnimation()V
    .registers 5

    .prologue
    .line 178
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->FLOW:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 179
    return-void
.end method

.method public setOffScreenPageLimit(I)V
    .registers 3
    .param p1, "limit"    # I

    .prologue
    .line 192
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/ViewPager;->setOffscreenPageLimit(I)V

    .line 193
    return-void
.end method

.method public setProgressIndicator()V
    .registers 2

    .prologue
    .line 200
    new-instance v0, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;

    invoke-direct {v0}, Lcom/github/paolorotolo/appintro/ProgressIndicatorController;-><init>()V

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    .line 201
    return-void
.end method

.method public setSlideOverAnimation()V
    .registers 5

    .prologue
    .line 181
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->SLIDE_OVER:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 182
    return-void
.end method

.method public setVibrate(Z)V
    .registers 2
    .param p1, "vibrate"    # Z

    .prologue
    .line 163
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->isVibrateOn:Z

    .line 164
    return-void
.end method

.method public setVibrateIntensity(I)V
    .registers 2
    .param p1, "intensity"    # I

    .prologue
    .line 167
    iput p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->vibrateIntensity:I

    .line 168
    return-void
.end method

.method public setZoomAnimation()V
    .registers 5

    .prologue
    .line 175
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    new-instance v2, Lcom/github/paolorotolo/appintro/ViewPageTransformer;

    sget-object v3, Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;->ZOOM:Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;

    invoke-direct {v2, v3}, Lcom/github/paolorotolo/appintro/ViewPageTransformer;-><init>(Lcom/github/paolorotolo/appintro/ViewPageTransformer$TransformType;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPager;->setPageTransformer(ZLandroid/support/v4/view/ViewPager$PageTransformer;)V

    .line 176
    return-void
.end method

.method public showDoneButton(Z)V
    .registers 4
    .param p1, "showDone"    # Z

    .prologue
    .line 155
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2;->showDone:Z

    .line 156
    if-nez p1, :cond_11

    .line 157
    sget v1, Lcom/github/paolorotolo/appintro/R$id;->done:I

    invoke-virtual {p0, v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 158
    .local v0, "done":Landroid/widget/ImageView;
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 160
    .end local v0    # "done":Landroid/widget/ImageView;
    :cond_11
    return-void
.end method
