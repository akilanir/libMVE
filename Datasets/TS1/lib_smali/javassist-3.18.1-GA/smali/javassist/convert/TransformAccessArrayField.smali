.class public final Ljavassist/convert/TransformAccessArrayField;
.super Ljavassist/convert/Transformer;
.source "TransformAccessArrayField.java"


# instance fields
.field private frames:[Ljavassist/bytecode/analysis/Frame;

.field private final methodClassname:Ljava/lang/String;

.field private final names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

.field private offset:I


# direct methods
.method public constructor <init>(Ljavassist/convert/Transformer;Ljava/lang/String;Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;)V
    .registers 4
    .param p1, "next"    # Ljavassist/convert/Transformer;
    .param p2, "methodClassname"    # Ljava/lang/String;
    .param p3, "names"    # Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1}, Ljavassist/convert/Transformer;-><init>(Ljavassist/convert/Transformer;)V

    .line 47
    iput-object p2, p0, Ljavassist/convert/TransformAccessArrayField;->methodClassname:Ljava/lang/String;

    .line 48
    iput-object p3, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    .line 50
    return-void
.end method

.method private getFrame(I)Ljavassist/bytecode/analysis/Frame;
    .registers 4
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Ljavassist/convert/TransformAccessArrayField;->frames:[Ljavassist/bytecode/analysis/Frame;

    iget v1, p0, Ljavassist/convert/TransformAccessArrayField;->offset:I

    sub-int v1, p1, v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method private getLoadReplacementSignature(I)Ljava/lang/String;
    .registers 3
    .param p1, "opcode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 226
    packed-switch p1, :pswitch_data_22

    .line 245
    new-instance v0, Ljavassist/bytecode/BadBytecode;

    invoke-direct {v0, p1}, Ljavassist/bytecode/BadBytecode;-><init>(I)V

    throw v0

    .line 228
    :pswitch_9
    const-string v0, "(Ljava/lang/Object;I)Ljava/lang/Object;"

    .line 242
    :goto_b
    return-object v0

    .line 230
    :pswitch_c
    const-string v0, "(Ljava/lang/Object;I)B"

    goto :goto_b

    .line 232
    :pswitch_f
    const-string v0, "(Ljava/lang/Object;I)C"

    goto :goto_b

    .line 234
    :pswitch_12
    const-string v0, "(Ljava/lang/Object;I)D"

    goto :goto_b

    .line 236
    :pswitch_15
    const-string v0, "(Ljava/lang/Object;I)F"

    goto :goto_b

    .line 238
    :pswitch_18
    const-string v0, "(Ljava/lang/Object;I)I"

    goto :goto_b

    .line 240
    :pswitch_1b
    const-string v0, "(Ljava/lang/Object;I)S"

    goto :goto_b

    .line 242
    :pswitch_1e
    const-string v0, "(Ljava/lang/Object;I)J"

    goto :goto_b

    .line 226
    nop

    :pswitch_data_22
    .packed-switch 0x2e
        :pswitch_18
        :pswitch_1e
        :pswitch_15
        :pswitch_12
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_1b
    .end packed-switch
.end method

.method private getMethodName(I)Ljava/lang/String;
    .registers 4
    .param p1, "opcode"    # I

    .prologue
    .line 167
    const/4 v0, 0x0

    .line 168
    .local v0, "methodName":Ljava/lang/String;
    sparse-switch p1, :sswitch_data_7e

    .line 219
    :goto_4
    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 220
    const/4 v0, 0x0

    .line 222
    :cond_d
    return-object v0

    .line 170
    :sswitch_e
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->objectRead()Ljava/lang/String;

    move-result-object v0

    .line 171
    goto :goto_4

    .line 173
    :sswitch_15
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->byteOrBooleanRead()Ljava/lang/String;

    move-result-object v0

    .line 174
    goto :goto_4

    .line 176
    :sswitch_1c
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->charRead()Ljava/lang/String;

    move-result-object v0

    .line 177
    goto :goto_4

    .line 179
    :sswitch_23
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->doubleRead()Ljava/lang/String;

    move-result-object v0

    .line 180
    goto :goto_4

    .line 182
    :sswitch_2a
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->floatRead()Ljava/lang/String;

    move-result-object v0

    .line 183
    goto :goto_4

    .line 185
    :sswitch_31
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->intRead()Ljava/lang/String;

    move-result-object v0

    .line 186
    goto :goto_4

    .line 188
    :sswitch_38
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->shortRead()Ljava/lang/String;

    move-result-object v0

    .line 189
    goto :goto_4

    .line 191
    :sswitch_3f
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->longRead()Ljava/lang/String;

    move-result-object v0

    .line 192
    goto :goto_4

    .line 194
    :sswitch_46
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->objectWrite()Ljava/lang/String;

    move-result-object v0

    .line 195
    goto :goto_4

    .line 197
    :sswitch_4d
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->byteOrBooleanWrite()Ljava/lang/String;

    move-result-object v0

    .line 198
    goto :goto_4

    .line 200
    :sswitch_54
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->charWrite()Ljava/lang/String;

    move-result-object v0

    .line 201
    goto :goto_4

    .line 203
    :sswitch_5b
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->doubleWrite()Ljava/lang/String;

    move-result-object v0

    .line 204
    goto :goto_4

    .line 206
    :sswitch_62
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->floatWrite()Ljava/lang/String;

    move-result-object v0

    .line 207
    goto :goto_4

    .line 209
    :sswitch_69
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->intWrite()Ljava/lang/String;

    move-result-object v0

    .line 210
    goto :goto_4

    .line 212
    :sswitch_70
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->shortWrite()Ljava/lang/String;

    move-result-object v0

    .line 213
    goto :goto_4

    .line 215
    :sswitch_77
    iget-object v1, p0, Ljavassist/convert/TransformAccessArrayField;->names:Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;

    invoke-interface {v1}, Ljavassist/CodeConverter$ArrayAccessReplacementMethodNames;->longWrite()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 168
    :sswitch_data_7e
    .sparse-switch
        0x2e -> :sswitch_31
        0x2f -> :sswitch_3f
        0x30 -> :sswitch_2a
        0x31 -> :sswitch_23
        0x32 -> :sswitch_e
        0x33 -> :sswitch_15
        0x34 -> :sswitch_1c
        0x35 -> :sswitch_38
        0x4f -> :sswitch_69
        0x50 -> :sswitch_77
        0x51 -> :sswitch_62
        0x52 -> :sswitch_5b
        0x53 -> :sswitch_46
        0x54 -> :sswitch_4d
        0x55 -> :sswitch_54
        0x56 -> :sswitch_70
    .end sparse-switch
.end method

.method private getStoreReplacementSignature(I)Ljava/lang/String;
    .registers 3
    .param p1, "opcode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 249
    packed-switch p1, :pswitch_data_22

    .line 268
    new-instance v0, Ljavassist/bytecode/BadBytecode;

    invoke-direct {v0, p1}, Ljavassist/bytecode/BadBytecode;-><init>(I)V

    throw v0

    .line 251
    :pswitch_9
    const-string v0, "(Ljava/lang/Object;ILjava/lang/Object;)V"

    .line 265
    :goto_b
    return-object v0

    .line 253
    :pswitch_c
    const-string v0, "(Ljava/lang/Object;IB)V"

    goto :goto_b

    .line 255
    :pswitch_f
    const-string v0, "(Ljava/lang/Object;IC)V"

    goto :goto_b

    .line 257
    :pswitch_12
    const-string v0, "(Ljava/lang/Object;ID)V"

    goto :goto_b

    .line 259
    :pswitch_15
    const-string v0, "(Ljava/lang/Object;IF)V"

    goto :goto_b

    .line 261
    :pswitch_18
    const-string v0, "(Ljava/lang/Object;II)V"

    goto :goto_b

    .line 263
    :pswitch_1b
    const-string v0, "(Ljava/lang/Object;IS)V"

    goto :goto_b

    .line 265
    :pswitch_1e
    const-string v0, "(Ljava/lang/Object;IJ)V"

    goto :goto_b

    .line 249
    nop

    :pswitch_data_22
    .packed-switch 0x4f
        :pswitch_18
        :pswitch_1e
        :pswitch_15
        :pswitch_12
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_1b
    .end packed-switch
.end method

.method private getTopType(I)Ljava/lang/String;
    .registers 6
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 118
    invoke-direct {p0, p1}, Ljavassist/convert/TransformAccessArrayField;->getFrame(I)Ljavassist/bytecode/analysis/Frame;

    move-result-object v1

    .line 119
    .local v1, "frame":Ljavassist/bytecode/analysis/Frame;
    if-nez v1, :cond_8

    .line 123
    :cond_7
    :goto_7
    return-object v2

    .line 122
    :cond_8
    invoke-virtual {v1}, Ljavassist/bytecode/analysis/Frame;->peek()Ljavassist/bytecode/analysis/Type;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v0

    .line 123
    .local v0, "clazz":Ljavassist/CtClass;
    if-eqz v0, :cond_7

    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->toJvmName(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v2

    goto :goto_7
.end method

.method private initFrames(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V
    .registers 4
    .param p1, "clazz"    # Ljavassist/CtClass;
    .param p2, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Ljavassist/convert/TransformAccessArrayField;->frames:[Ljavassist/bytecode/analysis/Frame;

    if-nez v0, :cond_12

    .line 105
    new-instance v0, Ljavassist/bytecode/analysis/Analyzer;

    invoke-direct {v0}, Ljavassist/bytecode/analysis/Analyzer;-><init>()V

    invoke-virtual {v0, p1, p2}, Ljavassist/bytecode/analysis/Analyzer;->analyze(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/analysis/Frame;

    move-result-object v0

    iput-object v0, p0, Ljavassist/convert/TransformAccessArrayField;->frames:[Ljavassist/bytecode/analysis/Frame;

    .line 106
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/convert/TransformAccessArrayField;->offset:I

    .line 108
    :cond_12
    return-void
.end method

.method private replace(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeIterator;IILjava/lang/String;)I
    .registers 15
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .param p3, "pos"    # I
    .param p4, "opcode"    # I
    .param p5, "signature"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 128
    const/4 v0, 0x0

    .line 129
    .local v0, "castType":Ljava/lang/String;
    invoke-direct {p0, p4}, Ljavassist/convert/TransformAccessArrayField;->getMethodName(I)Ljava/lang/String;

    move-result-object v3

    .line 130
    .local v3, "methodName":Ljava/lang/String;
    if-eqz v3, :cond_59

    .line 132
    const/16 v7, 0x32

    if-ne p4, v7, :cond_21

    .line 133
    invoke-virtual {p2}, Ljavassist/bytecode/CodeIterator;->lookAhead()I

    move-result v7

    invoke-direct {p0, v7}, Ljavassist/convert/TransformAccessArrayField;->getTopType(I)Ljava/lang/String;

    move-result-object v0

    .line 137
    if-nez v0, :cond_18

    move v6, p3

    .line 163
    .end local p3    # "pos":I
    .local v6, "pos":I
    :goto_17
    return v6

    .line 139
    .end local v6    # "pos":I
    .restart local p3    # "pos":I
    :cond_18
    const-string v7, "java/lang/Object"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_21

    .line 140
    const/4 v0, 0x0

    .line 145
    :cond_21
    invoke-virtual {p2, v8, p3}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 146
    if-eqz v0, :cond_5b

    const/4 v7, 0x5

    :goto_27
    invoke-virtual {p2, p3, v7, v8}, Ljavassist/bytecode/CodeIterator;->insertGapAt(IIZ)Ljavassist/bytecode/CodeIterator$Gap;

    move-result-object v1

    .line 148
    .local v1, "gap":Ljavassist/bytecode/CodeIterator$Gap;
    iget p3, v1, Ljavassist/bytecode/CodeIterator$Gap;->position:I

    .line 149
    iget-object v7, p0, Ljavassist/convert/TransformAccessArrayField;->methodClassname:Ljava/lang/String;

    invoke-virtual {p1, v7}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v5

    .line 150
    .local v5, "mi":I
    invoke-virtual {p1, v5, v3, p5}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(ILjava/lang/String;Ljava/lang/String;)I

    move-result v4

    .line 151
    .local v4, "methodref":I
    const/16 v7, 0xb8

    invoke-virtual {p2, v7, p3}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 152
    add-int/lit8 v7, p3, 0x1

    invoke-virtual {p2, v4, v7}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 154
    if-eqz v0, :cond_53

    .line 155
    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v2

    .line 156
    .local v2, "index":I
    const/16 v7, 0xc0

    add-int/lit8 v8, p3, 0x3

    invoke-virtual {p2, v7, v8}, Ljavassist/bytecode/CodeIterator;->writeByte(II)V

    .line 157
    add-int/lit8 v7, p3, 0x4

    invoke-virtual {p2, v2, v7}, Ljavassist/bytecode/CodeIterator;->write16bit(II)V

    .line 160
    .end local v2    # "index":I
    :cond_53
    iget v7, v1, Ljavassist/bytecode/CodeIterator$Gap;->length:I

    invoke-direct {p0, p3, v7}, Ljavassist/convert/TransformAccessArrayField;->updatePos(II)I

    move-result p3

    .end local v1    # "gap":Ljavassist/bytecode/CodeIterator$Gap;
    .end local v4    # "methodref":I
    .end local v5    # "mi":I
    :cond_59
    move v6, p3

    .line 163
    .end local p3    # "pos":I
    .restart local v6    # "pos":I
    goto :goto_17

    .line 146
    .end local v6    # "pos":I
    .restart local p3    # "pos":I
    :cond_5b
    const/4 v7, 0x2

    goto :goto_27
.end method

.method private updatePos(II)I
    .registers 5
    .param p1, "pos"    # I
    .param p2, "increment"    # I

    .prologue
    .line 111
    iget v0, p0, Ljavassist/convert/TransformAccessArrayField;->offset:I

    const/4 v1, -0x1

    if-le v0, v1, :cond_a

    .line 112
    iget v0, p0, Ljavassist/convert/TransformAccessArrayField;->offset:I

    add-int/2addr v0, p2

    iput v0, p0, Ljavassist/convert/TransformAccessArrayField;->offset:I

    .line 114
    :cond_a
    add-int v0, p1, p2

    return v0
.end method


# virtual methods
.method public clean()V
    .registers 2

    .prologue
    .line 89
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/convert/TransformAccessArrayField;->frames:[Ljavassist/bytecode/analysis/Frame;

    .line 90
    const/4 v0, -0x1

    iput v0, p0, Ljavassist/convert/TransformAccessArrayField;->offset:I

    .line 91
    return-void
.end method

.method public initialize(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V
    .registers 12
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "clazz"    # Ljavassist/CtClass;
    .param p3, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x32

    .line 63
    invoke-virtual {p3}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v2

    .line 64
    .local v2, "iterator":Ljavassist/bytecode/CodeIterator;
    :cond_a
    :goto_a
    invoke-virtual {v2}, Ljavassist/bytecode/CodeIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_77

    .line 66
    :try_start_10
    invoke-virtual {v2}, Ljavassist/bytecode/CodeIterator;->next()I

    move-result v3

    .line 67
    .local v3, "pos":I
    invoke-virtual {v2, v3}, Ljavassist/bytecode/CodeIterator;->byteAt(I)I

    move-result v4

    .line 69
    .local v4, "c":I
    if-ne v4, v7, :cond_1d

    .line 70
    invoke-direct {p0, p2, p3}, Ljavassist/convert/TransformAccessArrayField;->initFrames(Ljavassist/CtClass;Ljavassist/bytecode/MethodInfo;)V

    .line 72
    :cond_1d
    if-eq v4, v7, :cond_3b

    const/16 v0, 0x33

    if-eq v4, v0, :cond_3b

    const/16 v0, 0x34

    if-eq v4, v0, :cond_3b

    const/16 v0, 0x31

    if-eq v4, v0, :cond_3b

    const/16 v0, 0x30

    if-eq v4, v0, :cond_3b

    const/16 v0, 0x2e

    if-eq v4, v0, :cond_3b

    const/16 v0, 0x2f

    if-eq v4, v0, :cond_3b

    const/16 v0, 0x35

    if-ne v4, v0, :cond_46

    .line 75
    :cond_3b
    invoke-direct {p0, v4}, Ljavassist/convert/TransformAccessArrayField;->getLoadReplacementSignature(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Ljavassist/convert/TransformAccessArrayField;->replace(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeIterator;IILjava/lang/String;)I

    move-result v3

    goto :goto_a

    .line 76
    :cond_46
    const/16 v0, 0x53

    if-eq v4, v0, :cond_66

    const/16 v0, 0x54

    if-eq v4, v0, :cond_66

    const/16 v0, 0x55

    if-eq v4, v0, :cond_66

    const/16 v0, 0x52

    if-eq v4, v0, :cond_66

    const/16 v0, 0x51

    if-eq v4, v0, :cond_66

    const/16 v0, 0x4f

    if-eq v4, v0, :cond_66

    const/16 v0, 0x50

    if-eq v4, v0, :cond_66

    const/16 v0, 0x56

    if-ne v4, v0, :cond_a

    .line 79
    :cond_66
    invoke-direct {p0, v4}, Ljavassist/convert/TransformAccessArrayField;->getStoreReplacementSignature(I)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Ljavassist/convert/TransformAccessArrayField;->replace(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/CodeIterator;IILjava/lang/String;)I
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_6f} :catch_70

    goto :goto_a

    .line 82
    .end local v3    # "pos":I
    .end local v4    # "c":I
    :catch_70
    move-exception v6

    .line 83
    .local v6, "e":Ljava/lang/Exception;
    new-instance v0, Ljavassist/CannotCompileException;

    invoke-direct {v0, v6}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 86
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_77
    return-void
.end method

.method public transform(Ljavassist/CtClass;ILjavassist/bytecode/CodeIterator;Ljavassist/bytecode/ConstPool;)I
    .registers 5
    .param p1, "tclazz"    # Ljavassist/CtClass;
    .param p2, "pos"    # I
    .param p3, "iterator"    # Ljavassist/bytecode/CodeIterator;
    .param p4, "cp"    # Ljavassist/bytecode/ConstPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 96
    return p2
.end method
