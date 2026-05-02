.class final Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;
.super Ljavax/servlet/http/HttpServletRequestWrapper;
.source "IncludePage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/servlet/IncludePage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CustomParamsRequest"
.end annotation


# instance fields
.field private final paramsMap:Ljava/util/HashMap;


# direct methods
.method private constructor <init>(Ljavax/servlet/http/HttpServletRequest;Ljava/util/Map;Z)V
    .registers 21
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "paramMap"    # Ljava/util/Map;
    .param p3, "inheritParams"    # Z

    .prologue
    .line 161
    invoke-direct/range {p0 .. p1}, Ljavax/servlet/http/HttpServletRequestWrapper;-><init>(Ljavax/servlet/http/HttpServletRequest;)V

    .line 162
    if-eqz p3, :cond_56

    new-instance v15, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljavax/servlet/http/HttpServletRequest;->getParameterMap()Ljava/util/Map;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    :goto_e
    move-object/from16 v0, p0

    iput-object v15, v0, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;->paramsMap:Ljava/util/HashMap;

    .line 163
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "it":Ljava/util/Iterator;
    :cond_1a
    :goto_1a
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_d5

    .line 164
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 165
    .local v3, "entry":Ljava/util/Map$Entry;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 166
    .local v10, "name":Ljava/lang/String;
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    .line 168
    .local v12, "value":Ljava/lang/Object;
    if-nez v12, :cond_5c

    .line 171
    const/4 v15, 0x1

    new-array v13, v15, [Ljava/lang/String;

    const/4 v15, 0x0

    const/16 v16, 0x0

    aput-object v16, v13, v15

    .line 202
    .end local v12    # "value":Ljava/lang/Object;
    .local v13, "valueArray":[Ljava/lang/String;
    :cond_3c
    :goto_3c
    move-object/from16 v0, p0

    iget-object v15, v0, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;->paramsMap:Ljava/util/HashMap;

    invoke-virtual {v15, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, [Ljava/lang/String;

    move-object v4, v15

    check-cast v4, [Ljava/lang/String;

    .line 203
    .local v4, "existingParams":[Ljava/lang/String;
    if-nez v4, :cond_b7

    const/4 v2, 0x0

    .line 204
    .local v2, "el":I
    :goto_4c
    if-nez v2, :cond_b9

    .line 207
    move-object/from16 v0, p0

    iget-object v15, v0, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;->paramsMap:Ljava/util/HashMap;

    invoke-virtual {v15, v10, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1a

    .line 162
    .end local v2    # "el":I
    .end local v3    # "entry":Ljava/util/Map$Entry;
    .end local v4    # "existingParams":[Ljava/lang/String;
    .end local v7    # "it":Ljava/util/Iterator;
    .end local v10    # "name":Ljava/lang/String;
    .end local v13    # "valueArray":[Ljava/lang/String;
    :cond_56
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    goto :goto_e

    .line 173
    .restart local v3    # "entry":Ljava/util/Map$Entry;
    .restart local v7    # "it":Ljava/util/Iterator;
    .restart local v10    # "name":Ljava/lang/String;
    .restart local v12    # "value":Ljava/lang/Object;
    :cond_5c
    instance-of v15, v12, [Ljava/lang/String;

    if-eqz v15, :cond_66

    .line 175
    check-cast v12, [Ljava/lang/String;

    .end local v12    # "value":Ljava/lang/Object;
    move-object v13, v12

    check-cast v13, [Ljava/lang/String;

    .restart local v13    # "valueArray":[Ljava/lang/String;
    goto :goto_3c

    .line 177
    .end local v13    # "valueArray":[Ljava/lang/String;
    .restart local v12    # "value":Ljava/lang/Object;
    :cond_66
    instance-of v15, v12, Ljava/util/Collection;

    if-eqz v15, :cond_8c

    move-object v1, v12

    .line 180
    check-cast v1, Ljava/util/Collection;

    .line 181
    .local v1, "col":Ljava/util/Collection;
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v15

    new-array v13, v15, [Ljava/lang/String;

    .line 182
    .restart local v13    # "valueArray":[Ljava/lang/String;
    const/4 v5, 0x0

    .line 183
    .local v5, "i":I
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "it2":Ljava/util/Iterator;
    :goto_78
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_3c

    .line 184
    add-int/lit8 v6, v5, 0x1

    .end local v5    # "i":I
    .local v6, "i":I
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v5

    move v5, v6

    .end local v6    # "i":I
    .restart local v5    # "i":I
    goto :goto_78

    .line 187
    .end local v1    # "col":Ljava/util/Collection;
    .end local v5    # "i":I
    .end local v8    # "it2":Ljava/util/Iterator;
    .end local v13    # "valueArray":[Ljava/lang/String;
    :cond_8c
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/Class;->isArray()Z

    move-result v15

    if-eqz v15, :cond_ac

    .line 190
    invoke-static {v12}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v9

    .line 191
    .local v9, "len":I
    new-array v13, v9, [Ljava/lang/String;

    .line 192
    .restart local v13    # "valueArray":[Ljava/lang/String;
    const/4 v5, 0x0

    .restart local v5    # "i":I
    :goto_9d
    if-ge v5, v9, :cond_3c

    .line 193
    invoke-static {v12, v5}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v5

    .line 192
    add-int/lit8 v5, v5, 0x1

    goto :goto_9d

    .line 200
    .end local v5    # "i":I
    .end local v9    # "len":I
    .end local v13    # "valueArray":[Ljava/lang/String;
    :cond_ac
    const/4 v15, 0x1

    new-array v13, v15, [Ljava/lang/String;

    const/4 v15, 0x0

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v13, v15

    .restart local v13    # "valueArray":[Ljava/lang/String;
    goto :goto_3c

    .line 203
    .end local v12    # "value":Ljava/lang/Object;
    .restart local v4    # "existingParams":[Ljava/lang/String;
    :cond_b7
    array-length v2, v4

    goto :goto_4c

    .line 211
    .restart local v2    # "el":I
    :cond_b9
    array-length v14, v13

    .line 212
    .local v14, "vl":I
    if-lez v14, :cond_1a

    .line 216
    add-int v15, v2, v14

    new-array v11, v15, [Ljava/lang/String;

    .line 217
    .local v11, "newValueArray":[Ljava/lang/String;
    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-static {v13, v15, v11, v0, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 218
    const/4 v15, 0x0

    invoke-static {v4, v15, v11, v14, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 219
    move-object/from16 v0, p0

    iget-object v15, v0, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;->paramsMap:Ljava/util/HashMap;

    invoke-virtual {v15, v10, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1a

    .line 223
    .end local v2    # "el":I
    .end local v3    # "entry":Ljava/util/Map$Entry;
    .end local v4    # "existingParams":[Ljava/lang/String;
    .end local v10    # "name":Ljava/lang/String;
    .end local v11    # "newValueArray":[Ljava/lang/String;
    .end local v13    # "valueArray":[Ljava/lang/String;
    .end local v14    # "vl":I
    :cond_d5
    return-void
.end method

.method constructor <init>(Ljavax/servlet/http/HttpServletRequest;Ljava/util/Map;ZLfreemarker/ext/servlet/IncludePage$1;)V
    .registers 5
    .param p1, "x0"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "x1"    # Ljava/util/Map;
    .param p3, "x2"    # Z
    .param p4, "x3"    # Lfreemarker/ext/servlet/IncludePage$1;

    .prologue
    .line 155
    invoke-direct {p0, p1, p2, p3}, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;-><init>(Ljavax/servlet/http/HttpServletRequest;Ljava/util/Map;Z)V

    return-void
.end method


# virtual methods
.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 231
    iget-object v1, p0, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;->paramsMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    move-object v0, v1

    check-cast v0, [Ljava/lang/String;

    .line 232
    .local v0, "values":[Ljava/lang/String;
    if-eqz v0, :cond_14

    array-length v1, v0

    if-lez v1, :cond_14

    const/4 v1, 0x0

    aget-object v1, v0, v1

    :goto_13
    return-object v1

    :cond_14
    const/4 v1, 0x0

    goto :goto_13
.end method

.method public getParameterMap()Ljava/util/Map;
    .registers 5

    .prologue
    .line 240
    iget-object v3, p0, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;->paramsMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 241
    .local v0, "clone":Ljava/util/HashMap;
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 242
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 243
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    check-cast v3, [Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map$Entry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    .line 245
    .end local v1    # "entry":Ljava/util/Map$Entry;
    :cond_2c
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    return-object v3
.end method

.method public getParameterNames()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;->paramsMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getParameterValues(Ljava/lang/String;)[Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 226
    iget-object v1, p0, Lfreemarker/ext/servlet/IncludePage$CustomParamsRequest;->paramsMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    move-object v0, v1

    check-cast v0, [Ljava/lang/String;

    .line 227
    .local v0, "value":[Ljava/lang/String;
    if-eqz v0, :cond_16

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    check-cast v1, [Ljava/lang/String;

    :goto_15
    return-object v1

    :cond_16
    const/4 v1, 0x0

    goto :goto_15
.end method
