.class public Ljavassist/bytecode/BootstrapMethodsAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "BootstrapMethodsAttribute.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;
    }
.end annotation


# static fields
.field public static final tag:Ljava/lang/String; = "BootstrapMethods"


# direct methods
.method constructor <init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "n"    # I
    .param p3, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;[Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;)V
    .registers 11
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "methods"    # [Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;

    .prologue
    .line 53
    const-string v6, "BootstrapMethods"

    invoke-direct {p0, p1, v6}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 54
    const/4 v5, 0x2

    .line 55
    .local v5, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    array-length v6, p2

    if-ge v2, v6, :cond_17

    .line 56
    aget-object v6, p2, v2

    iget-object v6, v6, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->arguments:[I

    array-length v6, v6

    mul-int/lit8 v6, v6, 0x2

    add-int/lit8 v6, v6, 0x4

    add-int/2addr v5, v6

    .line 55
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 58
    :cond_17
    new-array v1, v5, [B

    .line 59
    .local v1, "data":[B
    array-length v6, p2

    const/4 v7, 0x0

    invoke-static {v6, v1, v7}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 60
    const/4 v4, 0x2

    .line 61
    .local v4, "pos":I
    const/4 v2, 0x0

    :goto_20
    array-length v6, p2

    if-ge v2, v6, :cond_4b

    .line 62
    aget-object v6, p2, v2

    iget v6, v6, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->methodRef:I

    invoke-static {v6, v1, v4}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 63
    aget-object v6, p2, v2

    iget-object v6, v6, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->arguments:[I

    array-length v6, v6

    add-int/lit8 v7, v4, 0x2

    invoke-static {v6, v1, v7}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 64
    aget-object v6, p2, v2

    iget-object v0, v6, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->arguments:[I

    .line 65
    .local v0, "args":[I
    add-int/lit8 v4, v4, 0x4

    .line 66
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_3b
    array-length v6, v0

    if-ge v3, v6, :cond_48

    .line 67
    aget v6, v0, v3

    invoke-static {v6, v1, v4}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 68
    add-int/lit8 v4, v4, 0x2

    .line 66
    add-int/lit8 v3, v3, 0x1

    goto :goto_3b

    .line 61
    :cond_48
    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    .line 72
    .end local v0    # "args":[I
    .end local v3    # "k":I
    :cond_4b
    invoke-virtual {p0, v1}, Ljavassist/bytecode/BootstrapMethodsAttribute;->set([B)V

    .line 73
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 10
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 112
    invoke-virtual {p0}, Ljavassist/bytecode/BootstrapMethodsAttribute;->getMethods()[Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;

    move-result-object v3

    .line 113
    .local v3, "methods":[Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;
    invoke-virtual {p0}, Ljavassist/bytecode/BootstrapMethodsAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v4

    .line 114
    .local v4, "thisCp":Ljavassist/bytecode/ConstPool;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    array-length v5, v3

    if-ge v0, v5, :cond_2e

    .line 115
    aget-object v2, v3, v0

    .line 116
    .local v2, "m":Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;
    iget v5, v2, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->methodRef:I

    invoke-virtual {v4, v5, p1, p2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v5

    iput v5, v2, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->methodRef:I

    .line 117
    const/4 v1, 0x0

    .local v1, "k":I
    :goto_17
    iget-object v5, v2, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->arguments:[I

    array-length v5, v5

    if-ge v1, v5, :cond_2b

    .line 118
    iget-object v5, v2, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->arguments:[I

    iget-object v6, v2, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;->arguments:[I

    aget v6, v6, v1

    invoke-virtual {v4, v6, p1, p2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v6

    aput v6, v5, v1

    .line 117
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .line 114
    :cond_2b
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 121
    .end local v1    # "k":I
    .end local v2    # "m":Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;
    :cond_2e
    new-instance v5, Ljavassist/bytecode/BootstrapMethodsAttribute;

    invoke-direct {v5, p1, v3}, Ljavassist/bytecode/BootstrapMethodsAttribute;-><init>(Ljavassist/bytecode/ConstPool;[Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;)V

    return-object v5
.end method

.method public getMethods()[Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;
    .registers 11

    .prologue
    .line 83
    invoke-virtual {p0}, Ljavassist/bytecode/BootstrapMethodsAttribute;->get()[B

    move-result-object v1

    .line 84
    .local v1, "data":[B
    const/4 v9, 0x0

    invoke-static {v1, v9}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v6

    .line 85
    .local v6, "num":I
    new-array v5, v6, [Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;

    .line 86
    .local v5, "methods":[Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;
    const/4 v7, 0x2

    .line 87
    .local v7, "pos":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    if-ge v2, v6, :cond_35

    .line 88
    invoke-static {v1, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v8

    .line 89
    .local v8, "ref":I
    add-int/lit8 v9, v7, 0x2

    invoke-static {v1, v9}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v4

    .line 90
    .local v4, "len":I
    new-array v0, v4, [I

    .line 91
    .local v0, "args":[I
    add-int/lit8 v7, v7, 0x4

    .line 92
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_1e
    if-ge v3, v4, :cond_2b

    .line 93
    invoke-static {v1, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v9

    aput v9, v0, v3

    .line 94
    add-int/lit8 v7, v7, 0x2

    .line 92
    add-int/lit8 v3, v3, 0x1

    goto :goto_1e

    .line 97
    :cond_2b
    new-instance v9, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;

    invoke-direct {v9, v8, v0}, Ljavassist/bytecode/BootstrapMethodsAttribute$BootstrapMethod;-><init>(I[I)V

    aput-object v9, v5, v2

    .line 87
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 100
    .end local v0    # "args":[I
    .end local v3    # "k":I
    .end local v4    # "len":I
    .end local v8    # "ref":I
    :cond_35
    return-object v5
.end method
