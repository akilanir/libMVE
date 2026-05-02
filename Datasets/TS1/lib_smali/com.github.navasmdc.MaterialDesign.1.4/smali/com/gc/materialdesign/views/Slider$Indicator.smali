.class Lcom/gc/materialdesign/views/Slider$Indicator;
.super Landroid/widget/RelativeLayout;
.source "Slider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/gc/materialdesign/views/Slider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Indicator"
.end annotation


# instance fields
.field animate:Z

.field finalSize:F

.field finalY:F

.field numberIndicatorResize:Z

.field size:F

.field final synthetic this$0:Lcom/gc/materialdesign/views/Slider;

.field x:F

.field y:F


# direct methods
.method public constructor <init>(Lcom/gc/materialdesign/views/Slider;Landroid/content/Context;)V
    .registers 5
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 393
    iput-object p1, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    .line 394
    invoke-direct {p0, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 379
    iput v0, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->x:F

    .line 380
    iput v0, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->y:F

    .line 382
    iput v0, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->size:F

    .line 385
    iput v0, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->finalY:F

    .line 387
    iput v0, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->finalSize:F

    .line 389
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->animate:Z

    .line 391
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->numberIndicatorResize:Z

    .line 395
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider$Indicator;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/gc/materialdesign/views/Slider$Indicator;->setBackgroundColor(I)V

    .line 397
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/high16 v5, 0x40000000    # 2.0f

    .line 401
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 403
    iget-boolean v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->numberIndicatorResize:Z

    if-nez v2, :cond_2c

    .line 404
    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 406
    .local v1, "params":Landroid/widget/RelativeLayout$LayoutParams;
    iget v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->finalSize:F

    float-to-int v2, v2

    mul-int/lit8 v2, v2, 0x2

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 407
    iget v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->finalSize:F

    float-to-int v2, v2

    mul-int/lit8 v2, v2, 0x2

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 408
    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 411
    .end local v1    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_2c
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 412
    .local v0, "paint":Landroid/graphics/Paint;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 413
    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget v2, v2, Lcom/gc/materialdesign/views/Slider;->backgroundColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 414
    iget-boolean v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->animate:Z

    if-eqz v2, :cond_6d

    .line 415
    iget v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->y:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-nez v2, :cond_4f

    .line 416
    iget v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->finalY:F

    iget v3, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->finalSize:F

    mul-float/2addr v3, v5

    add-float/2addr v2, v3

    iput v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->y:F

    .line 417
    :cond_4f
    iget v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->y:F

    const/high16 v3, 0x40c00000    # 6.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider$Indicator;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v2, v3

    iput v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->y:F

    .line 418
    iget v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->size:F

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider$Indicator;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v5, v3}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v2, v3

    iput v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->size:F

    .line 420
    :cond_6d
    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-static {v2}, Lcom/nineoldandroids/view/ViewHelper;->getX(Landroid/view/View;)F

    move-result v3

    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v2}, Lcom/gc/materialdesign/views/Slider$Ball;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2}, Lcom/gc/materialdesign/utils/Utils;->getRelativeLeft(Landroid/view/View;)I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, v3

    iget-object v3, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v3, v3, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v3}, Lcom/gc/materialdesign/views/Slider$Ball;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    add-float/2addr v2, v3

    iget v3, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->y:F

    iget v4, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->size:F

    invoke-virtual {p1, v2, v3, v4, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 424
    iget-boolean v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->animate:Z

    if-eqz v2, :cond_a7

    iget v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->size:F

    iget v3, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->finalSize:F

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_a7

    .line 425
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->animate:Z

    .line 426
    :cond_a7
    iget-boolean v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->animate:Z

    if-nez v2, :cond_109

    .line 427
    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    iget-object v3, v2, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-static {v2}, Lcom/nineoldandroids/view/ViewHelper;->getX(Landroid/view/View;)F

    move-result v4

    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v2}, Lcom/gc/materialdesign/views/Slider$Ball;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2}, Lcom/gc/materialdesign/utils/Utils;->getRelativeLeft(Landroid/view/View;)I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, v4

    iget-object v4, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v4, v4, Lcom/gc/materialdesign/views/Slider;->ball:Lcom/gc/materialdesign/views/Slider$Ball;

    invoke-virtual {v4}, Lcom/gc/materialdesign/views/Slider$Ball;->getWidth()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    add-float/2addr v2, v4

    iget v4, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->size:F

    sub-float/2addr v2, v4

    invoke-static {v3, v2}, Lcom/nineoldandroids/view/ViewHelper;->setX(Landroid/view/View;F)V

    .line 433
    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    iget v3, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->y:F

    iget v4, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->size:F

    sub-float/2addr v3, v4

    invoke-static {v2, v3}, Lcom/nineoldandroids/view/ViewHelper;->setY(Landroid/view/View;F)V

    .line 434
    iget-object v2, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider;->numberIndicator:Lcom/gc/materialdesign/views/Slider$NumberIndicator;

    iget-object v2, v2, Lcom/gc/materialdesign/views/Slider$NumberIndicator;->numberIndicator:Landroid/widget/TextView;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/gc/materialdesign/views/Slider$Indicator;->this$0:Lcom/gc/materialdesign/views/Slider;

    iget v4, v4, Lcom/gc/materialdesign/views/Slider;->value:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 437
    :cond_109
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/Slider$Indicator;->invalidate()V

    .line 438
    return-void
.end method
