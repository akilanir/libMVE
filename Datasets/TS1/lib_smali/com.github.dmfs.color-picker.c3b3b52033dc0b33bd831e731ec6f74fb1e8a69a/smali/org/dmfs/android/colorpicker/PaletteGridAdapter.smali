.class public Lorg/dmfs/android/colorpicker/PaletteGridAdapter;
.super Landroid/widget/BaseAdapter;
.source "PaletteGridAdapter.java"


# instance fields
.field private final mLayoutInflater:Landroid/view/LayoutInflater;

.field private final mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "palette"    # Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    .prologue
    .line 53
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 54
    iput-object p2, p0, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    .line 55
    const-string v0, "layout_inflater"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    .line 56
    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-virtual {v0}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getNumberOfColors()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 79
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-virtual {v0, p1}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getColor(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 91
    int-to-long v0, p1

    return-wide v0
.end method

.method public getNumColumns()I
    .registers 2

    .prologue
    .line 136
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-virtual {v0}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getNumberOfColumns()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 10
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 105
    move-object v2, p2

    .line 106
    .local v2, "view":Landroid/view/View;
    if-nez v2, :cond_c

    .line 111
    iget-object v3, p0, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    sget v4, Lorg/dmfs/android/colorpicker/R$layout;->org_dmfs_colorpickerdialog_palette_field:I

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 116
    :cond_c
    new-instance v1, Landroid/graphics/drawable/shapes/ArcShape;

    const/4 v3, 0x0

    const/high16 v4, 0x43b40000    # 360.0f

    invoke-direct {v1, v3, v4}, Landroid/graphics/drawable/shapes/ArcShape;-><init>(FF)V

    .line 117
    .local v1, "shape":Landroid/graphics/drawable/shapes/Shape;
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 118
    .local v0, "bg":Landroid/graphics/drawable/ShapeDrawable;
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v3

    iget-object v4, p0, Lorg/dmfs/android/colorpicker/PaletteGridAdapter;->mPalette:Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-virtual {v4, p1}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 120
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-ge v3, v4, :cond_30

    .line 122
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 129
    :goto_2f
    return-object v2

    .line 126
    :cond_30
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2f
.end method
