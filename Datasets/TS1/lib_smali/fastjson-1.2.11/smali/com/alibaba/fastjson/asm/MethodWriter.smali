.class public Lcom/alibaba/fastjson/asm/MethodWriter;
.super Ljava/lang/Object;
.source "MethodWriter.java"

# interfaces
.implements Lcom/alibaba/fastjson/asm/MethodVisitor;


# instance fields
.field private access:I

.field private code:Lcom/alibaba/fastjson/asm/ByteVector;

.field final cw:Lcom/alibaba/fastjson/asm/ClassWriter;

.field private final desc:I

.field exceptionCount:I

.field exceptions:[I

.field private maxLocals:I

.field private maxStack:I

.field private final name:I

.field next:Lcom/alibaba/fastjson/asm/MethodWriter;


# direct methods
.method public constructor <init>(Lcom/alibaba/fastjson/asm/ClassWriter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .registers 10
    .param p1, "cw"    # Lcom/alibaba/fastjson/asm/ClassWriter;
    .param p2, "access"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "desc"    # Ljava/lang/String;
    .param p5, "signature"    # Ljava/lang/String;
    .param p6, "exceptions"    # [Ljava/lang/String;

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v1, Lcom/alibaba/fastjson/asm/ByteVector;

    invoke-direct {v1}, Lcom/alibaba/fastjson/asm/ByteVector;-><init>()V

    iput-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    .line 103
    iget-object v1, p1, Lcom/alibaba/fastjson/asm/ClassWriter;->firstMethod:Lcom/alibaba/fastjson/asm/MethodWriter;

    if-nez v1, :cond_44

    .line 104
    iput-object p0, p1, Lcom/alibaba/fastjson/asm/ClassWriter;->firstMethod:Lcom/alibaba/fastjson/asm/MethodWriter;

    .line 108
    :goto_10
    iput-object p0, p1, Lcom/alibaba/fastjson/asm/ClassWriter;->lastMethod:Lcom/alibaba/fastjson/asm/MethodWriter;

    .line 109
    iput-object p1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->cw:Lcom/alibaba/fastjson/asm/ClassWriter;

    .line 110
    iput p2, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->access:I

    .line 111
    invoke-virtual {p1, p3}, Lcom/alibaba/fastjson/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->name:I

    .line 112
    invoke-virtual {p1, p4}, Lcom/alibaba/fastjson/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->desc:I

    .line 114
    if-eqz p6, :cond_49

    array-length v1, p6

    if-lez v1, :cond_49

    .line 115
    array-length v1, p6

    iput v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    .line 116
    iget v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptions:[I

    .line 117
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_31
    iget v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    if-ge v0, v1, :cond_49

    .line 118
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptions:[I

    aget-object v2, p6, v0

    invoke-virtual {p1, v2}, Lcom/alibaba/fastjson/asm/ClassWriter;->newClassItem(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Item;

    move-result-object v2

    iget v2, v2, Lcom/alibaba/fastjson/asm/Item;->index:I

    aput v2, v1, v0

    .line 117
    add-int/lit8 v0, v0, 0x1

    goto :goto_31

    .line 106
    .end local v0    # "i":I
    :cond_44
    iget-object v1, p1, Lcom/alibaba/fastjson/asm/ClassWriter;->lastMethod:Lcom/alibaba/fastjson/asm/MethodWriter;

    iput-object p0, v1, Lcom/alibaba/fastjson/asm/MethodWriter;->next:Lcom/alibaba/fastjson/asm/MethodWriter;

    goto :goto_10

    .line 121
    :cond_49
    return-void
.end method


# virtual methods
.method final getSize()I
    .registers 4

    .prologue
    .line 265
    const/16 v0, 0x8

    .line 266
    .local v0, "size":I
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v1, v1, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    if-lez v1, :cond_18

    .line 267
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->cw:Lcom/alibaba/fastjson/asm/ClassWriter;

    const-string v2, "Code"

    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    .line 268
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v1, v1, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    add-int/lit8 v1, v1, 0x12

    add-int/lit8 v1, v1, 0x0

    add-int/2addr v0, v1

    .line 270
    :cond_18
    iget v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    if-lez v1, :cond_2a

    .line 271
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->cw:Lcom/alibaba/fastjson/asm/ClassWriter;

    const-string v2, "Exceptions"

    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    .line 272
    iget v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    .line 274
    :cond_2a
    return v0
.end method

.method final put(Lcom/alibaba/fastjson/asm/ByteVector;)V
    .registers 10
    .param p1, "out"    # Lcom/alibaba/fastjson/asm/ByteVector;

    .prologue
    const/4 v7, 0x0

    .line 283
    const/high16 v2, 0x60000

    .line 284
    .local v2, "mask":I
    iget v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->access:I

    const v5, -0x60001

    and-int/2addr v4, v5

    invoke-virtual {p1, v4}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    move-result-object v4

    iget v5, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->name:I

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    move-result-object v4

    iget v5, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->desc:I

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 285
    const/4 v0, 0x0

    .line 286
    .local v0, "attributeCount":I
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v4, v4, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    if-lez v4, :cond_21

    .line 287
    add-int/lit8 v0, v0, 0x1

    .line 289
    :cond_21
    iget v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    if-lez v4, :cond_27

    .line 290
    add-int/lit8 v0, v0, 0x1

    .line 293
    :cond_27
    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 294
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v4, v4, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    if-lez v4, :cond_6c

    .line 295
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v4, v4, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    add-int/lit8 v4, v4, 0xc

    add-int/lit8 v3, v4, 0x0

    .line 296
    .local v3, "size":I
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->cw:Lcom/alibaba/fastjson/asm/ClassWriter;

    const-string v5, "Code"

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p1, v4}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/alibaba/fastjson/asm/ByteVector;->putInt(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 297
    iget v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->maxStack:I

    invoke-virtual {p1, v4}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    move-result-object v4

    iget v5, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->maxLocals:I

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 298
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v4, v4, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    invoke-virtual {p1, v4}, Lcom/alibaba/fastjson/asm/ByteVector;->putInt(I)Lcom/alibaba/fastjson/asm/ByteVector;

    move-result-object v4

    iget-object v5, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget-object v5, v5, Lcom/alibaba/fastjson/asm/ByteVector;->data:[B

    iget-object v6, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v6, v6, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    invoke-virtual {v4, v5, v7, v6}, Lcom/alibaba/fastjson/asm/ByteVector;->putByteArray([BII)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 299
    invoke-virtual {p1, v7}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 300
    const/4 v0, 0x0

    .line 301
    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 303
    .end local v3    # "size":I
    :cond_6c
    iget v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    if-lez v4, :cond_99

    .line 304
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->cw:Lcom/alibaba/fastjson/asm/ClassWriter;

    const-string v5, "Exceptions"

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/asm/ClassWriter;->newUTF8(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {p1, v4}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    move-result-object v4

    iget v5, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    mul-int/lit8 v5, v5, 0x2

    add-int/lit8 v5, v5, 0x2

    invoke-virtual {v4, v5}, Lcom/alibaba/fastjson/asm/ByteVector;->putInt(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 305
    iget v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    invoke-virtual {p1, v4}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 306
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8b
    iget v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptionCount:I

    if-ge v1, v4, :cond_99

    .line 307
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->exceptions:[I

    aget v4, v4, v1

    invoke-virtual {p1, v4}, Lcom/alibaba/fastjson/asm/ByteVector;->putShort(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 306
    add-int/lit8 v1, v1, 0x1

    goto :goto_8b

    .line 311
    .end local v1    # "i":I
    :cond_99
    return-void
.end method

.method public visitEnd()V
    .registers 1

    .prologue
    .line 245
    return-void
.end method

.method public visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "opcode"    # I
    .param p2, "owner"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "desc"    # Ljava/lang/String;

    .prologue
    .line 172
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->cw:Lcom/alibaba/fastjson/asm/ClassWriter;

    invoke-virtual {v1, p2, p3, p4}, Lcom/alibaba/fastjson/asm/ClassWriter;->newFieldItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Item;

    move-result-object v0

    .line 175
    .local v0, "i":Lcom/alibaba/fastjson/asm/Item;
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v2, v0, Lcom/alibaba/fastjson/asm/Item;->index:I

    invoke-virtual {v1, p1, v2}, Lcom/alibaba/fastjson/asm/ByteVector;->put12(II)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 176
    return-void
.end method

.method public visitIincInsn(II)V
    .registers 5
    .param p1, "var"    # I
    .param p2, "increment"    # I

    .prologue
    .line 235
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    const/16 v1, 0x84

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/asm/ByteVector;->putByte(I)Lcom/alibaba/fastjson/asm/ByteVector;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/alibaba/fastjson/asm/ByteVector;->put11(II)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 237
    return-void
.end method

.method public visitInsn(I)V
    .registers 3
    .param p1, "opcode"    # I

    .prologue
    .line 129
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/asm/ByteVector;->putByte(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 132
    return-void
.end method

.method public visitIntInsn(II)V
    .registers 4
    .param p1, "opcode"    # I
    .param p2, "operand"    # I

    .prologue
    .line 140
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    invoke-virtual {v0, p1, p2}, Lcom/alibaba/fastjson/asm/ByteVector;->put11(II)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 142
    return-void
.end method

.method public visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V
    .registers 5
    .param p1, "opcode"    # I
    .param p2, "label"    # Lcom/alibaba/fastjson/asm/Label;

    .prologue
    .line 198
    iget v0, p2, Lcom/alibaba/fastjson/asm/Label;->status:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_17

    iget v0, p2, Lcom/alibaba/fastjson/asm/Label;->position:I

    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v1, v1, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    sub-int/2addr v0, v1

    const/16 v1, -0x8000

    if-ge v0, v1, :cond_17

    .line 199
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0

    .line 206
    :cond_17
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/asm/ByteVector;->putByte(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 207
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v1, v1, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p2, p0, v0, v1}, Lcom/alibaba/fastjson/asm/Label;->put(Lcom/alibaba/fastjson/asm/MethodWriter;Lcom/alibaba/fastjson/asm/ByteVector;I)V

    .line 209
    return-void
.end method

.method public visitLabel(Lcom/alibaba/fastjson/asm/Label;)V
    .registers 4
    .param p1, "label"    # Lcom/alibaba/fastjson/asm/Label;

    .prologue
    .line 213
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v0, v0, Lcom/alibaba/fastjson/asm/ByteVector;->length:I

    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget-object v1, v1, Lcom/alibaba/fastjson/asm/ByteVector;->data:[B

    invoke-virtual {p1, p0, v0, v1}, Lcom/alibaba/fastjson/asm/Label;->resolve(Lcom/alibaba/fastjson/asm/MethodWriter;I[B)V

    .line 214
    return-void
.end method

.method public visitLdcInsn(Ljava/lang/Object;)V
    .registers 6
    .param p1, "cst"    # Ljava/lang/Object;

    .prologue
    .line 217
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->cw:Lcom/alibaba/fastjson/asm/ClassWriter;

    invoke-virtual {v2, p1}, Lcom/alibaba/fastjson/asm/ClassWriter;->newConstItem(Ljava/lang/Object;)Lcom/alibaba/fastjson/asm/Item;

    move-result-object v0

    .line 220
    .local v0, "i":Lcom/alibaba/fastjson/asm/Item;
    iget v1, v0, Lcom/alibaba/fastjson/asm/Item;->index:I

    .line 221
    .local v1, "index":I
    iget v2, v0, Lcom/alibaba/fastjson/asm/Item;->type:I

    const/4 v3, 0x5

    if-eq v2, v3, :cond_12

    iget v2, v0, Lcom/alibaba/fastjson/asm/Item;->type:I

    const/4 v3, 0x6

    if-ne v2, v3, :cond_1a

    .line 222
    :cond_12
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    const/16 v3, 0x14

    invoke-virtual {v2, v3, v1}, Lcom/alibaba/fastjson/asm/ByteVector;->put12(II)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 228
    :goto_19
    return-void

    .line 223
    :cond_1a
    const/16 v2, 0x100

    if-lt v1, v2, :cond_26

    .line 224
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    const/16 v3, 0x13

    invoke-virtual {v2, v3, v1}, Lcom/alibaba/fastjson/asm/ByteVector;->put12(II)Lcom/alibaba/fastjson/asm/ByteVector;

    goto :goto_19

    .line 226
    :cond_26
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    const/16 v3, 0x12

    invoke-virtual {v2, v3, v1}, Lcom/alibaba/fastjson/asm/ByteVector;->put11(II)Lcom/alibaba/fastjson/asm/ByteVector;

    goto :goto_19
.end method

.method public visitMaxs(II)V
    .registers 3
    .param p1, "maxStack"    # I
    .param p2, "maxLocals"    # I

    .prologue
    .line 240
    iput p1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->maxStack:I

    .line 241
    iput p2, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->maxLocals:I

    .line 242
    return-void
.end method

.method public visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "opcode"    # I
    .param p2, "owner"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "desc"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0xb9

    const/4 v3, 0x0

    .line 179
    if-ne p1, v6, :cond_26

    const/4 v2, 0x1

    .line 180
    .local v2, "itf":Z
    :goto_6
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->cw:Lcom/alibaba/fastjson/asm/ClassWriter;

    invoke-virtual {v4, p2, p3, p4, v2}, Lcom/alibaba/fastjson/asm/ClassWriter;->newMethodItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/alibaba/fastjson/asm/Item;

    move-result-object v1

    .line 181
    .local v1, "i":Lcom/alibaba/fastjson/asm/Item;
    iget v0, v1, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    .line 184
    .local v0, "argSize":I
    if-eqz v2, :cond_28

    .line 185
    if-nez v0, :cond_18

    .line 186
    invoke-static {p4}, Lcom/alibaba/fastjson/asm/Type;->getArgumentsAndReturnSizes(Ljava/lang/String;)I

    move-result v0

    .line 187
    iput v0, v1, Lcom/alibaba/fastjson/asm/Item;->intVal:I

    .line 189
    :cond_18
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v5, v1, Lcom/alibaba/fastjson/asm/Item;->index:I

    invoke-virtual {v4, v6, v5}, Lcom/alibaba/fastjson/asm/ByteVector;->put12(II)Lcom/alibaba/fastjson/asm/ByteVector;

    move-result-object v4

    shr-int/lit8 v5, v0, 0x2

    invoke-virtual {v4, v5, v3}, Lcom/alibaba/fastjson/asm/ByteVector;->put11(II)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 193
    :goto_25
    return-void

    .end local v0    # "argSize":I
    .end local v1    # "i":Lcom/alibaba/fastjson/asm/Item;
    .end local v2    # "itf":Z
    :cond_26
    move v2, v3

    .line 179
    goto :goto_6

    .line 191
    .restart local v0    # "argSize":I
    .restart local v1    # "i":Lcom/alibaba/fastjson/asm/Item;
    .restart local v2    # "itf":Z
    :cond_28
    iget-object v3, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v4, v1, Lcom/alibaba/fastjson/asm/Item;->index:I

    invoke-virtual {v3, p1, v4}, Lcom/alibaba/fastjson/asm/ByteVector;->put12(II)Lcom/alibaba/fastjson/asm/ByteVector;

    goto :goto_25
.end method

.method public visitTypeInsn(ILjava/lang/String;)V
    .registers 6
    .param p1, "opcode"    # I
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 165
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->cw:Lcom/alibaba/fastjson/asm/ClassWriter;

    invoke-virtual {v1, p2}, Lcom/alibaba/fastjson/asm/ClassWriter;->newClassItem(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Item;

    move-result-object v0

    .line 168
    .local v0, "i":Lcom/alibaba/fastjson/asm/Item;
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    iget v2, v0, Lcom/alibaba/fastjson/asm/Item;->index:I

    invoke-virtual {v1, p1, v2}, Lcom/alibaba/fastjson/asm/ByteVector;->put12(II)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 169
    return-void
.end method

.method public visitVarInsn(II)V
    .registers 6
    .param p1, "opcode"    # I
    .param p2, "var"    # I

    .prologue
    .line 147
    const/4 v1, 0x4

    if-ge p2, v1, :cond_22

    const/16 v1, 0xa9

    if-eq p1, v1, :cond_22

    .line 149
    const/16 v1, 0x36

    if-ge p1, v1, :cond_19

    .line 151
    add-int/lit8 v1, p1, -0x15

    shl-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x1a

    add-int v0, v1, p2

    .line 156
    .local v0, "opt":I
    :goto_13
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    invoke-virtual {v1, v0}, Lcom/alibaba/fastjson/asm/ByteVector;->putByte(I)Lcom/alibaba/fastjson/asm/ByteVector;

    .line 162
    .end local v0    # "opt":I
    :goto_18
    return-void

    .line 154
    :cond_19
    add-int/lit8 v1, p1, -0x36

    shl-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, 0x3b

    add-int v0, v1, p2

    .restart local v0    # "opt":I
    goto :goto_13

    .line 157
    .end local v0    # "opt":I
    :cond_22
    const/16 v1, 0x100

    if-lt p2, v1, :cond_32

    .line 158
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    const/16 v2, 0xc4

    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/asm/ByteVector;->putByte(I)Lcom/alibaba/fastjson/asm/ByteVector;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/alibaba/fastjson/asm/ByteVector;->put12(II)Lcom/alibaba/fastjson/asm/ByteVector;

    goto :goto_18

    .line 160
    :cond_32
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/MethodWriter;->code:Lcom/alibaba/fastjson/asm/ByteVector;

    invoke-virtual {v1, p1, p2}, Lcom/alibaba/fastjson/asm/ByteVector;->put11(II)Lcom/alibaba/fastjson/asm/ByteVector;

    goto :goto_18
.end method
