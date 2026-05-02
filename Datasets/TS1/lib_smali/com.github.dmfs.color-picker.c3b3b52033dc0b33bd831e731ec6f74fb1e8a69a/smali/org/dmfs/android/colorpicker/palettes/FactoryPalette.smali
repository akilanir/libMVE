.class public Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;
.super Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
.source "FactoryPalette.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mColumns:I

.field private mName:Ljava/lang/String;

.field private mPaletteId:Ljava/lang/String;

.field private mValues:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 198
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette$1;

    invoke-direct {v0}, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette$1;-><init>()V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;-><init>()V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/dmfs/android/colorpicker/palettes/ColorFactory;I)V
    .registers 11
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "colorProvider"    # Lorg/dmfs/android/colorpicker/palettes/ColorFactory;
    .param p4, "count"    # I

    .prologue
    .line 99
    int-to-double v0, p4

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v5, v0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/dmfs/android/colorpicker/palettes/ColorFactory;II)V

    .line 100
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/dmfs/android/colorpicker/palettes/ColorFactory;II)V
    .registers 9
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "colorProvider"    # Lorg/dmfs/android/colorpicker/palettes/ColorFactory;
    .param p4, "count"    # I
    .param p5, "columns"    # I

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mPaletteId:Ljava/lang/String;

    .line 74
    iput-object p2, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mName:Ljava/lang/String;

    .line 75
    new-array v1, p4, [I

    .line 76
    .local v1, "values":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, p4, :cond_15

    .line 78
    invoke-interface {p3, v0, p4}, Lorg/dmfs/android/colorpicker/palettes/ColorFactory;->getColor(II)I

    move-result v2

    aput v2, v1, v0

    .line 76
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 80
    :cond_15
    iput-object v1, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mValues:[I

    .line 81
    iput p5, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mColumns:I

    .line 82
    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/colorpicker/palettes/FactoryPalette$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/dmfs/android/colorpicker/palettes/FactoryPalette$1;

    .prologue
    .line 24
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;-><init>()V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 178
    const/4 v0, 0x0

    return v0
.end method

.method public getColor(I)I
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 147
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mValues:[I

    aget v0, v0, p1

    return v0
.end method

.method public getColorName(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 159
    const/4 v0, 0x0

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 123
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mPaletteId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getNumberOfColors()I
    .registers 2

    .prologue
    .line 135
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mValues:[I

    array-length v0, v0

    return v0
.end method

.method public getNumberOfColumns()I
    .registers 2

    .prologue
    .line 171
    iget v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mColumns:I

    return v0
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 193
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mName:Ljava/lang/String;

    .line 194
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mValues:[I

    .line 195
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mColumns:I

    .line 196
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 185
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 186
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mValues:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 187
    iget v0, p0, Lorg/dmfs/android/colorpicker/palettes/FactoryPalette;->mColumns:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 188
    return-void
.end method
