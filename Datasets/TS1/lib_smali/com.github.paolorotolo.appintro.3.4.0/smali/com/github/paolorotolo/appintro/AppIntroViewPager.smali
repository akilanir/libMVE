.class public Lcom/github/paolorotolo/appintro/AppIntroViewPager;
.super Landroid/support/v4/view/ViewPager;
.source "AppIntroViewPager.java"


# instance fields
.field private initialXValue:F

.field protected listener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

.field private lockPage:I

.field private mScroller:Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;

.field private nextPagingEnabled:Z

.field private pagingEnabled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x1

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/support/v4/view/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 95
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->mScroller:Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;

    .line 21
    iput-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->pagingEnabled:Z

    .line 22
    iput-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->nextPagingEnabled:Z

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->lockPage:I

    .line 24
    invoke-direct {p0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->initViewPagerScroller()V

    .line 25
    return-void
.end method

.method private checkPagingState(Landroid/view/MotionEvent;)Z
    .registers 5
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v0, 0x1

    .line 71
    iget-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->pagingEnabled:Z

    if-nez v1, :cond_6

    .line 85
    :cond_5
    :goto_5
    return v0

    .line 75
    :cond_6
    iget-boolean v1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->nextPagingEnabled:Z

    if-nez v1, :cond_23

    .line 76
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_16

    .line 77
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->initialXValue:F

    .line 79
    :cond_16
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_23

    .line 80
    invoke-direct {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->detectSwipeToRight(Landroid/view/MotionEvent;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 85
    :cond_23
    const/4 v0, 0x0

    goto :goto_5
.end method

.method private detectSwipeToRight(Landroid/view/MotionEvent;)Z
    .registers 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v6, 0x0

    .line 146
    const/4 v0, 0x0

    .line 147
    .local v0, "SWIPE_THRESHOLD":I
    const/4 v3, 0x0

    .line 150
    .local v3, "result":Z
    :try_start_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iget v5, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->initialXValue:F

    sub-float v1, v4, v5

    .line 151
    .local v1, "diffX":F
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_e} :catch_19

    move-result v4

    cmpl-float v4, v4, v6

    if-lez v4, :cond_18

    .line 152
    cmpg-float v4, v1, v6

    if-gez v4, :cond_18

    .line 154
    const/4 v3, 0x1

    .line 160
    .end local v1    # "diffX":F
    :cond_18
    :goto_18
    return v3

    .line 157
    :catch_19
    move-exception v2

    .line 158
    .local v2, "exception":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_18
.end method

.method private initViewPagerScroller()V
    .registers 7

    .prologue
    .line 103
    :try_start_0
    const-class v3, Landroid/support/v4/view/ViewPager;

    const-string v4, "mScroller"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 104
    .local v2, "scroller":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 105
    const-class v3, Landroid/support/v4/view/ViewPager;

    const-string v4, "sInterpolator"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 106
    .local v1, "interpolator":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 108
    new-instance v4, Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;

    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getContext()Landroid/content/Context;

    move-result-object v5

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/animation/Interpolator;

    invoke-direct {v4, v5, v3}, Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v4, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->mScroller:Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;

    .line 110
    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->mScroller:Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;

    invoke-virtual {v2, p0, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_30

    .line 114
    .end local v1    # "interpolator":Ljava/lang/reflect/Field;
    .end local v2    # "scroller":Ljava/lang/reflect/Field;
    :goto_2f
    return-void

    .line 111
    :catch_30
    move-exception v0

    .line 112
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2f
.end method


# virtual methods
.method public addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .prologue
    .line 29
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 30
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->listener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    .line 31
    return-void
.end method

.method public getLockPage()I
    .registers 2

    .prologue
    .line 136
    iget v0, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->lockPage:I

    return v0
.end method

.method public isNextPagingEnabled()Z
    .registers 2

    .prologue
    .line 124
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->nextPagingEnabled:Z

    return v0
.end method

.method public isPagingEnabled()Z
    .registers 2

    .prologue
    .line 128
    iget-boolean v0, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->pagingEnabled:Z

    return v0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 54
    invoke-direct {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->checkPagingState(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 55
    const/4 v0, 0x0

    .line 58
    :goto_7
    return v0

    :cond_8
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_7
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->checkPagingState(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 64
    const/4 v0, 0x0

    .line 67
    :goto_7
    return v0

    :cond_8
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_7
.end method

.method public setCurrentItem(I)V
    .registers 5
    .param p1, "item"    # I

    .prologue
    .line 41
    const/4 v0, 0x0

    .line 43
    .local v0, "invokeMeLater":Z
    invoke-super {p0}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    if-nez v1, :cond_a

    if-nez p1, :cond_a

    .line 44
    const/4 v0, 0x1

    .line 46
    :cond_a
    invoke-super {p0, p1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(I)V

    .line 48
    if-eqz v0, :cond_19

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->listener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    if-eqz v1, :cond_19

    .line 49
    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->listener:Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/support/v4/view/ViewPager$OnPageChangeListener;->onPageSelected(I)V

    .line 50
    :cond_19
    return-void
.end method

.method public setLockPage(I)V
    .registers 2
    .param p1, "lockPage"    # I

    .prologue
    .line 140
    iput p1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->lockPage:I

    .line 141
    return-void
.end method

.method public setNextPagingEnabled(Z)V
    .registers 3
    .param p1, "nextPagingEnabled"    # Z

    .prologue
    .line 90
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->nextPagingEnabled:Z

    .line 91
    if-nez p1, :cond_a

    .line 92
    invoke-virtual {p0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v0

    iput v0, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->lockPage:I

    .line 94
    :cond_a
    return-void
.end method

.method public setPagingEnabled(Z)V
    .registers 2
    .param p1, "pagingEnabled"    # Z

    .prologue
    .line 132
    iput-boolean p1, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->pagingEnabled:Z

    .line 133
    return-void
.end method

.method public setScrollDurationFactor(D)V
    .registers 4
    .param p1, "scrollFactor"    # D

    .prologue
    .line 120
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->mScroller:Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;

    invoke-virtual {v0, p1, p2}, Lcom/github/paolorotolo/appintro/ScrollerCustomDuration;->setScrollDurationFactor(D)V

    .line 121
    return-void
.end method
