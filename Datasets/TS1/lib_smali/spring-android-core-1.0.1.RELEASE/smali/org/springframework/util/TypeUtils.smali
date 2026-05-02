.class public abstract Lorg/springframework/util/TypeUtils;
.super Ljava/lang/Object;
.source "TypeUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static isAssignable(Ljava/lang/reflect/ParameterizedType;Ljava/lang/reflect/ParameterizedType;)Z
    .registers 12
    .param p0, "lhsType"    # Ljava/lang/reflect/ParameterizedType;
    .param p1, "rhsType"    # Ljava/lang/reflect/ParameterizedType;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 115
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    .line 136
    :cond_8
    :goto_8
    return v6

    .line 119
    :cond_9
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v2

    .line 120
    .local v2, "lhsTypeArguments":[Ljava/lang/reflect/Type;
    invoke-interface {p1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v4

    .line 122
    .local v4, "rhsTypeArguments":[Ljava/lang/reflect/Type;
    array-length v8, v2

    array-length v9, v4

    if-eq v8, v9, :cond_17

    move v6, v7

    .line 123
    goto :goto_8

    .line 126
    :cond_17
    array-length v5, v2

    .local v5, "size":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_19
    if-ge v0, v5, :cond_8

    .line 127
    aget-object v1, v2, v0

    .line 128
    .local v1, "lhsArg":Ljava/lang/reflect/Type;
    aget-object v3, v4, v0

    .line 130
    .local v3, "rhsArg":Ljava/lang/reflect/Type;
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_33

    instance-of v8, v1, Ljava/lang/reflect/WildcardType;

    if-eqz v8, :cond_31

    check-cast v1, Ljava/lang/reflect/WildcardType;

    .end local v1    # "lhsArg":Ljava/lang/reflect/Type;
    invoke-static {v1, v3}, Lorg/springframework/util/TypeUtils;->isAssignable(Ljava/lang/reflect/WildcardType;Ljava/lang/reflect/Type;)Z

    move-result v8

    if-nez v8, :cond_33

    :cond_31
    move v6, v7

    .line 132
    goto :goto_8

    .line 126
    :cond_33
    add-int/lit8 v0, v0, 0x1

    goto :goto_19
.end method

.method public static isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z
    .registers 9
    .param p0, "lhsType"    # Ljava/lang/reflect/Type;
    .param p1, "rhsType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 45
    const-string v6, "Left-hand side type must not be null"

    invoke-static {p0, v6}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    const-string v6, "Right-hand side type must not be null"

    invoke-static {p1, v6}, Lorg/springframework/util/Assert;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_18

    const-class v6, Ljava/lang/Object;

    invoke-virtual {p0, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1a

    .line 50
    :cond_18
    const/4 v6, 0x1

    .line 111
    .end local p0    # "lhsType":Ljava/lang/reflect/Type;
    .end local p1    # "rhsType":Ljava/lang/reflect/Type;
    :goto_19
    return v6

    .line 53
    .restart local p0    # "lhsType":Ljava/lang/reflect/Type;
    .restart local p1    # "rhsType":Ljava/lang/reflect/Type;
    :cond_1a
    instance-of v6, p0, Ljava/lang/Class;

    if-eqz v6, :cond_5b

    move-object v0, p0

    .line 54
    check-cast v0, Ljava/lang/Class;

    .line 57
    .local v0, "lhsClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v6, p1, Ljava/lang/Class;

    if-eqz v6, :cond_2c

    .line 58
    check-cast p1, Ljava/lang/Class;

    .end local p1    # "rhsType":Ljava/lang/reflect/Type;
    invoke-static {v0, p1}, Lorg/springframework/util/ClassUtils;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v6

    goto :goto_19

    .line 61
    .restart local p1    # "rhsType":Ljava/lang/reflect/Type;
    :cond_2c
    instance-of v6, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v6, :cond_42

    move-object v6, p1

    .line 62
    check-cast v6, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v6}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v5

    .line 65
    .local v5, "rhsRaw":Ljava/lang/reflect/Type;
    instance-of v6, v5, Ljava/lang/Class;

    if-eqz v6, :cond_5b

    .line 66
    check-cast v5, Ljava/lang/Class;

    .end local v5    # "rhsRaw":Ljava/lang/reflect/Type;
    invoke-static {v0, v5}, Lorg/springframework/util/ClassUtils;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v6

    goto :goto_19

    .line 69
    :cond_42
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v6

    if-eqz v6, :cond_5b

    instance-of v6, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v6, :cond_5b

    .line 70
    check-cast p1, Ljava/lang/reflect/GenericArrayType;

    .end local p1    # "rhsType":Ljava/lang/reflect/Type;
    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v4

    .line 72
    .local v4, "rhsComponent":Ljava/lang/reflect/Type;
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6, v4}, Lorg/springframework/util/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v6

    goto :goto_19

    .line 77
    .end local v0    # "lhsClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "rhsComponent":Ljava/lang/reflect/Type;
    .restart local p1    # "rhsType":Ljava/lang/reflect/Type;
    :cond_5b
    instance-of v6, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v6, :cond_84

    .line 78
    instance-of v6, p1, Ljava/lang/Class;

    if-eqz v6, :cond_77

    move-object v6, p0

    .line 79
    check-cast v6, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v6}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 81
    .local v2, "lhsRaw":Ljava/lang/reflect/Type;
    instance-of v6, v2, Ljava/lang/Class;

    if-eqz v6, :cond_84

    .line 82
    check-cast v2, Ljava/lang/Class;

    .end local v2    # "lhsRaw":Ljava/lang/reflect/Type;
    check-cast p1, Ljava/lang/Class;

    .end local p1    # "rhsType":Ljava/lang/reflect/Type;
    invoke-static {v2, p1}, Lorg/springframework/util/ClassUtils;->isAssignable(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v6

    goto :goto_19

    .line 85
    .restart local p1    # "rhsType":Ljava/lang/reflect/Type;
    :cond_77
    instance-of v6, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v6, :cond_84

    .line 86
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0    # "lhsType":Ljava/lang/reflect/Type;
    check-cast p1, Ljava/lang/reflect/ParameterizedType;

    .end local p1    # "rhsType":Ljava/lang/reflect/Type;
    invoke-static {p0, p1}, Lorg/springframework/util/TypeUtils;->isAssignable(Ljava/lang/reflect/ParameterizedType;Ljava/lang/reflect/ParameterizedType;)Z

    move-result v6

    goto :goto_19

    .line 90
    .restart local p0    # "lhsType":Ljava/lang/reflect/Type;
    .restart local p1    # "rhsType":Ljava/lang/reflect/Type;
    :cond_84
    instance-of v6, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v6, :cond_b6

    move-object v6, p0

    .line 91
    check-cast v6, Ljava/lang/reflect/GenericArrayType;

    invoke-interface {v6}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 93
    .local v1, "lhsComponent":Ljava/lang/reflect/Type;
    instance-of v6, p1, Ljava/lang/Class;

    if-eqz v6, :cond_a6

    move-object v3, p1

    .line 94
    check-cast v3, Ljava/lang/Class;

    .line 96
    .local v3, "rhsClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3}, Ljava/lang/Class;->isArray()Z

    move-result v6

    if-eqz v6, :cond_b6

    .line 97
    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v1, v6}, Lorg/springframework/util/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v6

    goto/16 :goto_19

    .line 100
    .end local v3    # "rhsClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_a6
    instance-of v6, p1, Ljava/lang/reflect/GenericArrayType;

    if-eqz v6, :cond_b6

    .line 101
    check-cast p1, Ljava/lang/reflect/GenericArrayType;

    .end local p1    # "rhsType":Ljava/lang/reflect/Type;
    invoke-interface {p1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v4

    .line 103
    .restart local v4    # "rhsComponent":Ljava/lang/reflect/Type;
    invoke-static {v1, v4}, Lorg/springframework/util/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v6

    goto/16 :goto_19

    .line 107
    .end local v1    # "lhsComponent":Ljava/lang/reflect/Type;
    .end local v4    # "rhsComponent":Ljava/lang/reflect/Type;
    .restart local p1    # "rhsType":Ljava/lang/reflect/Type;
    :cond_b6
    instance-of v6, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v6, :cond_c2

    .line 108
    check-cast p0, Ljava/lang/reflect/WildcardType;

    .end local p0    # "lhsType":Ljava/lang/reflect/Type;
    invoke-static {p0, p1}, Lorg/springframework/util/TypeUtils;->isAssignable(Ljava/lang/reflect/WildcardType;Ljava/lang/reflect/Type;)Z

    move-result v6

    goto/16 :goto_19

    .line 111
    .restart local p0    # "lhsType":Ljava/lang/reflect/Type;
    :cond_c2
    const/4 v6, 0x0

    goto/16 :goto_19
.end method

.method private static isAssignable(Ljava/lang/reflect/WildcardType;Ljava/lang/reflect/Type;)Z
    .registers 18
    .param p0, "lhsType"    # Ljava/lang/reflect/WildcardType;
    .param p1, "rhsType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 140
    invoke-interface/range {p0 .. p0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v7

    .line 143
    .local v7, "lUpperBounds":[Ljava/lang/reflect/Type;
    array-length v14, v7

    if-nez v14, :cond_f

    .line 144
    const/4 v14, 0x1

    new-array v7, v14, [Ljava/lang/reflect/Type;

    .end local v7    # "lUpperBounds":[Ljava/lang/reflect/Type;
    const/4 v14, 0x0

    const-class v15, Ljava/lang/Object;

    aput-object v15, v7, v14

    .line 147
    .restart local v7    # "lUpperBounds":[Ljava/lang/reflect/Type;
    :cond_f
    invoke-interface/range {p0 .. p0}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v6

    .line 150
    .local v6, "lLowerBounds":[Ljava/lang/reflect/Type;
    array-length v14, v6

    if-nez v14, :cond_1d

    .line 151
    const/4 v14, 0x1

    new-array v6, v14, [Ljava/lang/reflect/Type;

    .end local v6    # "lLowerBounds":[Ljava/lang/reflect/Type;
    const/4 v14, 0x0

    const/4 v15, 0x0

    aput-object v15, v6, v14

    .line 154
    .restart local v6    # "lLowerBounds":[Ljava/lang/reflect/Type;
    :cond_1d
    move-object/from16 v0, p1

    instance-of v14, v0, Ljava/lang/reflect/WildcardType;

    if-eqz v14, :cond_a4

    move-object/from16 v13, p1

    .line 158
    check-cast v13, Ljava/lang/reflect/WildcardType;

    .line 159
    .local v13, "rhsWcType":Ljava/lang/reflect/WildcardType;
    invoke-interface {v13}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v12

    .line 161
    .local v12, "rUpperBounds":[Ljava/lang/reflect/Type;
    array-length v14, v12

    if-nez v14, :cond_36

    .line 162
    const/4 v14, 0x1

    new-array v12, v14, [Ljava/lang/reflect/Type;

    .end local v12    # "rUpperBounds":[Ljava/lang/reflect/Type;
    const/4 v14, 0x0

    const-class v15, Ljava/lang/Object;

    aput-object v15, v12, v14

    .line 165
    .restart local v12    # "rUpperBounds":[Ljava/lang/reflect/Type;
    :cond_36
    invoke-interface {v13}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v11

    .line 167
    .local v11, "rLowerBounds":[Ljava/lang/reflect/Type;
    array-length v14, v11

    if-nez v14, :cond_44

    .line 168
    const/4 v14, 0x1

    new-array v11, v14, [Ljava/lang/reflect/Type;

    .end local v11    # "rLowerBounds":[Ljava/lang/reflect/Type;
    const/4 v14, 0x0

    const/4 v15, 0x0

    aput-object v15, v11, v14

    .line 171
    .restart local v11    # "rLowerBounds":[Ljava/lang/reflect/Type;
    :cond_44
    move-object v1, v7

    .local v1, "arr$":[Ljava/lang/reflect/Type;
    array-length v8, v1

    .local v8, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    move v4, v3

    .end local v1    # "arr$":[Ljava/lang/reflect/Type;
    .end local v3    # "i$":I
    .end local v8    # "len$":I
    .local v4, "i$":I
    :goto_48
    if-ge v4, v8, :cond_74

    aget-object v5, v1, v4

    .line 172
    .local v5, "lBound":Ljava/lang/reflect/Type;
    move-object v2, v12

    .local v2, "arr$":[Ljava/lang/reflect/Type;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v3, 0x0

    .end local v4    # "i$":I
    .restart local v3    # "i$":I
    :goto_4f
    if-ge v3, v9, :cond_5e

    aget-object v10, v2, v3

    .line 173
    .local v10, "rBound":Ljava/lang/reflect/Type;
    invoke-static {v5, v10}, Lorg/springframework/util/TypeUtils;->isAssignableBound(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v14

    if-nez v14, :cond_5b

    .line 174
    const/4 v14, 0x0

    .line 213
    .end local v2    # "arr$":[Ljava/lang/reflect/Type;
    .end local v3    # "i$":I
    .end local v5    # "lBound":Ljava/lang/reflect/Type;
    .end local v9    # "len$":I
    .end local v10    # "rBound":Ljava/lang/reflect/Type;
    .end local v11    # "rLowerBounds":[Ljava/lang/reflect/Type;
    .end local v12    # "rUpperBounds":[Ljava/lang/reflect/Type;
    .end local v13    # "rhsWcType":Ljava/lang/reflect/WildcardType;
    :goto_5a
    return v14

    .line 172
    .restart local v2    # "arr$":[Ljava/lang/reflect/Type;
    .restart local v3    # "i$":I
    .restart local v5    # "lBound":Ljava/lang/reflect/Type;
    .restart local v9    # "len$":I
    .restart local v10    # "rBound":Ljava/lang/reflect/Type;
    .restart local v11    # "rLowerBounds":[Ljava/lang/reflect/Type;
    .restart local v12    # "rUpperBounds":[Ljava/lang/reflect/Type;
    .restart local v13    # "rhsWcType":Ljava/lang/reflect/WildcardType;
    :cond_5b
    add-int/lit8 v3, v3, 0x1

    goto :goto_4f

    .line 178
    .end local v10    # "rBound":Ljava/lang/reflect/Type;
    :cond_5e
    move-object v2, v11

    array-length v9, v2

    const/4 v3, 0x0

    :goto_61
    if-ge v3, v9, :cond_70

    aget-object v10, v2, v3

    .line 179
    .restart local v10    # "rBound":Ljava/lang/reflect/Type;
    invoke-static {v5, v10}, Lorg/springframework/util/TypeUtils;->isAssignableBound(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v14

    if-nez v14, :cond_6d

    .line 180
    const/4 v14, 0x0

    goto :goto_5a

    .line 178
    :cond_6d
    add-int/lit8 v3, v3, 0x1

    goto :goto_61

    .line 171
    .end local v10    # "rBound":Ljava/lang/reflect/Type;
    :cond_70
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    .end local v3    # "i$":I
    .restart local v4    # "i$":I
    goto :goto_48

    .line 185
    .end local v2    # "arr$":[Ljava/lang/reflect/Type;
    .end local v5    # "lBound":Ljava/lang/reflect/Type;
    .end local v9    # "len$":I
    :cond_74
    move-object v1, v6

    .restart local v1    # "arr$":[Ljava/lang/reflect/Type;
    array-length v8, v1

    .restart local v8    # "len$":I
    const/4 v3, 0x0

    .end local v4    # "i$":I
    .restart local v3    # "i$":I
    move v4, v3

    .end local v1    # "arr$":[Ljava/lang/reflect/Type;
    .end local v3    # "i$":I
    .end local v8    # "len$":I
    .restart local v4    # "i$":I
    :goto_78
    if-ge v4, v8, :cond_cc

    aget-object v5, v1, v4

    .line 186
    .restart local v5    # "lBound":Ljava/lang/reflect/Type;
    move-object v2, v12

    .restart local v2    # "arr$":[Ljava/lang/reflect/Type;
    array-length v9, v2

    .restart local v9    # "len$":I
    const/4 v3, 0x0

    .end local v4    # "i$":I
    .restart local v3    # "i$":I
    :goto_7f
    if-ge v3, v9, :cond_8e

    aget-object v10, v2, v3

    .line 187
    .restart local v10    # "rBound":Ljava/lang/reflect/Type;
    invoke-static {v10, v5}, Lorg/springframework/util/TypeUtils;->isAssignableBound(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v14

    if-nez v14, :cond_8b

    .line 188
    const/4 v14, 0x0

    goto :goto_5a

    .line 186
    :cond_8b
    add-int/lit8 v3, v3, 0x1

    goto :goto_7f

    .line 192
    .end local v10    # "rBound":Ljava/lang/reflect/Type;
    :cond_8e
    move-object v2, v11

    array-length v9, v2

    const/4 v3, 0x0

    :goto_91
    if-ge v3, v9, :cond_a0

    aget-object v10, v2, v3

    .line 193
    .restart local v10    # "rBound":Ljava/lang/reflect/Type;
    invoke-static {v10, v5}, Lorg/springframework/util/TypeUtils;->isAssignableBound(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v14

    if-nez v14, :cond_9d

    .line 194
    const/4 v14, 0x0

    goto :goto_5a

    .line 192
    :cond_9d
    add-int/lit8 v3, v3, 0x1

    goto :goto_91

    .line 185
    .end local v10    # "rBound":Ljava/lang/reflect/Type;
    :cond_a0
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    .end local v3    # "i$":I
    .restart local v4    # "i$":I
    goto :goto_78

    .line 200
    .end local v2    # "arr$":[Ljava/lang/reflect/Type;
    .end local v4    # "i$":I
    .end local v5    # "lBound":Ljava/lang/reflect/Type;
    .end local v9    # "len$":I
    .end local v11    # "rLowerBounds":[Ljava/lang/reflect/Type;
    .end local v12    # "rUpperBounds":[Ljava/lang/reflect/Type;
    .end local v13    # "rhsWcType":Ljava/lang/reflect/WildcardType;
    :cond_a4
    move-object v1, v7

    .restart local v1    # "arr$":[Ljava/lang/reflect/Type;
    array-length v8, v1

    .restart local v8    # "len$":I
    const/4 v3, 0x0

    .restart local v3    # "i$":I
    :goto_a7
    if-ge v3, v8, :cond_b8

    aget-object v5, v1, v3

    .line 201
    .restart local v5    # "lBound":Ljava/lang/reflect/Type;
    move-object/from16 v0, p1

    invoke-static {v5, v0}, Lorg/springframework/util/TypeUtils;->isAssignableBound(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v14

    if-nez v14, :cond_b5

    .line 202
    const/4 v14, 0x0

    goto :goto_5a

    .line 200
    :cond_b5
    add-int/lit8 v3, v3, 0x1

    goto :goto_a7

    .line 206
    .end local v5    # "lBound":Ljava/lang/reflect/Type;
    :cond_b8
    move-object v1, v6

    array-length v8, v1

    const/4 v3, 0x0

    :goto_bb
    if-ge v3, v8, :cond_cc

    aget-object v5, v1, v3

    .line 207
    .restart local v5    # "lBound":Ljava/lang/reflect/Type;
    move-object/from16 v0, p1

    invoke-static {v0, v5}, Lorg/springframework/util/TypeUtils;->isAssignableBound(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v14

    if-nez v14, :cond_c9

    .line 208
    const/4 v14, 0x0

    goto :goto_5a

    .line 206
    :cond_c9
    add-int/lit8 v3, v3, 0x1

    goto :goto_bb

    .line 213
    .end local v1    # "arr$":[Ljava/lang/reflect/Type;
    .end local v3    # "i$":I
    .end local v5    # "lBound":Ljava/lang/reflect/Type;
    .end local v8    # "len$":I
    :cond_cc
    const/4 v14, 0x1

    goto :goto_5a
.end method

.method public static isAssignableBound(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z
    .registers 3
    .param p0, "lhsType"    # Ljava/lang/reflect/Type;
    .param p1, "rhsType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 217
    if-nez p1, :cond_4

    .line 218
    const/4 v0, 0x1

    .line 224
    :goto_3
    return v0

    .line 221
    :cond_4
    if-nez p0, :cond_8

    .line 222
    const/4 v0, 0x0

    goto :goto_3

    .line 224
    :cond_8
    invoke-static {p0, p1}, Lorg/springframework/util/TypeUtils;->isAssignable(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v0

    goto :goto_3
.end method
