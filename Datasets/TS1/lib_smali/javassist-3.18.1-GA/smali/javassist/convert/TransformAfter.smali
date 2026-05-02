.class public Ljavassist/convert/TransformAfter;
.super Ljavassist/convert/TransformBefore;
.source "TransformAfter.java"


# direct methods
.method public constructor <init>(Ljavassist/convert/Transformer;Ljavassist/CtMethod;Ljavassist/CtMethod;)V
    .registers 4
    .param p1, "next"    # Ljavassist/convert/Transformer;
    .param p2, "origMethod"    # Ljavassist/CtMethod;
    .param p3, "afterMethod"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Ljavassist/convert/TransformBefore;-><init>(Ljavassist/convert/Transformer;Ljavassist/CtMethod;Ljavassist/CtMethod;)V

    .line 29
    return-void
.end method


# virtual methods
.method protected match2(ILjavassist/bytecode/CodeIterator;)I
    .registers 6
    .param p1, "pos"    # I
    .param p2, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 32
    invoke-virtual {p2, p1}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 33
    iget-object v1, p0, Ljavassist/convert/TransformAfter;->saveCode:[B

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->insert([B)I

    .line 34
    iget-object v1, p0, Ljavassist/convert/TransformAfter;->loadCode:[B

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->insert([B)I

    .line 35
    const/4 v1, 0x3

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->insertGap(I)I

    move-result v0

    .line 36
    .local v0, "p":I
    invoke-virtual {p2, v0}, Ljavassist/bytecode/CodeIterator;->setMark(I)V

    .line 37
    iget-object v1, p0, Ljavassist/convert/TransformAfter;->loadCode:[B

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->insert([B)I

    .line 38
    invoke-virtual {p2}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result p1

    .line 39
    invoke-virtual {p2}, Ljavassist/bytecode/CodeIterator;->getMark()I

    move-result v0

    .line 40
    invoke-virtual {p2, p1}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v1

    invoke-virtual {p2, v1, v0}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 41
    add-int/lit8 v1, p1, 0x1

    invoke-virtual {p2, v1}, Ljavassist/bytecode/CodeIterator;->u16bitAt(I)I

    move-result v1

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p2, v1, v2}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 42
    const/16 v1, 0xb8

    invoke-virtual {p2, v1, p1}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 43
    iget v1, p0, Ljavassist/convert/TransformAfter;->newIndex:I

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p2, v1, v2}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 44
    invoke-virtual {p2, v0}, Ljavassist/bytecode/CodeIterator;->move(I)V

    .line 45
    invoke-virtual {p2}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v1

    return v1
.end method
