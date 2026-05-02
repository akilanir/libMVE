.class public Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;
.super Lorg/osmdroid/views/overlay/ItemizedIconOverlay;
.source "ItemizedOverlayWithFocus.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Item:",
        "Lorg/osmdroid/views/overlay/OverlayItem;",
        ">",
        "Lorg/osmdroid/views/overlay/ItemizedIconOverlay",
        "<TItem;>;"
    }
.end annotation


# static fields
.field protected static final DEFAULTMARKER_BACKGROUNDCOLOR:I

.field public static final DESCRIPTION_BOX_CORNERWIDTH:I = 0x3

.field public static final DESCRIPTION_BOX_PADDING:I = 0x3

.field protected static DESCRIPTION_LINE_HEIGHT:I = 0x0

.field protected static DESCRIPTION_MAXWIDTH:I = 0x0

.field public static final DESCRIPTION_TITLE_EXTRA_LINE_HEIGHT:I = 0x2

.field protected static FONT_SIZE_DP:I


# instance fields
.field private final UNKNOWN:Ljava/lang/String;

.field private final fontSizePixels:I

.field protected final mDescriptionPaint:Landroid/graphics/Paint;

.field protected mFocusItemsOnTap:Z

.field protected mFocusedItemIndex:I

.field private final mFocusedScreenCoords:Landroid/graphics/Point;

.field protected final mMarkerBackgroundPaint:Landroid/graphics/Paint;

.field protected final mMarkerFocusedBackgroundColor:I

.field protected mMarkerFocusedBase:Landroid/graphics/drawable/Drawable;

.field private final mRect:Landroid/graphics/Rect;

.field protected final mTitlePaint:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 35
    const/16 v0, 0x65

    const/16 v1, 0xb9

    const/16 v2, 0x4a

    invoke-static {v0, v1, v2}, Landroid/graphics/Color;->rgb(III)I

    move-result v0

    sput v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DEFAULTMARKER_BACKGROUNDCOLOR:I

    .line 36
    const/16 v0, 0xe

    sput v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->FONT_SIZE_DP:I

    .line 38
    const/16 v0, 0x258

    sput v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DESCRIPTION_MAXWIDTH:I

    .line 39
    const/16 v0, 0x1e

    sput v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DESCRIPTION_LINE_HEIGHT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;)V
    .registers 5
    .param p1, "ctx"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<TItem;>;",
            "Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener",
            "<TItem;>;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    .local p2, "aList":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    .local p3, "aOnItemTapListener":Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;, "Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener<TItem;>;"
    new-instance v0, Lorg/osmdroid/DefaultResourceProxyImpl;

    invoke-direct {v0, p1}, Lorg/osmdroid/DefaultResourceProxyImpl;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p2, p3, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;-><init>(Ljava/util/List;Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;Lorg/osmdroid/ResourceProxy;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;ILorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;Lorg/osmdroid/ResourceProxy;)V
    .registers 12
    .param p2, "pMarker"    # Landroid/graphics/drawable/Drawable;
    .param p3, "pMarkerFocused"    # Landroid/graphics/drawable/Drawable;
    .param p4, "pFocusedBackgroundColor"    # I
    .param p6, "pResourceProxy"    # Lorg/osmdroid/ResourceProxy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;",
            "Landroid/graphics/drawable/Drawable;",
            "Landroid/graphics/drawable/Drawable;",
            "I",
            "Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener",
            "<TItem;>;",
            "Lorg/osmdroid/ResourceProxy;",
            ")V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    .local p1, "aList":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    .local p5, "aOnItemTapListener":Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;, "Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener<TItem;>;"
    const/4 v4, 0x1

    .line 75
    invoke-direct {p0, p1, p2, p5, p6}, Lorg/osmdroid/views/overlay/ItemizedIconOverlay;-><init>(Ljava/util/List;Landroid/graphics/drawable/Drawable;Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;Lorg/osmdroid/ResourceProxy;)V

    .line 52
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedScreenCoords:Landroid/graphics/Point;

    .line 153
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mRect:Landroid/graphics/Rect;

    .line 78
    sget v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->FONT_SIZE_DP:I

    int-to-float v0, v0

    invoke-interface {p6}, Lorg/osmdroid/ResourceProxy;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    invoke-static {v4, v0, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->fontSizePixels:I

    .line 80
    iget v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->fontSizePixels:I

    add-int/lit8 v0, v0, 0x5

    sput v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DESCRIPTION_LINE_HEIGHT:I

    .line 83
    invoke-interface {p6}, Lorg/osmdroid/ResourceProxy;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-double v0, v0

    const-wide v2, 0x3fe999999999999aL    # 0.8

    mul-double/2addr v0, v2

    double-to-int v0, v0

    sput v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DESCRIPTION_MAXWIDTH:I

    .line 84
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$string;->unknown:Lorg/osmdroid/ResourceProxy$string;

    invoke-interface {v0, v1}, Lorg/osmdroid/ResourceProxy;->getString(Lorg/osmdroid/ResourceProxy$string;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->UNKNOWN:Ljava/lang/String;

    .line 86
    if-nez p3, :cond_90

    .line 87
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mResourceProxy:Lorg/osmdroid/ResourceProxy;

    sget-object v1, Lorg/osmdroid/ResourceProxy$bitmap;->marker_default_focused_base:Lorg/osmdroid/ResourceProxy$bitmap;

    invoke-interface {v0, v1}, Lorg/osmdroid/ResourceProxy;->getDrawable(Lorg/osmdroid/ResourceProxy$bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    sget-object v1, Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;->BOTTOM_CENTER:Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;

    invoke-virtual {p0, v0, v1}, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->boundToHotspot(Landroid/graphics/drawable/Drawable;Lorg/osmdroid/views/overlay/OverlayItem$HotspotPlace;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mMarkerFocusedBase:Landroid/graphics/drawable/Drawable;

    .line 93
    :goto_52
    const/high16 v0, -0x80000000

    if-eq p4, v0, :cond_93

    .end local p4    # "pFocusedBackgroundColor":I
    :goto_56
    iput p4, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mMarkerFocusedBackgroundColor:I

    .line 96
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mMarkerBackgroundPaint:Landroid/graphics/Paint;

    .line 98
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mDescriptionPaint:Landroid/graphics/Paint;

    .line 99
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mDescriptionPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 100
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mDescriptionPaint:Landroid/graphics/Paint;

    iget v1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->fontSizePixels:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 101
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mTitlePaint:Landroid/graphics/Paint;

    .line 102
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mTitlePaint:Landroid/graphics/Paint;

    iget v1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->fontSizePixels:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 103
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mTitlePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 104
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mTitlePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 105
    invoke-virtual {p0}, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->unSetFocusedItem()V

    .line 106
    return-void

    .line 91
    .restart local p4    # "pFocusedBackgroundColor":I
    :cond_90
    iput-object p3, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mMarkerFocusedBase:Landroid/graphics/drawable/Drawable;

    goto :goto_52

    .line 93
    :cond_93
    sget p4, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DEFAULTMARKER_BACKGROUNDCOLOR:I

    goto :goto_56
.end method

.method public constructor <init>(Ljava/util/List;Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;Lorg/osmdroid/ResourceProxy;)V
    .registers 11
    .param p3, "pResourceProxy"    # Lorg/osmdroid/ResourceProxy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TItem;>;",
            "Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener",
            "<TItem;>;",
            "Lorg/osmdroid/ResourceProxy;",
            ")V"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    .local p1, "aList":Ljava/util/List;, "Ljava/util/List<TItem;>;"
    .local p2, "aOnItemTapListener":Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;, "Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener<TItem;>;"
    sget-object v0, Lorg/osmdroid/ResourceProxy$bitmap;->marker_default:Lorg/osmdroid/ResourceProxy$bitmap;

    invoke-interface {p3, v0}, Lorg/osmdroid/ResourceProxy;->getDrawable(Lorg/osmdroid/ResourceProxy$bitmap;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    const/4 v3, 0x0

    const/high16 v4, -0x80000000

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;-><init>(Ljava/util/List;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;ILorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;Lorg/osmdroid/ResourceProxy;)V

    .line 69
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V
    .registers 36
    .param p1, "c"    # Landroid/graphics/Canvas;
    .param p2, "osmv"    # Lorg/osmdroid/views/MapView;
    .param p3, "shadow"    # Z

    .prologue
    .line 158
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    invoke-super/range {p0 .. p3}, Lorg/osmdroid/views/overlay/ItemizedIconOverlay;->draw(Landroid/graphics/Canvas;Lorg/osmdroid/views/MapView;Z)V

    .line 160
    if-eqz p3, :cond_6

    .line 281
    :cond_5
    :goto_5
    return-void

    .line 164
    :cond_6
    move-object/from16 v0, p0

    iget v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedItemIndex:I

    const/high16 v4, -0x80000000

    if-eq v3, v4, :cond_5

    .line 169
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedIconOverlay;->mItemList:Ljava/util/List;

    move-object/from16 v0, p0

    iget v4, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedItemIndex:I

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/osmdroid/views/overlay/OverlayItem;

    .line 170
    .local v18, "focusedItem":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    const/4 v3, 0x4

    move-object/from16 v0, v18

    invoke-virtual {v0, v3}, Lorg/osmdroid/views/overlay/OverlayItem;->getMarker(I)Landroid/graphics/drawable/Drawable;

    move-result-object v26

    .line 171
    .local v26, "markerFocusedBase":Landroid/graphics/drawable/Drawable;
    if-nez v26, :cond_2b

    .line 172
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mMarkerFocusedBase:Landroid/graphics/drawable/Drawable;

    move-object/from16 v26, v0

    .line 176
    :cond_2b
    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/views/MapView;->getProjection()Lorg/osmdroid/views/Projection;

    move-result-object v3

    invoke-virtual/range {v18 .. v18}, Lorg/osmdroid/views/overlay/OverlayItem;->getPoint()Lorg/osmdroid/api/IGeoPoint;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedScreenCoords:Landroid/graphics/Point;

    invoke-virtual {v3, v4, v5}, Lorg/osmdroid/views/Projection;->toPixels(Lorg/osmdroid/api/IGeoPoint;Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 178
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mRect:Landroid/graphics/Rect;

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/Drawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 179
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mRect:Landroid/graphics/Rect;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedScreenCoords:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedScreenCoords:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->offset(II)V

    .line 182
    invoke-virtual/range {v18 .. v18}, Lorg/osmdroid/views/overlay/OverlayItem;->getTitle()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_de

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->UNKNOWN:Ljava/lang/String;

    move-object/from16 v21, v0

    .line 184
    .local v21, "itemTitle":Ljava/lang/String;
    :goto_62
    invoke-virtual/range {v18 .. v18}, Lorg/osmdroid/views/overlay/OverlayItem;->getSnippet()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_e3

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->UNKNOWN:Ljava/lang/String;

    move-object/from16 v20, v0

    .line 191
    .local v20, "itemDescription":Ljava/lang/String;
    :goto_6e
    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->length()I

    move-result v3

    new-array v0, v3, [F

    move-object/from16 v31, v0

    .line 192
    .local v31, "widths":[F
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mDescriptionPaint:Landroid/graphics/Paint;

    move-object/from16 v0, v20

    move-object/from16 v1, v31

    invoke-virtual {v3, v0, v1}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;[F)I

    .line 194
    new-instance v29, Ljava/lang/StringBuilder;

    invoke-direct/range {v29 .. v29}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .local v29, "sb":Ljava/lang/StringBuilder;
    const/16 v27, 0x0

    .line 196
    .local v27, "maxWidth":I
    const/4 v10, 0x0

    .line 197
    .local v10, "curLineWidth":I
    const/16 v23, 0x0

    .line 199
    .local v23, "lastStop":I
    const/16 v24, 0x0

    .line 204
    .local v24, "lastwhitespace":I
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_8f
    move-object/from16 v0, v31

    array-length v3, v0

    move/from16 v0, v19

    if-ge v0, v3, :cond_eb

    .line 205
    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z

    move-result v3

    if-nez v3, :cond_a6

    .line 206
    move/from16 v24, v19

    .line 209
    :cond_a6
    aget v9, v31, v19

    .line 211
    .local v9, "charwidth":F
    int-to-float v3, v10

    add-float/2addr v3, v9

    sget v4, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DESCRIPTION_MAXWIDTH:I

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_d8

    .line 212
    move/from16 v0, v23

    move/from16 v1, v24

    if-ne v0, v1, :cond_e8

    .line 213
    add-int/lit8 v19, v19, -0x1

    .line 218
    :goto_b9
    move-object/from16 v0, v20

    move/from16 v1, v23

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 219
    const/16 v3, 0xa

    move-object/from16 v0, v29

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 221
    move/from16 v23, v19

    .line 222
    move/from16 v0, v27

    invoke-static {v0, v10}, Ljava/lang/Math;->max(II)I

    move-result v27

    .line 223
    const/4 v10, 0x0

    .line 226
    :cond_d8
    int-to-float v3, v10

    add-float/2addr v3, v9

    float-to-int v10, v3

    .line 204
    add-int/lit8 v19, v19, 0x1

    goto :goto_8f

    .line 182
    .end local v9    # "charwidth":F
    .end local v10    # "curLineWidth":I
    .end local v19    # "i":I
    .end local v20    # "itemDescription":Ljava/lang/String;
    .end local v21    # "itemTitle":Ljava/lang/String;
    .end local v23    # "lastStop":I
    .end local v24    # "lastwhitespace":I
    .end local v27    # "maxWidth":I
    .end local v29    # "sb":Ljava/lang/StringBuilder;
    .end local v31    # "widths":[F
    :cond_de
    invoke-virtual/range {v18 .. v18}, Lorg/osmdroid/views/overlay/OverlayItem;->getTitle()Ljava/lang/String;

    move-result-object v21

    goto :goto_62

    .line 184
    .restart local v21    # "itemTitle":Ljava/lang/String;
    :cond_e3
    invoke-virtual/range {v18 .. v18}, Lorg/osmdroid/views/overlay/OverlayItem;->getSnippet()Ljava/lang/String;

    move-result-object v20

    goto :goto_6e

    .line 215
    .restart local v9    # "charwidth":F
    .restart local v10    # "curLineWidth":I
    .restart local v19    # "i":I
    .restart local v20    # "itemDescription":Ljava/lang/String;
    .restart local v23    # "lastStop":I
    .restart local v24    # "lastwhitespace":I
    .restart local v27    # "maxWidth":I
    .restart local v29    # "sb":Ljava/lang/StringBuilder;
    .restart local v31    # "widths":[F
    :cond_e8
    move/from16 v19, v24

    goto :goto_b9

    .line 229
    .end local v9    # "charwidth":F
    :cond_eb
    move/from16 v0, v19

    move/from16 v1, v23

    if-eq v0, v1, :cond_113

    .line 230
    move-object/from16 v0, v20

    move/from16 v1, v23

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v28

    .line 231
    .local v28, "rest":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mDescriptionPaint:Landroid/graphics/Paint;

    move-object/from16 v0, v28

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    float-to-int v3, v3

    move/from16 v0, v27

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v27

    .line 232
    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .end local v28    # "rest":Ljava/lang/String;
    :cond_113
    invoke-virtual/range {v29 .. v29}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v25

    .line 239
    .local v25, "lines":[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mDescriptionPaint:Landroid/graphics/Paint;

    move-object/from16 v0, v21

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    float-to-int v0, v3

    move/from16 v30, v0

    .line 241
    .local v30, "titleWidth":I
    move/from16 v0, v27

    move/from16 v1, v30

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v27

    .line 242
    sget v3, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DESCRIPTION_MAXWIDTH:I

    move/from16 v0, v27

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v17

    .line 245
    .local v17, "descWidth":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    div-int/lit8 v4, v17, 0x2

    sub-int/2addr v3, v4

    add-int/lit8 v3, v3, -0x3

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int v12, v3, v4

    .line 247
    .local v12, "descBoxLeft":I
    add-int v3, v12, v17

    add-int/lit8 v13, v3, 0x6

    .line 248
    .local v13, "descBoxRight":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mRect:Landroid/graphics/Rect;

    iget v11, v3, Landroid/graphics/Rect;->top:I

    .line 249
    .local v11, "descBoxBottom":I
    add-int/lit8 v3, v11, -0x2

    move-object/from16 v0, v25

    array-length v4, v0

    add-int/lit8 v4, v4, 0x1

    sget v5, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DESCRIPTION_LINE_HEIGHT:I

    mul-int/2addr v4, v5

    sub-int/2addr v3, v4

    add-int/lit8 v14, v3, -0x6

    .line 254
    .local v14, "descBoxTop":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mMarkerBackgroundPaint:Landroid/graphics/Paint;

    const/high16 v4, -0x1000000

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 255
    new-instance v3, Landroid/graphics/RectF;

    add-int/lit8 v4, v12, -0x1

    int-to-float v4, v4

    add-int/lit8 v5, v14, -0x1

    int-to-float v5, v5

    add-int/lit8 v6, v13, 0x1

    int-to-float v6, v6

    add-int/lit8 v7, v11, 0x1

    int-to-float v7, v7

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v4, 0x40400000    # 3.0f

    const/high16 v5, 0x40400000    # 3.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mDescriptionPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 258
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mMarkerBackgroundPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget v4, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mMarkerFocusedBackgroundColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 259
    new-instance v3, Landroid/graphics/RectF;

    int-to-float v4, v12

    int-to-float v5, v14

    int-to-float v6, v13

    int-to-float v7, v11

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v4, 0x40400000    # 3.0f

    const/high16 v5, 0x40400000    # 3.0f

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mMarkerBackgroundPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 263
    add-int/lit8 v15, v12, 0x3

    .line 264
    .local v15, "descLeft":I
    add-int/lit8 v16, v11, -0x3

    .line 267
    .local v16, "descTextLineBottom":I
    move-object/from16 v0, v25

    array-length v3, v0

    add-int/lit8 v22, v3, -0x1

    .local v22, "j":I
    :goto_1b9
    if-ltz v22, :cond_1d5

    .line 268
    aget-object v3, v25, v22

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    int-to-float v4, v15

    move/from16 v0, v16

    int-to-float v5, v0

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mDescriptionPaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v4, v5, v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 269
    sget v3, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->DESCRIPTION_LINE_HEIGHT:I

    sub-int v16, v16, v3

    .line 267
    add-int/lit8 v22, v22, -0x1

    goto :goto_1b9

    .line 272
    :cond_1d5
    int-to-float v3, v15

    add-int/lit8 v4, v16, -0x2

    int-to-float v4, v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mTitlePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 274
    int-to-float v4, v12

    move/from16 v0, v16

    int-to-float v5, v0

    int-to-float v6, v13

    move/from16 v0, v16

    int-to-float v7, v0

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mDescriptionPaint:Landroid/graphics/Paint;

    move-object/from16 v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 280
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedScreenCoords:Landroid/graphics/Point;

    iget v5, v3, Landroid/graphics/Point;->x:I

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedScreenCoords:Landroid/graphics/Point;

    iget v6, v3, Landroid/graphics/Point;->y:I

    const/4 v7, 0x0

    invoke-virtual/range {p2 .. p2}, Lorg/osmdroid/views/MapView;->getMapOrientation()F

    move-result v8

    move-object/from16 v3, p1

    move-object/from16 v4, v26

    invoke-static/range {v3 .. v8}, Lorg/osmdroid/views/overlay/Overlay;->drawAt(Landroid/graphics/Canvas;Landroid/graphics/drawable/Drawable;IIZF)V

    goto/16 :goto_5
.end method

.method public getFocusedItem()Lorg/osmdroid/views/overlay/OverlayItem;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TItem;"
        }
    .end annotation

    .prologue
    .line 113
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    iget v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedItemIndex:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_8

    .line 114
    const/4 v0, 0x0

    .line 116
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mItemList:Ljava/util/List;

    iget v1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedItemIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/osmdroid/views/overlay/OverlayItem;

    goto :goto_7
.end method

.method protected onSingleTapUpHelper(ILorg/osmdroid/views/overlay/OverlayItem;Lorg/osmdroid/views/MapView;)Z
    .registers 5
    .param p1, "index"    # I
    .param p3, "mapView"    # Lorg/osmdroid/views/MapView;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITItem;",
            "Lorg/osmdroid/views/MapView;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 146
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    .local p2, "item":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    iget-boolean v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusItemsOnTap:Z

    if-eqz v0, :cond_9

    .line 147
    iput p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedItemIndex:I

    .line 148
    invoke-virtual {p3}, Lorg/osmdroid/views/MapView;->postInvalidate()V

    .line 150
    :cond_9
    iget-object v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mOnItemGestureListener:Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;

    invoke-interface {v0, p1, p2}, Lorg/osmdroid/views/overlay/ItemizedIconOverlay$OnItemGestureListener;->onItemSingleTapUp(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setFocusItemsOnTap(Z)V
    .registers 2
    .param p1, "doit"    # Z

    .prologue
    .line 137
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    iput-boolean p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusItemsOnTap:Z

    .line 138
    return-void
.end method

.method public setFocusedItem(I)V
    .registers 2
    .param p1, "pIndex"    # I

    .prologue
    .line 120
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    iput p1, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedItemIndex:I

    .line 121
    return-void
.end method

.method public setFocusedItem(Lorg/osmdroid/views/overlay/OverlayItem;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TItem;)V"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    .local p1, "pItem":Lorg/osmdroid/views/overlay/OverlayItem;, "TItem;"
    iget-object v1, p0, Lorg/osmdroid/views/overlay/ItemizedIconOverlay;->mItemList:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 129
    .local v0, "indexFound":I
    if-gez v0, :cond_e

    .line 130
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1

    .line 133
    :cond_e
    invoke-virtual {p0, v0}, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->setFocusedItem(I)V

    .line 134
    return-void
.end method

.method public unSetFocusedItem()V
    .registers 2

    .prologue
    .line 124
    .local p0, "this":Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;, "Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus<TItem;>;"
    const/high16 v0, -0x80000000

    iput v0, p0, Lorg/osmdroid/views/overlay/ItemizedOverlayWithFocus;->mFocusedItemIndex:I

    .line 125
    return-void
.end method
