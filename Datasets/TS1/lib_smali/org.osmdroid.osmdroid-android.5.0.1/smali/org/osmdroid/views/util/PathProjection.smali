.class public Lorg/osmdroid/views/util/PathProjection;
.super Ljava/lang/Object;
.source "PathProjection.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toPixels(Lorg/osmdroid/views/Projection;Ljava/util/List;Landroid/graphics/Path;)Landroid/graphics/Path;
    .registers 4
    .param p0, "projection"    # Lorg/osmdroid/views/Projection;
    .param p2, "reuse"    # Landroid/graphics/Path;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/osmdroid/views/Projection;",
            "Ljava/util/List",
            "<+",
            "Lorg/osmdroid/util/GeoPoint;",
            ">;",
            "Landroid/graphics/Path;",
            ")",
            "Landroid/graphics/Path;"
        }
    .end annotation

    .prologue
    .line 19
    .local p1, "in":Ljava/util/List;, "Ljava/util/List<+Lorg/osmdroid/util/GeoPoint;>;"
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Lorg/osmdroid/views/util/PathProjection;->toPixels(Lorg/osmdroid/views/Projection;Ljava/util/List;Landroid/graphics/Path;Z)Landroid/graphics/Path;

    move-result-object v0

    return-object v0
.end method

.method public static toPixels(Lorg/osmdroid/views/Projection;Ljava/util/List;Landroid/graphics/Path;Z)Landroid/graphics/Path;
    .registers 31
    .param p0, "projection"    # Lorg/osmdroid/views/Projection;
    .param p2, "reuse"    # Landroid/graphics/Path;
    .param p3, "doGudermann"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/osmdroid/views/Projection;",
            "Ljava/util/List",
            "<+",
            "Lorg/osmdroid/util/GeoPoint;",
            ">;",
            "Landroid/graphics/Path;",
            "Z)",
            "Landroid/graphics/Path;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 24
    .local p1, "in":Ljava/util/List;, "Ljava/util/List<+Lorg/osmdroid/util/GeoPoint;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_f

    .line 25
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "List of GeoPoints needs to be at least 2."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 28
    :cond_f
    if-eqz p2, :cond_12a

    move-object/from16 v14, p2

    .line 29
    .local v14, "out":Landroid/graphics/Path;
    :goto_13
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v14, v1}, Landroid/graphics/Path;->incReserve(I)V

    .line 31
    const/4 v9, 0x1

    .line 32
    .local v9, "first":Z
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_1f
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_149

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/osmdroid/util/GeoPoint;

    .line 33
    .local v10, "gp":Lorg/osmdroid/util/GeoPoint;
    invoke-virtual {v10}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v1

    int-to-double v1, v1

    const-wide v3, 0x412e848000000000L    # 1000000.0

    div-double/2addr v1, v3

    invoke-virtual {v10}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v3

    int-to-double v3, v3

    const-wide v5, 0x412e848000000000L    # 1000000.0

    div-double/2addr v3, v5

    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/Projection;->getZoomLevel()I

    move-result v5

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lorg/osmdroid/util/TileSystem;->LatLongToPixelXY(DDILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v20

    .line 36
    .local v20, "underGeopointTileCoords":Landroid/graphics/Point;
    move-object/from16 v0, v20

    iget v1, v0, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v20

    iget v2, v0, Landroid/graphics/Point;->y:I

    move-object/from16 v0, v20

    invoke-static {v1, v2, v0}, Lorg/osmdroid/util/TileSystem;->PixelXYToTileXY(IILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 42
    move-object/from16 v0, v20

    iget v1, v0, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v20

    iget v2, v0, Landroid/graphics/Point;->y:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lorg/osmdroid/util/TileSystem;->TileXYToPixelXY(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v24

    .line 44
    .local v24, "upperRight":Landroid/graphics/Point;
    move-object/from16 v0, v20

    iget v1, v0, Landroid/graphics/Point;->x:I

    invoke-static {}, Lorg/osmdroid/util/TileSystem;->getTileSize()I

    move-result v2

    add-int/2addr v1, v2

    move-object/from16 v0, v20

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-static {}, Lorg/osmdroid/util/TileSystem;->getTileSize()I

    move-result v3

    add-int/2addr v2, v3

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lorg/osmdroid/util/TileSystem;->TileXYToPixelXY(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v12

    .line 47
    .local v12, "lowerLeft":Landroid/graphics/Point;
    move-object/from16 v0, v24

    iget v1, v0, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v24

    iget v2, v0, Landroid/graphics/Point;->y:I

    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/Projection;->getZoomLevel()I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v4}, Lorg/osmdroid/util/TileSystem;->PixelXYToLatLong(IIILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/util/GeoPoint;

    move-result-object v13

    .line 49
    .local v13, "neGeoPoint":Lorg/osmdroid/util/GeoPoint;
    iget v1, v12, Landroid/graphics/Point;->x:I

    iget v2, v12, Landroid/graphics/Point;->y:I

    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/Projection;->getZoomLevel()I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v1, v2, v3, v4}, Lorg/osmdroid/util/TileSystem;->PixelXYToLatLong(IIILorg/osmdroid/util/GeoPoint;)Lorg/osmdroid/util/GeoPoint;

    move-result-object v17

    .line 51
    .local v17, "swGeoPoint":Lorg/osmdroid/util/GeoPoint;
    new-instance v7, Lorg/osmdroid/util/BoundingBoxE6;

    invoke-virtual {v13}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v1

    invoke-virtual {v13}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v2

    invoke-virtual/range {v17 .. v17}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v3

    invoke-virtual/range {v17 .. v17}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v4

    invoke-direct {v7, v1, v2, v3, v4}, Lorg/osmdroid/util/BoundingBoxE6;-><init>(IIII)V

    .line 56
    .local v7, "bb":Lorg/osmdroid/util/BoundingBoxE6;
    if-eqz p3, :cond_131

    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/Projection;->getZoomLevel()I

    move-result v1

    const/4 v2, 0x7

    if-ge v1, v2, :cond_131

    .line 57
    invoke-virtual {v10}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v1

    invoke-virtual {v10}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v7, v1, v2, v3}, Lorg/osmdroid/util/BoundingBoxE6;->getRelativePositionOfGeoPointInBoundingBoxWithExactGudermannInterpolation(IILandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v15

    .line 66
    .local v15, "relativePositionInCenterMapTile":Landroid/graphics/PointF;
    :goto_c4
    invoke-virtual/range {p0 .. p0}, Lorg/osmdroid/views/Projection;->getScreenRect()Landroid/graphics/Rect;

    move-result-object v16

    .line 67
    .local v16, "screenRect":Landroid/graphics/Rect;
    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    invoke-virtual/range {v16 .. v16}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lorg/osmdroid/util/TileSystem;->PixelXYToTileXY(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v8

    .line 69
    .local v8, "centerMapTileCoords":Landroid/graphics/Point;
    iget v1, v8, Landroid/graphics/Point;->x:I

    iget v2, v8, Landroid/graphics/Point;->y:I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Lorg/osmdroid/util/TileSystem;->TileXYToPixelXY(IILandroid/graphics/Point;)Landroid/graphics/Point;

    move-result-object v23

    .line 71
    .local v23, "upperLeftCornerOfCenterMapTile":Landroid/graphics/Point;
    iget v1, v8, Landroid/graphics/Point;->x:I

    move-object/from16 v0, v20

    iget v2, v0, Landroid/graphics/Point;->x:I

    sub-int v18, v1, v2

    .line 72
    .local v18, "tileDiffX":I
    iget v1, v8, Landroid/graphics/Point;->y:I

    move-object/from16 v0, v20

    iget v2, v0, Landroid/graphics/Point;->y:I

    sub-int v19, v1, v2

    .line 73
    .local v19, "tileDiffY":I
    move-object/from16 v0, v23

    iget v1, v0, Landroid/graphics/Point;->x:I

    invoke-static {}, Lorg/osmdroid/util/TileSystem;->getTileSize()I

    move-result v2

    mul-int v2, v2, v18

    sub-int v21, v1, v2

    .line 75
    .local v21, "underGeopointTileScreenLeft":I
    move-object/from16 v0, v23

    iget v1, v0, Landroid/graphics/Point;->y:I

    invoke-static {}, Lorg/osmdroid/util/TileSystem;->getTileSize()I

    move-result v2

    mul-int v2, v2, v19

    sub-int v22, v1, v2

    .line 78
    .local v22, "underGeopointTileScreenTop":I
    iget v1, v15, Landroid/graphics/PointF;->x:F

    invoke-static {}, Lorg/osmdroid/util/TileSystem;->getTileSize()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    float-to-int v1, v1

    add-int v25, v21, v1

    .line 80
    .local v25, "x":I
    iget v1, v15, Landroid/graphics/PointF;->y:F

    invoke-static {}, Lorg/osmdroid/util/TileSystem;->getTileSize()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v1, v2

    float-to-int v1, v1

    add-int v26, v22, v1

    .line 84
    .local v26, "y":I
    if-eqz v9, :cond_13f

    .line 85
    move/from16 v0, v25

    int-to-float v1, v0

    move/from16 v0, v26

    int-to-float v2, v0

    invoke-virtual {v14, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 91
    :goto_127
    const/4 v9, 0x0

    .line 92
    goto/16 :goto_1f

    .line 28
    .end local v7    # "bb":Lorg/osmdroid/util/BoundingBoxE6;
    .end local v8    # "centerMapTileCoords":Landroid/graphics/Point;
    .end local v9    # "first":Z
    .end local v10    # "gp":Lorg/osmdroid/util/GeoPoint;
    .end local v11    # "i$":Ljava/util/Iterator;
    .end local v12    # "lowerLeft":Landroid/graphics/Point;
    .end local v13    # "neGeoPoint":Lorg/osmdroid/util/GeoPoint;
    .end local v14    # "out":Landroid/graphics/Path;
    .end local v15    # "relativePositionInCenterMapTile":Landroid/graphics/PointF;
    .end local v16    # "screenRect":Landroid/graphics/Rect;
    .end local v17    # "swGeoPoint":Lorg/osmdroid/util/GeoPoint;
    .end local v18    # "tileDiffX":I
    .end local v19    # "tileDiffY":I
    .end local v20    # "underGeopointTileCoords":Landroid/graphics/Point;
    .end local v21    # "underGeopointTileScreenLeft":I
    .end local v22    # "underGeopointTileScreenTop":I
    .end local v23    # "upperLeftCornerOfCenterMapTile":Landroid/graphics/Point;
    .end local v24    # "upperRight":Landroid/graphics/Point;
    .end local v25    # "x":I
    .end local v26    # "y":I
    :cond_12a
    new-instance v14, Landroid/graphics/Path;

    invoke-direct {v14}, Landroid/graphics/Path;-><init>()V

    goto/16 :goto_13

    .line 61
    .restart local v7    # "bb":Lorg/osmdroid/util/BoundingBoxE6;
    .restart local v9    # "first":Z
    .restart local v10    # "gp":Lorg/osmdroid/util/GeoPoint;
    .restart local v11    # "i$":Ljava/util/Iterator;
    .restart local v12    # "lowerLeft":Landroid/graphics/Point;
    .restart local v13    # "neGeoPoint":Lorg/osmdroid/util/GeoPoint;
    .restart local v14    # "out":Landroid/graphics/Path;
    .restart local v17    # "swGeoPoint":Lorg/osmdroid/util/GeoPoint;
    .restart local v20    # "underGeopointTileCoords":Landroid/graphics/Point;
    .restart local v24    # "upperRight":Landroid/graphics/Point;
    :cond_131
    invoke-virtual {v10}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v1

    invoke-virtual {v10}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v7, v1, v2, v3}, Lorg/osmdroid/util/BoundingBoxE6;->getRelativePositionOfGeoPointInBoundingBoxWithLinearInterpolation(IILandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v15

    .restart local v15    # "relativePositionInCenterMapTile":Landroid/graphics/PointF;
    goto :goto_c4

    .line 89
    .restart local v8    # "centerMapTileCoords":Landroid/graphics/Point;
    .restart local v16    # "screenRect":Landroid/graphics/Rect;
    .restart local v18    # "tileDiffX":I
    .restart local v19    # "tileDiffY":I
    .restart local v21    # "underGeopointTileScreenLeft":I
    .restart local v22    # "underGeopointTileScreenTop":I
    .restart local v23    # "upperLeftCornerOfCenterMapTile":Landroid/graphics/Point;
    .restart local v25    # "x":I
    .restart local v26    # "y":I
    :cond_13f
    move/from16 v0, v25

    int-to-float v1, v0

    move/from16 v0, v26

    int-to-float v2, v0

    invoke-virtual {v14, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_127

    .line 94
    .end local v7    # "bb":Lorg/osmdroid/util/BoundingBoxE6;
    .end local v8    # "centerMapTileCoords":Landroid/graphics/Point;
    .end local v10    # "gp":Lorg/osmdroid/util/GeoPoint;
    .end local v12    # "lowerLeft":Landroid/graphics/Point;
    .end local v13    # "neGeoPoint":Lorg/osmdroid/util/GeoPoint;
    .end local v15    # "relativePositionInCenterMapTile":Landroid/graphics/PointF;
    .end local v16    # "screenRect":Landroid/graphics/Rect;
    .end local v17    # "swGeoPoint":Lorg/osmdroid/util/GeoPoint;
    .end local v18    # "tileDiffX":I
    .end local v19    # "tileDiffY":I
    .end local v20    # "underGeopointTileCoords":Landroid/graphics/Point;
    .end local v21    # "underGeopointTileScreenLeft":I
    .end local v22    # "underGeopointTileScreenTop":I
    .end local v23    # "upperLeftCornerOfCenterMapTile":Landroid/graphics/Point;
    .end local v24    # "upperRight":Landroid/graphics/Point;
    .end local v25    # "x":I
    .end local v26    # "y":I
    :cond_149
    return-object v14
.end method
