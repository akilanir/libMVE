.class public Ljavassist/bytecode/analysis/MultiArrayType;
.super Ljavassist/bytecode/analysis/Type;
.source "MultiArrayType.java"


# instance fields
.field private component:Ljavassist/bytecode/analysis/MultiType;

.field private dims:I


# direct methods
.method public constructor <init>(Ljavassist/bytecode/analysis/MultiType;I)V
    .registers 4
    .param p1, "component"    # Ljavassist/bytecode/analysis/MultiType;
    .param p2, "dims"    # I

    .prologue
    .line 32
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljavassist/bytecode/analysis/Type;-><init>(Ljavassist/CtClass;)V

    .line 33
    iput-object p1, p0, Ljavassist/bytecode/analysis/MultiArrayType;->component:Ljavassist/bytecode/analysis/MultiType;

    .line 34
    iput p2, p0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    .line 35
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 119
    instance-of v2, p1, Ljavassist/bytecode/analysis/MultiArrayType;

    if-nez v2, :cond_6

    .line 123
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 121
    check-cast v0, Ljavassist/bytecode/analysis/MultiArrayType;

    .line 123
    .local v0, "multi":Ljavassist/bytecode/analysis/MultiArrayType;
    iget-object v2, p0, Ljavassist/bytecode/analysis/MultiArrayType;->component:Ljavassist/bytecode/analysis/MultiType;

    iget-object v3, v0, Ljavassist/bytecode/analysis/MultiArrayType;->component:Ljavassist/bytecode/analysis/MultiType;

    invoke-virtual {v2, v3}, Ljavassist/bytecode/analysis/MultiType;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget v2, p0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    iget v3, v0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    if-ne v2, v3, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getComponent()Ljavassist/bytecode/analysis/Type;
    .registers 4

    .prologue
    .line 64
    iget v0, p0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    iget-object v0, p0, Ljavassist/bytecode/analysis/MultiArrayType;->component:Ljavassist/bytecode/analysis/MultiType;

    :goto_7
    return-object v0

    :cond_8
    new-instance v0, Ljavassist/bytecode/analysis/MultiArrayType;

    iget-object v1, p0, Ljavassist/bytecode/analysis/MultiArrayType;->component:Ljavassist/bytecode/analysis/MultiType;

    iget v2, p0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    add-int/lit8 v2, v2, -0x1

    invoke-direct {v0, v1, v2}, Ljavassist/bytecode/analysis/MultiArrayType;-><init>(Ljavassist/bytecode/analysis/MultiType;I)V

    goto :goto_7
.end method

.method public getCtClass()Ljavassist/CtClass;
    .registers 7

    .prologue
    .line 38
    iget-object v4, p0, Ljavassist/bytecode/analysis/MultiArrayType;->component:Ljavassist/bytecode/analysis/MultiType;

    invoke-virtual {v4}, Ljavassist/bytecode/analysis/MultiType;->getCtClass()Ljavassist/CtClass;

    move-result-object v0

    .line 39
    .local v0, "clazz":Ljavassist/CtClass;
    if-nez v0, :cond_a

    .line 40
    const/4 v4, 0x0

    .line 49
    :goto_9
    return-object v4

    .line 42
    :cond_a
    invoke-virtual {v0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    .line 43
    .local v3, "pool":Ljavassist/ClassPool;
    if-nez v3, :cond_14

    .line 44
    invoke-static {}, Ljavassist/ClassPool;->getDefault()Ljavassist/ClassPool;

    move-result-object v3

    .line 46
    :cond_14
    invoke-virtual {v0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    iget v5, p0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    invoke-virtual {p0, v4, v5}, Ljavassist/bytecode/analysis/MultiArrayType;->arrayName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    .line 49
    .local v2, "name":Ljava/lang/String;
    :try_start_1e
    invoke-virtual {v3, v2}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;
    :try_end_21
    .catch Ljavassist/NotFoundException; {:try_start_1e .. :try_end_21} :catch_23

    move-result-object v4

    goto :goto_9

    .line 50
    :catch_23
    move-exception v1

    .line 51
    .local v1, "e":Ljavassist/NotFoundException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public getDimensions()I
    .registers 2

    .prologue
    .line 60
    iget v0, p0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    return v0
.end method

.method public getSize()I
    .registers 2

    .prologue
    .line 68
    const/4 v0, 0x1

    return v0
.end method

.method public isArray()Z
    .registers 2

    .prologue
    .line 72
    const/4 v0, 0x1

    return v0
.end method

.method public isAssignableFrom(Ljavassist/bytecode/analysis/Type;)Z
    .registers 4
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    .line 76
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Not implemented"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isAssignableTo(Ljavassist/bytecode/analysis/Type;)Z
    .registers 8
    .param p1, "type"    # Ljavassist/bytecode/analysis/Type;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 84
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v4

    sget-object v5, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {v5}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v5

    invoke-static {v4, v5}, Ljavassist/bytecode/analysis/MultiArrayType;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 115
    :cond_12
    :goto_12
    return v2

    .line 87
    :cond_13
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v4

    sget-object v5, Ljavassist/bytecode/analysis/Type;->CLONEABLE:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {v5}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v5

    invoke-static {v4, v5}, Ljavassist/bytecode/analysis/MultiArrayType;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v4

    if-nez v4, :cond_12

    .line 90
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v4

    sget-object v5, Ljavassist/bytecode/analysis/Type;->SERIALIZABLE:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {v5}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v5

    invoke-static {v4, v5}, Ljavassist/bytecode/analysis/MultiArrayType;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v4

    if-nez v4, :cond_12

    .line 93
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->isArray()Z

    move-result v4

    if-nez v4, :cond_3b

    move v2, v3

    .line 94
    goto :goto_12

    .line 96
    :cond_3b
    invoke-virtual {p0, p1}, Ljavassist/bytecode/analysis/MultiArrayType;->getRootComponent(Ljavassist/bytecode/analysis/Type;)Ljavassist/bytecode/analysis/Type;

    move-result-object v1

    .line 97
    .local v1, "typeRoot":Ljavassist/bytecode/analysis/Type;
    invoke-virtual {p1}, Ljavassist/bytecode/analysis/Type;->getDimensions()I

    move-result v0

    .line 99
    .local v0, "typeDims":I
    iget v4, p0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    if-le v0, v4, :cond_49

    move v2, v3

    .line 100
    goto :goto_12

    .line 102
    :cond_49
    iget v4, p0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    if-ge v0, v4, :cond_7f

    .line 103
    invoke-virtual {v1}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v4

    sget-object v5, Ljavassist/bytecode/analysis/Type;->OBJECT:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {v5}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v5

    invoke-static {v4, v5}, Ljavassist/bytecode/analysis/MultiArrayType;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v4

    if-nez v4, :cond_12

    .line 106
    invoke-virtual {v1}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v4

    sget-object v5, Ljavassist/bytecode/analysis/Type;->CLONEABLE:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {v5}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v5

    invoke-static {v4, v5}, Ljavassist/bytecode/analysis/MultiArrayType;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v4

    if-nez v4, :cond_12

    .line 109
    invoke-virtual {v1}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v4

    sget-object v5, Ljavassist/bytecode/analysis/Type;->SERIALIZABLE:Ljavassist/bytecode/analysis/Type;

    invoke-virtual {v5}, Ljavassist/bytecode/analysis/Type;->getCtClass()Ljavassist/CtClass;

    move-result-object v5

    invoke-static {v4, v5}, Ljavassist/bytecode/analysis/MultiArrayType;->eq(Ljavassist/CtClass;Ljavassist/CtClass;)Z

    move-result v4

    if-nez v4, :cond_12

    move v2, v3

    .line 112
    goto :goto_12

    .line 115
    :cond_7f
    iget-object v2, p0, Ljavassist/bytecode/analysis/MultiArrayType;->component:Ljavassist/bytecode/analysis/MultiType;

    invoke-virtual {v2, v1}, Ljavassist/bytecode/analysis/MultiType;->isAssignableTo(Ljavassist/bytecode/analysis/Type;)Z

    move-result v2

    goto :goto_12
.end method

.method public isReference()Z
    .registers 2

    .prologue
    .line 80
    const/4 v0, 0x1

    return v0
.end method

.method popChanged()Z
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Ljavassist/bytecode/analysis/MultiArrayType;->component:Ljavassist/bytecode/analysis/MultiType;

    invoke-virtual {v0}, Ljavassist/bytecode/analysis/MultiType;->popChanged()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 128
    iget-object v0, p0, Ljavassist/bytecode/analysis/MultiArrayType;->component:Ljavassist/bytecode/analysis/MultiType;

    invoke-virtual {v0}, Ljavassist/bytecode/analysis/MultiType;->toString()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Ljavassist/bytecode/analysis/MultiArrayType;->dims:I

    invoke-virtual {p0, v0, v1}, Ljavassist/bytecode/analysis/MultiArrayType;->arrayName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
