.class Ljavassist/bytecode/CodeIterator$If16;
.super Ljavassist/bytecode/CodeIterator$Branch16;
.source "CodeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/CodeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "If16"
.end annotation


# direct methods
.method constructor <init>(II)V
    .registers 3
    .param p1, "p"    # I
    .param p2, "off"    # I

    .prologue
    .line 1421
    invoke-direct {p0, p1, p2}, Ljavassist/bytecode/CodeIterator$Branch16;-><init>(II)V

    .line 1422
    return-void
.end method


# virtual methods
.method deltaSize()I
    .registers 3

    .prologue
    .line 1425
    iget v0, p0, Ljavassist/bytecode/CodeIterator$If16;->state:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_7

    const/4 v0, 0x5

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method opcode(I)I
    .registers 4
    .param p1, "op"    # I

    .prologue
    const/16 v0, 0xc7

    const/16 v1, 0xc6

    .line 1437
    if-ne p1, v1, :cond_7

    .line 1445
    :goto_6
    return v0

    .line 1439
    :cond_7
    if-ne p1, v0, :cond_b

    move v0, v1

    .line 1440
    goto :goto_6

    .line 1442
    :cond_b
    add-int/lit16 v0, p1, -0x99

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_14

    .line 1443
    add-int/lit8 v0, p1, 0x1

    goto :goto_6

    .line 1445
    :cond_14
    add-int/lit8 v0, p1, -0x1

    goto :goto_6
.end method

.method write32(I[BI[B)V
    .registers 7
    .param p1, "src"    # I
    .param p2, "code"    # [B
    .param p3, "dest"    # I
    .param p4, "newcode"    # [B

    .prologue
    .line 1429
    aget-byte v0, p2, p1

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p0, v0}, Ljavassist/bytecode/CodeIterator$If16;->opcode(I)I

    move-result v0

    int-to-byte v0, v0

    aput-byte v0, p4, p3

    .line 1430
    add-int/lit8 v0, p3, 0x1

    const/4 v1, 0x0

    aput-byte v1, p4, v0

    .line 1431
    add-int/lit8 v0, p3, 0x2

    const/16 v1, 0x8

    aput-byte v1, p4, v0

    .line 1432
    add-int/lit8 v0, p3, 0x3

    const/16 v1, -0x38

    aput-byte v1, p4, v0

    .line 1433
    iget v0, p0, Ljavassist/bytecode/CodeIterator$If16;->offset:I

    add-int/lit8 v0, v0, -0x3

    add-int/lit8 v1, p3, 0x4

    invoke-static {v0, p4, v1}, Ljavassist/bytecode/ByteArray;->write32bit(I[BI)V

    .line 1434
    return-void
.end method
