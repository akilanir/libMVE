.class Lfreemarker/ext/beans/MethodUtilities;
.super Ljava/lang/Object;
.source "MethodUtilities.java"


# static fields
.field private static final CONSTRUCTOR_IS_VARARGS:Ljava/lang/reflect/Method;

.field private static final METHOD_IS_VARARGS:Ljava/lang/reflect/Method;

.field static final OBJECT_CLASS:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$lang$reflect$Constructor:Ljava/lang/Class;

.field static class$java$lang$reflect$Method:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 67
    sget-object v0, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v0, :cond_33

    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Object:Ljava/lang/Class;

    :goto_c
    sput-object v0, Lfreemarker/ext/beans/MethodUtilities;->OBJECT_CLASS:Ljava/lang/Class;

    .line 68
    sget-object v0, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$reflect$Method:Ljava/lang/Class;

    if-nez v0, :cond_36

    const-string v0, "java.lang.reflect.Method"

    invoke-static {v0}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$reflect$Method:Ljava/lang/Class;

    :goto_1a
    invoke-static {v0}, Lfreemarker/ext/beans/MethodUtilities;->getIsVarArgsMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/MethodUtilities;->METHOD_IS_VARARGS:Ljava/lang/reflect/Method;

    .line 69
    sget-object v0, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$reflect$Constructor:Ljava/lang/Class;

    if-nez v0, :cond_39

    const-string v0, "java.lang.reflect.Constructor"

    invoke-static {v0}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$reflect$Constructor:Ljava/lang/Class;

    :goto_2c
    invoke-static {v0}, Lfreemarker/ext/beans/MethodUtilities;->getIsVarArgsMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/MethodUtilities;->CONSTRUCTOR_IS_VARARGS:Ljava/lang/reflect/Method;

    return-void

    .line 67
    :cond_33
    sget-object v0, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_c

    .line 68
    :cond_36
    sget-object v0, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$reflect$Method:Ljava/lang/Class;

    goto :goto_1a

    .line 69
    :cond_39
    sget-object v0, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$reflect$Constructor:Ljava/lang/Class;

    goto :goto_2c
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 67
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

.method private static collectAssignables(Ljava/lang/Class;Ljava/lang/Class;Ljava/util/Set;)V
    .registers 7
    .param p0, "c1"    # Ljava/lang/Class;
    .param p1, "c2"    # Ljava/lang/Class;
    .param p2, "s"    # Ljava/util/Set;

    .prologue
    .line 182
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 183
    invoke-interface {p2, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 185
    :cond_9
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    .line 186
    .local v2, "sc":Ljava/lang/Class;
    if-eqz v2, :cond_12

    .line 187
    invoke-static {v2, p1, p2}, Lfreemarker/ext/beans/MethodUtilities;->collectAssignables(Ljava/lang/Class;Ljava/lang/Class;Ljava/util/Set;)V

    .line 189
    :cond_12
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 190
    .local v1, "itf":[Ljava/lang/Class;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_17
    array-length v3, v1

    if-ge v0, v3, :cond_22

    .line 191
    aget-object v3, v1, v0

    invoke-static {v3, p1, p2}, Lfreemarker/ext/beans/MethodUtilities;->collectAssignables(Ljava/lang/Class;Ljava/lang/Class;Ljava/util/Set;)V

    .line 190
    add-int/lit8 v0, v0, 0x1

    goto :goto_17

    .line 193
    :cond_22
    return-void
.end method

.method private static getAssignables(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/Set;
    .registers 3
    .param p0, "c1"    # Ljava/lang/Class;
    .param p1, "c2"    # Ljava/lang/Class;

    .prologue
    .line 176
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 177
    .local v0, "s":Ljava/util/Set;
    invoke-static {p0, p1, v0}, Lfreemarker/ext/beans/MethodUtilities;->collectAssignables(Ljava/lang/Class;Ljava/lang/Class;Ljava/util/Set;)V

    .line 178
    return-object v0
.end method

.method private static getIsVarArgsMethod(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 5
    .param p0, "memberClass"    # Ljava/lang/Class;

    .prologue
    const/4 v2, 0x0

    .line 232
    :try_start_1
    const-string v3, "isVarArgs"

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Class;

    invoke-virtual {p0, v3, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_9
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_9} :catch_b

    move-result-object v1

    .line 235
    :goto_a
    return-object v1

    .line 234
    :catch_b
    move-exception v0

    .local v0, "e":Ljava/lang/NoSuchMethodException;
    move-object v1, v2

    .line 235
    goto :goto_a
.end method

.method static getMostSpecificCommonType(Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/Class;
    .registers 11
    .param p0, "c1"    # Ljava/lang/Class;
    .param p1, "c2"    # Ljava/lang/Class;

    .prologue
    .line 79
    if-ne p0, p1, :cond_4

    move-object v7, p0

    .line 128
    :goto_3
    return-object v7

    .line 82
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v7

    if-eqz v7, :cond_1a

    .line 83
    sget-object v7, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p1, v7, :cond_3b

    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v7, :cond_38

    const-string v7, "java.lang.Byte"

    invoke-static {v7}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .end local p1    # "c2":Ljava/lang/Class;
    sput-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Byte:Ljava/lang/Class;

    .line 93
    .restart local p1    # "c2":Ljava/lang/Class;
    :cond_1a
    :goto_1a
    invoke-static {p0, p1}, Lfreemarker/ext/beans/MethodUtilities;->getAssignables(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    .line 94
    .local v0, "a1":Ljava/util/Set;
    invoke-static {p1, p0}, Lfreemarker/ext/beans/MethodUtilities;->getAssignables(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v1

    .line 95
    .local v1, "a2":Ljava/util/Set;
    invoke-interface {v0, v1}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    .line 96
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_b9

    .line 99
    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v7, :cond_b5

    const-string v7, "java.lang.Object"

    invoke-static {v7}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_3

    .line 83
    .end local v0    # "a1":Ljava/util/Set;
    .end local v1    # "a2":Ljava/util/Set;
    :cond_38
    sget-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_1a

    .line 84
    :cond_3b
    sget-object v7, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p1, v7, :cond_4f

    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v7, :cond_4c

    const-string v7, "java.lang.Short"

    invoke-static {v7}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .end local p1    # "c2":Ljava/lang/Class;
    sput-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Short:Ljava/lang/Class;

    .restart local p1    # "c2":Ljava/lang/Class;
    :goto_4b
    goto :goto_1a

    :cond_4c
    sget-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_4b

    .line 85
    :cond_4f
    sget-object v7, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p1, v7, :cond_63

    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v7, :cond_60

    const-string v7, "java.lang.Character"

    invoke-static {v7}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .end local p1    # "c2":Ljava/lang/Class;
    sput-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Character:Ljava/lang/Class;

    .restart local p1    # "c2":Ljava/lang/Class;
    :goto_5f
    goto :goto_1a

    :cond_60
    sget-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Character:Ljava/lang/Class;

    goto :goto_5f

    .line 86
    :cond_63
    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v7, :cond_77

    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v7, :cond_74

    const-string v7, "java.lang.Integer"

    invoke-static {v7}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .end local p1    # "c2":Ljava/lang/Class;
    sput-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Integer:Ljava/lang/Class;

    .restart local p1    # "c2":Ljava/lang/Class;
    :goto_73
    goto :goto_1a

    :cond_74
    sget-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_73

    .line 87
    :cond_77
    sget-object v7, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v7, :cond_8b

    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v7, :cond_88

    const-string v7, "java.lang.Float"

    invoke-static {v7}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .end local p1    # "c2":Ljava/lang/Class;
    sput-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Float:Ljava/lang/Class;

    .restart local p1    # "c2":Ljava/lang/Class;
    :goto_87
    goto :goto_1a

    :cond_88
    sget-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_87

    .line 88
    :cond_8b
    sget-object v7, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v7, :cond_a0

    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v7, :cond_9d

    const-string v7, "java.lang.Long"

    invoke-static {v7}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .end local p1    # "c2":Ljava/lang/Class;
    sput-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Long:Ljava/lang/Class;

    .restart local p1    # "c2":Ljava/lang/Class;
    :goto_9b
    goto/16 :goto_1a

    :cond_9d
    sget-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_9b

    .line 89
    :cond_a0
    sget-object v7, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v7, :cond_1a

    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v7, :cond_b2

    const-string v7, "java.lang.Double"

    invoke-static {v7}, Lfreemarker/ext/beans/MethodUtilities;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .end local p1    # "c2":Ljava/lang/Class;
    sput-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Double:Ljava/lang/Class;

    .restart local p1    # "c2":Ljava/lang/Class;
    :goto_b0
    goto/16 :goto_1a

    :cond_b2
    sget-object p1, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_b0

    .line 99
    .restart local v0    # "a1":Ljava/util/Set;
    .restart local v1    # "a2":Ljava/util/Set;
    :cond_b5
    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->class$java$lang$Object:Ljava/lang/Class;

    goto/16 :goto_3

    .line 105
    :cond_b9
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .local v4, "max":Ljava/util/List;
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :cond_c2
    :goto_c2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f2

    .line 107
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    .line 108
    .local v2, "clazz":Ljava/lang/Class;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "maxiter":Ljava/util/Iterator;
    :cond_d2
    :goto_d2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_ee

    .line 109
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Class;

    .line 110
    .local v5, "maxClazz":Ljava/lang/Class;
    invoke-static {v5, v2}, Lfreemarker/ext/beans/MethodUtilities;->isMoreSpecific(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_c2

    .line 115
    invoke-static {v2, v5}, Lfreemarker/ext/beans/MethodUtilities;->isMoreSpecific(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_d2

    .line 118
    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    goto :goto_d2

    .line 123
    .end local v5    # "maxClazz":Ljava/lang/Class;
    :cond_ee
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_c2

    .line 125
    .end local v2    # "clazz":Ljava/lang/Class;
    .end local v6    # "maxiter":Ljava/util/Iterator;
    :cond_f2
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x1

    if-le v7, v8, :cond_fd

    .line 126
    sget-object v7, Lfreemarker/ext/beans/MethodUtilities;->OBJECT_CLASS:Ljava/lang/Class;

    goto/16 :goto_3

    .line 128
    :cond_fd
    const/4 v7, 0x0

    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Class;

    goto/16 :goto_3
.end method

.method static getParameterTypes(Ljava/lang/reflect/Member;)[Ljava/lang/Class;
    .registers 2
    .param p0, "member"    # Ljava/lang/reflect/Member;

    .prologue
    .line 196
    instance-of v0, p0, Ljava/lang/reflect/Method;

    if-eqz v0, :cond_b

    .line 197
    check-cast p0, Ljava/lang/reflect/Method;

    .end local p0    # "member":Ljava/lang/reflect/Member;
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 200
    :goto_a
    return-object v0

    .line 199
    .restart local p0    # "member":Ljava/lang/reflect/Member;
    :cond_b
    instance-of v0, p0, Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_16

    .line 200
    check-cast p0, Ljava/lang/reflect/Constructor;

    .end local p0    # "member":Ljava/lang/reflect/Member;
    invoke-virtual {p0}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    goto :goto_a

    .line 202
    .restart local p0    # "member":Ljava/lang/reflect/Member;
    :cond_16
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
.end method

.method static isMoreSpecific(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 4
    .param p0, "specific"    # Ljava/lang/Class;
    .param p1, "generic"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x1

    .line 143
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 172
    :cond_7
    :goto_7
    return v0

    .line 147
    :cond_8
    invoke-virtual {p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_5e

    .line 148
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_16

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    .line 151
    :cond_16
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_22

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    .line 155
    :cond_22
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_32

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    .line 160
    :cond_32
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_46

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    .line 165
    :cond_46
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p1, v1, :cond_5e

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p0, v1, :cond_7

    .line 172
    :cond_5e
    const/4 v0, 0x0

    goto :goto_7
.end method

.method static isVarArgs(Ljava/lang/reflect/Member;)Z
    .registers 2
    .param p0, "member"    # Ljava/lang/reflect/Member;

    .prologue
    .line 206
    instance-of v0, p0, Ljava/lang/reflect/Method;

    if-eqz v0, :cond_b

    .line 207
    sget-object v0, Lfreemarker/ext/beans/MethodUtilities;->METHOD_IS_VARARGS:Ljava/lang/reflect/Method;

    invoke-static {p0, v0}, Lfreemarker/ext/beans/MethodUtilities;->isVarArgs(Ljava/lang/reflect/Member;Ljava/lang/reflect/Method;)Z

    move-result v0

    .line 210
    :goto_a
    return v0

    .line 209
    :cond_b
    instance-of v0, p0, Ljava/lang/reflect/Constructor;

    if-eqz v0, :cond_16

    .line 210
    sget-object v0, Lfreemarker/ext/beans/MethodUtilities;->CONSTRUCTOR_IS_VARARGS:Ljava/lang/reflect/Method;

    invoke-static {p0, v0}, Lfreemarker/ext/beans/MethodUtilities;->isVarArgs(Ljava/lang/reflect/Member;Ljava/lang/reflect/Method;)Z

    move-result v0

    goto :goto_a

    .line 212
    :cond_16
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
.end method

.method private static isVarArgs(Ljava/lang/reflect/Member;Ljava/lang/reflect/Method;)Z
    .registers 4
    .param p0, "member"    # Ljava/lang/reflect/Member;
    .param p1, "isVarArgsMethod"    # Ljava/lang/reflect/Method;

    .prologue
    .line 216
    if-nez p1, :cond_4

    .line 217
    const/4 v1, 0x0

    .line 220
    :goto_3
    return v1

    :cond_4
    const/4 v1, 0x0

    :try_start_5
    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_10
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_10} :catch_12
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_10} :catch_14

    move-result v1

    goto :goto_3

    .line 222
    :catch_12
    move-exception v0

    .line 223
    .local v0, "e":Ljava/lang/RuntimeException;
    throw v0

    .line 225
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_14
    move-exception v0

    .line 226
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
