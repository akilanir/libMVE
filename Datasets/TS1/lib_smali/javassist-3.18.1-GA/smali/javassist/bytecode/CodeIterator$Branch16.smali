.class abstract Ljavassist/bytecode/CodeIterator$Branch16;
.super Ljavassist/bytecode/CodeIterator$Branch;
.source "CodeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/CodeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Branch16"
.end annotation


# static fields
.field static final BIT16:I = 0x0

.field static final BIT32:I = 0x2

.field static final EXPAND:I = 0x1


# instance fields
.field offset:I

.field state:I


# direct methods
.method constructor <init>(II)V
    .registers 4
    .param p1, "p"    # I
    .param p2, "off"    # I

    .prologue
    .line 1365
    invoke-direct {p0, p1}, Ljavassist/bytecode/CodeIterator$Branch;-><init>(I)V

    .line 1366
    iput p2, p0, Ljavassist/bytecode/CodeIterator$Branch16;->offset:I

    .line 1367
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/CodeIterator$Branch16;->state:I

    .line 1368
    return-void
.end method


# virtual methods
.method abstract deltaSize()I
.end method

.method expanded()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 1379
    iget v1, p0, Ljavassist/bytecode/CodeIterator$Branch16;->state:I

    if-ne v1, v0, :cond_9

    .line 1380
    const/4 v1, 0x2

    iput v1, p0, Ljavassist/bytecode/CodeIterator$Branch16;->state:I

    .line 1384
    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method shift(IIZ)V
    .registers 6
    .param p1, "where"    # I
    .param p2, "gapLength"    # I
    .param p3, "exclusive"    # Z

    .prologue
    .line 1371
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Branch16;->pos:I

    iget v1, p0, Ljavassist/bytecode/CodeIterator$Branch16;->offset:I

    invoke-static {v0, v1, p1, p2, p3}, Ljavassist/bytecode/CodeIterator$Branch16;->shiftOffset(IIIIZ)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/CodeIterator$Branch16;->offset:I

    .line 1372
    invoke-super {p0, p1, p2, p3}, Ljavassist/bytecode/CodeIterator$Branch;->shift(IIZ)V

    .line 1373
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Branch16;->state:I

    if-nez v0, :cond_20

    .line 1374
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Branch16;->offset:I

    const/16 v1, -0x8000

    if-lt v0, v1, :cond_1d

    const/16 v0, 0x7fff

    iget v1, p0, Ljavassist/bytecode/CodeIterator$Branch16;->offset:I

    if-ge v0, v1, :cond_20

    .line 1375
    :cond_1d
    const/4 v0, 0x1

    iput v0, p0, Ljavassist/bytecode/CodeIterator$Branch16;->state:I

    .line 1376
    :cond_20
    return-void
.end method

.method write(I[BI[B)I
    .registers 7
    .param p1, "src"    # I
    .param p2, "code"    # [B
    .param p3, "dest"    # I
    .param p4, "newcode"    # [B

    .prologue
    .line 1391
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Branch16;->state:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_a

    .line 1392
    invoke-virtual {p0, p1, p2, p3, p4}, Ljavassist/bytecode/CodeIterator$Branch16;->write32(I[BI[B)V

    .line 1398
    :goto_8
    const/4 v0, 0x3

    return v0

    .line 1394
    :cond_a
    aget-byte v0, p2, p1

    aput-byte v0, p4, p3

    .line 1395
    iget v0, p0, Ljavassist/bytecode/CodeIterator$Branch16;->offset:I

    add-int/lit8 v1, p3, 0x1

    invoke-static {v0, p4, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    goto :goto_8
.end method

.method abstract write32(I[BI[B)V
.end method
