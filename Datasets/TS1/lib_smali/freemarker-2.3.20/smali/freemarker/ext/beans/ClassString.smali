.class final Lfreemarker/ext/beans/ClassString;
.super Ljava/lang/Object;
.source "ClassString.java"


# static fields
.field private static final BIGDECIMAL_CLASS:Ljava/lang/Class;

.field private static final INDETERMINATE:I = 0x2

.field private static final LESS_SPECIFIC:I = 0x1

.field private static final MORE_SPECIFIC:I

.field private static final NUMBER_CLASS:Ljava/lang/Class;

.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Number:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$math$BigDecimal:Ljava/lang/Class;


# instance fields
.field private final classes:[Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    sget-object v0, Lfreemarker/ext/beans/ClassString;->class$java$math$BigDecimal:Ljava/lang/Class;

    if-nez v0, :cond_1d

    const-string v0, "java.math.BigDecimal"

    invoke-static {v0}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/ClassString;->class$java$math$BigDecimal:Ljava/lang/Class;

    :goto_c
    sput-object v0, Lfreemarker/ext/beans/ClassString;->BIGDECIMAL_CLASS:Ljava/lang/Class;

    .line 67
    sget-object v0, Lfreemarker/ext/beans/ClassString;->class$java$lang$Number:Ljava/lang/Class;

    if-nez v0, :cond_20

    const-string v0, "java.lang.Number"

    invoke-static {v0}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/ClassString;->class$java$lang$Number:Ljava/lang/Class;

    :goto_1a
    sput-object v0, Lfreemarker/ext/beans/ClassString;->NUMBER_CLASS:Ljava/lang/Class;

    return-void

    .line 66
    :cond_1d
    sget-object v0, Lfreemarker/ext/beans/ClassString;->class$java$math$BigDecimal:Ljava/lang/Class;

    goto :goto_c

    .line 67
    :cond_20
    sget-object v0, Lfreemarker/ext/beans/ClassString;->class$java$lang$Number:Ljava/lang/Class;

    goto :goto_1a
.end method

.method constructor <init>([Ljava/lang/Object;)V
    .registers 7
    .param p1, "objects"    # [Ljava/lang/Object;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    array-length v1, p1

    .line 73
    .local v1, "l":I
    new-array v3, v1, [Ljava/lang/Class;

    iput-object v3, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    .line 74
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    if-ge v0, v1, :cond_1d

    .line 75
    aget-object v2, p1, v0

    .line 76
    .local v2, "obj":Ljava/lang/Object;
    iget-object v4, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    if-nez v2, :cond_18

    sget-object v3, Lfreemarker/ext/beans/MethodUtilities;->OBJECT_CLASS:Ljava/lang/Class;

    :goto_13
    aput-object v3, v4, v0

    .line 74
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 76
    :cond_18
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    goto :goto_13

    .line 78
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_1d
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 66
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static getClass([Ljava/lang/Class;IIZ)Ljava/lang/Class;
    .registers 5
    .param p0, "classes"    # [Ljava/lang/Class;
    .param p1, "l"    # I
    .param p2, "i"    # I
    .param p3, "varArg"    # Z

    .prologue
    .line 184
    if-eqz p3, :cond_f

    add-int/lit8 v0, p1, -0x1

    if-lt p2, v0, :cond_f

    add-int/lit8 v0, p1, -0x1

    aget-object v0, p0, v0

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    :goto_e
    return-object v0

    :cond_f
    aget-object v0, p0, p2

    goto :goto_e
.end method

.method private isApplicable(Ljava/lang/reflect/Member;Z)Z
    .registers 12
    .param p1, "member"    # Ljava/lang/reflect/Member;
    .param p2, "varArg"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 207
    invoke-static {p1}, Lfreemarker/ext/beans/MethodUtilities;->getParameterTypes(Ljava/lang/reflect/Member;)[Ljava/lang/Class;

    move-result-object v2

    .line 208
    .local v2, "formalTypes":[Ljava/lang/Class;
    iget-object v7, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    array-length v0, v7

    .line 209
    .local v0, "cl":I
    array-length v8, v2

    if-eqz p2, :cond_14

    move v7, v6

    :goto_d
    sub-int v1, v8, v7

    .line 210
    .local v1, "fl":I
    if-eqz p2, :cond_16

    .line 211
    if-ge v0, v1, :cond_18

    .line 232
    :cond_13
    :goto_13
    return v5

    .end local v1    # "fl":I
    :cond_14
    move v7, v5

    .line 209
    goto :goto_d

    .line 215
    .restart local v1    # "fl":I
    :cond_16
    if-ne v0, v1, :cond_13

    .line 219
    :cond_18
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_19
    if-ge v3, v1, :cond_2a

    .line 220
    aget-object v7, v2, v3

    iget-object v8, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    aget-object v8, v8, v3

    invoke-static {v7, v8}, Lfreemarker/ext/beans/ClassString;->isMethodInvocationConvertible(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 219
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    .line 224
    :cond_2a
    if-eqz p2, :cond_42

    .line 225
    aget-object v7, v2, v1

    invoke-virtual {v7}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v4

    .line 226
    .local v4, "varArgType":Ljava/lang/Class;
    move v3, v1

    :goto_33
    if-ge v3, v0, :cond_42

    .line 227
    iget-object v7, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    aget-object v7, v7, v3

    invoke-static {v4, v7}, Lfreemarker/ext/beans/ClassString;->isMethodInvocationConvertible(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 226
    add-int/lit8 v3, v3, 0x1

    goto :goto_33

    .end local v4    # "varArgType":Ljava/lang/Class;
    :cond_42
    move v5, v6

    .line 232
    goto :goto_13
.end method

.method static isMethodInvocationConvertible(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 5
    .param p0, "formal"    # Ljava/lang/Class;
    .param p1, "actual"    # Ljava/lang/Class;

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 254
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 297
    :cond_8
    :goto_8
    return v0

    .line 259
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_1da

    .line 260
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p0, v2, :cond_26

    .line 261
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v2, :cond_23

    const-string v2, "java.lang.Boolean"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_1f
    if-eq p1, v2, :cond_8

    move v0, v1

    goto :goto_8

    :cond_23
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_1f

    .line 262
    :cond_26
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p0, v2, :cond_7e

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v2, :cond_147

    const-string v2, "java.lang.Double"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Double:Ljava/lang/Class;

    :goto_36
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v2, :cond_14b

    const-string v2, "java.lang.Float"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Float:Ljava/lang/Class;

    :goto_44
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v2, :cond_14f

    const-string v2, "java.lang.Long"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Long:Ljava/lang/Class;

    :goto_52
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v2, :cond_153

    const-string v2, "java.lang.Integer"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_60
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v2, :cond_157

    const-string v2, "java.lang.Short"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    :goto_6e
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v2, :cond_15b

    const-string v2, "java.lang.Byte"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_7c
    if-eq p1, v2, :cond_8

    .line 267
    :cond_7e
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v2, :cond_ac

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v2, :cond_15f

    const-string v2, "java.lang.Integer"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_8e
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v2, :cond_163

    const-string v2, "java.lang.Short"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    :goto_9c
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v2, :cond_167

    const-string v2, "java.lang.Byte"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_aa
    if-eq p1, v2, :cond_8

    .line 271
    :cond_ac
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p0, v2, :cond_e8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v2, :cond_16b

    const-string v2, "java.lang.Long"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Long:Ljava/lang/Class;

    :goto_bc
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v2, :cond_16f

    const-string v2, "java.lang.Integer"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_ca
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v2, :cond_173

    const-string v2, "java.lang.Short"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    :goto_d8
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v2, :cond_177

    const-string v2, "java.lang.Byte"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_e6
    if-eq p1, v2, :cond_8

    .line 275
    :cond_e8
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p0, v2, :cond_132

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v2, :cond_17b

    const-string v2, "java.lang.Float"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Float:Ljava/lang/Class;

    :goto_f8
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v2, :cond_17f

    const-string v2, "java.lang.Long"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Long:Ljava/lang/Class;

    :goto_106
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v2, :cond_182

    const-string v2, "java.lang.Integer"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_114
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v2, :cond_185

    const-string v2, "java.lang.Short"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    :goto_122
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v2, :cond_188

    const-string v2, "java.lang.Byte"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_130
    if-eq p1, v2, :cond_8

    .line 280
    :cond_132
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p0, v2, :cond_18e

    .line 281
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v2, :cond_18b

    const-string v2, "java.lang.Character"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Character:Ljava/lang/Class;

    :goto_142
    if-eq p1, v2, :cond_8

    move v0, v1

    goto/16 :goto_8

    .line 262
    :cond_147
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Double:Ljava/lang/Class;

    goto/16 :goto_36

    :cond_14b
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Float:Ljava/lang/Class;

    goto/16 :goto_44

    :cond_14f
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Long:Ljava/lang/Class;

    goto/16 :goto_52

    :cond_153
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    goto/16 :goto_60

    :cond_157
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    goto/16 :goto_6e

    :cond_15b
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    goto/16 :goto_7c

    .line 267
    :cond_15f
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    goto/16 :goto_8e

    :cond_163
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    goto/16 :goto_9c

    :cond_167
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    goto/16 :goto_aa

    .line 271
    :cond_16b
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Long:Ljava/lang/Class;

    goto/16 :goto_bc

    :cond_16f
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    goto/16 :goto_ca

    :cond_173
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    goto/16 :goto_d8

    :cond_177
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    goto/16 :goto_e6

    .line 275
    :cond_17b
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Float:Ljava/lang/Class;

    goto/16 :goto_f8

    :cond_17f
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_106

    :cond_182
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_114

    :cond_185
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_122

    :cond_188
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_130

    .line 281
    :cond_18b
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_142

    .line 282
    :cond_18e
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p0, v2, :cond_1a0

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v2, :cond_1d1

    const-string v2, "java.lang.Byte"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_19e
    if-eq p1, v2, :cond_8

    .line 284
    :cond_1a0
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p0, v2, :cond_1c0

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v2, :cond_1d4

    const-string v2, "java.lang.Short"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    :goto_1b0
    if-eq p1, v2, :cond_8

    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v2, :cond_1d7

    const-string v2, "java.lang.Byte"

    invoke-static {v2}, Lfreemarker/ext/beans/ClassString;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_1be
    if-eq p1, v2, :cond_8

    .line 287
    :cond_1c0
    sget-object v2, Lfreemarker/ext/beans/ClassString;->BIGDECIMAL_CLASS:Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_1ce

    invoke-static {p0}, Lfreemarker/ext/beans/ClassString;->isNumerical(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_8

    :cond_1ce
    move v0, v1

    .line 294
    goto/16 :goto_8

    .line 282
    :cond_1d1
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_19e

    .line 284
    :cond_1d4
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_1b0

    :cond_1d7
    sget-object v2, Lfreemarker/ext/beans/ClassString;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_1be

    :cond_1da
    move v0, v1

    .line 297
    goto/16 :goto_8
.end method

.method private static isNumerical(Ljava/lang/Class;)Z
    .registers 2
    .param p0, "type"    # Ljava/lang/Class;

    .prologue
    .line 301
    sget-object v0, Lfreemarker/ext/beans/ClassString;->NUMBER_CLASS:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_16

    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_18

    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_18

    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_18

    :cond_16
    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method private static moreSpecific([Ljava/lang/Class;[Ljava/lang/Class;Z)I
    .registers 14
    .param p0, "c1"    # [Ljava/lang/Class;
    .param p1, "c2"    # [Ljava/lang/Class;
    .param p2, "varArg"    # Z

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 154
    const/4 v0, 0x0

    .line 155
    .local v0, "c1MoreSpecific":Z
    const/4 v1, 0x0

    .line 156
    .local v1, "c2MoreSpecific":Z
    array-length v2, p0

    .line 157
    .local v2, "cl1":I
    array-length v3, p1

    .line 159
    .local v3, "cl2":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_8
    if-ge v6, v2, :cond_2d

    .line 160
    invoke-static {p0, v2, v6, p2}, Lfreemarker/ext/beans/ClassString;->getClass([Ljava/lang/Class;IIZ)Ljava/lang/Class;

    move-result-object v4

    .line 161
    .local v4, "class1":Ljava/lang/Class;
    invoke-static {p1, v3, v6, p2}, Lfreemarker/ext/beans/ClassString;->getClass([Ljava/lang/Class;IIZ)Ljava/lang/Class;

    move-result-object v5

    .line 162
    .local v5, "class2":Ljava/lang/Class;
    if-eq v4, v5, :cond_26

    .line 163
    if-nez v0, :cond_1c

    invoke-static {v4, v5}, Lfreemarker/ext/beans/MethodUtilities;->isMoreSpecific(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_29

    :cond_1c
    move v0, v8

    .line 166
    :goto_1d
    if-nez v1, :cond_25

    invoke-static {v5, v4}, Lfreemarker/ext/beans/MethodUtilities;->isMoreSpecific(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v10

    if-eqz v10, :cond_2b

    :cond_25
    move v1, v8

    .line 159
    :cond_26
    :goto_26
    add-int/lit8 v6, v6, 0x1

    goto :goto_8

    :cond_29
    move v0, v7

    .line 163
    goto :goto_1d

    :cond_2b
    move v1, v7

    .line 166
    goto :goto_26

    .line 171
    .end local v4    # "class1":Ljava/lang/Class;
    .end local v5    # "class2":Ljava/lang/Class;
    :cond_2d
    if-eqz v0, :cond_33

    .line 172
    if-eqz v1, :cond_32

    move v7, v9

    .line 180
    :cond_32
    :goto_32
    return v7

    .line 177
    :cond_33
    if-eqz v1, :cond_37

    move v7, v8

    .line 178
    goto :goto_32

    :cond_37
    move v7, v9

    .line 180
    goto :goto_32
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v2, 0x0

    .line 93
    instance-of v3, p1, Lfreemarker/ext/beans/ClassString;

    if-eqz v3, :cond_10

    move-object v0, p1

    .line 94
    check-cast v0, Lfreemarker/ext/beans/ClassString;

    .line 95
    .local v0, "cs":Lfreemarker/ext/beans/ClassString;
    iget-object v3, v0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    array-length v3, v3

    iget-object v4, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    array-length v4, v4

    if-eq v3, v4, :cond_11

    .line 105
    .end local v0    # "cs":Lfreemarker/ext/beans/ClassString;
    :cond_10
    :goto_10
    return v2

    .line 98
    .restart local v0    # "cs":Lfreemarker/ext/beans/ClassString;
    :cond_11
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_12
    iget-object v3, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    array-length v3, v3

    if-ge v1, v3, :cond_24

    .line 99
    iget-object v3, v0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    aget-object v3, v3, v1

    iget-object v4, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    aget-object v4, v4, v1

    if-ne v3, v4, :cond_10

    .line 98
    add-int/lit8 v1, v1, 0x1

    goto :goto_12

    .line 103
    :cond_24
    const/4 v2, 0x1

    goto :goto_10
.end method

.method getApplicables(Ljava/util/List;Z)Ljava/util/LinkedList;
    .registers 7
    .param p1, "methods"    # Ljava/util/List;
    .param p2, "varArg"    # Z

    .prologue
    .line 192
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 193
    .local v1, "list":Ljava/util/LinkedList;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 194
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Member;

    .line 195
    .local v2, "member":Ljava/lang/reflect/Member;
    invoke-direct {p0, v2, p2}, Lfreemarker/ext/beans/ClassString;->isApplicable(Ljava/lang/reflect/Member;Z)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 196
    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 199
    .end local v2    # "member":Ljava/lang/reflect/Member;
    :cond_1f
    return-object v1
.end method

.method getClasses()[Ljava/lang/Class;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    return-object v0
.end method

.method getMostSpecific(Ljava/util/List;Z)Ljava/lang/Object;
    .registers 14
    .param p1, "methods"    # Ljava/util/List;
    .param p2, "varArg"    # Z

    .prologue
    const/4 v10, 0x1

    .line 114
    invoke-virtual {p0, p1, p2}, Lfreemarker/ext/beans/ClassString;->getApplicables(Ljava/util/List;Z)Ljava/util/LinkedList;

    move-result-object v2

    .line 115
    .local v2, "applicables":Ljava/util/LinkedList;
    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_e

    .line 116
    sget-object v9, Lfreemarker/ext/beans/OverloadedMethodsSubset;->NO_SUCH_METHOD:Ljava/lang/Object;

    .line 150
    :goto_d
    return-object v9

    .line 118
    :cond_e
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v9

    if-ne v9, v10, :cond_19

    .line 119
    invoke-virtual {v2}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v9

    goto :goto_d

    .line 121
    :cond_19
    new-instance v8, Ljava/util/LinkedList;

    invoke-direct {v8}, Ljava/util/LinkedList;-><init>()V

    .line 122
    .local v8, "maximals":Ljava/util/LinkedList;
    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :cond_22
    :goto_22
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5b

    .line 124
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Member;

    .line 125
    .local v1, "applicable":Ljava/lang/reflect/Member;
    invoke-static {v1}, Lfreemarker/ext/beans/MethodUtilities;->getParameterTypes(Ljava/lang/reflect/Member;)[Ljava/lang/Class;

    move-result-object v0

    .line 126
    .local v0, "appArgs":[Ljava/lang/Class;
    const/4 v4, 0x0

    .line 127
    .local v4, "lessSpecific":Z
    invoke-virtual {v8}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .line 128
    .local v7, "maximal":Ljava/util/Iterator;
    :goto_37
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_55

    .line 130
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/reflect/Member;

    .line 131
    .local v5, "max":Ljava/lang/reflect/Member;
    invoke-static {v5}, Lfreemarker/ext/beans/MethodUtilities;->getParameterTypes(Ljava/lang/reflect/Member;)[Ljava/lang/Class;

    move-result-object v6

    .line 132
    .local v6, "maxArgs":[Ljava/lang/Class;
    invoke-static {v0, v6, p2}, Lfreemarker/ext/beans/ClassString;->moreSpecific([Ljava/lang/Class;[Ljava/lang/Class;Z)I

    move-result v9

    packed-switch v9, :pswitch_data_6a

    goto :goto_37

    .line 134
    :pswitch_4f
    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    goto :goto_37

    .line 138
    :pswitch_53
    const/4 v4, 0x1

    goto :goto_37

    .line 143
    .end local v5    # "max":Ljava/lang/reflect/Member;
    .end local v6    # "maxArgs":[Ljava/lang/Class;
    :cond_55
    if-nez v4, :cond_22

    .line 144
    invoke-virtual {v8, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    goto :goto_22

    .line 147
    .end local v0    # "appArgs":[Ljava/lang/Class;
    .end local v1    # "applicable":Ljava/lang/reflect/Member;
    .end local v4    # "lessSpecific":Z
    .end local v7    # "maximal":Ljava/util/Iterator;
    :cond_5b
    invoke-virtual {v8}, Ljava/util/LinkedList;->size()I

    move-result v9

    if-le v9, v10, :cond_64

    .line 148
    sget-object v9, Lfreemarker/ext/beans/OverloadedMethodsSubset;->AMBIGUOUS_METHOD:Ljava/lang/Object;

    goto :goto_d

    .line 150
    :cond_64
    invoke-virtual {v8}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v9

    goto :goto_d

    .line 132
    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_53
    .end packed-switch
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 85
    const/4 v0, 0x0

    .line 86
    .local v0, "hash":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    iget-object v2, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    array-length v2, v2

    if-ge v1, v2, :cond_13

    .line 87
    iget-object v2, p0, Lfreemarker/ext/beans/ClassString;->classes:[Ljava/lang/Class;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 86
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 89
    :cond_13
    return v0
.end method
