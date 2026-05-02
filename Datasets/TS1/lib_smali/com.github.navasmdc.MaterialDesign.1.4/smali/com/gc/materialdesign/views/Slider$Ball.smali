.class Lcom/gc/materialdesign/views/Slider$Ball;
.super Landroid/view/View;
.source "Slider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gc/materialdesign/views/Slider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Ball"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gc/materialdesign/views/Slider;

.field xCen:F

.field xFin:F

.field xIni:F


# direct methods
.method public constructor <init>(Lcom/gc/materialdesign/views/Slider;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 310
    iput-object p1, p0, Lcom/gc/materialdesign/views/Slider$Ball;->this$0:Lcom/gc/materialdesign/views/Slider;

    .line 311
    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 312
    sget v0, Lcom/gc/materialdesign/R$drawable;->background_switch_ball_uncheck:I

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/Slider$Ball;->setBackgroundResource(I)V

    .line 313
    return-void
.end method


# virtual methods
.method public changeBackground()V
    .registers 5

    .prologue
    .line 316
    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Ball;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget v2, v2, Lcom/gc/materialdesign/views/Slider;->value:I

    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider$Ball;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget v3, v3, Lcom/gc/materialdesign/views/Slider;->min:I

    if-eq v2, v3, :cond_25

    .line 317
    sget v2, Lcom/gc/materialdesign/R$drawable;->background_checkbox:I

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/Slider$Ball;->setBackgroundResource(I)V

    .line 318
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider$Ball;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 319
    .local v0, "layer":Landroid/graphics/drawable/LayerDrawable;
    sget v2, Lcom/gc/materialdesign/R$id;->shape_bacground:I

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 321
    .local v1, "shape":Landroid/graphics/drawable/GradientDrawable;
    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Ball;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget v2, v2, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 325
    .end local v0    # "layer":Landroid/graphics/drawable/LayerDrawable;
    .end local v1    # "shape":Landroid/graphics/drawable/GradientDrawable;
    :goto_24
    return-void

    .line 323
    :cond_25
    sget v2, Lcom/gc/materialdesign/R$drawable;->background_switch_ball_uncheck:I

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/Slider$Ball;->setBackgroundResource(I)V

    goto :goto_24
.end method
