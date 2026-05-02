.class public Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;
.super Ljava/lang/Object;
.source "PkgInt.java"


# static fields
.field public static final BIT_SHIFT_16BITS:I = 0x4

.field public static final BIT_SHIFT_4BITS:I = 0x2

.field public static final BIT_SHIFT_8BITS:I = 0x3

.field public static final INDEX_SHIFT_16BITS:I = 0x1

.field public static final INDEX_SHIFT_4BITS:I = 0x3

.field public static final INDEX_SHIFT_8BITS:I = 0x2

.field public static final SHIFT_MASK_16BITS:I = 0x1

.field public static final SHIFT_MASK_4BITS:I = 0x7

.field public static final SHIFT_MASK_8BITS:I = 0x3

.field public static final UNIT_MASK_16BITS:I = 0xffff

.field public static final UNIT_MASK_4BITS:I = 0xf

.field public static final UNIT_MASK_8BITS:I = 0xff


# instance fields
.field private bitShift:I

.field private data:[I

.field private indexShift:I

.field private shiftMask:I

.field private unitMask:I


# direct methods
.method public constructor <init>(IIII[I)V
    .registers 6
    .param p1, "indexShift"    # I
    .param p2, "shiftMask"    # I
    .param p3, "bitShift"    # I
    .param p4, "unitMask"    # I
    .param p5, "data"    # [I

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput p1, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->indexShift:I

    .line 83
    iput p2, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->shiftMask:I

    .line 84
    iput p3, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->bitShift:I

    .line 85
    iput p4, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->unitMask:I

    .line 86
    iput-object p5, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->data:[I

    .line 87
    return-void
.end method

.method public static pack16bits(II)I
    .registers 3
    .param p0, "a"    # I
    .param p1, "b"    # I

    .prologue
    .line 91
    shl-int/lit8 v0, p1, 0x10

    or-int/2addr v0, p0

    return v0
.end method

.method public static pack4bits(IIIIIIII)I
    .registers 12
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I
    .param p3, "d"    # I
    .param p4, "e"    # I
    .param p5, "f"    # I
    .param p6, "g"    # I
    .param p7, "h"    # I

    .prologue
    .line 104
    shl-int/lit8 v0, p1, 0x4

    or-int/2addr v0, p0

    shl-int/lit8 v1, p3, 0x4

    or-int/2addr v1, p2

    shl-int/lit8 v2, p5, 0x4

    or-int/2addr v2, p4

    shl-int/lit8 v3, p7, 0x4

    or-int/2addr v3, p6

    invoke-static {v0, v1, v2, v3}, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->pack8bits(IIII)I

    move-result v0

    return v0
.end method

.method public static pack8bits(IIII)I
    .registers 6
    .param p0, "a"    # I
    .param p1, "b"    # I
    .param p2, "c"    # I
    .param p3, "d"    # I

    .prologue
    .line 96
    shl-int/lit8 v0, p1, 0x8

    or-int/2addr v0, p0

    shl-int/lit8 v1, p3, 0x8

    or-int/2addr v1, p2

    invoke-static {v0, v1}, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->pack16bits(II)I

    move-result v0

    return v0
.end method


# virtual methods
.method public unpack(I)I
    .registers 5
    .param p1, "i"    # I

    .prologue
    .line 114
    iget-object v0, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->data:[I

    iget v1, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->indexShift:I

    shr-int v1, p1, v1

    aget v0, v0, v1

    iget v1, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->shiftMask:I

    and-int/2addr v1, p1

    iget v2, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->bitShift:I

    shl-int/2addr v1, v2

    shr-int/2addr v0, v1

    iget v1, p0, Lorg/mozilla/universalchardet/prober/statemachine/PkgInt;->unitMask:I

    and-int/2addr v0, v1

    return v0
.end method
