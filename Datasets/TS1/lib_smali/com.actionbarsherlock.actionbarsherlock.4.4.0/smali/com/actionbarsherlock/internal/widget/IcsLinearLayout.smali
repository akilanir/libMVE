.class public Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;
.super Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineLinearLayout;
.source "IcsLinearLayout.java"


# static fields
.field private static final LinearLayout_divider:I = 0x0

.field private static final LinearLayout_dividerPadding:I = 0x2

.field private static final LinearLayout_showDividers:I = 0x1

.field private static final R_styleable_LinearLayout:[I

.field public static final SHOW_DIVIDER_BEGINNING:I = 0x1

.field public static final SHOW_DIVIDER_END:I = 0x4

.field public static final SHOW_DIVIDER_MIDDLE:I = 0x2

.field public static final SHOW_DIVIDER_NONE:I


# instance fields
.field private mDivider:Landroid/graphics/drawable/Drawable;

.field private mDividerHeight:I

.field private mDividerPadding:I

.field private mDividerWidth:I

.field private mShowDividers:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->R_styleable_LinearLayout:[I

    return-void

    nop

    :array_a
    .array-data 4
        0x1010129
        0x1010329
        0x101032a
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v2, 0x0

    .line 56
    invoke-direct {p0, p1, p2}, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 58
    sget-object v1, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->R_styleable_LinearLayout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 60
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->setDividerDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 61
    const/4 v1, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mShowDividers:I

    .line 62
    const/4 v1, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerPadding:I

    .line 64
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 65
    return-void
.end method


# virtual methods
.method drawDividersHorizontal(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 218
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getChildCount()I

    move-result v1

    .line 219
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    if-ge v2, v1, :cond_2f

    .line 220
    invoke-virtual {p0, v2}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 222
    .local v0, "child":Landroid/view/View;
    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-eq v6, v7, :cond_2c

    .line 223
    invoke-virtual {p0, v2}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 224
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 225
    .local v4, "lp":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v6

    iget v7, v4, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    sub-int v3, v6, v7

    .line 226
    .local v3, "left":I
    invoke-virtual {p0, p1, v3}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->drawVerticalDivider(Landroid/graphics/Canvas;I)V

    .line 219
    .end local v3    # "left":I
    .end local v4    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 231
    .end local v0    # "child":Landroid/view/View;
    :cond_2f
    invoke-virtual {p0, v1}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v6

    if-eqz v6, :cond_4e

    .line 232
    add-int/lit8 v6, v1, -0x1

    invoke-virtual {p0, v6}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 233
    .restart local v0    # "child":Landroid/view/View;
    const/4 v5, 0x0

    .line 234
    .local v5, "right":I
    if-nez v0, :cond_4f

    .line 235
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerWidth:I

    sub-int v5, v6, v7

    .line 240
    :goto_4b
    invoke-virtual {p0, p1, v5}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->drawVerticalDivider(Landroid/graphics/Canvas;I)V

    .line 242
    .end local v0    # "child":Landroid/view/View;
    .end local v5    # "right":I
    :cond_4e
    return-void

    .line 238
    .restart local v0    # "child":Landroid/view/View;
    .restart local v5    # "right":I
    :cond_4f
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v5

    goto :goto_4b
.end method

.method drawDividersVertical(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 191
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getChildCount()I

    move-result v2

    .line 192
    .local v2, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_5
    if-ge v3, v2, :cond_2f

    .line 193
    invoke-virtual {p0, v3}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 195
    .local v1, "child":Landroid/view/View;
    if-eqz v1, :cond_2c

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-eq v6, v7, :cond_2c

    .line 196
    invoke-virtual {p0, v3}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 197
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 198
    .local v4, "lp":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v6

    iget v7, v4, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    sub-int v5, v6, v7

    .line 199
    .local v5, "top":I
    invoke-virtual {p0, p1, v5}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->drawHorizontalDivider(Landroid/graphics/Canvas;I)V

    .line 192
    .end local v4    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    .end local v5    # "top":I
    :cond_2c
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 204
    .end local v1    # "child":Landroid/view/View;
    :cond_2f
    invoke-virtual {p0, v2}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v6

    if-eqz v6, :cond_4e

    .line 205
    add-int/lit8 v6, v2, -0x1

    invoke-virtual {p0, v6}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 206
    .restart local v1    # "child":Landroid/view/View;
    const/4 v0, 0x0

    .line 207
    .local v0, "bottom":I
    if-nez v1, :cond_4f

    .line 208
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getPaddingBottom()I

    move-result v7

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerHeight:I

    sub-int v0, v6, v7

    .line 213
    :goto_4b
    invoke-virtual {p0, p1, v0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->drawHorizontalDivider(Landroid/graphics/Canvas;I)V

    .line 215
    .end local v0    # "bottom":I
    .end local v1    # "child":Landroid/view/View;
    :cond_4e
    return-void

    .line 211
    .restart local v0    # "bottom":I
    .restart local v1    # "child":Landroid/view/View;
    :cond_4f
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v0

    goto :goto_4b
.end method

.method drawHorizontalDivider(Landroid/graphics/Canvas;I)V
    .registers 7
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "top"    # I

    .prologue
    .line 245
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getPaddingLeft()I

    move-result v1

    iget v2, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerPadding:I

    add-int/2addr v1, v2

    .line 246
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerPadding:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerHeight:I

    add-int/2addr v3, p2

    .line 245
    invoke-virtual {v0, v1, p2, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 247
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 248
    return-void
.end method

.method drawVerticalDivider(Landroid/graphics/Canvas;I)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "left"    # I

    .prologue
    .line 251
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getPaddingTop()I

    move-result v1

    iget v2, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerPadding:I

    add-int/2addr v1, v2

    iget v2, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerWidth:I

    add-int/2addr v2, p2

    .line 252
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getPaddingBottom()I

    move-result v4

    sub-int/2addr v3, v4

    iget v4, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerPadding:I

    sub-int/2addr v3, v4

    .line 251
    invoke-virtual {v0, p2, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 253
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 254
    return-void
.end method

.method public getDividerPadding()I
    .registers 2

    .prologue
    .line 138
    iget v0, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerPadding:I

    return v0
.end method

.method public getDividerWidth()I
    .registers 2

    .prologue
    .line 147
    iget v0, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerWidth:I

    return v0
.end method

.method public getShowDividers()I
    .registers 2

    .prologue
    .line 87
    iget v0, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mShowDividers:I

    return v0
.end method

.method protected hasDividerBeforeChildAt(I)Z
    .registers 7
    .param p1, "childIndex"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 264
    if-nez p1, :cond_d

    .line 265
    iget v4, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mShowDividers:I

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_b

    .line 278
    :cond_a
    :goto_a
    return v2

    :cond_b
    move v2, v3

    .line 265
    goto :goto_a

    .line 266
    :cond_d
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getChildCount()I

    move-result v4

    if-ne p1, v4, :cond_1b

    .line 267
    iget v4, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mShowDividers:I

    and-int/lit8 v4, v4, 0x4

    if-nez v4, :cond_a

    move v2, v3

    goto :goto_a

    .line 268
    :cond_1b
    iget v2, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mShowDividers:I

    and-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_38

    .line 269
    const/4 v0, 0x0

    .line 270
    .local v0, "hasVisibleViewBefore":Z
    add-int/lit8 v1, p1, -0x1

    .local v1, "i":I
    :goto_24
    if-ltz v1, :cond_33

    .line 271
    invoke-virtual {p0, v1}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_35

    .line 272
    const/4 v0, 0x1

    :cond_33
    move v2, v0

    .line 276
    goto :goto_a

    .line 270
    :cond_35
    add-int/lit8 v1, v1, -0x1

    goto :goto_24

    .end local v0    # "hasVisibleViewBefore":Z
    .end local v1    # "i":I
    :cond_38
    move v2, v3

    .line 278
    goto :goto_a
.end method

.method protected measureChildWithMargins(Landroid/view/View;IIII)V
    .registers 12
    .param p1, "child"    # Landroid/view/View;
    .param p2, "parentWidthMeasureSpec"    # I
    .param p3, "widthUsed"    # I
    .param p4, "parentHeightMeasureSpec"    # I
    .param p5, "heightUsed"    # I

    .prologue
    const/4 v5, 0x1

    .line 152
    invoke-virtual {p0, p1}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 153
    .local v1, "index":I
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getOrientation()I

    move-result v2

    .line 154
    .local v2, "orientation":I
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 155
    .local v3, "params":Landroid/widget/LinearLayout$LayoutParams;
    invoke-virtual {p0, v1}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 156
    if-ne v2, v5, :cond_33

    .line 158
    iget v4, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerHeight:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 165
    :cond_1b
    :goto_1b
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getChildCount()I

    move-result v0

    .line 166
    .local v0, "count":I
    add-int/lit8 v4, v0, -0x1

    if-ne v1, v4, :cond_2f

    .line 167
    invoke-virtual {p0, v0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->hasDividerBeforeChildAt(I)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 168
    if-ne v2, v5, :cond_38

    .line 169
    iget v4, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerHeight:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 175
    :cond_2f
    :goto_2f
    invoke-super/range {p0 .. p5}, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineLinearLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 176
    return-void

    .line 161
    .end local v0    # "count":I
    :cond_33
    iget v4, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerWidth:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    goto :goto_1b

    .line 171
    .restart local v0    # "count":I
    :cond_38
    iget v4, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerWidth:I

    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    goto :goto_2f
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_e

    .line 181
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->getOrientation()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_12

    .line 182
    invoke-virtual {p0, p1}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->drawDividersVertical(Landroid/graphics/Canvas;)V

    .line 187
    :cond_e
    :goto_e
    invoke-super {p0, p1}, Lcom/actionbarsherlock/internal/nineoldandroids/widget/NineLinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 188
    return-void

    .line 184
    :cond_12
    invoke-virtual {p0, p1}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->drawDividersHorizontal(Landroid/graphics/Canvas;)V

    goto :goto_e
.end method

.method public setDividerDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 6
    .param p1, "divider"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v1, 0x0

    .line 96
    iget-object v2, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    if-ne p1, v2, :cond_6

    .line 115
    :goto_5
    return-void

    .line 101
    :cond_6
    instance-of v2, p1, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v2, :cond_18

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-ge v2, v3, :cond_18

    .line 102
    new-instance v0, Lcom/actionbarsherlock/internal/widget/IcsColorDrawable;

    check-cast p1, Landroid/graphics/drawable/ColorDrawable;

    .end local p1    # "divider":Landroid/graphics/drawable/Drawable;
    invoke-direct {v0, p1}, Lcom/actionbarsherlock/internal/widget/IcsColorDrawable;-><init>(Landroid/graphics/drawable/ColorDrawable;)V

    .local v0, "divider":Landroid/graphics/drawable/Drawable;
    move-object p1, v0

    .line 105
    .end local v0    # "divider":Landroid/graphics/drawable/Drawable;
    .restart local p1    # "divider":Landroid/graphics/drawable/Drawable;
    :cond_18
    iput-object p1, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDivider:Landroid/graphics/drawable/Drawable;

    .line 106
    if-eqz p1, :cond_32

    .line 107
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    iput v2, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerWidth:I

    .line 108
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    iput v2, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerHeight:I

    .line 113
    :goto_28
    if-nez p1, :cond_2b

    const/4 v1, 0x1

    :cond_2b
    invoke-virtual {p0, v1}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->setWillNotDraw(Z)V

    .line 114
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->requestLayout()V

    goto :goto_5

    .line 110
    :cond_32
    iput v1, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerWidth:I

    .line 111
    iput v1, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerHeight:I

    goto :goto_28
.end method

.method public setDividerPadding(I)V
    .registers 2
    .param p1, "padding"    # I

    .prologue
    .line 127
    iput p1, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mDividerPadding:I

    .line 128
    return-void
.end method

.method public setShowDividers(I)V
    .registers 3
    .param p1, "showDividers"    # I

    .prologue
    .line 75
    iget v0, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mShowDividers:I

    if-eq p1, v0, :cond_a

    .line 76
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->requestLayout()V

    .line 77
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->invalidate()V

    .line 79
    :cond_a
    iput p1, p0, Lcom/actionbarsherlock/internal/widget/IcsLinearLayout;->mShowDividers:I

    .line 80
    return-void
.end method
