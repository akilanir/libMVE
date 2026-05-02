.class public Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;
.super Landroid/support/v4/app/FragmentStatePagerAdapter;
.source "PalettesPagerAdapter.java"

# interfaces
.implements Lorg/dmfs/android/view/IDrawableTitlePagerAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;
    }
.end annotation


# static fields
.field private static final FACTOR:I = 0x64

.field private static final PREVIEW_SIZE:I = 0x20


# instance fields
.field private final mCache:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;

.field private final mDensity:F

.field private mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

.field private final mResources:Landroid/content/res/Resources;


# direct methods
.method public varargs constructor <init>(Landroid/content/res/Resources;Landroid/support/v4/app/FragmentManager;[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;)V
    .registers 6
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "fm"    # Landroid/support/v4/app/FragmentManager;
    .param p3, "palettes"    # [Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    .prologue
    .line 55
    invoke-direct {p0, p2}, Landroid/support/v4/app/FragmentStatePagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    .line 50
    new-instance v0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;-><init>(Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;I)V

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mCache:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;

    .line 56
    iput-object p3, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    .line 57
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mResources:Landroid/content/res/Resources;

    .line 58
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    iput v0, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mDensity:F

    .line 59
    return-void
.end method

.method static synthetic access$000(Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;)[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
    .registers 2
    .param p0, "x0"    # Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    return-object v0
.end method

.method static synthetic access$100(Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;)F
    .registers 2
    .param p0, "x0"    # Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    .prologue
    .line 41
    iget v0, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mDensity:F

    return v0
.end method

.method static synthetic access$200(Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;)Landroid/content/res/Resources;
    .registers 2
    .param p0, "x0"    # Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mResources:Landroid/content/res/Resources;

    return-object v0
.end method

.method private mapPosition(I)I
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 109
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    array-length v0, v0

    rem-int v0, p1, v0

    return v0
.end method


# virtual methods
.method public getCount()I
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 84
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    array-length v1, v1

    if-le v1, v0, :cond_b

    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x64

    :cond_b
    return v0
.end method

.method public getDrawableTitle(I)Landroid/graphics/drawable/Drawable;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 116
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mCache:Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;

    invoke-direct {p0, p1}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mapPosition(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter$PreviewCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .registers 5
    .param p1, "position"    # I

    .prologue
    .line 70
    new-instance v0, Lorg/dmfs/android/colorpicker/PaletteFragment;

    invoke-direct {v0}, Lorg/dmfs/android/colorpicker/PaletteFragment;-><init>()V

    .line 71
    .local v0, "fragment":Lorg/dmfs/android/colorpicker/PaletteFragment;
    iget-object v1, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-direct {p0, p1}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mapPosition(I)I

    move-result v2

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Lorg/dmfs/android/colorpicker/PaletteFragment;->setPalette(Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;)V

    .line 72
    return-object v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 96
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mPalettes:[Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;

    invoke-direct {p0, p1}, Lorg/dmfs/android/colorpicker/PalettesPagerAdapter;->mapPosition(I)I

    move-result v1

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
