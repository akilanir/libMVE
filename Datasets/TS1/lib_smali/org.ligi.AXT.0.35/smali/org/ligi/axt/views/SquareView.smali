.class public Lorg/ligi/axt/views/SquareView;
.super Landroid/view/View;
.source "SquareView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 11
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 15
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 6
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 20
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 22
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 23
    .local v1, "parentWidth":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 24
    .local v0, "parentHeight":I
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 25
    .local v2, "size":I
    invoke-virtual {p0, v2, v2}, Lorg/ligi/axt/views/SquareView;->setMeasuredDimension(II)V

    .line 26
    return-void
.end method
