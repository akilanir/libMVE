.class public abstract Lcom/github/mikephil/charting/renderer/LineRadarRenderer;
.super Lcom/github/mikephil/charting/renderer/LineScatterCandleRadarRenderer;
.source "LineRadarRenderer.java"


# direct methods
.method public constructor <init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V
    .registers 3
    .param p1, "animator"    # Lcom/github/mikephil/charting/animation/ChartAnimator;
    .param p2, "viewPortHandler"    # Lcom/github/mikephil/charting/utils/ViewPortHandler;

    .prologue
    .line 20
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/renderer/LineScatterCandleRadarRenderer;-><init>(Lcom/github/mikephil/charting/animation/ChartAnimator;Lcom/github/mikephil/charting/utils/ViewPortHandler;)V

    .line 21
    return-void
.end method

.method private clipPathSupported()Z
    .registers 3

    .prologue
    .line 94
    invoke-static {}, Lcom/github/mikephil/charting/utils/Utils;->getSDKInt()I

    move-result v0

    const/16 v1, 0x12

    if-lt v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method


# virtual methods
.method protected drawFilledPath(Landroid/graphics/Canvas;Landroid/graphics/Path;II)V
    .registers 10
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "filledPath"    # Landroid/graphics/Path;
    .param p3, "fillColor"    # I
    .param p4, "fillAlpha"    # I

    .prologue
    .line 61
    shl-int/lit8 v3, p4, 0x18

    const v4, 0xffffff

    and-int/2addr v4, p3

    or-int v0, v3, v4

    .line 63
    .local v0, "color":I
    invoke-direct {p0}, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->clipPathSupported()Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 65
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 66
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 68
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 69
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 86
    :goto_1a
    return-void

    .line 73
    :cond_1b
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v1

    .line 74
    .local v1, "previous":Landroid/graphics/Paint$Style;
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    .line 77
    .local v2, "previousColor":I
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mRenderPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 78
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 80
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 83
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 84
    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mRenderPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    goto :goto_1a
.end method

.method protected drawFilledPath(Landroid/graphics/Canvas;Landroid/graphics/Path;Landroid/graphics/drawable/Drawable;)V
    .registers 8
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "filledPath"    # Landroid/graphics/Path;
    .param p3, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->clipPathSupported()Z

    move-result v0

    if-eqz v0, :cond_32

    .line 34
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 35
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 37
    iget-object v0, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentLeft()F

    move-result v0

    float-to-int v0, v0

    iget-object v1, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v1}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentTop()F

    move-result v1

    float-to-int v1, v1

    iget-object v2, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v2}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentRight()F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lcom/github/mikephil/charting/renderer/LineRadarRenderer;->mViewPortHandler:Lcom/github/mikephil/charting/utils/ViewPortHandler;

    invoke-virtual {v3}, Lcom/github/mikephil/charting/utils/ViewPortHandler;->contentBottom()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p3, v0, v1, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 41
    invoke-virtual {p3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 43
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 48
    return-void

    .line 45
    :cond_32
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Fill-drawables not (yet) supported below API level 18, this code was run on API level "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/github/mikephil/charting/utils/Utils;->getSDKInt()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
