.class public Lcom/jenzz/materialpreference/PreferenceImageView;
.super Landroid/widget/ImageView;
.source "PreferenceImageView.java"


# instance fields
.field private maxHeight:I

.field private maxWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const v0, 0x7fffffff

    .line 25
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 21
    iput v0, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxWidth:I

    .line 22
    iput v0, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxHeight:I

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const v0, 0x7fffffff

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    iput v0, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxWidth:I

    .line 22
    iput v0, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxHeight:I

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const v0, 0x7fffffff

    .line 33
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    iput v0, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxWidth:I

    .line 22
    iput v0, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxHeight:I

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    const v0, 0x7fffffff

    .line 39
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 21
    iput v0, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxWidth:I

    .line 22
    iput v0, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxHeight:I

    .line 40
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const v6, 0x7fffffff

    const/high16 v5, -0x80000000

    .line 56
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 57
    .local v2, "widthMode":I
    if-eq v2, v5, :cond_d

    if-nez v2, :cond_21

    .line 58
    :cond_d
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 59
    .local v3, "widthSize":I
    iget v4, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxWidth:I

    if-eq v4, v6, :cond_21

    iget v4, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxWidth:I

    if-lt v4, v3, :cond_1b

    if-nez v2, :cond_21

    .line 60
    :cond_1b
    iget v4, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxWidth:I

    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 64
    .end local v3    # "widthSize":I
    :cond_21
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 65
    .local v0, "heightMode":I
    if-eq v0, v5, :cond_29

    if-nez v0, :cond_3d

    .line 66
    :cond_29
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 67
    .local v1, "heightSize":I
    iget v4, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxHeight:I

    if-eq v4, v6, :cond_3d

    iget v4, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxHeight:I

    if-lt v4, v1, :cond_37

    if-nez v0, :cond_3d

    .line 68
    :cond_37
    iget v4, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxHeight:I

    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 72
    .end local v1    # "heightSize":I
    :cond_3d
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 73
    return-void
.end method

.method public setMaxHeight(I)V
    .registers 2
    .param p1, "maxHeight"    # I

    .prologue
    .line 50
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setMaxHeight(I)V

    .line 51
    iput p1, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxHeight:I

    .line 52
    return-void
.end method

.method public setMaxWidth(I)V
    .registers 2
    .param p1, "maxWidth"    # I

    .prologue
    .line 44
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setMaxWidth(I)V

    .line 45
    iput p1, p0, Lcom/jenzz/materialpreference/PreferenceImageView;->maxWidth:I

    .line 46
    return-void
.end method
