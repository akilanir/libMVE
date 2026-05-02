.class public Lcom/mikepenz/materialdrawer/holder/ColorHolder;
.super Ljava/lang/Object;
.source "ColorHolder.java"


# instance fields
.field private mColorInt:I

.field private mColorRes:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x0

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    .line 26
    return-void
.end method

.method public static applyToOr(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V
    .registers 3
    .param p0, "colorHolder"    # Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "colorDefault"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 176
    if-eqz p0, :cond_8

    if-eqz p1, :cond_8

    .line 177
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->applyToOr(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V

    .line 181
    :cond_7
    :goto_7
    return-void

    .line 178
    :cond_8
    if-eqz p1, :cond_7

    .line 179
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_7
.end method

.method public static applyToOrTransparent(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;Landroid/graphics/drawable/GradientDrawable;)V
    .registers 4
    .param p0, "colorHolder"    # Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "gradientDrawable"    # Landroid/graphics/drawable/GradientDrawable;

    .prologue
    .line 191
    if-eqz p0, :cond_8

    if-eqz p2, :cond_8

    .line 192
    invoke-virtual {p0, p1, p2}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->applyTo(Landroid/content/Context;Landroid/graphics/drawable/GradientDrawable;)V

    .line 196
    :cond_7
    :goto_7
    return-void

    .line 193
    :cond_8
    if-eqz p2, :cond_7

    .line 194
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    goto :goto_7
.end method

.method public static color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;)I
    .registers 3
    .param p0, "colorHolder"    # Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 161
    if-nez p0, :cond_4

    .line 162
    const/4 v0, 0x0

    .line 164
    :goto_3
    return v0

    :cond_4
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Landroid/content/Context;)I

    move-result v0

    goto :goto_3
.end method

.method public static color(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;II)I
    .registers 5
    .param p0, "colorHolder"    # Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "colorStyle"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param
    .param p3, "colorDefault"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 146
    if-nez p0, :cond_7

    .line 147
    invoke-static {p1, p2, p3}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v0

    .line 149
    :goto_6
    return v0

    :cond_7
    invoke-virtual {p0, p1, p2, p3}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Landroid/content/Context;II)I

    move-result v0

    goto :goto_6
.end method

.method public static fromColor(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2
    .param p0, "colorInt"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 35
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;-><init>()V

    .line 36
    .local v0, "colorHolder":Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    iput p0, v0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    .line 37
    return-object v0
.end method

.method public static fromColorRes(I)Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    .registers 2
    .param p0, "colorRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 29
    new-instance v0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    invoke-direct {v0}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;-><init>()V

    .line 30
    .local v0, "colorHolder":Lcom/mikepenz/materialdrawer/holder/ColorHolder;
    iput p0, v0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    .line 31
    return-object v0
.end method


# virtual methods
.method public applyTo(Landroid/content/Context;Landroid/graphics/drawable/GradientDrawable;)V
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "drawable"    # Landroid/graphics/drawable/GradientDrawable;

    .prologue
    .line 68
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    if-eqz v0, :cond_a

    .line 69
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 73
    :cond_9
    :goto_9
    return-void

    .line 70
    :cond_a
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    .line 71
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    invoke-static {p1, v0}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    goto :goto_9
.end method

.method public applyTo(Lcom/mikepenz/iconics/IconicsDrawable;)V
    .registers 4
    .param p1, "iconicsDrawable"    # Lcom/mikepenz/iconics/IconicsDrawable;

    .prologue
    .line 54
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    if-eqz v0, :cond_a

    .line 55
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    invoke-virtual {p1, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->color(I)Lcom/mikepenz/iconics/IconicsDrawable;

    .line 59
    :cond_9
    :goto_9
    return-void

    .line 56
    :cond_a
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    .line 57
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    invoke-virtual {p1, v0}, Lcom/mikepenz/iconics/IconicsDrawable;->colorRes(I)Lcom/mikepenz/iconics/IconicsDrawable;

    goto :goto_9
.end method

.method public applyToBackground(Landroid/view/View;)V
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 82
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    if-eqz v0, :cond_a

    .line 83
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 87
    :cond_9
    :goto_9
    return-void

    .line 84
    :cond_a
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_9

    .line 85
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_9
.end method

.method public applyToOr(Landroid/widget/TextView;Landroid/content/res/ColorStateList;)V
    .registers 5
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "colorDefault"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 96
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    if-eqz v0, :cond_a

    .line 97
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    :cond_9
    :goto_9
    return-void

    .line 98
    :cond_a
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1d

    .line 99
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    invoke-static {v0, v1}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_9

    .line 100
    :cond_1d
    if-eqz p2, :cond_9

    .line 101
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_9
.end method

.method public color(Landroid/content/Context;)I
    .registers 4
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 130
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    if-nez v0, :cond_11

    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_11

    .line 131
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    invoke-static {p1, v0}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    .line 133
    :cond_11
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    return v0
.end method

.method public color(Landroid/content/Context;II)I
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "colorStyle"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param
    .param p3, "colorDefaultRes"    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param

    .prologue
    .line 115
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->color(Landroid/content/Context;)I

    move-result v0

    .line 116
    .local v0, "color":I
    if-nez v0, :cond_a

    .line 117
    invoke-static {p1, p2, p3}, Lcom/mikepenz/materialize/util/UIUtils;->getThemeColorFromAttrOrRes(Landroid/content/Context;II)I

    move-result v0

    .line 119
    .end local v0    # "color":I
    :cond_a
    return v0
.end method

.method public getColorInt()I
    .registers 2

    .prologue
    .line 41
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorInt:I

    return v0
.end method

.method public getColorRes()I
    .registers 2

    .prologue
    .line 45
    iget v0, p0, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->mColorRes:I

    return v0
.end method
