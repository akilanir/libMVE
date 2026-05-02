.class public Lcom/nispok/snackbar/layouts/SnackbarLayout;
.super Landroid/widget/LinearLayout;
.source "SnackbarLayout.java"


# instance fields
.field private mMaxHeight:I

.field private mMaxWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const v0, 0x7fffffff

    .line 12
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 8
    iput v0, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxWidth:I

    .line 9
    iput v0, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxHeight:I

    .line 13
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 16
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/nispok/snackbar/layouts/SnackbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const v0, 0x7fffffff

    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 8
    iput v0, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxWidth:I

    .line 9
    iput v0, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxHeight:I

    .line 21
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 7
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 26
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 27
    .local v2, "width":I
    iget v3, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxWidth:I

    if-ge v3, v2, :cond_12

    .line 28
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 29
    .local v1, "mode":I
    iget v3, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxWidth:I

    invoke-static {v3, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 32
    .end local v1    # "mode":I
    :cond_12
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 33
    .local v0, "height":I
    iget v3, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxHeight:I

    if-ge v3, v0, :cond_24

    .line 34
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 35
    .restart local v1    # "mode":I
    iget v3, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxHeight:I

    invoke-static {v3, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 37
    .end local v1    # "mode":I
    :cond_24
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 38
    return-void
.end method

.method public setMaxHeight(I)V
    .registers 2
    .param p1, "maxHeight"    # I

    .prologue
    .line 46
    iput p1, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxHeight:I

    .line 47
    invoke-virtual {p0}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->requestLayout()V

    .line 48
    return-void
.end method

.method public setMaxWidth(I)V
    .registers 2
    .param p1, "maxWidth"    # I

    .prologue
    .line 41
    iput p1, p0, Lcom/nispok/snackbar/layouts/SnackbarLayout;->mMaxWidth:I

    .line 42
    invoke-virtual {p0}, Lcom/nispok/snackbar/layouts/SnackbarLayout;->requestLayout()V

    .line 43
    return-void
.end method
