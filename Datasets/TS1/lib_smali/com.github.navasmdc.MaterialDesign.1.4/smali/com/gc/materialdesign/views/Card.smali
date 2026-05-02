.class public Lcom/gc/materialdesign/views/Card;
.super Lcom/gc/materialdesign/views/CustomView;
.source "Card.java"


# instance fields
.field backgroundColor:I

.field paddingBottom:I

.field paddingLeft:I

.field paddingRight:I

.field paddingTop:I

.field textButton:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 35
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/CustomView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    const-string v0, "#FFFFFF"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/gc/materialdesign/views/Card;->backgroundColor:I

    .line 36
    invoke-virtual {p0, p2}, Lcom/gc/materialdesign/views/Card;->setAttributes(Landroid/util/AttributeSet;)V

    .line 37
    return-void
.end method


# virtual methods
.method protected setAttributes(Landroid/util/AttributeSet;)V
    .registers 7
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, -0x1

    .line 43
    sget v2, Lcom/gc/materialdesign/R$drawable;->background_button_rectangle:I

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/Card;->setBackgroundResource(I)V

    .line 46
    const-string v2, "http://schemas.android.com/apk/res/android"

    const-string v3, "background"

    invoke-interface {p1, v2, v3, v4}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 47
    .local v0, "bacgroundColor":I
    if-eq v0, v4, :cond_1c

    .line 48
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Card;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/Card;->setBackgroundColor(I)V

    .line 57
    :goto_1b
    return-void

    .line 51
    :cond_1c
    const-string v2, "http://schemas.android.com/apk/res/android"

    const-string v3, "background"

    invoke-interface {p1, v2, v3}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 52
    .local v1, "background":Ljava/lang/String;
    if-eqz v1, :cond_2e

    .line 53
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/Card;->setBackgroundColor(I)V

    goto :goto_1b

    .line 55
    :cond_2e
    iget v2, p0, Lcom/gc/materialdesign/views/Card;->backgroundColor:I

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/Card;->setBackgroundColor(I)V

    goto :goto_1b
.end method

.method public setBackgroundColor(I)V
    .registers 5
    .param p1, "color"    # I

    .prologue
    .line 61
    iput p1, p0, Lcom/gc/materialdesign/views/Card;->backgroundColor:I

    .line 62
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Card;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 63
    iget v2, p0, Lcom/gc/materialdesign/views/Card;->backgroundColor:I

    iput v2, p0, Lcom/gc/materialdesign/views/Card;->beforeBackground:I

    .line 64
    :cond_c
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Card;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 65
    .local v0, "layer":Landroid/graphics/drawable/LayerDrawable;
    sget v2, Lcom/gc/materialdesign/R$id;->shape_bacground:I

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 66
    .local v1, "shape":Landroid/graphics/drawable/GradientDrawable;
    iget v2, p0, Lcom/gc/materialdesign/views/Card;->backgroundColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 67
    return-void
.end method
