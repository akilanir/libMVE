.class public Ljavassist/bytecode/stackmap/TypedBlock;
.super Ljavassist/bytecode/stackmap/BasicBlock;
.source "TypedBlock.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/stackmap/TypedBlock$Maker;
    }
.end annotation


# instance fields
.field public localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

.field public numLocals:I

.field public stackTop:I

.field public stackTypes:[Ljavassist/bytecode/stackmap/TypeData;


# direct methods
.method protected constructor <init>(I)V
    .registers 3
    .param p1, "pos"    # I

    .prologue
    .line 53
    invoke-direct {p0, p1}, Ljavassist/bytecode/stackmap/BasicBlock;-><init>(I)V

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    .line 55
    return-void
.end method

.method private static descToTag(Ljava/lang/String;II[Ljavassist/bytecode/stackmap/TypeData;)I
    .registers 13
    .param p0, "desc"    # Ljava/lang/String;
    .param p1, "i"    # I
    .param p2, "n"    # I
    .param p3, "types"    # [Ljavassist/bytecode/stackmap/TypeData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 167
    move v2, p1

    .line 168
    .local v2, "i0":I
    const/4 v0, 0x0

    .line 169
    .local v0, "arrayDim":I
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 170
    .local v1, "c":C
    const/16 v5, 0x29

    if-ne v1, v5, :cond_c

    .line 171
    const/4 v3, 0x0

    .line 197
    :goto_b
    return v3

    .line 173
    :cond_c
    :goto_c
    const/16 v5, 0x5b

    if-ne v1, v5, :cond_19

    .line 174
    add-int/lit8 v0, v0, 0x1

    .line 175
    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    goto :goto_c

    .line 178
    :cond_19
    const/16 v5, 0x4c

    if-ne v1, v5, :cond_4f

    .line 179
    const/16 v5, 0x3b

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, v5, p1}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 180
    .local v3, "i2":I
    if-lez v0, :cond_35

    .line 181
    new-instance v5, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    aput-object v5, p3, p2

    goto :goto_b

    .line 183
    :cond_35
    new-instance v5, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    add-int/lit8 v6, v2, 0x1

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v7, v3, -0x1

    invoke-virtual {p0, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x2f

    const/16 v8, 0x2e

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    aput-object v5, p3, p2

    goto :goto_b

    .line 187
    .end local v3    # "i2":I
    :cond_4f
    if-lez v0, :cond_60

    .line 188
    new-instance v5, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    aput-object v5, p3, p2

    move v3, p1

    .line 189
    goto :goto_b

    .line 192
    :cond_60
    invoke-static {v1}, Ljavassist/bytecode/stackmap/TypedBlock;->toPrimitiveTag(C)Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v4

    .line 193
    .local v4, "t":Ljavassist/bytecode/stackmap/TypeData;
    if-nez v4, :cond_7f

    .line 194
    new-instance v5, Ljavassist/bytecode/BadBytecode;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bad method descriptor: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v5

    .line 196
    :cond_7f
    aput-object v4, p3, p2

    .line 197
    add-int/lit8 v3, p1, 0x1

    goto :goto_b
.end method

.method public static getRetType(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "desc"    # Ljava/lang/String;

    .prologue
    .line 222
    const/16 v2, 0x29

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 223
    .local v1, "i":I
    if-gez v1, :cond_b

    .line 224
    const-string v2, "java.lang.Object"

    .line 232
    :goto_a
    return-object v2

    .line 226
    :cond_b
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 227
    .local v0, "c":C
    const/16 v2, 0x5b

    if-ne v0, v2, :cond_1c

    .line 228
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_a

    .line 229
    :cond_1c
    const/16 v2, 0x4c

    if-ne v0, v2, :cond_35

    .line 230
    add-int/lit8 v2, v1, 0x2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x2f

    const/16 v4, 0x2e

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    goto :goto_a

    .line 232
    :cond_35
    const-string v2, "java.lang.Object"

    goto :goto_a
.end method

.method public static makeBlocks(Ljavassist/bytecode/MethodInfo;Ljavassist/bytecode/CodeAttribute;Z)[Ljavassist/bytecode/stackmap/TypedBlock;
    .registers 12
    .param p0, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .param p1, "ca"    # Ljavassist/bytecode/CodeAttribute;
    .param p2, "optimize"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 39
    new-instance v0, Ljavassist/bytecode/stackmap/TypedBlock$Maker;

    invoke-direct {v0}, Ljavassist/bytecode/stackmap/TypedBlock$Maker;-><init>()V

    invoke-virtual {v0, p0}, Ljavassist/bytecode/stackmap/TypedBlock$Maker;->make(Ljavassist/bytecode/MethodInfo;)[Ljavassist/bytecode/stackmap/BasicBlock;

    move-result-object v0

    check-cast v0, [Ljavassist/bytecode/stackmap/TypedBlock;

    move-object v7, v0

    check-cast v7, [Ljavassist/bytecode/stackmap/TypedBlock;

    .line 40
    .local v7, "blocks":[Ljavassist/bytecode/stackmap/TypedBlock;
    if-eqz p2, :cond_20

    array-length v0, v7

    const/4 v2, 0x2

    if-ge v0, v2, :cond_20

    .line 41
    array-length v0, v7

    if-eqz v0, :cond_1e

    aget-object v0, v7, v1

    iget v0, v0, Ljavassist/bytecode/stackmap/TypedBlock;->incoming:I

    if-nez v0, :cond_20

    .line 42
    :cond_1e
    const/4 v7, 0x0

    .line 49
    .end local v7    # "blocks":[Ljavassist/bytecode/stackmap/TypedBlock;
    :goto_1f
    return-object v7

    .line 44
    .restart local v7    # "blocks":[Ljavassist/bytecode/stackmap/TypedBlock;
    :cond_20
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v8

    .line 45
    .local v8, "pool":Ljavassist/bytecode/ConstPool;
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_47

    const/4 v5, 0x1

    .line 46
    .local v5, "isStatic":Z
    :goto_2d
    aget-object v0, v7, v1

    invoke-virtual {p1}, Ljavassist/bytecode/CodeAttribute;->getMaxStack()I

    move-result v1

    invoke-virtual {p1}, Ljavassist/bytecode/CodeAttribute;->getMaxLocals()I

    move-result v2

    invoke-virtual {v8}, Ljavassist/bytecode/ConstPool;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->isConstructor()Z

    move-result v6

    invoke-virtual/range {v0 .. v6}, Ljavassist/bytecode/stackmap/TypedBlock;->initFirstBlock(IILjava/lang/String;Ljava/lang/String;ZZ)V

    goto :goto_1f

    .end local v5    # "isStatic":Z
    :cond_47
    move v5, v1

    .line 45
    goto :goto_2d
.end method

.method private printTypes(Ljava/lang/StringBuffer;I[Ljavassist/bytecode/stackmap/TypeData;)V
    .registers 7
    .param p1, "sbuf"    # Ljava/lang/StringBuffer;
    .param p2, "size"    # I
    .param p3, "types"    # [Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 68
    if-nez p3, :cond_3

    .line 78
    :cond_2
    return-void

    .line 71
    :cond_3
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, p2, :cond_2

    .line 72
    if-lez v0, :cond_d

    .line 73
    const-string v2, ", "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 75
    :cond_d
    aget-object v1, p3, v0

    .line 76
    .local v1, "td":Ljavassist/bytecode/stackmap/TypeData;
    if-nez v1, :cond_19

    const-string v2, "<>"

    :goto_13
    invoke-virtual {p1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 71
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 76
    :cond_19
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_13
.end method

.method private static toPrimitiveTag(C)Ljavassist/bytecode/stackmap/TypeData;
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 202
    sparse-switch p0, :sswitch_data_12

    .line 217
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 208
    :sswitch_5
    sget-object v0, Ljavassist/bytecode/stackmap/TypeTag;->INTEGER:Ljavassist/bytecode/stackmap/TypeData;

    goto :goto_4

    .line 210
    :sswitch_8
    sget-object v0, Ljavassist/bytecode/stackmap/TypeTag;->LONG:Ljavassist/bytecode/stackmap/TypeData;

    goto :goto_4

    .line 212
    :sswitch_b
    sget-object v0, Ljavassist/bytecode/stackmap/TypeTag;->FLOAT:Ljavassist/bytecode/stackmap/TypeData;

    goto :goto_4

    .line 214
    :sswitch_e
    sget-object v0, Ljavassist/bytecode/stackmap/TypeTag;->DOUBLE:Ljavassist/bytecode/stackmap/TypeData;

    goto :goto_4

    .line 202
    nop

    :sswitch_data_12
    .sparse-switch
        0x42 -> :sswitch_5
        0x43 -> :sswitch_5
        0x44 -> :sswitch_e
        0x46 -> :sswitch_b
        0x49 -> :sswitch_5
        0x4a -> :sswitch_8
        0x53 -> :sswitch_5
        0x5a -> :sswitch_5
    .end sparse-switch
.end method


# virtual methods
.method public alreadySet()Z
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method initFirstBlock(IILjava/lang/String;Ljava/lang/String;ZZ)V
    .registers 14
    .param p1, "maxStack"    # I
    .param p2, "maxLocals"    # I
    .param p3, "className"    # Ljava/lang/String;
    .param p4, "methodDesc"    # Ljava/lang/String;
    .param p5, "isStatic"    # Z
    .param p6, "isConstructor"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 136
    invoke-virtual {p4, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x28

    if-eq v4, v5, :cond_22

    .line 137
    new-instance v4, Ljavassist/bytecode/BadBytecode;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no method descriptor: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v4

    .line 139
    :cond_22
    iput v3, p0, Ljavassist/bytecode/stackmap/TypedBlock;->stackTop:I

    .line 140
    invoke-static {p1}, Ljavassist/bytecode/stackmap/TypeData;->make(I)[Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v4

    iput-object v4, p0, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    .line 141
    invoke-static {p2}, Ljavassist/bytecode/stackmap/TypeData;->make(I)[Ljavassist/bytecode/stackmap/TypeData;

    move-result-object v2

    .line 142
    .local v2, "locals":[Ljavassist/bytecode/stackmap/TypeData;
    if-eqz p6, :cond_6c

    .line 143
    new-instance v4, Ljavassist/bytecode/stackmap/TypeData$UninitThis;

    invoke-direct {v4, p3}, Ljavassist/bytecode/stackmap/TypeData$UninitThis;-><init>(Ljava/lang/String;)V

    aput-object v4, v2, v3

    .line 147
    :cond_37
    :goto_37
    if-eqz p5, :cond_3a

    const/4 v3, -0x1

    .line 148
    .local v3, "n":I
    :cond_3a
    const/4 v1, 0x1

    .line 150
    .local v1, "i":I
    :cond_3b
    :goto_3b
    add-int/lit8 v3, v3, 0x1

    :try_start_3d
    invoke-static {p4, v1, v3, v2}, Ljavassist/bytecode/stackmap/TypedBlock;->descToTag(Ljava/lang/String;II[Ljavassist/bytecode/stackmap/TypeData;)I

    move-result v1

    if-lez v1, :cond_76

    .line 151
    aget-object v4, v2, v3

    invoke-virtual {v4}, Ljavassist/bytecode/stackmap/TypeData;->is2WordType()Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 152
    add-int/lit8 v3, v3, 0x1

    sget-object v4, Ljavassist/bytecode/stackmap/TypeTag;->TOP:Ljavassist/bytecode/stackmap/TypeData;

    aput-object v4, v2, v3
    :try_end_51
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_3d .. :try_end_51} :catch_52

    goto :goto_3b

    .line 154
    :catch_52
    move-exception v0

    .line 155
    .local v0, "e":Ljava/lang/StringIndexOutOfBoundsException;
    new-instance v4, Ljavassist/bytecode/BadBytecode;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bad method descriptor: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v4

    .line 144
    .end local v0    # "e":Ljava/lang/StringIndexOutOfBoundsException;
    .end local v1    # "i":I
    .end local v3    # "n":I
    :cond_6c
    if-nez p5, :cond_37

    .line 145
    new-instance v4, Ljavassist/bytecode/stackmap/TypeData$ClassName;

    invoke-direct {v4, p3}, Ljavassist/bytecode/stackmap/TypeData$ClassName;-><init>(Ljava/lang/String;)V

    aput-object v4, v2, v3

    goto :goto_37

    .line 159
    .restart local v1    # "i":I
    .restart local v3    # "n":I
    :cond_76
    iput v3, p0, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    .line 160
    iput-object v2, p0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    .line 161
    return-void
.end method

.method public resetNumLocals()V
    .registers 4

    .prologue
    .line 97
    iget-object v1, p0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    if-eqz v1, :cond_28

    .line 98
    iget-object v1, p0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    array-length v0, v1

    .line 99
    .local v0, "nl":I
    :goto_7
    if-lez v0, :cond_26

    iget-object v1, p0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    add-int/lit8 v2, v0, -0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljavassist/bytecode/stackmap/TypeData;->isBasicType()Ljavassist/bytecode/stackmap/TypeData$BasicType;

    move-result-object v1

    sget-object v2, Ljavassist/bytecode/stackmap/TypeTag;->TOP:Ljavassist/bytecode/stackmap/TypeData;

    if-ne v1, v2, :cond_26

    .line 100
    const/4 v1, 0x1

    if-le v0, v1, :cond_29

    .line 101
    iget-object v1, p0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    add-int/lit8 v2, v0, -0x2

    aget-object v1, v1, v2

    invoke-virtual {v1}, Ljavassist/bytecode/stackmap/TypeData;->is2WordType()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 108
    :cond_26
    iput v0, p0, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    .line 110
    .end local v0    # "nl":I
    :cond_28
    return-void

    .line 105
    .restart local v0    # "nl":I
    :cond_29
    add-int/lit8 v0, v0, -0x1

    goto :goto_7
.end method

.method public setStackMap(I[Ljavassist/bytecode/stackmap/TypeData;I[Ljavassist/bytecode/stackmap/TypeData;)V
    .registers 5
    .param p1, "st"    # I
    .param p2, "stack"    # [Ljavassist/bytecode/stackmap/TypeData;
    .param p3, "nl"    # I
    .param p4, "locals"    # [Ljavassist/bytecode/stackmap/TypeData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 87
    iput p1, p0, Ljavassist/bytecode/stackmap/TypedBlock;->stackTop:I

    .line 88
    iput-object p2, p0, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    .line 89
    iput p3, p0, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    .line 90
    iput-object p4, p0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    .line 91
    return-void
.end method

.method protected toString2(Ljava/lang/StringBuffer;)V
    .registers 4
    .param p1, "sbuf"    # Ljava/lang/StringBuffer;

    .prologue
    .line 58
    invoke-super {p0, p1}, Ljavassist/bytecode/stackmap/BasicBlock;->toString2(Ljava/lang/StringBuffer;)V

    .line 59
    const-string v0, ",\n stack={"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 60
    iget v0, p0, Ljavassist/bytecode/stackmap/TypedBlock;->stackTop:I

    iget-object v1, p0, Ljavassist/bytecode/stackmap/TypedBlock;->stackTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-direct {p0, p1, v0, v1}, Ljavassist/bytecode/stackmap/TypedBlock;->printTypes(Ljava/lang/StringBuffer;I[Ljavassist/bytecode/stackmap/TypeData;)V

    .line 61
    const-string v0, "}, locals={"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 62
    iget v0, p0, Ljavassist/bytecode/stackmap/TypedBlock;->numLocals:I

    iget-object v1, p0, Ljavassist/bytecode/stackmap/TypedBlock;->localsTypes:[Ljavassist/bytecode/stackmap/TypeData;

    invoke-direct {p0, p1, v0, v1}, Ljavassist/bytecode/stackmap/TypedBlock;->printTypes(Ljava/lang/StringBuffer;I[Ljavassist/bytecode/stackmap/TypeData;)V

    .line 63
    const/16 v0, 0x7d

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 64
    return-void
.end method
