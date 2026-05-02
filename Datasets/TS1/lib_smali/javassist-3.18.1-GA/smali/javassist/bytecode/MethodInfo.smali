.class public Ljavassist/bytecode/MethodInfo;
.super Ljava/lang/Object;
.source "MethodInfo.java"


# static fields
.field public static doPreverify:Z = false

.field public static final nameClinit:Ljava/lang/String; = "<clinit>"

.field public static final nameInit:Ljava/lang/String; = "<init>"


# instance fields
.field accessFlags:I

.field attribute:Ljava/util/ArrayList;

.field cachedName:Ljava/lang/String;

.field constPool:Ljavassist/bytecode/ConstPool;

.field descriptor:I

.field name:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 52
    const/4 v0, 0x0

    sput-boolean v0, Ljavassist/bytecode/MethodInfo;->doPreverify:Z

    return-void
.end method

.method private constructor <init>(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    .line 68
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
    .line 91
    invoke-direct {p0, p1}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 92
    invoke-direct {p0, p2}, Ljavassist/bytecode/MethodInfo;->read(Ljava/io/DataInputStream;)V

    .line 93
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "methodname"    # Ljava/lang/String;
    .param p3, "desc"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-direct {p0, p1}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 84
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/MethodInfo;->accessFlags:I

    .line 85
    invoke-virtual {p1, p2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MethodInfo;->name:I

    .line 86
    iput-object p2, p0, Ljavassist/bytecode/MethodInfo;->cachedName:Ljava/lang/String;

    .line 87
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p3}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MethodInfo;->descriptor:I

    .line 88
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljavassist/bytecode/MethodInfo;Ljava/util/Map;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "methodname"    # Ljava/lang/String;
    .param p3, "src"    # Ljavassist/bytecode/MethodInfo;
    .param p4, "classnameMap"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 116
    invoke-direct {p0, p1}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 117
    invoke-direct {p0, p3, p2, p4}, Ljavassist/bytecode/MethodInfo;->read(Ljavassist/bytecode/MethodInfo;Ljava/lang/String;Ljava/util/Map;)V

    .line 118
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
    .line 528
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/MethodInfo;->accessFlags:I

    .line 529
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/MethodInfo;->name:I

    .line 530
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v2

    iput v2, p0, Ljavassist/bytecode/MethodInfo;->descriptor:I

    .line 531
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v1

    .line 532
    .local v1, "n":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    .line 533
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1e
    if-ge v0, v1, :cond_2e

    .line 534
    iget-object v2, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    iget-object v3, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-static {v3, p1}, Ljavassist/bytecode/AttributeInfo;->read(Ljavassist/bytecode/ConstPool;Ljava/io/DataInputStream;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 533
    add-int/lit8 v0, v0, 0x1

    goto :goto_1e

    .line 535
    :cond_2e
    return-void
.end method

.method private read(Ljavassist/bytecode/MethodInfo;Ljava/lang/String;Ljava/util/Map;)V
    .registers 12
    .param p1, "src"    # Ljavassist/bytecode/MethodInfo;
    .param p2, "methodname"    # Ljava/lang/String;
    .param p3, "classnames"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 508
    iget-object v3, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    .line 509
    .local v3, "destCp":Ljavassist/bytecode/ConstPool;
    iget v6, p1, Ljavassist/bytecode/MethodInfo;->accessFlags:I

    iput v6, p0, Ljavassist/bytecode/MethodInfo;->accessFlags:I

    .line 510
    invoke-virtual {v3, p2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Ljavassist/bytecode/MethodInfo;->name:I

    .line 511
    iput-object p2, p0, Ljavassist/bytecode/MethodInfo;->cachedName:Ljava/lang/String;

    .line 512
    iget-object v5, p1, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    .line 513
    .local v5, "srcCp":Ljavassist/bytecode/ConstPool;
    iget v6, p1, Ljavassist/bytecode/MethodInfo;->descriptor:I

    invoke-virtual {v5, v6}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v1

    .line 514
    .local v1, "desc":Ljava/lang/String;
    invoke-static {v1, p3}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    .line 515
    .local v2, "desc2":Ljava/lang/String;
    invoke-virtual {v3, v2}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v6

    iput v6, p0, Ljavassist/bytecode/MethodInfo;->descriptor:I

    .line 517
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    .line 518
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getExceptionsAttribute()Ljavassist/bytecode/ExceptionsAttribute;

    move-result-object v4

    .line 519
    .local v4, "eattr":Ljavassist/bytecode/ExceptionsAttribute;
    if-eqz v4, :cond_36

    .line 520
    iget-object v6, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {v4, v3, p3}, Ljavassist/bytecode/ExceptionsAttribute;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 522
    :cond_36
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 523
    .local v0, "cattr":Ljavassist/bytecode/CodeAttribute;
    if-eqz v0, :cond_45

    .line 524
    iget-object v6, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {v0, v3, p3}, Ljavassist/bytecode/CodeAttribute;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 525
    :cond_45
    return-void
.end method


# virtual methods
.method public addAttribute(Ljavassist/bytecode/AttributeInfo;)V
    .registers 4
    .param p1, "info"    # Ljavassist/bytecode/AttributeInfo;

    .prologue
    .line 316
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 317
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    .line 319
    :cond_b
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljavassist/bytecode/AttributeInfo;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljavassist/bytecode/AttributeInfo;->remove(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 320
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 321
    return-void
.end method

.method compact(Ljavassist/bytecode/ConstPool;)V
    .registers 3
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 136
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MethodInfo;->name:I

    .line 137
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MethodInfo;->descriptor:I

    .line 138
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->copyAll(Ljava/util/ArrayList;Ljavassist/bytecode/ConstPool;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    .line 139
    iput-object p1, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    .line 140
    return-void
.end method

.method public getAccessFlags()I
    .registers 2

    .prologue
    .line 249
    iget v0, p0, Ljavassist/bytecode/MethodInfo;->accessFlags:I

    return v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 306
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->lookup(Ljava/util/ArrayList;Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    return-object v0
.end method

.method public getAttributes()Ljava/util/List;
    .registers 2

    .prologue
    .line 291
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 292
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    .line 294
    :cond_b
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getCodeAttribute()Ljavassist/bytecode/CodeAttribute;
    .registers 4

    .prologue
    .line 340
    iget-object v1, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    const-string v2, "Code"

    invoke-static {v1, v2}, Ljavassist/bytecode/AttributeInfo;->lookup(Ljava/util/ArrayList;Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    .line 341
    .local v0, "info":Ljavassist/bytecode/AttributeInfo;
    check-cast v0, Ljavassist/bytecode/CodeAttribute;

    .end local v0    # "info":Ljavassist/bytecode/AttributeInfo;
    return-object v0
.end method

.method public getConstPool()Ljavassist/bytecode/ConstPool;
    .registers 2

    .prologue
    .line 226
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    return-object v0
.end method

.method public getDescriptor()Ljava/lang/String;
    .registers 3

    .prologue
    .line 267
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/MethodInfo;->descriptor:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExceptionsAttribute()Ljavassist/bytecode/ExceptionsAttribute;
    .registers 4

    .prologue
    .line 329
    iget-object v1, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    const-string v2, "Exceptions"

    invoke-static {v1, v2}, Ljavassist/bytecode/AttributeInfo;->lookup(Ljava/util/ArrayList;Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    .line 331
    .local v0, "info":Ljavassist/bytecode/AttributeInfo;
    check-cast v0, Ljavassist/bytecode/ExceptionsAttribute;

    .end local v0    # "info":Ljavassist/bytecode/AttributeInfo;
    return-object v0
.end method

.method public getLineNumber(I)I
    .registers 6
    .param p1, "pos"    # I

    .prologue
    const/4 v2, -0x1

    .line 455
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v1

    .line 456
    .local v1, "ca":Ljavassist/bytecode/CodeAttribute;
    if-nez v1, :cond_8

    .line 464
    :cond_7
    :goto_7
    return v2

    .line 459
    :cond_8
    const-string v3, "LineNumberTable"

    invoke-virtual {v1, v3}, Ljavassist/bytecode/CodeAttribute;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/LineNumberAttribute;

    .line 461
    .local v0, "ainfo":Ljavassist/bytecode/LineNumberAttribute;
    if-eqz v0, :cond_7

    .line 464
    invoke-virtual {v0, p1}, Ljavassist/bytecode/LineNumberAttribute;->toLineNumber(I)I

    move-result v2

    goto :goto_7
.end method

.method public getName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 199
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->cachedName:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 200
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/MethodInfo;->name:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/MethodInfo;->cachedName:Ljava/lang/String;

    .line 202
    :cond_e
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->cachedName:Ljava/lang/String;

    return-object v0
.end method

.method public isConstructor()Z
    .registers 3

    .prologue
    .line 233
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "<init>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isMethod()Z
    .registers 3

    .prologue
    .line 218
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "n":Ljava/lang/String;
    const-string v1, "<init>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    const-string v1, "<clinit>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    const/4 v1, 0x1

    :goto_15
    return v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method

.method public isStaticInitializer()Z
    .registers 3

    .prologue
    .line 240
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "<clinit>"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method prune(Ljavassist/bytecode/ConstPool;)V
    .registers 12
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    const/4 v9, 0x0

    .line 143
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 145
    .local v3, "newAttributes":Ljava/util/ArrayList;
    const-string v8, "RuntimeInvisibleAnnotations"

    invoke-virtual {p0, v8}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v2

    .line 147
    .local v2, "invisibleAnnotations":Ljavassist/bytecode/AttributeInfo;
    if-eqz v2, :cond_15

    .line 148
    invoke-virtual {v2, p1, v9}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v2

    .line 149
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    :cond_15
    const-string v8, "RuntimeVisibleAnnotations"

    invoke-virtual {p0, v8}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v7

    .line 154
    .local v7, "visibleAnnotations":Ljavassist/bytecode/AttributeInfo;
    if-eqz v7, :cond_24

    .line 155
    invoke-virtual {v7, p1, v9}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v7

    .line 156
    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 159
    :cond_24
    const-string v8, "RuntimeInvisibleParameterAnnotations"

    invoke-virtual {p0, v8}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v4

    .line 161
    .local v4, "parameterInvisibleAnnotations":Ljavassist/bytecode/AttributeInfo;
    if-eqz v4, :cond_33

    .line 162
    invoke-virtual {v4, p1, v9}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v4

    .line 163
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    :cond_33
    const-string v8, "RuntimeVisibleParameterAnnotations"

    invoke-virtual {p0, v8}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v5

    .line 168
    .local v5, "parameterVisibleAnnotations":Ljavassist/bytecode/AttributeInfo;
    if-eqz v5, :cond_42

    .line 169
    invoke-virtual {v5, p1, v9}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v5

    .line 170
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 173
    :cond_42
    const-string v8, "AnnotationDefault"

    invoke-virtual {p0, v8}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AnnotationDefaultAttribute;

    .line 175
    .local v0, "defaultAttribute":Ljavassist/bytecode/AnnotationDefaultAttribute;
    if-eqz v0, :cond_4f

    .line 176
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    :cond_4f
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getExceptionsAttribute()Ljavassist/bytecode/ExceptionsAttribute;

    move-result-object v1

    .line 179
    .local v1, "ea":Ljavassist/bytecode/ExceptionsAttribute;
    if-eqz v1, :cond_58

    .line 180
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    :cond_58
    const-string v8, "Signature"

    invoke-virtual {p0, v8}, Ljavassist/bytecode/MethodInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v6

    .line 184
    .local v6, "signature":Ljavassist/bytecode/AttributeInfo;
    if-eqz v6, :cond_67

    .line 185
    invoke-virtual {v6, p1, v9}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v6

    .line 186
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 189
    :cond_67
    iput-object v3, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    .line 190
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Ljavassist/bytecode/MethodInfo;->name:I

    .line 191
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1, v8}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Ljavassist/bytecode/MethodInfo;->descriptor:I

    .line 192
    iput-object p1, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    .line 193
    return-void
.end method

.method public rebuildStackMap(Ljavassist/ClassPool;)V
    .registers 4
    .param p1, "pool"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 421
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 422
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    if-eqz v0, :cond_d

    .line 423
    invoke-static {p1, p0}, Ljavassist/bytecode/stackmap/MapMaker;->make(Ljavassist/ClassPool;Ljavassist/bytecode/MethodInfo;)Ljavassist/bytecode/StackMapTable;

    move-result-object v1

    .line 424
    .local v1, "smt":Ljavassist/bytecode/StackMapTable;
    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeAttribute;->setAttribute(Ljavassist/bytecode/StackMapTable;)V

    .line 426
    .end local v1    # "smt":Ljavassist/bytecode/StackMapTable;
    :cond_d
    return-void
.end method

.method public rebuildStackMapForME(Ljavassist/ClassPool;)V
    .registers 4
    .param p1, "pool"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 438
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 439
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    if-eqz v0, :cond_d

    .line 440
    invoke-static {p1, p0}, Ljavassist/bytecode/stackmap/MapMaker;->make2(Ljavassist/ClassPool;Ljavassist/bytecode/MethodInfo;)Ljavassist/bytecode/StackMap;

    move-result-object v1

    .line 441
    .local v1, "sm":Ljavassist/bytecode/StackMap;
    invoke-virtual {v0, v1}, Ljavassist/bytecode/CodeAttribute;->setAttribute(Ljavassist/bytecode/StackMap;)V

    .line 443
    .end local v1    # "sm":Ljavassist/bytecode/StackMap;
    :cond_d
    return-void
.end method

.method public rebuildStackMapIf6(Ljavassist/ClassPool;Ljavassist/bytecode/ClassFile;)V
    .registers 5
    .param p1, "pool"    # Ljavassist/ClassPool;
    .param p2, "cf"    # Ljavassist/bytecode/ClassFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 404
    invoke-virtual {p2}, Ljavassist/bytecode/ClassFile;->getMajorVersion()I

    move-result v0

    const/16 v1, 0x32

    if-lt v0, v1, :cond_b

    .line 405
    invoke-virtual {p0, p1}, Ljavassist/bytecode/MethodInfo;->rebuildStackMap(Ljavassist/ClassPool;)V

    .line 407
    :cond_b
    sget-boolean v0, Ljavassist/bytecode/MethodInfo;->doPreverify:Z

    if-eqz v0, :cond_12

    .line 408
    invoke-virtual {p0, p1}, Ljavassist/bytecode/MethodInfo;->rebuildStackMapForME(Ljavassist/ClassPool;)V

    .line 409
    :cond_12
    return-void
.end method

.method public removeCodeAttribute()V
    .registers 3

    .prologue
    .line 370
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    const-string v1, "Code"

    invoke-static {v0, v1}, Ljavassist/bytecode/AttributeInfo;->remove(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 371
    return-void
.end method

.method public removeExceptionsAttribute()V
    .registers 3

    .prologue
    .line 348
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    const-string v1, "Exceptions"

    invoke-static {v0, v1}, Ljavassist/bytecode/AttributeInfo;->remove(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 349
    return-void
.end method

.method public setAccessFlags(I)V
    .registers 2
    .param p1, "acc"    # I

    .prologue
    .line 258
    iput p1, p0, Ljavassist/bytecode/MethodInfo;->accessFlags:I

    .line 259
    return-void
.end method

.method public setCodeAttribute(Ljavassist/bytecode/CodeAttribute;)V
    .registers 3
    .param p1, "cattr"    # Ljavassist/bytecode/CodeAttribute;

    .prologue
    .line 381
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->removeCodeAttribute()V

    .line 382
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    if-nez v0, :cond_e

    .line 383
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    .line 385
    :cond_e
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 386
    return-void
.end method

.method public setDescriptor(Ljava/lang/String;)V
    .registers 3
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 276
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 277
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MethodInfo;->descriptor:I

    .line 278
    :cond_12
    return-void
.end method

.method public setExceptionsAttribute(Ljavassist/bytecode/ExceptionsAttribute;)V
    .registers 3
    .param p1, "cattr"    # Ljavassist/bytecode/ExceptionsAttribute;

    .prologue
    .line 359
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->removeExceptionsAttribute()V

    .line 360
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    if-nez v0, :cond_e

    .line 361
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    .line 363
    :cond_e
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 364
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "newName"    # Ljava/lang/String;

    .prologue
    .line 209
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/MethodInfo;->name:I

    .line 210
    iput-object p1, p0, Ljavassist/bytecode/MethodInfo;->cachedName:Ljava/lang/String;

    .line 211
    return-void
.end method

.method public setSuperclass(Ljava/lang/String;)V
    .registers 12
    .param p1, "superclass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/BadBytecode;
        }
    .end annotation

    .prologue
    .line 489
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->isConstructor()Z

    move-result v9

    if-nez v9, :cond_7

    .line 504
    :cond_6
    :goto_6
    return-void

    .line 492
    :cond_7
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getCodeAttribute()Ljavassist/bytecode/CodeAttribute;

    move-result-object v0

    .line 493
    .local v0, "ca":Ljavassist/bytecode/CodeAttribute;
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->getCode()[B

    move-result-object v1

    .line 494
    .local v1, "code":[B
    invoke-virtual {v0}, Ljavassist/bytecode/CodeAttribute;->iterator()Ljavassist/bytecode/CodeIterator;

    move-result-object v3

    .line 495
    .local v3, "iterator":Ljavassist/bytecode/CodeIterator;
    invoke-virtual {v3}, Ljavassist/bytecode/CodeIterator;->skipSuperConstructor()I

    move-result v7

    .line 496
    .local v7, "pos":I
    if-ltz v7, :cond_6

    .line 497
    iget-object v2, p0, Ljavassist/bytecode/MethodInfo;->constPool:Ljavassist/bytecode/ConstPool;

    .line 498
    .local v2, "cp":Ljavassist/bytecode/ConstPool;
    add-int/lit8 v9, v7, 0x1

    invoke-static {v1, v9}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v4

    .line 499
    .local v4, "mref":I
    invoke-virtual {v2, v4}, Ljavassist/bytecode/ConstPool;->getMethodrefNameAndType(I)I

    move-result v6

    .line 500
    .local v6, "nt":I
    invoke-virtual {v2, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v8

    .line 501
    .local v8, "sc":I
    invoke-virtual {v2, v8, v6}, Ljavassist/bytecode/ConstPool;->addMethodrefInfo(II)I

    move-result v5

    .line 502
    .local v5, "mref2":I
    add-int/lit8 v9, v7, 0x1

    invoke-static {v5, v1, v9}, Ljavassist/bytecode/ByteArray;->write16bit(I[BI)V

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

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
    .line 538
    iget v0, p0, Ljavassist/bytecode/MethodInfo;->accessFlags:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 539
    iget v0, p0, Ljavassist/bytecode/MethodInfo;->name:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 540
    iget v0, p0, Ljavassist/bytecode/MethodInfo;->descriptor:I

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 542
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    if-nez v0, :cond_18

    .line 543
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 548
    :goto_17
    return-void

    .line 545
    :cond_18
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 546
    iget-object v0, p0, Ljavassist/bytecode/MethodInfo;->attribute:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->writeAll(Ljava/util/ArrayList;Ljava/io/DataOutputStream;)V

    goto :goto_17
.end method
