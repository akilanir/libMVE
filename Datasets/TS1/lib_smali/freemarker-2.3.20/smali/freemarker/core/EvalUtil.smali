.class Lfreemarker/core/EvalUtil;
.super Ljava/lang/Object;
.source "EvalUtil.java"


# static fields
.field static final CMP_OP_EQUALS:I = 0x1

.field static final CMP_OP_GREATER_THAN:I = 0x4

.field static final CMP_OP_GREATER_THAN_EQUALS:I = 0x6

.field static final CMP_OP_LESS_THAN:I = 0x3

.field static final CMP_OP_LESS_THAN_EQUALS:I = 0x5

.field static final CMP_OP_NOT_EQUALS:I = 0x2

.field private static final DATE_OF_THE_COMPARISON_IS_OF_TYPE_UNKNOWN:Ljava/lang/String; = "date of the comparison is of UNKNOWN type (it\'s not known if it\'s date-only, time-only, or date-time), and thus can\'t be used in a comparison."

.field static class$java$lang$Number:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;

.field static class$java$util$Date:Ljava/lang/Class;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 97
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

.method private static cmpOpToString(ILjava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "operator"    # I
    .param p1, "operatorString"    # Ljava/lang/String;

    .prologue
    .line 354
    if-eqz p1, :cond_3

    .line 364
    .end local p1    # "operatorString":Ljava/lang/String;
    :goto_2
    return-object p1

    .line 357
    .restart local p1    # "operatorString":Ljava/lang/String;
    :cond_3
    packed-switch p0, :pswitch_data_1c

    .line 364
    const-string p1, "???"

    goto :goto_2

    .line 358
    :pswitch_9
    const-string p1, "equals"

    goto :goto_2

    .line 359
    :pswitch_c
    const-string p1, "not-equals"

    goto :goto_2

    .line 360
    :pswitch_f
    const-string p1, "less-than"

    goto :goto_2

    .line 361
    :pswitch_12
    const-string p1, "greater-than"

    goto :goto_2

    .line 362
    :pswitch_15
    const-string p1, "less-than-equals"

    goto :goto_2

    .line 363
    :pswitch_18
    const-string p1, "greater-than-equals"

    goto :goto_2

    .line 357
    nop

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
        :pswitch_15
        :pswitch_18
    .end packed-switch
.end method

.method static coerceModelToString(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/Environment;)Ljava/lang/String;
    .registers 10
    .param p0, "tm"    # Lfreemarker/template/TemplateModel;
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .param p2, "seqHint"    # Ljava/lang/String;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 370
    instance-of v3, p0, Lfreemarker/template/TemplateNumberModel;

    if-eqz v3, :cond_f

    .line 371
    check-cast p0, Lfreemarker/template/TemplateNumberModel;

    .end local p0    # "tm":Lfreemarker/template/TemplateModel;
    invoke-static {p0, p1}, Lfreemarker/core/EvalUtil;->modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;

    move-result-object v3

    invoke-virtual {p3, v3}, Lfreemarker/core/Environment;->formatNumber(Ljava/lang/Number;)Ljava/lang/String;

    move-result-object v3

    .line 413
    :goto_e
    return-object v3

    .line 372
    .restart local p0    # "tm":Lfreemarker/template/TemplateModel;
    :cond_f
    instance-of v3, p0, Lfreemarker/template/TemplateDateModel;

    if-eqz v3, :cond_23

    move-object v2, p0

    .line 373
    check-cast v2, Lfreemarker/template/TemplateDateModel;

    .line 374
    .local v2, "dm":Lfreemarker/template/TemplateDateModel;
    invoke-static {v2, p1}, Lfreemarker/core/EvalUtil;->modelToDate(Lfreemarker/template/TemplateDateModel;Lfreemarker/core/Expression;)Ljava/util/Date;

    move-result-object v3

    invoke-interface {v2}, Lfreemarker/template/TemplateDateModel;->getDateType()I

    move-result v4

    invoke-virtual {p3, v3, v4}, Lfreemarker/core/Environment;->formatDate(Ljava/util/Date;I)Ljava/lang/String;

    move-result-object v3

    goto :goto_e

    .line 375
    .end local v2    # "dm":Lfreemarker/template/TemplateDateModel;
    :cond_23
    instance-of v3, p0, Lfreemarker/template/TemplateScalarModel;

    if-eqz v3, :cond_2e

    .line 376
    check-cast p0, Lfreemarker/template/TemplateScalarModel;

    .end local p0    # "tm":Lfreemarker/template/TemplateModel;
    invoke-static {p0, p1, p3}, Lfreemarker/core/EvalUtil;->modelToString(Lfreemarker/template/TemplateScalarModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v3

    goto :goto_e

    .line 377
    .restart local p0    # "tm":Lfreemarker/template/TemplateModel;
    :cond_2e
    if-nez p0, :cond_48

    .line 378
    invoke-virtual {p3}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v3

    if-eqz v3, :cond_39

    .line 379
    const-string v3, ""

    goto :goto_e

    .line 381
    :cond_39
    if-eqz p1, :cond_40

    .line 382
    invoke-static {p1, p3}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v3

    throw v3

    .line 384
    :cond_40
    new-instance v3, Lfreemarker/core/InvalidReferenceException;

    const-string v4, "Null/missing value (no more informatoin avilable)"

    invoke-direct {v3, v4, p3}, Lfreemarker/core/InvalidReferenceException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v3

    .line 389
    :cond_48
    instance-of v3, p0, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v3, :cond_99

    move-object v3, p0

    .line 393
    check-cast v3, Lfreemarker/template/TemplateBooleanModel;

    invoke-interface {v3}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v0

    .line 394
    .local v0, "booleanValue":Z
    invoke-virtual {p3}, Lfreemarker/core/Environment;->getClassicCompatibleAsInt()I

    move-result v1

    .line 395
    .local v1, "compatMode":I
    if-nez v1, :cond_5f

    .line 396
    const/4 v3, 0x0

    invoke-virtual {p3, v0, v3}, Lfreemarker/core/Environment;->formatBoolean(ZZ)Ljava/lang/String;

    move-result-object v3

    goto :goto_e

    .line 398
    :cond_5f
    const/4 v3, 0x1

    if-ne v1, v3, :cond_6a

    .line 399
    if-eqz v0, :cond_67

    const-string v3, "true"

    goto :goto_e

    :cond_67
    const-string v3, ""

    goto :goto_e

    .line 400
    :cond_6a
    const/4 v3, 0x2

    if-ne v1, v3, :cond_80

    .line 401
    instance-of v3, p0, Lfreemarker/ext/beans/BeanModel;

    if-eqz v3, :cond_78

    .line 403
    check-cast p0, Lfreemarker/ext/beans/BeanModel;

    .end local p0    # "tm":Lfreemarker/template/TemplateModel;
    invoke-static {p0}, Lfreemarker/ext/beans/_BeansAPI;->getAsClassicCompatibleString(Lfreemarker/ext/beans/BeanModel;)Ljava/lang/String;

    move-result-object v3

    goto :goto_e

    .line 405
    .restart local p0    # "tm":Lfreemarker/template/TemplateModel;
    :cond_78
    if-eqz v0, :cond_7d

    const-string v3, "true"

    goto :goto_e

    :cond_7d
    const-string v3, ""

    goto :goto_e

    .line 408
    :cond_80
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unsupported classic_compatible variation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 412
    .end local v0    # "booleanValue":Z
    .end local v1    # "compatMode":I
    :cond_99
    invoke-virtual {p3}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v3

    if-eqz v3, :cond_ab

    instance-of v3, p0, Lfreemarker/ext/beans/BeanModel;

    if-eqz v3, :cond_ab

    .line 413
    check-cast p0, Lfreemarker/ext/beans/BeanModel;

    .end local p0    # "tm":Lfreemarker/template/TemplateModel;
    invoke-static {p0}, Lfreemarker/ext/beans/_BeansAPI;->getAsClassicCompatibleString(Lfreemarker/ext/beans/BeanModel;)Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_e

    .line 414
    .restart local p0    # "tm":Lfreemarker/template/TemplateModel;
    :cond_ab
    if-eqz p2, :cond_bb

    instance-of v3, p0, Lfreemarker/template/TemplateSequenceModel;

    if-nez v3, :cond_b5

    instance-of v3, p0, Lfreemarker/template/TemplateCollectionModel;

    if-eqz v3, :cond_bb

    .line 415
    :cond_b5
    new-instance v3, Lfreemarker/core/NonStringException;

    invoke-direct {v3, p1, p0, p2, p3}, Lfreemarker/core/NonStringException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v3

    .line 417
    :cond_bb
    new-instance v3, Lfreemarker/core/NonStringException;

    invoke-direct {v3, p1, p0, p3}, Lfreemarker/core/NonStringException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)V

    throw v3
.end method

.method static compare(Lfreemarker/core/Expression;ILjava/lang/String;Lfreemarker/core/Expression;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Z
    .registers 18
    .param p0, "leftExp"    # Lfreemarker/core/Expression;
    .param p1, "operator"    # I
    .param p2, "operatorString"    # Ljava/lang/String;
    .param p3, "rightExp"    # Lfreemarker/core/Expression;
    .param p4, "defaultBlamed"    # Lfreemarker/core/Expression;
    .param p5, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 146
    move-object/from16 v0, p5

    invoke-virtual {p0, v0}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 147
    .local v1, "ltm":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p5

    invoke-virtual {p3, v0}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v5

    .line 148
    .local v5, "rtm":Lfreemarker/template/TemplateModel;
    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v2, p0

    move v3, p1

    move-object v4, p2

    move-object v6, p3

    move-object/from16 v7, p4

    move-object/from16 v11, p5

    invoke-static/range {v1 .. v11}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;ILjava/lang/String;Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Lfreemarker/core/Expression;ZZZLfreemarker/core/Environment;)Z

    move-result v2

    return v2
.end method

.method static compare(Lfreemarker/template/TemplateModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z
    .registers 15
    .param p0, "leftValue"    # Lfreemarker/template/TemplateModel;
    .param p1, "operator"    # I
    .param p2, "rightValue"    # Lfreemarker/template/TemplateModel;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    const/4 v1, 0x0

    .line 170
    move-object v0, p0

    move v2, p1

    move-object v3, v1

    move-object v4, p2

    move-object v5, v1

    move-object v6, v1

    move v8, v7

    move v9, v7

    move-object v10, p3

    invoke-static/range {v0 .. v10}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;ILjava/lang/String;Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Lfreemarker/core/Expression;ZZZLfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method

.method static compare(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;ILjava/lang/String;Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Lfreemarker/core/Expression;ZZZLfreemarker/core/Environment;)Z
    .registers 38
    .param p0, "leftValue"    # Lfreemarker/template/TemplateModel;
    .param p1, "leftExp"    # Lfreemarker/core/Expression;
    .param p2, "operator"    # I
    .param p3, "operatorString"    # Ljava/lang/String;
    .param p4, "rightValue"    # Lfreemarker/template/TemplateModel;
    .param p5, "rightExp"    # Lfreemarker/core/Expression;
    .param p6, "defaultBlamed"    # Lfreemarker/core/Expression;
    .param p7, "typeMismatchMeansNotEqual"    # Z
    .param p8, "leftNullReturnsFalse"    # Z
    .param p9, "rightNullReturnsFalse"    # Z
    .param p10, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 222
    if-nez p0, :cond_c

    .line 223
    if-eqz p10, :cond_66

    invoke-virtual/range {p10 .. p10}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v22

    if-eqz v22, :cond_66

    .line 224
    sget-object p0, Lfreemarker/template/TemplateScalarModel;->EMPTY_STRING:Lfreemarker/template/TemplateModel;

    .line 239
    :cond_c
    if-nez p4, :cond_18

    .line 240
    if-eqz p10, :cond_86

    invoke-virtual/range {p10 .. p10}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v22

    if-eqz v22, :cond_86

    .line 241
    sget-object p4, Lfreemarker/template/TemplateScalarModel;->EMPTY_STRING:Lfreemarker/template/TemplateModel;

    .line 257
    :cond_18
    move-object/from16 v0, p0

    instance-of v0, v0, Lfreemarker/template/TemplateNumberModel;

    move/from16 v22, v0

    if-eqz v22, :cond_d5

    move-object/from16 v0, p4

    instance-of v0, v0, Lfreemarker/template/TemplateNumberModel;

    move/from16 v22, v0

    if-eqz v22, :cond_d5

    .line 258
    check-cast p0, Lfreemarker/template/TemplateNumberModel;

    .end local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    invoke-static/range {p0 .. p1}, Lfreemarker/core/EvalUtil;->modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;

    move-result-object v11

    .local v11, "leftNum":Ljava/lang/Number;
    move-object/from16 v22, p4

    .line 259
    check-cast v22, Lfreemarker/template/TemplateNumberModel;

    move-object/from16 v0, v22

    move-object/from16 v1, p5

    invoke-static {v0, v1}, Lfreemarker/core/EvalUtil;->modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;

    move-result-object v18

    .line 260
    .local v18, "rightNum":Ljava/lang/Number;
    if-eqz p10, :cond_a6

    invoke-virtual/range {p10 .. p10}, Lfreemarker/core/Environment;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v4

    .line 267
    .local v4, "ae":Lfreemarker/core/ArithmeticEngine;
    :goto_40
    :try_start_40
    move-object/from16 v0, v18

    invoke-virtual {v4, v11, v0}, Lfreemarker/core/ArithmeticEngine;->compareNumbers(Ljava/lang/Number;Ljava/lang/Number;)I
    :try_end_45
    .catch Ljava/lang/RuntimeException; {:try_start_40 .. :try_end_45} :catch_b4

    move-result v5

    .line 342
    .end local v4    # "ae":Lfreemarker/core/ArithmeticEngine;
    .end local v11    # "leftNum":Ljava/lang/Number;
    .end local v18    # "rightNum":Ljava/lang/Number;
    .local v5, "cmpResult":I
    :goto_46
    packed-switch p2, :pswitch_data_344

    .line 349
    new-instance v22, Ljava/lang/RuntimeException;

    new-instance v23, Ljava/lang/StringBuffer;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuffer;-><init>()V

    const-string v24, "Unsupported comparator operator code: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, v23

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v22

    .line 226
    .end local v5    # "cmpResult":I
    .restart local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    :cond_66
    if-eqz p8, :cond_6b

    .line 227
    const/16 v22, 0x0

    .line 348
    .end local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    :goto_6a
    return v22

    .line 229
    .restart local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    :cond_6b
    if-eqz p1, :cond_76

    .line 230
    move-object/from16 v0, p1

    move-object/from16 v1, p10

    invoke-static {v0, v1}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v22

    throw v22

    .line 232
    :cond_76
    new-instance v22, Lfreemarker/core/_MiscTemplateException;

    const-string v23, "The left operand of the comparison was undefined or null."

    move-object/from16 v0, v22

    move-object/from16 v1, p6

    move-object/from16 v2, p10

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v22

    .line 243
    :cond_86
    if-eqz p9, :cond_8b

    .line 244
    const/16 v22, 0x0

    goto :goto_6a

    .line 246
    :cond_8b
    if-eqz p5, :cond_96

    .line 247
    move-object/from16 v0, p5

    move-object/from16 v1, p10

    invoke-static {v0, v1}, Lfreemarker/core/InvalidReferenceException;->getInstance(Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Lfreemarker/core/InvalidReferenceException;

    move-result-object v22

    throw v22

    .line 249
    :cond_96
    new-instance v22, Lfreemarker/core/_MiscTemplateException;

    const-string v23, "The right operand of the comparison was undefined or null."

    move-object/from16 v0, v22

    move-object/from16 v1, p6

    move-object/from16 v2, p10

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v22

    .line 260
    .end local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    .restart local v11    # "leftNum":Ljava/lang/Number;
    .restart local v18    # "rightNum":Ljava/lang/Number;
    :cond_a6
    if-eqz p1, :cond_b1

    invoke-virtual/range {p1 .. p1}, Lfreemarker/core/Expression;->getTemplate()Lfreemarker/template/Template;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Lfreemarker/template/Template;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v4

    goto :goto_40

    :cond_b1
    sget-object v4, Lfreemarker/core/ArithmeticEngine;->BIGDECIMAL_ENGINE:Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;

    goto :goto_40

    .line 268
    .restart local v4    # "ae":Lfreemarker/core/ArithmeticEngine;
    :catch_b4
    move-exception v6

    .line 269
    .local v6, "e":Ljava/lang/RuntimeException;
    new-instance v22, Lfreemarker/core/_MiscTemplateException;

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "Unexpected error while comparing two numbers: "

    aput-object v25, v23, v24

    const/16 v24, 0x1

    aput-object v6, v23, v24

    move-object/from16 v0, v22

    move-object/from16 v1, p6

    move-object/from16 v2, p10

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v6, v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v22

    .line 272
    .end local v4    # "ae":Lfreemarker/core/ArithmeticEngine;
    .end local v6    # "e":Ljava/lang/RuntimeException;
    .end local v11    # "leftNum":Ljava/lang/Number;
    .end local v18    # "rightNum":Ljava/lang/Number;
    .restart local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    :cond_d5
    move-object/from16 v0, p0

    instance-of v0, v0, Lfreemarker/template/TemplateDateModel;

    move/from16 v22, v0

    if-eqz v22, :cond_18f

    move-object/from16 v0, p4

    instance-of v0, v0, Lfreemarker/template/TemplateDateModel;

    move/from16 v22, v0

    if-eqz v22, :cond_18f

    move-object/from16 v9, p0

    .line 273
    check-cast v9, Lfreemarker/template/TemplateDateModel;

    .local v9, "leftDateModel":Lfreemarker/template/TemplateDateModel;
    move-object/from16 v16, p4

    .line 274
    check-cast v16, Lfreemarker/template/TemplateDateModel;

    .line 276
    .local v16, "rightDateModel":Lfreemarker/template/TemplateDateModel;
    invoke-interface {v9}, Lfreemarker/template/TemplateDateModel;->getDateType()I

    move-result v10

    .line 277
    .local v10, "leftDateType":I
    invoke-interface/range {v16 .. v16}, Lfreemarker/template/TemplateDateModel;->getDateType()I

    move-result v17

    .line 279
    .local v17, "rightDateType":I
    if-eqz v10, :cond_f9

    if-nez v17, :cond_135

    .line 282
    :cond_f9
    if-nez v10, :cond_12d

    .line 283
    const-string v21, "left"

    .line 284
    .local v21, "sideName":Ljava/lang/String;
    move-object/from16 v20, p1

    .line 290
    .local v20, "sideExp":Lfreemarker/core/Expression;
    :goto_ff
    new-instance v22, Lfreemarker/core/_MiscTemplateException;

    if-eqz v20, :cond_132

    .end local v20    # "sideExp":Lfreemarker/core/Expression;
    :goto_103
    const/16 v23, 0x4

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "The "

    aput-object v25, v23, v24

    const/16 v24, 0x1

    aput-object v21, v23, v24

    const/16 v24, 0x2

    const-string v25, " "

    aput-object v25, v23, v24

    const/16 v24, 0x3

    const-string v25, "date of the comparison is of UNKNOWN type (it\'s not known if it\'s date-only, time-only, or date-time), and thus can\'t be used in a comparison."

    aput-object v25, v23, v24

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    move-object/from16 v2, p10

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v22

    .line 286
    .end local v21    # "sideName":Ljava/lang/String;
    :cond_12d
    const-string v21, "right"

    .line 287
    .restart local v21    # "sideName":Ljava/lang/String;
    move-object/from16 v20, p5

    .restart local v20    # "sideExp":Lfreemarker/core/Expression;
    goto :goto_ff

    :cond_132
    move-object/from16 v20, p6

    .line 290
    goto :goto_103

    .line 294
    .end local v20    # "sideExp":Lfreemarker/core/Expression;
    .end local v21    # "sideName":Ljava/lang/String;
    :cond_135
    move/from16 v0, v17

    if-eq v10, v0, :cond_17b

    .line 296
    new-instance v22, Lfreemarker/core/_MiscTemplateException;

    const/16 v23, 0x5

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "Can\'t compare dates of different types. Left date type is "

    aput-object v25, v23, v24

    const/16 v24, 0x1

    sget-object v25, Lfreemarker/template/TemplateDateModel;->TYPE_NAMES:Ljava/util/List;

    move-object/from16 v0, v25

    invoke-interface {v0, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    const-string v25, ", right date type is "

    aput-object v25, v23, v24

    const/16 v24, 0x3

    sget-object v25, Lfreemarker/template/TemplateDateModel;->TYPE_NAMES:Ljava/util/List;

    move-object/from16 v0, v25

    move/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x4

    const-string v25, "."

    aput-object v25, v23, v24

    move-object/from16 v0, v22

    move-object/from16 v1, p6

    move-object/from16 v2, p10

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v22

    .line 302
    :cond_17b
    move-object/from16 v0, p1

    invoke-static {v9, v0}, Lfreemarker/core/EvalUtil;->modelToDate(Lfreemarker/template/TemplateDateModel;Lfreemarker/core/Expression;)Ljava/util/Date;

    move-result-object v8

    .line 303
    .local v8, "leftDate":Ljava/util/Date;
    move-object/from16 v0, v16

    move-object/from16 v1, p5

    invoke-static {v0, v1}, Lfreemarker/core/EvalUtil;->modelToDate(Lfreemarker/template/TemplateDateModel;Lfreemarker/core/Expression;)Ljava/util/Date;

    move-result-object v15

    .line 304
    .local v15, "rightDate":Ljava/util/Date;
    invoke-virtual {v8, v15}, Ljava/util/Date;->compareTo(Ljava/util/Date;)I

    move-result v5

    .line 305
    .restart local v5    # "cmpResult":I
    goto/16 :goto_46

    .end local v5    # "cmpResult":I
    .end local v8    # "leftDate":Ljava/util/Date;
    .end local v9    # "leftDateModel":Lfreemarker/template/TemplateDateModel;
    .end local v10    # "leftDateType":I
    .end local v15    # "rightDate":Ljava/util/Date;
    .end local v16    # "rightDateModel":Lfreemarker/template/TemplateDateModel;
    .end local v17    # "rightDateType":I
    :cond_18f
    move-object/from16 v0, p0

    instance-of v0, v0, Lfreemarker/template/TemplateScalarModel;

    move/from16 v22, v0

    if-eqz v22, :cond_201

    move-object/from16 v0, p4

    instance-of v0, v0, Lfreemarker/template/TemplateScalarModel;

    move/from16 v22, v0

    if-eqz v22, :cond_201

    .line 306
    const/16 v22, 0x1

    move/from16 v0, p2

    move/from16 v1, v22

    if-eq v0, v1, :cond_1d9

    const/16 v22, 0x2

    move/from16 v0, p2

    move/from16 v1, v22

    if-eq v0, v1, :cond_1d9

    .line 307
    new-instance v22, Lfreemarker/core/_MiscTemplateException;

    const/16 v23, 0x3

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "Can\'t use operator \""

    aput-object v25, v23, v24

    const/16 v24, 0x1

    invoke-static/range {p2 .. p3}, Lfreemarker/core/EvalUtil;->cmpOpToString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    const-string v25, "\" on string values."

    aput-object v25, v23, v24

    move-object/from16 v0, v22

    move-object/from16 v1, p6

    move-object/from16 v2, p10

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v22

    .line 310
    :cond_1d9
    check-cast p0, Lfreemarker/template/TemplateScalarModel;

    .end local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p10

    invoke-static {v0, v1, v2}, Lfreemarker/core/EvalUtil;->modelToString(Lfreemarker/template/TemplateScalarModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v13

    .local v13, "leftString":Ljava/lang/String;
    move-object/from16 v22, p4

    .line 311
    check-cast v22, Lfreemarker/template/TemplateScalarModel;

    move-object/from16 v0, v22

    move-object/from16 v1, p5

    move-object/from16 v2, p10

    invoke-static {v0, v1, v2}, Lfreemarker/core/EvalUtil;->modelToString(Lfreemarker/template/TemplateScalarModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v19

    .line 313
    .local v19, "rightString":Ljava/lang/String;
    invoke-virtual/range {p10 .. p10}, Lfreemarker/core/Environment;->getCollator()Ljava/text/Collator;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v13, v1}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 314
    .restart local v5    # "cmpResult":I
    goto/16 :goto_46

    .end local v5    # "cmpResult":I
    .end local v13    # "leftString":Ljava/lang/String;
    .end local v19    # "rightString":Ljava/lang/String;
    .restart local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    :cond_201
    move-object/from16 v0, p0

    instance-of v0, v0, Lfreemarker/template/TemplateBooleanModel;

    move/from16 v22, v0

    if-eqz v22, :cond_26f

    move-object/from16 v0, p4

    instance-of v0, v0, Lfreemarker/template/TemplateBooleanModel;

    move/from16 v22, v0

    if-eqz v22, :cond_26f

    .line 315
    const/16 v22, 0x1

    move/from16 v0, p2

    move/from16 v1, v22

    if-eq v0, v1, :cond_24b

    const/16 v22, 0x2

    move/from16 v0, p2

    move/from16 v1, v22

    if-eq v0, v1, :cond_24b

    .line 316
    new-instance v22, Lfreemarker/core/_MiscTemplateException;

    const/16 v23, 0x3

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "Can\'t use operator \""

    aput-object v25, v23, v24

    const/16 v24, 0x1

    invoke-static/range {p2 .. p3}, Lfreemarker/core/EvalUtil;->cmpOpToString(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x2

    const-string v25, "\" on boolean values."

    aput-object v25, v23, v24

    move-object/from16 v0, v22

    move-object/from16 v1, p6

    move-object/from16 v2, p10

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v22

    .line 319
    :cond_24b
    check-cast p0, Lfreemarker/template/TemplateBooleanModel;

    .end local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    invoke-interface/range {p0 .. p0}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v7

    .local v7, "leftBool":Z
    move-object/from16 v22, p4

    .line 320
    check-cast v22, Lfreemarker/template/TemplateBooleanModel;

    invoke-interface/range {v22 .. v22}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v14

    .line 321
    .local v14, "rightBool":Z
    if-eqz v7, :cond_267

    const/16 v22, 0x1

    move/from16 v23, v22

    :goto_25f
    if-eqz v14, :cond_26c

    const/16 v22, 0x1

    :goto_263
    sub-int v5, v23, v22

    .line 322
    .restart local v5    # "cmpResult":I
    goto/16 :goto_46

    .line 321
    .end local v5    # "cmpResult":I
    :cond_267
    const/16 v22, 0x0

    move/from16 v23, v22

    goto :goto_25f

    :cond_26c
    const/16 v22, 0x0

    goto :goto_263

    .line 322
    .end local v7    # "leftBool":Z
    .end local v14    # "rightBool":Z
    .restart local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    :cond_26f
    invoke-virtual/range {p10 .. p10}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v22

    if-eqz v22, :cond_293

    .line 323
    move-object/from16 v0, p1

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v12

    .line 324
    .local v12, "leftSting":Ljava/lang/String;
    move-object/from16 v0, p5

    move-object/from16 v1, p10

    invoke-virtual {v0, v1}, Lfreemarker/core/Expression;->evalAndCoerceToString(Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v19

    .line 325
    .restart local v19    # "rightString":Ljava/lang/String;
    invoke-virtual/range {p10 .. p10}, Lfreemarker/core/Environment;->getCollator()Ljava/text/Collator;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v12, v1}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    .line 326
    .restart local v5    # "cmpResult":I
    goto/16 :goto_46

    .line 327
    .end local v5    # "cmpResult":I
    .end local v12    # "leftSting":Ljava/lang/String;
    .end local v19    # "rightString":Ljava/lang/String;
    :cond_293
    if-eqz p7, :cond_2ad

    .line 328
    const/16 v22, 0x1

    move/from16 v0, p2

    move/from16 v1, v22

    if-ne v0, v1, :cond_2a1

    .line 329
    const/16 v22, 0x0

    goto/16 :goto_6a

    .line 330
    :cond_2a1
    const/16 v22, 0x2

    move/from16 v0, p2

    move/from16 v1, v22

    if-ne v0, v1, :cond_2ad

    .line 331
    const/16 v22, 0x1

    goto/16 :goto_6a

    .line 335
    :cond_2ad
    new-instance v22, Lfreemarker/core/_MiscTemplateException;

    const/16 v23, 0x8

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const-string v25, "Can\'t compare values of these types. "

    aput-object v25, v23, v24

    const/16 v24, 0x1

    const-string v25, "Allowed comparisons are between two numbers, two strings, two dates, or two booleans.\n"

    aput-object v25, v23, v24

    const/16 v24, 0x2

    const-string v25, "Left hand operand is "

    aput-object v25, v23, v24

    const/16 v24, 0x3

    new-instance v25, Lfreemarker/core/_DelayedAOrAn;

    new-instance v26, Lfreemarker/core/_DelayedFTLTypeDescription;

    invoke-direct/range {v26 .. v27}, Lfreemarker/core/_DelayedFTLTypeDescription;-><init>(Lfreemarker/template/TemplateModel;)V

    invoke-direct/range {v25 .. v26}, Lfreemarker/core/_DelayedAOrAn;-><init>(Ljava/lang/Object;)V

    aput-object v25, v23, v24

    const/16 v24, 0x4

    const-string v25, ".\n"

    aput-object v25, v23, v24

    const/16 v24, 0x5

    const-string v25, "Right hand operand is "

    aput-object v25, v23, v24

    const/16 v24, 0x6

    new-instance v25, Lfreemarker/core/_DelayedAOrAn;

    new-instance v26, Lfreemarker/core/_DelayedFTLTypeDescription;

    move-object/from16 v0, v26

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lfreemarker/core/_DelayedFTLTypeDescription;-><init>(Lfreemarker/template/TemplateModel;)V

    invoke-direct/range {v25 .. v26}, Lfreemarker/core/_DelayedAOrAn;-><init>(Ljava/lang/Object;)V

    aput-object v25, v23, v24

    const/16 v24, 0x7

    const-string v25, "."

    aput-object v25, v23, v24

    move-object/from16 v0, v22

    move-object/from16 v1, p6

    move-object/from16 v2, p10

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Expression;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v22

    .line 343
    .end local p0    # "leftValue":Lfreemarker/template/TemplateModel;
    .restart local v5    # "cmpResult":I
    :pswitch_307
    if-nez v5, :cond_30d

    const/16 v22, 0x1

    goto/16 :goto_6a

    :cond_30d
    const/16 v22, 0x0

    goto/16 :goto_6a

    .line 344
    :pswitch_311
    if-eqz v5, :cond_317

    const/16 v22, 0x1

    goto/16 :goto_6a

    :cond_317
    const/16 v22, 0x0

    goto/16 :goto_6a

    .line 345
    :pswitch_31b
    if-gez v5, :cond_321

    const/16 v22, 0x1

    goto/16 :goto_6a

    :cond_321
    const/16 v22, 0x0

    goto/16 :goto_6a

    .line 346
    :pswitch_325
    if-lez v5, :cond_32b

    const/16 v22, 0x1

    goto/16 :goto_6a

    :cond_32b
    const/16 v22, 0x0

    goto/16 :goto_6a

    .line 347
    :pswitch_32f
    if-gtz v5, :cond_335

    const/16 v22, 0x1

    goto/16 :goto_6a

    :cond_335
    const/16 v22, 0x0

    goto/16 :goto_6a

    .line 348
    :pswitch_339
    if-ltz v5, :cond_33f

    const/16 v22, 0x1

    goto/16 :goto_6a

    :cond_33f
    const/16 v22, 0x0

    goto/16 :goto_6a

    .line 342
    nop

    :pswitch_data_344
    .packed-switch 0x1
        :pswitch_307
        :pswitch_311
        :pswitch_31b
        :pswitch_325
        :pswitch_32f
        :pswitch_339
    .end packed-switch
.end method

.method static compareLenient(Lfreemarker/template/TemplateModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z
    .registers 15
    .param p0, "leftValue"    # Lfreemarker/template/TemplateModel;
    .param p1, "operator"    # I
    .param p2, "rightValue"    # Lfreemarker/template/TemplateModel;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v1, 0x0

    .line 187
    const/4 v7, 0x1

    move-object v0, p0

    move v2, p1

    move-object v3, v1

    move-object v4, p2

    move-object v5, v1

    move-object v6, v1

    move v9, v8

    move-object v10, p3

    invoke-static/range {v0 .. v10}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;ILjava/lang/String;Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Lfreemarker/core/Expression;ZZZLfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method

.method static modelToDate(Lfreemarker/template/TemplateDateModel;Lfreemarker/core/Expression;)Ljava/util/Date;
    .registers 4
    .param p0, "model"    # Lfreemarker/template/TemplateDateModel;
    .param p1, "expr"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;,
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 120
    invoke-interface {p0}, Lfreemarker/template/TemplateDateModel;->getAsDate()Ljava/util/Date;

    move-result-object v0

    .line 121
    .local v0, "value":Ljava/util/Date;
    if-nez v0, :cond_1a

    sget-object v1, Lfreemarker/core/EvalUtil;->class$java$util$Date:Ljava/lang/Class;

    if-nez v1, :cond_17

    const-string v1, "java.util.Date"

    invoke-static {v1}, Lfreemarker/core/EvalUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/EvalUtil;->class$java$util$Date:Ljava/lang/Class;

    :goto_12
    invoke-static {v1, p0, p1}, Lfreemarker/core/EvalUtil;->newModelHasStoredNullException(Ljava/lang/Class;Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;)Lfreemarker/template/TemplateModelException;

    move-result-object v1

    throw v1

    :cond_17
    sget-object v1, Lfreemarker/core/EvalUtil;->class$java$util$Date:Ljava/lang/Class;

    goto :goto_12

    .line 122
    :cond_1a
    return-object v0
.end method

.method static modelToNumber(Lfreemarker/template/TemplateNumberModel;Lfreemarker/core/Expression;)Ljava/lang/Number;
    .registers 4
    .param p0, "model"    # Lfreemarker/template/TemplateNumberModel;
    .param p1, "expr"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 109
    invoke-interface {p0}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v0

    .line 110
    .local v0, "value":Ljava/lang/Number;
    if-nez v0, :cond_1a

    sget-object v1, Lfreemarker/core/EvalUtil;->class$java$lang$Number:Ljava/lang/Class;

    if-nez v1, :cond_17

    const-string v1, "java.lang.Number"

    invoke-static {v1}, Lfreemarker/core/EvalUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/EvalUtil;->class$java$lang$Number:Ljava/lang/Class;

    :goto_12
    invoke-static {v1, p0, p1}, Lfreemarker/core/EvalUtil;->newModelHasStoredNullException(Ljava/lang/Class;Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;)Lfreemarker/template/TemplateModelException;

    move-result-object v1

    throw v1

    :cond_17
    sget-object v1, Lfreemarker/core/EvalUtil;->class$java$lang$Number:Ljava/lang/Class;

    goto :goto_12

    .line 111
    :cond_1a
    return-object v0
.end method

.method static modelToString(Lfreemarker/template/TemplateScalarModel;Lfreemarker/core/Expression;Lfreemarker/core/Environment;)Ljava/lang/String;
    .registers 5
    .param p0, "model"    # Lfreemarker/template/TemplateScalarModel;
    .param p1, "expr"    # Lfreemarker/core/Expression;
    .param p2, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-interface {p0}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_16

    .line 93
    if-nez p2, :cond_c

    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object p2

    .line 94
    :cond_c
    if-eqz p2, :cond_17

    invoke-virtual {p2}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 95
    const-string v0, ""

    .line 100
    .end local v0    # "value":Ljava/lang/String;
    :cond_16
    return-object v0

    .line 97
    .restart local v0    # "value":Ljava/lang/String;
    :cond_17
    sget-object v1, Lfreemarker/core/EvalUtil;->class$java$lang$String:Ljava/lang/Class;

    if-nez v1, :cond_28

    const-string v1, "java.lang.String"

    invoke-static {v1}, Lfreemarker/core/EvalUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/core/EvalUtil;->class$java$lang$String:Ljava/lang/Class;

    :goto_23
    invoke-static {v1, p0, p1}, Lfreemarker/core/EvalUtil;->newModelHasStoredNullException(Ljava/lang/Class;Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;)Lfreemarker/template/TemplateModelException;

    move-result-object v1

    throw v1

    :cond_28
    sget-object v1, Lfreemarker/core/EvalUtil;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_23
.end method

.method private static newModelHasStoredNullException(Ljava/lang/Class;Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;)Lfreemarker/template/TemplateModelException;
    .registers 5
    .param p0, "expected"    # Ljava/lang/Class;
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "expr"    # Lfreemarker/core/Expression;

    .prologue
    .line 128
    new-instance v0, Lfreemarker/core/_TemplateModelException;

    invoke-static {p0, p1}, Lfreemarker/core/_TemplateModelException;->modelHasStoredNullDescription(Ljava/lang/Class;Lfreemarker/template/TemplateModel;)[Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, p2, v1}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/Expression;[Ljava/lang/Object;)V

    return-object v0
.end method
