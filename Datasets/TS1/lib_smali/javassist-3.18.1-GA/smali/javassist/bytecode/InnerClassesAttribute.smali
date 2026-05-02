.class public Ljavassist/bytecode/InnerClassesAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "InnerClassesAttribute.java"


# static fields
.field public static final tag:Ljava/lang/String; = "InnerClasses"


# direct methods
.method public constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v2, 0x0

    .line 48
    const-string v0, "InnerClasses"

    const/4 v1, 0x2

    new-array v1, v1, [B

    invoke-direct {p0, p1, v0, v1}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 49
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    invoke-static {v2, v0, v2}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 50
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

.method private constructor <init>(Ljavassist/bytecode/ConstPool;[B)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "info"    # [B

    .prologue
    .line 39
    const-string v0, "InnerClasses"

    invoke-direct {p0, p1, v0, p2}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 40
    return-void
.end method


# virtual methods
.method public accessFlags(I)I
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 148
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    mul-int/lit8 v1, p1, 0x8

    add-int/lit8 v1, v1, 0x8

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public append(IIII)V
    .registers 12
    .param p1, "inner"    # I
    .param p2, "outer"    # I
    .param p3, "name"    # I
    .param p4, "flags"    # I

    .prologue
    const/4 v6, 0x0

    .line 183
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    .line 184
    .local v0, "data":[B
    array-length v2, v0

    .line 185
    .local v2, "len":I
    add-int/lit8 v5, v2, 0x8

    new-array v4, v5, [B

    .line 186
    .local v4, "newData":[B
    const/4 v1, 0x2

    .local v1, "i":I
    :goto_b
    if-ge v1, v2, :cond_14

    .line 187
    aget-byte v5, v0, v1

    aput-byte v5, v4, v1

    .line 186
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 189
    :cond_14
    invoke-static {v0, v6}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v3

    .line 190
    .local v3, "n":I
    add-int/lit8 v5, v3, 0x1

    invoke-static {v5, v4, v6}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 192
    invoke-static {p1, v4, v2}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 193
    add-int/lit8 v5, v2, 0x2

    invoke-static {p2, v4, v5}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 194
    add-int/lit8 v5, v2, 0x4

    invoke-static {p3, v4, v5}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 195
    add-int/lit8 v5, v2, 0x6

    invoke-static {p4, v4, v5}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 197
    invoke-virtual {p0, v4}, Ljavassist/bytecode/InnerClassesAttribute;->set([B)V

    .line 198
    return-void
.end method

.method public append(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 9
    .param p1, "inner"    # Ljava/lang/String;
    .param p2, "outer"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "flags"    # I

    .prologue
    .line 168
    iget-object v3, p0, Ljavassist/bytecode/InnerClassesAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    .line 169
    .local v0, "i":I
    iget-object v3, p0, Ljavassist/bytecode/InnerClassesAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, p2}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v2

    .line 170
    .local v2, "o":I
    iget-object v3, p0, Ljavassist/bytecode/InnerClassesAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, p3}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    .line 171
    .local v1, "n":I
    invoke-virtual {p0, v0, v2, v1, p4}, Ljavassist/bytecode/InnerClassesAttribute;->append(IIII)V

    .line 172
    return-void
.end method

.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 16
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    const/4 v12, 0x0

    .line 209
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v10

    .line 210
    .local v10, "src":[B
    array-length v11, v10

    new-array v2, v11, [B

    .line 211
    .local v2, "dest":[B
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    .line 212
    .local v1, "cp":Ljavassist/bytecode/ConstPool;
    new-instance v0, Ljavassist/bytecode/InnerClassesAttribute;

    invoke-direct {v0, p1, v2}, Ljavassist/bytecode/InnerClassesAttribute;-><init>(Ljavassist/bytecode/ConstPool;[B)V

    .line 213
    .local v0, "attr":Ljavassist/bytecode/InnerClassesAttribute;
    invoke-static {v10, v12}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v8

    .line 214
    .local v8, "n":I
    invoke-static {v8, v2, v12}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 215
    const/4 v7, 0x2

    .line 216
    .local v7, "j":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1a
    if-ge v3, v8, :cond_5b

    .line 217
    invoke-static {v10, v7}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v5

    .line 218
    .local v5, "innerClass":I
    add-int/lit8 v11, v7, 0x2

    invoke-static {v10, v11}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v9

    .line 219
    .local v9, "outerClass":I
    add-int/lit8 v11, v7, 0x4

    invoke-static {v10, v11}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v6

    .line 220
    .local v6, "innerName":I
    add-int/lit8 v11, v7, 0x6

    invoke-static {v10, v11}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v4

    .line 222
    .local v4, "innerAccess":I
    if-eqz v5, :cond_38

    .line 223
    invoke-virtual {v1, v5, p1, p2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v5

    .line 225
    :cond_38
    invoke-static {v5, v2, v7}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 227
    if-eqz v9, :cond_41

    .line 228
    invoke-virtual {v1, v9, p1, p2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v9

    .line 230
    :cond_41
    add-int/lit8 v11, v7, 0x2

    invoke-static {v9, v2, v11}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 232
    if-eqz v6, :cond_4c

    .line 233
    invoke-virtual {v1, v6, p1, p2}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v6

    .line 235
    :cond_4c
    add-int/lit8 v11, v7, 0x4

    invoke-static {v6, v2, v11}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 236
    add-int/lit8 v11, v7, 0x6

    invoke-static {v4, v2, v11}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 237
    add-int/lit8 v7, v7, 0x8

    .line 216
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 240
    .end local v4    # "innerAccess":I
    .end local v5    # "innerClass":I
    .end local v6    # "innerName":I
    .end local v9    # "outerClass":I
    :cond_5b
    return-object v0
.end method

.method public innerClass(I)Ljava/lang/String;
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 71
    invoke-virtual {p0, p1}, Ljavassist/bytecode/InnerClassesAttribute;->innerClassIndex(I)I

    move-result v0

    .line 72
    .local v0, "i":I
    if-nez v0, :cond_8

    .line 73
    const/4 v1, 0x0

    .line 75
    :goto_7
    return-object v1

    :cond_8
    iget-object v1, p0, Ljavassist/bytecode/InnerClassesAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public innerClassIndex(I)I
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 61
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    mul-int/lit8 v1, p1, 0x8

    add-int/lit8 v1, v1, 0x2

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public innerName(I)Ljava/lang/String;
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 129
    invoke-virtual {p0, p1}, Ljavassist/bytecode/InnerClassesAttribute;->innerNameIndex(I)I

    move-result v0

    .line 130
    .local v0, "i":I
    if-nez v0, :cond_8

    .line 131
    const/4 v1, 0x0

    .line 133
    :goto_7
    return-object v1

    :cond_8
    iget-object v1, p0, Ljavassist/bytecode/InnerClassesAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public innerNameIndex(I)I
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 119
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    mul-int/lit8 v1, p1, 0x8

    add-int/lit8 v1, v1, 0x6

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public outerClass(I)Ljava/lang/String;
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 100
    invoke-virtual {p0, p1}, Ljavassist/bytecode/InnerClassesAttribute;->outerClassIndex(I)I

    move-result v0

    .line 101
    .local v0, "i":I
    if-nez v0, :cond_8

    .line 102
    const/4 v1, 0x0

    .line 104
    :goto_7
    return-object v1

    :cond_8
    iget-object v1, p0, Ljavassist/bytecode/InnerClassesAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, v0}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public outerClassIndex(I)I
    .registers 4
    .param p1, "nth"    # I

    .prologue
    .line 90
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    mul-int/lit8 v1, p1, 0x8

    add-int/lit8 v1, v1, 0x4

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method public setAccessFlags(II)V
    .registers 5
    .param p1, "nth"    # I
    .param p2, "flags"    # I

    .prologue
    .line 156
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    mul-int/lit8 v1, p1, 0x8

    add-int/lit8 v1, v1, 0x8

    invoke-static {p2, v0, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 157
    return-void
.end method

.method public setInnerClassIndex(II)V
    .registers 5
    .param p1, "nth"    # I
    .param p2, "index"    # I

    .prologue
    .line 83
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    mul-int/lit8 v1, p1, 0x8

    add-int/lit8 v1, v1, 0x2

    invoke-static {p2, v0, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 84
    return-void
.end method

.method public setInnerNameIndex(II)V
    .registers 5
    .param p1, "nth"    # I
    .param p2, "index"    # I

    .prologue
    .line 141
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    mul-int/lit8 v1, p1, 0x8

    add-int/lit8 v1, v1, 0x6

    invoke-static {p2, v0, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 142
    return-void
.end method

.method public setOuterClassIndex(II)V
    .registers 5
    .param p1, "nth"    # I
    .param p2, "index"    # I

    .prologue
    .line 112
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    mul-int/lit8 v1, p1, 0x8

    add-int/lit8 v1, v1, 0x4

    invoke-static {p2, v0, v1}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    .line 113
    return-void
.end method

.method public tableLength()I
    .registers 3

    .prologue
    .line 55
    invoke-virtual {p0}, Ljavassist/bytecode/InnerClassesAttribute;->get()[B

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method
