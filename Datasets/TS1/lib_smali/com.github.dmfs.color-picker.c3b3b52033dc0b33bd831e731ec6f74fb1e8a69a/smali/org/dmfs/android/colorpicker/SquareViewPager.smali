.class public Lorg/dmfs/android/colorpicker/SquareViewPager;
.super Lorg/dmfs/android/view/ViewPager;
.source "SquareViewPager.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/dmfs/android/view/ViewPager;-><init>(Landroid/content/Context;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lorg/dmfs/android/view/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 42
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 8
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 48
    invoke-super {p0, p1, p2}, Lorg/dmfs/android/view/ViewPager;->onMeasure(II)V

    .line 50
    invoke-virtual {p0}, Lorg/dmfs/android/colorpicker/SquareViewPager;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    if-gt v2, v3, :cond_d

    .line 69
    :goto_c
    return-void

    .line 56
    :cond_d
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lorg/dmfs/android/colorpicker/SquareViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    .line 58
    .local v0, "titleStripHeight":I
    invoke-virtual {p0}, Lorg/dmfs/android/colorpicker/SquareViewPager;->getMeasuredWidth()I

    move-result v1

    .line 60
    .local v1, "width":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    const/high16 v3, -0x80000000

    if-ne v2, v3, :cond_26

    .line 62
    invoke-static {v1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 66
    :cond_26
    add-int v2, v0, v1

    invoke-static {v2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 68
    invoke-super {p0, p1, p2}, Lorg/dmfs/android/view/ViewPager;->onMeasure(II)V

    goto :goto_c
.end method
