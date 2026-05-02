.class Ljavassist/bytecode/CodeIterator$LdcW;
.super Ljavassist/bytecode/CodeIterator$Branch;
.source "CodeIterator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/CodeIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LdcW"
.end annotation


# instance fields
.field index:I

.field state:Z


# direct methods
.method constructor <init>(II)V
    .registers 4
    .param p1, "p"    # I
    .param p2, "i"    # I

    .prologue
    .line 1334
    invoke-direct {p0, p1}, Ljavassist/bytecode/CodeIterator$Branch;-><init>(I)V

    .line 1335
    iput p2, p0, Ljavassist/bytecode/CodeIterator$LdcW;->index:I

    .line 1336
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljavassist/bytecode/CodeIterator$LdcW;->state:Z

    .line 1337
    return-void
.end method


# virtual methods
.method deltaSize()I
    .registers 2

    .prologue
    .line 1348
    const/4 v0, 0x1

    return v0
.end method

.method expanded()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 1340
    iget-boolean v1, p0, Ljavassist/bytecode/CodeIterator$LdcW;->state:Z

    if-eqz v1, :cond_8

    .line 1341
    iput-boolean v0, p0, Ljavassist/bytecode/CodeIterator$LdcW;->state:Z

    .line 1342
    const/4 v0, 0x1

    .line 1345
    :cond_8
    return v0
.end method

.method write(I[BI[B)I
    .registers 7
    .param p1, "srcPos"    # I
    .param p2, "code"    # [B
    .param p3, "destPos"    # I
    .param p4, "newcode"    # [B

    .prologue
    .line 1351
    const/16 v0, 0x13

    aput-byte v0, p4, p3

    .line 1352
    iget v0, p0, Ljavassist/bytecode/CodeIterator$LdcW;->index:I

    add-int/lit8 v1, p3, 0x1

    invoke-static {v0, p4, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 1353
    const/4 v0, 0x2

    return v0
.end method
