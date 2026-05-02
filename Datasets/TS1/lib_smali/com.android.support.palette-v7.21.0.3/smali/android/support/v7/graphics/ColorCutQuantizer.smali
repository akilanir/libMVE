.class final Landroid/support/v7/graphics/ColorCutQuantizer;
.super Ljava/lang/Object;
.source "ColorCutQuantizer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    }
.end annotation


# static fields
.field private static final BLACK_MAX_LIGHTNESS:F = 0.05f

.field private static final COMPONENT_BLUE:I = -0x1

.field private static final COMPONENT_GREEN:I = -0x2

.field private static final COMPONENT_RED:I = -0x3

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final VBOX_COMPARATOR_VOLUME:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;",
            ">;"
        }
    .end annotation
.end field

.field private static final WHITE_MIN_LIGHTNESS:F = 0.95f


# instance fields
.field private final mColorPopulations:Landroid/util/SparseIntArray;

.field private final mColors:[I

.field private final mQuantizedColors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation
.end field

.field private final mTempHsl:[F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 46
    const-class v0, Landroid/support/v7/graphics/ColorCutQuantizer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroid/support/v7/graphics/ColorCutQuantizer;->LOG_TAG:Ljava/lang/String;

    .line 439
    new-instance v0, Landroid/support/v7/graphics/ColorCutQuantizer$1;

    invoke-direct {v0}, Landroid/support/v7/graphics/ColorCutQuantizer$1;-><init>()V

    sput-object v0, Landroid/support/v7/graphics/ColorCutQuantizer;->VBOX_COMPARATOR_VOLUME:Ljava/util/Comparator;

    return-void
.end method

.method private constructor <init>(Landroid/support/v7/graphics/ColorHistogram;I)V
    .registers 16
    .param p1, "colorHistogram"    # Landroid/support/v7/graphics/ColorHistogram;
    .param p2, "maxColors"    # I

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    const/4 v10, 0x3

    new-array v10, v10, [F

    iput-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mTempHsl:[F

    .line 85
    invoke-virtual {p1}, Landroid/support/v7/graphics/ColorHistogram;->getNumberOfColors()I

    move-result v5

    .line 86
    .local v5, "rawColorCount":I
    invoke-virtual {p1}, Landroid/support/v7/graphics/ColorHistogram;->getColors()[I

    move-result-object v7

    .line 87
    .local v7, "rawColors":[I
    invoke-virtual {p1}, Landroid/support/v7/graphics/ColorHistogram;->getColorCounts()[I

    move-result-object v6

    .line 91
    .local v6, "rawColorCounts":[I
    new-instance v10, Landroid/util/SparseIntArray;

    invoke-direct {v10, v5}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColorPopulations:Landroid/util/SparseIntArray;

    .line 92
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1c
    array-length v10, v7

    if-ge v2, v10, :cond_2b

    .line 93
    iget-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColorPopulations:Landroid/util/SparseIntArray;

    aget v11, v7, v2

    aget v12, v6, v2

    invoke-virtual {v10, v11, v12}, Landroid/util/SparseIntArray;->append(II)V

    .line 92
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 97
    :cond_2b
    new-array v10, v5, [I

    iput-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    .line 98
    const/4 v8, 0x0

    .line 99
    .local v8, "validColorCount":I
    move-object v0, v7

    .local v0, "arr$":[I
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    move v9, v8

    .end local v8    # "validColorCount":I
    .local v9, "validColorCount":I
    :goto_34
    if-ge v3, v4, :cond_48

    aget v1, v0, v3

    .line 100
    .local v1, "color":I
    invoke-direct {p0, v1}, Landroid/support/v7/graphics/ColorCutQuantizer;->shouldIgnoreColor(I)Z

    move-result v10

    if-nez v10, :cond_75

    .line 101
    iget-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    add-int/lit8 v8, v9, 0x1

    .end local v9    # "validColorCount":I
    .restart local v8    # "validColorCount":I
    aput v1, v10, v9

    .line 99
    :goto_44
    add-int/lit8 v3, v3, 0x1

    move v9, v8

    .end local v8    # "validColorCount":I
    .restart local v9    # "validColorCount":I
    goto :goto_34

    .line 105
    .end local v1    # "color":I
    :cond_48
    if-gt v9, p2, :cond_6c

    .line 107
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    iput-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    .line 108
    iget-object v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    array-length v4, v0

    const/4 v3, 0x0

    :goto_55
    if-ge v3, v4, :cond_74

    aget v1, v0, v3

    .line 109
    .restart local v1    # "color":I
    iget-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    new-instance v11, Landroid/support/v7/graphics/Palette$Swatch;

    iget-object v12, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColorPopulations:Landroid/util/SparseIntArray;

    invoke-virtual {v12, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v12

    invoke-direct {v11, v1, v12}, Landroid/support/v7/graphics/Palette$Swatch;-><init>(II)V

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    add-int/lit8 v3, v3, 0x1

    goto :goto_55

    .line 113
    .end local v1    # "color":I
    :cond_6c
    add-int/lit8 v10, v9, -0x1

    invoke-direct {p0, v10, p2}, Landroid/support/v7/graphics/ColorCutQuantizer;->quantizePixels(II)Ljava/util/List;

    move-result-object v10

    iput-object v10, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    .line 115
    :cond_74
    return-void

    .restart local v1    # "color":I
    :cond_75
    move v8, v9

    .end local v9    # "validColorCount":I
    .restart local v8    # "validColorCount":I
    goto :goto_44
.end method

.method static synthetic access$000(Landroid/support/v7/graphics/ColorCutQuantizer;)[I
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/graphics/ColorCutQuantizer;

    .prologue
    .line 44
    iget-object v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    return-object v0
.end method

.method static synthetic access$100(Landroid/support/v7/graphics/ColorCutQuantizer;III)V
    .registers 4
    .param p0, "x0"    # Landroid/support/v7/graphics/ColorCutQuantizer;
    .param p1, "x1"    # I
    .param p2, "x2"    # I
    .param p3, "x3"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/graphics/ColorCutQuantizer;->modifySignificantOctet(III)V

    return-void
.end method

.method static synthetic access$200(Landroid/support/v7/graphics/ColorCutQuantizer;)Landroid/util/SparseIntArray;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/graphics/ColorCutQuantizer;

    .prologue
    .line 44
    iget-object v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColorPopulations:Landroid/util/SparseIntArray;

    return-object v0
.end method

.method static fromBitmap(Landroid/graphics/Bitmap;I)Landroid/support/v7/graphics/ColorCutQuantizer;
    .registers 10
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "maxColors"    # I

    .prologue
    const/4 v2, 0x0

    .line 69
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 70
    .local v3, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .line 72
    .local v7, "height":I
    mul-int v0, v3, v7

    new-array v1, v0, [I

    .local v1, "pixels":[I
    move-object v0, p0

    move v4, v2

    move v5, v2

    move v6, v3

    .line 73
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    .line 75
    new-instance v0, Landroid/support/v7/graphics/ColorCutQuantizer;

    new-instance v2, Landroid/support/v7/graphics/ColorHistogram;

    invoke-direct {v2, v1}, Landroid/support/v7/graphics/ColorHistogram;-><init>([I)V

    invoke-direct {v0, v2, p1}, Landroid/support/v7/graphics/ColorCutQuantizer;-><init>(Landroid/support/v7/graphics/ColorHistogram;I)V

    return-object v0
.end method

.method private generateAverageColors(Ljava/util/Collection;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 166
    .local p1, "vboxes":Ljava/util/Collection;, "Ljava/util/Collection<Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 167
    .local v1, "colors":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v7/graphics/Palette$Swatch;>;"
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    .line 168
    .local v3, "vbox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    invoke-virtual {v3}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->getAverageColor()Landroid/support/v7/graphics/Palette$Swatch;

    move-result-object v0

    .line 169
    .local v0, "color":Landroid/support/v7/graphics/Palette$Swatch;
    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->shouldIgnoreColor(Landroid/support/v7/graphics/Palette$Swatch;)Z

    move-result v4

    if-nez v4, :cond_d

    .line 172
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 175
    .end local v0    # "color":Landroid/support/v7/graphics/Palette$Swatch;
    .end local v3    # "vbox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    :cond_27
    return-object v1
.end method

.method private static isBlack([F)Z
    .registers 3
    .param p0, "hslColor"    # [F

    .prologue
    .line 419
    const/4 v0, 0x2

    aget v0, p0, v0

    const v1, 0x3d4ccccd    # 0.05f

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private static isNearRedILine([F)Z
    .registers 5
    .param p0, "hslColor"    # [F

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 433
    aget v2, p0, v1

    const/high16 v3, 0x41200000    # 10.0f

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_1c

    aget v2, p0, v1

    const/high16 v3, 0x42140000    # 37.0f

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_1c

    aget v2, p0, v0

    const v3, 0x3f51eb85    # 0.82f

    cmpg-float v2, v2, v3

    if-gtz v2, :cond_1c

    :goto_1b
    return v0

    :cond_1c
    move v0, v1

    goto :goto_1b
.end method

.method private static isWhite([F)Z
    .registers 3
    .param p0, "hslColor"    # [F

    .prologue
    .line 426
    const/4 v0, 0x2

    aget v0, p0, v0

    const v1, 0x3f733333    # 0.95f

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method private modifySignificantOctet(III)V
    .registers 10
    .param p1, "dimension"    # I
    .param p2, "lowerIndex"    # I
    .param p3, "upperIndex"    # I

    .prologue
    .line 381
    packed-switch p1, :pswitch_data_3c

    .line 400
    :cond_3
    :pswitch_3
    return-void

    .line 387
    :pswitch_4
    move v1, p2

    .local v1, "i":I
    :goto_5
    if-gt v1, p3, :cond_3

    .line 388
    iget-object v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    aget v0, v2, v1

    .line 389
    .local v0, "color":I
    iget-object v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    shr-int/lit8 v3, v0, 0x8

    and-int/lit16 v3, v3, 0xff

    shr-int/lit8 v4, v0, 0x10

    and-int/lit16 v4, v4, 0xff

    and-int/lit16 v5, v0, 0xff

    invoke-static {v3, v4, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    aput v3, v2, v1

    .line 387
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 394
    .end local v0    # "color":I
    .end local v1    # "i":I
    :pswitch_20
    move v1, p2

    .restart local v1    # "i":I
    :goto_21
    if-gt v1, p3, :cond_3

    .line 395
    iget-object v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    aget v0, v2, v1

    .line 396
    .restart local v0    # "color":I
    iget-object v2, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mColors:[I

    and-int/lit16 v3, v0, 0xff

    shr-int/lit8 v4, v0, 0x8

    and-int/lit16 v4, v4, 0xff

    shr-int/lit8 v5, v0, 0x10

    and-int/lit16 v5, v5, 0xff

    invoke-static {v3, v4, v5}, Landroid/graphics/Color;->rgb(III)I

    move-result v3

    aput v3, v2, v1

    .line 394
    add-int/lit8 v1, v1, 0x1

    goto :goto_21

    .line 381
    :pswitch_data_3c
    .packed-switch -0x3
        :pswitch_3
        :pswitch_4
        :pswitch_20
    .end packed-switch
.end method

.method private quantizePixels(II)Ljava/util/List;
    .registers 6
    .param p1, "maxColorIndex"    # I
    .param p2, "maxColors"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Ljava/util/PriorityQueue;

    sget-object v1, Landroid/support/v7/graphics/ColorCutQuantizer;->VBOX_COMPARATOR_VOLUME:Ljava/util/Comparator;

    invoke-direct {v0, p2, v1}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    .line 130
    .local v0, "pq":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;>;"
    new-instance v1, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2, p1}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;-><init>(Landroid/support/v7/graphics/ColorCutQuantizer;II)V

    invoke-virtual {v0, v1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    .line 134
    invoke-direct {p0, v0, p2}, Landroid/support/v7/graphics/ColorCutQuantizer;->splitBoxes(Ljava/util/PriorityQueue;I)V

    .line 137
    invoke-direct {p0, v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->generateAverageColors(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method private shouldIgnoreColor(I)Z
    .registers 6
    .param p1, "color"    # I

    .prologue
    .line 403
    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mTempHsl:[F

    invoke-static {v0, v1, v2, v3}, Landroid/support/v7/graphics/ColorUtils;->RGBtoHSL(III[F)V

    .line 404
    iget-object v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mTempHsl:[F

    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->shouldIgnoreColor([F)Z

    move-result v0

    return v0
.end method

.method private static shouldIgnoreColor(Landroid/support/v7/graphics/Palette$Swatch;)Z
    .registers 2
    .param p0, "color"    # Landroid/support/v7/graphics/Palette$Swatch;

    .prologue
    .line 408
    invoke-virtual {p0}, Landroid/support/v7/graphics/Palette$Swatch;->getHsl()[F

    move-result-object v0

    invoke-static {v0}, Landroid/support/v7/graphics/ColorCutQuantizer;->shouldIgnoreColor([F)Z

    move-result v0

    return v0
.end method

.method private static shouldIgnoreColor([F)Z
    .registers 2
    .param p0, "hslColor"    # [F

    .prologue
    .line 412
    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->isWhite([F)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->isBlack([F)Z

    move-result v0

    if-nez v0, :cond_12

    invoke-static {p0}, Landroid/support/v7/graphics/ColorCutQuantizer;->isNearRedILine([F)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method private splitBoxes(Ljava/util/PriorityQueue;I)V
    .registers 5
    .param p2, "maxSize"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/PriorityQueue",
            "<",
            "Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "queue":Ljava/util/PriorityQueue;, "Ljava/util/PriorityQueue<Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;>;"
    :goto_0
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->size()I

    move-result v1

    if-ge v1, p2, :cond_1f

    .line 151
    invoke-virtual {p1}, Ljava/util/PriorityQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    .line 153
    .local v0, "vbox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    if-eqz v0, :cond_1f

    invoke-virtual {v0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->canSplit()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 155
    invoke-virtual {v0}, Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;->splitBox()Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    .line 157
    invoke-virtual {p1, v0}, Ljava/util/PriorityQueue;->offer(Ljava/lang/Object;)Z

    goto :goto_0

    .line 163
    .end local v0    # "vbox":Landroid/support/v7/graphics/ColorCutQuantizer$Vbox;
    :cond_1f
    return-void
.end method


# virtual methods
.method getQuantizedColors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/graphics/Palette$Swatch;",
            ">;"
        }
    .end annotation

    .prologue
    .line 121
    iget-object v0, p0, Landroid/support/v7/graphics/ColorCutQuantizer;->mQuantizedColors:Ljava/util/List;

    return-object v0
.end method
