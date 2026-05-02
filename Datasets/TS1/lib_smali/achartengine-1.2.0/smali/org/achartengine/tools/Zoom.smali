.class public Lorg/achartengine/tools/Zoom;
.super Lorg/achartengine/tools/AbstractTool;
.source "Zoom.java"


# static fields
.field public static final ZOOM_AXIS_X:I = 0x1

.field public static final ZOOM_AXIS_XY:I = 0x0

.field public static final ZOOM_AXIS_Y:I = 0x2


# instance fields
.field private limitsReachedX:Z

.field private limitsReachedY:Z

.field private mZoomIn:Z

.field private mZoomListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/achartengine/tools/ZoomListener;",
            ">;"
        }
    .end annotation
.end field

.field private mZoomRate:F


# direct methods
.method public constructor <init>(Lorg/achartengine/chart/AbstractChart;ZF)V
    .registers 6
    .param p1, "chart"    # Lorg/achartengine/chart/AbstractChart;
    .param p2, "in"    # Z
    .param p3, "rate"    # F

    .prologue
    const/4 v1, 0x0

    .line 56
    invoke-direct {p0, p1}, Lorg/achartengine/tools/AbstractTool;-><init>(Lorg/achartengine/chart/AbstractChart;)V

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    .line 37
    iput-boolean v1, p0, Lorg/achartengine/tools/Zoom;->limitsReachedX:Z

    .line 39
    iput-boolean v1, p0, Lorg/achartengine/tools/Zoom;->limitsReachedY:Z

    .line 57
    iput-boolean p2, p0, Lorg/achartengine/tools/Zoom;->mZoomIn:Z

    .line 58
    invoke-virtual {p0, p3}, Lorg/achartengine/tools/Zoom;->setZoomRate(F)V

    .line 59
    return-void
.end method

.method private declared-synchronized notifyZoomListeners(Lorg/achartengine/tools/ZoomEvent;)V
    .registers 5
    .param p1, "e"    # Lorg/achartengine/tools/ZoomEvent;

    .prologue
    .line 162
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/achartengine/tools/ZoomListener;

    .line 163
    .local v1, "listener":Lorg/achartengine/tools/ZoomListener;
    invoke-interface {v1, p1}, Lorg/achartengine/tools/ZoomListener;->zoomApplied(Lorg/achartengine/tools/ZoomEvent;)V
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_17

    goto :goto_7

    .line 162
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/achartengine/tools/ZoomListener;
    :catchall_17
    move-exception v2

    monitor-exit p0

    throw v2

    .line 165
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_1a
    monitor-exit p0

    return-void
.end method


# virtual methods
.method public declared-synchronized addZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;

    .prologue
    .line 182
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 183
    monitor-exit p0

    return-void

    .line 182
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public apply(I)V
    .registers 40
    .param p1, "zoom_axis"    # I

    .prologue
    .line 74
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mChart:Lorg/achartengine/chart/AbstractChart;

    instance-of v4, v4, Lorg/achartengine/chart/XYChart;

    if-eqz v4, :cond_1d1

    .line 75
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getScalesCount()I

    move-result v31

    .line 76
    .local v31, "scales":I
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_11
    move/from16 v0, v31

    if-ge v9, v0, :cond_1ef

    .line 77
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/achartengine/tools/Zoom;->getRange(I)[D

    move-result-object v29

    .line 78
    .local v29, "range":[D
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1, v9}, Lorg/achartengine/tools/Zoom;->checkRange([DI)V

    .line 79
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomLimits()[D

    move-result-object v20

    .line 81
    .local v20, "limits":[D
    const/4 v4, 0x0

    aget-wide v32, v29, v4

    const/4 v4, 0x1

    aget-wide v34, v29, v4

    add-double v32, v32, v34

    const-wide/high16 v34, 0x4000000000000000L    # 2.0

    div-double v16, v32, v34

    .line 82
    .local v16, "centerX":D
    const/4 v4, 0x2

    aget-wide v32, v29, v4

    const/4 v4, 0x3

    aget-wide v34, v29, v4

    add-double v32, v32, v34

    const-wide/high16 v34, 0x4000000000000000L    # 2.0

    div-double v18, v32, v34

    .line 83
    .local v18, "centerY":D
    const/4 v4, 0x1

    aget-wide v32, v29, v4

    const/4 v4, 0x0

    aget-wide v34, v29, v4

    sub-double v27, v32, v34

    .line 84
    .local v27, "newWidth":D
    const/4 v4, 0x3

    aget-wide v32, v29, v4

    const/4 v4, 0x2

    aget-wide v34, v29, v4

    sub-double v25, v32, v34

    .line 85
    .local v25, "newHeight":D
    const-wide/high16 v32, 0x4000000000000000L    # 2.0

    div-double v32, v27, v32

    sub-double v5, v16, v32

    .line 86
    .local v5, "newXMin":D
    const-wide/high16 v32, 0x4000000000000000L    # 2.0

    div-double v32, v27, v32

    add-double v7, v16, v32

    .line 87
    .local v7, "newXMax":D
    const-wide/high16 v32, 0x4000000000000000L    # 2.0

    div-double v32, v25, v32

    sub-double v11, v18, v32

    .line 88
    .local v11, "newYMin":D
    const-wide/high16 v32, 0x4000000000000000L    # 2.0

    div-double v32, v25, v32

    add-double v13, v18, v32

    .line 91
    .local v13, "newYMax":D
    if-nez v9, :cond_96

    .line 92
    if-eqz v20, :cond_161

    const/4 v4, 0x0

    aget-wide v32, v20, v4

    cmpg-double v4, v5, v32

    if-lez v4, :cond_7c

    const/4 v4, 0x1

    aget-wide v32, v20, v4

    cmpl-double v4, v7, v32

    if-ltz v4, :cond_161

    :cond_7c
    const/4 v4, 0x1

    :goto_7d
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/achartengine/tools/Zoom;->limitsReachedX:Z

    .line 93
    if-eqz v20, :cond_164

    const/4 v4, 0x2

    aget-wide v32, v20, v4

    cmpg-double v4, v11, v32

    if-lez v4, :cond_91

    const/4 v4, 0x3

    aget-wide v32, v20, v4

    cmpl-double v4, v13, v32

    if-ltz v4, :cond_164

    :cond_91
    const/4 v4, 0x1

    :goto_92
    move-object/from16 v0, p0

    iput-boolean v4, v0, Lorg/achartengine/tools/Zoom;->limitsReachedY:Z

    .line 96
    :cond_96
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/achartengine/tools/Zoom;->mZoomIn:Z

    if-eqz v4, :cond_17d

    .line 97
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomXEnabled()Z

    move-result v4

    if-eqz v4, :cond_bd

    const/4 v4, 0x1

    move/from16 v0, p1

    if-eq v0, v4, :cond_ad

    if-nez p1, :cond_bd

    .line 98
    :cond_ad
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/achartengine/tools/Zoom;->limitsReachedX:Z

    if-eqz v4, :cond_167

    move-object/from16 v0, p0

    iget v4, v0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    const/high16 v10, 0x3f800000    # 1.0f

    cmpg-float v4, v4, v10

    if-gez v4, :cond_167

    .line 105
    :cond_bd
    :goto_bd
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomYEnabled()Z

    move-result v4

    if-eqz v4, :cond_de

    const/4 v4, 0x2

    move/from16 v0, p1

    if-eq v0, v4, :cond_ce

    if-nez p1, :cond_de

    .line 106
    :cond_ce
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/achartengine/tools/Zoom;->limitsReachedY:Z

    if-eqz v4, :cond_172

    move-object/from16 v0, p0

    iget v4, v0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    const/high16 v10, 0x3f800000    # 1.0f

    cmpg-float v4, v4, v10

    if-gez v4, :cond_172

    .line 124
    :cond_de
    :goto_de
    if-eqz v20, :cond_1bf

    .line 125
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomInLimitX()D

    move-result-wide v32

    const/4 v4, 0x1

    aget-wide v34, v20, v4

    const/4 v4, 0x0

    aget-wide v36, v20, v4

    sub-double v34, v34, v36

    invoke-static/range {v32 .. v35}, Ljava/lang/Math;->min(DD)D

    move-result-wide v21

    .line 126
    .local v21, "minX":D
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomInLimitY()D

    move-result-wide v32

    const/4 v4, 0x3

    aget-wide v34, v20, v4

    const/4 v4, 0x2

    aget-wide v36, v20, v4

    sub-double v34, v34, v36

    invoke-static/range {v32 .. v35}, Ljava/lang/Math;->min(DD)D

    move-result-wide v23

    .line 131
    .local v23, "minY":D
    :goto_108
    move-wide/from16 v0, v27

    move-wide/from16 v2, v21

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v27

    .line 132
    move-wide/from16 v0, v25

    move-wide/from16 v2, v23

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(DD)D

    move-result-wide v25

    .line 134
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomXEnabled()Z

    move-result v4

    if-eqz v4, :cond_13a

    const/4 v4, 0x1

    move/from16 v0, p1

    if-eq v0, v4, :cond_129

    if-nez p1, :cond_13a

    .line 135
    :cond_129
    const-wide/high16 v32, 0x4000000000000000L    # 2.0

    div-double v32, v27, v32

    sub-double v5, v16, v32

    .line 136
    const-wide/high16 v32, 0x4000000000000000L    # 2.0

    div-double v32, v27, v32

    add-double v7, v16, v32

    move-object/from16 v4, p0

    .line 137
    invoke-virtual/range {v4 .. v9}, Lorg/achartengine/tools/Zoom;->setXRange(DDI)V

    .line 139
    :cond_13a
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomYEnabled()Z

    move-result v4

    if-eqz v4, :cond_15d

    const/4 v4, 0x2

    move/from16 v0, p1

    if-eq v0, v4, :cond_14b

    if-nez p1, :cond_15d

    .line 140
    :cond_14b
    const-wide/high16 v32, 0x4000000000000000L    # 2.0

    div-double v32, v25, v32

    sub-double v11, v18, v32

    .line 141
    const-wide/high16 v32, 0x4000000000000000L    # 2.0

    div-double v32, v25, v32

    add-double v13, v18, v32

    move-object/from16 v10, p0

    move v15, v9

    .line 142
    invoke-virtual/range {v10 .. v15}, Lorg/achartengine/tools/Zoom;->setYRange(DDI)V

    .line 76
    :cond_15d
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_11

    .line 92
    .end local v21    # "minX":D
    .end local v23    # "minY":D
    :cond_161
    const/4 v4, 0x0

    goto/16 :goto_7d

    .line 93
    :cond_164
    const/4 v4, 0x0

    goto/16 :goto_92

    .line 101
    :cond_167
    move-object/from16 v0, p0

    iget v4, v0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    float-to-double v0, v4

    move-wide/from16 v32, v0

    div-double v27, v27, v32

    goto/16 :goto_bd

    .line 108
    :cond_172
    move-object/from16 v0, p0

    iget v4, v0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    float-to-double v0, v4

    move-wide/from16 v32, v0

    div-double v25, v25, v32

    goto/16 :goto_de

    .line 112
    :cond_17d
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomXEnabled()Z

    move-result v4

    if-eqz v4, :cond_19d

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/achartengine/tools/Zoom;->limitsReachedX:Z

    if-nez v4, :cond_19d

    const/4 v4, 0x1

    move/from16 v0, p1

    if-eq v0, v4, :cond_194

    if-nez p1, :cond_19d

    .line 114
    :cond_194
    move-object/from16 v0, p0

    iget v4, v0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    float-to-double v0, v4

    move-wide/from16 v32, v0

    mul-double v27, v27, v32

    .line 117
    :cond_19d
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->isZoomYEnabled()Z

    move-result v4

    if-eqz v4, :cond_de

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/achartengine/tools/Zoom;->limitsReachedY:Z

    if-nez v4, :cond_de

    const/4 v4, 0x2

    move/from16 v0, p1

    if-eq v0, v4, :cond_1b4

    if-nez p1, :cond_de

    .line 119
    :cond_1b4
    move-object/from16 v0, p0

    iget v4, v0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    float-to-double v0, v4

    move-wide/from16 v32, v0

    mul-double v25, v25, v32

    goto/16 :goto_de

    .line 128
    :cond_1bf
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomInLimitX()D

    move-result-wide v21

    .line 129
    .restart local v21    # "minX":D
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mRenderer:Lorg/achartengine/renderer/XYMultipleSeriesRenderer;

    invoke-virtual {v4}, Lorg/achartengine/renderer/XYMultipleSeriesRenderer;->getZoomInLimitY()D

    move-result-wide v23

    .restart local v23    # "minY":D
    goto/16 :goto_108

    .line 146
    .end local v5    # "newXMin":D
    .end local v7    # "newXMax":D
    .end local v9    # "i":I
    .end local v11    # "newYMin":D
    .end local v13    # "newYMax":D
    .end local v16    # "centerX":D
    .end local v18    # "centerY":D
    .end local v20    # "limits":[D
    .end local v21    # "minX":D
    .end local v23    # "minY":D
    .end local v25    # "newHeight":D
    .end local v27    # "newWidth":D
    .end local v29    # "range":[D
    .end local v31    # "scales":I
    :cond_1d1
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/achartengine/tools/Zoom;->mChart:Lorg/achartengine/chart/AbstractChart;

    check-cast v4, Lorg/achartengine/chart/RoundChart;

    invoke-virtual {v4}, Lorg/achartengine/chart/RoundChart;->getRenderer()Lorg/achartengine/renderer/DefaultRenderer;

    move-result-object v30

    .line 147
    .local v30, "renderer":Lorg/achartengine/renderer/DefaultRenderer;
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/achartengine/tools/Zoom;->mZoomIn:Z

    if-eqz v4, :cond_202

    .line 148
    invoke-virtual/range {v30 .. v30}, Lorg/achartengine/renderer/DefaultRenderer;->getScale()F

    move-result v4

    move-object/from16 v0, p0

    iget v10, v0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    mul-float/2addr v4, v10

    move-object/from16 v0, v30

    invoke-virtual {v0, v4}, Lorg/achartengine/renderer/DefaultRenderer;->setScale(F)V

    .line 153
    .end local v30    # "renderer":Lorg/achartengine/renderer/DefaultRenderer;
    :cond_1ef
    :goto_1ef
    new-instance v4, Lorg/achartengine/tools/ZoomEvent;

    move-object/from16 v0, p0

    iget-boolean v10, v0, Lorg/achartengine/tools/Zoom;->mZoomIn:Z

    move-object/from16 v0, p0

    iget v15, v0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    invoke-direct {v4, v10, v15}, Lorg/achartengine/tools/ZoomEvent;-><init>(ZF)V

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lorg/achartengine/tools/Zoom;->notifyZoomListeners(Lorg/achartengine/tools/ZoomEvent;)V

    .line 154
    return-void

    .line 150
    .restart local v30    # "renderer":Lorg/achartengine/renderer/DefaultRenderer;
    :cond_202
    invoke-virtual/range {v30 .. v30}, Lorg/achartengine/renderer/DefaultRenderer;->getScale()F

    move-result v4

    move-object/from16 v0, p0

    iget v10, v0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    div-float/2addr v4, v10

    move-object/from16 v0, v30

    invoke-virtual {v0, v4}, Lorg/achartengine/renderer/DefaultRenderer;->setScale(F)V

    goto :goto_1ef
.end method

.method public declared-synchronized notifyZoomResetListeners()V
    .registers 4

    .prologue
    .line 171
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/achartengine/tools/ZoomListener;

    .line 172
    .local v1, "listener":Lorg/achartengine/tools/ZoomListener;
    invoke-interface {v1}, Lorg/achartengine/tools/ZoomListener;->zoomReset()V
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_17

    goto :goto_7

    .line 171
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lorg/achartengine/tools/ZoomListener;
    :catchall_17
    move-exception v2

    monitor-exit p0

    throw v2

    .line 174
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_1a
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized removeZoomListener(Lorg/achartengine/tools/ZoomListener;)V
    .registers 3
    .param p1, "listener"    # Lorg/achartengine/tools/ZoomListener;

    .prologue
    .line 191
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/achartengine/tools/Zoom;->mZoomListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 192
    monitor-exit p0

    return-void

    .line 191
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setZoomRate(F)V
    .registers 2
    .param p1, "rate"    # F

    .prologue
    .line 67
    iput p1, p0, Lorg/achartengine/tools/Zoom;->mZoomRate:F

    .line 68
    return-void
.end method
