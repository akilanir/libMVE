.class Lcom/nineoldandroids/util/ReflectiveProperty;
.super Lcom/nineoldandroids/util/Property;
.source "ReflectiveProperty.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/nineoldandroids/util/Property",
        "<TT;TV;>;"
    }
.end annotation


# static fields
.field private static final PREFIX_GET:Ljava/lang/String; = "get"

.field private static final PREFIX_IS:Ljava/lang/String; = "is"

.field private static final PREFIX_SET:Ljava/lang/String; = "set"


# instance fields
.field private mField:Ljava/lang/reflect/Field;

.field private mGetter:Ljava/lang/reflect/Method;

.field private mSetter:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)V
    .registers 22
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Class",
            "<TV;>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lcom/nineoldandroids/util/ReflectiveProperty;, "Lcom/nineoldandroids/util/ReflectiveProperty<TT;TV;>;"
    .local p1, "propertyHolder":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "valueType":Ljava/lang/Class;, "Ljava/lang/Class<TV;>;"
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/nineoldandroids/util/Property;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 48
    const/4 v15, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljava/lang/String;->charAt(I)C

    move-result v15

    invoke-static {v15}, Ljava/lang/Character;->toUpperCase(C)C

    move-result v10

    .line 49
    .local v10, "firstLetter":C
    const/4 v15, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v15}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    .line 50
    .local v14, "theRest":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 51
    .local v3, "capitalizedName":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "get"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 53
    .local v11, "getterName":Ljava/lang/String;
    const/4 v15, 0x0

    :try_start_40
    check-cast v15, [Ljava/lang/Class;

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mGetter:Ljava/lang/reflect/Method;
    :try_end_4c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_40 .. :try_end_4c} :catch_93

    .line 92
    :goto_4c
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mGetter:Ljava/lang/reflect/Method;

    invoke-virtual {v15}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v12

    .line 94
    .local v12, "getterType":Ljava/lang/Class;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v12}, Lcom/nineoldandroids/util/ReflectiveProperty;->typesMatch(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v15

    if-nez v15, :cond_158

    .line 95
    new-instance v15, Lcom/nineoldandroids/util/NoSuchPropertyException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Underlying type ("

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ") "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "does not match Property type ("

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ")"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lcom/nineoldandroids/util/NoSuchPropertyException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 54
    .end local v12    # "getterType":Ljava/lang/Class;
    :catch_93
    move-exception v4

    .line 59
    .local v4, "e":Ljava/lang/NoSuchMethodException;
    const/4 v15, 0x0

    :try_start_95
    check-cast v15, [Ljava/lang/Class;

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mGetter:Ljava/lang/reflect/Method;

    .line 60
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mGetter:Ljava/lang/reflect/Method;

    const/16 v16, 0x1

    invoke-virtual/range {v15 .. v16}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_aa
    .catch Ljava/lang/NoSuchMethodException; {:try_start_95 .. :try_end_aa} :catch_ab

    goto :goto_4c

    .line 61
    :catch_ab
    move-exception v5

    .line 63
    .local v5, "e2":Ljava/lang/NoSuchMethodException;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "is"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 65
    const/4 v15, 0x0

    :try_start_c0
    check-cast v15, [Ljava/lang/Class;

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mGetter:Ljava/lang/reflect/Method;
    :try_end_cc
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c0 .. :try_end_cc} :catch_cd

    goto :goto_4c

    .line 66
    :catch_cd
    move-exception v6

    .line 71
    .local v6, "e3":Ljava/lang/NoSuchMethodException;
    const/4 v15, 0x0

    :try_start_cf
    check-cast v15, [Ljava/lang/Class;

    move-object/from16 v0, p1

    invoke-virtual {v0, v11, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mGetter:Ljava/lang/reflect/Method;

    .line 72
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mGetter:Ljava/lang/reflect/Method;

    const/16 v16, 0x1

    invoke-virtual/range {v15 .. v16}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_e4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_cf .. :try_end_e4} :catch_e6

    goto/16 :goto_4c

    .line 73
    :catch_e6
    move-exception v7

    .line 76
    .local v7, "e4":Ljava/lang/NoSuchMethodException;
    :try_start_e7
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mField:Ljava/lang/reflect/Field;

    .line 77
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mField:Ljava/lang/reflect/Field;

    invoke-virtual {v15}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v9

    .line 78
    .local v9, "fieldType":Ljava/lang/Class;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v9}, Lcom/nineoldandroids/util/ReflectiveProperty;->typesMatch(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v15

    if-nez v15, :cond_185

    .line 79
    new-instance v15, Lcom/nineoldandroids/util/NoSuchPropertyException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Underlying type ("

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ") "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "does not match Property type ("

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, ")"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lcom/nineoldandroids/util/NoSuchPropertyException;-><init>(Ljava/lang/String;)V

    throw v15
    :try_end_13a
    .catch Ljava/lang/NoSuchFieldException; {:try_start_e7 .. :try_end_13a} :catch_13a

    .line 83
    .end local v9    # "fieldType":Ljava/lang/Class;
    :catch_13a
    move-exception v8

    .line 85
    .local v8, "e5":Ljava/lang/NoSuchFieldException;
    new-instance v15, Lcom/nineoldandroids/util/NoSuchPropertyException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "No accessor method or field found for property with name "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lcom/nineoldandroids/util/NoSuchPropertyException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 98
    .end local v4    # "e":Ljava/lang/NoSuchMethodException;
    .end local v5    # "e2":Ljava/lang/NoSuchMethodException;
    .end local v6    # "e3":Ljava/lang/NoSuchMethodException;
    .end local v7    # "e4":Ljava/lang/NoSuchMethodException;
    .end local v8    # "e5":Ljava/lang/NoSuchFieldException;
    .restart local v12    # "getterType":Ljava/lang/Class;
    :cond_158
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "set"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 102
    .local v13, "setterName":Ljava/lang/String;
    const/4 v15, 0x1

    :try_start_16c
    new-array v15, v15, [Ljava/lang/Class;

    const/16 v16, 0x0

    aput-object v12, v15, v16

    move-object/from16 v0, p1

    invoke-virtual {v0, v13, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mSetter:Ljava/lang/reflect/Method;

    .line 103
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/nineoldandroids/util/ReflectiveProperty;->mSetter:Ljava/lang/reflect/Method;

    const/16 v16, 0x1

    invoke-virtual/range {v15 .. v16}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_185
    .catch Ljava/lang/NoSuchMethodException; {:try_start_16c .. :try_end_185} :catch_186

    .line 107
    .end local v12    # "getterType":Ljava/lang/Class;
    .end local v13    # "setterName":Ljava/lang/String;
    :cond_185
    :goto_185
    return-void

    .line 104
    .restart local v12    # "getterType":Ljava/lang/Class;
    .restart local v13    # "setterName":Ljava/lang/String;
    :catch_186
    move-exception v15

    goto :goto_185
.end method

.method private typesMatch(Ljava/lang/Class;Ljava/lang/Class;)Z
    .registers 6
    .param p2, "getterType"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TV;>;",
            "Ljava/lang/Class;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/nineoldandroids/util/ReflectiveProperty;, "Lcom/nineoldandroids/util/ReflectiveProperty<TT;TV;>;"
    .local p1, "valueType":Ljava/lang/Class;, "Ljava/lang/Class<TV;>;"
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 117
    if-eq p2, p1, :cond_4c

    .line 118
    invoke-virtual {p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-eqz v2, :cond_4b

    .line 119
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_12

    const-class v2, Ljava/lang/Float;

    if-eq p1, v2, :cond_4a

    :cond_12
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_1a

    const-class v2, Ljava/lang/Integer;

    if-eq p1, v2, :cond_4a

    :cond_1a
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_22

    const-class v2, Ljava/lang/Boolean;

    if-eq p1, v2, :cond_4a

    :cond_22
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_2a

    const-class v2, Ljava/lang/Long;

    if-eq p1, v2, :cond_4a

    :cond_2a
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_32

    const-class v2, Ljava/lang/Double;

    if-eq p1, v2, :cond_4a

    :cond_32
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_3a

    const-class v2, Ljava/lang/Short;

    if-eq p1, v2, :cond_4a

    :cond_3a
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_42

    const-class v2, Ljava/lang/Byte;

    if-eq p1, v2, :cond_4a

    :cond_42
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p2, v2, :cond_4b

    const-class v2, Ljava/lang/Character;

    if-ne p1, v2, :cond_4b

    :cond_4a
    move v0, v1

    .line 130
    :cond_4b
    :goto_4b
    return v0

    :cond_4c
    move v0, v1

    goto :goto_4b
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TV;"
        }
    .end annotation

    .prologue
    .line 156
    .local p0, "this":Lcom/nineoldandroids/util/ReflectiveProperty;, "Lcom/nineoldandroids/util/ReflectiveProperty<TT;TV;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mGetter:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_20

    .line 158
    :try_start_4
    iget-object v2, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mGetter:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    check-cast v1, [Ljava/lang/Object;

    invoke-virtual {v2, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_c} :catch_e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_c} :catch_15

    move-result-object v1

    .line 166
    :goto_d
    return-object v1

    .line 159
    :catch_e
    move-exception v0

    .line 160
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 161
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_15
    move-exception v0

    .line 162
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 164
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_20
    iget-object v1, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mField:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_32

    .line 166
    :try_start_24
    iget-object v1, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mField:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_29
    .catch Ljava/lang/IllegalAccessException; {:try_start_24 .. :try_end_29} :catch_2b

    move-result-object v1

    goto :goto_d

    .line 167
    :catch_2b
    move-exception v0

    .line 168
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 172
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :cond_32
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
.end method

.method public isReadOnly()Z
    .registers 2

    .prologue
    .line 180
    .local p0, "this":Lcom/nineoldandroids/util/ReflectiveProperty;, "Lcom/nineoldandroids/util/ReflectiveProperty<TT;TV;>;"
    iget-object v0, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mSetter:Ljava/lang/reflect/Method;

    if-nez v0, :cond_a

    iget-object v0, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mField:Ljava/lang/reflect/Field;

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TV;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p0, "this":Lcom/nineoldandroids/util/ReflectiveProperty;, "Lcom/nineoldandroids/util/ReflectiveProperty<TT;TV;>;"
    .local p1, "object":Ljava/lang/Object;, "TT;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mSetter:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_22

    .line 137
    :try_start_4
    iget-object v1, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mSetter:Ljava/lang/reflect/Method;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v1, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_f} :catch_10
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_f} :catch_17

    .line 152
    :goto_f
    return-void

    .line 138
    :catch_10
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 140
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_17
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 143
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :cond_22
    iget-object v1, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mField:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_33

    .line 145
    :try_start_26
    iget-object v1, p0, Lcom/nineoldandroids/util/ReflectiveProperty;->mField:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_2b
    .catch Ljava/lang/IllegalAccessException; {:try_start_26 .. :try_end_2b} :catch_2c

    goto :goto_f

    .line 146
    :catch_2c
    move-exception v0

    .line 147
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 150
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :cond_33
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Property "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/nineoldandroids/util/ReflectiveProperty;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is read-only"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
