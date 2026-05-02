.class public final Ljavassist/bytecode/FieldInfo;
.super Ljava/lang/Object;
.source "FieldInfo.java"


# instance fields
.field accessFlags:I

.field attribute:Ljava/util/ArrayList;

.field cachedName:Ljava/lang/String;

.field cachedType:Ljava/lang/String;

.field constPool:Ljavassist/bytecode/ConstPool;

.field descriptor:I

.field name:I


# direct methods
.method private constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/FieldInfo;->accessFlags:I

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    .line 43
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/io/DataInputStream;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-direct {p0, p1}, Ljavassist/bytecode/FieldInfo;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 63
    invoke-direct {p0, p2}, Ljavassist/bytecode/FieldInfo;->read(Ljava/io/DataInputStream;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "fieldName"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Ljavassist/bytecode/FieldInfo;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 56
    invoke-virtual {p1, p2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/FieldInfo;->name:I

    .line 57
    iput-object p2, p0, Ljavassist/bytecode/FieldInfo;->cachedName:Ljava/lang/String;

    .line 58
    invoke-virtual {p1, p3}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/FieldInfo;->descriptor:I

    .line 59
    return-void
.end method

.method private read(Ljava/io/DataInputStream;)V
    .registers 6
    .param p1, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 247
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/FieldInfo;->accessFlags:I

    .line 248
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/FieldInfo;->name:I

    .line 249
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/FieldInfo;->descriptor:I

    .line 250
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    .line 251
    .local v1, "n":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    .line 252
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1e
    if-ge v0, v1, :cond_2e

    .line 253
    iget-object v2, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    iget-object v3, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-static {v3, p1}, Ljavassist/bytecode/AttributeInfo;->read(Ljavassist/bytecode/ConstPool;Ljava/io/DataInputStream;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    .line 254
    :cond_2e
    return-void
.end method


# virtual methods
.method public addAttribute(Ljavassist/bytecode/AttributeInfo;)V
    .registers 4
    .param p1, "info"    # Ljavassist/bytecode/AttributeInfo;

    .prologue
    .line 239
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 240
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    .line 242
    :cond_b
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljavassist/bytecode/AttributeInfo;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljavassist/bytecode/AttributeInfo;->remove(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 243
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 244
    return-void
.end method

.method compact(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 82
    invoke-virtual {p0}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/FieldInfo;->name:I

    .line 83
    invoke-virtual {p0}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/FieldInfo;->descriptor:I

    .line 84
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->copyAll(Ljava/util/ArrayList;Ljavassist/bytecode/ConstPool;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    .line 85
    iput-object p1, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    .line 86
    return-void
.end method

.method public getAccessFlags()I
    .registers 2

    .prologue
    .line 155
    iget v0, p0, Ljavassist/bytecode/FieldInfo;->accessFlags:I

    return v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 229
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->lookup(Ljava/util/ArrayList;Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    return-object v0
.end method

.method public getAttributes()Ljava/util/List;
    .registers 2

    .prologue
    .line 215
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 216
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    .line 218
    :cond_b
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getConstPool()Ljavassist/bytecode/ConstPool;
    .registers 2

    .prologue
    .line 128
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    return-object v0
.end method

.method public getConstantValue()I
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 193
    iget v2, p0, Ljavassist/bytecode/FieldInfo;->accessFlags:I

    and-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_8

    .line 201
    :cond_7
    :goto_7
    return v1

    .line 196
    :cond_8
    const-string v2, "ConstantValue"

    invoke-virtual {p0, v2}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/ConstantAttribute;

    .line 198
    .local v0, "attr":Ljavassist/bytecode/ConstantAttribute;
    if-eqz v0, :cond_7

    .line 201
    invoke-virtual {v0}, Ljavassist/bytecode/ConstantAttribute;->getConstantValue()I

    move-result v1

    goto :goto_7
.end method

.method public getDescriptor()Ljava/lang/String;
    .registers 3

    .prologue
    .line 173
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/FieldInfo;->descriptor:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 135
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->cachedName:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 136
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/FieldInfo;->name:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/FieldInfo;->cachedName:Ljava/lang/String;

    .line 138
    :cond_e
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->cachedName:Ljava/lang/String;

    return-object v0
.end method

.method prune(Ljavassist/bytecode/ConstPool;)V
    .registers 9
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v6, 0x0

    .line 89
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .local v2, "newAttributes":Ljava/util/ArrayList;
    const-string v5, "RuntimeInvisibleAnnotations"

    invoke-virtual {p0, v5}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    .line 92
    .local v1, "invisibleAnnotations":Ljavassist/bytecode/AttributeInfo;
    if-eqz v1, :cond_15

    .line 93
    invoke-virtual {v1, p1, v6}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    .line 94
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    :cond_15
    const-string v5, "RuntimeVisibleAnnotations"

    invoke-virtual {p0, v5}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v4

    .line 99
    .local v4, "visibleAnnotations":Ljavassist/bytecode/AttributeInfo;
    if-eqz v4, :cond_24

    .line 100
    invoke-virtual {v4, p1, v6}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v4

    .line 101
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    :cond_24
    const-string v5, "Signature"

    invoke-virtual {p0, v5}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v3

    .line 106
    .local v3, "signature":Ljavassist/bytecode/AttributeInfo;
    if-eqz v3, :cond_33

    .line 107
    invoke-virtual {v3, p1, v6}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v3

    .line 108
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 111
    :cond_33
    invoke-virtual {p0}, Ljavassist/bytecode/FieldInfo;->getConstantValue()I

    move-result v0

    .line 112
    .local v0, "index":I
    if-eqz v0, :cond_47

    .line 113
    iget-object v5, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v5, v0, p1, v6}, Ljavassist/bytecode/ConstPool;->copy(ILjavassist/bytecode/ConstPool;Ljava/util/Map;)I

    move-result v0

    .line 114
    new-instance v5, Ljavassist/bytecode/ConstantAttribute;

    invoke-direct {v5, p1, v0}, Ljavassist/bytecode/ConstantAttribute;-><init>(Ljavassist/bytecode/ConstPool;I)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    :cond_47
    iput-object v2, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    .line 118
    invoke-virtual {p0}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Ljavassist/bytecode/FieldInfo;->name:I

    .line 119
    invoke-virtual {p0}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Ljavassist/bytecode/FieldInfo;->descriptor:I

    .line 120
    iput-object p1, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    .line 121
    return-void
.end method

.method public setAccessFlags(I)V
    .registers 2
    .param p1, "acc"    # I

    .prologue
    .line 164
    iput p1, p0, Ljavassist/bytecode/FieldInfo;->accessFlags:I

    .line 165
    return-void
.end method

.method public setDescriptor(Ljava/lang/String;)V
    .registers 3
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 182
    invoke-virtual {p0}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 183
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/FieldInfo;->descriptor:I

    .line 184
    :cond_12
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "newName"    # Ljava/lang/String;

    .prologue
    .line 145
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/FieldInfo;->name:I

    .line 146
    iput-object p1, p0, Ljavassist/bytecode/FieldInfo;->cachedName:Ljava/lang/String;

    .line 147
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method write(Ljava/io/DataOutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 257
    iget v0, p0, Ljavassist/bytecode/FieldInfo;->accessFlags:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 258
    iget v0, p0, Ljavassist/bytecode/FieldInfo;->name:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 259
    iget v0, p0, Ljavassist/bytecode/FieldInfo;->descriptor:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 260
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    if-nez v0, :cond_18

    .line 261
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 266
    :goto_17
    return-void

    .line 263
    :cond_18
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 264
    iget-object v0, p0, Ljavassist/bytecode/FieldInfo;->attribute:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->writeAll(Ljava/util/ArrayList;Ljava/io/DataOutputStream;)V

    goto :goto_17
.end method
