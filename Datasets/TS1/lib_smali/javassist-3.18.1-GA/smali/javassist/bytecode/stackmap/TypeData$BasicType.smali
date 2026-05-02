.class public Ljavassist/bytecode/stackmap/TypeData$BasicType;
.super Ljavassist/bytecode/stackmap/TypeData;
.source "TypeData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/bytecode/stackmap/TypeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "BasicType"
.end annotation


# instance fields
.field private name:Ljava/lang/String;

.field private typeTag:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "tag"    # I

    .prologue
    .line 105
    invoke-direct {p0}, Ljavassist/bytecode/stackmap/TypeData;-><init>()V

    .line 106
    iput-object p1, p0, Ljavassist/bytecode/stackmap/TypeData$BasicType;->name:Ljava/lang/String;

    .line 107
    iput p2, p0, Ljavassist/bytecode/stackmap/TypeData$BasicType;->typeTag:I

    .line 108
    return-void
.end method


# virtual methods
.method public eq(Ljavassist/bytecode/stackmap/TypeData;)Z
    .registers 3
    .param p1, "d"    # Ljavassist/bytecode/stackmap/TypeData;

    .prologue
    .line 127
    if-ne p0, p1, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$BasicType;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTypeData(Ljavassist/bytecode/ConstPool;)I
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 111
    const/4 v0, 0x0

    return v0
.end method

.method public getTypeTag()I
    .registers 2

    .prologue
    .line 110
    iget v0, p0, Ljavassist/bytecode/stackmap/TypeData$BasicType;->typeTag:I

    return v0
.end method

.method public is2WordType()Z
    .registers 3

    .prologue
    .line 123
    iget v0, p0, Ljavassist/bytecode/stackmap/TypeData$BasicType;->typeTag:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_a

    iget v0, p0, Ljavassist/bytecode/stackmap/TypeData$BasicType;->typeTag:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_c

    :cond_a
    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isBasicType()Ljavassist/bytecode/stackmap/TypeData$BasicType;
    .registers 1

    .prologue
    .line 120
    return-object p0
.end method

.method public join()Ljavassist/bytecode/stackmap/TypeData;
    .registers 2

    .prologue
    .line 114
    sget-object v0, Ljavassist/bytecode/stackmap/TypeTag;->TOP:Ljavassist/bytecode/stackmap/TypeData;

    if-ne p0, v0, :cond_5

    .line 117
    .end local p0    # "this":Ljavassist/bytecode/stackmap/TypeData$BasicType;
    :goto_4
    return-object p0

    .restart local p0    # "this":Ljavassist/bytecode/stackmap/TypeData$BasicType;
    :cond_5
    invoke-super {p0}, Ljavassist/bytecode/stackmap/TypeData;->join()Ljavassist/bytecode/stackmap/TypeData;

    move-result-object p0

    goto :goto_4
.end method

.method public setType(Ljava/lang/String;Ljavassist/ClassPool;)V
    .registers 6
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 134
    new-instance v0, Ljavassist/bytecode/BadBytecode;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "conflict: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Ljavassist/bytecode/stackmap/TypeData$BasicType;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " and "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/bytecode/BadBytecode;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Ljavassist/bytecode/stackmap/TypeData$BasicType;->name:Ljava/lang/String;

    return-object v0
.end method
