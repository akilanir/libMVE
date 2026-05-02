.class Lcom/cocosw/bottomsheet/FillerView;
.super Landroid/widget/LinearLayout;
.source "FillerView.java"


# instance fields
.field private mMeasureTarget:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 29
    iget-object v0, p0, Lcom/cocosw/bottomsheet/FillerView;->mMeasureTarget:Landroid/view/View;

    if-eqz v0, :cond_10

    .line 30
    iget-object v0, p0, Lcom/cocosw/bottomsheet/FillerView;->mMeasureTarget:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 32
    :cond_10
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 33
    return-void
.end method

.method public setMeasureTarget(Landroid/view/View;)V
    .registers 2
    .param p1, "lastViewSeen"    # Landroid/view/View;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/cocosw/bottomsheet/FillerView;->mMeasureTarget:Landroid/view/View;

    .line 19
    return-void
.end method
