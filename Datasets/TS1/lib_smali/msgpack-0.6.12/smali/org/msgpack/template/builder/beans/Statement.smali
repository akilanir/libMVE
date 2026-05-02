.class public Lorg/msgpack/template/builder/beans/Statement;
.super Ljava/lang/Object;
.source "Statement.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/msgpack/template/builder/beans/Statement$MethodComparator;
    }
.end annotation


# static fields
.field private static classMethodsCache:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field

.field private static final pdConstructorSignatures:[[Ljava/lang/String;


# instance fields
.field private arguments:[Ljava/lang/Object;

.field private methodName:Ljava/lang/String;

.field private target:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    .prologue
    const/4 v9, 0x4

    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 46
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/msgpack/template/builder/beans/Statement;->classMethodsCache:Ljava/util/WeakHashMap;

    .line 428
    const/16 v0, 0xd

    new-array v0, v0, [[Ljava/lang/String;

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "java.lang.Class"

    aput-object v2, v1, v5

    const-string v2, "new"

    aput-object v2, v1, v6

    const-string v2, "java.lang.Boolean"

    aput-object v2, v1, v7

    const-string v2, ""

    aput-object v2, v1, v8

    const-string v2, ""

    aput-object v2, v1, v9

    const/4 v2, 0x5

    const-string v3, ""

    aput-object v3, v1, v2

    aput-object v1, v0, v5

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "java.lang.Class"

    aput-object v2, v1, v5

    const-string v2, "new"

    aput-object v2, v1, v6

    const-string v2, "java.lang.Byte"

    aput-object v2, v1, v7

    const-string v2, ""

    aput-object v2, v1, v8

    const-string v2, ""

    aput-object v2, v1, v9

    const/4 v2, 0x5

    const-string v3, ""

    aput-object v3, v1, v2

    aput-object v1, v0, v6

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "java.lang.Class"

    aput-object v2, v1, v5

    const-string v2, "new"

    aput-object v2, v1, v6

    const-string v2, "java.lang.Character"

    aput-object v2, v1, v7

    const-string v2, ""

    aput-object v2, v1, v8

    const-string v2, ""

    aput-object v2, v1, v9

    const/4 v2, 0x5

    const-string v3, ""

    aput-object v3, v1, v2

    aput-object v1, v0, v7

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "java.lang.Class"

    aput-object v2, v1, v5

    const-string v2, "new"

    aput-object v2, v1, v6

    const-string v2, "java.lang.Double"

    aput-object v2, v1, v7

    const-string v2, ""

    aput-object v2, v1, v8

    const-string v2, ""

    aput-object v2, v1, v9

    const/4 v2, 0x5

    const-string v3, ""

    aput-object v3, v1, v2

    aput-object v1, v0, v8

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "java.lang.Class"

    aput-object v2, v1, v5

    const-string v2, "new"

    aput-object v2, v1, v6

    const-string v2, "java.lang.Float"

    aput-object v2, v1, v7

    const-string v2, ""

    aput-object v2, v1, v8

    const-string v2, ""

    aput-object v2, v1, v9

    const/4 v2, 0x5

    const-string v3, ""

    aput-object v3, v1, v2

    aput-object v1, v0, v9

    const/4 v1, 0x5

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "java.lang.Class"

    aput-object v3, v2, v5

    const-string v3, "new"

    aput-object v3, v2, v6

    const-string v3, "java.lang.Integer"

    aput-object v3, v2, v7

    const-string v3, ""

    aput-object v3, v2, v8

    const-string v3, ""

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "java.lang.Class"

    aput-object v3, v2, v5

    const-string v3, "new"

    aput-object v3, v2, v6

    const-string v3, "java.lang.Long"

    aput-object v3, v2, v7

    const-string v3, ""

    aput-object v3, v2, v8

    const-string v3, ""

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "java.lang.Class"

    aput-object v3, v2, v5

    const-string v3, "new"

    aput-object v3, v2, v6

    const-string v3, "java.lang.Short"

    aput-object v3, v2, v7

    const-string v3, ""

    aput-object v3, v2, v8

    const-string v3, ""

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "java.lang.Class"

    aput-object v3, v2, v5

    const-string v3, "new"

    aput-object v3, v2, v6

    const-string v3, "java.lang.String"

    aput-object v3, v2, v7

    const-string v3, ""

    aput-object v3, v2, v8

    const-string v3, ""

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "java.lang.Class"

    aput-object v3, v2, v5

    const-string v3, "forName"

    aput-object v3, v2, v6

    const-string v3, "java.lang.String"

    aput-object v3, v2, v7

    const-string v3, ""

    aput-object v3, v2, v8

    const-string v3, ""

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "java.lang.Class"

    aput-object v3, v2, v5

    const-string v3, "newInstance"

    aput-object v3, v2, v6

    const-string v3, "java.lang.Class"

    aput-object v3, v2, v7

    const-string v3, "java.lang.Integer"

    aput-object v3, v2, v8

    const-string v3, ""

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "java.lang.reflect.Field"

    aput-object v3, v2, v5

    const-string v3, "get"

    aput-object v3, v2, v6

    const-string v3, "null"

    aput-object v3, v2, v7

    const-string v3, ""

    aput-object v3, v2, v8

    const-string v3, ""

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "java.lang.Class"

    aput-object v3, v2, v5

    const-string v3, "forName"

    aput-object v3, v2, v6

    const-string v3, "java.lang.String"

    aput-object v3, v2, v7

    const-string v3, ""

    aput-object v3, v2, v8

    const-string v3, ""

    aput-object v3, v2, v9

    const/4 v3, 0x5

    const-string v4, ""

    aput-object v4, v2, v3

    aput-object v2, v0, v1

    sput-object v0, Lorg/msgpack/template/builder/beans/Statement;->pdConstructorSignatures:[[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "arguments"    # [Ljava/lang/Object;

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lorg/msgpack/template/builder/beans/Statement;->target:Ljava/lang/Object;

    .line 50
    iput-object p2, p0, Lorg/msgpack/template/builder/beans/Statement;->methodName:Ljava/lang/String;

    .line 51
    if-nez p3, :cond_b

    sget-object p3, Lorg/apache/harmony/beans/BeansUtils;->EMPTY_OBJECT_ARRAY:[Ljava/lang/Object;

    .end local p3    # "arguments":[Ljava/lang/Object;
    :cond_b
    iput-object p3, p0, Lorg/msgpack/template/builder/beans/Statement;->arguments:[Ljava/lang/Object;

    .line 53
    return-void
.end method

.method static synthetic access$000(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 2
    .param p0, "x0"    # Ljava/lang/Class;

    .prologue
    .line 37
    invoke-static {p0}, Lorg/msgpack/template/builder/beans/Statement;->getPrimitiveWrapper(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method private arrayCopy(Ljava/lang/Class;[Ljava/lang/Object;Ljava/lang/Object;I)V
    .registers 9
    .param p2, "src"    # [Ljava/lang/Object;
    .param p3, "dest"    # Ljava/lang/Object;
    .param p4, "length"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 225
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_19

    .line 226
    check-cast p3, [Z

    .end local p3    # "dest":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [Z

    .line 227
    .local v0, "destination":[Z
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_a
    if-ge v1, p4, :cond_c8

    .line 228
    aget-object v2, p2, v1

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    aput-boolean v2, v0, v1

    .line 227
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 230
    .end local v0    # "destination":[Z
    .end local v1    # "index":I
    .restart local p3    # "dest":Ljava/lang/Object;
    :cond_19
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_32

    .line 231
    check-cast p3, [S

    .end local p3    # "dest":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [S

    .line 232
    .local v0, "destination":[S
    const/4 v1, 0x0

    .restart local v1    # "index":I
    :goto_23
    if-ge v1, p4, :cond_c8

    .line 233
    aget-object v2, p2, v1

    check-cast v2, Ljava/lang/Short;

    invoke-virtual {v2}, Ljava/lang/Short;->shortValue()S

    move-result v2

    aput-short v2, v0, v1

    .line 232
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 235
    .end local v0    # "destination":[S
    .end local v1    # "index":I
    .restart local p3    # "dest":Ljava/lang/Object;
    :cond_32
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_4b

    .line 236
    check-cast p3, [B

    .end local p3    # "dest":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [B

    .line 237
    .local v0, "destination":[B
    const/4 v1, 0x0

    .restart local v1    # "index":I
    :goto_3c
    if-ge v1, p4, :cond_c8

    .line 238
    aget-object v2, p2, v1

    check-cast v2, Ljava/lang/Byte;

    invoke-virtual {v2}, Ljava/lang/Byte;->byteValue()B

    move-result v2

    aput-byte v2, v0, v1

    .line 237
    add-int/lit8 v1, v1, 0x1

    goto :goto_3c

    .line 240
    .end local v0    # "destination":[B
    .end local v1    # "index":I
    .restart local p3    # "dest":Ljava/lang/Object;
    :cond_4b
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_64

    .line 241
    check-cast p3, [C

    .end local p3    # "dest":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [C

    .line 242
    .local v0, "destination":[C
    const/4 v1, 0x0

    .restart local v1    # "index":I
    :goto_55
    if-ge v1, p4, :cond_c8

    .line 243
    aget-object v2, p2, v1

    check-cast v2, Ljava/lang/Character;

    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v2

    aput-char v2, v0, v1

    .line 242
    add-int/lit8 v1, v1, 0x1

    goto :goto_55

    .line 245
    .end local v0    # "destination":[C
    .end local v1    # "index":I
    .restart local p3    # "dest":Ljava/lang/Object;
    :cond_64
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_7d

    .line 246
    check-cast p3, [I

    .end local p3    # "dest":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [I

    .line 247
    .local v0, "destination":[I
    const/4 v1, 0x0

    .restart local v1    # "index":I
    :goto_6e
    if-ge v1, p4, :cond_c8

    .line 248
    aget-object v2, p2, v1

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, v0, v1

    .line 247
    add-int/lit8 v1, v1, 0x1

    goto :goto_6e

    .line 250
    .end local v0    # "destination":[I
    .end local v1    # "index":I
    .restart local p3    # "dest":Ljava/lang/Object;
    :cond_7d
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_96

    .line 251
    check-cast p3, [J

    .end local p3    # "dest":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [J

    .line 252
    .local v0, "destination":[J
    const/4 v1, 0x0

    .restart local v1    # "index":I
    :goto_87
    if-ge v1, p4, :cond_c8

    .line 253
    aget-object v2, p2, v1

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 252
    add-int/lit8 v1, v1, 0x1

    goto :goto_87

    .line 255
    .end local v0    # "destination":[J
    .end local v1    # "index":I
    .restart local p3    # "dest":Ljava/lang/Object;
    :cond_96
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_af

    .line 256
    check-cast p3, [F

    .end local p3    # "dest":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [F

    .line 257
    .local v0, "destination":[F
    const/4 v1, 0x0

    .restart local v1    # "index":I
    :goto_a0
    if-ge v1, p4, :cond_c8

    .line 258
    aget-object v2, p2, v1

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    aput v2, v0, v1

    .line 257
    add-int/lit8 v1, v1, 0x1

    goto :goto_a0

    .line 260
    .end local v0    # "destination":[F
    .end local v1    # "index":I
    .restart local p3    # "dest":Ljava/lang/Object;
    :cond_af
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v2, :cond_c8

    .line 261
    check-cast p3, [D

    .end local p3    # "dest":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [D

    .line 262
    .local v0, "destination":[D
    const/4 v1, 0x0

    .restart local v1    # "index":I
    :goto_b9
    if-ge v1, p4, :cond_c8

    .line 263
    aget-object v2, p2, v1

    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    aput-wide v2, v0, v1

    .line 262
    add-int/lit8 v1, v1, 0x1

    goto :goto_b9

    .line 266
    .end local v0    # "destination":[D
    .end local v1    # "index":I
    :cond_c8
    return-void
.end method

.method private findArrayMethod(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .registers 11
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 271
    const-string v3, "get"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 272
    .local v0, "isGet":Z
    const-string v3, "set"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 273
    .local v1, "isSet":Z
    if-nez v0, :cond_1f

    if-nez v1, :cond_1f

    .line 274
    new-instance v3, Ljava/lang/NoSuchMethodException;

    const-string v4, "custom.beans.3C"

    invoke-static {v4}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 275
    :cond_1f
    array-length v3, p2

    if-lez v3, :cond_38

    aget-object v3, p2, v5

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-class v4, Ljava/lang/Integer;

    if-eq v3, v4, :cond_38

    .line 276
    new-instance v3, Ljava/lang/ClassCastException;

    const-string v4, "custom.beans.3D"

    invoke-static {v4}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 277
    :cond_38
    if-eqz v0, :cond_49

    array-length v3, p2

    if-eq v3, v6, :cond_49

    .line 278
    new-instance v3, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v4, "custom.beans.3E"

    invoke-static {v4}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 280
    :cond_49
    if-eqz v1, :cond_5a

    array-length v3, p2

    if-eq v3, v7, :cond_5a

    .line 281
    new-instance v3, Ljava/lang/ArrayIndexOutOfBoundsException;

    const-string v4, "custom.beans.3F"

    invoke-static {v4}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 285
    :cond_5a
    if-eqz v0, :cond_6d

    new-array v2, v7, [Ljava/lang/Class;

    const-class v3, Ljava/lang/Object;

    aput-object v3, v2, v5

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v6

    .line 287
    .local v2, "paraTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :goto_66
    const-class v3, Ljava/lang/reflect/Array;

    invoke-virtual {v3, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    return-object v3

    .line 285
    .end local v2    # "paraTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_6d
    const/4 v3, 0x3

    new-array v2, v3, [Ljava/lang/Class;

    const-class v3, Ljava/lang/Object;

    aput-object v3, v2, v5

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v6

    const-class v3, Ljava/lang/Object;

    aput-object v3, v2, v7

    goto :goto_66
.end method

.method private findConstructor(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;
    .registers 16
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Constructor",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 292
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p2}, Lorg/msgpack/template/builder/beans/Statement;->getTypes([Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v0

    .line 293
    .local v0, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v8, 0x0

    .line 295
    .local v8, "result":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {p1}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v1

    .local v1, "arr$":[Ljava/lang/reflect/Constructor;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_b
    if-ge v3, v6, :cond_4d

    aget-object v2, v1, v3

    .line 296
    .local v2, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v2}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    .line 297
    .local v7, "paraTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {v0, v7}, Lorg/msgpack/template/builder/beans/Statement;->match([Ljava/lang/Class;[Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_1c

    .line 298
    if-nez v8, :cond_1f

    .line 300
    move-object v8, v2

    .line 295
    :cond_1c
    :goto_1c
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 304
    :cond_1f
    invoke-virtual {v8}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v9

    .line 305
    .local v9, "resultParaTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v5, 0x1

    .line 306
    .local v5, "isAssignable":Z
    const/4 v4, 0x0

    .local v4, "index":I
    :goto_25
    array-length v10, v7

    if-ge v4, v10, :cond_37

    .line 307
    aget-object v10, v0, v4

    if-eqz v10, :cond_3b

    aget-object v10, v9, v4

    aget-object v11, v7, v4

    invoke-virtual {v10, v11}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    and-int/2addr v5, v10

    if-nez v5, :cond_3b

    .line 318
    :cond_37
    if-eqz v5, :cond_1c

    .line 319
    move-object v8, v2

    goto :goto_1c

    .line 312
    :cond_3b
    aget-object v10, v0, v4

    if-nez v10, :cond_4a

    aget-object v10, v7, v4

    aget-object v11, v9, v4

    invoke-virtual {v10, v11}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v10

    and-int/2addr v5, v10

    if-eqz v5, :cond_37

    .line 306
    :cond_4a
    add-int/lit8 v4, v4, 0x1

    goto :goto_25

    .line 323
    .end local v2    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .end local v4    # "index":I
    .end local v5    # "isAssignable":Z
    .end local v7    # "paraTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v9    # "resultParaTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    :cond_4d
    if-nez v8, :cond_5f

    .line 324
    new-instance v10, Ljava/lang/NoSuchMethodException;

    const-string v11, "custom.beans.40"

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 327
    :cond_5f
    return-object v8
.end method

.method static findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/reflect/Method;
    .registers 23
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;
    .param p3, "isStatic"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Object;",
            "Z)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 335
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static/range {p2 .. p2}, Lorg/msgpack/template/builder/beans/Statement;->getTypes([Ljava/lang/Object;)[Ljava/lang/Class;

    move-result-object v2

    .line 337
    .local v2, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v14, 0x0

    .line 338
    .local v14, "methods":[Ljava/lang/reflect/Method;
    sget-object v17, Lorg/msgpack/template/builder/beans/Statement;->classMethodsCache:Ljava/util/WeakHashMap;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_55

    .line 339
    sget-object v17, Lorg/msgpack/template/builder/beans/Statement;->classMethodsCache:Ljava/util/WeakHashMap;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "methods":[Ljava/lang/reflect/Method;
    check-cast v14, [Ljava/lang/reflect/Method;

    .line 345
    .restart local v14    # "methods":[Ljava/lang/reflect/Method;
    :goto_1d
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 346
    .local v7, "fitMethods":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    move-object v3, v14

    .local v3, "arr$":[Ljava/lang/reflect/Method;
    array-length v12, v3

    .local v12, "len$":I
    const/4 v11, 0x0

    .local v11, "i$":I
    :goto_25
    if-ge v11, v12, :cond_63

    aget-object v13, v3, v11

    .line 347
    .local v13, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v13}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_52

    .line 348
    if-eqz p3, :cond_43

    invoke-virtual {v13}, Ljava/lang/reflect/Method;->getModifiers()I

    move-result v17

    invoke-static/range {v17 .. v17}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v17

    if-eqz v17, :cond_52

    .line 349
    :cond_43
    invoke-virtual {v13}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-static {v2, v0}, Lorg/msgpack/template/builder/beans/Statement;->match([Ljava/lang/Class;[Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_52

    .line 350
    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 346
    :cond_52
    add-int/lit8 v11, v11, 0x1

    goto :goto_25

    .line 341
    .end local v3    # "arr$":[Ljava/lang/reflect/Method;
    .end local v7    # "fitMethods":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    .end local v11    # "i$":I
    .end local v12    # "len$":I
    .end local v13    # "method":Ljava/lang/reflect/Method;
    :cond_55
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v14

    .line 342
    sget-object v17, Lorg/msgpack/template/builder/beans/Statement;->classMethodsCache:Ljava/util/WeakHashMap;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    invoke-virtual {v0, v1, v14}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1d

    .line 355
    .restart local v3    # "arr$":[Ljava/lang/reflect/Method;
    .restart local v7    # "fitMethods":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/reflect/Method;>;"
    .restart local v11    # "i$":I
    .restart local v12    # "len$":I
    :cond_63
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v9

    .line 356
    .local v9, "fitSize":I
    if-nez v9, :cond_79

    .line 357
    new-instance v17, Ljava/lang/NoSuchMethodException;

    const-string v18, "custom.beans.41"

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 360
    :cond_79
    const/16 v17, 0x1

    move/from16 v0, v17

    if-ne v9, v0, :cond_8a

    .line 361
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/reflect/Method;

    .line 391
    :goto_89
    return-object v17

    .line 364
    :cond_8a
    new-instance v4, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;

    move-object/from16 v0, p1

    invoke-direct {v4, v0, v2}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;-><init>(Ljava/lang/String;[Ljava/lang/Class;)V

    .line 365
    .local v4, "comparator":Lorg/msgpack/template/builder/beans/Statement$MethodComparator;
    new-array v0, v9, [Ljava/lang/reflect/Method;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/reflect/Method;

    .line 366
    .local v6, "fitMethodArray":[Ljava/lang/reflect/Method;
    const/16 v17, 0x0

    aget-object v15, v6, v17

    .line 369
    .local v15, "onlyMethod":Ljava/lang/reflect/Method;
    const/4 v10, 0x1

    .local v10, "i":I
    :goto_a2
    array-length v0, v6

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v10, v0, :cond_e2

    .line 371
    aget-object v17, v6, v10

    move-object/from16 v0, v17

    invoke-virtual {v4, v15, v0}, Lorg/msgpack/template/builder/beans/Statement$MethodComparator;->compare(Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)I

    move-result v5

    .local v5, "difference":I
    if-nez v5, :cond_db

    .line 373
    invoke-virtual {v15}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v16

    .line 374
    .local v16, "onlyReturnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    aget-object v17, v6, v10

    invoke-virtual/range {v17 .. v17}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v8

    .line 375
    .local v8, "fitReturnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, v16

    if-ne v0, v8, :cond_d1

    .line 377
    new-instance v17, Ljava/lang/NoSuchMethodException;

    const-string v18, "custom.beans.62"

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-static {v0, v1}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 381
    :cond_d1
    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_db

    .line 384
    aget-object v15, v6, v10

    .line 387
    .end local v8    # "fitReturnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v16    # "onlyReturnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_db
    if-lez v5, :cond_df

    .line 388
    aget-object v15, v6, v10

    .line 369
    :cond_df
    add-int/lit8 v10, v10, 0x1

    goto :goto_a2

    .end local v5    # "difference":I
    :cond_e2
    move-object/from16 v17, v15

    .line 391
    goto :goto_89
.end method

.method private static getPrimitiveWrapper(Ljava/lang/Class;)Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 474
    .local p0, "base":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .line 475
    .local v0, "res":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_8

    .line 476
    const-class v0, Ljava/lang/Boolean;

    .line 492
    :cond_7
    :goto_7
    return-object v0

    .line 477
    :cond_8
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_f

    .line 478
    const-class v0, Ljava/lang/Byte;

    goto :goto_7

    .line 479
    :cond_f
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_16

    .line 480
    const-class v0, Ljava/lang/Character;

    goto :goto_7

    .line 481
    :cond_16
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_1d

    .line 482
    const-class v0, Ljava/lang/Short;

    goto :goto_7

    .line 483
    :cond_1d
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_24

    .line 484
    const-class v0, Ljava/lang/Integer;

    goto :goto_7

    .line 485
    :cond_24
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_2b

    .line 486
    const-class v0, Ljava/lang/Long;

    goto :goto_7

    .line 487
    :cond_2b
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_32

    .line 488
    const-class v0, Ljava/lang/Float;

    goto :goto_7

    .line 489
    :cond_32
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v1, :cond_7

    .line 490
    const-class v0, Ljava/lang/Double;

    goto :goto_7
.end method

.method private static getTypes([Ljava/lang/Object;)[Ljava/lang/Class;
    .registers 4
    .param p0, "arguments"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Object;",
            ")[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 496
    array-length v2, p0

    new-array v1, v2, [Ljava/lang/Class;

    .line 497
    .local v1, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_4
    array-length v2, p0

    if-ge v0, v2, :cond_18

    .line 498
    aget-object v2, p0, v0

    if-nez v2, :cond_11

    const/4 v2, 0x0

    :goto_c
    aput-object v2, v1, v0

    .line 497
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 498
    :cond_11
    aget-object v2, p0, v0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_c

    .line 501
    :cond_18
    return-object v1
.end method

.method static isPDConstructor(Lorg/msgpack/template/builder/beans/Statement;)Z
    .registers 14
    .param p0, "stmt"    # Lorg/msgpack/template/builder/beans/Statement;

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 446
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/Statement;->getTarget()Ljava/lang/Object;

    move-result-object v8

    .line 447
    .local v8, "target":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/Statement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    .line 448
    .local v6, "methodName":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/Statement;->getArguments()[Ljava/lang/Object;

    move-result-object v0

    .line 449
    .local v0, "args":[Ljava/lang/Object;
    sget-object v9, Lorg/msgpack/template/builder/beans/Statement;->pdConstructorSignatures:[[Ljava/lang/String;

    aget-object v9, v9, v11

    array-length v9, v9

    new-array v7, v9, [Ljava/lang/String;

    .line 450
    .local v7, "sig":[Ljava/lang/String;
    if-eqz v8, :cond_1e

    if-eqz v6, :cond_1e

    if-eqz v0, :cond_1e

    array-length v9, v0

    if-nez v9, :cond_20

    :cond_1e
    move v9, v11

    .line 470
    :goto_1f
    return v9

    .line 455
    :cond_20
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v11

    .line 456
    aput-object v6, v7, v10

    .line 457
    const/4 v3, 0x2

    .local v3, "i":I
    :goto_2d
    array-length v9, v7

    if-ge v3, v9, :cond_54

    .line 458
    array-length v9, v0

    add-int/lit8 v12, v3, -0x2

    if-le v9, v12, :cond_4f

    .line 459
    add-int/lit8 v9, v3, -0x2

    aget-object v9, v0, v9

    if-eqz v9, :cond_4c

    add-int/lit8 v9, v3, -0x2

    aget-object v9, v0, v9

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    :goto_47
    aput-object v9, v7, v3

    .line 457
    :goto_49
    add-int/lit8 v3, v3, 0x1

    goto :goto_2d

    .line 459
    :cond_4c
    const-string v9, "null"

    goto :goto_47

    .line 462
    :cond_4f
    const-string v9, ""

    aput-object v9, v7, v3

    goto :goto_49

    .line 465
    :cond_54
    sget-object v1, Lorg/msgpack/template/builder/beans/Statement;->pdConstructorSignatures:[[Ljava/lang/String;

    .local v1, "arr$":[[Ljava/lang/String;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_58
    if-ge v4, v5, :cond_67

    aget-object v2, v1, v4

    .line 466
    .local v2, "element":[Ljava/lang/String;
    invoke-static {v7, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_64

    move v9, v10

    .line 467
    goto :goto_1f

    .line 465
    :cond_64
    add-int/lit8 v4, v4, 0x1

    goto :goto_58

    .end local v2    # "element":[Ljava/lang/String;
    :cond_67
    move v9, v11

    .line 470
    goto :goto_1f
.end method

.method static isStaticMethodCall(Lorg/msgpack/template/builder/beans/Statement;)Z
    .registers 8
    .param p0, "stmt"    # Lorg/msgpack/template/builder/beans/Statement;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 410
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/Statement;->getTarget()Ljava/lang/Object;

    move-result-object v2

    .line 411
    .local v2, "target":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/Statement;->getMethodName()Ljava/lang/String;

    move-result-object v1

    .line 412
    .local v1, "methodName":Ljava/lang/String;
    instance-of v5, v2, Ljava/lang/Class;

    if-nez v5, :cond_f

    .line 420
    .end local v2    # "target":Ljava/lang/Object;
    :goto_e
    return v3

    .line 416
    .restart local v2    # "target":Ljava/lang/Object;
    :cond_f
    :try_start_f
    check-cast v2, Ljava/lang/Class;

    .end local v2    # "target":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/Statement;->getArguments()[Ljava/lang/Object;

    move-result-object v5

    const/4 v6, 0x1

    invoke-static {v2, v1, v5, v6}, Lorg/msgpack/template/builder/beans/Statement;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/reflect/Method;
    :try_end_19
    .catch Ljava/lang/NoSuchMethodException; {:try_start_f .. :try_end_19} :catch_1b

    move v3, v4

    .line 418
    goto :goto_e

    .line 419
    :catch_1b
    move-exception v0

    .line 420
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    goto :goto_e
.end method

.method private static match([Ljava/lang/Class;[Ljava/lang/Class;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;[",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "argTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .local p1, "paraTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 395
    array-length v2, p1

    array-length v3, p0

    if-eq v2, v3, :cond_6

    .line 406
    :cond_5
    :goto_5
    return v1

    .line 398
    :cond_6
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_7
    array-length v2, p1

    if-ge v0, v2, :cond_25

    .line 399
    aget-object v2, p0, v0

    if-eqz v2, :cond_22

    aget-object v2, p1, v0

    aget-object v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_22

    aget-object v2, p0, v0

    aget-object v3, p1, v0

    invoke-static {v2, v3}, Lorg/apache/harmony/beans/BeansUtils;->isPrimitiveWrapper(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 398
    :cond_22
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 406
    :cond_25
    const/4 v1, 0x1

    goto :goto_5
.end method


# virtual methods
.method public execute()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 99
    invoke-virtual {p0}, Lorg/msgpack/template/builder/beans/Statement;->invokeMethod()Ljava/lang/Object;

    .line 100
    return-void
.end method

.method public getArguments()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/Statement;->arguments:[Ljava/lang/Object;

    return-object v0
.end method

.method public getMethodName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/Statement;->methodName:Ljava/lang/String;

    return-object v0
.end method

.method public getTarget()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/msgpack/template/builder/beans/Statement;->target:Ljava/lang/Object;

    return-object v0
.end method

.method invokeMethod()Ljava/lang/Object;
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 103
    const/4 v14, 0x0

    .line 105
    .local v14, "result":Ljava/lang/Object;
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lorg/msgpack/template/builder/beans/Statement;->getTarget()Ljava/lang/Object;

    move-result-object v16

    .line 106
    .local v16, "target":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lorg/msgpack/template/builder/beans/Statement;->getMethodName()Ljava/lang/String;

    move-result-object v13

    .line 107
    .local v13, "methodName":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lorg/msgpack/template/builder/beans/Statement;->getArguments()[Ljava/lang/Object;

    move-result-object v4

    .line 108
    .local v4, "arguments":[Ljava/lang/Object;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    .line 109
    .local v17, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->isArray()Z

    move-result v18

    if-eqz v18, :cond_43

    .line 110
    move-object/from16 v0, p0

    invoke-direct {v0, v13, v4}, Lorg/msgpack/template/builder/beans/Statement;->findArrayMethod(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 111
    .local v12, "method":Ljava/lang/reflect/Method;
    array-length v0, v4

    move/from16 v18, v0

    add-int/lit8 v18, v18, 0x1

    move/from16 v0, v18

    new-array v7, v0, [Ljava/lang/Object;

    .line 112
    .local v7, "copy":[Ljava/lang/Object;
    const/16 v18, 0x0

    aput-object v16, v7, v18

    .line 113
    const/16 v18, 0x0

    const/16 v19, 0x1

    array-length v0, v4

    move/from16 v20, v0

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v4, v0, v7, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 221
    .end local v7    # "copy":[Ljava/lang/Object;
    .end local v12    # "method":Ljava/lang/reflect/Method;
    .end local v14    # "result":Ljava/lang/Object;
    .end local v16    # "target":Ljava/lang/Object;
    :cond_42
    :goto_42
    return-object v14

    .line 115
    .restart local v14    # "result":Ljava/lang/Object;
    .restart local v16    # "target":Ljava/lang/Object;
    :cond_43
    const-string v18, "newInstance"

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_6a

    const-class v18, Ljava/lang/reflect/Array;

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_6a

    .line 117
    const/16 v18, 0x0

    aget-object v18, v4, v18

    check-cast v18, Ljava/lang/Class;

    const/16 v19, 0x1

    aget-object v19, v4, v19

    check-cast v19, Ljava/lang/Integer;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    invoke-static/range {v18 .. v19}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v14

    goto :goto_42

    .line 119
    :cond_6a
    const-string v18, "new"

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_7e

    const-string v18, "newInstance"

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_cb

    .line 121
    :cond_7e
    move-object/from16 v0, v16

    instance-of v0, v0, Ljava/lang/Class;

    move/from16 v18, v0

    if-eqz v18, :cond_95

    .line 122
    check-cast v16, Ljava/lang/Class;

    .end local v16    # "target":Ljava/lang/Object;
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1, v4}, Lorg/msgpack/template/builder/beans/Statement;->findConstructor(Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    .line 124
    .local v6, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    invoke-virtual {v6, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 125
    goto :goto_42

    .line 126
    .end local v6    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<*>;"
    .restart local v16    # "target":Ljava/lang/Object;
    :cond_95
    const-string v18, "new"

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_b9

    .line 127
    new-instance v18, Ljava/lang/NoSuchMethodException;

    invoke-virtual/range {p0 .. p0}, Lorg/msgpack/template/builder/beans/Statement;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v18
    :try_end_a9
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_a9} :catch_a9

    .line 217
    .end local v4    # "arguments":[Ljava/lang/Object;
    .end local v13    # "methodName":Ljava/lang/String;
    .end local v14    # "result":Ljava/lang/Object;
    .end local v16    # "target":Ljava/lang/Object;
    .end local v17    # "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_a9
    move-exception v10

    .line 218
    .local v10, "ite":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v10}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v15

    .line 219
    .local v15, "t":Ljava/lang/Throwable;
    if-eqz v15, :cond_1fe

    instance-of v0, v15, Ljava/lang/Exception;

    move/from16 v18, v0

    if-eqz v18, :cond_1fe

    check-cast v15, Ljava/lang/Exception;

    .end local v15    # "t":Ljava/lang/Throwable;
    :goto_b8
    throw v15

    .line 130
    .end local v10    # "ite":Ljava/lang/reflect/InvocationTargetException;
    .restart local v4    # "arguments":[Ljava/lang/Object;
    .restart local v13    # "methodName":Ljava/lang/String;
    .restart local v14    # "result":Ljava/lang/Object;
    .restart local v16    # "target":Ljava/lang/Object;
    .restart local v17    # "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_b9
    const/16 v18, 0x0

    :try_start_bb
    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v0, v13, v4, v1}, Lorg/msgpack/template/builder/beans/Statement;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 132
    .restart local v12    # "method":Ljava/lang/reflect/Method;
    move-object/from16 v0, v16

    invoke-virtual {v12, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .line 133
    goto/16 :goto_42

    .line 134
    .end local v12    # "method":Ljava/lang/reflect/Method;
    :cond_cb
    const-string v18, "newArray"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_138

    .line 136
    move-object/from16 v0, v16

    check-cast v0, Ljava/lang/Class;

    move-object v5, v0

    .line 139
    .local v5, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v9, 0x0

    .local v9, "index":I
    :goto_db
    array-length v0, v4

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v9, v0, :cond_10b

    .line 140
    aget-object v18, v4, v9

    if-nez v18, :cond_101

    const/4 v3, 0x0

    .line 142
    .local v3, "argClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_e7
    if-eqz v3, :cond_108

    invoke-virtual {v5, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v18

    if-nez v18, :cond_108

    invoke-static {v3, v5}, Lorg/apache/harmony/beans/BeansUtils;->isPrimitiveWrapper(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v18

    if-nez v18, :cond_108

    .line 144
    new-instance v18, Ljava/lang/IllegalArgumentException;

    const-string v19, "custom.beans.63"

    invoke-static/range {v19 .. v19}, Lorg/apache/harmony/beans/internal/nls/Messages;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 140
    .end local v3    # "argClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_101
    aget-object v18, v4, v9

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    goto :goto_e7

    .line 139
    .restart local v3    # "argClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_108
    add-int/lit8 v9, v9, 0x1

    goto :goto_db

    .line 148
    .end local v3    # "argClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_10b
    array-length v0, v4

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-static {v5, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v14

    .line 149
    invoke-virtual {v5}, Ljava/lang/Class;->isPrimitive()Z

    move-result v18

    if-eqz v18, :cond_126

    .line 151
    array-length v0, v4

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v5, v4, v14, v1}, Lorg/msgpack/template/builder/beans/Statement;->arrayCopy(Ljava/lang/Class;[Ljava/lang/Object;Ljava/lang/Object;I)V

    goto/16 :goto_42

    .line 154
    :cond_126
    const/16 v18, 0x0

    const/16 v19, 0x0

    array-length v0, v4

    move/from16 v20, v0

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-static {v4, v0, v14, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto/16 :goto_42

    .line 157
    .end local v5    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "index":I
    :cond_138
    move-object/from16 v0, v16

    instance-of v0, v0, Ljava/lang/Class;

    move/from16 v18, v0
    :try_end_13e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_bb .. :try_end_13e} :catch_a9

    if-eqz v18, :cond_1b9

    .line 158
    const/4 v12, 0x0

    .line 165
    .restart local v12    # "method":Ljava/lang/reflect/Method;
    :try_start_141
    const-class v18, Ljava/lang/Class;

    move-object/from16 v0, v16

    move-object/from16 v1, v18

    if-eq v0, v1, :cond_161

    .line 166
    move-object/from16 v0, v16

    check-cast v0, Ljava/lang/Class;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v0, v13, v4, v1}, Lorg/msgpack/template/builder/beans/Statement;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 168
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v12, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_160
    .catch Ljava/lang/NoSuchMethodException; {:try_start_141 .. :try_end_160} :catch_201
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_141 .. :try_end_160} :catch_a9

    move-result-object v14

    .line 173
    .end local v14    # "result":Ljava/lang/Object;
    :cond_161
    :goto_161
    if-nez v12, :cond_42

    .line 176
    :try_start_163
    const-string v18, "forName"

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1a7

    array-length v0, v4

    move/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_1a7

    const/16 v18, 0x0

    aget-object v18, v4, v18

    move-object/from16 v0, v18

    instance-of v0, v0, Ljava/lang/String;

    move/from16 v18, v0
    :try_end_182
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_163 .. :try_end_182} :catch_a9

    if-eqz v18, :cond_1a7

    .line 181
    const/16 v18, 0x0

    :try_start_186
    aget-object v18, v4, v18

    check-cast v18, Ljava/lang/String;

    invoke-static/range {v18 .. v18}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_18d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_186 .. :try_end_18d} :catch_190
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_186 .. :try_end_18d} :catch_a9

    move-result-object v14

    .local v14, "result":Ljava/lang/Class;
    goto/16 :goto_42

    .line 182
    .end local v14    # "result":Ljava/lang/Class;
    :catch_190
    move-exception v8

    .line 183
    .local v8, "e2":Ljava/lang/ClassNotFoundException;
    const/16 v18, 0x0

    :try_start_193
    aget-object v18, v4, v18

    check-cast v18, Ljava/lang/String;

    const/16 v19, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v20

    invoke-static/range {v18 .. v20}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v14

    .line 186
    .restart local v14    # "result":Ljava/lang/Class;
    goto/16 :goto_42

    .line 188
    .end local v8    # "e2":Ljava/lang/ClassNotFoundException;
    .end local v14    # "result":Ljava/lang/Class;
    :cond_1a7
    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v0, v13, v4, v1}, Lorg/msgpack/template/builder/beans/Statement;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 190
    move-object/from16 v0, v16

    invoke-virtual {v12, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .local v14, "result":Ljava/lang/Object;
    goto/16 :goto_42

    .line 193
    .end local v12    # "method":Ljava/lang/reflect/Method;
    :cond_1b9
    move-object/from16 v0, v16

    instance-of v0, v0, Ljava/util/Iterator;

    move/from16 v18, v0

    if-eqz v18, :cond_1e5

    .line 194
    move-object/from16 v0, v16

    check-cast v0, Ljava/util/Iterator;

    move-object v11, v0

    .line 195
    .local v11, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v0, v13, v4, v1}, Lorg/msgpack/template/builder/beans/Statement;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 197
    .restart local v12    # "method":Ljava/lang/reflect/Method;
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_42

    .line 198
    new-instance v18, Lorg/msgpack/template/builder/beans/Statement$1;

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v12, v11}, Lorg/msgpack/template/builder/beans/Statement$1;-><init>(Lorg/msgpack/template/builder/beans/Statement;Ljava/lang/reflect/Method;Ljava/util/Iterator;)V

    invoke-virtual/range {v18 .. v18}, Lorg/msgpack/template/builder/beans/Statement$1;->run()Ljava/lang/Object;

    move-result-object v14

    goto/16 :goto_42

    .line 212
    .end local v11    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v12    # "method":Ljava/lang/reflect/Method;
    :cond_1e5
    const/16 v18, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    invoke-static {v0, v13, v4, v1}, Lorg/msgpack/template/builder/beans/Statement;->findMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;Z)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 214
    .restart local v12    # "method":Ljava/lang/reflect/Method;
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v12, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 215
    move-object/from16 v0, v16

    invoke-virtual {v12, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1fb
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_193 .. :try_end_1fb} :catch_a9

    move-result-object v14

    goto/16 :goto_42

    .end local v4    # "arguments":[Ljava/lang/Object;
    .end local v12    # "method":Ljava/lang/reflect/Method;
    .end local v13    # "methodName":Ljava/lang/String;
    .end local v14    # "result":Ljava/lang/Object;
    .end local v16    # "target":Ljava/lang/Object;
    .end local v17    # "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v10    # "ite":Ljava/lang/reflect/InvocationTargetException;
    .restart local v15    # "t":Ljava/lang/Throwable;
    :cond_1fe
    move-object v15, v10

    .line 219
    goto/16 :goto_b8

    .line 170
    .end local v10    # "ite":Ljava/lang/reflect/InvocationTargetException;
    .end local v15    # "t":Ljava/lang/Throwable;
    .restart local v4    # "arguments":[Ljava/lang/Object;
    .restart local v12    # "method":Ljava/lang/reflect/Method;
    .restart local v13    # "methodName":Ljava/lang/String;
    .restart local v14    # "result":Ljava/lang/Object;
    .restart local v16    # "target":Ljava/lang/Object;
    .restart local v17    # "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_201
    move-exception v18

    goto/16 :goto_161
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .prologue
    const/16 v5, 0x22

    .line 57
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 58
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/Statement;->target:Ljava/lang/Object;

    if-nez v3, :cond_4d

    .line 59
    const-string v3, "null"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    :goto_10
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/msgpack/template/builder/beans/Statement;->methodName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x28

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/Statement;->arguments:[Ljava/lang/Object;

    if-eqz v3, :cond_92

    .line 68
    const/4 v1, 0x0

    .local v1, "index":I
    :goto_33
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/Statement;->arguments:[Ljava/lang/Object;

    array-length v3, v3

    if-ge v1, v3, :cond_92

    .line 69
    if-lez v1, :cond_3f

    .line 70
    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    :cond_3f
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/Statement;->arguments:[Ljava/lang/Object;

    aget-object v3, v3, v1

    if-nez v3, :cond_62

    .line 73
    const-string v3, "null"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    :goto_4a
    add-int/lit8 v1, v1, 0x1

    goto :goto_33

    .line 61
    .end local v1    # "index":I
    :cond_4d
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/Statement;->target:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 62
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v3, Ljava/lang/String;

    if-ne v0, v3, :cond_5d

    const-string v3, "\"\""

    :goto_59
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_10

    :cond_5d
    invoke-static {v0}, Lorg/apache/harmony/beans/BeansUtils;->idOfClass(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    goto :goto_59

    .line 75
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v1    # "index":I
    :cond_62
    iget-object v3, p0, Lorg/msgpack/template/builder/beans/Statement;->arguments:[Ljava/lang/Object;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 76
    .restart local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v3, Ljava/lang/String;

    if-ne v0, v3, :cond_8d

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v3, p0, Lorg/msgpack/template/builder/beans/Statement;->arguments:[Ljava/lang/Object;

    aget-object v3, v3, v1

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_89
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4a

    :cond_8d
    invoke-static {v0}, Lorg/apache/harmony/beans/BeansUtils;->idOfClass(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    goto :goto_89

    .line 81
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "index":I
    :cond_92
    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 82
    const/16 v3, 0x3b

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 83
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
