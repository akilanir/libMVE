.class public abstract Lcom/github/mikephil/charting/components/MarkerView;
.super Landroid/widget/RelativeLayout;
.source "MarkerView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layoutResource"    # I

    .prologue
    .line 27
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 28
    invoke-direct {p0, p2}, Lcom/github/mikephil/charting/components/MarkerView;->setupLayoutResource(I)V

    .line 29
    return-void
.end method

.method private setupLayoutResource(I)V
    .registers 6
    .param p1, "layoutResource"    # I

    .prologue
    const/4 v2, -0x2

    const/4 v3, 0x0

    .line 38
    invoke-virtual {p0}, Lcom/github/mikephil/charting/components/MarkerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-virtual {v1, p1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 40
    .local v0, "inflated":Landroid/view/View;
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/view/View;->measure(II)V

    .line 44
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/view/View;->layout(IIII)V

    .line 45
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;FF)V
    .registers 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "posx"    # F
    .param p3, "posy"    # F

    .prologue
    .line 57
    invoke-virtual {p0, p2}, Lcom/github/mikephil/charting/components/MarkerView;->getXOffset(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p2, v0

    .line 58
    invoke-virtual {p0, p3}, Lcom/github/mikephil/charting/components/MarkerView;->getYOffset(F)I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p3, v0

    .line 61
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 62
    invoke-virtual {p0, p1}, Lcom/github/mikephil/charting/components/MarkerView;->draw(Landroid/graphics/Canvas;)V

    .line 63
    neg-float v0, p2

    neg-float v1, p3

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 64
    return-void
.end method

.method public abstract getXOffset(F)I
.end method

.method public abstract getYOffset(F)I
.end method

.method public abstract refreshContent(Lcom/github/mikephil/charting/data/Entry;Lcom/github/mikephil/charting/highlight/Highlight;)V
.end method
