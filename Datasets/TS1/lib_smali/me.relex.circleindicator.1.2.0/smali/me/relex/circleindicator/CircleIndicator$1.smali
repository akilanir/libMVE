.class Lme/relex/circleindicator/CircleIndicator$1;
.super Ljava/lang/Object;
.source "CircleIndicator.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/relex/circleindicator/CircleIndicator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lme/relex/circleindicator/CircleIndicator;


# direct methods
.method constructor <init>(Lme/relex/circleindicator/CircleIndicator;)V
    .registers 2

    .prologue
    .line 173
    iput-object p1, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .registers 2
    .param p1, "state"    # I

    .prologue
    .line 212
    return-void
.end method

.method public onPageScrolled(IFI)V
    .registers 4
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    .line 177
    return-void
.end method

.method public onPageSelected(I)V
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 181
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mViewpager:Landroid/support/v4/view/ViewPager;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$100(Lme/relex/circleindicator/CircleIndicator;)Landroid/support/v4/view/ViewPager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v2

    if-eqz v2, :cond_1c

    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mViewpager:Landroid/support/v4/view/ViewPager;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$100(Lme/relex/circleindicator/CircleIndicator;)Landroid/support/v4/view/ViewPager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v2

    if-gtz v2, :cond_1d

    .line 209
    :cond_1c
    :goto_1c
    return-void

    .line 185
    :cond_1d
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorIn:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$200(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/Animator;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 186
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorIn:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$200(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/Animator;->end()V

    .line 187
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorIn:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$200(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/Animator;->cancel()V

    .line 190
    :cond_3b
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorOut:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$300(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/Animator;->isRunning()Z

    move-result v2

    if-eqz v2, :cond_59

    .line 191
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorOut:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$300(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/Animator;->end()V

    .line 192
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorOut:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$300(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/Animator;->cancel()V

    .line 196
    :cond_59
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mLastPosition:I
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$400(Lme/relex/circleindicator/CircleIndicator;)I

    move-result v2

    if-ltz v2, :cond_8a

    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    iget-object v3, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mLastPosition:I
    invoke-static {v3}, Lme/relex/circleindicator/CircleIndicator;->access$400(Lme/relex/circleindicator/CircleIndicator;)I

    move-result v3

    invoke-virtual {v2, v3}, Lme/relex/circleindicator/CircleIndicator;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .local v0, "currentIndicator":Landroid/view/View;
    if-eqz v0, :cond_8a

    .line 197
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mIndicatorUnselectedBackgroundResId:I
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$500(Lme/relex/circleindicator/CircleIndicator;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 198
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorIn:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$200(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 199
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorIn:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$200(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 202
    .end local v0    # "currentIndicator":Landroid/view/View;
    :cond_8a
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    invoke-virtual {v2, p1}, Lme/relex/circleindicator/CircleIndicator;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 203
    .local v1, "selectedIndicator":Landroid/view/View;
    if-eqz v1, :cond_ad

    .line 204
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mIndicatorBackgroundResId:I
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$600(Lme/relex/circleindicator/CircleIndicator;)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 205
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorOut:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$300(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 206
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mAnimatorOut:Landroid/animation/Animator;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$300(Lme/relex/circleindicator/CircleIndicator;)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 208
    :cond_ad
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$1;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # setter for: Lme/relex/circleindicator/CircleIndicator;->mLastPosition:I
    invoke-static {v2, p1}, Lme/relex/circleindicator/CircleIndicator;->access$402(Lme/relex/circleindicator/CircleIndicator;I)I

    goto/16 :goto_1c
.end method
