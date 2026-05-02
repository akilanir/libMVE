.class public Lorg/osmdroid/views/overlay/ScaleBarOverlay;
.super Lorg/osmdroid/views/overlay/Overlay;
.source "ScaleBarOverlay.java"

# interfaces
.implements Lorg/osmdroid/util/constants/GeoConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/osmdroid/views/overlay/ScaleBarOverlay$1;,
        Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;
    }
.end annotation


# static fields
.field private static final sTextBoundsRect:Landroid/graphics/Rect;


# instance fields
.field private adjustLength:Z

.field protected alignBottom:Z

.field protected alignRight:Z

.field private barPaint:Landroid/graphics/Paint;

.field protected final barPath:Landroid/graphics/Path;

.field private bgPaint:Landroid/graphics/Paint;

.field private centred:Z

.field private final context:Landroid/content/Context;

.field private lastLatitude:F

.field private lastZoomLevel:I

.field latitudeBar:Z

.field protected final latitudeBarRect:Landroid/graphics/Rect;

.field longitudeBar:Z

.field protected final longitudeBarRect:Landroid/graphics/Rect;

.field private final mMapView:Lorg/osmdroid/views/MapView;

.field private maxLength:F

.field minZoom:I

.field private final resourceProxy:Lorg/osmdroid/ResourceProxy;

.field public screenHeight:I

.field public screenWidth:I

.field private textPaint:Landroid/graphics/Paint;

.field unitsOfMeasure:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

.field xOffset:I

.field public xdpi:F

.field yOffset:I

.field public ydpi:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 59
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->sTextBoundsRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/views/MapView;)V
    .registers 4
    .param p1, "mapView"    # Lorg/osmdroid/views/MapView;

    .prologue
    .line 110
    new-instance v0, Lorg/osmdroid/DefaultResourceProxyImpl;

    invoke-virtual {p1}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/osmdroid/DefaultResourceProxyImpl;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1, v0}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;-><init>(Lorg/osmdroid/views/MapView;Lorg/osmdroid/ResourceProxy;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Lorg/osmdroid/views/MapView;Lorg/osmdroid/ResourceProxy;)V
    .registers 17
    .param p1, "mapView"    # Lorg/osmdroid/views/MapView;
    .param p2, "pResourceProxy"    # Lorg/osmdroid/ResourceProxy;

    .prologue
    const/high16 v13, 0x43840000    # 264.0f

    const-wide/high16 v11, 0x400e000000000000L    # 3.75

    const-wide v9, 0x4000cccccccccccdL    # 2.1

    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 114
    move-object/from16 v0, p2

    invoke-direct {p0, v0}, Lorg/osmdroid/views/overlay/Overlay;-><init>(Lorg/osmdroid/ResourceProxy;)V

    .line 66
    const/16 v5, 0xa

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->xOffset:I

    .line 67
    const/16 v5, 0xa

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->yOffset:I

    .line 68
    iput v6, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->minZoom:I

    .line 70
    sget-object v5, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->metric:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    iput-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->unitsOfMeasure:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    .line 72
    iput-boolean v8, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBar:Z

    .line 73
    iput-boolean v6, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBar:Z

    .line 75
    iput-boolean v6, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignBottom:Z

    .line 76
    iput-boolean v6, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignRight:Z

    .line 84
    new-instance v5, Landroid/graphics/Path;

    invoke-direct {v5}, Landroid/graphics/Path;-><init>()V

    iput-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    .line 85
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBarRect:Landroid/graphics/Rect;

    .line 86
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    iput-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBarRect:Landroid/graphics/Rect;

    .line 88
    const/4 v5, -0x1

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 89
    const/4 v5, 0x0

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastLatitude:F

    .line 101
    iput-boolean v6, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->centred:Z

    .line 102
    iput-boolean v6, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustLength:Z

    .line 115
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    .line 116
    move-object/from16 v0, p2

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    .line 117
    invoke-virtual {p1}, Lorg/osmdroid/views/MapView;->getContext()Landroid/content/Context;

    move-result-object v5

    iput-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->context:Landroid/content/Context;

    .line 118
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->context:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    .line 120
    .local v1, "dm":Landroid/util/DisplayMetrics;
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    iput-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    .line 121
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    const/high16 v6, -0x1000000

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 123
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 124
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    const/16 v6, 0xff

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 125
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    const/high16 v6, 0x40000000    # 2.0f

    iget v7, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v6, v7

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 126
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->bgPaint:Landroid/graphics/Paint;

    .line 128
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    iput-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    .line 129
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    const/high16 v6, -0x1000000

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 130
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v8}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 131
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 132
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    const/16 v6, 0xff

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 133
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    const/high16 v6, 0x41200000    # 10.0f

    iget v7, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v6, v7

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 135
    iget v5, v1, Landroid/util/DisplayMetrics;->xdpi:F

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->xdpi:F

    .line 136
    iget v5, v1, Landroid/util/DisplayMetrics;->ydpi:F

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->ydpi:F

    .line 138
    iget v5, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    .line 139
    iget v5, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    .line 142
    const/4 v3, 0x0

    .line 144
    .local v3, "manufacturer":Ljava/lang/String;
    :try_start_c5
    const-class v5, Landroid/os/Build;

    const-string v6, "MANUFACTURER"

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 145
    .local v2, "field":Ljava/lang/reflect/Field;
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/lang/String;

    move-object v3, v0
    :try_end_d6
    .catch Ljava/lang/Exception; {:try_start_c5 .. :try_end_d6} :catch_136

    .line 149
    .end local v2    # "field":Ljava/lang/reflect/Field;
    :goto_d6
    const-string v5, "motorola"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11f

    const-string v5, "DROIDX"

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_11f

    .line 152
    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->context:Landroid/content/Context;

    const-string v6, "window"

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/WindowManager;

    .line 154
    .local v4, "windowManager":Landroid/view/WindowManager;
    invoke-interface {v4}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Display;->getOrientation()I

    move-result v5

    if-lez v5, :cond_110

    .line 155
    iget v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    int-to-double v5, v5

    div-double/2addr v5, v11

    double-to-float v5, v5

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->xdpi:F

    .line 156
    iget v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    int-to-double v5, v5

    div-double/2addr v5, v9

    double-to-float v5, v5

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->ydpi:F

    .line 169
    .end local v4    # "windowManager":Landroid/view/WindowManager;
    :cond_10a
    :goto_10a
    const v5, 0x40228f5c    # 2.54f

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->maxLength:F

    .line 170
    return-void

    .line 158
    .restart local v4    # "windowManager":Landroid/view/WindowManager;
    :cond_110
    iget v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    int-to-double v5, v5

    div-double/2addr v5, v9

    double-to-float v5, v5

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->xdpi:F

    .line 159
    iget v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    int-to-double v5, v5

    div-double/2addr v5, v11

    double-to-float v5, v5

    iput v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->ydpi:F

    goto :goto_10a

    .line 162
    .end local v4    # "windowManager":Landroid/view/WindowManager;
    :cond_11f
    const-string v5, "motorola"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10a

    const-string v5, "Droid"

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_10a

    .line 164
    iput v13, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->xdpi:F

    .line 165
    iput v13, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->ydpi:F

    goto :goto_10a

    .line 146
    :catch_136
    move-exception v5

    goto :goto_d6
.end method

.method private adjustScaleBarLength(D)D
    .registers 10
    .param p1, "length"    # D

    .prologue
    .line 610
    const-wide/16 v1, 0x0

    .line 611
    .local v1, "pow":J
    const/4 v0, 0x0

    .line 612
    .local v0, "feet":Z
    iget-object v3, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->unitsOfMeasure:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    sget-object v4, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->imperial:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    if-ne v3, v4, :cond_2d

    .line 613
    const-wide v3, 0x40741de69ad42c3dL    # 321.8688

    cmpl-double v3, p1, v3

    if-ltz v3, :cond_25

    .line 614
    const-wide v3, 0x409925604189374cL    # 1609.344

    div-double/2addr p1, v3

    .line 628
    :cond_18
    :goto_18
    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    cmpl-double v3, p1, v3

    if-ltz v3, :cond_4b

    .line 629
    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    .line 630
    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    div-double/2addr p1, v3

    goto :goto_18

    .line 616
    :cond_25
    const-wide v3, 0x400a3f28fd4f4b98L    # 3.2808399

    mul-double/2addr p1, v3

    .line 617
    const/4 v0, 0x1

    goto :goto_18

    .line 619
    :cond_2d
    iget-object v3, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->unitsOfMeasure:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    sget-object v4, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->nautical:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    if-ne v3, v4, :cond_18

    .line 620
    const-wide v3, 0x4077266666666666L    # 370.4

    cmpl-double v3, p1, v3

    if-ltz v3, :cond_43

    .line 621
    const-wide v3, 0x409cf00000000000L    # 1852.0

    div-double/2addr p1, v3

    goto :goto_18

    .line 623
    :cond_43
    const-wide v3, 0x400a3f28fd4f4b98L    # 3.2808399

    mul-double/2addr p1, v3

    .line 624
    const/4 v0, 0x1

    goto :goto_18

    .line 632
    :cond_4b
    :goto_4b
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    cmpg-double v3, p1, v3

    if-gez v3, :cond_5e

    const-wide/16 v3, 0x0

    cmpl-double v3, p1, v3

    if-lez v3, :cond_5e

    .line 633
    const-wide/16 v3, 0x1

    sub-long/2addr v1, v3

    .line 634
    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    mul-double/2addr p1, v3

    goto :goto_4b

    .line 637
    :cond_5e
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    cmpg-double v3, p1, v3

    if-gez v3, :cond_77

    .line 638
    const-wide/high16 p1, 0x3ff0000000000000L    # 1.0

    .line 644
    :goto_66
    if-eqz v0, :cond_83

    .line 645
    const-wide v3, 0x400a3f28fd4f4b98L    # 3.2808399

    div-double/2addr p1, v3

    .line 650
    :cond_6e
    :goto_6e
    const-wide/high16 v3, 0x4024000000000000L    # 10.0

    long-to-double v5, v1

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v3

    mul-double/2addr p1, v3

    .line 651
    return-wide p1

    .line 639
    :cond_77
    const-wide/high16 v3, 0x4014000000000000L    # 5.0

    cmpg-double v3, p1, v3

    if-gez v3, :cond_80

    .line 640
    const-wide/high16 p1, 0x4000000000000000L    # 2.0

    goto :goto_66

    .line 642
    :cond_80
    const-wide/high16 p1, 0x4014000000000000L    # 5.0

    goto :goto_66

    .line 646
    :cond_83
    iget-object v3, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->unitsOfMeasure:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    sget-object v4, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->imperial:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    if-ne v3, v4, :cond_90

    .line 647
    const-wide v3, 0x409925604189374cL    # 1609.344

    mul-double/2addr p1, v3

    goto :goto_6e

    .line 648
    :cond_90
    iget-object v3, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->unitsOfMeasure:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    sget-object v4, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->nautical:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    if-ne v3, v4, :cond_6e

    .line 649
    const-wide v3, 0x409cf00000000000L    # 1852.0

    mul-double/2addr p1, v3

    goto :goto_6e
.end method

.method private drawLatitudeText(Landroid/graphics/Canvas;Lorg/osmdroid/views/Projection;)V
    .registers 20
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "projection"    # Lorg/osmdroid/views/Projection;

    .prologue
    .line 440
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->xdpi:F

    float-to-double v13, v13

    const-wide v15, 0x400451eb851eb852L    # 2.54

    div-double/2addr v13, v15

    double-to-int v11, v13

    .line 443
    .local v11, "xdpcm":I
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->maxLength:F

    int-to-float v14, v11

    mul-float/2addr v13, v14

    float-to-int v5, v13

    .line 446
    .local v5, "xLen":I
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    div-int/lit8 v13, v13, 0x2

    div-int/lit8 v14, v5, 0x2

    sub-int/2addr v13, v14

    move-object/from16 v0, p0

    iget v14, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->yOffset:I

    const/4 v15, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14, v15}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v1

    .line 447
    .local v1, "p1":Lorg/osmdroid/api/IGeoPoint;
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    div-int/lit8 v13, v13, 0x2

    div-int/lit8 v14, v5, 0x2

    add-int/2addr v13, v14

    move-object/from16 v0, p0

    iget v14, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->yOffset:I

    const/4 v15, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14, v15}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v2

    .line 450
    .local v2, "p2":Lorg/osmdroid/api/IGeoPoint;
    check-cast v1, Lorg/osmdroid/util/GeoPoint;

    .end local v1    # "p1":Lorg/osmdroid/api/IGeoPoint;
    invoke-virtual {v1, v2}, Lorg/osmdroid/util/GeoPoint;->distanceTo(Lorg/osmdroid/api/IGeoPoint;)I

    move-result v6

    .line 452
    .local v6, "xMeters":I
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustLength:Z

    if-eqz v13, :cond_a6

    int-to-double v13, v6

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustScaleBarLength(D)D

    move-result-wide v7

    .line 454
    .local v7, "xMetersAdjusted":D
    :goto_4e
    int-to-double v13, v5

    mul-double/2addr v13, v7

    int-to-double v15, v6

    div-double/2addr v13, v15

    double-to-int v4, v13

    .line 457
    .local v4, "xBarLengthPixels":I
    double-to-int v13, v7

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->scaleBarLengthText(I)Ljava/lang/String;

    move-result-object v9

    .line 458
    .local v9, "xMsg":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    const/4 v14, 0x0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v15

    sget-object v16, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->sTextBoundsRect:Landroid/graphics/Rect;

    move-object/from16 v0, v16

    invoke-virtual {v13, v9, v14, v15, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 459
    sget-object v13, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->sTextBoundsRect:Landroid/graphics/Rect;

    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v13

    int-to-double v13, v13

    const-wide/high16 v15, 0x4014000000000000L    # 5.0

    div-double/2addr v13, v15

    double-to-int v10, v13

    .line 461
    .local v10, "xTextSpacing":I
    div-int/lit8 v13, v4, 0x2

    sget-object v14, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->sTextBoundsRect:Landroid/graphics/Rect;

    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v14

    div-int/lit8 v14, v14, 0x2

    sub-int/2addr v13, v14

    int-to-float v3, v13

    .line 462
    .local v3, "x":F
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignRight:Z

    if-eqz v13, :cond_8e

    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    sub-int/2addr v13, v4

    int-to-float v13, v13

    add-float/2addr v3, v13

    .line 464
    :cond_8e
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignBottom:Z

    if-eqz v13, :cond_a8

    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    mul-int/lit8 v14, v10, 0x2

    sub-int/2addr v13, v14

    int-to-float v12, v13

    .line 466
    .local v12, "y":F
    :goto_9c
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v9, v3, v12, v13}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 467
    return-void

    .line 452
    .end local v3    # "x":F
    .end local v4    # "xBarLengthPixels":I
    .end local v7    # "xMetersAdjusted":D
    .end local v9    # "xMsg":Ljava/lang/String;
    .end local v10    # "xTextSpacing":I
    .end local v12    # "y":F
    :cond_a6
    int-to-double v7, v6

    goto :goto_4e

    .line 465
    .restart local v3    # "x":F
    .restart local v4    # "xBarLengthPixels":I
    .restart local v7    # "xMetersAdjusted":D
    .restart local v9    # "xMsg":Ljava/lang/String;
    .restart local v10    # "xTextSpacing":I
    :cond_a8
    sget-object v13, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->sTextBoundsRect:Landroid/graphics/Rect;

    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v13

    add-int/2addr v13, v10

    int-to-float v12, v13

    .restart local v12    # "y":F
    goto :goto_9c
.end method

.method private drawLongitudeText(Landroid/graphics/Canvas;Lorg/osmdroid/views/Projection;)V
    .registers 20
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "projection"    # Lorg/osmdroid/views/Projection;

    .prologue
    .line 471
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->ydpi:F

    float-to-double v13, v13

    const-wide v15, 0x400451eb851eb852L    # 2.54

    div-double/2addr v13, v15

    double-to-int v12, v13

    .line 474
    .local v12, "ydpcm":I
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->maxLength:F

    int-to-float v14, v12

    mul-float/2addr v13, v14

    float-to-int v6, v13

    .line 477
    .local v6, "yLen":I
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    div-int/lit8 v13, v13, 0x2

    move-object/from16 v0, p0

    iget v14, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    div-int/lit8 v14, v14, 0x2

    div-int/lit8 v15, v6, 0x2

    sub-int/2addr v14, v15

    const/4 v15, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14, v15}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v1

    .line 479
    .local v1, "p1":Lorg/osmdroid/api/IGeoPoint;
    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    div-int/lit8 v13, v13, 0x2

    move-object/from16 v0, p0

    iget v14, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    div-int/lit8 v14, v14, 0x2

    div-int/lit8 v15, v6, 0x2

    add-int/2addr v14, v15

    const/4 v15, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v13, v14, v15}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v2

    .line 483
    .local v2, "p2":Lorg/osmdroid/api/IGeoPoint;
    check-cast v1, Lorg/osmdroid/util/GeoPoint;

    .end local v1    # "p1":Lorg/osmdroid/api/IGeoPoint;
    invoke-virtual {v1, v2}, Lorg/osmdroid/util/GeoPoint;->distanceTo(Lorg/osmdroid/api/IGeoPoint;)I

    move-result v7

    .line 485
    .local v7, "yMeters":I
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustLength:Z

    if-eqz v13, :cond_b7

    int-to-double v13, v7

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustScaleBarLength(D)D

    move-result-wide v8

    .line 487
    .local v8, "yMetersAdjusted":D
    :goto_52
    int-to-double v13, v6

    mul-double/2addr v13, v8

    int-to-double v15, v7

    div-double/2addr v13, v15

    double-to-int v5, v13

    .line 490
    .local v5, "yBarLengthPixels":I
    double-to-int v13, v8

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->scaleBarLengthText(I)Ljava/lang/String;

    move-result-object v10

    .line 491
    .local v10, "yMsg":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    const/4 v14, 0x0

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v15

    sget-object v16, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->sTextBoundsRect:Landroid/graphics/Rect;

    move-object/from16 v0, v16

    invoke-virtual {v13, v10, v14, v15, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 492
    sget-object v13, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->sTextBoundsRect:Landroid/graphics/Rect;

    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v13

    int-to-double v13, v13

    const-wide/high16 v15, 0x4014000000000000L    # 5.0

    div-double/2addr v13, v15

    double-to-int v11, v13

    .line 495
    .local v11, "yTextSpacing":I
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignRight:Z

    if-eqz v13, :cond_b9

    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    mul-int/lit8 v14, v11, 0x2

    sub-int/2addr v13, v14

    int-to-float v3, v13

    .line 497
    .local v3, "x":F
    :goto_87
    div-int/lit8 v13, v5, 0x2

    sget-object v14, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->sTextBoundsRect:Landroid/graphics/Rect;

    invoke-virtual {v14}, Landroid/graphics/Rect;->width()I

    move-result v14

    div-int/lit8 v14, v14, 0x2

    add-int/2addr v13, v14

    int-to-float v4, v13

    .line 498
    .local v4, "y":F
    move-object/from16 v0, p0

    iget-boolean v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignBottom:Z

    if-eqz v13, :cond_a0

    move-object/from16 v0, p0

    iget v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    sub-int/2addr v13, v5

    int-to-float v13, v13

    add-float/2addr v4, v13

    .line 499
    :cond_a0
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 500
    const/high16 v13, -0x3d4c0000    # -90.0f

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v3, v4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 501
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v10, v3, v4, v13}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 502
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 503
    return-void

    .line 485
    .end local v3    # "x":F
    .end local v4    # "y":F
    .end local v5    # "yBarLengthPixels":I
    .end local v8    # "yMetersAdjusted":D
    .end local v10    # "yMsg":Ljava/lang/String;
    .end local v11    # "yTextSpacing":I
    :cond_b7
    int-to-double v8, v7

    goto :goto_52

    .line 496
    .restart local v5    # "yBarLengthPixels":I
    .restart local v8    # "yMetersAdjusted":D
    .restart local v10    # "yMsg":Ljava/lang/String;
    .restart local v11    # "yTextSpacing":I
    :cond_b9
    sget-object v13, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->sTextBoundsRect:Landroid/graphics/Rect;

    invoke-virtual {v13}, Landroid/graphics/Rect;->height()I

    move-result v13

    add-int/2addr v13, v11

    int-to-float v3, v13

    .restart local v3    # "x":F
    goto :goto_87
.end method


# virtual methods
.method public disableScaleBar()V
    .registers 2

    .prologue
    .line 431
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->setEnabled(Z)V

    .line 432
    return-void
.end method

.method protected draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
    .registers 16
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "mapView"    # Lorg/osmdroid/views/MapView;
    .param p3, "shadow"    # Z

    .prologue
    const-wide v3, 0x412e848000000000L    # 1000000.0

    .line 366
    if-eqz p3, :cond_8

    .line 424
    :cond_7
    :goto_7
    return-void

    .line 371
    :cond_8
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->isAnimating()Z

    move-result v0

    if-nez v0, :cond_7

    .line 375
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getZoomLevel()I

    move-result v11

    .line 377
    .local v11, "zoomLevel":I
    iget v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->minZoom:I

    if-lt v11, v0, :cond_7

    .line 378
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v10

    .line 380
    .local v10, "projection":Lorg/osmdroid/views/Projection;
    if-eqz v10, :cond_7

    .line 384
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v0

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    .line 385
    invoke-virtual {p2}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v0

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    .line 386
    iget v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    div-int/lit8 v1, v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v10, v0, v1, v2}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v6

    .line 387
    .local v6, "center":Lorg/osmdroid/api/IGeoPoint;
    iget v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    if-ne v11, v0, :cond_47

    invoke-interface {v6}, Lorg/osmdroid/api/IGeoPoint;->getLatitudeE6()I

    move-result v0

    int-to-double v0, v0

    div-double/2addr v0, v3

    double-to-int v0, v0

    iget v1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastLatitude:F

    float-to-double v1, v1

    div-double/2addr v1, v3

    double-to-int v1, v1

    if-eq v0, v1, :cond_53

    .line 389
    :cond_47
    iput v11, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 390
    invoke-interface {v6}, Lorg/osmdroid/api/IGeoPoint;->getLatitudeE6()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastLatitude:F

    .line 391
    invoke-virtual {p0, v10}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->rebuildBarPath(Lorg/osmdroid/views/Projection;)V

    .line 394
    :cond_53
    iget v8, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->xOffset:I

    .line 395
    .local v8, "offsetX":I
    iget v9, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->yOffset:I

    .line 396
    .local v9, "offsetY":I
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignBottom:Z

    if-eqz v0, :cond_5d

    mul-int/lit8 v9, v9, -0x1

    .line 397
    :cond_5d
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignRight:Z

    if-eqz v0, :cond_63

    mul-int/lit8 v8, v8, -0x1

    .line 398
    :cond_63
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->centred:Z

    if-eqz v0, :cond_75

    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBar:Z

    if-eqz v0, :cond_75

    .line 399
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBarRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    neg-int v0, v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v8, v0

    .line 400
    :cond_75
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->centred:Z

    if-eqz v0, :cond_87

    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBar:Z

    if-eqz v0, :cond_87

    .line 401
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBarRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    neg-int v0, v0

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v9, v0

    .line 403
    :cond_87
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 404
    invoke-virtual {v10}, Lorg/osmdroid/views/Projection;->getInvertedScaleRotateCanvasMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 405
    int-to-float v0, v8

    int-to-float v1, v9

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 407
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBar:Z

    if-eqz v0, :cond_a5

    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->bgPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_a5

    .line 408
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBarRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->bgPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 409
    :cond_a5
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBar:Z

    if-eqz v0, :cond_d2

    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->bgPaint:Landroid/graphics/Paint;

    if-eqz v0, :cond_d2

    .line 411
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBar:Z

    if-eqz v0, :cond_ec

    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBarRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v7

    .line 412
    .local v7, "offsetTop":I
    :goto_b7
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBarRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v0

    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBarRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, v7

    int-to-float v2, v0

    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBarRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBarRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v5, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->bgPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 415
    .end local v7    # "offsetTop":I
    :cond_d2
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    iget-object v1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 416
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBar:Z

    if-eqz v0, :cond_e0

    .line 417
    invoke-direct {p0, p1, v10}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->drawLatitudeText(Landroid/graphics/Canvas;Lorg/osmdroid/views/Projection;)V

    .line 419
    :cond_e0
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBar:Z

    if-eqz v0, :cond_e7

    .line 420
    invoke-direct {p0, p1, v10}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->drawLongitudeText(Landroid/graphics/Canvas;Lorg/osmdroid/views/Projection;)V

    .line 422
    :cond_e7
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto/16 :goto_7

    .line 411
    :cond_ec
    const/4 v7, 0x0

    goto :goto_b7
.end method

.method public drawLatitudeScale(Z)V
    .registers 3
    .param p1, "latitude"    # Z

    .prologue
    .line 241
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBar:Z

    .line 242
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 243
    return-void
.end method

.method public drawLongitudeScale(Z)V
    .registers 3
    .param p1, "longitude"    # Z

    .prologue
    .line 251
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBar:Z

    .line 252
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 253
    return-void
.end method

.method public enableScaleBar()V
    .registers 2

    .prologue
    .line 435
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->setEnabled(Z)V

    .line 436
    return-void
.end method

.method public getBarPaint()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 286
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public getTextPaint()Landroid/graphics/Paint;
    .registers 2

    .prologue
    .line 309
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    return-object v0
.end method

.method public getUnitsOfMeasure()Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;
    .registers 2

    .prologue
    .line 232
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->unitsOfMeasure:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    return-object v0
.end method

.method protected rebuildBarPath(Lorg/osmdroid/views/Projection;)V
    .registers 37
    .param p1, "projection"    # Lorg/osmdroid/views/Projection;

    .prologue
    .line 510
    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->xdpi:F

    move/from16 v31, v0

    move/from16 v0, v31

    float-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x400451eb851eb852L    # 2.54

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    double-to-int v0, v0

    move/from16 v20, v0

    .line 511
    .local v20, "xdpcm":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->ydpi:F

    move/from16 v31, v0

    move/from16 v0, v31

    float-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide v33, 0x400451eb851eb852L    # 2.54

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    double-to-int v0, v0

    move/from16 v30, v0

    .line 514
    .local v30, "ydpcm":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->maxLength:F

    move/from16 v31, v0

    move/from16 v0, v20

    int-to-float v0, v0

    move/from16 v32, v0

    mul-float v31, v31, v32

    move/from16 v0, v31

    float-to-int v12, v0

    .line 515
    .local v12, "xLen":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->maxLength:F

    move/from16 v31, v0

    move/from16 v0, v30

    int-to-float v0, v0

    move/from16 v32, v0

    mul-float v31, v31, v32

    move/from16 v0, v31

    float-to-int v0, v0

    move/from16 v22, v0

    .line 518
    .local v22, "yLen":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    move/from16 v31, v0

    div-int/lit8 v31, v31, 0x2

    div-int/lit8 v32, v12, 0x2

    sub-int v31, v31, v32

    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->yOffset:I

    move/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v31

    move/from16 v2, v32

    move-object/from16 v3, v33

    invoke-virtual {v0, v1, v2, v3}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v9

    .line 519
    .local v9, "p1":Lorg/osmdroid/api/IGeoPoint;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    move/from16 v31, v0

    div-int/lit8 v31, v31, 0x2

    div-int/lit8 v32, v12, 0x2

    add-int v31, v31, v32

    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->yOffset:I

    move/from16 v32, v0

    const/16 v33, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v31

    move/from16 v2, v32

    move-object/from16 v3, v33

    invoke-virtual {v0, v1, v2, v3}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v10

    .line 522
    .local v10, "p2":Lorg/osmdroid/api/IGeoPoint;
    check-cast v9, Lorg/osmdroid/util/GeoPoint;

    .end local v9    # "p1":Lorg/osmdroid/api/IGeoPoint;
    invoke-virtual {v9, v10}, Lorg/osmdroid/util/GeoPoint;->distanceTo(Lorg/osmdroid/api/IGeoPoint;)I

    move-result v13

    .line 524
    .local v13, "xMeters":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustLength:Z

    move/from16 v31, v0

    if-eqz v31, :cond_2c5

    int-to-double v0, v13

    move-wide/from16 v31, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v31

    invoke-direct {v0, v1, v2}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustScaleBarLength(D)D

    move-result-wide v14

    .line 526
    .local v14, "xMetersAdjusted":D
    :goto_a9
    int-to-double v0, v12

    move-wide/from16 v31, v0

    mul-double v31, v31, v14

    int-to-double v0, v13

    move-wide/from16 v33, v0

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    double-to-int v11, v0

    .line 529
    .local v11, "xBarLengthPixels":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    move/from16 v31, v0

    div-int/lit8 v31, v31, 0x2

    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    move/from16 v32, v0

    div-int/lit8 v32, v32, 0x2

    div-int/lit8 v33, v22, 0x2

    sub-int v32, v32, v33

    const/16 v33, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v31

    move/from16 v2, v32

    move-object/from16 v3, v33

    invoke-virtual {v0, v1, v2, v3}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v9

    .line 530
    .restart local v9    # "p1":Lorg/osmdroid/api/IGeoPoint;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenWidth:I

    move/from16 v31, v0

    div-int/lit8 v31, v31, 0x2

    move-object/from16 v0, p0

    iget v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->screenHeight:I

    move/from16 v32, v0

    div-int/lit8 v32, v32, 0x2

    div-int/lit8 v33, v22, 0x2

    add-int v32, v32, v33

    const/16 v33, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v31

    move/from16 v2, v32

    move-object/from16 v3, v33

    invoke-virtual {v0, v1, v2, v3}, Lorg/osmdroid/views/Projection;->fromPixels(IILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/api/IGeoPoint;

    move-result-object v10

    .line 533
    check-cast v9, Lorg/osmdroid/util/GeoPoint;

    .end local v9    # "p1":Lorg/osmdroid/api/IGeoPoint;
    invoke-virtual {v9, v10}, Lorg/osmdroid/util/GeoPoint;->distanceTo(Lorg/osmdroid/api/IGeoPoint;)I

    move-result v23

    .line 535
    .local v23, "yMeters":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustLength:Z

    move/from16 v31, v0

    if-eqz v31, :cond_2c8

    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v31, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v31

    invoke-direct {v0, v1, v2}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustScaleBarLength(D)D

    move-result-wide v24

    .line 537
    .local v24, "yMetersAdjusted":D
    :goto_115
    move/from16 v0, v22

    int-to-double v0, v0

    move-wide/from16 v31, v0

    mul-double v31, v31, v24

    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v33, v0

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    double-to-int v0, v0

    move/from16 v21, v0

    .line 540
    .local v21, "yBarLengthPixels":I
    double-to-int v0, v14

    move/from16 v31, v0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->scaleBarLengthText(I)Ljava/lang/String;

    move-result-object v16

    .line 541
    .local v16, "xMsg":Ljava/lang/String;
    new-instance v18, Landroid/graphics/Rect;

    invoke-direct/range {v18 .. v18}, Landroid/graphics/Rect;-><init>()V

    .line 542
    .local v18, "xTextRect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v33

    move-object/from16 v0, v31

    move-object/from16 v1, v16

    move/from16 v2, v32

    move/from16 v3, v33

    move-object/from16 v4, v18

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 543
    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Rect;->height()I

    move-result v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide/high16 v33, 0x4014000000000000L    # 5.0

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    double-to-int v0, v0

    move/from16 v19, v0

    .line 546
    .local v19, "xTextSpacing":I
    move-wide/from16 v0, v24

    double-to-int v0, v0

    move/from16 v31, v0

    move-object/from16 v0, p0

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->scaleBarLengthText(I)Ljava/lang/String;

    move-result-object v26

    .line 547
    .local v26, "yMsg":Ljava/lang/String;
    new-instance v28, Landroid/graphics/Rect;

    invoke-direct/range {v28 .. v28}, Landroid/graphics/Rect;-><init>()V

    .line 548
    .local v28, "yTextRect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    invoke-virtual/range {v26 .. v26}, Ljava/lang/String;->length()I

    move-result v33

    move-object/from16 v0, v31

    move-object/from16 v1, v26

    move/from16 v2, v32

    move/from16 v3, v33

    move-object/from16 v4, v28

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 549
    invoke-virtual/range {v28 .. v28}, Landroid/graphics/Rect;->height()I

    move-result v31

    move/from16 v0, v31

    int-to-double v0, v0

    move-wide/from16 v31, v0

    const-wide/high16 v33, 0x4014000000000000L    # 5.0

    div-double v31, v31, v33

    move-wide/from16 v0, v31

    double-to-int v0, v0

    move/from16 v29, v0

    .line 550
    .local v29, "yTextSpacing":I
    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Rect;->height()I

    move-result v17

    .line 551
    .local v17, "xTextHeight":I
    invoke-virtual/range {v28 .. v28}, Landroid/graphics/Rect;->height()I

    move-result v27

    .line 553
    .local v27, "yTextHeight":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Landroid/graphics/Path;->rewind()V

    .line 556
    const/4 v5, 0x0

    .line 557
    .local v5, "barOriginX":I
    const/4 v6, 0x0

    .line 558
    .local v6, "barOriginY":I
    move v7, v11

    .line 559
    .local v7, "barToX":I
    move/from16 v8, v21

    .line 560
    .local v8, "barToY":I
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignBottom:Z

    move/from16 v31, v0

    if-eqz v31, :cond_1ce

    .line 561
    mul-int/lit8 v19, v19, -0x1

    .line 562
    mul-int/lit8 v17, v17, -0x1

    .line 563
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/osmdroid/views/MapView;->getHeight()I

    move-result v6

    .line 564
    sub-int v8, v6, v21

    .line 567
    :cond_1ce
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignRight:Z

    move/from16 v31, v0

    if-eqz v31, :cond_1e6

    .line 568
    mul-int/lit8 v29, v29, -0x1

    .line 569
    mul-int/lit8 v27, v27, -0x1

    .line 570
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->mMapView:Lorg/osmdroid/views/MapView;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/osmdroid/views/MapView;->getWidth()I

    move-result v5

    .line 571
    sub-int v7, v5, v11

    .line 574
    :cond_1e6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBar:Z

    move/from16 v31, v0

    if-eqz v31, :cond_255

    .line 576
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    move-object/from16 v31, v0

    int-to-float v0, v7

    move/from16 v32, v0

    add-int v33, v6, v17

    mul-int/lit8 v34, v19, 0x2

    add-int v33, v33, v34

    move/from16 v0, v33

    int-to-float v0, v0

    move/from16 v33, v0

    invoke-virtual/range {v31 .. v33}, Landroid/graphics/Path;->moveTo(FF)V

    .line 577
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    move-object/from16 v31, v0

    int-to-float v0, v7

    move/from16 v32, v0

    int-to-float v0, v6

    move/from16 v33, v0

    invoke-virtual/range {v31 .. v33}, Landroid/graphics/Path;->lineTo(FF)V

    .line 578
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    move-object/from16 v31, v0

    int-to-float v0, v5

    move/from16 v32, v0

    int-to-float v0, v6

    move/from16 v33, v0

    invoke-virtual/range {v31 .. v33}, Landroid/graphics/Path;->lineTo(FF)V

    .line 580
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBar:Z

    move/from16 v31, v0

    if-nez v31, :cond_242

    .line 581
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    move-object/from16 v31, v0

    int-to-float v0, v5

    move/from16 v32, v0

    add-int v33, v6, v17

    mul-int/lit8 v34, v19, 0x2

    add-int v33, v33, v34

    move/from16 v0, v33

    int-to-float v0, v0

    move/from16 v33, v0

    invoke-virtual/range {v31 .. v33}, Landroid/graphics/Path;->lineTo(FF)V

    .line 583
    :cond_242
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBarRect:Landroid/graphics/Rect;

    move-object/from16 v31, v0

    add-int v32, v6, v17

    mul-int/lit8 v33, v19, 0x2

    add-int v32, v32, v33

    move-object/from16 v0, v31

    move/from16 v1, v32

    invoke-virtual {v0, v5, v6, v7, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 586
    :cond_255
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBar:Z

    move/from16 v31, v0

    if-eqz v31, :cond_2c4

    .line 588
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->latitudeBar:Z

    move/from16 v31, v0

    if-nez v31, :cond_28b

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    move-object/from16 v31, v0

    add-int v32, v5, v27

    mul-int/lit8 v33, v29, 0x2

    add-int v32, v32, v33

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    int-to-float v0, v6

    move/from16 v33, v0

    invoke-virtual/range {v31 .. v33}, Landroid/graphics/Path;->moveTo(FF)V

    .line 590
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    move-object/from16 v31, v0

    int-to-float v0, v5

    move/from16 v32, v0

    int-to-float v0, v6

    move/from16 v33, v0

    invoke-virtual/range {v31 .. v33}, Landroid/graphics/Path;->lineTo(FF)V

    .line 593
    :cond_28b
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    move-object/from16 v31, v0

    int-to-float v0, v5

    move/from16 v32, v0

    int-to-float v0, v8

    move/from16 v33, v0

    invoke-virtual/range {v31 .. v33}, Landroid/graphics/Path;->lineTo(FF)V

    .line 594
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPath:Landroid/graphics/Path;

    move-object/from16 v31, v0

    add-int v32, v5, v27

    mul-int/lit8 v33, v29, 0x2

    add-int v32, v32, v33

    move/from16 v0, v32

    int-to-float v0, v0

    move/from16 v32, v0

    int-to-float v0, v8

    move/from16 v33, v0

    invoke-virtual/range {v31 .. v33}, Landroid/graphics/Path;->lineTo(FF)V

    .line 596
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->longitudeBarRect:Landroid/graphics/Rect;

    move-object/from16 v31, v0

    add-int v32, v5, v27

    mul-int/lit8 v33, v29, 0x2

    add-int v32, v32, v33

    move-object/from16 v0, v31

    move/from16 v1, v32

    invoke-virtual {v0, v5, v6, v1, v8}, Landroid/graphics/Rect;->set(IIII)V

    .line 598
    :cond_2c4
    return-void

    .line 524
    .end local v5    # "barOriginX":I
    .end local v6    # "barOriginY":I
    .end local v7    # "barToX":I
    .end local v8    # "barToY":I
    .end local v11    # "xBarLengthPixels":I
    .end local v14    # "xMetersAdjusted":D
    .end local v16    # "xMsg":Ljava/lang/String;
    .end local v17    # "xTextHeight":I
    .end local v18    # "xTextRect":Landroid/graphics/Rect;
    .end local v19    # "xTextSpacing":I
    .end local v21    # "yBarLengthPixels":I
    .end local v23    # "yMeters":I
    .end local v24    # "yMetersAdjusted":D
    .end local v26    # "yMsg":Ljava/lang/String;
    .end local v27    # "yTextHeight":I
    .end local v28    # "yTextRect":Landroid/graphics/Rect;
    .end local v29    # "yTextSpacing":I
    :cond_2c5
    int-to-double v14, v13

    goto/16 :goto_a9

    .line 535
    .restart local v11    # "xBarLengthPixels":I
    .restart local v14    # "xMetersAdjusted":D
    .restart local v23    # "yMeters":I
    :cond_2c8
    move/from16 v0, v23

    int-to-double v0, v0

    move-wide/from16 v24, v0

    goto/16 :goto_115
.end method

.method protected scaleBarLengthText(I)Ljava/lang/String;
    .registers 12
    .param p1, "meters"    # I

    .prologue
    const-wide v5, 0x400a3f28fd4f4b98L    # 3.2808399

    const-wide/high16 v8, 0x4024000000000000L    # 10.0

    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 655
    sget-object v0, Lorg/osmdroid/views/overlay/ScaleBarOverlay$1;->$SwitchMap$org$osmdroid$views$overlay$ScaleBarOverlay$UnitsOfMeasure:[I

    iget-object v1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->unitsOfMeasure:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    invoke-virtual {v1}, Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_116

    .line 658
    const/16 v0, 0x1388

    if-lt p1, v0, :cond_2d

    .line 659
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_kilometers:Lorg/osmdroid/ResourceProxy$string;

    new-array v2, v4, [Ljava/lang/Object;

    div-int/lit16 v3, p1, 0x3e8

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 687
    :goto_2c
    return-object v0

    .line 661
    :cond_2d
    const/16 v0, 0xc8

    if-lt p1, v0, :cond_49

    .line 662
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_kilometers:Lorg/osmdroid/ResourceProxy$string;

    new-array v2, v4, [Ljava/lang/Object;

    int-to-double v3, p1

    const-wide/high16 v5, 0x4059000000000000L    # 100.0

    div-double/2addr v3, v5

    double-to-int v3, v3

    int-to-double v3, v3

    div-double/2addr v3, v8

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2c

    .line 665
    :cond_49
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_meters:Lorg/osmdroid/ResourceProxy$string;

    new-array v2, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2c

    .line 668
    :pswitch_5a
    int-to-double v0, p1

    const-wide v2, 0x40bf6eb851eb851fL    # 8046.72

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_7d

    .line 669
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_miles:Lorg/osmdroid/ResourceProxy$string;

    new-array v2, v4, [Ljava/lang/Object;

    int-to-double v3, p1

    const-wide v5, 0x409925604189374cL    # 1609.344

    div-double/2addr v3, v5

    double-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2c

    .line 672
    :cond_7d
    int-to-double v0, p1

    const-wide v2, 0x40741de69ad42c3dL    # 321.8688

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_a2

    .line 673
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_miles:Lorg/osmdroid/ResourceProxy$string;

    new-array v2, v4, [Ljava/lang/Object;

    int-to-double v3, p1

    const-wide v5, 0x40641de69ad42c3dL    # 160.9344

    div-double/2addr v3, v5

    double-to-int v3, v3

    int-to-double v3, v3

    div-double/2addr v3, v8

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2c

    .line 676
    :cond_a2
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_feet:Lorg/osmdroid/ResourceProxy$string;

    new-array v2, v4, [Ljava/lang/Object;

    int-to-double v3, p1

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2c

    .line 680
    :pswitch_b7
    int-to-double v0, p1

    const-wide v2, 0x40c2160000000000L    # 9260.0

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_db

    .line 681
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_nautical_miles:Lorg/osmdroid/ResourceProxy$string;

    new-array v2, v4, [Ljava/lang/Object;

    int-to-double v3, p1

    const-wide v5, 0x409cf00000000000L    # 1852.0

    div-double/2addr v3, v5

    double-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2c

    .line 683
    :cond_db
    int-to-double v0, p1

    const-wide v2, 0x4077266666666666L    # 370.4

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_101

    .line 684
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_nautical_miles:Lorg/osmdroid/ResourceProxy$string;

    new-array v2, v4, [Ljava/lang/Object;

    int-to-double v3, p1

    const-wide v5, 0x4067266666666666L    # 185.2

    div-double/2addr v3, v5

    double-to-int v3, v3

    int-to-double v3, v3

    div-double/2addr v3, v8

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2c

    .line 687
    :cond_101
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->resourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->format_distance_feet:Lorg/osmdroid/ResourceProxy$string;

    new-array v2, v4, [Ljava/lang/Object;

    int-to-double v3, p1

    mul-double/2addr v3, v5

    double-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-interface {v0, v1, v2}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_2c

    .line 655
    :pswitch_data_116
    .packed-switch 0x2
        :pswitch_5a
        :pswitch_b7
    .end packed-switch
.end method

.method public setAlignBottom(Z)V
    .registers 3
    .param p1, "alignBottom"    # Z

    .prologue
    .line 270
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->centred:Z

    .line 271
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignBottom:Z

    .line 272
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 273
    return-void
.end method

.method public setAlignRight(Z)V
    .registers 3
    .param p1, "alignRight"    # Z

    .prologue
    .line 276
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->centred:Z

    .line 277
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignRight:Z

    .line 278
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 279
    return-void
.end method

.method public setBackgroundPaint(Landroid/graphics/Paint;)V
    .registers 3
    .param p1, "pBgPaint"    # Landroid/graphics/Paint;

    .prologue
    .line 333
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->bgPaint:Landroid/graphics/Paint;

    .line 334
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 335
    return-void
.end method

.method public setBarPaint(Landroid/graphics/Paint;)V
    .registers 4
    .param p1, "pBarPaint"    # Landroid/graphics/Paint;

    .prologue
    .line 296
    if-nez p1, :cond_a

    .line 297
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pBarPaint argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 299
    :cond_a
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    .line 300
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 301
    return-void
.end method

.method public setCentred(Z)V
    .registers 5
    .param p1, "centred"    # Z

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 263
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->centred:Z

    .line 264
    if-nez p1, :cond_11

    move v0, v1

    :goto_7
    iput-boolean v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignBottom:Z

    .line 265
    if-nez p1, :cond_13

    :goto_b
    iput-boolean v1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->alignRight:Z

    .line 266
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 267
    return-void

    :cond_11
    move v0, v2

    .line 264
    goto :goto_7

    :cond_13
    move v1, v2

    .line 265
    goto :goto_b
.end method

.method public setEnableAdjustLength(Z)V
    .registers 3
    .param p1, "adjustLength"    # Z

    .prologue
    .line 343
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->adjustLength:Z

    .line 344
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 345
    return-void
.end method

.method public setLineWidth(F)V
    .registers 3
    .param p1, "width"    # F

    .prologue
    .line 207
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->barPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 208
    return-void
.end method

.method public setMaxLength(F)V
    .registers 3
    .param p1, "pMaxLengthInCm"    # F

    .prologue
    .line 356
    iput p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->maxLength:F

    .line 357
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 358
    return-void
.end method

.method public setMinZoom(I)V
    .registers 2
    .param p1, "zoom"    # I

    .prologue
    .line 183
    iput p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->minZoom:I

    .line 184
    return-void
.end method

.method public setScaleBarOffset(II)V
    .registers 3
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 196
    iput p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->xOffset:I

    .line 197
    iput p2, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->yOffset:I

    .line 198
    return-void
.end method

.method public setTextPaint(Landroid/graphics/Paint;)V
    .registers 4
    .param p1, "pTextPaint"    # Landroid/graphics/Paint;

    .prologue
    .line 319
    if-nez p1, :cond_a

    .line 320
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "pTextPaint argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 322
    :cond_a
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    .line 323
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 324
    return-void
.end method

.method public setTextSize(F)V
    .registers 3
    .param p1, "size"    # F

    .prologue
    .line 217
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->textPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 218
    return-void
.end method

.method public setUnitsOfMeasure(Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;)V
    .registers 3
    .param p1, "unitsOfMeasure"    # Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    .prologue
    .line 224
    iput-object p1, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->unitsOfMeasure:Lorg/osmdroid/views/overlay/ScaleBarOverlay$UnitsOfMeasure;

    .line 225
    const/4 v0, -0x1

    iput v0, p0, Lorg/osmdroid/views/overlay/ScaleBarOverlay;->lastZoomLevel:I

    .line 226
    return-void
.end method
