.class public Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;
.super Landroid/widget/TextView;
.source "TextViewWithCircularIndicator.java"


# static fields
.field private static final SELECTED_CIRCLE_ALPHA:I = 0xff


# instance fields
.field private mCircleColor:I

.field mCirclePaint:Landroid/graphics/Paint;

.field private mDrawCircle:Z

.field private final mItemIsSelectedText:Ljava/lang/String;

.field private final mRadius:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 49
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCirclePaint:Landroid/graphics/Paint;

    .line 50
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 51
    .local v0, "res":Landroid/content/res/Resources;
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$color;->mdtp_accent_color:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCircleColor:I

    .line 52
    sget v1, Lcom/wdullaer/materialdatetimepicker/R$dimen;->mdtp_month_select_circle_radius:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    iput v1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mRadius:I

    .line 53
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lcom/wdullaer/materialdatetimepicker/R$string;->mdtp_item_is_selected:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mItemIsSelectedText:Ljava/lang/String;

    .line 55
    invoke-direct {p0}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->init()V

    .line 56
    return-void
.end method

.method private createTextColor(I)Landroid/content/res/ColorStateList;
    .registers 10
    .param p1, "accentColor"    # I

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 79
    new-array v1, v7, [[I

    new-array v2, v5, [I

    const v3, 0x10100a7

    aput v3, v2, v4

    aput-object v2, v1, v4

    new-array v2, v5, [I

    const v3, 0x10100a1

    aput v3, v2, v4

    aput-object v2, v1, v5

    new-array v2, v4, [I

    aput-object v2, v1, v6

    .line 84
    .local v1, "states":[[I
    new-array v0, v7, [I

    aput p1, v0, v4

    const/4 v2, -0x1

    aput v2, v0, v5

    const/high16 v2, -0x1000000

    aput v2, v0, v6

    .line 90
    .local v0, "colors":[I
    new-instance v2, Landroid/content/res/ColorStateList;

    invoke-direct {v2, v1, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v2
.end method

.method private init()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 59
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 60
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 61
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCirclePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCircleColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 62
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCirclePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 63
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCirclePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 64
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCirclePaint:Landroid/graphics/Paint;

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 65
    return-void
.end method


# virtual methods
.method public drawIndicator(Z)V
    .registers 2
    .param p1, "drawCircle"    # Z

    .prologue
    .line 94
    iput-boolean p1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mDrawCircle:Z

    .line 95
    return-void
.end method

.method public getContentDescription()Ljava/lang/CharSequence;
    .registers 5

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    .line 112
    .local v0, "itemText":Ljava/lang/CharSequence;
    iget-boolean v1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mDrawCircle:Z

    if-eqz v1, :cond_14

    .line 113
    iget-object v1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mItemIsSelectedText:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 115
    .end local v0    # "itemText":Ljava/lang/CharSequence;
    :cond_14
    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 9
    .param p1, "canvas"    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 99
    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mDrawCircle:Z

    if-eqz v3, :cond_1e

    .line 100
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->getWidth()I

    move-result v2

    .line 101
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->getHeight()I

    move-result v0

    .line 102
    .local v0, "height":I
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v3

    div-int/lit8 v1, v3, 0x2

    .line 103
    .local v1, "radius":I
    div-int/lit8 v3, v2, 0x2

    int-to-float v3, v3

    div-int/lit8 v4, v0, 0x2

    int-to-float v4, v4

    int-to-float v5, v1

    iget-object v6, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCirclePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 105
    .end local v0    # "height":I
    .end local v1    # "radius":I
    .end local v2    # "width":I
    :cond_1e
    iget-boolean v3, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mDrawCircle:Z

    invoke-virtual {p0, v3}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->setSelected(Z)V

    .line 106
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    .line 107
    return-void
.end method

.method public setAccentColor(I)V
    .registers 4
    .param p1, "color"    # I

    .prologue
    .line 68
    iput p1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCircleColor:I

    .line 69
    iget-object v0, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCirclePaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->mCircleColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 70
    invoke-direct {p0, p1}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->createTextColor(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/wdullaer/materialdatetimepicker/date/TextViewWithCircularIndicator;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 71
    return-void
.end method
