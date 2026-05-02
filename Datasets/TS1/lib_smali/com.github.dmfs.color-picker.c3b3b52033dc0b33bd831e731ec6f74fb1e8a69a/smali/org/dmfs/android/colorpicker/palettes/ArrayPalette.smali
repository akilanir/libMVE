.class public Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
.super Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;
.source "ArrayPalette.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mColorNames:[Ljava/lang/String;

.field private mColors:[I

.field private mColumns:I

.field private mPaletteId:Ljava/lang/String;

.field private mPaletteName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 371
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette$1;

    invoke-direct {v0}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette$1;-><init>()V

    sput-object v0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 191
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;-><init>()V

    .line 192
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[I)V
    .registers 10
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # Ljava/lang/String;
    .param p3, "colors"    # [I

    .prologue
    .line 267
    array-length v0, p3

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;-><init>(Ljava/lang/String;Ljava/lang/String;[II[Ljava/lang/String;)V

    .line 268
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[II)V
    .registers 11
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # Ljava/lang/String;
    .param p3, "colors"    # [I
    .param p4, "columns"    # I

    .prologue
    .line 251
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;-><init>(Ljava/lang/String;Ljava/lang/String;[II[Ljava/lang/String;)V

    .line 252
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[II[Ljava/lang/String;)V
    .registers 6
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # Ljava/lang/String;
    .param p3, "colors"    # [I
    .param p4, "columns"    # I
    .param p5, "names"    # [Ljava/lang/String;

    .prologue
    .line 210
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/palettes/AbstractPalette;-><init>()V

    .line 211
    iput-object p1, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mPaletteId:Ljava/lang/String;

    .line 212
    iput-object p2, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mPaletteName:Ljava/lang/String;

    .line 213
    iput-object p3, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColors:[I

    .line 214
    iput-object p5, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColorNames:[Ljava/lang/String;

    .line 215
    iput p4, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColumns:I

    .line 216
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;[I[Ljava/lang/String;)V
    .registers 11
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # Ljava/lang/String;
    .param p3, "colors"    # [I
    .param p4, "names"    # [Ljava/lang/String;

    .prologue
    .line 233
    array-length v0, p3

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v4, v0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;-><init>(Ljava/lang/String;Ljava/lang/String;[II[Ljava/lang/String;)V

    .line 234
    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/colorpicker/palettes/ArrayPalette$1;)V
    .registers 2
    .param p1, "x0"    # Lorg/dmfs/android/colorpicker/palettes/ArrayPalette$1;

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;-><init>()V

    return-void
.end method

.method public static fromResources(Landroid/content/Context;Ljava/lang/String;II)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # I
    .param p3, "colorArray"    # I

    .prologue
    .line 183
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, p1, p2, p3}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->fromResources(Landroid/content/res/Resources;Ljava/lang/String;II)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    move-result-object v0

    return-object v0
.end method

.method public static fromResources(Landroid/content/Context;Ljava/lang/String;III)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # I
    .param p3, "colorArray"    # I
    .param p4, "colorNameArray"    # I

    .prologue
    .line 164
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, p1, p2, p3, p4}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->fromResources(Landroid/content/res/Resources;Ljava/lang/String;III)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    move-result-object v0

    return-object v0
.end method

.method public static fromResources(Landroid/content/Context;Ljava/lang/String;IIII)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
    .registers 12
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # I
    .param p3, "colorArray"    # I
    .param p4, "columns"    # I
    .param p5, "colorNameArray"    # I

    .prologue
    .line 143
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->fromResources(Landroid/content/res/Resources;Ljava/lang/String;IIII)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    move-result-object v0

    return-object v0
.end method

.method public static fromResources(Landroid/content/res/Resources;Ljava/lang/String;II)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
    .registers 7
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # I
    .param p3, "colorArray"    # I

    .prologue
    .line 120
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v2

    invoke-direct {v0, p1, v1, v2}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;-><init>(Ljava/lang/String;Ljava/lang/String;[I)V

    return-object v0
.end method

.method public static fromResources(Landroid/content/res/Resources;Ljava/lang/String;III)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
    .registers 9
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # I
    .param p3, "colorArray"    # I
    .param p4, "colorNameArray"    # I

    .prologue
    .line 101
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v2

    invoke-virtual {p0, p4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, p1, v1, v2, v3}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;-><init>(Ljava/lang/String;Ljava/lang/String;[I[Ljava/lang/String;)V

    return-object v0
.end method

.method public static fromResources(Landroid/content/res/Resources;Ljava/lang/String;IIII)Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;
    .registers 12
    .param p0, "resources"    # Landroid/content/res/Resources;
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "paletteName"    # I
    .param p3, "colorArray"    # I
    .param p4, "columns"    # I
    .param p5, "colorNameArray"    # I

    .prologue
    .line 80
    new-instance v0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v3

    invoke-virtual {p0, p5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v5

    move-object v1, p1

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;-><init>(Ljava/lang/String;Ljava/lang/String;[II[Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 349
    const/4 v0, 0x0

    return v0
.end method

.method public getColor(I)I
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 315
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColors:[I

    aget v0, v0, p1

    return v0
.end method

.method public getColorName(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 327
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColorNames:[Ljava/lang/String;

    if-eqz v0, :cond_9

    .line 329
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColorNames:[Ljava/lang/String;

    aget-object v0, v0, p1

    .line 331
    :goto_8
    return-object v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 291
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mPaletteId:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 279
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mPaletteName:Ljava/lang/String;

    return-object v0
.end method

.method public getNumberOfColors()I
    .registers 2

    .prologue
    .line 303
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColors:[I

    array-length v0, v0

    return v0
.end method

.method public getNumberOfColumns()I
    .registers 2

    .prologue
    .line 342
    iget v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColumns:I

    return v0
.end method

.method public readFromParcel(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 365
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mPaletteName:Ljava/lang/String;

    .line 366
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColors:[I

    .line 367
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColorNames:[Ljava/lang/String;

    .line 368
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColumns:I

    .line 369
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 356
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mPaletteName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 357
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColors:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 358
    iget-object v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColorNames:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 359
    iget v0, p0, Lorg/dmfs/android/colorpicker/palettes/ArrayPalette;->mColumns:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 360
    return-void
.end method
