.class public Lcom/gc/materialdesign/views/ButtonRectangle;
.super Lcom/gc/materialdesign/views/Button;
.source "ButtonRectangle.java"


# instance fields
.field height:Ljava/lang/Integer;

.field paddingBottom:I

.field paddingLeft:I

.field paddingRight:I

.field paddingTop:I

.field textButton:Landroid/widget/TextView;

.field width:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Lcom/gc/materialdesign/views/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->setDefaultProperties()V

    .line 25
    return-void
.end method


# virtual methods
.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextView()Landroid/widget/TextView;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v5, 0x0

    const/high16 v7, 0x40e00000    # 7.0f

    const/high16 v6, 0x40c00000    # 6.0f

    .line 124
    invoke-super {p0, p1}, Lcom/gc/materialdesign/views/Button;->onDraw(Landroid/graphics/Canvas;)V

    .line 125
    iget v2, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->x:F

    const/high16 v3, -0x40800000    # -1.0f

    cmpl-float v2, v2, v3

    if-eqz v2, :cond_69

    .line 126
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v6, v3}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getHeight()I

    move-result v3

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v7, v4}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v4

    sub-int/2addr v3, v4

    invoke-direct {v1, v5, v5, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 127
    .local v1, "src":Landroid/graphics/Rect;
    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v6, v2}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v2

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v6, v3}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v3

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getHeight()I

    move-result v5

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v6

    sub-int/2addr v5, v6

    invoke-direct {v0, v2, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 128
    .local v0, "dst":Landroid/graphics/Rect;
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->makeCircle()Landroid/graphics/Bitmap;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v1, v0, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 129
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->invalidate()V

    .line 131
    .end local v0    # "dst":Landroid/graphics/Rect;
    .end local v1    # "src":Landroid/graphics/Rect;
    :cond_69
    return-void
.end method

.method protected setAttributes(Landroid/util/AttributeSet;)V
    .registers 13
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v10, -0x2

    const/high16 v9, 0x40a00000    # 5.0f

    const/4 v8, -0x1

    .line 44
    const-string v5, "http://schemas.android.com/apk/res/android"

    const-string v6, "background"

    invoke-interface {p1, v5, v6, v8}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    .line 45
    .local v0, "bacgroundColor":I
    if-eq v0, v8, :cond_9f

    .line 46
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v5

    invoke-virtual {p0, v5}, Lcom/gc/materialdesign/views/ButtonRectangle;->setBackgroundColor(I)V

    .line 56
    :cond_19
    :goto_19
    const-string v5, "http://schemas.android.com/apk/res/android"

    const-string v6, "padding"

    invoke-interface {p1, v5, v6}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 76
    .local v4, "value":Ljava/lang/String;
    const/4 v2, 0x0

    .line 77
    .local v2, "text":Ljava/lang/String;
    const-string v5, "http://schemas.android.com/apk/res/android"

    const-string v6, "text"

    invoke-interface {p1, v5, v6, v8}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    .line 78
    .local v3, "textResource":I
    if-eq v3, v8, :cond_b4

    .line 79
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 83
    :goto_34
    if-eqz v2, :cond_89

    .line 84
    new-instance v5, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    .line 85
    iget-object v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    iget-object v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    iget-object v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 88
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v10, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 89
    .local v1, "params":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v5, 0xd

    invoke-virtual {v1, v5, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 90
    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v9, v5}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v5

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-static {v9, v6}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v6

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-static {v9, v7}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v7

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-static {v9, v8}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v8

    invoke-virtual {v1, v5, v6, v7, v8}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    .line 91
    iget-object v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 92
    iget-object v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    invoke-virtual {p0, v5}, Lcom/gc/materialdesign/views/ButtonRectangle;->addView(Landroid/view/View;)V

    .line 101
    .end local v1    # "params":Landroid/widget/RelativeLayout$LayoutParams;
    :cond_89
    const-string v5, "http://schemas.android.com/apk/res-auto"

    const-string v6, "rippleSpeed"

    const/high16 v7, 0x40c00000    # 6.0f

    invoke-virtual {p0}, Lcom/gc/materialdesign/views/ButtonRectangle;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/gc/materialdesign/utils/Utils;->dpToPx(FLandroid/content/res/Resources;)I

    move-result v7

    int-to-float v7, v7

    invoke-interface {p1, v5, v6, v7}, Landroid/util/AttributeSet;->getAttributeFloatValue(Ljava/lang/String;Ljava/lang/String;F)F

    move-result v5

    iput v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->rippleSpeed:F

    .line 103
    return-void

    .line 50
    .end local v2    # "text":Ljava/lang/String;
    .end local v3    # "textResource":I
    .end local v4    # "value":Ljava/lang/String;
    :cond_9f
    const-string v5, "http://schemas.android.com/apk/res/android"

    const-string v6, "background"

    invoke-interface {p1, v5, v6, v8}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v5

    iput v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->background:I

    .line 51
    iget v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->background:I

    if-eq v5, v8, :cond_19

    .line 52
    iget v5, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->background:I

    invoke-virtual {p0, v5}, Lcom/gc/materialdesign/views/ButtonRectangle;->setBackgroundColor(I)V

    goto/16 :goto_19

    .line 81
    .restart local v2    # "text":Ljava/lang/String;
    .restart local v3    # "textResource":I
    .restart local v4    # "value":Ljava/lang/String;
    :cond_b4
    const-string v5, "http://schemas.android.com/apk/res/android"

    const-string v6, "text"

    invoke-interface {p1, v5, v6}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_34
.end method

.method protected setDefaultProperties()V
    .registers 2

    .prologue
    .line 32
    const/16 v0, 0x50

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->minWidth:I

    .line 33
    const/16 v0, 0x24

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->minHeight:I

    .line 34
    sget v0, Lcom/gc/materialdesign/R$drawable;->background_button_rectangle:I

    iput v0, p0, Lcom/gc/materialdesign/views/Button;->background:I

    .line 35
    invoke-super {p0}, Lcom/gc/materialdesign/views/Button;->setDefaultProperties()V

    .line 36
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 134
    iget-object v0, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    return-void
.end method

.method public setTextColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 138
    iget-object v0, p0, Lcom/gc/materialdesign/views/ButtonRectangle;->textButton:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 139
    return-void
.end method
