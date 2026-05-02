.class Lcom/gc/materialdesign/views/Switch$Ball;
.super Landroid/view/View;
.source "Switch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gc/materialdesign/views/Switch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Ball"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/gc/materialdesign/views/Switch;

.field xCen:F

.field xFin:F

.field xIni:F


# direct methods
.method public constructor <init>(Lcom/gc/materialdesign/views/Switch;Landroid/content/Context;)V
    .registers 4
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/gc/materialdesign/views/Switch$Ball;->this$0:Lcom/gc/materialdesign/views/Switch;

    .line 211
    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 212
    sget v0, Lcom/gc/materialdesign/R$drawable;->background_switch_ball_uncheck:I

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/Switch$Ball;->setBackgroundResource(I)V

    .line 213
    return-void
.end method


# virtual methods
.method public animateCheck()V
    .registers 6

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 228
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Switch$Ball;->changeBackground()V

    .line 230
    iget-object v1, p0, Lcom/gc/materialdesign/views/Switch$Ball;->this$0:Lcom/gc/materialdesign/views/Switch;

    iget-boolean v1, v1, Lcom/gc/materialdesign/views/Switch;->check:Z

    if-eqz v1, :cond_24

    .line 231
    const-string v1, "x"

    new-array v2, v2, [F

    iget-object v3, p0, Lcom/gc/materialdesign/views/Switch$Ball;->this$0:Lcom/gc/materialdesign/views/Switch;

    iget-object v3, v3, Lcom/gc/materialdesign/views/Switch;->ball:Lcom/gc/materialdesign/views/Switch$Ball;

    iget v3, v3, Lcom/gc/materialdesign/views/Switch$Ball;->xFin:F

    aput v3, v2, v4

    invoke-static {p0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .line 236
    .local v0, "objectAnimator":Lcom/nineoldandroids/animation/ObjectAnimator;
    :goto_1b
    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 237
    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 238
    return-void

    .line 234
    .end local v0    # "objectAnimator":Lcom/nineoldandroids/animation/ObjectAnimator;
    :cond_24
    const-string v1, "x"

    new-array v2, v2, [F

    iget-object v3, p0, Lcom/gc/materialdesign/views/Switch$Ball;->this$0:Lcom/gc/materialdesign/views/Switch;

    iget-object v3, v3, Lcom/gc/materialdesign/views/Switch;->ball:Lcom/gc/materialdesign/views/Switch$Ball;

    iget v3, v3, Lcom/gc/materialdesign/views/Switch$Ball;->xIni:F

    aput v3, v2, v4

    invoke-static {p0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    .restart local v0    # "objectAnimator":Lcom/nineoldandroids/animation/ObjectAnimator;
    goto :goto_1b
.end method

.method public changeBackground()V
    .registers 4

    .prologue
    .line 216
    iget-object v2, p0, Lcom/gc/materialdesign/views/Switch$Ball;->this$0:Lcom/gc/materialdesign/views/Switch;

    iget-boolean v2, v2, Lcom/gc/materialdesign/views/Switch;->check:Z

    if-eqz v2, :cond_21

    .line 217
    sget v2, Lcom/gc/materialdesign/R$drawable;->background_checkbox:I

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/Switch$Ball;->setBackgroundResource(I)V

    .line 218
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Switch$Ball;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 219
    .local v0, "layer":Landroid/graphics/drawable/LayerDrawable;
    sget v2, Lcom/gc/materialdesign/R$id;->shape_bacground:I

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/LayerDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 221
    .local v1, "shape":Landroid/graphics/drawable/GradientDrawable;
    iget-object v2, p0, Lcom/gc/materialdesign/views/Switch$Ball;->this$0:Lcom/gc/materialdesign/views/Switch;

    iget v2, v2, Lcom/gc/materialdesign/views/Switch;->backgroundColor:I

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 225
    .end local v0    # "layer":Landroid/graphics/drawable/LayerDrawable;
    .end local v1    # "shape":Landroid/graphics/drawable/GradientDrawable;
    :goto_20
    return-void

    .line 223
    :cond_21
    sget v2, Lcom/gc/materialdesign/R$drawable;->background_switch_ball_uncheck:I

    invoke-virtual {p0, v2}, Lcom/gc/materialdesign/views/Switch$Ball;->setBackgroundResource(I)V

    goto :goto_20
.end method
