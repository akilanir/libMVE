.class public Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;
.super Ljava/lang/Object;
.source "BadgeDrawableBuilder.java"


# instance fields
.field private mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;


# direct methods
.method public constructor <init>(Lcom/mikepenz/materialdrawer/holder/BadgeStyle;)V
    .registers 2
    .param p1, "style"    # Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    .line 20
    return-void
.end method


# virtual methods
.method public build(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;
    .registers 8
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 23
    new-instance v2, Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/StateListDrawable;-><init>()V

    .line 25
    .local v2, "stateListDrawable":Landroid/graphics/drawable/StateListDrawable;
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->getGradientDrawable()I

    move-result v3

    invoke-static {p1, v3}, Lcom/mikepenz/materialize/util/UIUtils;->getCompatDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 26
    .local v0, "normal":Landroid/graphics/drawable/GradientDrawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/GradientDrawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 28
    .local v1, "selected":Landroid/graphics/drawable/GradientDrawable;
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->getColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v3

    invoke-static {v3, p1, v0}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->applyToOrTransparent(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;Landroid/graphics/drawable/GradientDrawable;)V

    .line 29
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->getColorPressed()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v3

    if-nez v3, :cond_6f

    .line 30
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->getColor()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v3

    invoke-static {v3, p1, v1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->applyToOrTransparent(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;Landroid/graphics/drawable/GradientDrawable;)V

    .line 35
    :goto_39
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->getCorners()Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v3

    if-eqz v3, :cond_5d

    .line 36
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->getCorners()Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->asPixel(Landroid/content/Context;)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 37
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->getCorners()Lcom/mikepenz/materialdrawer/holder/DimenHolder;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/mikepenz/materialdrawer/holder/DimenHolder;->asPixel(Landroid/content/Context;)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 40
    :cond_5d
    const/4 v3, 0x1

    new-array v3, v3, [I

    const/4 v4, 0x0

    const v5, 0x10100a7

    aput v5, v3, v4

    invoke-virtual {v2, v3, v1}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 41
    sget-object v3, Landroid/util/StateSet;->WILD_CARD:[I

    invoke-virtual {v2, v3, v0}, Landroid/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    .line 43
    return-object v2

    .line 32
    :cond_6f
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/model/utils/BadgeDrawableBuilder;->mStyle:Lcom/mikepenz/materialdrawer/holder/BadgeStyle;

    invoke-virtual {v3}, Lcom/mikepenz/materialdrawer/holder/BadgeStyle;->getColorPressed()Lcom/mikepenz/materialdrawer/holder/ColorHolder;

    move-result-object v3

    invoke-static {v3, p1, v1}, Lcom/mikepenz/materialdrawer/holder/ColorHolder;->applyToOrTransparent(Lcom/mikepenz/materialdrawer/holder/ColorHolder;Landroid/content/Context;Landroid/graphics/drawable/GradientDrawable;)V

    goto :goto_39
.end method
