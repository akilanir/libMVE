.class public Lorg/mozilla/javascript/NativeJavaObject;
.super Ljava/lang/Object;
.source "NativeJavaObject.java"

# interfaces
.implements Lorg/mozilla/javascript/Scriptable;
.implements Lorg/mozilla/javascript/Wrapper;
.implements Ljava/io/Serializable;


# static fields
.field private static final COERCED_INTERFACE_KEY:Ljava/lang/Object;

.field static final CONVERSION_NONE:B = 0x63t

.field static final CONVERSION_NONTRIVIAL:B = 0x0t

.field static final CONVERSION_TRIVIAL:B = 0x1t

.field private static final JSTYPE_BOOLEAN:I = 0x2

.field private static final JSTYPE_JAVA_ARRAY:I = 0x7

.field private static final JSTYPE_JAVA_CLASS:I = 0x5

.field private static final JSTYPE_JAVA_OBJECT:I = 0x6

.field private static final JSTYPE_NULL:I = 0x1

.field private static final JSTYPE_NUMBER:I = 0x3

.field private static final JSTYPE_OBJECT:I = 0x8

.field private static final JSTYPE_STRING:I = 0x4

.field private static final JSTYPE_UNDEFINED:I = 0x0

.field private static adapter_readAdapterObject:Ljava/lang/reflect/Method; = null

.field private static adapter_writeAdapterObject:Ljava/lang/reflect/Method; = null

.field static final serialVersionUID:J = -0x606e5a61ca3bce1fL


# instance fields
.field private transient fieldAndMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/mozilla/javascript/FieldAndMethods;",
            ">;"
        }
    .end annotation
.end field

.field protected transient isAdapter:Z

.field protected transient javaObject:Ljava/lang/Object;

.field protected transient members:Lorg/mozilla/javascript/JavaMembers;

.field protected parent:Lorg/mozilla/javascript/Scriptable;

.field protected prototype:Lorg/mozilla/javascript/Scriptable;

.field protected transient staticType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x0

    .line 940
    const-string v3, "Coerced Interface"

    sput-object v3, Lorg/mozilla/javascript/NativeJavaObject;->COERCED_INTERFACE_KEY:Ljava/lang/Object;

    .line 946
    const/4 v3, 0x2

    new-array v2, v3, [Ljava/lang/Class;

    .line 947
    .local v2, "sig2":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v3, "org.mozilla.javascript.JavaAdapter"

    invoke-static {v3}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 948
    .local v0, "cl":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v0, :cond_3c

    .line 950
    const/4 v3, 0x0

    :try_start_11
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    aput-object v4, v2, v3

    .line 951
    const/4 v3, 0x1

    const-string v4, "java.io.ObjectOutputStream"

    invoke-static {v4}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v2, v3

    .line 952
    const-string v3, "writeAdapterObject"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    sput-object v3, Lorg/mozilla/javascript/NativeJavaObject;->adapter_writeAdapterObject:Ljava/lang/reflect/Method;

    .line 955
    const/4 v3, 0x0

    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->ScriptableClass:Ljava/lang/Class;

    aput-object v4, v2, v3

    .line 956
    const/4 v3, 0x1

    const-string v4, "java.io.ObjectInputStream"

    invoke-static {v4}, Lorg/mozilla/javascript/Kit;->classOrNull(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v2, v3

    .line 957
    const-string v3, "readAdapterObject"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    sput-object v3, Lorg/mozilla/javascript/NativeJavaObject;->adapter_readAdapterObject:Ljava/lang/reflect/Method;
    :try_end_3c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_11 .. :try_end_3c} :catch_3d

    .line 965
    :cond_3c
    :goto_3c
    return-void

    .line 960
    :catch_3d
    move-exception v1

    .line 961
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    sput-object v5, Lorg/mozilla/javascript/NativeJavaObject;->adapter_writeAdapterObject:Ljava/lang/reflect/Method;

    .line 962
    sput-object v5, Lorg/mozilla/javascript/NativeJavaObject;->adapter_readAdapterObject:Ljava/lang/reflect/Method;

    goto :goto_3c
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)V
    .registers 5
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "javaObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p3, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/mozilla/javascript/NativeJavaObject;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;Z)V

    .line 35
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;Z)V
    .registers 5
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "javaObject"    # Ljava/lang/Object;
    .param p4, "isAdapter"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 39
    .local p3, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lorg/mozilla/javascript/NativeJavaObject;->parent:Lorg/mozilla/javascript/Scriptable;

    .line 41
    iput-object p2, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    .line 42
    iput-object p3, p0, Lorg/mozilla/javascript/NativeJavaObject;->staticType:Ljava/lang/Class;

    .line 43
    iput-boolean p4, p0, Lorg/mozilla/javascript/NativeJavaObject;->isAdapter:Z

    .line 44
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaObject;->initMembers()V

    .line 45
    return-void
.end method

.method public static canConvert(Ljava/lang/Object;Ljava/lang/Class;)Z
    .registers 4
    .param p0, "fromObj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 206
    .local p1, "to":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeJavaObject;->getConversionWeight(Ljava/lang/Object;Ljava/lang/Class;)I

    move-result v0

    .line 208
    .local v0, "weight":I
    const/16 v1, 0x63

    if-ge v0, v1, :cond_a

    const/4 v1, 0x1

    :goto_9
    return v1

    :cond_a
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private static coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 20
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 677
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v17

    .line 680
    .local v17, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-eq v0, v1, :cond_10

    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-ne v0, v1, :cond_2d

    .line 681
    :cond_10
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    move-object/from16 v0, v17

    if-ne v0, v1, :cond_17

    .line 782
    .end local p1    # "value":Ljava/lang/Object;
    :cond_16
    :goto_16
    return-object p1

    .line 684
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_17
    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    const-wide/16 v3, 0x0

    const-wide v5, 0x40efffe000000000L    # 65535.0

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v6}, Lorg/mozilla/javascript/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v1

    long-to-int v1, v1

    int-to-char v1, v1

    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p1

    goto :goto_16

    .line 691
    :cond_2d
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-eq v0, v1, :cond_3f

    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->DoubleClass:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-eq v0, v1, :cond_3f

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-ne v0, v1, :cond_51

    .line 693
    :cond_3f
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->DoubleClass:Ljava/lang/Class;

    move-object/from16 v0, v17

    if-eq v0, v1, :cond_16

    new-instance v1, Ljava/lang/Double;

    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v7

    invoke-direct {v1, v7, v8}, Ljava/lang/Double;-><init>(D)V

    move-object/from16 p1, v1

    goto :goto_16

    .line 698
    :cond_51
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->FloatClass:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-eq v0, v1, :cond_5d

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-ne v0, v1, :cond_c7

    .line 699
    :cond_5d
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->FloatClass:Ljava/lang/Class;

    move-object/from16 v0, v17

    if-eq v0, v1, :cond_16

    .line 703
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v15

    .line 704
    .local v15, "number":D
    invoke-static/range {v15 .. v16}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v1

    if-nez v1, :cond_79

    invoke-static/range {v15 .. v16}, Ljava/lang/Double;->isNaN(D)Z

    move-result v1

    if-nez v1, :cond_79

    const-wide/16 v1, 0x0

    cmpl-double v1, v15, v1

    if-nez v1, :cond_82

    .line 706
    :cond_79
    new-instance p1, Ljava/lang/Float;

    .end local p1    # "value":Ljava/lang/Object;
    double-to-float v1, v15

    move-object/from16 v0, p1

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    goto :goto_16

    .line 709
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_82
    invoke-static/range {v15 .. v16}, Ljava/lang/Math;->abs(D)D

    move-result-wide v13

    .line 710
    .local v13, "absNumber":D
    const-wide/high16 v1, 0x36a0000000000000L    # 1.401298464324817E-45

    cmpg-double v1, v13, v1

    if-gez v1, :cond_a0

    .line 711
    new-instance p1, Ljava/lang/Float;

    .end local p1    # "value":Ljava/lang/Object;
    const-wide/16 v1, 0x0

    cmpl-double v1, v15, v1

    if-lez v1, :cond_9d

    const-wide/16 v1, 0x0

    :goto_96
    move-object/from16 v0, p1

    invoke-direct {v0, v1, v2}, Ljava/lang/Float;-><init>(D)V

    goto/16 :goto_16

    :cond_9d
    const-wide/high16 v1, -0x8000000000000000L

    goto :goto_96

    .line 713
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_a0
    const-wide v1, 0x47efffffe0000000L    # 3.4028234663852886E38

    cmpl-double v1, v13, v1

    if-lez v1, :cond_bd

    .line 714
    new-instance p1, Ljava/lang/Float;

    .end local p1    # "value":Ljava/lang/Object;
    const-wide/16 v1, 0x0

    cmpl-double v1, v15, v1

    if-lez v1, :cond_ba

    const/high16 v1, 0x7f800000    # Float.POSITIVE_INFINITY

    :goto_b3
    move-object/from16 v0, p1

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    goto/16 :goto_16

    :cond_ba
    const/high16 v1, -0x800000    # Float.NEGATIVE_INFINITY

    goto :goto_b3

    .line 719
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_bd
    new-instance p1, Ljava/lang/Float;

    .end local p1    # "value":Ljava/lang/Object;
    double-to-float v1, v15

    move-object/from16 v0, p1

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    goto/16 :goto_16

    .line 726
    .end local v13    # "absNumber":D
    .end local v15    # "number":D
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_c7
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-eq v0, v1, :cond_d3

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-ne v0, v1, :cond_ef

    .line 727
    :cond_d3
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    move-object/from16 v0, v17

    if-eq v0, v1, :cond_16

    .line 731
    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->IntegerClass:Ljava/lang/Class;

    const-wide/high16 v3, -0x3e20000000000000L    # -2.147483648E9

    const-wide v5, 0x41dfffffffc00000L    # 2.147483647E9

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v6}, Lorg/mozilla/javascript/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v1

    long-to-int v1, v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto/16 :goto_16

    .line 738
    :cond_ef
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->LongClass:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-eq v0, v1, :cond_fb

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-ne v0, v1, :cond_11e

    .line 739
    :cond_fb
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->LongClass:Ljava/lang/Class;

    move-object/from16 v0, v17

    if-eq v0, v1, :cond_16

    .line 749
    const-wide v1, 0x43dfffffffffffffL    # 9.2233720368547748E18

    invoke-static {v1, v2}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v5

    .line 750
    .local v5, "max":D
    const-wide/high16 v1, -0x3c20000000000000L    # -9.223372036854776E18

    invoke-static {v1, v2}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v3

    .line 751
    .local v3, "min":D
    sget-object v2, Lorg/mozilla/javascript/ScriptRuntime;->LongClass:Ljava/lang/Class;

    move-object/from16 v1, p1

    invoke-static/range {v1 .. v6}, Lorg/mozilla/javascript/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    goto/16 :goto_16

    .line 758
    .end local v3    # "min":D
    .end local v5    # "max":D
    :cond_11e
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->ShortClass:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-eq v0, v1, :cond_12a

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-ne v0, v1, :cond_147

    .line 759
    :cond_12a
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->ShortClass:Ljava/lang/Class;

    move-object/from16 v0, v17

    if-eq v0, v1, :cond_16

    .line 763
    sget-object v8, Lorg/mozilla/javascript/ScriptRuntime;->ShortClass:Ljava/lang/Class;

    const-wide/high16 v9, -0x3f20000000000000L    # -32768.0

    const-wide v11, 0x40dfffc000000000L    # 32767.0

    move-object/from16 v7, p1

    invoke-static/range {v7 .. v12}, Lorg/mozilla/javascript/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v1

    long-to-int v1, v1

    int-to-short v1, v1

    invoke-static {v1}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object p1

    goto/16 :goto_16

    .line 770
    :cond_147
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->ByteClass:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-eq v0, v1, :cond_153

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, p0

    if-ne v0, v1, :cond_170

    .line 771
    :cond_153
    sget-object v1, Lorg/mozilla/javascript/ScriptRuntime;->ByteClass:Ljava/lang/Class;

    move-object/from16 v0, v17

    if-eq v0, v1, :cond_16

    .line 775
    sget-object v8, Lorg/mozilla/javascript/ScriptRuntime;->ByteClass:Ljava/lang/Class;

    const-wide/high16 v9, -0x3fa0000000000000L    # -128.0

    const-wide v11, 0x405fc00000000000L    # 127.0

    move-object/from16 v7, p1

    invoke-static/range {v7 .. v12}, Lorg/mozilla/javascript/NativeJavaObject;->toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J

    move-result-wide v1

    long-to-int v1, v1

    int-to-byte v1, v1

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p1

    goto/16 :goto_16

    .line 782
    :cond_170
    new-instance v1, Ljava/lang/Double;

    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v7

    invoke-direct {v1, v7, v8}, Ljava/lang/Double;-><init>(D)V

    move-object/from16 p1, v1

    goto/16 :goto_16
.end method

.method public static coerceType(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 463
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeJavaObject;->coerceTypeImpl(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static coerceTypeImpl(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 472
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    if-ne v9, p0, :cond_a

    move-object v0, p1

    .line 652
    :cond_9
    :goto_9
    return-object v0

    .line 476
    :cond_a
    invoke-static {p1}, Lorg/mozilla/javascript/NativeJavaObject;->getJSTypeCode(Ljava/lang/Object;)I

    move-result v9

    packed-switch v9, :pswitch_data_1c8

    :goto_11
    move-object v0, p1

    .line 652
    goto :goto_9

    .line 480
    :pswitch_13
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_1c

    .line 481
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 483
    :cond_1c
    const/4 v0, 0x0

    goto :goto_9

    .line 486
    :pswitch_1e
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-eq p0, v9, :cond_26

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_29

    .line 488
    :cond_26
    const-string v0, "undefined"

    goto :goto_9

    .line 491
    :cond_29
    const-string v9, "undefined"

    invoke-static {v9, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto :goto_11

    .line 497
    :pswitch_2f
    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p0, v9, :cond_3b

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-eq p0, v9, :cond_3b

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_3d

    :cond_3b
    move-object v0, p1

    .line 500
    goto :goto_9

    .line 502
    :cond_3d
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_46

    .line 503
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    .line 506
    :cond_46
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto :goto_11

    .line 511
    :pswitch_4a
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_53

    .line 512
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    .line 514
    :cond_53
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_5e

    .line 515
    sget-object v9, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v9, p1}, Lorg/mozilla/javascript/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_9

    .line 517
    :cond_5e
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_68

    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v9, :cond_70

    :cond_68
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-virtual {v9, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_75

    .line 519
    :cond_70
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_9

    .line 522
    :cond_75
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto :goto_11

    .line 527
    :pswitch_79
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-eq p0, v9, :cond_83

    invoke-virtual {p0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_88

    .line 528
    :cond_83
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_9

    .line 530
    :cond_88
    sget-object v9, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eq p0, v9, :cond_90

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->CharacterClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_ae

    :cond_90
    move-object v9, p1

    .line 537
    check-cast v9, Ljava/lang/CharSequence;

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_a8

    move-object v9, p1

    .line 538
    check-cast v9, Ljava/lang/CharSequence;

    const/4 v10, 0x0

    invoke-interface {v9, v10}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v9

    invoke-static {v9}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    goto/16 :goto_9

    .line 541
    :cond_a8
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_9

    .line 544
    :cond_ae
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_b8

    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v9, :cond_c0

    :cond_b8
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-virtual {v9, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v9

    if-eqz v9, :cond_c6

    .line 547
    :cond_c0
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_9

    .line 550
    :cond_c6
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto/16 :goto_11

    .line 555
    :pswitch_cb
    instance-of v9, p1, Lorg/mozilla/javascript/Wrapper;

    if-eqz v9, :cond_d5

    .line 556
    check-cast p1, Lorg/mozilla/javascript/Wrapper;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object p1

    .line 559
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_d5
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    if-eq p0, v9, :cond_dd

    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_e0

    :cond_dd
    move-object v0, p1

    .line 561
    goto/16 :goto_9

    .line 563
    :cond_e0
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_ea

    .line 564
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_9

    .line 567
    :cond_ea
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto/16 :goto_11

    .line 573
    :pswitch_ef
    instance-of v9, p1, Lorg/mozilla/javascript/Wrapper;

    if-eqz v9, :cond_f9

    .line 574
    check-cast p1, Lorg/mozilla/javascript/Wrapper;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object p1

    .line 576
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_f9
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_10c

    .line 577
    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v9, :cond_106

    .line 578
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 580
    :cond_106
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_9

    .line 583
    :cond_10c
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_116

    .line 584
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_9

    .line 587
    :cond_116
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_11f

    move-object v0, p1

    .line 588
    goto/16 :goto_9

    .line 591
    :cond_11f
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto/16 :goto_11

    .line 598
    :pswitch_124
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_12e

    .line 599
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_9

    .line 601
    :cond_12e
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v9

    if-eqz v9, :cond_141

    .line 602
    sget-object v9, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v9, :cond_13b

    .line 603
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 605
    :cond_13b
    invoke-static {p0, p1}, Lorg/mozilla/javascript/NativeJavaObject;->coerceToNumber(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_9

    .line 607
    :cond_141
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14a

    move-object v0, p1

    .line 608
    goto/16 :goto_9

    .line 610
    :cond_14a
    sget-object v9, Lorg/mozilla/javascript/ScriptRuntime;->DateClass:Ljava/lang/Class;

    if-ne p0, v9, :cond_161

    instance-of v9, p1, Lorg/mozilla/javascript/NativeDate;

    if-eqz v9, :cond_161

    move-object v9, p1

    .line 613
    check-cast v9, Lorg/mozilla/javascript/NativeDate;

    invoke-virtual {v9}, Lorg/mozilla/javascript/NativeDate;->getJSTimeValue()D

    move-result-wide v7

    .line 615
    .local v7, "time":D
    new-instance v0, Ljava/util/Date;

    double-to-long v9, v7

    invoke-direct {v0, v9, v10}, Ljava/util/Date;-><init>(J)V

    goto/16 :goto_9

    .line 617
    .end local v7    # "time":D
    :cond_161
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v9

    if-eqz v9, :cond_194

    instance-of v9, p1, Lorg/mozilla/javascript/NativeArray;

    if-eqz v9, :cond_194

    move-object v1, p1

    .line 620
    check-cast v1, Lorg/mozilla/javascript/NativeArray;

    .line 621
    .local v1, "array":Lorg/mozilla/javascript/NativeArray;
    invoke-virtual {v1}, Lorg/mozilla/javascript/NativeArray;->getLength()J

    move-result-wide v5

    .line 622
    .local v5, "length":J
    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 623
    .local v2, "arrayType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    long-to-int v9, v5

    invoke-static {v2, v9}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 624
    .local v0, "Result":Ljava/lang/Object;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_17c
    int-to-long v9, v4

    cmp-long v9, v9, v5

    if-gez v9, :cond_9

    .line 626
    :try_start_181
    invoke-virtual {v1, v4, v1}, Lorg/mozilla/javascript/NativeArray;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v2, v9}, Lorg/mozilla/javascript/NativeJavaObject;->coerceTypeImpl(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-static {v0, v4, v9}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_18c
    .catch Lorg/mozilla/javascript/EvaluatorException; {:try_start_181 .. :try_end_18c} :catch_18f

    .line 624
    :goto_18c
    add-int/lit8 v4, v4, 0x1

    goto :goto_17c

    .line 629
    :catch_18f
    move-exception v3

    .line 630
    .local v3, "ee":Lorg/mozilla/javascript/EvaluatorException;
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto :goto_18c

    .line 636
    .end local v0    # "Result":Ljava/lang/Object;
    .end local v1    # "array":Lorg/mozilla/javascript/NativeArray;
    .end local v2    # "arrayType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "ee":Lorg/mozilla/javascript/EvaluatorException;
    .end local v4    # "i":I
    .end local v5    # "length":J
    :cond_194
    instance-of v9, p1, Lorg/mozilla/javascript/Wrapper;

    if-eqz v9, :cond_1ac

    .line 637
    check-cast p1, Lorg/mozilla/javascript/Wrapper;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object p1

    .line 638
    .restart local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a7

    move-object v0, p1

    .line 639
    goto/16 :goto_9

    .line 640
    :cond_1a7
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto/16 :goto_11

    .line 642
    :cond_1ac
    invoke-virtual {p0}, Ljava/lang/Class;->isInterface()Z

    move-result v9

    if-eqz v9, :cond_1c3

    instance-of v9, p1, Lorg/mozilla/javascript/NativeObject;

    if-nez v9, :cond_1ba

    instance-of v9, p1, Lorg/mozilla/javascript/NativeFunction;

    if-eqz v9, :cond_1c3

    :cond_1ba
    move-object v9, p1

    .line 645
    check-cast v9, Lorg/mozilla/javascript/ScriptableObject;

    invoke-static {p0, v9}, Lorg/mozilla/javascript/NativeJavaObject;->createInterfaceAdapter(Ljava/lang/Class;Lorg/mozilla/javascript/ScriptableObject;)Ljava/lang/Object;

    move-result-object v0

    goto/16 :goto_9

    .line 647
    :cond_1c3
    invoke-static {p1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto/16 :goto_11

    .line 476
    :pswitch_data_1c8
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_13
        :pswitch_2f
        :pswitch_4a
        :pswitch_79
        :pswitch_cb
        :pswitch_ef
        :pswitch_ef
        :pswitch_124
    .end packed-switch
.end method

.method protected static createInterfaceAdapter(Ljava/lang/Class;Lorg/mozilla/javascript/ScriptableObject;)Ljava/lang/Object;
    .registers 7
    .param p1, "so"    # Lorg/mozilla/javascript/ScriptableObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/mozilla/javascript/ScriptableObject;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 662
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Lorg/mozilla/javascript/NativeJavaObject;->COERCED_INTERFACE_KEY:Ljava/lang/Object;

    invoke-static {v4, p0}, Lorg/mozilla/javascript/Kit;->makeHashKeyFromPair(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 663
    .local v2, "key":Ljava/lang/Object;
    invoke-virtual {p1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getAssociatedValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 664
    .local v3, "old":Ljava/lang/Object;
    if-eqz v3, :cond_d

    .line 672
    .end local v3    # "old":Ljava/lang/Object;
    :goto_c
    return-object v3

    .line 668
    .restart local v3    # "old":Ljava/lang/Object;
    :cond_d
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 669
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    invoke-static {v0, p0, p1}, Lorg/mozilla/javascript/InterfaceAdapter;->create(Lorg/mozilla/javascript/Context;Ljava/lang/Class;Lorg/mozilla/javascript/ScriptableObject;)Ljava/lang/Object;

    move-result-object v1

    .line 671
    .local v1, "glue":Ljava/lang/Object;
    invoke-virtual {p1, v2, v1}, Lorg/mozilla/javascript/ScriptableObject;->associateValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    .line 672
    goto :goto_c
.end method

.method static getConversionWeight(Ljava/lang/Object;Ljava/lang/Class;)I
    .registers 10
    .param p0, "fromObj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .local p1, "to":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v2, 0x63

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 235
    invoke-static {p0}, Lorg/mozilla/javascript/NativeJavaObject;->getJSTypeCode(Ljava/lang/Object;)I

    move-result v0

    .line 237
    .local v0, "fromCode":I
    packed-switch v0, :pswitch_data_126

    .line 377
    :cond_d
    :goto_d
    return v2

    .line 240
    :pswitch_e
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-eq p1, v4, :cond_16

    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v4, :cond_d

    :cond_16
    move v2, v3

    .line 242
    goto :goto_d

    .line 247
    :pswitch_18
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-nez v4, :cond_d

    move v2, v3

    .line 248
    goto :goto_d

    .line 254
    :pswitch_20
    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p1, v7, :cond_26

    move v2, v3

    .line 255
    goto :goto_d

    .line 257
    :cond_26
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-ne p1, v3, :cond_2c

    move v2, v4

    .line 258
    goto :goto_d

    .line 260
    :cond_2c
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v3, :cond_32

    move v2, v5

    .line 261
    goto :goto_d

    .line 263
    :cond_32
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v3, :cond_d

    move v2, v6

    .line 264
    goto :goto_d

    .line 269
    :pswitch_38
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v5

    if-eqz v5, :cond_4f

    .line 270
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v4, :cond_44

    move v2, v3

    .line 271
    goto :goto_d

    .line 273
    :cond_44
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v3, :cond_d

    .line 274
    invoke-static {p1}, Lorg/mozilla/javascript/NativeJavaObject;->getSizeRank(Ljava/lang/Class;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 278
    :cond_4f
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v3, :cond_56

    .line 280
    const/16 v2, 0x9

    goto :goto_d

    .line 282
    :cond_56
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v3, :cond_5d

    .line 283
    const/16 v2, 0xa

    goto :goto_d

    .line 285
    :cond_5d
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_d

    move v2, v4

    .line 287
    goto :goto_d

    .line 293
    :pswitch_67
    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v7, :cond_6d

    move v2, v3

    .line 294
    goto :goto_d

    .line 296
    :cond_6d
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_75

    move v2, v4

    .line 297
    goto :goto_d

    .line 299
    :cond_75
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 300
    sget-object v3, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v3, :cond_81

    move v2, v5

    .line 301
    goto :goto_d

    .line 302
    :cond_81
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v3, :cond_d

    move v2, v6

    .line 303
    goto :goto_d

    .line 309
    :pswitch_87
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->ClassClass:Ljava/lang/Class;

    if-ne p1, v4, :cond_8d

    move v2, v3

    .line 310
    goto :goto_d

    .line 312
    :cond_8d
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v3, :cond_94

    move v2, v5

    .line 313
    goto/16 :goto_d

    .line 315
    :cond_94
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v3, :cond_d

    move v2, v6

    .line 316
    goto/16 :goto_d

    .line 322
    :pswitch_9b
    move-object v1, p0

    .line 323
    .local v1, "javaObj":Ljava/lang/Object;
    instance-of v3, v1, Lorg/mozilla/javascript/Wrapper;

    if-eqz v3, :cond_a6

    .line 324
    check-cast v1, Lorg/mozilla/javascript/Wrapper;

    .end local v1    # "javaObj":Ljava/lang/Object;
    invoke-interface {v1}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v1

    .line 326
    .restart local v1    # "javaObj":Ljava/lang/Object;
    :cond_a6
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_af

    .line 327
    const/4 v2, 0x0

    goto/16 :goto_d

    .line 329
    :cond_af
    sget-object v3, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v3, :cond_b6

    move v2, v4

    .line 330
    goto/16 :goto_d

    .line 332
    :cond_b6
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-eqz v3, :cond_d

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v3, :cond_d

    .line 333
    const/4 v3, 0x7

    if-eq v0, v3, :cond_d

    invoke-static {p1}, Lorg/mozilla/javascript/NativeJavaObject;->getSizeRank(Ljava/lang/Class;)I

    move-result v2

    add-int/lit8 v2, v2, 0x2

    goto/16 :goto_d

    .line 340
    .end local v1    # "javaObj":Ljava/lang/Object;
    :pswitch_cb
    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-eq p1, v7, :cond_d8

    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_d8

    move v2, v3

    .line 342
    goto/16 :goto_d

    .line 344
    :cond_d8
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_e5

    .line 345
    instance-of v3, p0, Lorg/mozilla/javascript/NativeArray;

    if-eqz v3, :cond_d

    move v2, v4

    .line 349
    goto/16 :goto_d

    .line 352
    :cond_e5
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->ObjectClass:Ljava/lang/Class;

    if-ne p1, v4, :cond_ec

    move v2, v5

    .line 353
    goto/16 :goto_d

    .line 355
    :cond_ec
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v4, :cond_f3

    move v2, v6

    .line 356
    goto/16 :goto_d

    .line 358
    :cond_f3
    sget-object v4, Lorg/mozilla/javascript/ScriptRuntime;->DateClass:Ljava/lang/Class;

    if-ne p1, v4, :cond_fe

    .line 359
    instance-of v4, p0, Lorg/mozilla/javascript/NativeDate;

    if-eqz v4, :cond_d

    move v2, v3

    .line 361
    goto/16 :goto_d

    .line 364
    :cond_fe
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v4

    if-eqz v4, :cond_113

    .line 365
    instance-of v2, p0, Lorg/mozilla/javascript/NativeObject;

    if-nez v2, :cond_10c

    instance-of v2, p0, Lorg/mozilla/javascript/NativeFunction;

    if-eqz v2, :cond_10f

    :cond_10c
    move v2, v3

    .line 367
    goto/16 :goto_d

    .line 369
    :cond_10f
    const/16 v2, 0xc

    goto/16 :goto_d

    .line 371
    :cond_113
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v3

    if-eqz v3, :cond_d

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v3, :cond_d

    .line 372
    invoke-static {p1}, Lorg/mozilla/javascript/NativeJavaObject;->getSizeRank(Ljava/lang/Class;)I

    move-result v2

    add-int/lit8 v2, v2, 0x4

    goto/16 :goto_d

    .line 237
    nop

    :pswitch_data_126
    .packed-switch 0x0
        :pswitch_e
        :pswitch_18
        :pswitch_20
        :pswitch_38
        :pswitch_67
        :pswitch_87
        :pswitch_9b
        :pswitch_9b
        :pswitch_cb
    .end packed-switch
.end method

.method private static getJSTypeCode(Ljava/lang/Object;)I
    .registers 6
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x7

    const/4 v3, 0x6

    const/4 v1, 0x5

    .line 411
    if-nez p0, :cond_7

    .line 412
    const/4 v1, 0x1

    .line 449
    :cond_6
    :goto_6
    return v1

    .line 414
    :cond_7
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p0, v4, :cond_d

    .line 415
    const/4 v1, 0x0

    goto :goto_6

    .line 417
    :cond_d
    instance-of v4, p0, Ljava/lang/CharSequence;

    if-eqz v4, :cond_13

    .line 418
    const/4 v1, 0x4

    goto :goto_6

    .line 420
    :cond_13
    instance-of v4, p0, Ljava/lang/Number;

    if-eqz v4, :cond_19

    .line 421
    const/4 v1, 0x3

    goto :goto_6

    .line 423
    :cond_19
    instance-of v4, p0, Ljava/lang/Boolean;

    if-eqz v4, :cond_1f

    .line 424
    const/4 v1, 0x2

    goto :goto_6

    .line 426
    :cond_1f
    instance-of v4, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v4, :cond_36

    .line 427
    instance-of v4, p0, Lorg/mozilla/javascript/NativeJavaClass;

    if-nez v4, :cond_6

    .line 430
    instance-of v1, p0, Lorg/mozilla/javascript/NativeJavaArray;

    if-eqz v1, :cond_2d

    move v1, v2

    .line 431
    goto :goto_6

    .line 433
    :cond_2d
    instance-of v1, p0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v1, :cond_33

    move v1, v3

    .line 434
    goto :goto_6

    .line 437
    :cond_33
    const/16 v1, 0x8

    goto :goto_6

    .line 440
    :cond_36
    instance-of v4, p0, Ljava/lang/Class;

    if-nez v4, :cond_6

    .line 444
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 445
    .local v0, "valueClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_46

    move v1, v2

    .line 446
    goto :goto_6

    :cond_46
    move v1, v3

    .line 449
    goto :goto_6
.end method

.method static getSizeRank(Ljava/lang/Class;)I
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)I"
        }
    .end annotation

    .prologue
    .line 381
    .local p0, "aType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_6

    .line 382
    const/4 v0, 0x1

    .line 406
    :goto_5
    return v0

    .line 384
    :cond_6
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_c

    .line 385
    const/4 v0, 0x2

    goto :goto_5

    .line 387
    :cond_c
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_12

    .line 388
    const/4 v0, 0x3

    goto :goto_5

    .line 390
    :cond_12
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_18

    .line 391
    const/4 v0, 0x4

    goto :goto_5

    .line 393
    :cond_18
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_1e

    .line 394
    const/4 v0, 0x5

    goto :goto_5

    .line 396
    :cond_1e
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_24

    .line 397
    const/4 v0, 0x6

    goto :goto_5

    .line 399
    :cond_24
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_2a

    .line 400
    const/4 v0, 0x7

    goto :goto_5

    .line 402
    :cond_2a
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_31

    .line 403
    const/16 v0, 0x63

    goto :goto_5

    .line 406
    :cond_31
    const/16 v0, 0x8

    goto :goto_5
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 8
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 897
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 899
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v3

    iput-boolean v3, p0, Lorg/mozilla/javascript/NativeJavaObject;->isAdapter:Z

    .line 900
    iget-boolean v3, p0, Lorg/mozilla/javascript/NativeJavaObject;->isAdapter:Z

    if-eqz v3, :cond_43

    .line 901
    sget-object v3, Lorg/mozilla/javascript/NativeJavaObject;->adapter_readAdapterObject:Ljava/lang/reflect/Method;

    if-nez v3, :cond_18

    .line 902
    new-instance v3, Ljava/lang/ClassNotFoundException;

    invoke-direct {v3}, Ljava/lang/ClassNotFoundException;-><init>()V

    throw v3

    .line 903
    :cond_18
    const/4 v3, 0x2

    new-array v0, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v0, v3

    const/4 v3, 0x1

    aput-object p1, v0, v3

    .line 905
    .local v0, "args":[Ljava/lang/Object;
    :try_start_21
    sget-object v3, Lorg/mozilla/javascript/NativeJavaObject;->adapter_readAdapterObject:Ljava/lang/reflect/Method;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    iput-object v3, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_2a} :catch_3c

    .line 913
    .end local v0    # "args":[Ljava/lang/Object;
    :goto_2a
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 914
    .local v1, "className":Ljava/lang/String;
    if-eqz v1, :cond_4a

    .line 915
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Lorg/mozilla/javascript/NativeJavaObject;->staticType:Ljava/lang/Class;

    .line 920
    :goto_38
    invoke-virtual {p0}, Lorg/mozilla/javascript/NativeJavaObject;->initMembers()V

    .line 921
    return-void

    .line 906
    .end local v1    # "className":Ljava/lang/String;
    .restart local v0    # "args":[Ljava/lang/Object;
    :catch_3c
    move-exception v2

    .line 907
    .local v2, "ex":Ljava/lang/Exception;
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3}, Ljava/io/IOException;-><init>()V

    throw v3

    .line 910
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v2    # "ex":Ljava/lang/Exception;
    :cond_43
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v3

    iput-object v3, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    goto :goto_2a

    .line 917
    .restart local v1    # "className":Ljava/lang/String;
    :cond_4a
    iput-object v5, p0, Lorg/mozilla/javascript/NativeJavaObject;->staticType:Ljava/lang/Class;

    goto :goto_38
.end method

.method static reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V
    .registers 5
    .param p0, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 861
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v0, "msg.conversion.not.allowed"

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1}, Lorg/mozilla/javascript/JavaMembers;->javaSignature(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lorg/mozilla/javascript/Context;->reportRuntimeError2(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v0

    throw v0
.end method

.method private static toDouble(Ljava/lang/Object;)D
    .registers 6
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 788
    instance-of v2, p0, Ljava/lang/Number;

    if-eqz v2, :cond_b

    .line 789
    check-cast p0, Ljava/lang/Number;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    .line 829
    .restart local p0    # "value":Ljava/lang/Object;
    :goto_a
    return-wide v2

    .line 791
    :cond_b
    instance-of v2, p0, Ljava/lang/String;

    if-eqz v2, :cond_16

    .line 792
    check-cast p0, Ljava/lang/String;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v2

    goto :goto_a

    .line 794
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_16
    instance-of v2, p0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_2e

    .line 795
    instance-of v2, p0, Lorg/mozilla/javascript/Wrapper;

    if-eqz v2, :cond_29

    .line 797
    check-cast p0, Lorg/mozilla/javascript/Wrapper;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v2

    goto :goto_a

    .line 800
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_29
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/Object;)D

    move-result-wide v2

    goto :goto_a

    .line 806
    :cond_2e
    :try_start_2e
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "doubleValue"

    const/4 v2, 0x0

    check-cast v2, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_3a
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2e .. :try_end_3a} :catch_4b
    .catch Ljava/lang/SecurityException; {:try_start_2e .. :try_end_3a} :catch_4e

    move-result-object v1

    .line 815
    .local v1, "meth":Ljava/lang/reflect/Method;
    :goto_3b
    if-eqz v1, :cond_57

    .line 817
    const/4 v2, 0x0

    :try_start_3e
    check-cast v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->doubleValue()D
    :try_end_49
    .catch Ljava/lang/IllegalAccessException; {:try_start_3e .. :try_end_49} :catch_51
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3e .. :try_end_49} :catch_60

    move-result-wide v2

    goto :goto_a

    .line 809
    .end local v1    # "meth":Ljava/lang/reflect/Method;
    :catch_4b
    move-exception v0

    .line 810
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const/4 v1, 0x0

    .line 814
    .restart local v1    # "meth":Ljava/lang/reflect/Method;
    goto :goto_3b

    .line 812
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    .end local v1    # "meth":Ljava/lang/reflect/Method;
    :catch_4e
    move-exception v0

    .line 813
    .local v0, "e":Ljava/lang/SecurityException;
    const/4 v1, 0x0

    .restart local v1    # "meth":Ljava/lang/reflect/Method;
    goto :goto_3b

    .line 820
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_51
    move-exception v0

    .line 822
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v2}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 829
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :cond_57
    :goto_57
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->toNumber(Ljava/lang/String;)D

    move-result-wide v2

    goto :goto_a

    .line 824
    :catch_60
    move-exception v0

    .line 826
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {p0, v2}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    goto :goto_57
.end method

.method private static toInteger(Ljava/lang/Object;Ljava/lang/Class;DD)J
    .registers 10
    .param p0, "value"    # Ljava/lang/Object;
    .param p2, "min"    # D
    .param p4, "max"    # D
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;DD)J"
        }
    .end annotation

    .prologue
    .line 836
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {p0}, Lorg/mozilla/javascript/NativeJavaObject;->toDouble(Ljava/lang/Object;)D

    move-result-wide v0

    .line 838
    .local v0, "d":D
    invoke-static {v0, v1}, Ljava/lang/Double;->isInfinite(D)Z

    move-result v2

    if-nez v2, :cond_10

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 840
    :cond_10
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 843
    :cond_17
    const-wide/16 v2, 0x0

    cmpl-double v2, v0, v2

    if-lez v2, :cond_32

    .line 844
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    .line 850
    :goto_21
    cmpg-double v2, v0, p2

    if-ltz v2, :cond_29

    cmpl-double v2, v0, p4

    if-lez v2, :cond_30

    .line 852
    :cond_29
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lorg/mozilla/javascript/NativeJavaObject;->reportConversionError(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 854
    :cond_30
    double-to-long v2, v0

    return-wide v2

    .line 847
    :cond_32
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    goto :goto_21
.end method

.method public static wrap(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p0, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 150
    .local p2, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 151
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    invoke-virtual {v0}, Lorg/mozilla/javascript/Context;->getWrapFactory()Lorg/mozilla/javascript/WrapFactory;

    move-result-object v1

    invoke-virtual {v1, v0, p0, p1, p2}, Lorg/mozilla/javascript/WrapFactory;->wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 7
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 870
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 872
    iget-boolean v2, p0, Lorg/mozilla/javascript/NativeJavaObject;->isAdapter:Z

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 873
    iget-boolean v2, p0, Lorg/mozilla/javascript/NativeJavaObject;->isAdapter:Z

    if-eqz v2, :cond_41

    .line 874
    sget-object v2, Lorg/mozilla/javascript/NativeJavaObject;->adapter_writeAdapterObject:Ljava/lang/reflect/Method;

    if-nez v2, :cond_17

    .line 875
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2

    .line 877
    :cond_17
    const/4 v2, 0x2

    new-array v0, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    aput-object v3, v0, v2

    const/4 v2, 0x1

    aput-object p1, v0, v2

    .line 879
    .local v0, "args":[Ljava/lang/Object;
    :try_start_22
    sget-object v2, Lorg/mozilla/javascript/NativeJavaObject;->adapter_writeAdapterObject:Ljava/lang/reflect/Method;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_28} :catch_3a

    .line 887
    .end local v0    # "args":[Ljava/lang/Object;
    :goto_28
    iget-object v2, p0, Lorg/mozilla/javascript/NativeJavaObject;->staticType:Ljava/lang/Class;

    if-eqz v2, :cond_47

    .line 888
    iget-object v2, p0, Lorg/mozilla/javascript/NativeJavaObject;->staticType:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 892
    :goto_39
    return-void

    .line 880
    .restart local v0    # "args":[Ljava/lang/Object;
    :catch_3a
    move-exception v1

    .line 881
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v2, Ljava/io/IOException;

    invoke-direct {v2}, Ljava/io/IOException;-><init>()V

    throw v2

    .line 884
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_41
    iget-object v2, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_28

    .line 890
    :cond_47
    invoke-virtual {p1, v4}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    goto :goto_39
.end method


# virtual methods
.method public delete(I)V
    .registers 2
    .param p1, "index"    # I

    .prologue
    .line 107
    return-void
.end method

.method public delete(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 104
    return-void
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 5
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 81
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->members:Lorg/mozilla/javascript/JavaMembers;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 69
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->fieldAndMethods:Ljava/util/Map;

    if-eqz v1, :cond_d

    .line 70
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->fieldAndMethods:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 71
    .local v0, "result":Ljava/lang/Object;
    if-eqz v0, :cond_d

    .line 77
    .end local v0    # "result":Ljava/lang/Object;
    :goto_c
    return-object v0

    :cond_d
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->members:Lorg/mozilla/javascript/JavaMembers;

    iget-object v2, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v1, p0, p1, v2, v3}, Lorg/mozilla/javascript/JavaMembers;->get(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object v0

    goto :goto_c
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 159
    const-string v0, "JavaObject"

    return-object v0
.end method

.method public getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 165
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez p1, :cond_a

    .line 166
    iget-object v5, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    instance-of v5, v5, Ljava/lang/Boolean;

    if-eqz v5, :cond_a

    .line 167
    sget-object p1, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    .line 170
    :cond_a
    if-eqz p1, :cond_10

    sget-object v5, Lorg/mozilla/javascript/ScriptRuntime;->StringClass:Ljava/lang/Class;

    if-ne p1, v5, :cond_17

    .line 171
    :cond_10
    iget-object v5, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 197
    :goto_16
    return-object v4

    .line 174
    :cond_17
    sget-object v5, Lorg/mozilla/javascript/ScriptRuntime;->BooleanClass:Ljava/lang/Class;

    if-ne p1, v5, :cond_37

    .line 175
    const-string v1, "booleanValue"

    .line 181
    .local v1, "converterName":Ljava/lang/String;
    :goto_1d
    invoke-virtual {p0, v1, p0}, Lorg/mozilla/javascript/NativeJavaObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 182
    .local v2, "converterObject":Ljava/lang/Object;
    instance-of v5, v2, Lorg/mozilla/javascript/Function;

    if-eqz v5, :cond_45

    move-object v3, v2

    .line 183
    check-cast v3, Lorg/mozilla/javascript/Function;

    .line 184
    .local v3, "f":Lorg/mozilla/javascript/Function;
    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v5

    invoke-interface {v3}, Lorg/mozilla/javascript/Function;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v6

    sget-object v7, Lorg/mozilla/javascript/ScriptRuntime;->emptyArgs:[Ljava/lang/Object;

    invoke-interface {v3, v5, v6, p0, v7}, Lorg/mozilla/javascript/Function;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 186
    .local v4, "value":Ljava/lang/Object;
    goto :goto_16

    .line 176
    .end local v1    # "converterName":Ljava/lang/String;
    .end local v2    # "converterObject":Ljava/lang/Object;
    .end local v3    # "f":Lorg/mozilla/javascript/Function;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_37
    sget-object v5, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v5, :cond_3e

    .line 177
    const-string v1, "doubleValue"

    .restart local v1    # "converterName":Ljava/lang/String;
    goto :goto_1d

    .line 179
    .end local v1    # "converterName":Ljava/lang/String;
    :cond_3e
    const-string v5, "msg.default.value"

    invoke-static {v5}, Lorg/mozilla/javascript/Context;->reportRuntimeError0(Ljava/lang/String;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v5

    throw v5

    .line 187
    .restart local v1    # "converterName":Ljava/lang/String;
    .restart local v2    # "converterObject":Ljava/lang/Object;
    :cond_45
    sget-object v5, Lorg/mozilla/javascript/ScriptRuntime;->NumberClass:Ljava/lang/Class;

    if-ne p1, v5, :cond_63

    iget-object v5, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    instance-of v5, v5, Ljava/lang/Boolean;

    if-eqz v5, :cond_63

    .line 190
    iget-object v5, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 191
    .local v0, "b":Z
    if-eqz v0, :cond_60

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    :goto_5b
    invoke-static {v5, v6}, Lorg/mozilla/javascript/ScriptRuntime;->wrapNumber(D)Ljava/lang/Number;

    move-result-object v4

    .line 192
    .local v4, "value":Ljava/lang/Number;
    goto :goto_16

    .line 191
    .end local v4    # "value":Ljava/lang/Number;
    :cond_60
    const-wide/16 v5, 0x0

    goto :goto_5b

    .line 193
    .end local v0    # "b":Z
    :cond_63
    iget-object v5, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .local v4, "value":Ljava/lang/String;
    goto :goto_16
.end method

.method public getIds()[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 140
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->members:Lorg/mozilla/javascript/JavaMembers;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/JavaMembers;->getIds(Z)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getParentScope()Lorg/mozilla/javascript/Scriptable;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->parent:Lorg/mozilla/javascript/Scriptable;

    return-object v0
.end method

.method public getPrototype()Lorg/mozilla/javascript/Scriptable;
    .registers 3

    .prologue
    .line 110
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->prototype:Lorg/mozilla/javascript/Scriptable;

    if-nez v0, :cond_17

    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    instance-of v0, v0, Ljava/lang/String;

    if-eqz v0, :cond_17

    .line 111
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->parent:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptableObject;->getTopLevelScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    sget-object v1, Lorg/mozilla/javascript/TopLevel$Builtins;->String:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, v1}, Lorg/mozilla/javascript/TopLevel;->getBuiltinPrototype(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 115
    :goto_16
    return-object v0

    :cond_17
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->prototype:Lorg/mozilla/javascript/Scriptable;

    goto :goto_16
.end method

.method public has(ILorg/mozilla/javascript/Scriptable;)Z
    .registers 4
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 65
    const/4 v0, 0x0

    return v0
.end method

.method public has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 61
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->members:Lorg/mozilla/javascript/JavaMembers;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/mozilla/javascript/JavaMembers;->has(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public hasInstance(Lorg/mozilla/javascript/Scriptable;)Z
    .registers 3
    .param p1, "value"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 100
    const/4 v0, 0x0

    return v0
.end method

.method protected initMembers()V
    .registers 5

    .prologue
    .line 49
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    if-eqz v1, :cond_22

    .line 50
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 54
    .local v0, "dynamicType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_a
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->parent:Lorg/mozilla/javascript/Scriptable;

    iget-object v2, p0, Lorg/mozilla/javascript/NativeJavaObject;->staticType:Ljava/lang/Class;

    iget-boolean v3, p0, Lorg/mozilla/javascript/NativeJavaObject;->isAdapter:Z

    invoke-static {v1, v0, v2, v3}, Lorg/mozilla/javascript/JavaMembers;->lookupClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;Ljava/lang/Class;Z)Lorg/mozilla/javascript/JavaMembers;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->members:Lorg/mozilla/javascript/JavaMembers;

    .line 56
    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->members:Lorg/mozilla/javascript/JavaMembers;

    iget-object v2, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v1, p0, v2, v3}, Lorg/mozilla/javascript/JavaMembers;->getFieldAndMethodsObjects(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Z)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->fieldAndMethods:Ljava/util/Map;

    .line 58
    return-void

    .line 52
    .end local v0    # "dynamicType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_22
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->staticType:Ljava/lang/Class;

    .restart local v0    # "dynamicType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_a
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 95
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->members:Lorg/mozilla/javascript/JavaMembers;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/JavaMembers;->reportMemberNotFound(Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method

.method public put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 88
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->prototype:Lorg/mozilla/javascript/Scriptable;

    if-eqz v0, :cond_d

    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->members:Lorg/mozilla/javascript/JavaMembers;

    invoke-virtual {v0, p1, v5}, Lorg/mozilla/javascript/JavaMembers;->has(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 89
    :cond_d
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->members:Lorg/mozilla/javascript/JavaMembers;

    iget-object v3, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    move-object v1, p0

    move-object v2, p1

    move-object v4, p3

    invoke-virtual/range {v0 .. v5}, Lorg/mozilla/javascript/JavaMembers;->put(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 92
    :goto_17
    return-void

    .line 91
    :cond_18
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->prototype:Lorg/mozilla/javascript/Scriptable;

    iget-object v1, p0, Lorg/mozilla/javascript/NativeJavaObject;->prototype:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v0, p1, v1, p3}, Lorg/mozilla/javascript/Scriptable;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    goto :goto_17
.end method

.method public setParentScope(Lorg/mozilla/javascript/Scriptable;)V
    .registers 2
    .param p1, "m"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 136
    iput-object p1, p0, Lorg/mozilla/javascript/NativeJavaObject;->parent:Lorg/mozilla/javascript/Scriptable;

    .line 137
    return-void
.end method

.method public setPrototype(Lorg/mozilla/javascript/Scriptable;)V
    .registers 2
    .param p1, "m"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 122
    iput-object p1, p0, Lorg/mozilla/javascript/NativeJavaObject;->prototype:Lorg/mozilla/javascript/Scriptable;

    .line 123
    return-void
.end method

.method public unwrap()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 155
    iget-object v0, p0, Lorg/mozilla/javascript/NativeJavaObject;->javaObject:Ljava/lang/Object;

    return-object v0
.end method
