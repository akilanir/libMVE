.class Lfreemarker/ext/beans/SimpleMemberModel;
.super Ljava/lang/Object;
.source "SimpleMemberModel.java"


# instance fields
.field private final argTypes:[Ljava/lang/Class;

.field private final member:Ljava/lang/reflect/Member;


# direct methods
.method protected constructor <init>(Ljava/lang/reflect/Member;[Ljava/lang/Class;)V
    .registers 3
    .param p1, "member"    # Ljava/lang/reflect/Member;
    .param p2, "argTypes"    # [Ljava/lang/Class;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lfreemarker/ext/beans/SimpleMemberModel;->member:Ljava/lang/reflect/Member;

    .line 78
    iput-object p2, p0, Lfreemarker/ext/beans/SimpleMemberModel;->argTypes:[Ljava/lang/Class;

    .line 79
    return-void
.end method

.method private static createArgumentTypeMismarchException(ILfreemarker/template/TemplateModel;Ljava/lang/Class;)Lfreemarker/template/TemplateModelException;
    .registers 8
    .param p0, "argIdx"    # I
    .param p1, "argVal"    # Lfreemarker/template/TemplateModel;
    .param p2, "targetType"    # Ljava/lang/Class;

    .prologue
    .line 178
    new-instance v0, Lfreemarker/core/_TemplateModelException;

    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "Argument type mismatch; can\'t convert (unwrap) argument #"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/Integer;

    add-int/lit8 v4, p0, 0x1

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, " value of type "

    aput-object v3, v1, v2

    const/4 v2, 0x3

    new-instance v3, Lfreemarker/core/_DelayedFTLTypeDescription;

    invoke-direct {v3, p1}, Lfreemarker/core/_DelayedFTLTypeDescription;-><init>(Lfreemarker/template/TemplateModel;)V

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, " to "

    aput-object v3, v1, v2

    const/4 v2, 0x5

    invoke-static {p2}, Lfreemarker/template/utility/ClassUtil;->getShortClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    const-string v3, "."

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method private static createNullToPrimitiveArgumentException(ILjava/lang/Class;)Lfreemarker/template/TemplateModelException;
    .registers 7
    .param p0, "argIdx"    # I
    .param p1, "targetType"    # Ljava/lang/Class;

    .prologue
    .line 185
    new-instance v0, Lfreemarker/core/_TemplateModelException;

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "Argument type mismatch; argument #"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/Integer;

    add-int/lit8 v4, p0, 0x1

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, " is null, which can\'t be converted to primitive type "

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    const-string v3, "."

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method

.method static unwrapArguments(Ljava/util/List;[Ljava/lang/Class;ZLfreemarker/ext/beans/BeansWrapper;)[Ljava/lang/Object;
    .registers 26
    .param p0, "args"    # Ljava/util/List;
    .param p1, "argTypes"    # [Ljava/lang/Class;
    .param p2, "isVarargs"    # Z
    .param p3, "w"    # Lfreemarker/ext/beans/BeansWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 108
    if-nez p0, :cond_4

    const/4 v12, 0x0

    .line 173
    :goto_3
    return-object v12

    .line 110
    :cond_4
    move-object/from16 v0, p1

    array-length v10, v0

    .line 111
    .local v10, "typesLen":I
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->size()I

    move-result v7

    .line 113
    .local v7, "argsLen":I
    new-array v12, v10, [Ljava/lang/Object;

    .line 116
    .local v12, "unwrappedArgs":[Ljava/lang/Object;
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 117
    .local v8, "it":Ljava/util/Iterator;
    if-eqz p2, :cond_32

    add-int/lit8 v9, v10, -0x1

    .line 118
    .local v9, "normalArgCnt":I
    :goto_15
    const/4 v3, 0x0

    .local v3, "argIdx":I
    move v4, v3

    .line 119
    .end local v3    # "argIdx":I
    .local v4, "argIdx":I
    :goto_17
    if-ge v4, v9, :cond_47

    .line 120
    aget-object v5, p1, v4

    .line 121
    .local v5, "argType":Ljava/lang/Class;
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    .line 122
    .local v6, "argVal":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v5}, Lfreemarker/ext/beans/BeansWrapper;->unwrapInternal(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v11

    .line 123
    .local v11, "unwrappedArgVal":Ljava/lang/Object;
    sget-object v20, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    move-object/from16 v0, v20

    if-ne v11, v0, :cond_34

    .line 124
    invoke-static {v4, v6, v5}, Lfreemarker/ext/beans/SimpleMemberModel;->createArgumentTypeMismarchException(ILfreemarker/template/TemplateModel;Ljava/lang/Class;)Lfreemarker/template/TemplateModelException;

    move-result-object v20

    throw v20

    .end local v4    # "argIdx":I
    .end local v5    # "argType":Ljava/lang/Class;
    .end local v6    # "argVal":Lfreemarker/template/TemplateModel;
    .end local v9    # "normalArgCnt":I
    .end local v11    # "unwrappedArgVal":Ljava/lang/Object;
    :cond_32
    move v9, v10

    .line 117
    goto :goto_15

    .line 126
    .restart local v4    # "argIdx":I
    .restart local v5    # "argType":Ljava/lang/Class;
    .restart local v6    # "argVal":Lfreemarker/template/TemplateModel;
    .restart local v9    # "normalArgCnt":I
    .restart local v11    # "unwrappedArgVal":Ljava/lang/Object;
    :cond_34
    if-nez v11, :cond_41

    invoke-virtual {v5}, Ljava/lang/Class;->isPrimitive()Z

    move-result v20

    if-eqz v20, :cond_41

    .line 127
    invoke-static {v4, v5}, Lfreemarker/ext/beans/SimpleMemberModel;->createNullToPrimitiveArgumentException(ILjava/lang/Class;)Lfreemarker/template/TemplateModelException;

    move-result-object v20

    throw v20

    .line 130
    :cond_41
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "argIdx":I
    .restart local v3    # "argIdx":I
    aput-object v11, v12, v4

    move v4, v3

    .line 131
    .end local v3    # "argIdx":I
    .restart local v4    # "argIdx":I
    goto :goto_17

    .line 132
    .end local v5    # "argType":Ljava/lang/Class;
    .end local v6    # "argVal":Lfreemarker/template/TemplateModel;
    .end local v11    # "unwrappedArgVal":Ljava/lang/Object;
    :cond_47
    if-eqz p2, :cond_e5

    .line 135
    add-int/lit8 v20, v10, -0x1

    aget-object v18, p1, v20

    .line 136
    .local v18, "varargType":Ljava/lang/Class;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v17

    .line 137
    .local v17, "varargItemType":Ljava/lang/Class;
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-nez v20, :cond_66

    .line 138
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "argIdx":I
    .restart local v3    # "argIdx":I
    const/16 v20, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v20

    aput-object v20, v12, v4

    goto :goto_3

    .line 140
    .end local v3    # "argIdx":I
    .restart local v4    # "argIdx":I
    :cond_66
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/template/TemplateModel;

    .line 145
    .restart local v6    # "argVal":Lfreemarker/template/TemplateModel;
    sub-int v20, v7, v4

    const/16 v21, 0x1

    move/from16 v0, v20

    move/from16 v1, v21

    if-ne v0, v1, :cond_8a

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-virtual {v0, v6, v1}, Lfreemarker/ext/beans/BeansWrapper;->unwrapInternal(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v11

    .restart local v11    # "unwrappedArgVal":Ljava/lang/Object;
    sget-object v20, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    move-object/from16 v0, v20

    if-eq v11, v0, :cond_8a

    .line 149
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "argIdx":I
    .restart local v3    # "argIdx":I
    aput-object v11, v12, v4

    goto/16 :goto_3

    .line 153
    .end local v3    # "argIdx":I
    .end local v11    # "unwrappedArgVal":Ljava/lang/Object;
    .restart local v4    # "argIdx":I
    :cond_8a
    sub-int v15, v7, v4

    .line 154
    .local v15, "varargArrayLen":I
    move-object/from16 v0, v17

    invoke-static {v0, v15}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v14

    .line 155
    .local v14, "varargArray":Ljava/lang/Object;
    const/16 v16, 0x0

    .local v16, "varargIdx":I
    :goto_94
    move/from16 v0, v16

    if-ge v0, v15, :cond_df

    .line 156
    if-nez v16, :cond_bf

    move-object/from16 v20, v6

    :goto_9c
    check-cast v20, Lfreemarker/template/TemplateModel;

    move-object/from16 v19, v20

    check-cast v19, Lfreemarker/template/TemplateModel;

    .line 157
    .local v19, "varargVal":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p3

    move-object/from16 v1, v19

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lfreemarker/ext/beans/BeansWrapper;->unwrapInternal(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v13

    .line 158
    .local v13, "unwrappedVarargVal":Ljava/lang/Object;
    sget-object v20, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    move-object/from16 v0, v20

    if-ne v13, v0, :cond_c4

    .line 159
    add-int v20, v4, v16

    move/from16 v0, v20

    move-object/from16 v1, v19

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2}, Lfreemarker/ext/beans/SimpleMemberModel;->createArgumentTypeMismarchException(ILfreemarker/template/TemplateModel;Ljava/lang/Class;)Lfreemarker/template/TemplateModelException;

    move-result-object v20

    throw v20

    .line 156
    .end local v13    # "unwrappedVarargVal":Ljava/lang/Object;
    .end local v19    # "varargVal":Lfreemarker/template/TemplateModel;
    :cond_bf
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    goto :goto_9c

    .line 163
    .restart local v13    # "unwrappedVarargVal":Ljava/lang/Object;
    .restart local v19    # "varargVal":Lfreemarker/template/TemplateModel;
    :cond_c4
    if-nez v13, :cond_d7

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Class;->isPrimitive()Z

    move-result v20

    if-eqz v20, :cond_d7

    .line 164
    add-int v20, v4, v16

    move/from16 v0, v20

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lfreemarker/ext/beans/SimpleMemberModel;->createNullToPrimitiveArgumentException(ILjava/lang/Class;)Lfreemarker/template/TemplateModelException;

    move-result-object v20

    throw v20

    .line 166
    :cond_d7
    move/from16 v0, v16

    invoke-static {v14, v0, v13}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 155
    add-int/lit8 v16, v16, 0x1

    goto :goto_94

    .line 168
    .end local v13    # "unwrappedVarargVal":Ljava/lang/Object;
    .end local v19    # "varargVal":Lfreemarker/template/TemplateModel;
    :cond_df
    add-int/lit8 v3, v4, 0x1

    .end local v4    # "argIdx":I
    .restart local v3    # "argIdx":I
    aput-object v14, v12, v4

    goto/16 :goto_3

    .end local v3    # "argIdx":I
    .end local v6    # "argVal":Lfreemarker/template/TemplateModel;
    .end local v14    # "varargArray":Ljava/lang/Object;
    .end local v15    # "varargArrayLen":I
    .end local v16    # "varargIdx":I
    .end local v17    # "varargItemType":Ljava/lang/Class;
    .end local v18    # "varargType":Ljava/lang/Class;
    .restart local v4    # "argIdx":I
    :cond_e5
    move v3, v4

    .end local v4    # "argIdx":I
    .restart local v3    # "argIdx":I
    goto/16 :goto_3
.end method


# virtual methods
.method protected getMember()Ljava/lang/reflect/Member;
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lfreemarker/ext/beans/SimpleMemberModel;->member:Ljava/lang/reflect/Member;

    return-object v0
.end method

.method unwrapArguments(Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)[Ljava/lang/Object;
    .registers 9
    .param p1, "arguments"    # Ljava/util/List;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 83
    if-nez p1, :cond_4

    .line 84
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 86
    :cond_4
    iget-object v3, p0, Lfreemarker/ext/beans/SimpleMemberModel;->member:Ljava/lang/reflect/Member;

    invoke-static {v3}, Lfreemarker/ext/beans/MethodUtilities;->isVarArgs(Ljava/lang/reflect/Member;)Z

    move-result v1

    .line 87
    .local v1, "isVarArg":Z
    iget-object v3, p0, Lfreemarker/ext/beans/SimpleMemberModel;->argTypes:[Ljava/lang/Class;

    array-length v2, v3

    .line 88
    .local v2, "typesLen":I
    if-eqz v1, :cond_52

    .line 89
    add-int/lit8 v3, v2, -0x1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-le v3, v4, :cond_91

    .line 90
    new-instance v3, Lfreemarker/template/TemplateModelException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Method "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lfreemarker/ext/beans/SimpleMemberModel;->member:Ljava/lang/reflect/Member;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " takes at least "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    add-int/lit8 v5, v2, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " arguments, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " was given."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 95
    :cond_52
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-eq v2, v3, :cond_91

    .line 96
    new-instance v3, Lfreemarker/template/TemplateModelException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Method "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lfreemarker/ext/beans/SimpleMemberModel;->member:Ljava/lang/reflect/Member;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " takes exactly "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " arguments, "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " was given."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 101
    :cond_91
    iget-object v3, p0, Lfreemarker/ext/beans/SimpleMemberModel;->argTypes:[Ljava/lang/Class;

    invoke-static {p1, v3, v1, p2}, Lfreemarker/ext/beans/SimpleMemberModel;->unwrapArguments(Ljava/util/List;[Ljava/lang/Class;ZLfreemarker/ext/beans/BeansWrapper;)[Ljava/lang/Object;

    move-result-object v0

    .line 102
    .local v0, "args":[Ljava/lang/Object;
    return-object v0
.end method
