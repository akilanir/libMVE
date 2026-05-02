.class public Landroid/support/v7/widget/ButtonBarLayout;
.super Landroid/widget/LinearLayout;
.source "ButtonBarLayout.java"


# instance fields
.field private mAllowStacking:Z

.field private mLastWidthSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 38
    const/4 v1, -0x1

    iput v1, p0, Landroid/support/v7/widget/ButtonBarLayout;->mLastWidthSize:I

    .line 42
    sget-object v1, Landroid/support/v7/appcompat/R$styleable;->ButtonBarLayout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 43
    .local v0, "ta":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/v7/appcompat/R$styleable;->ButtonBarLayout_allowStacking:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    .line 44
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 45
    return-void
.end method

.method private isStacked()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 125
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getOrientation()I

    move-result v1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private setStacked(Z)V
    .registers 6
    .param p1, "stacked"    # Z

    .prologue
    .line 110
    if-eqz p1, :cond_2d

    const/4 v3, 0x1

    :goto_3
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/ButtonBarLayout;->setOrientation(I)V

    .line 111
    if-eqz p1, :cond_2f

    const/4 v3, 0x5

    :goto_9
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/ButtonBarLayout;->setGravity(I)V

    .line 112
    sget v3, Landroid/support/v7/appcompat/R$id;->spacer:I

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/ButtonBarLayout;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 113
    .local v2, "spacer":Landroid/view/View;
    if-eqz v2, :cond_1b

    .line 114
    if-eqz p1, :cond_32

    const/16 v3, 0x8

    :goto_18
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 118
    :cond_1b
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getChildCount()I

    move-result v0

    .line 119
    .local v0, "childCount":I
    add-int/lit8 v1, v0, -0x2

    .local v1, "i":I
    :goto_21
    if-ltz v1, :cond_34

    .line 120
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/ButtonBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/ButtonBarLayout;->bringChildToFront(Landroid/view/View;)V

    .line 119
    add-int/lit8 v1, v1, -0x1

    goto :goto_21

    .line 110
    .end local v0    # "childCount":I
    .end local v1    # "i":I
    .end local v2    # "spacer":Landroid/view/View;
    :cond_2d
    const/4 v3, 0x0

    goto :goto_3

    .line 111
    :cond_2f
    const/16 v3, 0x50

    goto :goto_9

    .line 114
    .restart local v2    # "spacer":Landroid/view/View;
    :cond_32
    const/4 v3, 0x4

    goto :goto_18

    .line 122
    .restart local v0    # "childCount":I
    .restart local v1    # "i":I
    :cond_34
    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 15
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v9, 0x1

    const/4 v7, 0x0

    .line 59
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v8

    .line 60
    .local v8, "widthSize":I
    iget-boolean v10, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    if-eqz v10, :cond_19

    .line 61
    iget v10, p0, Landroid/support/v7/widget/ButtonBarLayout;->mLastWidthSize:I

    if-le v8, v10, :cond_17

    invoke-direct {p0}, Landroid/support/v7/widget/ButtonBarLayout;->isStacked()Z

    move-result v10

    if-eqz v10, :cond_17

    .line 63
    invoke-direct {p0, v7}, Landroid/support/v7/widget/ButtonBarLayout;->setStacked(Z)V

    .line 65
    :cond_17
    iput v8, p0, Landroid/support/v7/widget/ButtonBarLayout;->mLastWidthSize:I

    .line 67
    :cond_19
    const/4 v6, 0x0

    .line 72
    .local v6, "needsRemeasure":Z
    invoke-direct {p0}, Landroid/support/v7/widget/ButtonBarLayout;->isStacked()Z

    move-result v10

    if-nez v10, :cond_5b

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v10

    const/high16 v11, 0x40000000    # 2.0f

    if-ne v10, v11, :cond_5b

    .line 73
    const/high16 v10, -0x80000000

    invoke-static {v8, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    .line 75
    .local v3, "initialWidthMeasureSpec":I
    const/4 v6, 0x1

    .line 79
    :goto_2f
    invoke-super {p0, v3, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 80
    iget-boolean v10, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    if-eqz v10, :cond_55

    invoke-direct {p0}, Landroid/support/v7/widget/ButtonBarLayout;->isStacked()Z

    move-result v10

    if-nez v10, :cond_55

    .line 83
    sget v10, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v11, 0xb

    if-lt v10, v11, :cond_5d

    .line 85
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getMeasuredWidthAndState(Landroid/view/View;)I

    move-result v4

    .line 86
    .local v4, "measuredWidth":I
    const/high16 v10, -0x1000000

    and-int v5, v4, v10

    .line 87
    .local v5, "measuredWidthState":I
    const/high16 v10, 0x1000000

    if-ne v5, v10, :cond_4f

    move v7, v9

    .line 98
    .end local v4    # "measuredWidth":I
    .end local v5    # "measuredWidthState":I
    .local v7, "stack":Z
    :cond_4f
    :goto_4f
    if-eqz v7, :cond_55

    .line 99
    invoke-direct {p0, v9}, Landroid/support/v7/widget/ButtonBarLayout;->setStacked(Z)V

    .line 101
    const/4 v6, 0x1

    .line 104
    .end local v7    # "stack":Z
    :cond_55
    if-eqz v6, :cond_5a

    .line 105
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 107
    :cond_5a
    return-void

    .line 77
    .end local v3    # "initialWidthMeasureSpec":I
    :cond_5b
    move v3, p1

    .restart local v3    # "initialWidthMeasureSpec":I
    goto :goto_2f

    .line 91
    :cond_5d
    const/4 v0, 0x0

    .line 92
    .local v0, "childWidthTotal":I
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getChildCount()I

    move-result v1

    .local v1, "count":I
    :goto_63
    if-ge v2, v1, :cond_71

    .line 93
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/ButtonBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v0, v10

    .line 92
    add-int/lit8 v2, v2, 0x1

    goto :goto_63

    .line 95
    :cond_71
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getPaddingLeft()I

    move-result v10

    add-int/2addr v10, v0

    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getPaddingRight()I

    move-result v11

    add-int/2addr v10, v11

    if-le v10, v8, :cond_7e

    move v7, v9

    .restart local v7    # "stack":Z
    :cond_7e
    goto :goto_4f
.end method

.method public setAllowStacking(Z)V
    .registers 4
    .param p1, "allowStacking"    # Z

    .prologue
    .line 48
    iget-boolean v0, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    if-eq v0, p1, :cond_18

    .line 49
    iput-boolean p1, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    .line 50
    iget-boolean v0, p0, Landroid/support/v7/widget/ButtonBarLayout;->mAllowStacking:Z

    if-nez v0, :cond_15

    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_15

    .line 51
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/ButtonBarLayout;->setStacked(Z)V

    .line 53
    :cond_15
    invoke-virtual {p0}, Landroid/support/v7/widget/ButtonBarLayout;->requestLayout()V

    .line 55
    :cond_18
    return-void
.end method
