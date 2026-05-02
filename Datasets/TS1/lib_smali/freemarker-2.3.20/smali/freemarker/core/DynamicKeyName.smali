.class final Lfreemarker/core/DynamicKeyName;
.super Lfreemarker/core/Expression;
.source "DynamicKeyName.java"


# instance fields
.field private final nameExpression:Lfreemarker/core/Expression;

.field private final target:Lfreemarker/core/Expression;


# direct methods
.method constructor <init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V
    .registers 3
    .param p1, "target"    # Lfreemarker/core/Expression;
    .param p2, "nameExpression"    # Lfreemarker/core/Expression;

    .prologue
    .line 75
    invoke-direct {p0}, Lfreemarker/core/Expression;-><init>()V

    .line 76
    iput-object p1, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    .line 77
    iput-object p2, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    .line 78
    return-void
.end method

.method private dealWithNumericalKey(Lfreemarker/template/TemplateModel;ILfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 12
    .param p1, "targetModel"    # Lfreemarker/template/TemplateModel;
    .param p2, "index"    # I
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 119
    instance-of v5, p1, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v5, :cond_19

    move-object v4, p1

    .line 120
    check-cast v4, Lfreemarker/template/TemplateSequenceModel;

    .line 123
    .local v4, "tsm":Lfreemarker/template/TemplateSequenceModel;
    :try_start_7
    invoke-interface {v4}, Lfreemarker/template/TemplateSequenceModel;->size()I
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_a} :catch_12

    move-result v3

    .line 127
    .local v3, "size":I
    :goto_b
    if-ge p2, v3, :cond_17

    invoke-interface {v4, p2}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v5

    .line 134
    .end local v3    # "size":I
    .end local v4    # "tsm":Lfreemarker/template/TemplateSequenceModel;
    :goto_11
    return-object v5

    .line 124
    .restart local v4    # "tsm":Lfreemarker/template/TemplateSequenceModel;
    :catch_12
    move-exception v0

    .line 125
    .local v0, "e":Ljava/lang/Exception;
    const v3, 0x7fffffff

    .restart local v3    # "size":I
    goto :goto_b

    .line 127
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_17
    const/4 v5, 0x0

    goto :goto_11

    .line 132
    .end local v3    # "size":I
    .end local v4    # "tsm":Lfreemarker/template/TemplateSequenceModel;
    :cond_19
    :try_start_19
    iget-object v5, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    invoke-virtual {v5, p3}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;
    :try_end_1e
    .catch Lfreemarker/core/NonStringException; {:try_start_19 .. :try_end_1e} :catch_32

    move-result-object v2

    .line 134
    .local v2, "s":Ljava/lang/String;
    :try_start_1f
    new-instance v5, Lfreemarker/template/SimpleScalar;

    add-int/lit8 v6, p2, 0x1

    invoke-virtual {v2, p2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V
    :try_end_2a
    .catch Ljava/lang/RuntimeException; {:try_start_1f .. :try_end_2a} :catch_2b
    .catch Lfreemarker/core/NonStringException; {:try_start_1f .. :try_end_2a} :catch_32

    goto :goto_11

    .line 135
    :catch_2b
    move-exception v1

    .line 136
    .local v1, "re":Ljava/lang/RuntimeException;
    :try_start_2c
    new-instance v5, Lfreemarker/core/_MiscTemplateException;

    invoke-direct {v5, v1, p3}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    throw v5
    :try_end_32
    .catch Lfreemarker/core/NonStringException; {:try_start_2c .. :try_end_32} :catch_32

    .line 139
    .end local v1    # "re":Ljava/lang/RuntimeException;
    .end local v2    # "s":Ljava/lang/String;
    :catch_32
    move-exception v0

    .line 141
    .local v0, "e":Lfreemarker/core/NonStringException;
    new-instance v5, Lfreemarker/core/UnexpectedTypeException;

    iget-object v6, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    const-string v7, "sequence or string (or something that\'s implicitly convertible to string)"

    invoke-direct {v5, v6, p1, v7, p3}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v5
.end method

.method private dealWithRangeKey(Lfreemarker/template/TemplateModel;Lfreemarker/core/Range;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 20
    .param p1, "targetModel"    # Lfreemarker/template/TemplateModel;
    .param p2, "range"    # Lfreemarker/core/Range;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 161
    move-object/from16 v0, p2

    iget-object v10, v0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Lfreemarker/core/Expression;->evalToNumber(Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Number;->intValue()I

    move-result v8

    .line 162
    .local v8, "start":I
    const/4 v2, 0x0

    .line 163
    .local v2, "end":I
    invoke-virtual/range {p2 .. p2}, Lfreemarker/core/Range;->hasRho()Z

    move-result v3

    .line 164
    .local v3, "hasRhs":Z
    if-eqz v3, :cond_23

    .line 165
    move-object/from16 v0, p2

    iget-object v10, v0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Lfreemarker/core/Expression;->evalToNumber(Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 167
    :cond_23
    move-object/from16 v0, p1

    instance-of v10, v0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v10, :cond_11c

    move-object/from16 v7, p1

    .line 168
    check-cast v7, Lfreemarker/template/TemplateSequenceModel;

    .line 169
    .local v7, "sequence":Lfreemarker/template/TemplateSequenceModel;
    if-nez v3, :cond_35

    invoke-interface {v7}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v10

    add-int/lit8 v2, v10, -0x1

    .line 170
    :cond_35
    if-gez v8, :cond_56

    .line 171
    new-instance v10, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, p2

    iget-object v11, v0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Negative starting index "

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/Integer;

    invoke-direct {v14, v8}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-string v14, " for slicing range."

    aput-object v14, v12, v13

    invoke-direct {v10, v11, v12}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v10

    .line 174
    :cond_56
    if-gez v2, :cond_77

    .line 175
    new-instance v10, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, p2

    iget-object v11, v0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Negative ending index "

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/Integer;

    invoke-direct {v14, v2}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-string v14, " for slicing range."

    aput-object v14, v12, v13

    invoke-direct {v10, v11, v12}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v10

    .line 178
    :cond_77
    invoke-interface {v7}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v10

    if-lt v8, v10, :cond_b2

    .line 179
    new-instance v10, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, p2

    iget-object v11, v0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    const/4 v12, 0x6

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Left side index of range out of bounds, is "

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/Integer;

    invoke-direct {v14, v8}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-string v14, ", but the sequence has only "

    aput-object v14, v12, v13

    const/4 v13, 0x3

    new-instance v14, Ljava/lang/Integer;

    invoke-interface {v7}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v15

    invoke-direct {v14, v15}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x4

    const-string v14, " element(s). "

    aput-object v14, v12, v13

    const/4 v13, 0x5

    const-string v14, "(Note that indices are 0 based, and ranges are inclusive)."

    aput-object v14, v12, v13

    invoke-direct {v10, v11, v12}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v10

    .line 184
    :cond_b2
    invoke-interface {v7}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v10

    if-lt v2, v10, :cond_ed

    .line 185
    new-instance v10, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, p2

    iget-object v11, v0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    const/4 v12, 0x6

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Right side index of range out of bounds, is "

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/Integer;

    invoke-direct {v14, v2}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-string v14, ", but the sequence has only "

    aput-object v14, v12, v13

    const/4 v13, 0x3

    new-instance v14, Ljava/lang/Integer;

    invoke-interface {v7}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v15

    invoke-direct {v14, v15}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x4

    const-string v14, " element(s). "

    aput-object v14, v12, v13

    const/4 v13, 0x5

    const-string v14, "(Note that indices are 0 based, and ranges are inclusive)."

    aput-object v14, v12, v13

    invoke-direct {v10, v11, v12}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v10

    .line 190
    :cond_ed
    new-instance v5, Ljava/util/ArrayList;

    sub-int v10, v8, v2

    invoke-static {v10}, Ljava/lang/Math;->abs(I)I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    invoke-direct {v5, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 191
    .local v5, "list":Ljava/util/ArrayList;
    if-le v8, v2, :cond_109

    .line 192
    move v4, v8

    .local v4, "i":I
    :goto_fd
    if-lt v4, v2, :cond_116

    .line 193
    invoke-interface {v7, v4}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    add-int/lit8 v4, v4, -0x1

    goto :goto_fd

    .line 197
    .end local v4    # "i":I
    :cond_109
    move v4, v8

    .restart local v4    # "i":I
    :goto_10a
    if-gt v4, v2, :cond_116

    .line 198
    invoke-interface {v7, v4}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    add-int/lit8 v4, v4, 0x1

    goto :goto_10a

    .line 201
    :cond_116
    new-instance v10, Lfreemarker/template/SimpleSequence;

    invoke-direct {v10, v5}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;)V

    .line 232
    .end local v4    # "i":I
    .end local v5    # "list":Ljava/util/ArrayList;
    .end local v7    # "sequence":Lfreemarker/template/TemplateSequenceModel;
    :goto_11b
    return-object v10

    .line 206
    :cond_11c
    :try_start_11c
    move-object/from16 v0, p0

    iget-object v10, v0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;
    :try_end_125
    .catch Lfreemarker/core/NonStringException; {:try_start_11c .. :try_end_125} :catch_14f

    move-result-object v9

    .line 212
    .local v9, "targetStr":Ljava/lang/String;
    if-nez v3, :cond_12e

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    add-int/lit8 v2, v10, -0x1

    .line 213
    :cond_12e
    if-gez v8, :cond_168

    .line 214
    new-instance v10, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, p2

    iget-object v11, v0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Negative starting index "

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/Integer;

    invoke-direct {v14, v8}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-string v14, " for slicing range."

    aput-object v14, v12, v13

    invoke-direct {v10, v11, v12}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v10

    .line 207
    .end local v9    # "targetStr":Ljava/lang/String;
    :catch_14f
    move-exception v1

    .line 208
    .local v1, "e":Lfreemarker/core/NonStringException;
    new-instance v10, Lfreemarker/core/UnexpectedTypeException;

    move-object/from16 v0, p0

    iget-object v11, v0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    move-object/from16 v0, p0

    iget-object v12, v0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    move-object/from16 v0, p3

    invoke-virtual {v12, v0}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v12

    const-string v13, "string or something automatically convertible to string (number, date or boolean) or sequence"

    move-object/from16 v0, p3

    invoke-direct {v10, v11, v12, v13, v0}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v10

    .line 217
    .end local v1    # "e":Lfreemarker/core/NonStringException;
    .restart local v9    # "targetStr":Ljava/lang/String;
    :cond_168
    if-gez v2, :cond_189

    .line 218
    new-instance v10, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, p2

    iget-object v11, v0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Negative ending index "

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/Integer;

    invoke-direct {v14, v2}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-string v14, " for slicing range."

    aput-object v14, v12, v13

    invoke-direct {v10, v11, v12}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v10

    .line 221
    :cond_189
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    if-le v8, v10, :cond_1bf

    .line 222
    new-instance v10, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, p2

    iget-object v11, v0, Lfreemarker/core/Range;->lho:Lfreemarker/core/Expression;

    const/4 v12, 0x5

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Left side of range out of bounds, is: "

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/Integer;

    invoke-direct {v14, v8}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-string v14, "\nbut the string has "

    aput-object v14, v12, v13

    const/4 v13, 0x3

    new-instance v14, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v15

    invoke-direct {v14, v15}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x4

    const-string v14, " elements."

    aput-object v14, v12, v13

    invoke-direct {v10, v11, v12}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v10

    .line 226
    :cond_1bf
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    if-lt v2, v10, :cond_1f5

    .line 227
    new-instance v10, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, p2

    iget-object v11, v0, Lfreemarker/core/Range;->rho:Lfreemarker/core/Expression;

    const/4 v12, 0x5

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    const-string v14, "Right side of range out of bounds, is: "

    aput-object v14, v12, v13

    const/4 v13, 0x1

    new-instance v14, Ljava/lang/Integer;

    invoke-direct {v14, v2}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-string v14, "\nbut the string is only "

    aput-object v14, v12, v13

    const/4 v13, 0x3

    new-instance v14, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v15

    invoke-direct {v14, v15}, Ljava/lang/Integer;-><init>(I)V

    aput-object v14, v12, v13

    const/4 v13, 0x4

    const-string v14, " characters long."

    aput-object v14, v12, v13

    invoke-direct {v10, v11, v12}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    throw v10

    .line 232
    :cond_1f5
    :try_start_1f5
    new-instance v10, Lfreemarker/template/SimpleScalar;

    add-int/lit8 v11, v2, 0x1

    invoke-virtual {v9, v8, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V
    :try_end_200
    .catch Ljava/lang/RuntimeException; {:try_start_1f5 .. :try_end_200} :catch_202

    goto/16 :goto_11b

    .line 233
    :catch_202
    move-exception v6

    .line 234
    .local v6, "re":Ljava/lang/RuntimeException;
    new-instance v10, Lfreemarker/core/_MiscTemplateException;

    const/4 v11, 0x2

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    const-string v13, "Unexpected exception: "

    aput-object v13, v11, v12

    const/4 v12, 0x1

    aput-object v6, v11, v12

    invoke-direct {v10, v6, v11}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v10
.end method

.method private dealWithStringKey(Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "targetModel"    # Lfreemarker/template/TemplateModel;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 150
    instance-of v0, p1, Lfreemarker/template/TemplateHashModel;

    if-eqz v0, :cond_b

    .line 151
    check-cast p1, Lfreemarker/template/TemplateHashModel;

    .end local p1    # "targetModel":Lfreemarker/template/TemplateModel;
    invoke-interface {p1, p2}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0

    .line 153
    .restart local p1    # "targetModel":Lfreemarker/template/TemplateModel;
    :cond_b
    new-instance v0, Lfreemarker/core/UnexpectedTypeException;

    iget-object v1, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    const-string v2, "hash"

    invoke-direct {v0, v1, p1, v2, p3}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v0
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 9
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 82
    iget-object v4, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    .line 83
    .local v3, "targetModel":Lfreemarker/template/TemplateModel;
    if-nez v3, :cond_17

    .line 84
    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v4

    if-eqz v4, :cond_10

    .line 85
    const/4 v4, 0x0

    .line 108
    :goto_f
    return-object v4

    .line 87
    :cond_10
    iget-object v4, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    invoke-static {v4, p1}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v4

    throw v4

    .line 90
    :cond_17
    iget-object v4, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    instance-of v4, v4, Lfreemarker/core/Range;

    if-eqz v4, :cond_26

    .line 91
    iget-object v4, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    check-cast v4, Lfreemarker/core/Range;

    invoke-direct {p0, v3, v4, p1}, Lfreemarker/core/DynamicKeyName;->dealWithRangeKey(Lfreemarker/template/TemplateModel;Lfreemarker/core/Range;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    goto :goto_f

    .line 93
    :cond_26
    iget-object v4, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    invoke-virtual {v4, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .line 94
    .local v2, "keyModel":Lfreemarker/template/TemplateModel;
    if-nez v2, :cond_36

    .line 95
    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v4

    if-eqz v4, :cond_49

    .line 96
    sget-object v2, Lfreemarker/template/TemplateScalarModel;->EMPTY_STRING:Lfreemarker/template/TemplateModel;

    .line 102
    :cond_36
    :goto_36
    instance-of v4, v2, Lfreemarker/template/TemplateNumberModel;

    if-eqz v4, :cond_4f

    .line 103
    iget-object v4, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    invoke-virtual {v4, v2, p1}, Lfreemarker/core/Expression;->modelToNumber(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Ljava/lang/Number;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 104
    .local v0, "index":I
    invoke-direct {p0, v3, v0, p1}, Lfreemarker/core/DynamicKeyName;->dealWithNumericalKey(Lfreemarker/template/TemplateModel;ILfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    goto :goto_f

    .line 99
    .end local v0    # "index":I
    :cond_49
    iget-object v4, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    invoke-virtual {v4, v2, p1}, Lfreemarker/core/Expression;->assertNonNull(Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    goto :goto_36

    .line 106
    :cond_4f
    instance-of v4, v2, Lfreemarker/template/TemplateScalarModel;

    if-eqz v4, :cond_60

    .line 107
    check-cast v2, Lfreemarker/template/TemplateScalarModel;

    .end local v2    # "keyModel":Lfreemarker/template/TemplateModel;
    iget-object v4, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    invoke-static {v2, v4, p1}, Lfreemarker/core/EvalUtil;->modelToString(Lfreemarker/template/TemplateScalarModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v1

    .line 108
    .local v1, "key":Ljava/lang/String;
    invoke-direct {p0, v3, v1, p1}, Lfreemarker/core/DynamicKeyName;->dealWithStringKey(Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v4

    goto :goto_f

    .line 110
    .end local v1    # "key":Ljava/lang/String;
    .restart local v2    # "keyModel":Lfreemarker/template/TemplateModel;
    :cond_60
    new-instance v4, Lfreemarker/core/UnexpectedTypeException;

    iget-object v5, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    const-string v6, "number, range, or string"

    invoke-direct {v4, v5, v2, v6, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v4
.end method

.method protected deepCloneWithIdentifierReplaced_inner(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;
    .registers 7
    .param p1, "replacedIdentifier"    # Ljava/lang/String;
    .param p2, "replacement"    # Lfreemarker/core/Expression;
    .param p3, "replacementState"    # Lfreemarker/core/Expression$ReplacemenetState;

    .prologue
    .line 267
    new-instance v0, Lfreemarker/core/DynamicKeyName;

    iget-object v1, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    invoke-virtual {v2, p1, p2, p3}, Lfreemarker/core/Expression;->deepCloneWithIdentifierReplaced(Ljava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression$ReplacemenetState;)Lfreemarker/core/Expression;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lfreemarker/core/DynamicKeyName;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Expression;)V

    return-object v0
.end method

.method public getCanonicalForm()Ljava/lang/String;
    .registers 3

    .prologue
    .line 239
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    invoke-virtual {v1}, Lfreemarker/core/Expression;->getCanonicalForm()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNodeTypeSymbol()Ljava/lang/String;
    .registers 2

    .prologue
    .line 246
    const-string v0, "...[...]"

    return-object v0
.end method

.method getParameterCount()I
    .registers 2

    .prologue
    .line 254
    const/4 v0, 0x2

    return v0
.end method

.method getParameterRole(I)Lfreemarker/core/ParameterRole;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 262
    if-nez p1, :cond_5

    sget-object v0, Lfreemarker/core/ParameterRole;->LEFT_HAND_OPERAND:Lfreemarker/core/ParameterRole;

    :goto_4
    return-object v0

    :cond_5
    sget-object v0, Lfreemarker/core/ParameterRole;->ENCLOSED_OPERAND:Lfreemarker/core/ParameterRole;

    goto :goto_4
.end method

.method getParameterValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "idx"    # I

    .prologue
    .line 258
    if-nez p1, :cond_5

    iget-object v0, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    :goto_4
    return-object v0

    :cond_5
    iget-object v0, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    goto :goto_4
.end method

.method isLiteral()Z
    .registers 2

    .prologue
    .line 250
    iget-object v0, p0, Lfreemarker/core/DynamicKeyName;->constantValue:Lfreemarker/template/TemplateModel;

    if-nez v0, :cond_14

    iget-object v0, p0, Lfreemarker/core/DynamicKeyName;->target:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_16

    iget-object v0, p0, Lfreemarker/core/DynamicKeyName;->nameExpression:Lfreemarker/core/Expression;

    invoke-virtual {v0}, Lfreemarker/core/Expression;->isLiteral()Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method
