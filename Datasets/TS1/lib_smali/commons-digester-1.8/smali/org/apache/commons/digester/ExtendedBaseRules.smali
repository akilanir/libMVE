.class public Lorg/apache/commons/digester/ExtendedBaseRules;
.super Lorg/apache/commons/digester/RulesBase;
.source "ExtendedBaseRules.java"


# instance fields
.field private counter:I

.field private order:Ljava/util/Map;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 170
    invoke-direct {p0}, Lorg/apache/commons/digester/RulesBase;-><init>()V

    .line 178
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/digester/ExtendedBaseRules;->counter:I

    .line 188
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/ExtendedBaseRules;->order:Ljava/util/Map;

    .line 170
    return-void
.end method

.method static access$000(Lorg/apache/commons/digester/ExtendedBaseRules;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lorg/apache/commons/digester/ExtendedBaseRules;

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/commons/digester/ExtendedBaseRules;->order:Ljava/util/Map;

    return-object v0
.end method

.method private basicMatch(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x1

    .line 463
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_17

    :cond_16
    :goto_16
    return v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method private findExactAncesterMatch(Ljava/lang/String;)Ljava/util/List;
    .registers 8
    .param p1, "parentPattern"    # Ljava/lang/String;

    .prologue
    .line 471
    const/4 v2, 0x0

    .line 472
    .local v2, "matchingRules":Ljava/util/List;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "lastIndex":I
    move v1, v0

    .line 473
    .end local v0    # "lastIndex":I
    .local v1, "lastIndex":I
    :goto_6
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "lastIndex":I
    .restart local v0    # "lastIndex":I
    if-gtz v1, :cond_c

    .line 482
    const/4 v3, 0x0

    :goto_b
    return-object v3

    .line 474
    :cond_c
    const/16 v3, 0x2f

    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v0

    .line 475
    if-lez v0, :cond_38

    .line 476
    iget-object v3, p0, Lorg/apache/commons/digester/ExtendedBaseRules;->cache:Ljava/util/HashMap;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v5, 0x0

    invoke-virtual {p1, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "/*"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "matchingRules":Ljava/util/List;
    check-cast v2, Ljava/util/List;

    .line 477
    .restart local v2    # "matchingRules":Ljava/util/List;
    if-eqz v2, :cond_38

    move-object v3, v2

    .line 478
    goto :goto_b

    :cond_38
    move v1, v0

    .end local v0    # "lastIndex":I
    .restart local v1    # "lastIndex":I
    goto :goto_6
.end method

.method private parentMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;
    .param p3, "parentPattern"    # Ljava/lang/String;

    .prologue
    .line 455
    const/4 v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
    .registers 6
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 201
    invoke-super {p0, p1, p2}, Lorg/apache/commons/digester/RulesBase;->add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 202
    iget v0, p0, Lorg/apache/commons/digester/ExtendedBaseRules;->counter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/commons/digester/ExtendedBaseRules;->counter:I

    .line 203
    iget-object v0, p0, Lorg/apache/commons/digester/ExtendedBaseRules;->order:Ljava/util/Map;

    new-instance v1, Ljava/lang/Integer;

    iget v2, p0, Lorg/apache/commons/digester/ExtendedBaseRules;->counter:I

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    return-void
.end method

.method public match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 33
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 219
    const-string v19, ""

    .line 220
    .local v19, "parentPattern":Ljava/lang/String;
    const/16 v27, 0x2f

    move-object/from16 v0, p2

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v13

    .line 222
    .local v13, "lastIndex":I
    const/4 v6, 0x1

    .line 223
    .local v6, "hasParent":Z
    const/16 v27, -0x1

    move/from16 v0, v27

    if-ne v13, v0, :cond_cd

    .line 225
    const/4 v6, 0x0

    .line 235
    :goto_14
    new-instance v24, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/commons/digester/ExtendedBaseRules;->counter:I

    move/from16 v27, v0

    move-object/from16 v0, v24

    move/from16 v1, v27

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 239
    .local v24, "universalList":Ljava/util/List;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/ExtendedBaseRules;->cache:Ljava/util/HashMap;

    move-object/from16 v27, v0

    const-string v28, "!*"

    invoke-virtual/range {v27 .. v28}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/util/List;

    .line 240
    .local v23, "tempList":Ljava/util/List;
    if-eqz v23, :cond_3a

    .line 241
    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 246
    :cond_3a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/ExtendedBaseRules;->cache:Ljava/util/HashMap;

    move-object/from16 v27, v0

    new-instance v28, Ljava/lang/StringBuffer;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuffer;-><init>()V

    const-string v29, "!"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    move-object/from16 v0, v28

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    const-string v29, "/?"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    .end local v23    # "tempList":Ljava/util/List;
    check-cast v23, Ljava/util/List;

    .line 247
    .restart local v23    # "tempList":Ljava/util/List;
    if-eqz v23, :cond_6c

    .line 248
    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 255
    :cond_6c
    const/4 v7, 0x0

    .line 259
    .local v7, "ignoreBasicMatches":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/ExtendedBaseRules;->cache:Ljava/util/HashMap;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/util/List;

    .line 260
    .local v22, "rulesList":Ljava/util/List;
    if-eqz v22, :cond_d9

    .line 263
    const/4 v7, 0x1

    .line 295
    :cond_80
    :goto_80
    const-string v14, ""

    .line 296
    .local v14, "longKey":Ljava/lang/String;
    const/4 v15, 0x0

    .line 298
    .local v15, "longKeyLength":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/ExtendedBaseRules;->cache:Ljava/util/HashMap;

    move-object/from16 v27, v0

    invoke-virtual/range {v27 .. v27}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v27

    invoke-interface/range {v27 .. v27}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .line 299
    .local v12, "keys":Ljava/util/Iterator;
    :cond_91
    :goto_91
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-nez v27, :cond_110

    .line 394
    if-nez v22, :cond_a7

    .line 395
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/ExtendedBaseRules;->cache:Ljava/util/HashMap;

    move-object/from16 v27, v0

    const-string v28, "*"

    invoke-virtual/range {v27 .. v28}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    .end local v22    # "rulesList":Ljava/util/List;
    check-cast v22, Ljava/util/List;

    .line 399
    .restart local v22    # "rulesList":Ljava/util/List;
    :cond_a7
    if-eqz v22, :cond_b0

    .line 400
    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 405
    :cond_b0
    if-eqz p1, :cond_bc

    .line 407
    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 408
    .local v9, "it":Ljava/util/Iterator;
    :cond_b6
    :goto_b6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-nez v27, :cond_251

    .line 420
    .end local v9    # "it":Ljava/util/Iterator;
    :cond_bc
    new-instance v27, Lorg/apache/commons/digester/ExtendedBaseRules$1;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lorg/apache/commons/digester/ExtendedBaseRules$1;-><init>(Lorg/apache/commons/digester/ExtendedBaseRules;)V

    move-object/from16 v0, v24

    move-object/from16 v1, v27

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 448
    return-object v24

    .line 229
    .end local v7    # "ignoreBasicMatches":Z
    .end local v12    # "keys":Ljava/util/Iterator;
    .end local v14    # "longKey":Ljava/lang/String;
    .end local v15    # "longKeyLength":I
    .end local v22    # "rulesList":Ljava/util/List;
    .end local v23    # "tempList":Ljava/util/List;
    .end local v24    # "universalList":Ljava/util/List;
    :cond_cd
    const/16 v27, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v27

    invoke-virtual {v0, v1, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    goto/16 :goto_14

    .line 268
    .restart local v7    # "ignoreBasicMatches":Z
    .restart local v22    # "rulesList":Ljava/util/List;
    .restart local v23    # "tempList":Ljava/util/List;
    .restart local v24    # "universalList":Ljava/util/List;
    :cond_d9
    if-eqz v6, :cond_80

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/ExtendedBaseRules;->cache:Ljava/util/HashMap;

    move-object/from16 v27, v0

    new-instance v28, Ljava/lang/StringBuffer;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v28

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    const-string v29, "/?"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    .end local v22    # "rulesList":Ljava/util/List;
    check-cast v22, Ljava/util/List;

    .line 271
    .restart local v22    # "rulesList":Ljava/util/List;
    if-eqz v22, :cond_103

    .line 274
    const/4 v7, 0x1

    goto/16 :goto_80

    .line 279
    :cond_103
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/apache/commons/digester/ExtendedBaseRules;->findExactAncesterMatch(Ljava/lang/String;)Ljava/util/List;

    move-result-object v22

    .line 280
    if-eqz v22, :cond_80

    .line 283
    const/4 v7, 0x1

    goto/16 :goto_80

    .line 300
    .restart local v12    # "keys":Ljava/util/Iterator;
    .restart local v14    # "longKey":Ljava/lang/String;
    .restart local v15    # "longKeyLength":I
    :cond_110
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 304
    .local v10, "key":Ljava/lang/String;
    const-string v27, "!"

    move-object/from16 v0, v27

    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    .line 305
    .local v8, "isUniversal":Z
    if-eqz v8, :cond_12e

    .line 307
    const/16 v27, 0x1

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v28

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    .line 312
    :cond_12e
    const-string v27, "*/"

    move-object/from16 v0, v27

    invoke-virtual {v10, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v26

    .line 313
    .local v26, "wildcardMatchStart":Z
    const-string v27, "/*"

    move-object/from16 v0, v27

    invoke-virtual {v10, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v25

    .line 314
    .local v25, "wildcardMatchEnd":Z
    if-nez v26, :cond_144

    if-eqz v8, :cond_91

    if-eqz v25, :cond_91

    .line 316
    :cond_144
    const/16 v18, 0x0

    .line 317
    .local v18, "parentMatched":Z
    const/4 v4, 0x0

    .line 318
    .local v4, "basicMatched":Z
    const/4 v3, 0x0

    .line 320
    .local v3, "ancesterMatched":Z
    const-string v27, "/?"

    move-object/from16 v0, v27

    invoke-virtual {v10, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v17

    .line 321
    .local v17, "parentMatchEnd":Z
    if-eqz v17, :cond_190

    .line 323
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v19

    invoke-direct {v0, v10, v1, v2}, Lorg/apache/commons/digester/ExtendedBaseRules;->parentMatch(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    .line 353
    :goto_15c
    if-nez v18, :cond_162

    if-nez v4, :cond_162

    if-eqz v3, :cond_91

    .line 354
    :cond_162
    if-eqz v8, :cond_22a

    .line 357
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/ExtendedBaseRules;->cache:Ljava/util/HashMap;

    move-object/from16 v27, v0

    new-instance v28, Ljava/lang/StringBuffer;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuffer;-><init>()V

    const-string v29, "!"

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    move-object/from16 v0, v28

    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    .end local v23    # "tempList":Ljava/util/List;
    check-cast v23, Ljava/util/List;

    .line 358
    .restart local v23    # "tempList":Ljava/util/List;
    if-eqz v23, :cond_91

    .line 359
    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_91

    .line 325
    :cond_190
    if-eqz v25, :cond_220

    .line 327
    if-eqz v26, :cond_1db

    .line 328
    const/16 v27, 0x2

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v28

    add-int/lit8 v28, v28, -0x2

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v20

    .line 329
    .local v20, "patternBody":Ljava/lang/String;
    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_1b0

    .line 330
    const/4 v3, 0x1

    goto :goto_15c

    .line 332
    :cond_1b0
    new-instance v27, Ljava/lang/StringBuffer;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v27

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    const-string v28, "/"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v27

    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v27

    const/16 v28, -0x1

    move/from16 v0, v27

    move/from16 v1, v28

    if-le v0, v1, :cond_1d9

    const/4 v3, 0x1

    :goto_1d8
    goto :goto_15c

    :cond_1d9
    const/4 v3, 0x0

    goto :goto_1d8

    .line 335
    .end local v20    # "patternBody":Ljava/lang/String;
    :cond_1db
    const/16 v27, 0x0

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v28

    add-int/lit8 v28, v28, -0x2

    move/from16 v0, v27

    move/from16 v1, v28

    invoke-virtual {v10, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 336
    .local v5, "bodyPattern":Ljava/lang/String;
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v27

    if-eqz v27, :cond_21d

    .line 338
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v27

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v28

    move/from16 v0, v27

    move/from16 v1, v28

    if-ne v0, v1, :cond_204

    .line 340
    const/4 v3, 0x1

    goto/16 :goto_15c

    .line 342
    :cond_204
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v27

    move-object/from16 v0, p2

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v27

    const/16 v28, 0x2f

    move/from16 v0, v27

    move/from16 v1, v28

    if-ne v0, v1, :cond_21b

    const/4 v3, 0x1

    :goto_219
    goto/16 :goto_15c

    :cond_21b
    const/4 v3, 0x0

    goto :goto_219

    .line 345
    :cond_21d
    const/4 v3, 0x0

    goto/16 :goto_15c

    .line 350
    .end local v5    # "bodyPattern":Ljava/lang/String;
    :cond_220
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v10, v1}, Lorg/apache/commons/digester/ExtendedBaseRules;->basicMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    goto/16 :goto_15c

    .line 363
    :cond_22a
    if-nez v7, :cond_91

    .line 370
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    .line 371
    .local v11, "keyLength":I
    if-eqz v26, :cond_234

    .line 372
    add-int/lit8 v11, v11, -0x1

    .line 374
    :cond_234
    if-eqz v25, :cond_24c

    .line 375
    add-int/lit8 v11, v11, -0x1

    .line 380
    :cond_238
    :goto_238
    if-le v11, v15, :cond_91

    .line 381
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/ExtendedBaseRules;->cache:Ljava/util/HashMap;

    move-object/from16 v27, v0

    move-object/from16 v0, v27

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    .end local v22    # "rulesList":Ljava/util/List;
    check-cast v22, Ljava/util/List;

    .line 382
    .restart local v22    # "rulesList":Ljava/util/List;
    move-object v14, v10

    .line 383
    move v15, v11

    goto/16 :goto_91

    .line 376
    :cond_24c
    if-eqz v17, :cond_238

    .line 377
    add-int/lit8 v11, v11, -0x1

    goto :goto_238

    .line 409
    .end local v3    # "ancesterMatched":Z
    .end local v4    # "basicMatched":Z
    .end local v8    # "isUniversal":Z
    .end local v10    # "key":Ljava/lang/String;
    .end local v11    # "keyLength":I
    .end local v17    # "parentMatchEnd":Z
    .end local v18    # "parentMatched":Z
    .end local v25    # "wildcardMatchEnd":Z
    .end local v26    # "wildcardMatchStart":Z
    .restart local v9    # "it":Ljava/util/Iterator;
    :cond_251
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lorg/apache/commons/digester/Rule;

    .line 410
    .local v21, "rule":Lorg/apache/commons/digester/Rule;
    invoke-virtual/range {v21 .. v21}, Lorg/apache/commons/digester/Rule;->getNamespaceURI()Ljava/lang/String;

    move-result-object v16

    .line 411
    .local v16, "ns_uri":Ljava/lang/String;
    if-eqz v16, :cond_b6

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_b6

    .line 412
    invoke-interface {v9}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_b6
.end method
