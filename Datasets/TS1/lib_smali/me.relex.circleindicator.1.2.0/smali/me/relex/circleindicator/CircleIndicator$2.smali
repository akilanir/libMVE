.class Lme/relex/circleindicator/CircleIndicator$2;
.super Landroid/database/DataSetObserver;
.source "CircleIndicator.java"


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
    .line 219
    iput-object p1, p0, Lme/relex/circleindicator/CircleIndicator$2;->this$0:Lme/relex/circleindicator/CircleIndicator;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .registers 5

    .prologue
    .line 221
    invoke-super {p0}, Landroid/database/DataSetObserver;->onChanged()V

    .line 222
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$2;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mViewpager:Landroid/support/v4/view/ViewPager;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$100(Lme/relex/circleindicator/CircleIndicator;)Landroid/support/v4/view/ViewPager;

    move-result-object v2

    if-nez v2, :cond_c

    .line 238
    :cond_b
    :goto_b
    return-void

    .line 226
    :cond_c
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$2;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mViewpager:Landroid/support/v4/view/ViewPager;
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$100(Lme/relex/circleindicator/CircleIndicator;)Landroid/support/v4/view/ViewPager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    .line 227
    .local v1, "newCount":I
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$2;->this$0:Lme/relex/circleindicator/CircleIndicator;

    invoke-virtual {v2}, Lme/relex/circleindicator/CircleIndicator;->getChildCount()I

    move-result v0

    .line 229
    .local v0, "currentCount":I
    if-eq v1, v0, :cond_b

    .line 231
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$2;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mLastPosition:I
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$400(Lme/relex/circleindicator/CircleIndicator;)I

    move-result v2

    if-ge v2, v1, :cond_3f

    .line 232
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$2;->this$0:Lme/relex/circleindicator/CircleIndicator;

    iget-object v3, p0, Lme/relex/circleindicator/CircleIndicator$2;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # getter for: Lme/relex/circleindicator/CircleIndicator;->mViewpager:Landroid/support/v4/view/ViewPager;
    invoke-static {v3}, Lme/relex/circleindicator/CircleIndicator;->access$100(Lme/relex/circleindicator/CircleIndicator;)Landroid/support/v4/view/ViewPager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v3

    # setter for: Lme/relex/circleindicator/CircleIndicator;->mLastPosition:I
    invoke-static {v2, v3}, Lme/relex/circleindicator/CircleIndicator;->access$402(Lme/relex/circleindicator/CircleIndicator;I)I

    .line 237
    :goto_39
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$2;->this$0:Lme/relex/circleindicator/CircleIndicator;

    # invokes: Lme/relex/circleindicator/CircleIndicator;->createIndicators()V
    invoke-static {v2}, Lme/relex/circleindicator/CircleIndicator;->access$700(Lme/relex/circleindicator/CircleIndicator;)V

    goto :goto_b

    .line 234
    :cond_3f
    iget-object v2, p0, Lme/relex/circleindicator/CircleIndicator$2;->this$0:Lme/relex/circleindicator/CircleIndicator;

    const/4 v3, -0x1

    # setter for: Lme/relex/circleindicator/CircleIndicator;->mLastPosition:I
    invoke-static {v2, v3}, Lme/relex/circleindicator/CircleIndicator;->access$402(Lme/relex/circleindicator/CircleIndicator;I)I

    goto :goto_39
.end method
