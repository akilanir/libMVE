.class public Ljavassist/bytecode/annotation/Annotation;
.super Ljava/lang/Object;
.source "Annotation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/annotation/Annotation$Pair;
    }
.end annotation


# instance fields
.field members:Ljava/util/LinkedHashMap;

.field pool:Ljavassist/bytecode/ConstPool;

.field typeIndex:I


# direct methods
.method public constructor <init>(ILjavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "type"    # I
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p2, p0, Ljavassist/bytecode/annotation/Annotation;->pool:Ljavassist/bytecode/ConstPool;

    .line 73
    iput p1, p0, Ljavassist/bytecode/annotation/Annotation;->typeIndex:I

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljavassist/bytecode/ConstPool;)V
    .registers 4
    .param p1, "typeName"    # Ljava/lang/String;
    .param p2, "cp"    # Ljavassist/bytecode/ConstPool;

    .prologue
    .line 87
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0, p2}, Ljavassist/bytecode/annotation/Annotation;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 88
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)V
    .registers 8
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-virtual {p2}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljavassist/bytecode/Descriptor;->of(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v3

    invoke-direct {p0, v3, p1}, Ljavassist/bytecode/annotation/Annotation;-><init>(ILjavassist/bytecode/ConstPool;)V

    .line 105
    invoke-virtual {p2}, Ljavassist/CtClass;->isInterface()Z

    move-result v3

    if-nez v3, :cond_1d

    .line 106
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Only interfaces are allowed for Annotation creation."

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 109
    :cond_1d
    invoke-virtual {p2}, Ljavassist/CtClass;->getDeclaredMethods()[Ljavassist/CtMethod;

    move-result-object v1

    .line 110
    .local v1, "methods":[Ljavassist/CtMethod;
    array-length v3, v1

    if-lez v3, :cond_2b

    .line 111
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v3, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    .line 114
    :cond_2b
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2c
    array-length v3, v1

    if-ge v0, v3, :cond_45

    .line 115
    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljavassist/CtMethod;->getReturnType()Ljavassist/CtClass;

    move-result-object v2

    .line 116
    .local v2, "returnType":Ljavassist/CtClass;
    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2}, Ljavassist/bytecode/annotation/Annotation;->createMemberValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)Ljavassist/bytecode/annotation/MemberValue;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Ljavassist/bytecode/annotation/Annotation;->addMemberValue(Ljava/lang/String;Ljavassist/bytecode/annotation/MemberValue;)V

    .line 114
    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    .line 120
    .end local v2    # "returnType":Ljavassist/CtClass;
    :cond_45
    return-void
.end method

.method private addMemberValue(Ljavassist/bytecode/annotation/Annotation$Pair;)V
    .registers 5
    .param p1, "pair"    # Ljavassist/bytecode/annotation/Annotation$Pair;

    .prologue
    .line 205
    iget-object v1, p0, Ljavassist/bytecode/annotation/Annotation;->pool:Ljavassist/bytecode/ConstPool;

    iget v2, p1, Ljavassist/bytecode/annotation/Annotation$Pair;->name:I

    invoke-virtual {v1, v2}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    if-nez v1, :cond_13

    .line 207
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    .line 209
    :cond_13
    iget-object v1, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, v0, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    return-void
.end method

.method public static createMemberValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)Ljavassist/bytecode/annotation/MemberValue;
    .registers 8
    .param p0, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p1, "type"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 133
    sget-object v4, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    if-ne p1, v4, :cond_a

    .line 134
    new-instance v1, Ljavassist/bytecode/annotation/BooleanMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/BooleanMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 168
    :goto_9
    return-object v1

    .line 135
    :cond_a
    sget-object v4, Ljavassist/CtClass;->byteType:Ljavassist/CtClass;

    if-ne p1, v4, :cond_14

    .line 136
    new-instance v1, Ljavassist/bytecode/annotation/ByteMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/ByteMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 137
    :cond_14
    sget-object v4, Ljavassist/CtClass;->charType:Ljavassist/CtClass;

    if-ne p1, v4, :cond_1e

    .line 138
    new-instance v1, Ljavassist/bytecode/annotation/CharMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/CharMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 139
    :cond_1e
    sget-object v4, Ljavassist/CtClass;->shortType:Ljavassist/CtClass;

    if-ne p1, v4, :cond_28

    .line 140
    new-instance v1, Ljavassist/bytecode/annotation/ShortMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/ShortMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 141
    :cond_28
    sget-object v4, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    if-ne p1, v4, :cond_32

    .line 142
    new-instance v1, Ljavassist/bytecode/annotation/IntegerMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/IntegerMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 143
    :cond_32
    sget-object v4, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    if-ne p1, v4, :cond_3c

    .line 144
    new-instance v1, Ljavassist/bytecode/annotation/LongMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/LongMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 145
    :cond_3c
    sget-object v4, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    if-ne p1, v4, :cond_46

    .line 146
    new-instance v1, Ljavassist/bytecode/annotation/FloatMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/FloatMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 147
    :cond_46
    sget-object v4, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    if-ne p1, v4, :cond_50

    .line 148
    new-instance v1, Ljavassist/bytecode/annotation/DoubleMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/DoubleMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 149
    :cond_50
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "java.lang.Class"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_62

    .line 150
    new-instance v1, Ljavassist/bytecode/annotation/ClassMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/ClassMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 151
    :cond_62
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "java.lang.String"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_74

    .line 152
    new-instance v1, Ljavassist/bytecode/annotation/StringMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/StringMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 153
    :cond_74
    invoke-virtual {p1}, Ljavassist/CtClass;->isArray()Z

    move-result v4

    if-eqz v4, :cond_88

    .line 154
    invoke-virtual {p1}, Ljavassist/CtClass;->getComponentType()Ljavassist/CtClass;

    move-result-object v0

    .line 155
    .local v0, "arrayType":Ljavassist/CtClass;
    invoke-static {p0, v0}, Ljavassist/bytecode/annotation/Annotation;->createMemberValue(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)Ljavassist/bytecode/annotation/MemberValue;

    move-result-object v3

    .line 156
    .local v3, "member":Ljavassist/bytecode/annotation/MemberValue;
    new-instance v1, Ljavassist/bytecode/annotation/ArrayMemberValue;

    invoke-direct {v1, v3, p0}, Ljavassist/bytecode/annotation/ArrayMemberValue;-><init>(Ljavassist/bytecode/annotation/MemberValue;Ljavassist/bytecode/ConstPool;)V

    goto :goto_9

    .line 158
    .end local v0    # "arrayType":Ljavassist/CtClass;
    .end local v3    # "member":Ljavassist/bytecode/annotation/MemberValue;
    :cond_88
    invoke-virtual {p1}, Ljavassist/CtClass;->isInterface()Z

    move-result v4

    if-eqz v4, :cond_9a

    .line 159
    new-instance v2, Ljavassist/bytecode/annotation/Annotation;

    invoke-direct {v2, p0, p1}, Ljavassist/bytecode/annotation/Annotation;-><init>(Ljavassist/bytecode/ConstPool;Ljavassist/CtClass;)V

    .line 160
    .local v2, "info":Ljavassist/bytecode/annotation/Annotation;
    new-instance v1, Ljavassist/bytecode/annotation/AnnotationMemberValue;

    invoke-direct {v1, v2, p0}, Ljavassist/bytecode/annotation/AnnotationMemberValue;-><init>(Ljavassist/bytecode/annotation/Annotation;Ljavassist/bytecode/ConstPool;)V

    goto/16 :goto_9

    .line 166
    .end local v2    # "info":Ljavassist/bytecode/annotation/Annotation;
    :cond_9a
    new-instance v1, Ljavassist/bytecode/annotation/EnumMemberValue;

    invoke-direct {v1, p0}, Ljavassist/bytecode/annotation/EnumMemberValue;-><init>(Ljavassist/bytecode/ConstPool;)V

    .line 167
    .local v1, "emv":Ljavassist/bytecode/annotation/EnumMemberValue;
    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljavassist/bytecode/annotation/EnumMemberValue;->setType(Ljava/lang/String;)V

    goto/16 :goto_9
.end method


# virtual methods
.method public addMemberValue(ILjavassist/bytecode/annotation/MemberValue;)V
    .registers 4
    .param p1, "nameIndex"    # I
    .param p2, "value"    # Ljavassist/bytecode/annotation/MemberValue;

    .prologue
    .line 182
    new-instance v0, Ljavassist/bytecode/annotation/Annotation$Pair;

    invoke-direct {v0}, Ljavassist/bytecode/annotation/Annotation$Pair;-><init>()V

    .line 183
    .local v0, "p":Ljavassist/bytecode/annotation/Annotation$Pair;
    iput p1, v0, Ljavassist/bytecode/annotation/Annotation$Pair;->name:I

    .line 184
    iput-object p2, v0, Ljavassist/bytecode/annotation/Annotation$Pair;->value:Ljavassist/bytecode/annotation/MemberValue;

    .line 185
    invoke-direct {p0, v0}, Ljavassist/bytecode/annotation/Annotation;->addMemberValue(Ljavassist/bytecode/annotation/Annotation$Pair;)V

    .line 186
    return-void
.end method

.method public addMemberValue(Ljava/lang/String;Ljavassist/bytecode/annotation/MemberValue;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljavassist/bytecode/annotation/MemberValue;

    .prologue
    .line 195
    new-instance v0, Ljavassist/bytecode/annotation/Annotation$Pair;

    invoke-direct {v0}, Ljavassist/bytecode/annotation/Annotation$Pair;-><init>()V

    .line 196
    .local v0, "p":Ljavassist/bytecode/annotation/Annotation$Pair;
    iget-object v1, p0, Ljavassist/bytecode/annotation/Annotation;->pool:Ljavassist/bytecode/ConstPool;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/ConstPool;->addUtf8Info(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Ljavassist/bytecode/annotation/Annotation$Pair;->name:I

    .line 197
    iput-object p2, v0, Ljavassist/bytecode/annotation/Annotation$Pair;->value:Ljavassist/bytecode/annotation/MemberValue;

    .line 198
    iget-object v1, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    if-nez v1, :cond_1a

    .line 199
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v1, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    .line 201
    :cond_1a
    iget-object v1, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 327
    if-ne p1, p0, :cond_5

    .line 346
    :cond_4
    :goto_4
    return v2

    .line 329
    :cond_5
    if-eqz p1, :cond_b

    instance-of v4, p1, Ljavassist/bytecode/annotation/Annotation;

    if-nez v4, :cond_d

    :cond_b
    move v2, v3

    .line 330
    goto :goto_4

    :cond_d
    move-object v0, p1

    .line 332
    check-cast v0, Ljavassist/bytecode/annotation/Annotation;

    .line 334
    .local v0, "other":Ljavassist/bytecode/annotation/Annotation;
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_20

    move v2, v3

    .line 335
    goto :goto_4

    .line 337
    :cond_20
    iget-object v1, v0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    .line 338
    .local v1, "otherMembers":Ljava/util/LinkedHashMap;
    iget-object v4, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    if-eq v4, v1, :cond_4

    .line 340
    iget-object v4, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    if-nez v4, :cond_2e

    .line 341
    if-eqz v1, :cond_4

    move v2, v3

    goto :goto_4

    .line 343
    :cond_2e
    if-nez v1, :cond_32

    move v2, v3

    .line 344
    goto :goto_4

    .line 346
    :cond_32
    iget-object v2, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v1}, Ljava/util/LinkedHashMap;->equals(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_4
.end method

.method public getMemberNames()Ljava/util/Set;
    .registers 2

    .prologue
    .line 248
    iget-object v0, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_6

    .line 249
    const/4 v0, 0x0

    .line 251
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    goto :goto_5
.end method

.method public getMemberValue(Ljava/lang/String;)Ljavassist/bytecode/annotation/MemberValue;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 270
    iget-object v2, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    if-nez v2, :cond_6

    .line 277
    :cond_5
    :goto_5
    return-object v1

    .line 273
    :cond_6
    iget-object v2, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    invoke-virtual {v2, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/annotation/Annotation$Pair;

    .line 274
    .local v0, "p":Ljavassist/bytecode/annotation/Annotation$Pair;
    if-eqz v0, :cond_5

    .line 277
    iget-object v1, v0, Ljavassist/bytecode/annotation/Annotation$Pair;->value:Ljavassist/bytecode/annotation/MemberValue;

    goto :goto_5
.end method

.method public getTypeName()Ljava/lang/String;
    .registers 3

    .prologue
    .line 239
    iget-object v0, p0, Ljavassist/bytecode/annotation/Annotation;->pool:Ljavassist/bytecode/ConstPool;

    iget v1, p0, Ljavassist/bytecode/annotation/Annotation;->typeIndex:I

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->toClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toAnnotationType(Ljava/lang/ClassLoader;Ljavassist/ClassPool;)Ljava/lang/Object;
    .registers 4
    .param p1, "cl"    # Ljava/lang/ClassLoader;
    .param p2, "cp"    # Ljavassist/ClassPool;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljavassist/bytecode/annotation/NoSuchClassError;
        }
    .end annotation

    .prologue
    .line 295
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Ljavassist/bytecode/annotation/MemberValue;->loadClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-static {p1, v0, p2, p0}, Ljavassist/bytecode/annotation/AnnotationImpl;->make(Ljava/lang/ClassLoader;Ljava/lang/Class;Ljavassist/ClassPool;Ljavassist/bytecode/annotation/Annotation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 216
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v3, "@"

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 217
    .local v0, "buf":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 218
    iget-object v3, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    if-eqz v3, :cond_4f

    .line 219
    const-string v3, "("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 220
    iget-object v3, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 221
    .local v1, "mit":Ljava/util/Iterator;
    :cond_21
    :goto_21
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4a

    .line 222
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 223
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0, v2}, Ljavassist/bytecode/annotation/Annotation;->getMemberValue(Ljava/lang/String;)Ljavassist/bytecode/annotation/MemberValue;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 224
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_21

    .line 225
    const-string v3, ", "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_21

    .line 227
    .end local v2    # "name":Ljava/lang/String;
    :cond_4a
    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 230
    .end local v1    # "mit":Ljava/util/Iterator;
    :cond_4f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V
    .registers 7
    .param p1, "writer"    # Ljavassist/bytecode/annotation/AnnotationsWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 307
    iget-object v3, p0, Ljavassist/bytecode/annotation/Annotation;->pool:Ljavassist/bytecode/ConstPool;

    iget v4, p0, Ljavassist/bytecode/annotation/Annotation;->typeIndex:I

    invoke-virtual {v3, v4}, Ljavassist/bytecode/ConstPool;->getUtf8Info(I)Ljava/lang/String;

    move-result-object v2

    .line 308
    .local v2, "typeName":Ljava/lang/String;
    iget-object v3, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    if-nez v3, :cond_11

    .line 309
    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Ljavassist/bytecode/annotation/AnnotationsWriter;->annotation(Ljava/lang/String;I)V

    .line 320
    :cond_10
    return-void

    .line 313
    :cond_11
    iget-object v3, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->size()I

    move-result v3

    invoke-virtual {p1, v2, v3}, Ljavassist/bytecode/annotation/AnnotationsWriter;->annotation(Ljava/lang/String;I)V

    .line 314
    iget-object v3, p0, Ljavassist/bytecode/annotation/Annotation;->members:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 315
    .local v0, "it":Ljava/util/Iterator;
    :goto_24
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_10

    .line 316
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/annotation/Annotation$Pair;

    .line 317
    .local v1, "pair":Ljavassist/bytecode/annotation/Annotation$Pair;
    iget v3, v1, Ljavassist/bytecode/annotation/Annotation$Pair;->name:I

    invoke-virtual {p1, v3}, Ljavassist/bytecode/annotation/AnnotationsWriter;->memberValuePair(I)V

    .line 318
    iget-object v3, v1, Ljavassist/bytecode/annotation/Annotation$Pair;->value:Ljavassist/bytecode/annotation/MemberValue;

    invoke-virtual {v3, p1}, Ljavassist/bytecode/annotation/MemberValue;->write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V

    goto :goto_24
.end method
