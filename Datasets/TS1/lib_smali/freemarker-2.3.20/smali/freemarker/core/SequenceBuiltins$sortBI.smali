.class Lfreemarker/core/SequenceBuiltins$sortBI;
.super Lfreemarker/core/SequenceBuiltins$SequenceBuiltIn;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "sortBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/SequenceBuiltins$sortBI$BooleanKVPComparator;,
        Lfreemarker/core/SequenceBuiltins$sortBI$DateKVPComparator;,
        Lfreemarker/core/SequenceBuiltins$sortBI$LexicalKVPComparator;,
        Lfreemarker/core/SequenceBuiltins$sortBI$NumericalKVPComparator;,
        Lfreemarker/core/SequenceBuiltins$sortBI$KVP;
    }
.end annotation


# static fields
.field static final KEY_TYPE_BOOLEAN:I = 0x4

.field static final KEY_TYPE_DATE:I = 0x3

.field static final KEY_TYPE_NOT_YET_DETECTED:I = 0x0

.field static final KEY_TYPE_NUMBER:I = 0x2

.field static final KEY_TYPE_STRING:I = 0x1


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 159
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/SequenceBuiltins$SequenceBuiltIn;-><init>(Lfreemarker/core/SequenceBuiltins$1;)V

    .line 408
    return-void
.end method

.method static newInconsistentSortKeyTypeException(ILjava/lang/String;Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;
    .registers 11
    .param p0, "keyNamesLn"    # I
    .param p1, "firstType"    # Ljava/lang/String;
    .param p2, "firstTypePlural"    # Ljava/lang/String;
    .param p3, "index"    # I
    .param p4, "key"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 187
    if-nez p0, :cond_57

    .line 188
    const-string v0, "value"

    .line 189
    .local v0, "valueInMsg":Ljava/lang/String;
    const-string v1, "values"

    .line 194
    .local v1, "valuesInMsg":Ljava/lang/String;
    :goto_6
    new-instance v2, Lfreemarker/core/_TemplateModelException;

    const/16 v3, 0xe

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p0, p3}, Lfreemarker/core/SequenceBuiltins$sortBI;->startErrorMessage(II)[Ljava/lang/Object;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "All "

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object v1, v3, v4

    const/4 v4, 0x3

    const-string v5, " in the sequence must be "

    aput-object v5, v3, v4

    const/4 v4, 0x4

    aput-object p2, v3, v4

    const/4 v4, 0x5

    const-string v5, ", because the first "

    aput-object v5, v3, v4

    const/4 v4, 0x6

    aput-object v0, v3, v4

    const/4 v4, 0x7

    const-string v5, " was that. However, the "

    aput-object v5, v3, v4

    const/16 v4, 0x8

    aput-object v0, v3, v4

    const/16 v4, 0x9

    const-string v5, " of the current item isn\'t a "

    aput-object v5, v3, v4

    const/16 v4, 0xa

    aput-object p1, v3, v4

    const/16 v4, 0xb

    const-string v5, " but a "

    aput-object v5, v3, v4

    const/16 v4, 0xc

    new-instance v5, Lfreemarker/core/_DelayedFTLTypeDescription;

    invoke-direct {v5, p4}, Lfreemarker/core/_DelayedFTLTypeDescription;-><init>(Lfreemarker/template/TemplateModel;)V

    aput-object v5, v3, v4

    const/16 v4, 0xd

    const-string v5, "."

    aput-object v5, v3, v4

    invoke-direct {v2, v3}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    return-object v2

    .line 191
    .end local v0    # "valueInMsg":Ljava/lang/String;
    .end local v1    # "valuesInMsg":Ljava/lang/String;
    :cond_57
    const-string v0, "key value"

    .line 192
    .restart local v0    # "valueInMsg":Ljava/lang/String;
    const-string v1, "key values"

    .restart local v1    # "valuesInMsg":Ljava/lang/String;
    goto :goto_6
.end method

.method static sort(Lfreemarker/template/TemplateSequenceModel;[Ljava/lang/String;)Lfreemarker/template/TemplateSequenceModel;
    .registers 19
    .param p0, "seq"    # Lfreemarker/template/TemplateSequenceModel;
    .param p1, "keyNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 218
    invoke-interface/range {p0 .. p0}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v10

    .line 219
    .local v10, "ln":I
    if-nez v10, :cond_7

    .line 352
    .end local p0    # "seq":Lfreemarker/template/TemplateSequenceModel;
    :goto_6
    return-object p0

    .line 221
    .restart local p0    # "seq":Lfreemarker/template/TemplateSequenceModel;
    :cond_7
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 223
    .local v11, "res":Ljava/util/ArrayList;
    if-nez p1, :cond_5b

    const/4 v8, 0x0

    .line 226
    .local v8, "keyNamesLn":I
    :goto_f
    const/4 v9, 0x0

    .line 227
    .local v9, "keyType":I
    const/4 v6, 0x0

    .line 228
    .local v6, "keyComparator":Ljava/util/Comparator;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_12
    if-ge v3, v10, :cond_1a4

    .line 229
    move-object/from16 v0, p0

    invoke-interface {v0, v3}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v4

    .line 230
    .local v4, "item":Lfreemarker/template/TemplateModel;
    move-object v5, v4

    .line 231
    .local v5, "key":Lfreemarker/template/TemplateModel;
    const/4 v7, 0x0

    .local v7, "keyNameI":I
    :goto_1c
    if-ge v7, v8, :cond_b9

    .line 233
    :try_start_1e
    move-object v0, v5

    check-cast v0, Lfreemarker/template/TemplateHashModel;

    move-object v12, v0

    aget-object v13, p1, v7

    invoke-interface {v12, v13}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    :try_end_27
    .catch Ljava/lang/ClassCastException; {:try_start_1e .. :try_end_27} :catch_5f

    move-result-object v5

    .line 249
    if-nez v5, :cond_b5

    .line 250
    new-instance v12, Lfreemarker/core/_TemplateModelException;

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v8, v3}, Lfreemarker/core/SequenceBuiltins$sortBI;->startErrorMessage(II)[Ljava/lang/Object;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string v16, "The "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    aget-object v16, p1, v7

    invoke-static/range {v16 .. v16}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x2

    const-string v15, " subvariable was not found."

    aput-object v15, v13, v14

    invoke-direct {v12, v13}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v12

    .line 223
    .end local v3    # "i":I
    .end local v4    # "item":Lfreemarker/template/TemplateModel;
    .end local v5    # "key":Lfreemarker/template/TemplateModel;
    .end local v6    # "keyComparator":Ljava/util/Comparator;
    .end local v7    # "keyNameI":I
    .end local v8    # "keyNamesLn":I
    .end local v9    # "keyType":I
    :cond_5b
    move-object/from16 v0, p1

    array-length v8, v0

    goto :goto_f

    .line 234
    .restart local v3    # "i":I
    .restart local v4    # "item":Lfreemarker/template/TemplateModel;
    .restart local v5    # "key":Lfreemarker/template/TemplateModel;
    .restart local v6    # "keyComparator":Ljava/util/Comparator;
    .restart local v7    # "keyNameI":I
    .restart local v8    # "keyNamesLn":I
    .restart local v9    # "keyType":I
    :catch_5f
    move-exception v1

    .line 235
    .local v1, "e":Ljava/lang/ClassCastException;
    instance-of v12, v5, Lfreemarker/template/TemplateHashModel;

    if-nez v12, :cond_b4

    .line 236
    new-instance v13, Lfreemarker/core/_TemplateModelException;

    const/4 v12, 0x6

    new-array v14, v12, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-static {v8, v3}, Lfreemarker/core/SequenceBuiltins$sortBI;->startErrorMessage(II)[Ljava/lang/Object;

    move-result-object v15

    aput-object v15, v14, v12

    const/4 v15, 0x1

    if-nez v7, :cond_94

    const-string v12, "Sequence items must be hashes when using ?sort_by. "

    :goto_75
    aput-object v12, v14, v15

    const/4 v12, 0x2

    const-string v15, " subvariable is not a hash, so ?sort_by "

    aput-object v15, v14, v12

    const/4 v12, 0x3

    const-string v15, "can\'t proceed with getting the "

    aput-object v15, v14, v12

    const/4 v12, 0x4

    new-instance v15, Lfreemarker/core/_DelayedJQuote;

    aget-object v16, p1, v7

    invoke-direct/range {v15 .. v16}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v15, v14, v12

    const/4 v12, 0x5

    const-string v15, " subvariable."

    aput-object v15, v14, v12

    invoke-direct {v13, v14}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v13

    :cond_94
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v16, "The "

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    add-int/lit8 v16, v7, -0x1

    aget-object v16, p1, v16

    invoke-static/range {v16 .. v16}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    goto :goto_75

    .line 246
    :cond_b4
    throw v1

    .line 231
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :cond_b5
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1c

    .line 256
    :cond_b9
    if-nez v9, :cond_cd

    .line 257
    instance-of v12, v5, Lfreemarker/template/TemplateScalarModel;

    if-eqz v12, :cond_d8

    .line 258
    const/4 v9, 0x1

    .line 259
    new-instance v6, Lfreemarker/core/SequenceBuiltins$sortBI$LexicalKVPComparator;

    .end local v6    # "keyComparator":Ljava/util/Comparator;
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v12

    invoke-virtual {v12}, Lfreemarker/core/Environment;->getCollator()Ljava/text/Collator;

    move-result-object v12

    invoke-direct {v6, v12}, Lfreemarker/core/SequenceBuiltins$sortBI$LexicalKVPComparator;-><init>(Ljava/text/Collator;)V

    .line 278
    .restart local v6    # "keyComparator":Ljava/util/Comparator;
    :cond_cd
    :goto_cd
    packed-switch v9, :pswitch_data_1ea

    .line 335
    new-instance v12, Ljava/lang/RuntimeException;

    const-string v13, "FreeMarker bug: Unexpected key type"

    invoke-direct {v12, v13}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 261
    :cond_d8
    instance-of v12, v5, Lfreemarker/template/TemplateNumberModel;

    if-eqz v12, :cond_ec

    .line 262
    const/4 v9, 0x2

    .line 263
    new-instance v6, Lfreemarker/core/SequenceBuiltins$sortBI$NumericalKVPComparator;

    .end local v6    # "keyComparator":Ljava/util/Comparator;
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v12

    invoke-virtual {v12}, Lfreemarker/core/Environment;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v12

    const/4 v13, 0x0

    invoke-direct {v6, v12, v13}, Lfreemarker/core/SequenceBuiltins$sortBI$NumericalKVPComparator;-><init>(Lfreemarker/core/ArithmeticEngine;Lfreemarker/core/SequenceBuiltins$1;)V

    .restart local v6    # "keyComparator":Ljava/util/Comparator;
    goto :goto_cd

    .line 266
    :cond_ec
    instance-of v12, v5, Lfreemarker/template/TemplateDateModel;

    if-eqz v12, :cond_f8

    .line 267
    const/4 v9, 0x3

    .line 268
    new-instance v6, Lfreemarker/core/SequenceBuiltins$sortBI$DateKVPComparator;

    .end local v6    # "keyComparator":Ljava/util/Comparator;
    const/4 v12, 0x0

    invoke-direct {v6, v12}, Lfreemarker/core/SequenceBuiltins$sortBI$DateKVPComparator;-><init>(Lfreemarker/core/SequenceBuiltins$1;)V

    .restart local v6    # "keyComparator":Ljava/util/Comparator;
    goto :goto_cd

    .line 269
    :cond_f8
    instance-of v12, v5, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v12, :cond_104

    .line 270
    const/4 v9, 0x4

    .line 271
    new-instance v6, Lfreemarker/core/SequenceBuiltins$sortBI$BooleanKVPComparator;

    .end local v6    # "keyComparator":Ljava/util/Comparator;
    const/4 v12, 0x0

    invoke-direct {v6, v12}, Lfreemarker/core/SequenceBuiltins$sortBI$BooleanKVPComparator;-><init>(Lfreemarker/core/SequenceBuiltins$1;)V

    .restart local v6    # "keyComparator":Ljava/util/Comparator;
    goto :goto_cd

    .line 273
    :cond_104
    new-instance v12, Lfreemarker/core/_TemplateModelException;

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v8, v3}, Lfreemarker/core/SequenceBuiltins$sortBI;->startErrorMessage(II)[Ljava/lang/Object;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    const-string v15, "Values used for sorting must be numbers, strings, date/times or booleans."

    aput-object v15, v13, v14

    invoke-direct {v12, v13}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v12

    .line 281
    :pswitch_119
    :try_start_119
    new-instance v13, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    move-object v0, v5

    check-cast v0, Lfreemarker/template/TemplateScalarModel;

    move-object v12, v0

    invoke-interface {v12}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v12

    const/4 v14, 0x0

    invoke-direct {v13, v12, v4, v14}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lfreemarker/core/SequenceBuiltins$1;)V

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_12a
    .catch Ljava/lang/ClassCastException; {:try_start_119 .. :try_end_12a} :catch_12e

    .line 228
    :cond_12a
    :goto_12a
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_12

    .line 284
    :catch_12e
    move-exception v1

    .line 285
    .restart local v1    # "e":Ljava/lang/ClassCastException;
    instance-of v12, v5, Lfreemarker/template/TemplateScalarModel;

    if-nez v12, :cond_13c

    .line 286
    const-string v12, "string"

    const-string v13, "strings"

    invoke-static {v8, v12, v13, v3, v5}, Lfreemarker/core/SequenceBuiltins$sortBI;->newInconsistentSortKeyTypeException(ILjava/lang/String;Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v12

    throw v12

    .line 289
    :cond_13c
    throw v1

    .line 296
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :pswitch_13d
    :try_start_13d
    new-instance v13, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    move-object v0, v5

    check-cast v0, Lfreemarker/template/TemplateNumberModel;

    move-object v12, v0

    invoke-interface {v12}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v12

    const/4 v14, 0x0

    invoke-direct {v13, v12, v4, v14}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lfreemarker/core/SequenceBuiltins$1;)V

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_14e
    .catch Ljava/lang/ClassCastException; {:try_start_13d .. :try_end_14e} :catch_14f

    goto :goto_12a

    .line 299
    :catch_14f
    move-exception v1

    .line 300
    .restart local v1    # "e":Ljava/lang/ClassCastException;
    instance-of v12, v5, Lfreemarker/template/TemplateNumberModel;

    if-nez v12, :cond_12a

    .line 301
    const-string v12, "number"

    const-string v13, "numbers"

    invoke-static {v8, v12, v13, v3, v5}, Lfreemarker/core/SequenceBuiltins$sortBI;->newInconsistentSortKeyTypeException(ILjava/lang/String;Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v12

    throw v12

    .line 309
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :pswitch_15d
    :try_start_15d
    new-instance v13, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    move-object v0, v5

    check-cast v0, Lfreemarker/template/TemplateDateModel;

    move-object v12, v0

    invoke-interface {v12}, Lfreemarker/template/TemplateDateModel;->getAsDate()Ljava/util/Date;

    move-result-object v12

    const/4 v14, 0x0

    invoke-direct {v13, v12, v4, v14}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lfreemarker/core/SequenceBuiltins$1;)V

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_16e
    .catch Ljava/lang/ClassCastException; {:try_start_15d .. :try_end_16e} :catch_16f

    goto :goto_12a

    .line 312
    :catch_16f
    move-exception v1

    .line 313
    .restart local v1    # "e":Ljava/lang/ClassCastException;
    instance-of v12, v5, Lfreemarker/template/TemplateDateModel;

    if-nez v12, :cond_12a

    .line 314
    const-string v12, "date/time"

    const-string v13, "date/times"

    invoke-static {v8, v12, v13, v3, v5}, Lfreemarker/core/SequenceBuiltins$sortBI;->newInconsistentSortKeyTypeException(ILjava/lang/String;Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v12

    throw v12

    .line 322
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :pswitch_17d
    :try_start_17d
    new-instance v13, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    move-object v0, v5

    check-cast v0, Lfreemarker/template/TemplateBooleanModel;

    move-object v12, v0

    invoke-interface {v12}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v12

    if-eqz v12, :cond_1a1

    sget-object v12, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_18b
    const/4 v14, 0x0

    invoke-direct {v13, v12, v4, v14}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lfreemarker/core/SequenceBuiltins$1;)V

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_192
    .catch Ljava/lang/ClassCastException; {:try_start_17d .. :try_end_192} :catch_193

    goto :goto_12a

    .line 326
    :catch_193
    move-exception v1

    .line 327
    .restart local v1    # "e":Ljava/lang/ClassCastException;
    instance-of v12, v5, Lfreemarker/template/TemplateBooleanModel;

    if-nez v12, :cond_12a

    .line 328
    const-string v12, "boolean"

    const-string v13, "booleans"

    invoke-static {v8, v12, v13, v3, v5}, Lfreemarker/core/SequenceBuiltins$sortBI;->newInconsistentSortKeyTypeException(ILjava/lang/String;Ljava/lang/String;ILfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModelException;

    move-result-object v12

    throw v12

    .line 322
    .end local v1    # "e":Ljava/lang/ClassCastException;
    :cond_1a1
    :try_start_1a1
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_1a3
    .catch Ljava/lang/ClassCastException; {:try_start_1a1 .. :try_end_1a3} :catch_193

    goto :goto_18b

    .line 341
    .end local v4    # "item":Lfreemarker/template/TemplateModel;
    .end local v5    # "key":Lfreemarker/template/TemplateModel;
    .end local v7    # "keyNameI":I
    :cond_1a4
    :try_start_1a4
    invoke-static {v11, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_1a7
    .catch Ljava/lang/Exception; {:try_start_1a4 .. :try_end_1a7} :catch_1ba

    .line 348
    const/4 v3, 0x0

    :goto_1a8
    if-ge v3, v10, :cond_1e1

    .line 349
    invoke-virtual {v11, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;

    invoke-static {v12}, Lfreemarker/core/SequenceBuiltins$sortBI$KVP;->access$600(Lfreemarker/core/SequenceBuiltins$sortBI$KVP;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v3, v12}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 348
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a8

    .line 342
    :catch_1ba
    move-exception v2

    .line 343
    .local v2, "exc":Ljava/lang/Exception;
    new-instance v12, Lfreemarker/core/_TemplateModelException;

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static {v8}, Lfreemarker/core/SequenceBuiltins$sortBI;->startErrorMessage(I)[Ljava/lang/Object;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string v16, "Unexpected error while sorting:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-direct {v12, v2, v13}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v12

    .line 352
    .end local v2    # "exc":Ljava/lang/Exception;
    :cond_1e1
    new-instance p0, Lfreemarker/template/TemplateModelListSequence;

    .end local p0    # "seq":Lfreemarker/template/TemplateSequenceModel;
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lfreemarker/template/TemplateModelListSequence;-><init>(Ljava/util/List;)V

    goto/16 :goto_6

    .line 278
    :pswitch_data_1ea
    .packed-switch 0x1
        :pswitch_119
        :pswitch_13d
        :pswitch_15d
        :pswitch_17d
    .end packed-switch
.end method

.method static startErrorMessage(I)[Ljava/lang/Object;
    .registers 4
    .param p0, "keyNamesLn"    # I

    .prologue
    .line 173
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    if-nez p0, :cond_10

    const-string v0, "?sort"

    :goto_8
    aput-object v0, v1, v2

    const/4 v0, 0x1

    const-string v2, " failed: "

    aput-object v2, v1, v0

    return-object v1

    :cond_10
    const-string v0, "?sort_by(...)"

    goto :goto_8
.end method

.method static startErrorMessage(II)[Ljava/lang/Object;
    .registers 5
    .param p0, "keyNamesLn"    # I
    .param p1, "index"    # I

    .prologue
    .line 177
    const/4 v0, 0x4

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    if-nez p0, :cond_1f

    const-string v0, "?sort"

    :goto_8
    aput-object v0, v1, v2

    const/4 v0, 0x1

    const-string v2, " failed at sequence index "

    aput-object v2, v1, v0

    const/4 v0, 0x2

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p1}, Ljava/lang/Integer;-><init>(I)V

    aput-object v2, v1, v0

    const/4 v2, 0x3

    if-nez p1, :cond_22

    const-string v0, ": "

    :goto_1c
    aput-object v0, v1, v2

    return-object v1

    :cond_1f
    const-string v0, "?sort_by(...)"

    goto :goto_8

    :cond_22
    const-string v0, " (0-based): "

    goto :goto_1c
.end method


# virtual methods
.method calculateResult(Lfreemarker/template/TemplateSequenceModel;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "seq"    # Lfreemarker/template/TemplateSequenceModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 169
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lfreemarker/core/SequenceBuiltins$sortBI;->sort(Lfreemarker/template/TemplateSequenceModel;[Ljava/lang/String;)Lfreemarker/template/TemplateSequenceModel;

    move-result-object v0

    return-object v0
.end method
