.class public Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
.super Ljava/lang/Object;
.source "BadgeStyle.java"


# instance fields
.field private mBadgeBackground:Landroid/graphics/drawable/Drawable;

.field private mColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field private mColorPressed:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

.field private mCorners:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

.field private mGradientDrawable:I

.field private mMinWidth:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

.field private mPaddingLeftRight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

.field private mPaddingTopBottom:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

.field private mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    sget v0, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_badge:I

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mGradientDrawable:I

    .line 25
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingTopBottom:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 26
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingLeftRight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 27
    const/16 v0, 0x14

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mMinWidth:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 136
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p2, "colorPressed"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    sget v0, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_badge:I

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mGradientDrawable:I

    .line 25
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingTopBottom:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 26
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingLeftRight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 27
    const/16 v0, 0x14

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mMinWidth:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 148
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 149
    invoke-static {p2}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColorPressed:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 150
    return-void
.end method

.method public constructor <init>(IIII)V
    .registers 6
    .param p1, "gradientDrawable"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p3, "colorPressed"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param
    .param p4, "textColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    sget v0, Lcom/mikepenz/materialdrawer/R$drawable;->material_drawer_badge:I

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mGradientDrawable:I

    .line 25
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingTopBottom:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 26
    const/4 v0, 0x3

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingLeftRight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 27
    const/16 v0, 0x14

    invoke-static {v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mMinWidth:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 153
    iput p1, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mGradientDrawable:I

    .line 154
    invoke-static {p2}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 155
    invoke-static {p3}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColorPressed:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 156
    invoke-static {p4}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 157
    return-void
.end method


# virtual methods
.method public getBadgeBackground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mBadgeBackground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getColorPressed()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColorPressed:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public getCorners()Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mCorners:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    return-object v0
.end method

.method public getGradientDrawable()I
    .registers 2

    .prologue
    .line 30
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mGradientDrawable:I

    return v0
.end method

.method public getMinWidth()Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    .registers 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mMinWidth:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    return-object v0
.end method

.method public getPaddingLeftRight()Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingLeftRight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    return-object v0
.end method

.method public getPaddingTopBottom()Lcom/mikepenz/materialdrawer/holder/DimenHolder;
    .registers 2

    .prologue
    .line 118
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingTopBottom:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    return-object v0
.end method

.method public getTextColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2

    .prologue
    .line 78
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    return-object v0
.end method

.method public style(Landroid/widget/TextView;)V
    .registers 3
    .param p1, "badgeTextView"    # Landroid/widget/TextView;

    .prologue
    .line 160
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->style(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 161
    return-void
.end method

.method public style(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V
    .registers 8
    .param p1, "badgeTextView"    # Landroid/widget/TextView;
    .param p2, "colorStateList"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 164
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 166
    .local v0, "ctx":Landroid/content/Context;
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mBadgeBackground:Landroid/graphics/drawable/Drawable;

    if-nez v3, :cond_37

    .line 167
    new-instance v3, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;

    invoke-direct {v3, p0}, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;-><init>(Lcom/mikepenz/materialdrawer/holder/BadgeStyle;)V

    invoke-virtual {v3, v0}, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->build(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 173
    :goto_14
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    if-eqz v3, :cond_3d

    .line 174
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    const/4 v4, 0x0

    invoke-static {v3, p1, v4}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->applyToOr(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 180
    :cond_1e
    :goto_1e
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingLeftRight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    invoke-virtual {v3, v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->asPixel(Landroid/content/Context;)I

    move-result v1

    .line 181
    .local v1, "paddingLeftRight":I
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingTopBottom:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    invoke-virtual {v3, v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->asPixel(Landroid/content/Context;)I

    move-result v2

    .line 182
    .local v2, "paddingTopBottom":I
    invoke-virtual {p1, v1, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 185
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mMinWidth:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    invoke-virtual {v3, v0}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->asPixel(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 186
    return-void

    .line 169
    .end local v1    # "paddingLeftRight":I
    .end local v2    # "paddingTopBottom":I
    :cond_37
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mBadgeBackground:Landroid/graphics/drawable/Drawable;

    invoke-static {p1, v3}, Lcom/mikepenz/materialize/util/UIUtils;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    goto :goto_14

    .line 175
    :cond_3d
    if-eqz p2, :cond_1e

    .line 176
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_1e
.end method

.method public withBadgeBackground(Landroid/graphics/drawable/Drawable;)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "badgeBackground"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mBadgeBackground:Landroid/graphics/drawable/Drawable;

    .line 45
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mGradientDrawable:I

    .line 46
    return-object p0
.end method

.method public withColor(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 54
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 55
    return-object p0
.end method

.method public withColorPressed(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "colorPressed"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 68
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColorPressed:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 69
    return-object p0
.end method

.method public withColorPressedRes(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "colorPressed"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 73
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColorPressed:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 74
    return-object p0
.end method

.method public withColorRes(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 59
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 60
    return-object p0
.end method

.method public withCorners(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "corners"    # I

    .prologue
    .line 96
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromPixel(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mCorners:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 97
    return-object p0
.end method

.method public withCornersDp(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "corners"    # I

    .prologue
    .line 101
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mCorners:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 102
    return-object p0
.end method

.method public withGradientDrawable(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "gradientDrawable"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 34
    iput p1, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mGradientDrawable:I

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mBadgeBackground:Landroid/graphics/drawable/Drawable;

    .line 36
    return-object p0
.end method

.method public withMinWidth(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "minWidth"    # I

    .prologue
    .line 143
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromPixel(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mMinWidth:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 144
    return-object p0
.end method

.method public withPadding(I)V
    .registers 3
    .param p1, "padding"    # I

    .prologue
    .line 130
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromPixel(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingLeftRight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 131
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromPixel(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingTopBottom:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 132
    return-void
.end method

.method public withPaddingLeftRightDp(I)V
    .registers 3
    .param p1, "paddingLeftRight"    # I

    .prologue
    .line 114
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingLeftRight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 115
    return-void
.end method

.method public withPaddingLeftRightPx(I)V
    .registers 3
    .param p1, "paddingLeftRight"    # I

    .prologue
    .line 110
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromPixel(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingLeftRight:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 111
    return-void
.end method

.method public withPaddingTopBottomDp(I)V
    .registers 3
    .param p1, "paddingTopBottom"    # I

    .prologue
    .line 126
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromDp(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingTopBottom:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 127
    return-void
.end method

.method public withPaddingTopBottomPx(I)V
    .registers 3
    .param p1, "paddingTopBottom"    # I

    .prologue
    .line 122
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->fromPixel(I)Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mPaddingTopBottom:Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    .line 123
    return-void
.end method

.method public withTextColor(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "textColor"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 82
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 83
    return-object p0
.end method

.method public withTextColorRes(I)Lcom/mikepenz/materialdrawer/holder/BadgeStyle;
    .registers 3
    .param p1, "textColor"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 87
    invoke-static {p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->mTextColor:Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    .line 88
    return-object p0
.end method
