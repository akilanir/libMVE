.class public Lorg/dmfs/android/colorpicker/palettes/RandomPalette;
.super Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
.source "RandomPalette.java"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/dmfs/android/colorpicker/palettes/RandomPalette;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mName:Ljava/lang/String;

.field private mPaletteId:Ljava/lang/String;

.field private mValues:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 172
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette$1;

    invoke-direct {v0}, Lorg/dmfs/android/colorpicker/palettes/RandomPalette$1;-><init>()V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->CREATOR:Landroid/os/Parcelable$Creator;

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

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 11
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "count"    # I

    .prologue
    .line 67
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;-><init>()V

    .line 68
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mPaletteId:Ljava/lang/String;

    .line 69
    iput-object p2, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mName:Ljava/lang/String;

    .line 70
    new-array v1, p3, [I

    .line 71
    .local v1, "values":[I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, p3, :cond_1c

    .line 73
    const/high16 v2, -0x1000000

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v3

    const-wide/high16 v5, 0x4170000000000000L    # 1.6777216E7

    mul-double/2addr v3, v5

    double-to-int v3, v3

    or-int/2addr v2, v3

    aput v2, v1, v0

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 75
    :cond_1c
    iput-object v1, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mValues:[I

    .line 76
    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/colorpicker/palettes/RandomPalette$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/dmfs/android/colorpicker/palettes/RandomPalette$1;

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;-><init>()V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 154
    const/4 v0, 0x0

    return v0
.end method

.method public getColor(I)I
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 123
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mValues:[I

    aget v0, v0, p1

    return v0
.end method

.method public getColorName(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 135
    const/4 v0, 0x0

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mPaletteId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getNumberOfColors()I
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mValues:[I

    array-length v0, v0

    return v0
.end method

.method public getNumberOfColumns()I
    .registers 3

    .prologue
    .line 147
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mValues:[I

    array-length v0, v0

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    return v0
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 168
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mName:Ljava/lang/String;

    .line 169
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mValues:[I

    .line 170
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 161
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 162
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/RandomPalette;->mValues:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 163
    return-void
.end method
