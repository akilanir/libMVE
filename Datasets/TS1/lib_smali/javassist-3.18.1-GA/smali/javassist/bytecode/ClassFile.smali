.class public final Ljavassist/bytecode/ClassFile;
.super Ljava/lang/Object;
.source "ClassFile.java"


# static fields
.field public static final JAVA_1:I = 0x2d

.field public static final JAVA_2:I = 0x2e

.field public static final JAVA_3:I = 0x2f

.field public static final JAVA_4:I = 0x30

.field public static final JAVA_5:I = 0x31

.field public static final JAVA_6:I = 0x32

.field public static final JAVA_7:I = 0x33

.field public static MAJOR_VERSION:I


# instance fields
.field accessFlags:I

.field attributes:Ljava/util/ArrayList;

.field cachedInterfaces:[Ljava/lang/String;

.field cachedSuperclass:Ljava/lang/String;

.field constPool:Ljavassist/bytecode/ConstPool;

.field fields:Ljava/util/ArrayList;

.field interfaces:[I

.field major:I

.field methods:Ljava/util/ArrayList;

.field minor:I

.field superClass:I

.field thisClass:I

.field thisclassname:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 100
    const/16 v0, 0x2f

    sput v0, Ljavassist/bytecode/ClassFile;->MAJOR_VERSION:I

    .line 104
    :try_start_4
    const-string v0, "java.lang.StringBuilder"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 105
    const/16 v0, 0x31

    sput v0, Ljavassist/bytecode/ClassFile;->MAJOR_VERSION:I

    .line 106
    const-string v0, "java.util.zip.DeflaterInputStream"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 107
    const/16 v0, 0x32

    sput v0, Ljavassist/bytecode/ClassFile;->MAJOR_VERSION:I

    .line 108
    const-string v0, "java.lang.invoke.CallSite"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 109
    const/16 v0, 0x33

    sput v0, Ljavassist/bytecode/ClassFile;->MAJOR_VERSION:I
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_1f} :catch_20

    .line 112
    :goto_1f
    return-void

    .line 111
    :catch_20
    move-exception v0

    goto :goto_1f
.end method

.method public constructor <init>(Ljava/io/DataInputStream;)V
    .registers 2
    .param p1, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    invoke-direct {p0, p1}, Ljavassist/bytecode/ClassFile;->read(Ljava/io/DataInputStream;)V

    .line 119
    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "isInterface"    # Z
    .param p2, "classname"    # Ljava/lang/String;
    .param p3, "superclass"    # Ljava/lang/String;

    .prologue
    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    sget v0, Ljavassist/bytecode/ClassFile;->MAJOR_VERSION:I

    iput v0, p0, Ljavassist/bytecode/ClassFile;->major:I

    .line 133
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/ClassFile;->minor:I

    .line 134
    new-instance v0, Ljavassist/bytecode/ConstPool;

    invoke-direct {v0, p2}, Ljavassist/bytecode/ConstPool;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    .line 135
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0}, Ljavassist/bytecode/ConstPool;->getThisClassInfo()I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/ClassFile;->thisClass:I

    .line 136
    if-eqz p1, :cond_4f

    .line 137
    const/16 v0, 0x600

    iput v0, p0, Ljavassist/bytecode/ClassFile;->accessFlags:I

    .line 141
    :goto_1f
    invoke-direct {p0, p3}, Ljavassist/bytecode/ClassFile;->initSuperclass(Ljava/lang/String;)V

    .line 142
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    .line 143
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    .line 144
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 145
    iput-object p2, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    .line 147
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    .line 148
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    new-instance v1, Ljavassist/bytecode/SourceFileAttribute;

    iget-object v2, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    invoke-static {v3}, Ljavassist/bytecode/ClassFile;->getSourcefileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljavassist/bytecode/SourceFileAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    return-void

    .line 139
    :cond_4f
    const/16 v0, 0x20

    iput v0, p0, Ljavassist/bytecode/ClassFile;->accessFlags:I

    goto :goto_1f
.end method

.method private compact0()Ljavassist/bytecode/ConstPool;
    .registers 8

    .prologue
    .line 197
    new-instance v0, Ljavassist/bytecode/ConstPool;

    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    invoke-direct {v0, v4}, Ljavassist/bytecode/ConstPool;-><init>(Ljava/lang/String;)V

    .line 198
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {v0}, Ljavassist/bytecode/ConstPool;->getThisClassInfo()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/ClassFile;->thisClass:I

    .line 199
    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getSuperclass()Ljava/lang/String;

    move-result-object v3

    .line 200
    .local v3, "sc":Ljava/lang/String;
    if-eqz v3, :cond_1d

    .line 201
    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getSuperclass()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/ClassFile;->superClass:I

    .line 203
    :cond_1d
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    if-eqz v4, :cond_3c

    .line 204
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    array-length v2, v4

    .line 205
    .local v2, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_25
    if-ge v1, v2, :cond_3c

    .line 206
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    iget-object v5, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    iget-object v6, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    aget v6, v6, v1

    invoke-virtual {v5, v6}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v5

    aput v5, v4, v1

    .line 205
    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    .line 210
    .end local v1    # "i":I
    .end local v2    # "n":I
    :cond_3c
    return-object v0
.end method

.method private static getSourcefileName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "qname"    # Ljava/lang/String;

    .prologue
    .line 164
    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 165
    .local v0, "index":I
    if-ltz v0, :cond_e

    .line 166
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 168
    :cond_e
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".java"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private initSuperclass(Ljava/lang/String;)V
    .registers 4
    .param p1, "superclass"    # Ljava/lang/String;

    .prologue
    .line 153
    if-eqz p1, :cond_d

    .line 154
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/ClassFile;->superClass:I

    .line 155
    iput-object p1, p0, Ljavassist/bytecode/ClassFile;->cachedSuperclass:Ljava/lang/String;

    .line 161
    :goto_c
    return-void

    .line 158
    :cond_d
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    const-string v1, "java.lang.Object"

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Ljavassist/bytecode/ClassFile;->superClass:I

    .line 159
    const-string v0, "java.lang.Object"

    iput-object v0, p0, Ljavassist/bytecode/ClassFile;->cachedSuperclass:Ljava/lang/String;

    goto :goto_c
.end method

.method private static isDuplicated(Ljavassist/bytecode/MethodInfo;Ljava/lang/String;Ljava/lang/String;Ljavassist/bytecode/MethodInfo;Ljava/util/ListIterator;)Z
    .registers 8
    .param p0, "newMethod"    # Ljavassist/bytecode/MethodInfo;
    .param p1, "newName"    # Ljava/lang/String;
    .param p2, "newDesc"    # Ljava/lang/String;
    .param p3, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .param p4, "it"    # Ljava/util/ListIterator;

    .prologue
    const/4 v1, 0x0

    .line 682
    invoke-virtual {p3}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 700
    :cond_b
    :goto_b
    return v1

    .line 685
    :cond_c
    invoke-virtual {p3}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 686
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0, p2}, Ljavassist/bytecode/Descriptor;->eqParamTypes(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 689
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 690
    invoke-static {p3}, Ljavassist/bytecode/ClassFile;->notBridgeMethod(Ljavassist/bytecode/MethodInfo;)Z

    move-result v2

    if-eqz v2, :cond_24

    .line 691
    const/4 v1, 0x1

    goto :goto_b

    .line 695
    :cond_24
    invoke-interface {p4}, Ljava/util/ListIterator;->remove()V

    goto :goto_b
.end method

.method private static notBridgeMethod(Ljavassist/bytecode/MethodInfo;)Z
    .registers 2
    .param p0, "minfo"    # Ljavassist/bytecode/MethodInfo;

    .prologue
    .line 707
    invoke-virtual {p0}, Ljavassist/bytecode/MethodInfo;->getAccessFlags()I

    move-result v0

    and-int/lit8 v0, v0, 0x40

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method private read(Ljava/io/DataInputStream;)V
    .registers 9
    .param p1, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 771
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    .line 772
    .local v2, "magic":I
    const v4, -0x35014542    # -8346975.0f

    if-eq v2, v4, :cond_26

    .line 773
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "bad magic number: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 775
    :cond_26
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/ClassFile;->minor:I

    .line 776
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/ClassFile;->major:I

    .line 777
    new-instance v4, Ljavassist/bytecode/ConstPool;

    invoke-direct {v4, p1}, Ljavassist/bytecode/ConstPool;-><init>(Ljava/io/DataInputStream;)V

    iput-object v4, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    .line 778
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/ClassFile;->accessFlags:I

    .line 779
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/ClassFile;->thisClass:I

    .line 780
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    iget v5, p0, Ljavassist/bytecode/ClassFile;->thisClass:I

    invoke-virtual {v4, v5}, Ljavassist/bytecode/ConstPool;->setThisClassInfo(I)V

    .line 781
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v4

    iput v4, p0, Ljavassist/bytecode/ClassFile;->superClass:I

    .line 782
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v3

    .line 783
    .local v3, "n":I
    if-nez v3, :cond_76

    .line 784
    const/4 v4, 0x0

    iput-object v4, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    .line 791
    :cond_5b
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    .line 792
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v3

    .line 793
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    .line 794
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_69
    if-ge v1, v3, :cond_88

    .line 795
    new-instance v4, Ljavassist/bytecode/FieldInfo;

    invoke-direct {v4, v0, p1}, Ljavassist/bytecode/FieldInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/io/DataInputStream;)V

    invoke-virtual {p0, v4}, Ljavassist/bytecode/ClassFile;->addField2(Ljavassist/bytecode/FieldInfo;)V

    .line 794
    add-int/lit8 v1, v1, 0x1

    goto :goto_69

    .line 786
    .end local v0    # "cp":Ljavassist/bytecode/ConstPool;
    .end local v1    # "i":I
    :cond_76
    new-array v4, v3, [I

    iput-object v4, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    .line 787
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_7b
    if-ge v1, v3, :cond_5b

    .line 788
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v5

    aput v5, v4, v1

    .line 787
    add-int/lit8 v1, v1, 0x1

    goto :goto_7b

    .line 797
    .restart local v0    # "cp":Ljavassist/bytecode/ConstPool;
    :cond_88
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v3

    .line 798
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 799
    const/4 v1, 0x0

    :goto_94
    if-ge v1, v3, :cond_a1

    .line 800
    new-instance v4, Ljavassist/bytecode/MethodInfo;

    invoke-direct {v4, v0, p1}, Ljavassist/bytecode/MethodInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/io/DataInputStream;)V

    invoke-virtual {p0, v4}, Ljavassist/bytecode/ClassFile;->addMethod2(Ljavassist/bytecode/MethodInfo;)V

    .line 799
    add-int/lit8 v1, v1, 0x1

    goto :goto_94

    .line 802
    :cond_a1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    .line 803
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readUnsignedShort()I

    move-result v3

    .line 804
    const/4 v1, 0x0

    :goto_ad
    if-ge v1, v3, :cond_b9

    .line 805
    invoke-static {v0, p1}, Ljavassist/bytecode/AttributeInfo;->read(Ljavassist/bytecode/ConstPool;Ljava/io/DataInputStream;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljavassist/bytecode/ClassFile;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 804
    add-int/lit8 v1, v1, 0x1

    goto :goto_ad

    .line 807
    :cond_b9
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    iget v5, p0, Ljavassist/bytecode/ClassFile;->thisClass:I

    invoke-virtual {v4, v5}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    .line 808
    return-void
.end method

.method private testExistingField(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "descriptor"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/DuplicateMemberException;
        }
    .end annotation

    .prologue
    .line 598
    iget-object v2, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    .line 599
    .local v0, "it":Ljava/util/ListIterator;
    :cond_7
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    .line 600
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/FieldInfo;

    .line 601
    .local v1, "minfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 602
    new-instance v2, Ljavassist/bytecode/DuplicateMemberException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "duplicate field: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljavassist/bytecode/DuplicateMemberException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 604
    .end local v1    # "minfo":Ljavassist/bytecode/FieldInfo;
    :cond_36
    return-void
.end method

.method private testExistingMethod(Ljavassist/bytecode/MethodInfo;)V
    .registers 8
    .param p1, "newMinfo"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/DuplicateMemberException;
        }
    .end annotation

    .prologue
    .line 669
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v2

    .line 670
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p1}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 671
    .local v0, "descriptor":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v1

    .line 672
    .local v1, "it":Ljava/util/ListIterator;
    :cond_f
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_48

    .line 673
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavassist/bytecode/MethodInfo;

    invoke-static {p1, v2, v0, v3, v1}, Ljavassist/bytecode/ClassFile;->isDuplicated(Ljavassist/bytecode/MethodInfo;Ljava/lang/String;Ljava/lang/String;Ljavassist/bytecode/MethodInfo;Ljava/util/ListIterator;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 674
    new-instance v3, Ljavassist/bytecode/DuplicateMemberException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "duplicate method: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " in "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavassist/bytecode/DuplicateMemberException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 676
    :cond_48
    return-void
.end method


# virtual methods
.method public addAttribute(Ljavassist/bytecode/AttributeInfo;)V
    .registers 4
    .param p1, "info"    # Ljavassist/bytecode/AttributeInfo;

    .prologue
    .line 751
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljavassist/bytecode/AttributeInfo;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljavassist/bytecode/AttributeInfo;->remove(Ljava/util/ArrayList;Ljava/lang/String;)V

    .line 752
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 753
    return-void
.end method

.method public addField(Ljavassist/bytecode/FieldInfo;)V
    .registers 4
    .param p1, "finfo"    # Ljavassist/bytecode/FieldInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/DuplicateMemberException;
        }
    .end annotation

    .prologue
    .line 580
    invoke-virtual {p1}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Ljavassist/bytecode/ClassFile;->testExistingField(Ljava/lang/String;Ljava/lang/String;)V

    .line 581
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 582
    return-void
.end method

.method public final addField2(Ljavassist/bytecode/FieldInfo;)V
    .registers 3
    .param p1, "finfo"    # Ljavassist/bytecode/FieldInfo;

    .prologue
    .line 593
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 594
    return-void
.end method

.method public addInterface(Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 549
    const/4 v3, 0x0

    iput-object v3, p0, Ljavassist/bytecode/ClassFile;->cachedInterfaces:[Ljava/lang/String;

    .line 550
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v3, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v0

    .line 551
    .local v0, "info":I
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    if-nez v3, :cond_18

    .line 552
    const/4 v3, 0x1

    new-array v3, v3, [I

    iput-object v3, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    .line 553
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    aput v0, v3, v4

    .line 562
    :goto_17
    return-void

    .line 556
    :cond_18
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    array-length v1, v3

    .line 557
    .local v1, "n":I
    add-int/lit8 v3, v1, 0x1

    new-array v2, v3, [I

    .line 558
    .local v2, "newarray":[I
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    invoke-static {v3, v4, v2, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 559
    aput v0, v2, v1

    .line 560
    iput-object v2, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    goto :goto_17
.end method

.method public addMethod(Ljavassist/bytecode/MethodInfo;)V
    .registers 3
    .param p1, "minfo"    # Ljavassist/bytecode/MethodInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/bytecode/DuplicateMemberException;
        }
    .end annotation

    .prologue
    .line 650
    invoke-direct {p0, p1}, Ljavassist/bytecode/ClassFile;->testExistingMethod(Ljavassist/bytecode/MethodInfo;)V

    .line 651
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 652
    return-void
.end method

.method public final addMethod2(Ljavassist/bytecode/MethodInfo;)V
    .registers 3
    .param p1, "minfo"    # Ljavassist/bytecode/MethodInfo;

    .prologue
    .line 663
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 664
    return-void
.end method

.method public compact()V
    .registers 8

    .prologue
    .line 177
    invoke-direct {p0}, Ljavassist/bytecode/ClassFile;->compact0()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 178
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 179
    .local v3, "list":Ljava/util/ArrayList;
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 180
    .local v5, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    if-ge v2, v5, :cond_19

    .line 181
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavassist/bytecode/MethodInfo;

    .line 182
    .local v4, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v4, v0}, Ljavassist/bytecode/MethodInfo;->compact(Ljavassist/bytecode/ConstPool;)V

    .line 180
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 185
    .end local v4    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_19
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    .line 186
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 187
    const/4 v2, 0x0

    :goto_20
    if-ge v2, v5, :cond_2e

    .line 188
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/FieldInfo;

    .line 189
    .local v1, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v1, v0}, Ljavassist/bytecode/FieldInfo;->compact(Ljavassist/bytecode/ConstPool;)V

    .line 187
    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    .line 192
    .end local v1    # "finfo":Ljavassist/bytecode/FieldInfo;
    :cond_2e
    iget-object v6, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    invoke-static {v6, v0}, Ljavassist/bytecode/AttributeInfo;->copyAll(Ljava/util/ArrayList;Ljavassist/bytecode/ConstPool;)Ljava/util/ArrayList;

    move-result-object v6

    iput-object v6, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    .line 193
    iput-object v0, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    .line 194
    return-void
.end method

.method public getAccessFlags()I
    .registers 2

    .prologue
    .line 295
    iget v0, p0, Ljavassist/bytecode/ClassFile;->accessFlags:I

    return v0
.end method

.method public getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 733
    iget-object v2, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    .line 734
    .local v2, "list":Ljava/util/ArrayList;
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 735
    .local v3, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    if-ge v1, v3, :cond_1d

    .line 736
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AttributeInfo;

    .line 737
    .local v0, "ai":Ljavassist/bytecode/AttributeInfo;
    invoke-virtual {v0}, Ljavassist/bytecode/AttributeInfo;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 741
    .end local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    :goto_19
    return-object v0

    .line 735
    .restart local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 741
    .end local v0    # "ai":Ljavassist/bytecode/AttributeInfo;
    :cond_1d
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public getAttributes()Ljava/util/List;
    .registers 2

    .prologue
    .line 721
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getConstPool()Ljavassist/bytecode/ConstPool;
    .registers 2

    .prologue
    .line 265
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    return-object v0
.end method

.method public getFields()Ljava/util/List;
    .registers 2

    .prologue
    .line 571
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getInnerAccessFlags()I
    .registers 7

    .prologue
    const/4 v4, -0x1

    .line 319
    const-string v5, "InnerClasses"

    invoke-virtual {p0, v5}, Ljavassist/bytecode/ClassFile;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/InnerClassesAttribute;

    .line 321
    .local v1, "ica":Ljavassist/bytecode/InnerClassesAttribute;
    if-nez v1, :cond_c

    .line 330
    :cond_b
    :goto_b
    return v4

    .line 324
    :cond_c
    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getName()Ljava/lang/String;

    move-result-object v3

    .line 325
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v1}, Ljavassist/bytecode/InnerClassesAttribute;->tableLength()I

    move-result v2

    .line 326
    .local v2, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_15
    if-ge v0, v2, :cond_b

    .line 327
    invoke-virtual {v1, v0}, Ljavassist/bytecode/InnerClassesAttribute;->innerClass(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_26

    .line 328
    invoke-virtual {v1, v0}, Ljavassist/bytecode/InnerClassesAttribute;->accessFlags(I)I

    move-result v4

    goto :goto_b

    .line 326
    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_15
.end method

.method public getInterfaces()[Ljava/lang/String;
    .registers 7

    .prologue
    .line 510
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->cachedInterfaces:[Ljava/lang/String;

    if-eqz v4, :cond_7

    .line 511
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->cachedInterfaces:[Ljava/lang/String;

    .line 526
    :goto_6
    return-object v3

    .line 513
    :cond_7
    const/4 v3, 0x0

    .line 514
    .local v3, "rtn":[Ljava/lang/String;
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    if-nez v4, :cond_12

    .line 515
    const/4 v4, 0x0

    new-array v3, v4, [Ljava/lang/String;

    .line 525
    :goto_f
    iput-object v3, p0, Ljavassist/bytecode/ClassFile;->cachedInterfaces:[Ljava/lang/String;

    goto :goto_6

    .line 517
    :cond_12
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    array-length v2, v4

    .line 518
    .local v2, "n":I
    new-array v1, v2, [Ljava/lang/String;

    .line 519
    .local v1, "list":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_18
    if-ge v0, v2, :cond_29

    .line 520
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    iget-object v5, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    aget v5, v5, v0

    invoke-virtual {v4, v5}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v0

    .line 519
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 522
    :cond_29
    move-object v3, v1

    goto :goto_f
.end method

.method public getMajorVersion()I
    .registers 2

    .prologue
    .line 859
    iget v0, p0, Ljavassist/bytecode/ClassFile;->major:I

    return v0
.end method

.method public getMethod(Ljava/lang/String;)Ljavassist/bytecode/MethodInfo;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 623
    iget-object v1, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 624
    .local v1, "list":Ljava/util/ArrayList;
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 625
    .local v3, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_7
    if-ge v0, v3, :cond_1d

    .line 626
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavassist/bytecode/MethodInfo;

    .line 627
    .local v2, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v2}, Ljavassist/bytecode/MethodInfo;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 631
    .end local v2    # "minfo":Ljavassist/bytecode/MethodInfo;
    :goto_19
    return-object v2

    .line 625
    .restart local v2    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 631
    .end local v2    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_1d
    const/4 v2, 0x0

    goto :goto_19
.end method

.method public getMethods()Ljava/util/List;
    .registers 2

    .prologue
    .line 613
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getMinorVersion()I
    .registers 2

    .prologue
    .line 878
    iget v0, p0, Ljavassist/bytecode/ClassFile;->minor:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 337
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    return-object v0
.end method

.method public final getRefClasses(Ljava/util/Map;)V
    .registers 9
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 483
    iget-object v6, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v6, p1}, Ljavassist/bytecode/ConstPool;->renameClass(Ljava/util/Map;)V

    .line 485
    iget-object v6, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    invoke-static {v6, p1}, Ljavassist/bytecode/AttributeInfo;->getRefClasses(Ljava/util/List;Ljava/util/Map;)V

    .line 486
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 487
    .local v3, "list":Ljava/util/ArrayList;
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 488
    .local v5, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    if-ge v2, v5, :cond_2a

    .line 489
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavassist/bytecode/MethodInfo;

    .line 490
    .local v4, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 491
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0, p1}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 492
    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getAttributes()Ljava/util/List;

    move-result-object v6

    invoke-static {v6, p1}, Ljavassist/bytecode/AttributeInfo;->getRefClasses(Ljava/util/List;Ljava/util/Map;)V

    .line 488
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 495
    .end local v0    # "desc":Ljava/lang/String;
    .end local v4    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_2a
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    .line 496
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 497
    const/4 v2, 0x0

    :goto_31
    if-ge v2, v5, :cond_4a

    .line 498
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/FieldInfo;

    .line 499
    .local v1, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 500
    .restart local v0    # "desc":Ljava/lang/String;
    invoke-static {v0, p1}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 501
    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getAttributes()Ljava/util/List;

    move-result-object v6

    invoke-static {v6, p1}, Ljavassist/bytecode/AttributeInfo;->getRefClasses(Ljava/util/List;Ljava/util/Map;)V

    .line 497
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 503
    .end local v0    # "desc":Ljava/lang/String;
    .end local v1    # "finfo":Ljavassist/bytecode/FieldInfo;
    :cond_4a
    return-void
.end method

.method public getSourceFile()Ljava/lang/String;
    .registers 3

    .prologue
    .line 761
    const-string v1, "SourceFile"

    invoke-virtual {p0, v1}, Ljavassist/bytecode/ClassFile;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/SourceFileAttribute;

    .line 763
    .local v0, "sf":Ljavassist/bytecode/SourceFileAttribute;
    if-nez v0, :cond_c

    .line 764
    const/4 v1, 0x0

    .line 766
    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Ljavassist/bytecode/SourceFileAttribute;->getFileName()Ljava/lang/String;

    move-result-object v1

    goto :goto_b
.end method

.method public getStaticInitializer()Ljavassist/bytecode/MethodInfo;
    .registers 2

    .prologue
    .line 639
    const-string v0, "<clinit>"

    invoke-virtual {p0, v0}, Ljavassist/bytecode/ClassFile;->getMethod(Ljava/lang/String;)Ljavassist/bytecode/MethodInfo;

    move-result-object v0

    return-object v0
.end method

.method public getSuperclass()Ljava/lang/String;
    .registers 3

    .prologue
    .line 352
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->cachedSuperclass:Ljava/lang/String;

    if-nez v0, :cond_e

    .line 353
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/ClassFile;->superClass:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getClassInfo(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ljavassist/bytecode/ClassFile;->cachedSuperclass:Ljava/lang/String;

    .line 355
    :cond_e
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->cachedSuperclass:Ljava/lang/String;

    return-object v0
.end method

.method public getSuperclassId()I
    .registers 2

    .prologue
    .line 363
    iget v0, p0, Ljavassist/bytecode/ClassFile;->superClass:I

    return v0
.end method

.method public isAbstract()Z
    .registers 2

    .prologue
    .line 286
    iget v0, p0, Ljavassist/bytecode/ClassFile;->accessFlags:I

    and-int/lit16 v0, v0, 0x400

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isFinal()Z
    .registers 2

    .prologue
    .line 279
    iget v0, p0, Ljavassist/bytecode/ClassFile;->accessFlags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isInterface()Z
    .registers 2

    .prologue
    .line 272
    iget v0, p0, Ljavassist/bytecode/ClassFile;->accessFlags:I

    and-int/lit16 v0, v0, 0x200

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public prune()V
    .registers 13

    .prologue
    const/4 v11, 0x0

    .line 220
    invoke-direct {p0}, Ljavassist/bytecode/ClassFile;->compact0()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 221
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 222
    .local v7, "newAttributes":Ljava/util/ArrayList;
    const-string v10, "RuntimeInvisibleAnnotations"

    invoke-virtual {p0, v10}, Ljavassist/bytecode/ClassFile;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v3

    .line 224
    .local v3, "invisibleAnnotations":Ljavassist/bytecode/AttributeInfo;
    if-eqz v3, :cond_19

    .line 225
    invoke-virtual {v3, v0, v11}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v3

    .line 226
    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 229
    :cond_19
    const-string v10, "RuntimeVisibleAnnotations"

    invoke-virtual {p0, v10}, Ljavassist/bytecode/ClassFile;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v9

    .line 231
    .local v9, "visibleAnnotations":Ljavassist/bytecode/AttributeInfo;
    if-eqz v9, :cond_28

    .line 232
    invoke-virtual {v9, v0, v11}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v9

    .line 233
    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 236
    :cond_28
    const-string v10, "Signature"

    invoke-virtual {p0, v10}, Ljavassist/bytecode/ClassFile;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v8

    .line 238
    .local v8, "signature":Ljavassist/bytecode/AttributeInfo;
    if-eqz v8, :cond_37

    .line 239
    invoke-virtual {v8, v0, v11}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v8

    .line 240
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 243
    :cond_37
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 244
    .local v4, "list":Ljava/util/ArrayList;
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 245
    .local v6, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_3e
    if-ge v2, v6, :cond_4c

    .line 246
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljavassist/bytecode/MethodInfo;

    .line 247
    .local v5, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v5, v0}, Ljavassist/bytecode/MethodInfo;->prune(Ljavassist/bytecode/ConstPool;)V

    .line 245
    add-int/lit8 v2, v2, 0x1

    goto :goto_3e

    .line 250
    .end local v5    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_4c
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    .line 251
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 252
    const/4 v2, 0x0

    :goto_53
    if-ge v2, v6, :cond_61

    .line 253
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/FieldInfo;

    .line 254
    .local v1, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v1, v0}, Ljavassist/bytecode/FieldInfo;->prune(Ljavassist/bytecode/ConstPool;)V

    .line 252
    add-int/lit8 v2, v2, 0x1

    goto :goto_53

    .line 257
    .end local v1    # "finfo":Ljavassist/bytecode/FieldInfo;
    :cond_61
    iput-object v7, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    .line 258
    iput-object v0, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    .line 259
    return-void
.end method

.method public final renameClass(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 411
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 439
    :cond_6
    return-void

    .line 414
    :cond_7
    iget-object v6, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11

    .line 415
    iput-object p2, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    .line 417
    :cond_11
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 418
    invoke-static {p2}, Ljavassist/bytecode/Descriptor;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 419
    iget-object v6, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v6, p1, p2}, Ljavassist/bytecode/ConstPool;->renameClass(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    iget-object v6, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    invoke-static {v6, p1, p2}, Ljavassist/bytecode/AttributeInfo;->renameClass(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 423
    .local v3, "list":Ljava/util/ArrayList;
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 424
    .local v5, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2a
    if-ge v2, v5, :cond_47

    .line 425
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljavassist/bytecode/MethodInfo;

    .line 426
    .local v4, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 427
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0, p1, p2}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljavassist/bytecode/MethodInfo;->setDescriptor(Ljava/lang/String;)V

    .line 428
    invoke-virtual {v4}, Ljavassist/bytecode/MethodInfo;->getAttributes()Ljava/util/List;

    move-result-object v6

    invoke-static {v6, p1, p2}, Ljavassist/bytecode/AttributeInfo;->renameClass(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 424
    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    .line 431
    .end local v0    # "desc":Ljava/lang/String;
    .end local v4    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_47
    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    .line 432
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    .line 433
    const/4 v2, 0x0

    :goto_4e
    if-ge v2, v5, :cond_6

    .line 434
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/FieldInfo;

    .line 435
    .local v1, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 436
    .restart local v0    # "desc":Ljava/lang/String;
    invoke-static {v0, p1, p2}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljavassist/bytecode/FieldInfo;->setDescriptor(Ljava/lang/String;)V

    .line 437
    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getAttributes()Ljava/util/List;

    move-result-object v6

    invoke-static {v6, p1, p2}, Ljavassist/bytecode/AttributeInfo;->renameClass(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    add-int/lit8 v2, v2, 0x1

    goto :goto_4e
.end method

.method public final renameClass(Ljava/util/Map;)V
    .registers 10
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 451
    iget-object v7, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    invoke-static {v7}, Ljavassist/bytecode/Descriptor;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 453
    .local v3, "jvmNewThisName":Ljava/lang/String;
    if-eqz v3, :cond_14

    .line 454
    invoke-static {v3}, Ljavassist/bytecode/Descriptor;->toJavaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    .line 456
    :cond_14
    iget-object v7, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v7, p1}, Ljavassist/bytecode/ConstPool;->renameClass(Ljava/util/Map;)V

    .line 458
    iget-object v7, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    invoke-static {v7, p1}, Ljavassist/bytecode/AttributeInfo;->renameClass(Ljava/util/List;Ljava/util/Map;)V

    .line 459
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 460
    .local v4, "list":Ljava/util/ArrayList;
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 461
    .local v6, "n":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_25
    if-ge v2, v6, :cond_42

    .line 462
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljavassist/bytecode/MethodInfo;

    .line 463
    .local v5, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 464
    .local v0, "desc":Ljava/lang/String;
    invoke-static {v0, p1}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljavassist/bytecode/MethodInfo;->setDescriptor(Ljava/lang/String;)V

    .line 465
    invoke-virtual {v5}, Ljavassist/bytecode/MethodInfo;->getAttributes()Ljava/util/List;

    move-result-object v7

    invoke-static {v7, p1}, Ljavassist/bytecode/AttributeInfo;->renameClass(Ljava/util/List;Ljava/util/Map;)V

    .line 461
    add-int/lit8 v2, v2, 0x1

    goto :goto_25

    .line 468
    .end local v0    # "desc":Ljava/lang/String;
    .end local v5    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_42
    iget-object v4, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    .line 469
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 470
    const/4 v2, 0x0

    :goto_49
    if-ge v2, v6, :cond_66

    .line 471
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/FieldInfo;

    .line 472
    .local v1, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    .line 473
    .restart local v0    # "desc":Ljava/lang/String;
    invoke-static {v0, p1}, Ljavassist/bytecode/Descriptor;->rename(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljavassist/bytecode/FieldInfo;->setDescriptor(Ljava/lang/String;)V

    .line 474
    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getAttributes()Ljava/util/List;

    move-result-object v7

    invoke-static {v7, p1}, Ljavassist/bytecode/AttributeInfo;->renameClass(Ljava/util/List;Ljava/util/Map;)V

    .line 470
    add-int/lit8 v2, v2, 0x1

    goto :goto_49

    .line 476
    .end local v0    # "desc":Ljava/lang/String;
    .end local v1    # "finfo":Ljavassist/bytecode/FieldInfo;
    :cond_66
    return-void
.end method

.method public setAccessFlags(I)V
    .registers 3
    .param p1, "acc"    # I

    .prologue
    .line 304
    and-int/lit16 v0, p1, 0x200

    if-nez v0, :cond_6

    .line 305
    or-int/lit8 p1, p1, 0x20

    .line 307
    :cond_6
    iput p1, p0, Ljavassist/bytecode/ClassFile;->accessFlags:I

    .line 308
    return-void
.end method

.method public setInterfaces([Ljava/lang/String;)V
    .registers 7
    .param p1, "nameList"    # [Ljava/lang/String;

    .prologue
    .line 536
    const/4 v2, 0x0

    iput-object v2, p0, Ljavassist/bytecode/ClassFile;->cachedInterfaces:[Ljava/lang/String;

    .line 537
    if-eqz p1, :cond_1c

    .line 538
    array-length v1, p1

    .line 539
    .local v1, "n":I
    new-array v2, v1, [I

    iput-object v2, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    .line 540
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v1, :cond_1c

    .line 541
    iget-object v2, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    iget-object v3, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    aget-object v4, p1, v0

    invoke-virtual {v3, v4}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v3

    aput v3, v2, v0

    .line 540
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 543
    .end local v0    # "i":I
    .end local v1    # "n":I
    :cond_1c
    return-void
.end method

.method public setMajorVersion(I)V
    .registers 2
    .param p1, "major"    # I

    .prologue
    .line 869
    iput p1, p0, Ljavassist/bytecode/ClassFile;->major:I

    .line 870
    return-void
.end method

.method public setMinorVersion(I)V
    .registers 2
    .param p1, "minor"    # I

    .prologue
    .line 888
    iput p1, p0, Ljavassist/bytecode/ClassFile;->minor:I

    .line 889
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 345
    iget-object v0, p0, Ljavassist/bytecode/ClassFile;->thisclassname:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Ljavassist/bytecode/ClassFile;->renameClass(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    return-void
.end method

.method public setSuperclass(Ljava/lang/String;)V
    .registers 8
    .param p1, "superclass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 375
    if-nez p1, :cond_4

    .line 376
    const-string p1, "java.lang.Object"

    .line 379
    :cond_4
    :try_start_4
    iget-object v5, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v5, p1}, Ljavassist/bytecode/ConstPool;->addClassInfo(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Ljavassist/bytecode/ClassFile;->superClass:I

    .line 380
    iget-object v2, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 381
    .local v2, "list":Ljava/util/ArrayList;
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 382
    .local v4, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    if-ge v1, v4, :cond_28

    .line 383
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavassist/bytecode/MethodInfo;

    .line 384
    .local v3, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v3, p1}, Ljavassist/bytecode/MethodInfo;->setSuperclass(Ljava/lang/String;)V
    :try_end_1e
    .catch Ljavassist/bytecode/BadBytecode; {:try_start_4 .. :try_end_1e} :catch_21

    .line 382
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 387
    .end local v1    # "i":I
    .end local v2    # "list":Ljava/util/ArrayList;
    .end local v3    # "minfo":Ljavassist/bytecode/MethodInfo;
    .end local v4    # "n":I
    :catch_21
    move-exception v0

    .line 388
    .local v0, "e":Ljavassist/bytecode/BadBytecode;
    new-instance v5, Ljavassist/CannotCompileException;

    invoke-direct {v5, v0}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 390
    .end local v0    # "e":Ljavassist/bytecode/BadBytecode;
    .restart local v1    # "i":I
    .restart local v2    # "list":Ljava/util/ArrayList;
    .restart local v4    # "n":I
    :cond_28
    iput-object p1, p0, Ljavassist/bytecode/ClassFile;->cachedSuperclass:Ljava/lang/String;

    .line 391
    return-void
.end method

.method public setVersionToJava5()V
    .registers 2

    .prologue
    .line 899
    const/16 v0, 0x31

    iput v0, p0, Ljavassist/bytecode/ClassFile;->major:I

    .line 900
    const/4 v0, 0x0

    iput v0, p0, Ljavassist/bytecode/ClassFile;->minor:I

    .line 901
    return-void
.end method

.method public write(Ljava/io/DataOutputStream;)V
    .registers 8
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 816
    const v5, -0x35014542    # -8346975.0f

    invoke-virtual {p1, v5}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 817
    iget v5, p0, Ljavassist/bytecode/ClassFile;->minor:I

    invoke-virtual {p1, v5}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 818
    iget v5, p0, Ljavassist/bytecode/ClassFile;->major:I

    invoke-virtual {p1, v5}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 819
    iget-object v5, p0, Ljavassist/bytecode/ClassFile;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v5, p1}, Ljavassist/bytecode/ConstPool;->write(Ljava/io/DataOutputStream;)V

    .line 820
    iget v5, p0, Ljavassist/bytecode/ClassFile;->accessFlags:I

    invoke-virtual {p1, v5}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 821
    iget v5, p0, Ljavassist/bytecode/ClassFile;->thisClass:I

    invoke-virtual {p1, v5}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 822
    iget v5, p0, Ljavassist/bytecode/ClassFile;->superClass:I

    invoke-virtual {p1, v5}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 824
    iget-object v5, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    if-nez v5, :cond_39

    .line 825
    const/4 v4, 0x0

    .line 829
    .local v4, "n":I
    :goto_29
    invoke-virtual {p1, v4}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 830
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2d
    if-ge v1, v4, :cond_3d

    .line 831
    iget-object v5, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    aget v5, v5, v1

    invoke-virtual {p1, v5}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 830
    add-int/lit8 v1, v1, 0x1

    goto :goto_2d

    .line 827
    .end local v1    # "i":I
    .end local v4    # "n":I
    :cond_39
    iget-object v5, p0, Ljavassist/bytecode/ClassFile;->interfaces:[I

    array-length v4, v5

    .restart local v4    # "n":I
    goto :goto_29

    .line 833
    .restart local v1    # "i":I
    :cond_3d
    iget-object v2, p0, Ljavassist/bytecode/ClassFile;->fields:Ljava/util/ArrayList;

    .line 834
    .local v2, "list":Ljava/util/ArrayList;
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 835
    invoke-virtual {p1, v4}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 836
    const/4 v1, 0x0

    :goto_47
    if-ge v1, v4, :cond_55

    .line 837
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/FieldInfo;

    .line 838
    .local v0, "finfo":Ljavassist/bytecode/FieldInfo;
    invoke-virtual {v0, p1}, Ljavassist/bytecode/FieldInfo;->write(Ljava/io/DataOutputStream;)V

    .line 836
    add-int/lit8 v1, v1, 0x1

    goto :goto_47

    .line 841
    .end local v0    # "finfo":Ljavassist/bytecode/FieldInfo;
    :cond_55
    iget-object v2, p0, Ljavassist/bytecode/ClassFile;->methods:Ljava/util/ArrayList;

    .line 842
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    .line 843
    invoke-virtual {p1, v4}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 844
    const/4 v1, 0x0

    :goto_5f
    if-ge v1, v4, :cond_6d

    .line 845
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljavassist/bytecode/MethodInfo;

    .line 846
    .local v3, "minfo":Ljavassist/bytecode/MethodInfo;
    invoke-virtual {v3, p1}, Ljavassist/bytecode/MethodInfo;->write(Ljava/io/DataOutputStream;)V

    .line 844
    add-int/lit8 v1, v1, 0x1

    goto :goto_5f

    .line 849
    .end local v3    # "minfo":Ljavassist/bytecode/MethodInfo;
    :cond_6d
    iget-object v5, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {p1, v5}, Ljava/io/DataOutputStream;->writeShort(I)V

    .line 850
    iget-object v5, p0, Ljavassist/bytecode/ClassFile;->attributes:Ljava/util/ArrayList;

    invoke-static {v5, p1}, Ljavassist/bytecode/AttributeInfo;->writeAll(Ljava/util/ArrayList;Ljava/io/DataOutputStream;)V

    .line 851
    return-void
.end method
