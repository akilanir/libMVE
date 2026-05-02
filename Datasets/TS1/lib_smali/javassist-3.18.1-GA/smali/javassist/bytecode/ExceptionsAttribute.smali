.class public Ljavassist/bytecode/ExceptionsAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "ExceptionsAttribute.java"


# static fields
.field public static final tag:Ljava/lang/String; = "Exceptions"


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v2, 0x0

    .line 56
    const-string v1, "Exceptions"

    invoke-direct {p0, p1, v1}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 57
    const/4 v1, 0x2

    new-array v0, v1, [B

    .line 58
    .local v0, "data":[B
    const/4 v1, 0x1

    aput-byte v2, v0, v1

    aput-byte v2, v0, v2

    .line 59
    iput-object v0, p0, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    .line 60
    return-void
.end method

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
    .line 35
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 36
    return-void
.end method

.method private constructor <init>(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ExceptionsAttribute;Ljava/util/Map;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "src"    # Ljavassist/bytecode/ExceptionsAttribute;
    .param p3, "classnames"    # Ljava/util/Map;

    .prologue
    .line 46
    const-string v0, "Exceptions"

    invoke-direct {p0, p1, v0}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    .line 47
    invoke-direct {p0, p2, p3}, Ljavassist/bytecode/ExceptionsAttribute;->copyFrom(Ljavassist/bytecode/ExceptionsAttribute;Ljava/util/Map;)V

    .line 48
    return-void
.end method

.method private copyFrom(Ljavassist/bytecode/ExceptionsAttribute;Ljava/util/Map;)V
    .registers 13
    .param p1, "srcAttr"    # Ljavassist/bytecode/ExceptionsAttribute;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 83
    iget-object v6, p1, Ljavassist/bytecode/ExceptionsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    .line 84
    .local v6, "srcCp":Ljavassist/bytecode/ConstPool;
    iget-object v1, p0, Ljavassist/bytecode/ExceptionsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    .line 85
    .local v1, "destCp":Ljavassist/bytecode/ConstPool;
    iget-object v5, p1, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    .line 86
    .local v5, "src":[B
    array-length v4, v5

    .line 87
    .local v4, "num":I
    new-array v0, v4, [B

    .line 88
    .local v0, "dest":[B
    aget-byte v7, v5, v8

    aput-byte v7, v0, v8

    .line 89
    aget-byte v7, v5, v9

    aput-byte v7, v0, v9

    .line 90
    const/4 v2, 0x2

    .local v2, "i":I
    :goto_14
    if-ge v2, v4, :cond_24

    .line 91
    invoke-static {v5, v2}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    .line 92
    .local v3, "index":I
    invoke-virtual {v6, v3, v1, p2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v7

    invoke-static {v7, v0, v2}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 90
    add-int/lit8 v2, v2, 0x2

    goto :goto_14

    .line 96
    .end local v3    # "index":I
    :cond_24
    iput-object v0, p0, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    .line 97
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 4
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 71
    new-instance v0, Ljavassist/bytecode/ExceptionsAttribute;

    invoke-direct {v0, p1, p0, p2}, Ljavassist/bytecode/ExceptionsAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljavassist/bytecode/ExceptionsAttribute;Ljava/util/Map;)V

    return-object v0
.end method

.method public getException(I)I
    .registers 6
    .param p1, "nth"    # I

    .prologue
    .line 171
    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v0, v1, 0x2

    .line 172
    .local v0, "index":I
    iget-object v1, p0, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    aget-byte v1, v1, v0

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    iget-object v2, p0, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    add-int/lit8 v3, v0, 0x1

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    return v1
.end method

.method public getExceptionIndexes()[I
    .registers 9

    .prologue
    .line 103
    iget-object v0, p0, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    .line 104
    .local v0, "blist":[B
    array-length v5, v0

    .line 105
    .local v5, "n":I
    const/4 v6, 0x2

    if-gt v5, v6, :cond_8

    .line 106
    const/4 v1, 0x0

    .line 113
    :cond_7
    return-object v1

    .line 108
    :cond_8
    div-int/lit8 v6, v5, 0x2

    add-int/lit8 v6, v6, -0x1

    new-array v1, v6, [I

    .line 109
    .local v1, "elist":[I
    const/4 v3, 0x0

    .line 110
    .local v3, "k":I
    const/4 v2, 0x2

    .local v2, "j":I
    move v4, v3

    .end local v3    # "k":I
    .local v4, "k":I
    :goto_11
    if-ge v2, v5, :cond_7

    .line 111
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "k":I
    .restart local v3    # "k":I
    aget-byte v6, v0, v2

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    add-int/lit8 v7, v2, 0x1

    aget-byte v7, v0, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v6, v7

    aput v6, v1, v4

    .line 110
    add-int/lit8 v2, v2, 0x2

    move v4, v3

    .end local v3    # "k":I
    .restart local v4    # "k":I
    goto :goto_11
.end method

.method public getExceptions()[Ljava/lang/String;
    .registers 10

    .prologue
    .line 120
    iget-object v0, p0, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    .line 121
    .local v0, "blist":[B
    array-length v6, v0

    .line 122
    .local v6, "n":I
    const/4 v7, 0x2

    if-gt v6, v7, :cond_8

    .line 123
    const/4 v1, 0x0

    .line 132
    :cond_7
    return-object v1

    .line 125
    :cond_8
    div-int/lit8 v7, v6, 0x2

    add-int/lit8 v7, v7, -0x1

    new-array v1, v7, [Ljava/lang/String;

    .line 126
    .local v1, "elist":[Ljava/lang/String;
    const/4 v4, 0x0

    .line 127
    .local v4, "k":I
    const/4 v3, 0x2

    .local v3, "j":I
    move v5, v4

    .end local v4    # "k":I
    .local v5, "k":I
    :goto_11
    if-ge v3, v6, :cond_7

    .line 128
    aget-byte v7, v0, v3

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    add-int/lit8 v8, v3, 0x1

    aget-byte v8, v0, v8

    and-int/lit16 v8, v8, 0xff

    or-int v2, v7, v8

    .line 129
    .local v2, "index":I
    add-int/lit8 v4, v5, 0x1

    .end local v5    # "k":I
    .restart local v4    # "k":I
    iget-object v7, p0, Ljavassist/bytecode/ExceptionsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v7, v2}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v1, v5

    .line 127
    add-int/lit8 v3, v3, 0x2

    move v5, v4

    .end local v4    # "k":I
    .restart local v5    # "k":I
    goto :goto_11
.end method

.method public setExceptionIndexes([I)V
    .registers 7
    .param p1, "elist"    # [I

    .prologue
    .line 139
    array-length v2, p1

    .line 140
    .local v2, "n":I
    mul-int/lit8 v3, v2, 0x2

    add-int/lit8 v3, v3, 0x2

    new-array v0, v3, [B

    .line 141
    .local v0, "blist":[B
    const/4 v3, 0x0

    invoke-static {v2, v0, v3}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 142
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v2, :cond_1a

    .line 143
    aget v3, p1, v1

    mul-int/lit8 v4, v1, 0x2

    add-int/lit8 v4, v4, 0x2

    invoke-static {v3, v0, v4}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 142
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 145
    :cond_1a
    iput-object v0, p0, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    .line 146
    return-void
.end method

.method public setExceptions([Ljava/lang/String;)V
    .registers 7
    .param p1, "elist"    # [Ljava/lang/String;

    .prologue
    .line 152
    array-length v2, p1

    .line 153
    .local v2, "n":I
    mul-int/lit8 v3, v2, 0x2

    add-int/lit8 v3, v3, 0x2

    new-array v0, v3, [B

    .line 154
    .local v0, "blist":[B
    const/4 v3, 0x0

    invoke-static {v2, v0, v3}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 155
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v2, :cond_20

    .line 156
    iget-object v3, p0, Ljavassist/bytecode/ExceptionsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    aget-object v4, p1, v1

    invoke-virtual {v3, v4}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v3

    mul-int/lit8 v4, v1, 0x2

    add-int/lit8 v4, v4, 0x2

    invoke-static {v3, v0, v4}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 155
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 159
    :cond_20
    iput-object v0, p0, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    .line 160
    return-void
.end method

.method public tableLength()I
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Ljavassist/bytecode/ExceptionsAttribute;->info:[B

    array-length v0, v0

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, -0x1

    return v0
.end method
