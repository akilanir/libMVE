.class public final enum Lcom/drew/imaging/png/PngColorType;
.super Ljava/lang/Enum;
.source "PngColorType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/drew/imaging/png/PngColorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/drew/imaging/png/PngColorType;

.field public static final enum Greyscale:Lcom/drew/imaging/png/PngColorType;

.field public static final enum GreyscaleWithAlpha:Lcom/drew/imaging/png/PngColorType;

.field public static final enum IndexedColor:Lcom/drew/imaging/png/PngColorType;

.field public static final enum TrueColor:Lcom/drew/imaging/png/PngColorType;

.field public static final enum TrueColorWithAlpha:Lcom/drew/imaging/png/PngColorType;


# instance fields
.field private final _allowedBitDepths:[I
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private final _description:Ljava/lang/String;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private final _numericValue:I


# direct methods
.method static constructor <clinit>()V
    .registers 16

    .prologue
    const/4 v15, 0x1

    const/4 v14, 0x3

    const/4 v2, 0x0

    const/4 v10, 0x4

    const/4 v6, 0x2

    .line 34
    new-instance v0, Lcom/drew/imaging/png/PngColorType;

    const-string v1, "Greyscale"

    const-string v4, "Greyscale"

    const/4 v3, 0x5

    new-array v5, v3, [I

    fill-array-data v5, :array_76

    move v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/drew/imaging/png/PngColorType;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v0, Lcom/drew/imaging/png/PngColorType;->Greyscale:Lcom/drew/imaging/png/PngColorType;

    .line 39
    new-instance v3, Lcom/drew/imaging/png/PngColorType;

    const-string v4, "TrueColor"

    const-string v7, "True Color"

    new-array v8, v6, [I

    fill-array-data v8, :array_84

    move v5, v15

    invoke-direct/range {v3 .. v8}, Lcom/drew/imaging/png/PngColorType;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v3, Lcom/drew/imaging/png/PngColorType;->TrueColor:Lcom/drew/imaging/png/PngColorType;

    .line 44
    new-instance v4, Lcom/drew/imaging/png/PngColorType;

    const-string v5, "IndexedColor"

    const-string v8, "Indexed Color"

    new-array v9, v10, [I

    fill-array-data v9, :array_8c

    move v7, v14

    invoke-direct/range {v4 .. v9}, Lcom/drew/imaging/png/PngColorType;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v4, Lcom/drew/imaging/png/PngColorType;->IndexedColor:Lcom/drew/imaging/png/PngColorType;

    .line 49
    new-instance v7, Lcom/drew/imaging/png/PngColorType;

    const-string v8, "GreyscaleWithAlpha"

    const-string v11, "Greyscale with Alpha"

    new-array v12, v6, [I

    fill-array-data v12, :array_98

    move v9, v14

    invoke-direct/range {v7 .. v12}, Lcom/drew/imaging/png/PngColorType;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v7, Lcom/drew/imaging/png/PngColorType;->GreyscaleWithAlpha:Lcom/drew/imaging/png/PngColorType;

    .line 54
    new-instance v8, Lcom/drew/imaging/png/PngColorType;

    const-string v9, "TrueColorWithAlpha"

    const/4 v11, 0x6

    const-string v12, "True Color with Alpha"

    new-array v13, v6, [I

    fill-array-data v13, :array_a0

    invoke-direct/range {v8 .. v13}, Lcom/drew/imaging/png/PngColorType;-><init>(Ljava/lang/String;IILjava/lang/String;[I)V

    sput-object v8, Lcom/drew/imaging/png/PngColorType;->TrueColorWithAlpha:Lcom/drew/imaging/png/PngColorType;

    .line 29
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/drew/imaging/png/PngColorType;

    sget-object v1, Lcom/drew/imaging/png/PngColorType;->Greyscale:Lcom/drew/imaging/png/PngColorType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/drew/imaging/png/PngColorType;->TrueColor:Lcom/drew/imaging/png/PngColorType;

    aput-object v1, v0, v15

    sget-object v1, Lcom/drew/imaging/png/PngColorType;->IndexedColor:Lcom/drew/imaging/png/PngColorType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/drew/imaging/png/PngColorType;->GreyscaleWithAlpha:Lcom/drew/imaging/png/PngColorType;

    aput-object v1, v0, v14

    sget-object v1, Lcom/drew/imaging/png/PngColorType;->TrueColorWithAlpha:Lcom/drew/imaging/png/PngColorType;

    aput-object v1, v0, v10

    sput-object v0, Lcom/drew/imaging/png/PngColorType;->$VALUES:[Lcom/drew/imaging/png/PngColorType;

    return-void

    .line 34
    nop

    :array_76
    .array-data 4
        0x1
        0x2
        0x4
        0x8
        0x10
    .end array-data

    .line 39
    :array_84
    .array-data 4
        0x8
        0x10
    .end array-data

    .line 44
    :array_8c
    .array-data 4
        0x1
        0x2
        0x4
        0x8
    .end array-data

    .line 49
    :array_98
    .array-data 4
        0x8
        0x10
    .end array-data

    .line 54
    :array_a0
    .array-data 4
        0x8
        0x10
    .end array-data
.end method

.method private varargs constructor <init>(Ljava/lang/String;IILjava/lang/String;[I)V
    .registers 6
    .param p2    # I
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p3, "numericValue"    # I
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p4, "description"    # Ljava/lang/String;
    .param p5, "allowedBitDepths"    # [I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "[I)V"
        }
    .end annotation

    .prologue
    .line 73
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 74
    iput p3, p0, Lcom/drew/imaging/png/PngColorType;->_numericValue:I

    .line 75
    iput-object p4, p0, Lcom/drew/imaging/png/PngColorType;->_description:Ljava/lang/String;

    .line 76
    iput-object p5, p0, Lcom/drew/imaging/png/PngColorType;->_allowedBitDepths:[I

    .line 77
    return-void
.end method

.method public static fromNumericValue(I)Lcom/drew/imaging/png/PngColorType;
    .registers 7
    .param p0, "numericValue"    # I
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .prologue
    .line 59
    const-class v5, Lcom/drew/imaging/png/PngColorType;

    invoke-virtual {v5}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/drew/imaging/png/PngColorType;

    .line 60
    .local v2, "colorTypes":[Lcom/drew/imaging/png/PngColorType;
    move-object v0, v2

    .local v0, "arr$":[Lcom/drew/imaging/png/PngColorType;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_b
    if-ge v3, v4, :cond_19

    aget-object v1, v0, v3

    .line 61
    .local v1, "colorType":Lcom/drew/imaging/png/PngColorType;
    invoke-virtual {v1}, Lcom/drew/imaging/png/PngColorType;->getNumericValue()I

    move-result v5

    if-ne v5, p0, :cond_16

    .line 65
    .end local v1    # "colorType":Lcom/drew/imaging/png/PngColorType;
    :goto_15
    return-object v1

    .line 60
    .restart local v1    # "colorType":Lcom/drew/imaging/png/PngColorType;
    :cond_16
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 65
    .end local v1    # "colorType":Lcom/drew/imaging/png/PngColorType;
    :cond_19
    const/4 v1, 0x0

    goto :goto_15
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/drew/imaging/png/PngColorType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/drew/imaging/png/PngColorType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/drew/imaging/png/PngColorType;

    return-object v0
.end method

.method public static values()[Lcom/drew/imaging/png/PngColorType;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lcom/drew/imaging/png/PngColorType;->$VALUES:[Lcom/drew/imaging/png/PngColorType;

    invoke-virtual {v0}, [Lcom/drew/imaging/png/PngColorType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/drew/imaging/png/PngColorType;

    return-object v0
.end method


# virtual methods
.method public getAllowedBitDepths()[I
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 93
    iget-object v0, p0, Lcom/drew/imaging/png/PngColorType;->_allowedBitDepths:[I

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lcom/drew/imaging/png/PngColorType;->_description:Ljava/lang/String;

    return-object v0
.end method

.method public getNumericValue()I
    .registers 2

    .prologue
    .line 81
    iget v0, p0, Lcom/drew/imaging/png/PngColorType;->_numericValue:I

    return v0
.end method
