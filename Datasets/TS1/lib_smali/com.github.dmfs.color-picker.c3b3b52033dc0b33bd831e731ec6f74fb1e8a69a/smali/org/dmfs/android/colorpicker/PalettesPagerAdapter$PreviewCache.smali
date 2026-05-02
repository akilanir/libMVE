.class Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;
.super Landroid/support/v4/util/LruCache;
.source "PalettesPagerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PreviewCache"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/util/LruCache",
        "<",
        "Ljava/lang/Integer;",
        "Landroid/graphics/drawable/Drawable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;


# direct methods
.method public constructor <init>(Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;I)V
    .registers 3
    .param p2, "maxSize"    # I

    .prologue
    .line 126
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;->this$0:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    .line 127
    invoke-direct {p0, p2}, Landroid/support/v4/util/LruCache;-><init>(I)V

    .line 128
    return-void
.end method


# virtual methods
.method protected create(Ljava/lang/Integer;)Landroid/graphics/drawable/Drawable;
    .registers 20
    .param p1, "key"    # Ljava/lang/Integer;

    .prologue
    .line 134
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;->this$0:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    # getter for: Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
    invoke-static {v15}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->access$000(Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;)[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    move-result-object v15

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Integer;->intValue()I

    move-result v16

    aget-object v10, v15, v16

    .line 135
    .local v10, "palette":Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
    const/high16 v15, 0x42000000    # 32.0f

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;->this$0:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    move-object/from16 v16, v0

    # getter for: Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mDensity:F
    invoke-static/range {v16 .. v16}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->access$100(Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;)F

    move-result v16

    mul-float v15, v15, v16

    float-to-int v13, v15

    .line 136
    .local v13, "size":I
    invoke-virtual {v10}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getNumberOfColumns()I

    move-result v2

    .line 138
    .local v2, "cols":I
    sget-object v15, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v13, v13, v15}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v11

    .line 139
    .local v11, "preview":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v11}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 141
    .local v1, "canvas":Landroid/graphics/Canvas;
    const v15, 0x3f99999a    # 1.2f

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;->this$0:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    move-object/from16 v16, v0

    # getter for: Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mDensity:F
    invoke-static/range {v16 .. v16}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->access$100(Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;)F

    move-result v16

    mul-float v14, v15, v16

    .line 142
    .local v14, "spacing":F
    const/high16 v15, 0x40000000    # 2.0f

    div-float v4, v14, v15

    .line 143
    .local v4, "halfSpacing":F
    int-to-float v15, v13

    add-float/2addr v15, v14

    int-to-float v0, v2

    move/from16 v16, v0

    div-float v3, v15, v16

    .line 144
    .local v3, "grid":F
    sub-float v15, v3, v14

    const/high16 v16, 0x40000000    # 2.0f

    div-float v12, v15, v16

    .line 145
    .local v12, "radius":F
    new-instance v9, Landroid/graphics/Paint;

    invoke-direct {v9}, Landroid/graphics/Paint;-><init>()V

    .line 146
    .local v9, "paint":Landroid/graphics/Paint;
    const/4 v15, 0x1

    invoke-virtual {v9, v15}, Landroid/graphics/Paint;->setFlags(I)V

    .line 148
    const/4 v6, 0x0

    .local v6, "j":I
    invoke-virtual {v10}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getNumberOfColors()I

    move-result v15

    div-int v7, v15, v2

    .local v7, "k":I
    :goto_5c
    if-ge v6, v7, :cond_8d

    .line 150
    const/4 v5, 0x0

    .local v5, "i":I
    move v8, v2

    .local v8, "l":I
    :goto_60
    if-ge v5, v8, :cond_8a

    .line 152
    mul-int v15, v6, v2

    add-int/2addr v15, v5

    invoke-virtual {v10, v15}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getColor(I)I

    move-result v15

    const/high16 v16, -0x1000000

    or-int v15, v15, v16

    invoke-virtual {v9, v15}, Landroid/graphics/Paint;->setColor(I)V

    .line 154
    int-to-float v15, v5

    const/high16 v16, 0x3f000000    # 0.5f

    add-float v15, v15, v16

    mul-float/2addr v15, v3

    sub-float/2addr v15, v4

    int-to-float v0, v6

    move/from16 v16, v0

    const/high16 v17, 0x3f000000    # 0.5f

    add-float v16, v16, v17

    mul-float v16, v16, v3

    sub-float v16, v16, v4

    move/from16 v0, v16

    invoke-virtual {v1, v15, v0, v12, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 150
    add-int/lit8 v5, v5, 0x1

    goto :goto_60

    .line 148
    :cond_8a
    add-int/lit8 v6, v6, 0x1

    goto :goto_5c

    .line 158
    .end local v5    # "i":I
    .end local v8    # "l":I
    :cond_8d
    new-instance v15, Landroid/graphics/drawable/BitmapDrawable;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;->this$0:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    move-object/from16 v16, v0

    # getter for: Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mResources:Landroid/content/res/Resources;
    invoke-static/range {v16 .. v16}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->access$200(Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;)Landroid/content/res/Resources;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v11}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    return-object v15
.end method

.method protected bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 122
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;->create(Ljava/lang/Integer;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method
