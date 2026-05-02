.class public Lorg/osmdroid/util/BoundingBoxE6;
.super Ljava/lang/Object;
.source "BoundingBoxE6.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/io/Serializable;
.implements Lorg/osmdroid/views/util/constants/MapViewConstants;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/osmdroid/util/BoundingBoxE6;",
            ">;"
        }
    .end annotation
.end field

.field static final serialVersionUID:J = 0x2L


# instance fields
.field protected final mLatNorthE6:I

.field protected final mLatSouthE6:I

.field protected final mLonEastE6:I

.field protected final mLonWestE6:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 249
    new-instance v0, Lorg/osmdroid/util/BoundingBoxE6$1;

    invoke-direct {v0}, Lorg/osmdroid/util/BoundingBoxE6$1;-><init>()V

    sput-object v0, Lorg/osmdroid/util/BoundingBoxE6;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(DDDD)V
    .registers 13
    .param p1, "north"    # D
    .param p3, "east"    # D
    .param p5, "south"    # D
    .param p7, "west"    # D

    .prologue
    const-wide v2, 0x412e848000000000L    # 1000000.0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    mul-double v0, p1, v2

    double-to-int v0, v0

    iput v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    .line 53
    mul-double v0, p3, v2

    double-to-int v0, v0

    iput v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    .line 54
    mul-double v0, p5, v2

    double-to-int v0, v0

    iput v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    .line 55
    mul-double v0, p7, v2

    double-to-int v0, v0

    iput v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    .line 56
    return-void
.end method

.method public constructor <init>(IIII)V
    .registers 5
    .param p1, "northE6"    # I
    .param p2, "eastE6"    # I
    .param p3, "southE6"    # I
    .param p4, "westE6"    # I

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput p1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    .line 45
    iput p2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    .line 46
    iput p3, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    .line 47
    iput p4, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    .line 48
    return-void
.end method

.method static synthetic access$000(Landroid/os/Parcel;)Lorg/osmdroid/util/BoundingBoxE6;
    .registers 2
    .param p0, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 22
    invoke-static {p0}, Lorg/osmdroid/util/BoundingBoxE6;->readFromParcel(Landroid/os/Parcel;)Lorg/osmdroid/util/BoundingBoxE6;

    move-result-object v0

    return-object v0
.end method

.method public static fromGeoPoints(Ljava/util/ArrayList;)Lorg/osmdroid/util/BoundingBoxE6;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<+",
            "Lorg/osmdroid/util/GeoPoint;",
            ">;)",
            "Lorg/osmdroid/util/BoundingBoxE6;"
        }
    .end annotation

    .prologue
    .line 204
    .local p0, "partialPolyLine":Ljava/util/ArrayList;, "Ljava/util/ArrayList<+Lorg/osmdroid/util/GeoPoint;>;"
    const v6, 0x7fffffff

    .line 205
    .local v6, "minLat":I
    const v7, 0x7fffffff

    .line 206
    .local v7, "minLon":I
    const/high16 v4, -0x80000000

    .line 207
    .local v4, "maxLat":I
    const/high16 v5, -0x80000000

    .line 208
    .local v5, "maxLon":I
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_33

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/util/GeoPoint;

    .line 209
    .local v0, "gp":Lorg/osmdroid/util/GeoPoint;
    invoke-virtual {v0}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v2

    .line 210
    .local v2, "latitudeE6":I
    invoke-virtual {v0}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v3

    .line 212
    .local v3, "longitudeE6":I
    invoke-static {v6, v2}, Ljava/lang/Math;->min(II)I

    move-result v6

    .line 213
    invoke-static {v7, v3}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 214
    invoke-static {v4, v2}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 215
    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 216
    goto :goto_e

    .line 218
    .end local v0    # "gp":Lorg/osmdroid/util/GeoPoint;
    .end local v2    # "latitudeE6":I
    .end local v3    # "longitudeE6":I
    :cond_33
    new-instance v8, Lorg/osmdroid/util/BoundingBoxE6;

    invoke-direct {v8, v4, v5, v6, v7}, Lorg/osmdroid/util/BoundingBoxE6;-><init>(IIII)V

    return-object v8
.end method

.method private static readFromParcel(Landroid/os/Parcel;)Lorg/osmdroid/util/BoundingBoxE6;
    .registers 6
    .param p0, "in"    # Landroid/os/Parcel;

    .prologue
    .line 275
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 276
    .local v0, "latNorthE6":I
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 277
    .local v2, "lonEastE6":I
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 278
    .local v1, "latSouthE6":I
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 279
    .local v3, "lonWestE6":I
    new-instance v4, Lorg/osmdroid/util/BoundingBoxE6;

    invoke-direct {v4, v0, v2, v1, v3}, Lorg/osmdroid/util/BoundingBoxE6;-><init>(IIII)V

    return-object v4
.end method


# virtual methods
.method public bringToBoundingBox(II)Lorg/osmdroid/util/GeoPoint;
    .registers 7
    .param p1, "aLatitudeE6"    # I
    .param p2, "aLongitudeE6"    # I

    .prologue
    .line 199
    new-instance v0, Lorg/osmdroid/util/GeoPoint;

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    iget v2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    iget v3, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    invoke-static {v3, p2}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    return-object v0
.end method

.method public contains(II)Z
    .registers 6
    .param p1, "aLatitudeE6"    # I
    .param p2, "aLongitudeE6"    # I

    .prologue
    const/4 v0, 0x1

    .line 226
    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    if-ge p1, v1, :cond_20

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    if-le p1, v1, :cond_20

    .line 227
    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    iget v2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    if-ge v1, v2, :cond_18

    .line 228
    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    if-ge p2, v1, :cond_20

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    if-le p2, v1, :cond_20

    .line 238
    :cond_17
    :goto_17
    return v0

    .line 233
    :cond_18
    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    if-lt p2, v1, :cond_17

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    if-gt p2, v1, :cond_17

    .line 238
    :cond_20
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public contains(Lorg/osmdroid/api/IGeoPoint;)Z
    .registers 4
    .param p1, "pGeoPoint"    # Lorg/osmdroid/api/IGeoPoint;

    .prologue
    .line 222
    invoke-interface {p1}, Lorg/osmdroid/api/IGeoPoint;->getLatitudeE6()I

    move-result v0

    invoke-interface {p1}, Lorg/osmdroid/api/IGeoPoint;->getLongitudeE6()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/util/BoundingBoxE6;->contains(II)Z

    move-result v0

    return v0
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 263
    const/4 v0, 0x0

    return v0
.end method

.method public getCenter()Lorg/osmdroid/util/GeoPoint;
    .registers 5

    .prologue
    .line 66
    new-instance v0, Lorg/osmdroid/util/GeoPoint;

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    iget v2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    add-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iget v2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    iget v3, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    add-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    return-object v0
.end method

.method public getDiagonalLengthInMeters()I
    .registers 5

    .prologue
    .line 71
    new-instance v0, Lorg/osmdroid/util/GeoPoint;

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    iget v2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    invoke-direct {v0, v1, v2}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    new-instance v1, Lorg/osmdroid/util/GeoPoint;

    iget v2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    iget v3, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    invoke-direct {v1, v2, v3}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    invoke-virtual {v0, v1}, Lorg/osmdroid/util/GeoPoint;->distanceTo(Lorg/osmdroid/api/IGeoPoint;)I

    move-result v0

    return v0
.end method

.method public getGeoPointOfRelativePositionWithExactGudermannInterpolation(FF)Lorg/osmdroid/util/GeoPoint;
    .registers 15
    .param p1, "relX"    # F
    .param p2, "relY"    # F

    .prologue
    .line 151
    iget v8, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    int-to-double v8, v8

    const-wide v10, 0x412e848000000000L    # 1000000.0

    div-double/2addr v8, v10

    invoke-static {v8, v9}, Lorg/osmdroid/util/MyMath;->gudermannInverse(D)D

    move-result-wide v0

    .line 152
    .local v0, "gudNorth":D
    iget v8, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    int-to-double v8, v8

    const-wide v10, 0x412e848000000000L    # 1000000.0

    div-double/2addr v8, v10

    invoke-static {v8, v9}, Lorg/osmdroid/util/MyMath;->gudermannInverse(D)D

    move-result-wide v2

    .line 153
    .local v2, "gudSouth":D
    const/high16 v8, 0x3f800000    # 1.0f

    sub-float/2addr v8, p2

    float-to-double v8, v8

    sub-double v10, v0, v2

    mul-double/2addr v8, v10

    add-double/2addr v8, v2

    invoke-static {v8, v9}, Lorg/osmdroid/util/MyMath;->gudermann(D)D

    move-result-wide v5

    .line 154
    .local v5, "latD":D
    const-wide v8, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v8, v5

    double-to-int v4, v8

    .line 156
    .local v4, "lat":I
    iget v8, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    int-to-float v8, v8

    invoke-virtual {p0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, p1

    add-float/2addr v8, v9

    float-to-int v7, v8

    .line 159
    .local v7, "lon":I
    :goto_38
    const v8, 0x564eba0

    if-le v4, v8, :cond_42

    .line 160
    const v8, 0x564eba0

    sub-int/2addr v4, v8

    goto :goto_38

    .line 161
    :cond_42
    :goto_42
    const v8, -0x564eba0

    if-ge v4, v8, :cond_4c

    .line 162
    const v8, 0x564eba0

    add-int/2addr v4, v8

    goto :goto_42

    .line 165
    :cond_4c
    :goto_4c
    const v8, 0xaba9500

    if-le v7, v8, :cond_56

    .line 166
    const v8, 0xaba9500

    sub-int/2addr v7, v8

    goto :goto_4c

    .line 167
    :cond_56
    :goto_56
    const v8, -0xaba9500

    if-ge v7, v8, :cond_60

    .line 168
    const v8, 0xaba9500

    add-int/2addr v7, v8

    goto :goto_56

    .line 170
    :cond_60
    new-instance v8, Lorg/osmdroid/util/GeoPoint;

    invoke-direct {v8, v4, v7}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    return-object v8
.end method

.method public getGeoPointOfRelativePositionWithLinearInterpolation(FF)Lorg/osmdroid/util/GeoPoint;
    .registers 9
    .param p1, "relX"    # F
    .param p2, "relY"    # F

    .prologue
    const v5, 0xaba9500

    const v4, 0x564eba0

    .line 129
    iget v2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    int-to-float v2, v2

    invoke-virtual {p0}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, p2

    sub-float/2addr v2, v3

    float-to-int v0, v2

    .line 131
    .local v0, "lat":I
    iget v2, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    int-to-float v2, v2

    invoke-virtual {p0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, p1

    add-float/2addr v2, v3

    float-to-int v1, v2

    .line 134
    .local v1, "lon":I
    :goto_1c
    if-le v0, v4, :cond_20

    .line 135
    sub-int/2addr v0, v4

    goto :goto_1c

    .line 136
    :cond_20
    :goto_20
    const v2, -0x564eba0

    if-ge v0, v2, :cond_27

    .line 137
    add-int/2addr v0, v4

    goto :goto_20

    .line 140
    :cond_27
    :goto_27
    if-le v1, v5, :cond_2b

    .line 141
    sub-int/2addr v1, v5

    goto :goto_27

    .line 142
    :cond_2b
    :goto_2b
    const v2, -0xaba9500

    if-ge v1, v2, :cond_32

    .line 143
    add-int/2addr v1, v5

    goto :goto_2b

    .line 145
    :cond_32
    new-instance v2, Lorg/osmdroid/util/GeoPoint;

    invoke-direct {v2, v0, v1}, Lorg/osmdroid/util/GeoPoint;-><init>(II)V

    return-object v2
.end method

.method public getLatNorthE6()I
    .registers 2

    .prologue
    .line 76
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    return v0
.end method

.method public getLatSouthE6()I
    .registers 2

    .prologue
    .line 80
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    return v0
.end method

.method public getLatitudeSpanE6()I
    .registers 3

    .prologue
    .line 92
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    return v0
.end method

.method public getLonEastE6()I
    .registers 2

    .prologue
    .line 84
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    return v0
.end method

.method public getLonWestE6()I
    .registers 2

    .prologue
    .line 88
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    return v0
.end method

.method public getLongitudeSpanE6()I
    .registers 3

    .prologue
    .line 96
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    return v0
.end method

.method public getRelativePositionOfGeoPointInBoundingBoxWithExactGudermannInterpolation(IILandroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 15
    .param p1, "aLatitudeE6"    # I
    .param p2, "aLongitudeE6"    # I
    .param p3, "reuse"    # Landroid/graphics/PointF;

    .prologue
    const-wide v9, 0x412e848000000000L    # 1000000.0

    .line 119
    if-eqz p3, :cond_3c

    move-object v0, p3

    .line 120
    .local v0, "out":Landroid/graphics/PointF;
    :goto_8
    iget v3, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    int-to-double v3, v3

    div-double/2addr v3, v9

    invoke-static {v3, v4}, Lorg/osmdroid/util/MyMath;->gudermannInverse(D)D

    move-result-wide v3

    int-to-double v5, p1

    div-double/2addr v5, v9

    invoke-static {v5, v6}, Lorg/osmdroid/util/MyMath;->gudermannInverse(D)D

    move-result-wide v5

    sub-double/2addr v3, v5

    iget v5, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    int-to-double v5, v5

    div-double/2addr v5, v9

    invoke-static {v5, v6}, Lorg/osmdroid/util/MyMath;->gudermannInverse(D)D

    move-result-wide v5

    iget v7, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    int-to-double v7, v7

    div-double/2addr v7, v9

    invoke-static {v7, v8}, Lorg/osmdroid/util/MyMath;->gudermannInverse(D)D

    move-result-wide v7

    sub-double/2addr v5, v7

    div-double/2addr v3, v5

    double-to-float v2, v3

    .line 121
    .local v2, "y":F
    const/high16 v3, 0x3f800000    # 1.0f

    iget v4, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    sub-int/2addr v4, p2

    int-to-float v4, v4

    invoke-virtual {p0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    sub-float v1, v3, v4

    .line 122
    .local v1, "x":F
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 123
    return-object v0

    .line 119
    .end local v0    # "out":Landroid/graphics/PointF;
    .end local v1    # "x":F
    .end local v2    # "y":F
    :cond_3c
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    goto :goto_8
.end method

.method public getRelativePositionOfGeoPointInBoundingBoxWithLinearInterpolation(IILandroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 10
    .param p1, "aLatitude"    # I
    .param p2, "aLongitude"    # I
    .param p3, "reuse"    # Landroid/graphics/PointF;

    .prologue
    .line 110
    if-eqz p3, :cond_20

    move-object v0, p3

    .line 111
    .local v0, "out":Landroid/graphics/PointF;
    :goto_3
    iget v3, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    sub-int/2addr v3, p1

    int-to-float v3, v3

    invoke-virtual {p0}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v4

    int-to-float v4, v4

    div-float v2, v3, v4

    .line 112
    .local v2, "y":F
    const/high16 v3, 0x3f800000    # 1.0f

    iget v4, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    sub-int/2addr v4, p2

    int-to-float v4, v4

    invoke-virtual {p0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    sub-float v1, v3, v4

    .line 113
    .local v1, "x":F
    invoke-virtual {v0, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 114
    return-object v0

    .line 110
    .end local v0    # "out":Landroid/graphics/PointF;
    .end local v1    # "x":F
    .end local v2    # "y":F
    :cond_20
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    goto :goto_3
.end method

.method public increaseByScale(F)Lorg/osmdroid/util/BoundingBoxE6;
    .registers 10
    .param p1, "pBoundingboxPaddingRelativeScale"    # F

    .prologue
    const/high16 v4, 0x40000000    # 2.0f

    .line 174
    invoke-virtual {p0}, Lorg/osmdroid/util/BoundingBoxE6;->getCenter()Lorg/osmdroid/util/GeoPoint;

    move-result-object v2

    .line 175
    .local v2, "pCenter":Lorg/osmdroid/util/GeoPoint;
    invoke-virtual {p0}, Lorg/osmdroid/util/BoundingBoxE6;->getLatitudeSpanE6()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, p1

    div-float/2addr v3, v4

    float-to-int v0, v3

    .line 176
    .local v0, "mLatSpanE6Padded_2":I
    invoke-virtual {p0}, Lorg/osmdroid/util/BoundingBoxE6;->getLongitudeSpanE6()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, p1

    div-float/2addr v3, v4

    float-to-int v1, v3

    .line 178
    .local v1, "mLonSpanE6Padded_2":I
    new-instance v3, Lorg/osmdroid/util/BoundingBoxE6;

    invoke-virtual {v2}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v2}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v5

    add-int/2addr v5, v1

    invoke-virtual {v2}, Lorg/osmdroid/util/GeoPoint;->getLatitudeE6()I

    move-result v6

    sub-int/2addr v6, v0

    invoke-virtual {v2}, Lorg/osmdroid/util/GeoPoint;->getLongitudeE6()I

    move-result v7

    sub-int/2addr v7, v1

    invoke-direct {v3, v4, v5, v6, v7}, Lorg/osmdroid/util/BoundingBoxE6;-><init>(IIII)V

    return-object v3
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 189
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "N:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "; E:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "; S:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "; W:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget v1, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "arg1"    # I

    .prologue
    .line 268
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatNorthE6:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 269
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonEastE6:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 270
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLatSouthE6:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 271
    iget v0, p0, Lorg/osmdroid/util/BoundingBoxE6;->mLonWestE6:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 272
    return-void
.end method
