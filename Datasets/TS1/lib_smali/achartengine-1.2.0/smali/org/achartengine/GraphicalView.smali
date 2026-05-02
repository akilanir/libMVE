.class public Lorg/achartengine/GraphicalView;
.super Landroid/view/View;
.source "GraphicalView.java"


# static fields
.field private static final ZOOM_BUTTONS_COLOR:I


# instance fields
.field private fitZoomImage:Landroid/graphics/Bitmap;

.field private mChart:Lorg/achartengine/chart/AbstractChart;

.field private mDrawn:Z

.field private mFitZoom:Lorg/achartengine/tools/FitZoom;

.field private mHandler:Landroid/os/Handler;

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/Rect;

.field private mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

.field private mTouchHandler:Lorg/achartengine/ITouchHandler;

.field private mZoomIn:Lorg/achartengine/tools/Zoom;

.field private mZoomOut:Lorg/achartengine/tools/Zoom;

.field private mZoomR:Landroid/graphics/RectF;

.field private oldX:F

.field private oldY:F

.field private zoomInImage:Landroid/graphics/Bitmap;

.field private zoomOutImage:Landroid/graphics/Bitmap;

.field private zoomSize:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/16 v1, 0x96

    .line 66
    const/16 v0, 0xaf

    invoke-static {v0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    sput v0, Lorg/achartengine/GraphicalView;->ZOOM_BUTTONS_COLOR:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/achartengine/chart/AbstractChart;)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "chart"    # Lorg/achartengine/chart/AbstractChart;

    .prologue
    .line 91
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 52
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    .line 56
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mZoomR:Landroid/graphics/RectF;

    .line 64
    const/16 v1, 0x32

    iput v1, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    .line 74
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    .line 92
    iput-object p2, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    .line 93
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mHandler:Landroid/os/Handler;

    .line 94
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    instance-of v1, v1, Lorg/achartengine/chart/XYChart;

    if-eqz v1, :cond_dd

    .line 95
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    check-cast v1, Lorg/achartengine/chart/XYChart;

    invoke-virtual {v1}, Lorg/achartengine/chart/XYChart;->getRenderer()Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    move-result-object v1

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    .line 99
    :goto_35
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomButtonsVisible()Z

    move-result v1

    if-eqz v1, :cond_67

    .line 100
    const-class v1, Lorg/achartengine/GraphicalView;

    const-string v2, "image/zoom_in.png"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->zoomInImage:Landroid/graphics/Bitmap;

    .line 102
    const-class v1, Lorg/achartengine/GraphicalView;

    const-string v2, "image/zoom_out.png"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->zoomOutImage:Landroid/graphics/Bitmap;

    .line 104
    const-class v1, Lorg/achartengine/GraphicalView;

    const-string v2, "image/zoom-1.png"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->fitZoomImage:Landroid/graphics/Bitmap;

    .line 108
    :cond_67
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    instance-of v1, v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    if-eqz v1, :cond_84

    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    check-cast v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getMarginsColor()I

    move-result v1

    if-nez v1, :cond_84

    .line 110
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    check-cast v1, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    iget-object v2, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->setMarginsColor(I)V

    .line 112
    :cond_84
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomEnabled()Z

    move-result v1

    if-eqz v1, :cond_94

    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomButtonsVisible()Z

    move-result v1

    if-nez v1, :cond_9c

    :cond_94
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v1}, Lorg/achartengine/renderer/DefaultRenderer;->isExternalZoomEnabled()Z

    move-result v1

    if-eqz v1, :cond_c5

    .line 114
    :cond_9c
    new-instance v1, Lorg/achartengine/tools/Zoom;

    iget-object v2, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    const/4 v3, 0x1

    iget-object v4, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DefaultRenderer;->getZoomRate()F

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lorg/achartengine/tools/Zoom;-><init>(Lorg/achartengine/chart/AbstractChart;ZF)V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    .line 115
    new-instance v1, Lorg/achartengine/tools/Zoom;

    iget-object v2, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/DefaultRenderer;->getZoomRate()F

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lorg/achartengine/tools/Zoom;-><init>(Lorg/achartengine/chart/AbstractChart;ZF)V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    .line 116
    new-instance v1, Lorg/achartengine/tools/FitZoom;

    iget-object v2, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    invoke-direct {v1, v2}, Lorg/achartengine/tools/FitZoom;-><init>(Lorg/achartengine/chart/AbstractChart;)V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mFitZoom:Lorg/achartengine/tools/FitZoom;

    .line 118
    :cond_c5
    const/4 v0, 0x7

    .line 120
    .local v0, "version":I
    :try_start_c6
    sget-object v1, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I
    :try_end_cf
    .catch Ljava/lang/Exception; {:try_start_c6 .. :try_end_cf} :catch_f3

    move-result v0

    .line 124
    :goto_d0
    const/4 v1, 0x7

    if-ge v0, v1, :cond_e9

    .line 125
    new-instance v1, Lorg/achartengine/TouchHandlerOld;

    iget-object v2, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    invoke-direct {v1, p0, v2}, Lorg/achartengine/TouchHandlerOld;-><init>(Lorg/achartengine/GraphicalView;Lorg/achartengine/chart/AbstractChart;)V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    .line 129
    :goto_dc
    return-void

    .line 97
    .end local v0    # "version":I
    :cond_dd
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    check-cast v1, Lorg/achartengine/chart/RoundChart;

    invoke-virtual {v1}, Lorg/achartengine/chart/RoundChart;->getRenderer()Lorg/achartengine/renderer/DefaultRenderer;

    move-result-object v1

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    goto/16 :goto_35

    .line 127
    .restart local v0    # "version":I
    :cond_e9
    new-instance v1, Lorg/achartengine/TouchHandler;

    iget-object v2, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    invoke-direct {v1, p0, v2}, Lorg/achartengine/TouchHandler;-><init>(Lorg/achartengine/GraphicalView;Lorg/achartengine/chart/AbstractChart;)V

    iput-object v1, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    goto :goto_dc

    .line 121
    :catch_f3
    move-exception v1

    goto :goto_d0
.end method


# virtual methods
.method public addPanListener(Lorg/achartengine/tools/PanListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/achartengine/tools/PanListener;

    .prologue
    .line 275
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->addPanListener(Lorg/achartengine/tools/PanListener;)V

    .line 276
    return-void
.end method

.method public addZoomListener(Lorg/achartengine/tools/ZoomListener;ZZ)V
    .registers 5
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;
    .param p2, "onButtons"    # Z
    .param p3, "onPinch"    # Z

    .prologue
    .line 245
    if-eqz p2, :cond_10

    .line 246
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_10

    .line 247
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->addZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 248
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->addZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 251
    :cond_10
    if-eqz p3, :cond_17

    .line 252
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->addZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 254
    :cond_17
    return-void
.end method

.method public getChart()Lorg/achartengine/chart/AbstractChart;
    .registers 2

    .prologue
    .line 164
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    return-object v0
.end method

.method public getCurrentSeriesAndPoint()Lorg/achartengine/model/SeriesSelection;
    .registers 5

    .prologue
    .line 137
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    new-instance v1, Lorg/achartengine/model/Point;

    iget v2, p0, Lorg/achartengine/GraphicalView;->oldX:F

    iget v3, p0, Lorg/achartengine/GraphicalView;->oldY:F

    invoke-direct {v1, v2, v3}, Lorg/achartengine/model/Point;-><init>(FF)V

    invoke-virtual {v0, v1}, Lorg/achartengine/chart/AbstractChart;->getSeriesAndPointForScreenCoordinate(Lorg/achartengine/model/Point;)Lorg/achartengine/model/SeriesSelection;

    move-result-object v0

    return-object v0
.end method

.method protected getZoomRectangle()Landroid/graphics/RectF;
    .registers 2

    .prologue
    .line 288
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomR:Landroid/graphics/RectF;

    return-object v0
.end method

.method public isChartDrawn()Z
    .registers 2

    .prologue
    .line 146
    iget-boolean v0, p0, Lorg/achartengine/GraphicalView;->mDrawn:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 13
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v10, 0x0

    .line 169
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 170
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    .line 171
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    iget v3, v0, Landroid/graphics/Rect;->top:I

    .line 172
    .local v3, "top":I
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    iget v2, v0, Landroid/graphics/Rect;->left:I

    .line 173
    .local v2, "left":I
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    .line 174
    .local v4, "width":I
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v5

    .line 175
    .local v5, "height":I
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isInScroll()Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 176
    const/4 v3, 0x0

    .line 177
    const/4 v2, 0x0

    .line 178
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->getMeasuredWidth()I

    move-result v4

    .line 179
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->getMeasuredHeight()I

    move-result v5

    .line 181
    :cond_2f
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    iget-object v6, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v0 .. v6}, Lorg/achartengine/chart/AbstractChart;->draw(Landroid/graphics/Canvas;IIIILandroid/graphics/Paint;)V

    .line 182
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    if-eqz v0, :cond_c7

    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomEnabled()Z

    move-result v0

    if-eqz v0, :cond_c7

    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomButtonsVisible()Z

    move-result v0

    if-eqz v0, :cond_c7

    .line 183
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    sget v1, Lorg/achartengine/GraphicalView;->ZOOM_BUTTONS_COLOR:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 184
    iget v0, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    div-int/lit8 v1, v1, 0x7

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    .line 185
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomR:Landroid/graphics/RectF;

    add-int v1, v2, v4

    iget v6, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    mul-int/lit8 v6, v6, 0x3

    sub-int/2addr v1, v6

    int-to-float v1, v1

    add-int v6, v3, v5

    int-to-float v6, v6

    iget v8, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    int-to-float v8, v8

    const v9, 0x3f466666    # 0.775f

    mul-float/2addr v8, v9

    sub-float/2addr v6, v8

    add-int v8, v2, v4

    int-to-float v8, v8

    add-int v9, v3, v5

    int-to-float v9, v9

    invoke-virtual {v0, v1, v6, v8, v9}, Landroid/graphics/RectF;->set(FFFF)V

    .line 187
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomR:Landroid/graphics/RectF;

    iget v1, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    div-int/lit8 v1, v1, 0x3

    int-to-float v1, v1

    iget v6, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    div-int/lit8 v6, v6, 0x3

    int-to-float v6, v6

    iget-object v8, p0, Lorg/achartengine/GraphicalView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v6, v8}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 188
    add-int v0, v3, v5

    int-to-float v0, v0

    iget v1, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    int-to-float v1, v1

    const/high16 v6, 0x3f200000    # 0.625f

    mul-float/2addr v1, v6

    sub-float v7, v0, v1

    .line 189
    .local v7, "buttonY":F
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->zoomInImage:Landroid/graphics/Bitmap;

    add-int v1, v2, v4

    int-to-float v1, v1

    iget v6, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    int-to-float v6, v6

    const/high16 v8, 0x40300000    # 2.75f

    mul-float/2addr v6, v8

    sub-float/2addr v1, v6

    invoke-virtual {p1, v0, v1, v7, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 190
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->zoomOutImage:Landroid/graphics/Bitmap;

    add-int v1, v2, v4

    int-to-float v1, v1

    iget v6, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    int-to-float v6, v6

    const/high16 v8, 0x3fe00000    # 1.75f

    mul-float/2addr v6, v8

    sub-float/2addr v1, v6

    invoke-virtual {p1, v0, v1, v7, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 191
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->fitZoomImage:Landroid/graphics/Bitmap;

    add-int v1, v2, v4

    int-to-float v1, v1

    iget v6, p0, Lorg/achartengine/GraphicalView;->zoomSize:I

    int-to-float v6, v6

    const/high16 v8, 0x3f400000    # 0.75f

    mul-float/2addr v6, v8

    sub-float/2addr v1, v6

    invoke-virtual {p1, v0, v1, v7, v10}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 193
    .end local v7    # "buttonY":F
    :cond_c7
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/achartengine/GraphicalView;->mDrawn:Z

    .line 194
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 293
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_12

    .line 296
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lorg/achartengine/GraphicalView;->oldX:F

    .line 297
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lorg/achartengine/GraphicalView;->oldY:F

    .line 299
    :cond_12
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    if-eqz v0, :cond_34

    iget-boolean v0, p0, Lorg/achartengine/GraphicalView;->mDrawn:Z

    if-eqz v0, :cond_34

    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isPanEnabled()Z

    move-result v0

    if-nez v0, :cond_2a

    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isZoomEnabled()Z

    move-result v0

    if-eqz v0, :cond_34

    .line 300
    :cond_2a
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->handleTouch(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 301
    const/4 v0, 0x1

    .line 304
    :goto_33
    return v0

    :cond_34
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    goto :goto_33
.end method

.method public removePanListener(Lorg/achartengine/tools/PanListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/achartengine/tools/PanListener;

    .prologue
    .line 284
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->removePanListener(Lorg/achartengine/tools/PanListener;)V

    .line 285
    return-void
.end method

.method public declared-synchronized removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;

    .prologue
    .line 262
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_f

    .line 263
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 264
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V

    .line 266
    :cond_f
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mTouchHandler:Lorg/achartengine/ITouchHandler;

    invoke-interface {v0, p1}, Lorg/achartengine/ITouchHandler;->removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 267
    monitor-exit p0

    return-void

    .line 262
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public repaint()V
    .registers 3

    .prologue
    .line 311
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mHandler:Landroid/os/Handler;

    new-instance v1, Lorg/achartengine/GraphicalView$1;

    invoke-direct {v1, p0}, Lorg/achartengine/GraphicalView$1;-><init>(Lorg/achartengine/GraphicalView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 316
    return-void
.end method

.method public repaint(IIII)V
    .registers 12
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 327
    iget-object v6, p0, Lorg/achartengine/GraphicalView;->mHandler:Landroid/os/Handler;

    new-instance v0, Lorg/achartengine/GraphicalView$2;

    move-object v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/achartengine/GraphicalView$2;-><init>(Lorg/achartengine/GraphicalView;IIII)V

    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 332
    return-void
.end method

.method public setZoomRate(F)V
    .registers 3
    .param p1, "rate"    # F

    .prologue
    .line 202
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_12

    .line 203
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->setZoomRate(F)V

    .line 204
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0, p1}, Lorg/achartengine/tools/Zoom;->setZoomRate(F)V

    .line 206
    :cond_12
    return-void
.end method

.method public toBitmap()Landroid/graphics/Bitmap;
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 340
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/achartengine/GraphicalView;->setDrawingCacheEnabled(Z)V

    .line 341
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->isDrawingCacheEnabled()Z

    move-result v0

    if-nez v0, :cond_e

    .line 342
    invoke-virtual {p0, v1}, Lorg/achartengine/GraphicalView;->setDrawingCacheEnabled(Z)V

    .line 344
    :cond_e
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->isApplyBackgroundColor()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 345
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mRenderer:Lorg/achartengine/renderer/DefaultRenderer;

    invoke-virtual {v0}, Lorg/achartengine/renderer/DefaultRenderer;->getBackgroundColor()I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/achartengine/GraphicalView;->setDrawingCacheBackgroundColor(I)V

    .line 347
    :cond_1f
    const/high16 v0, 0x100000

    invoke-virtual {p0, v0}, Lorg/achartengine/GraphicalView;->setDrawingCacheQuality(I)V

    .line 348
    invoke-virtual {p0, v1}, Lorg/achartengine/GraphicalView;->getDrawingCache(Z)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public toRealPoint(I)[D
    .registers 5
    .param p1, "scale"    # I

    .prologue
    .line 156
    iget-object v1, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    instance-of v1, v1, Lorg/achartengine/chart/XYChart;

    if-eqz v1, :cond_13

    .line 157
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mChart:Lorg/achartengine/chart/AbstractChart;

    check-cast v0, Lorg/achartengine/chart/XYChart;

    .line 158
    .local v0, "chart":Lorg/achartengine/chart/XYChart;
    iget v1, p0, Lorg/achartengine/GraphicalView;->oldX:F

    iget v2, p0, Lorg/achartengine/GraphicalView;->oldY:F

    invoke-virtual {v0, v1, v2, p1}, Lorg/achartengine/chart/XYChart;->toRealPoint(FFI)[D

    move-result-object v1

    .line 160
    .end local v0    # "chart":Lorg/achartengine/chart/XYChart;
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public zoomIn()V
    .registers 3

    .prologue
    .line 212
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_d

    .line 213
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/achartengine/tools/Zoom;->apply(I)V

    .line 214
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->repaint()V

    .line 216
    :cond_d
    return-void
.end method

.method public zoomOut()V
    .registers 3

    .prologue
    .line 222
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    if-eqz v0, :cond_d

    .line 223
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomOut:Lorg/achartengine/tools/Zoom;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/achartengine/tools/Zoom;->apply(I)V

    .line 224
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->repaint()V

    .line 226
    :cond_d
    return-void
.end method

.method public zoomReset()V
    .registers 2

    .prologue
    .line 232
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mFitZoom:Lorg/achartengine/tools/FitZoom;

    if-eqz v0, :cond_11

    .line 233
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mFitZoom:Lorg/achartengine/tools/FitZoom;

    invoke-virtual {v0}, Lorg/achartengine/tools/FitZoom;->apply()V

    .line 234
    iget-object v0, p0, Lorg/achartengine/GraphicalView;->mZoomIn:Lorg/achartengine/tools/Zoom;

    invoke-virtual {v0}, Lorg/achartengine/tools/Zoom;->notifyZoomResetListeners()V

    .line 235
    invoke-virtual {p0}, Lorg/achartengine/GraphicalView;->repaint()V

    .line 237
    :cond_11
    return-void
.end method
