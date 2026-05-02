.class Lcom/github/paolorotolo/appintro/AppIntro2$3;
.super Ljava/lang/Object;
.source "AppIntro2.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/github/paolorotolo/appintro/AppIntro2;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/github/paolorotolo/appintro/AppIntro2;


# direct methods
.method constructor <init>(Lcom/github/paolorotolo/appintro/AppIntro2;)V
    .registers 2

    .prologue
    .line 124
    iput-object p1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 160
    return-void
.end method

.method public onPageScrolled(IFI)V
    .registers 9
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 128
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->transitionColors:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$000(Lcom/github/paolorotolo/appintro/AppIntro2;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_53

    .line 129
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v0, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_54

    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->transitionColors:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$000(Lcom/github/paolorotolo/appintro/AppIntro2;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_54

    .line 130
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v1, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->argbEvaluator:Landroid/animation/ArgbEvaluator;
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$100(Lcom/github/paolorotolo/appintro/AppIntro2;)Landroid/animation/ArgbEvaluator;

    move-result-object v0

    iget-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->transitionColors:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$000(Lcom/github/paolorotolo/appintro/AppIntro2;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->transitionColors:Ljava/util/ArrayList;
    invoke-static {v3}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$000(Lcom/github/paolorotolo/appintro/AppIntro2;)Ljava/util/ArrayList;

    move-result-object v3

    add-int/lit8 v4, p1, 0x1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, p2, v2, v3}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setBackgroundColor(I)V

    .line 135
    :cond_53
    :goto_53
    return-void

    .line 132
    :cond_54
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v1, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->transitionColors:Ljava/util/ArrayList;
    invoke-static {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$000(Lcom/github/paolorotolo/appintro/AppIntro2;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v2, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    # getter for: Lcom/github/paolorotolo/appintro/AppIntro2;->transitionColors:Ljava/util/ArrayList;
    invoke-static {v2}, Lcom/github/paolorotolo/appintro/AppIntro2;->access$000(Lcom/github/paolorotolo/appintro/AppIntro2;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setBackgroundColor(I)V

    goto :goto_53
.end method

.method public onPageSelected(I)V
    .registers 5
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x1

    .line 140
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget v0, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->slidesNumber:I

    if-le v0, v2, :cond_e

    .line 141
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v0, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->mController:Lcom/github/paolorotolo/appintro/IndicatorController;

    invoke-interface {v0, p1}, Lcom/github/paolorotolo/appintro/IndicatorController;->selectPosition(I)V

    .line 145
    :cond_e
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v0, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->isNextPagingEnabled()Z

    move-result v0

    if-nez v0, :cond_4a

    .line 146
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v0, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getCurrentItem()I

    move-result v0

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v1, v1, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v1}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->getLockPage()I

    move-result v1

    if-eq v0, v1, :cond_40

    .line 147
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-boolean v1, v1, Lcom/github/paolorotolo/appintro/AppIntro2;->baseProgressButtonEnabled:Z

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->setProgressButtonEnabled(Z)V

    .line 148
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v0, v0, Lcom/github/paolorotolo/appintro/AppIntro2;->pager:Lcom/github/paolorotolo/appintro/AppIntroViewPager;

    invoke-virtual {v0, v2}, Lcom/github/paolorotolo/appintro/AppIntroViewPager;->setNextPagingEnabled(Z)V

    .line 155
    :goto_3a
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    invoke-virtual {v0}, Lcom/github/paolorotolo/appintro/AppIntro2;->onSlideChanged()V

    .line 156
    return-void

    .line 150
    :cond_40
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-boolean v1, v1, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->setProgressButtonEnabled(Z)V

    goto :goto_3a

    .line 153
    :cond_4a
    iget-object v0, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-object v1, p0, Lcom/github/paolorotolo/appintro/AppIntro2$3;->this$0:Lcom/github/paolorotolo/appintro/AppIntro2;

    iget-boolean v1, v1, Lcom/github/paolorotolo/appintro/AppIntro2;->progressButtonEnabled:Z

    invoke-virtual {v0, v1}, Lcom/github/paolorotolo/appintro/AppIntro2;->setProgressButtonEnabled(Z)V

    goto :goto_3a
.end method
