.class Ljavassist/bytecode/StackMap$InsertLocal;
.super Ljavassist/bytecode/StackMap$SimpleCopy;
.source "StackMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/StackMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "InsertLocal"
.end annotation


# instance fields
.field private varData:I

.field private varIndex:I

.field private varTag:I


# direct methods
.method constructor <init>(Ljavassist/bytecode/StackMap;III)V
    .registers 5
    .param p1, "map"    # Ljavassist/bytecode/StackMap;
    .param p2, "varIndex"    # I
    .param p3, "varTag"    # I
    .param p4, "varData"    # I

    .prologue
    .line 342
    invoke-direct {p0, p1}, Ljavassist/bytecode/StackMap$SimpleCopy;-><init>(Ljavassist/bytecode/StackMap;)V

    .line 343
    iput p2, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varIndex:I

    .line 344
    iput p3, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varTag:I

    .line 345
    iput p4, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varData:I

    .line 346
    return-void
.end method

.method private writeVarTypeInfo()V
    .registers 5

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x7

    .line 367
    iget v0, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varTag:I

    if-ne v0, v2, :cond_f

    .line 368
    iget-object v0, p0, Ljavassist/bytecode/StackMap$InsertLocal;->writer:Ljavassist/bytecode/StackMap$Writer;

    iget v1, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varData:I

    invoke-virtual {v0, v2, v1}, Ljavassist/bytecode/StackMap$Writer;->writeVerifyTypeInfo(II)V

    .line 373
    :goto_e
    return-void

    .line 369
    :cond_f
    iget v0, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varTag:I

    if-ne v0, v3, :cond_1b

    .line 370
    iget-object v0, p0, Ljavassist/bytecode/StackMap$InsertLocal;->writer:Ljavassist/bytecode/StackMap$Writer;

    iget v1, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varData:I

    invoke-virtual {v0, v3, v1}, Ljavassist/bytecode/StackMap$Writer;->writeVerifyTypeInfo(II)V

    goto :goto_e

    .line 372
    :cond_1b
    iget-object v0, p0, Ljavassist/bytecode/StackMap$InsertLocal;->writer:Ljavassist/bytecode/StackMap$Writer;

    iget v1, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varTag:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljavassist/bytecode/StackMap$Writer;->writeVerifyTypeInfo(II)V

    goto :goto_e
.end method


# virtual methods
.method public typeInfoArray(IIIZ)I
    .registers 8
    .param p1, "pos"    # I
    .param p2, "offset"    # I
    .param p3, "num"    # I
    .param p4, "isLocals"    # Z

    .prologue
    .line 349
    if-eqz p4, :cond_6

    iget v1, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varIndex:I

    if-ge p3, v1, :cond_b

    .line 350
    :cond_6
    invoke-super {p0, p1, p2, p3, p4}, Ljavassist/bytecode/StackMap$SimpleCopy;->typeInfoArray(IIIZ)I

    move-result v1

    .line 363
    :goto_a
    return v1

    .line 352
    :cond_b
    iget-object v1, p0, Ljavassist/bytecode/StackMap$InsertLocal;->writer:Ljavassist/bytecode/StackMap$Writer;

    add-int/lit8 v2, p3, 0x1

    invoke-virtual {v1, v2}, Ljavassist/bytecode/StackMap$Writer;->write16bit(I)V

    .line 353
    const/4 v0, 0x0

    .local v0, "k":I
    :goto_13
    if-ge v0, p3, :cond_23

    .line 354
    iget v1, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varIndex:I

    if-ne v0, v1, :cond_1c

    .line 355
    invoke-direct {p0}, Ljavassist/bytecode/StackMap$InsertLocal;->writeVarTypeInfo()V

    .line 357
    :cond_1c
    invoke-virtual {p0, v0, p1}, Ljavassist/bytecode/StackMap$InsertLocal;->typeInfoArray2(II)I

    move-result p1

    .line 353
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 360
    :cond_23
    iget v1, p0, Ljavassist/bytecode/StackMap$InsertLocal;->varIndex:I

    if-ne p3, v1, :cond_2a

    .line 361
    invoke-direct {p0}, Ljavassist/bytecode/StackMap$InsertLocal;->writeVarTypeInfo()V

    :cond_2a
    move v1, p1

    .line 363
    goto :goto_a
.end method
