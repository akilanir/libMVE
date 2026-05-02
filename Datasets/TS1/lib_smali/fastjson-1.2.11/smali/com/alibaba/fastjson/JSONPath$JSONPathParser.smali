.class Lcom/alibaba/fastjson/JSONPath$JSONPathParser;
.super Ljava/lang/Object;
.source "JSONPath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "JSONPathParser"
.end annotation


# instance fields
.field private ch:C

.field private level:I

.field private final path:Ljava/lang/String;

.field private pos:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 321
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 322
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    .line 323
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 324
    return-void
.end method

.method static isDigitFirst(C)Z
    .registers 2
    .param p0, "ch"    # C

    .prologue
    .line 765
    const/16 v0, 0x2d

    if-eq p0, v0, :cond_10

    const/16 v0, 0x2b

    if-eq p0, v0, :cond_10

    const/16 v0, 0x30

    if-lt p0, v0, :cond_12

    const/16 v0, 0x39

    if-gt p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method


# virtual methods
.method accept(C)V
    .registers 5
    .param p1, "expect"    # C

    .prologue
    .line 884
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    if-eq v0, p1, :cond_2f

    .line 885
    new-instance v0, Lcom/alibaba/fastjson/JSONPathException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "expect \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", but \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 888
    :cond_2f
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v0

    if-nez v0, :cond_38

    .line 889
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 891
    :cond_38
    return-void
.end method

.method buildArraySegement(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath$Segement;
    .registers 24
    .param p1, "indexText"    # Ljava/lang/String;

    .prologue
    .line 918
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v9

    .line 919
    .local v9, "indexTextLen":I
    const/16 v19, 0x0

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    .line 920
    .local v6, "firstChar":C
    add-int/lit8 v19, v9, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v13

    .line 922
    .local v13, "lastChar":C
    const/16 v19, 0x2c

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 924
    .local v4, "commaIndex":I
    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_8e

    const/16 v19, 0x27

    move/from16 v0, v19

    if-ne v6, v0, :cond_8e

    const/16 v19, 0x27

    move/from16 v0, v19

    if-ne v13, v0, :cond_8e

    .line 926
    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v4, v0, :cond_56

    .line 927
    const/16 v19, 0x1

    add-int/lit8 v20, v9, -0x1

    move-object/from16 v0, p1

    move/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v14

    .line 928
    .local v14, "propertyName":Ljava/lang/String;
    new-instance v19, Lcom/alibaba/fastjson/JSONPath$PropertySegement;

    move-object/from16 v0, v19

    invoke-direct {v0, v14}, Lcom/alibaba/fastjson/JSONPath$PropertySegement;-><init>(Ljava/lang/String;)V

    .line 994
    .end local v14    # "propertyName":Ljava/lang/String;
    :goto_55
    return-object v19

    .line 931
    :cond_56
    const-string v19, ","

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 932
    .local v11, "indexesText":[Ljava/lang/String;
    array-length v0, v11

    move/from16 v19, v0

    move/from16 v0, v19

    new-array v15, v0, [Ljava/lang/String;

    .line 933
    .local v15, "propertyNames":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_68
    array-length v0, v11

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v7, v0, :cond_86

    .line 934
    aget-object v12, v11, v7

    .line 935
    .local v12, "indexesTextItem":Ljava/lang/String;
    const/16 v19, 0x1

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v20

    add-int/lit8 v20, v20, -0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v19

    aput-object v19, v15, v7

    .line 933
    add-int/lit8 v7, v7, 0x1

    goto :goto_68

    .line 938
    .end local v12    # "indexesTextItem":Ljava/lang/String;
    :cond_86
    new-instance v19, Lcom/alibaba/fastjson/JSONPath$MultiPropertySegement;

    move-object/from16 v0, v19

    invoke-direct {v0, v15}, Lcom/alibaba/fastjson/JSONPath$MultiPropertySegement;-><init>([Ljava/lang/String;)V

    goto :goto_55

    .line 941
    .end local v7    # "i":I
    .end local v11    # "indexesText":[Ljava/lang/String;
    .end local v15    # "propertyNames":[Ljava/lang/String;
    :cond_8e
    const/16 v19, 0x3a

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    .line 942
    .local v3, "colonIndex":I
    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v4, v0, :cond_b0

    const/16 v19, -0x1

    move/from16 v0, v19

    if-ne v3, v0, :cond_b0

    .line 943
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    .line 944
    .local v8, "index":I
    new-instance v19, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;

    move-object/from16 v0, v19

    invoke-direct {v0, v8}, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;-><init>(I)V

    goto :goto_55

    .line 947
    .end local v8    # "index":I
    :cond_b0
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v4, v0, :cond_e3

    .line 948
    const-string v19, ","

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 949
    .restart local v11    # "indexesText":[Ljava/lang/String;
    array-length v0, v11

    move/from16 v19, v0

    move/from16 v0, v19

    new-array v10, v0, [I

    .line 950
    .local v10, "indexes":[I
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_c8
    array-length v0, v11

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v7, v0, :cond_da

    .line 951
    aget-object v19, v11, v7

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v19

    aput v19, v10, v7

    .line 950
    add-int/lit8 v7, v7, 0x1

    goto :goto_c8

    .line 953
    :cond_da
    new-instance v19, Lcom/alibaba/fastjson/JSONPath$MultiIndexSegement;

    move-object/from16 v0, v19

    invoke-direct {v0, v10}, Lcom/alibaba/fastjson/JSONPath$MultiIndexSegement;-><init>([I)V

    goto/16 :goto_55

    .line 956
    .end local v7    # "i":I
    .end local v10    # "indexes":[I
    .end local v11    # "indexesText":[Ljava/lang/String;
    :cond_e3
    const/16 v19, -0x1

    move/from16 v0, v19

    if-eq v3, v0, :cond_1a2

    .line 957
    const-string v19, ":"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 958
    .restart local v11    # "indexesText":[Ljava/lang/String;
    array-length v0, v11

    move/from16 v19, v0

    move/from16 v0, v19

    new-array v10, v0, [I

    .line 959
    .restart local v10    # "indexes":[I
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_fb
    array-length v0, v11

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v7, v0, :cond_120

    .line 960
    aget-object v18, v11, v7

    .line 961
    .local v18, "str":Ljava/lang/String;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_119

    .line 962
    if-nez v7, :cond_113

    .line 963
    const/16 v19, 0x0

    aput v19, v10, v7

    .line 959
    :goto_110
    add-int/lit8 v7, v7, 0x1

    goto :goto_fb

    .line 965
    :cond_113
    new-instance v19, Ljava/lang/UnsupportedOperationException;

    invoke-direct/range {v19 .. v19}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v19

    .line 968
    :cond_119
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v19

    aput v19, v10, v7

    goto :goto_110

    .line 972
    .end local v18    # "str":Ljava/lang/String;
    :cond_120
    const/16 v19, 0x0

    aget v16, v10, v19

    .line 974
    .local v16, "start":I
    array-length v0, v10

    move/from16 v19, v0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    if-le v0, v1, :cond_171

    .line 975
    const/16 v19, 0x1

    aget v5, v10, v19

    .line 980
    .local v5, "end":I
    :goto_133
    array-length v0, v10

    move/from16 v19, v0

    const/16 v20, 0x3

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_173

    .line 981
    const/16 v19, 0x2

    aget v17, v10, v19

    .line 986
    .local v17, "step":I
    :goto_142
    if-ltz v5, :cond_176

    move/from16 v0, v16

    if-ge v5, v0, :cond_176

    .line 987
    new-instance v19, Ljava/lang/UnsupportedOperationException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "end must greater than or equals start. start "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ",  end "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 977
    .end local v5    # "end":I
    .end local v17    # "step":I
    :cond_171
    const/4 v5, -0x1

    .restart local v5    # "end":I
    goto :goto_133

    .line 983
    :cond_173
    const/16 v17, 0x1

    .restart local v17    # "step":I
    goto :goto_142

    .line 991
    :cond_176
    if-gtz v17, :cond_195

    .line 992
    new-instance v19, Ljava/lang/UnsupportedOperationException;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "step must greater than zero : "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 994
    :cond_195
    new-instance v19, Lcom/alibaba/fastjson/JSONPath$RangeSegement;

    move-object/from16 v0, v19

    move/from16 v1, v16

    move/from16 v2, v17

    invoke-direct {v0, v1, v5, v2}, Lcom/alibaba/fastjson/JSONPath$RangeSegement;-><init>(III)V

    goto/16 :goto_55

    .line 997
    .end local v5    # "end":I
    .end local v7    # "i":I
    .end local v10    # "indexes":[I
    .end local v11    # "indexesText":[Ljava/lang/String;
    .end local v16    # "start":I
    .end local v17    # "step":I
    :cond_1a2
    new-instance v19, Ljava/lang/UnsupportedOperationException;

    invoke-direct/range {v19 .. v19}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v19
.end method

.method public explain()[Lcom/alibaba/fastjson/JSONPath$Segement;
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 894
    iget-object v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    if-eqz v3, :cond_d

    iget-object v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_13

    .line 895
    :cond_d
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 898
    :cond_13
    const/16 v3, 0x8

    new-array v1, v3, [Lcom/alibaba/fastjson/JSONPath$Segement;

    .line 901
    .local v1, "segements":[Lcom/alibaba/fastjson/JSONPath$Segement;
    :goto_17
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readSegement()Lcom/alibaba/fastjson/JSONPath$Segement;

    move-result-object v2

    .line 902
    .local v2, "segment":Lcom/alibaba/fastjson/JSONPath$Segement;
    if-nez v2, :cond_23

    .line 908
    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    array-length v4, v1

    if-ne v3, v4, :cond_2c

    .line 914
    .end local v1    # "segements":[Lcom/alibaba/fastjson/JSONPath$Segement;
    :goto_22
    return-object v1

    .line 905
    .restart local v1    # "segements":[Lcom/alibaba/fastjson/JSONPath$Segement;
    :cond_23
    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    aput-object v2, v1, v3

    goto :goto_17

    .line 912
    :cond_2c
    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    new-array v0, v3, [Lcom/alibaba/fastjson/JSONPath$Segement;

    .line 913
    .local v0, "result":[Lcom/alibaba/fastjson/JSONPath$Segement;
    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    invoke-static {v1, v5, v0, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v1, v0

    .line 914
    goto :goto_22
.end method

.method isEOF()Z
    .registers 3

    .prologue
    .line 331
    iget v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    iget-object v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method next()V
    .registers 4

    .prologue
    .line 327
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    iget v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    iput-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 328
    return-void
.end method

.method parseArrayAccess(Z)Lcom/alibaba/fastjson/JSONPath$Segement;
    .registers 41
    .param p1, "acceptBracket"    # Z

    .prologue
    .line 414
    if-eqz p1, :cond_9

    .line 415
    const/16 v5, 0x5b

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 418
    :cond_9
    const/16 v29, 0x0

    .line 420
    .local v29, "predicateFlag":Z
    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x3f

    if-ne v5, v6, :cond_31

    .line 421
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 422
    const/16 v5, 0x28

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 423
    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x40

    if-ne v5, v6, :cond_2f

    .line 424
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 425
    const/16 v5, 0x2e

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 428
    :cond_2f
    const/16 v29, 0x1

    .line 431
    :cond_31
    if-nez v29, :cond_3d

    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-static {v5}, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifier(C)Z

    move-result v5

    if-eqz v5, :cond_495

    .line 432
    :cond_3d
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    move-result-object v4

    .line 434
    .local v4, "propertyName":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 436
    if-eqz v29, :cond_67

    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x29

    if-ne v5, v6, :cond_67

    .line 437
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 438
    if-eqz p1, :cond_5a

    .line 439
    const/16 v5, 0x5d

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 442
    :cond_5a
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;

    invoke-direct {v5, v4}, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    .line 721
    .end local v4    # "propertyName":Ljava/lang/String;
    :cond_66
    :goto_66
    return-object v30

    .line 445
    .restart local v4    # "propertyName":Ljava/lang/String;
    :cond_67
    if-eqz p1, :cond_81

    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x5d

    if-ne v5, v6, :cond_81

    .line 446
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 447
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;

    invoke-direct {v5, v4}, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto :goto_66

    .line 450
    :cond_81
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readOp()Lcom/alibaba/fastjson/JSONPath$Operator;

    move-result-object v27

    .line 452
    .local v27, "op":Lcom/alibaba/fastjson/JSONPath$Operator;
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 454
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-eq v0, v5, :cond_94

    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_103

    .line 455
    :cond_94
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_b7

    const/4 v9, 0x1

    .line 457
    .local v9, "not":Z
    :goto_9b
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readValue()Ljava/lang/Object;

    move-result-object v32

    .line 459
    .local v32, "startValue":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    move-result-object v26

    .line 461
    .local v26, "name":Ljava/lang/String;
    const-string v5, "and"

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_b9

    .line 462
    new-instance v5, Lcom/alibaba/fastjson/JSONPathException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 455
    .end local v9    # "not":Z
    .end local v26    # "name":Ljava/lang/String;
    .end local v32    # "startValue":Ljava/lang/Object;
    :cond_b7
    const/4 v9, 0x0

    goto :goto_9b

    .line 465
    .restart local v9    # "not":Z
    .restart local v26    # "name":Ljava/lang/String;
    .restart local v32    # "startValue":Ljava/lang/Object;
    :cond_b9
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readValue()Ljava/lang/Object;

    move-result-object v18

    .line 467
    .local v18, "endValue":Ljava/lang/Object;
    if-eqz v32, :cond_c1

    if-nez v18, :cond_cb

    .line 468
    :cond_c1
    new-instance v5, Lcom/alibaba/fastjson/JSONPathException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 471
    :cond_cb
    invoke-virtual/range {v32 .. v32}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/JSONPath;->isInt(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_f9

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/JSONPath;->isInt(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_f9

    .line 472
    new-instance v3, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;

    check-cast v32, Ljava/lang/Number;

    .end local v32    # "startValue":Ljava/lang/Object;
    invoke-virtual/range {v32 .. v32}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    check-cast v18, Ljava/lang/Number;

    .line 473
    .end local v18    # "endValue":Ljava/lang/Object;
    invoke-virtual/range {v18 .. v18}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    invoke-direct/range {v3 .. v9}, Lcom/alibaba/fastjson/JSONPath$IntBetweenSegement;-><init>(Ljava/lang/String;JJZ)V

    .line 474
    .local v3, "filter":Lcom/alibaba/fastjson/JSONPath$Filter;
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    move-object/from16 v0, v30

    invoke-direct {v0, v3}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 477
    .end local v3    # "filter":Lcom/alibaba/fastjson/JSONPath$Filter;
    .restart local v18    # "endValue":Ljava/lang/Object;
    .restart local v32    # "startValue":Ljava/lang/Object;
    :cond_f9
    new-instance v5, Lcom/alibaba/fastjson/JSONPathException;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 480
    .end local v9    # "not":Z
    .end local v18    # "endValue":Ljava/lang/Object;
    .end local v26    # "name":Ljava/lang/String;
    .end local v32    # "startValue":Ljava/lang/Object;
    :cond_103
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-eq v0, v5, :cond_10f

    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_2c3

    .line 481
    :cond_10f
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_16c

    const/4 v9, 0x1

    .line 482
    .restart local v9    # "not":Z
    :goto_116
    const/16 v5, 0x28

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 484
    new-instance v37, Ljava/util/ArrayList;

    invoke-direct/range {v37 .. v37}, Ljava/util/ArrayList;-><init>()V

    .line 486
    .local v37, "valueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readValue()Ljava/lang/Object;

    move-result-object v35

    .line 487
    .local v35, "value":Ljava/lang/Object;
    move-object/from16 v0, v37

    move-object/from16 v1, v35

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 490
    :goto_12d
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 491
    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x2c

    if-eq v5, v6, :cond_16e

    .line 500
    const/16 v5, 0x29

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 501
    if-eqz v29, :cond_148

    .line 502
    const/16 v5, 0x29

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 505
    :cond_148
    if-eqz p1, :cond_151

    .line 506
    const/16 v5, 0x5d

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 510
    :cond_151
    const/16 v21, 0x1

    .line 511
    .local v21, "isInt":Z
    const/16 v22, 0x1

    .line 512
    .local v22, "isIntObj":Z
    const/16 v23, 0x1

    .line 513
    .local v23, "isString":Z
    invoke-interface/range {v37 .. v37}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_15b
    :goto_15b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1aa

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    .line 514
    .local v24, "item":Ljava/lang/Object;
    if-nez v24, :cond_17d

    .line 515
    if-eqz v21, :cond_15b

    .line 516
    const/16 v21, 0x0

    goto :goto_15b

    .line 481
    .end local v9    # "not":Z
    .end local v21    # "isInt":Z
    .end local v22    # "isIntObj":Z
    .end local v23    # "isString":Z
    .end local v24    # "item":Ljava/lang/Object;
    .end local v35    # "value":Ljava/lang/Object;
    .end local v37    # "valueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_16c
    const/4 v9, 0x0

    goto :goto_116

    .line 494
    .restart local v9    # "not":Z
    .restart local v35    # "value":Ljava/lang/Object;
    .restart local v37    # "valueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_16e
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 496
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readValue()Ljava/lang/Object;

    move-result-object v35

    .line 497
    move-object/from16 v0, v37

    move-object/from16 v1, v35

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_12d

    .line 521
    .restart local v21    # "isInt":Z
    .restart local v22    # "isIntObj":Z
    .restart local v23    # "isString":Z
    .restart local v24    # "item":Ljava/lang/Object;
    :cond_17d
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v16

    .line 522
    .local v16, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz v21, :cond_19f

    const-class v6, Ljava/lang/Byte;

    move-object/from16 v0, v16

    if-eq v0, v6, :cond_19f

    const-class v6, Ljava/lang/Short;

    move-object/from16 v0, v16

    if-eq v0, v6, :cond_19f

    const-class v6, Ljava/lang/Integer;

    move-object/from16 v0, v16

    if-eq v0, v6, :cond_19f

    const-class v6, Ljava/lang/Long;

    move-object/from16 v0, v16

    if-eq v0, v6, :cond_19f

    .line 524
    const/16 v21, 0x0

    .line 525
    const/16 v22, 0x0

    .line 528
    :cond_19f
    if-eqz v23, :cond_15b

    const-class v6, Ljava/lang/String;

    move-object/from16 v0, v16

    if-eq v0, v6, :cond_15b

    .line 529
    const/16 v23, 0x0

    goto :goto_15b

    .line 533
    .end local v16    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v24    # "item":Ljava/lang/Object;
    :cond_1aa
    invoke-interface/range {v37 .. v37}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1d8

    const/4 v5, 0x0

    move-object/from16 v0, v37

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_1d8

    .line 534
    if-eqz v9, :cond_1ca

    .line 535
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;

    invoke-direct {v5, v4}, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 537
    :cond_1ca
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$NullSegement;

    invoke-direct {v5, v4}, Lcom/alibaba/fastjson/JSONPath$NullSegement;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 541
    :cond_1d8
    if-eqz v21, :cond_23b

    .line 542
    invoke-interface/range {v37 .. v37}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_207

    .line 543
    const/4 v5, 0x0

    move-object/from16 v0, v37

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v35

    .line 544
    .local v35, "value":J
    if-eqz v9, :cond_204

    sget-object v20, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 545
    .local v20, "intOp":Lcom/alibaba/fastjson/JSONPath$Operator;
    :goto_1f2
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;

    move-wide/from16 v0, v35

    move-object/from16 v2, v20

    invoke-direct {v5, v4, v0, v1, v2}, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;-><init>(Ljava/lang/String;JLcom/alibaba/fastjson/JSONPath$Operator;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 544
    .end local v20    # "intOp":Lcom/alibaba/fastjson/JSONPath$Operator;
    :cond_204
    sget-object v20, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_1f2

    .line 548
    .local v35, "value":Ljava/lang/Object;
    :cond_207
    invoke-interface/range {v37 .. v37}, Ljava/util/List;->size()I

    move-result v5

    new-array v0, v5, [J

    move-object/from16 v38, v0

    .line 549
    .local v38, "values":[J
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_211
    move-object/from16 v0, v38

    array-length v5, v0

    move/from16 v0, v19

    if-ge v0, v5, :cond_22b

    .line 550
    move-object/from16 v0, v37

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    aput-wide v5, v38, v19

    .line 549
    add-int/lit8 v19, v19, 0x1

    goto :goto_211

    .line 553
    :cond_22b
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$IntInSegement;

    move-object/from16 v0, v38

    invoke-direct {v5, v4, v0, v9}, Lcom/alibaba/fastjson/JSONPath$IntInSegement;-><init>(Ljava/lang/String;[JZ)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 556
    .end local v19    # "i":I
    .end local v38    # "values":[J
    :cond_23b
    if-eqz v23, :cond_281

    .line 557
    invoke-interface/range {v37 .. v37}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_266

    .line 558
    const/4 v5, 0x0

    move-object/from16 v0, v37

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v35

    .end local v35    # "value":Ljava/lang/Object;
    check-cast v35, Ljava/lang/String;

    .line 560
    .local v35, "value":Ljava/lang/String;
    if-eqz v9, :cond_263

    sget-object v20, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 561
    .restart local v20    # "intOp":Lcom/alibaba/fastjson/JSONPath$Operator;
    :goto_251
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;

    move-object/from16 v0, v35

    move-object/from16 v1, v20

    invoke-direct {v5, v4, v0, v1}, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/alibaba/fastjson/JSONPath$Operator;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 560
    .end local v20    # "intOp":Lcom/alibaba/fastjson/JSONPath$Operator;
    :cond_263
    sget-object v20, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_251

    .line 564
    .local v35, "value":Ljava/lang/Object;
    :cond_266
    invoke-interface/range {v37 .. v37}, Ljava/util/List;->size()I

    move-result v5

    new-array v0, v5, [Ljava/lang/String;

    move-object/from16 v38, v0

    .line 565
    .local v38, "values":[Ljava/lang/String;
    invoke-interface/range {v37 .. v38}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 567
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$StringInSegement;

    move-object/from16 v0, v38

    invoke-direct {v5, v4, v0, v9}, Lcom/alibaba/fastjson/JSONPath$StringInSegement;-><init>(Ljava/lang/String;[Ljava/lang/String;Z)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 570
    .end local v38    # "values":[Ljava/lang/String;
    :cond_281
    if-eqz v22, :cond_2bd

    .line 571
    invoke-interface/range {v37 .. v37}, Ljava/util/List;->size()I

    move-result v5

    new-array v0, v5, [Ljava/lang/Long;

    move-object/from16 v38, v0

    .line 572
    .local v38, "values":[Ljava/lang/Long;
    const/16 v19, 0x0

    .restart local v19    # "i":I
    :goto_28d
    move-object/from16 v0, v38

    array-length v5, v0

    move/from16 v0, v19

    if-ge v0, v5, :cond_2ad

    .line 573
    move-object/from16 v0, v37

    move/from16 v1, v19

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/Number;

    .line 574
    .local v24, "item":Ljava/lang/Number;
    if-eqz v24, :cond_2aa

    .line 575
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Number;->longValue()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v38, v19

    .line 572
    :cond_2aa
    add-int/lit8 v19, v19, 0x1

    goto :goto_28d

    .line 579
    .end local v24    # "item":Ljava/lang/Number;
    :cond_2ad
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;

    move-object/from16 v0, v38

    invoke-direct {v5, v4, v0, v9}, Lcom/alibaba/fastjson/JSONPath$IntObjInSegement;-><init>(Ljava/lang/String;[Ljava/lang/Long;Z)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 582
    .end local v19    # "i":I
    .end local v38    # "values":[Ljava/lang/Long;
    :cond_2bd
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v5}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v5

    .line 585
    .end local v9    # "not":Z
    .end local v21    # "isInt":Z
    .end local v22    # "isIntObj":Z
    .end local v23    # "isString":Z
    .end local v35    # "value":Ljava/lang/Object;
    .end local v37    # "valueList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_2c3
    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x27

    if-eq v5, v6, :cond_2d3

    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x22

    if-ne v5, v6, :cond_409

    .line 586
    :cond_2d3
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readString()Ljava/lang/String;

    move-result-object v33

    .line 587
    .local v33, "strValue":Ljava/lang/String;
    if-eqz v29, :cond_2e0

    .line 588
    const/16 v5, 0x29

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 591
    :cond_2e0
    if-eqz p1, :cond_2e9

    .line 592
    const/16 v5, 0x5d

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 595
    :cond_2e9
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->RLIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_300

    .line 596
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$RlikeSegement;

    const/4 v6, 0x0

    move-object/from16 v0, v33

    invoke-direct {v5, v4, v0, v6}, Lcom/alibaba/fastjson/JSONPath$RlikeSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 599
    :cond_300
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_RLIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_317

    .line 600
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$RlikeSegement;

    const/4 v6, 0x1

    move-object/from16 v0, v33

    invoke-direct {v5, v4, v0, v6}, Lcom/alibaba/fastjson/JSONPath$RlikeSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 603
    :cond_317
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-eq v0, v5, :cond_323

    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_355

    .line 604
    :cond_323
    :goto_323
    const-string v5, "%%"

    move-object/from16 v0, v33

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_339

    .line 605
    const-string v5, "%%"

    const-string v6, "%"

    move-object/from16 v0, v33

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    goto :goto_323

    .line 608
    :cond_339
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_367

    const/4 v9, 0x1

    .line 610
    .restart local v9    # "not":Z
    :goto_340
    const/16 v5, 0x25

    move-object/from16 v0, v33

    invoke-virtual {v0, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v28

    .line 611
    .local v28, "p0":I
    const/4 v5, -0x1

    move/from16 v0, v28

    if-ne v0, v5, :cond_36c

    .line 612
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_369

    .line 613
    sget-object v27, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 656
    .end local v9    # "not":Z
    .end local v28    # "p0":I
    :cond_355
    :goto_355
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;

    move-object/from16 v0, v33

    move-object/from16 v1, v27

    invoke-direct {v5, v4, v0, v1}, Lcom/alibaba/fastjson/JSONPath$StringOpSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/alibaba/fastjson/JSONPath$Operator;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 608
    :cond_367
    const/4 v9, 0x0

    goto :goto_340

    .line 615
    .restart local v9    # "not":Z
    .restart local v28    # "p0":I
    :cond_369
    sget-object v27, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_355

    .line 618
    :cond_36c
    const-string v5, "%"

    move-object/from16 v0, v33

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v25

    .line 620
    .local v25, "items":[Ljava/lang/String;
    const/4 v12, 0x0

    .line 621
    .local v12, "startsWithValue":Ljava/lang/String;
    const/4 v13, 0x0

    .line 622
    .local v13, "endsWithValue":Ljava/lang/String;
    const/4 v14, 0x0

    .line 623
    .local v14, "containsValues":[Ljava/lang/String;
    if-nez v28, :cond_3c5

    .line 624
    invoke-virtual/range {v33 .. v33}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    move-object/from16 v0, v33

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x25

    if-ne v5, v6, :cond_3a8

    .line 625
    move-object/from16 v0, v25

    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    new-array v14, v5, [Ljava/lang/String;

    .line 626
    const/4 v5, 0x1

    const/4 v6, 0x0

    array-length v7, v14

    move-object/from16 v0, v25

    invoke-static {v0, v5, v14, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 650
    :cond_398
    :goto_398
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v10, Lcom/alibaba/fastjson/JSONPath$MatchSegement;

    move-object v11, v4

    move v15, v9

    invoke-direct/range {v10 .. v15}, Lcom/alibaba/fastjson/JSONPath$MatchSegement;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Z)V

    move-object/from16 v0, v30

    invoke-direct {v0, v10}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 628
    :cond_3a8
    move-object/from16 v0, v25

    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    aget-object v13, v25, v5

    .line 629
    move-object/from16 v0, v25

    array-length v5, v0

    const/4 v6, 0x2

    if-le v5, v6, :cond_398

    .line 630
    move-object/from16 v0, v25

    array-length v5, v0

    add-int/lit8 v5, v5, -0x2

    new-array v14, v5, [Ljava/lang/String;

    .line 631
    const/4 v5, 0x1

    const/4 v6, 0x0

    array-length v7, v14

    move-object/from16 v0, v25

    invoke-static {v0, v5, v14, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_398

    .line 634
    :cond_3c5
    invoke-virtual/range {v33 .. v33}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    move-object/from16 v0, v33

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x25

    if-ne v5, v6, :cond_3d8

    .line 635
    move-object/from16 v14, v25

    goto :goto_398

    .line 637
    :cond_3d8
    move-object/from16 v0, v25

    array-length v5, v0

    const/4 v6, 0x1

    if-ne v5, v6, :cond_3e2

    .line 638
    const/4 v5, 0x0

    aget-object v12, v25, v5

    goto :goto_398

    .line 639
    :cond_3e2
    move-object/from16 v0, v25

    array-length v5, v0

    const/4 v6, 0x2

    if-ne v5, v6, :cond_3ef

    .line 640
    const/4 v5, 0x0

    aget-object v12, v25, v5

    .line 641
    const/4 v5, 0x1

    aget-object v13, v25, v5

    goto :goto_398

    .line 643
    :cond_3ef
    const/4 v5, 0x0

    aget-object v12, v25, v5

    .line 644
    move-object/from16 v0, v25

    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    aget-object v13, v25, v5

    .line 645
    move-object/from16 v0, v25

    array-length v5, v0

    add-int/lit8 v5, v5, -0x2

    new-array v14, v5, [Ljava/lang/String;

    .line 646
    const/4 v5, 0x1

    const/4 v6, 0x0

    array-length v7, v14

    move-object/from16 v0, v25

    invoke-static {v0, v5, v14, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_398

    .line 659
    .end local v9    # "not":Z
    .end local v12    # "startsWithValue":Ljava/lang/String;
    .end local v13    # "endsWithValue":Ljava/lang/String;
    .end local v14    # "containsValues":[Ljava/lang/String;
    .end local v25    # "items":[Ljava/lang/String;
    .end local v28    # "p0":I
    .end local v33    # "strValue":Ljava/lang/String;
    :cond_409
    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-static {v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isDigitFirst(C)Z

    move-result v5

    if-eqz v5, :cond_43b

    .line 660
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readLongValue()J

    move-result-wide v35

    .line 662
    .local v35, "value":J
    if-eqz v29, :cond_420

    .line 663
    const/16 v5, 0x29

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 666
    :cond_420
    if-eqz p1, :cond_429

    .line 667
    const/16 v5, 0x5d

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 670
    :cond_429
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;

    move-wide/from16 v0, v35

    move-object/from16 v2, v27

    invoke-direct {v5, v4, v0, v1, v2}, Lcom/alibaba/fastjson/JSONPath$IntOpSegement;-><init>(Ljava/lang/String;JLcom/alibaba/fastjson/JSONPath$Operator;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 673
    .end local v35    # "value":J
    :cond_43b
    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x6e

    if-ne v5, v6, :cond_48f

    .line 674
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    move-result-object v26

    .line 675
    .restart local v26    # "name":Ljava/lang/String;
    const-string v5, "null"

    move-object/from16 v0, v26

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_48f

    .line 676
    if-eqz v29, :cond_45a

    .line 677
    const/16 v5, 0x29

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 679
    :cond_45a
    const/16 v5, 0x5d

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 681
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_475

    .line 682
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$NullSegement;

    invoke-direct {v5, v4}, Lcom/alibaba/fastjson/JSONPath$NullSegement;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 685
    :cond_475
    sget-object v5, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    move-object/from16 v0, v27

    if-ne v0, v5, :cond_489

    .line 686
    new-instance v30, Lcom/alibaba/fastjson/JSONPath$FilterSegement;

    new-instance v5, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;

    invoke-direct {v5, v4}, Lcom/alibaba/fastjson/JSONPath$NotNullSegement;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v30

    invoke-direct {v0, v5}, Lcom/alibaba/fastjson/JSONPath$FilterSegement;-><init>(Lcom/alibaba/fastjson/JSONPath$Filter;)V

    goto/16 :goto_66

    .line 689
    :cond_489
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v5}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v5

    .line 693
    .end local v26    # "name":Ljava/lang/String;
    :cond_48f
    new-instance v5, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v5}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v5

    .line 697
    .end local v4    # "propertyName":Ljava/lang/String;
    .end local v27    # "op":Lcom/alibaba/fastjson/JSONPath$Operator;
    :cond_495
    move-object/from16 v0, p0

    iget v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    add-int/lit8 v31, v5, -0x1

    .line 698
    .local v31, "start":I
    :goto_49b
    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x5d

    if-eq v5, v6, :cond_4b5

    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x2f

    if-eq v5, v6, :cond_4b5

    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v5

    if-nez v5, :cond_4b5

    .line 699
    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    goto :goto_49b

    .line 703
    :cond_4b5
    if-eqz p1, :cond_4e2

    .line 704
    move-object/from16 v0, p0

    iget v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    add-int/lit8 v17, v5, -0x1

    .line 713
    .local v17, "end":I
    :goto_4bd
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    move/from16 v0, v31

    move/from16 v1, v17

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v34

    .line 715
    .local v34, "text":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->buildArraySegement(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONPath$Segement;

    move-result-object v30

    .line 717
    .local v30, "segment":Lcom/alibaba/fastjson/JSONPath$Segement;
    if-eqz p1, :cond_66

    invoke-virtual/range {p0 .. p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v5

    if-nez v5, :cond_66

    .line 718
    const/16 v5, 0x5d

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    goto/16 :goto_66

    .line 706
    .end local v17    # "end":I
    .end local v30    # "segment":Lcom/alibaba/fastjson/JSONPath$Segement;
    .end local v34    # "text":Ljava/lang/String;
    :cond_4e2
    move-object/from16 v0, p0

    iget-char v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x2f

    if-ne v5, v6, :cond_4f1

    .line 707
    move-object/from16 v0, p0

    iget v5, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    add-int/lit8 v17, v5, -0x1

    .restart local v17    # "end":I
    goto :goto_4bd

    .line 709
    .end local v17    # "end":I
    :cond_4f1
    move-object/from16 v0, p0

    iget v0, v0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    move/from16 v17, v0

    .restart local v17    # "end":I
    goto :goto_4bd
.end method

.method protected readLongValue()J
    .registers 8

    .prologue
    .line 725
    iget v5, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    add-int/lit8 v0, v5, -0x1

    .line 726
    .local v0, "beginIndex":I
    iget-char v5, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x2b

    if-eq v5, v6, :cond_10

    iget-char v5, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x2d

    if-ne v5, v6, :cond_13

    .line 727
    :cond_10
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 730
    :cond_13
    :goto_13
    iget-char v5, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x30

    if-lt v5, v6, :cond_23

    iget-char v5, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v6, 0x39

    if-gt v5, v6, :cond_23

    .line 731
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    goto :goto_13

    .line 734
    :cond_23
    iget v5, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    add-int/lit8 v1, v5, -0x1

    .line 735
    .local v1, "endIndex":I
    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-virtual {v5, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 736
    .local v2, "text":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    .line 737
    .local v3, "value":J
    return-wide v3
.end method

.method readName()Ljava/lang/String;
    .registers 7

    .prologue
    const/16 v4, 0x5c

    .line 832
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 834
    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    if-eq v3, v4, :cond_2c

    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-static {v3}, Lcom/alibaba/fastjson/util/IOUtils;->firstIdentifier(C)Z

    move-result v3

    if-nez v3, :cond_2c

    .line 835
    new-instance v3, Lcom/alibaba/fastjson/JSONPathException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "illeal jsonpath syntax. "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 838
    :cond_2c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 839
    .local v0, "buf":Ljava/lang/StringBuilder;
    :goto_31
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v3

    if-nez v3, :cond_49

    .line 840
    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    if-ne v3, v4, :cond_65

    .line 841
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 842
    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 843
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v3

    if-eqz v3, :cond_61

    .line 858
    :cond_49
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v3

    if-eqz v3, :cond_5c

    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-static {v3}, Lcom/alibaba/fastjson/util/IOUtils;->isIdent(C)Z

    move-result v3

    if-eqz v3, :cond_5c

    .line 859
    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 862
    :cond_5c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 864
    .local v2, "propertyName":Ljava/lang/String;
    return-object v2

    .line 846
    .end local v2    # "propertyName":Ljava/lang/String;
    :cond_61
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    goto :goto_31

    .line 850
    :cond_65
    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-static {v3}, Lcom/alibaba/fastjson/util/IOUtils;->isIdent(C)Z

    move-result v1

    .line 851
    .local v1, "identifierFlag":Z
    if-eqz v1, :cond_49

    .line 854
    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 855
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    goto :goto_31
.end method

.method protected readOp()Lcom/alibaba/fastjson/JSONPath$Operator;
    .registers 6

    .prologue
    const/16 v4, 0x3d

    .line 769
    const/4 v1, 0x0

    .line 770
    .local v1, "op":Lcom/alibaba/fastjson/JSONPath$Operator;
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    if-ne v2, v4, :cond_2c

    .line 771
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 772
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->EQ:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 795
    :cond_c
    :goto_c
    if-nez v1, :cond_2b

    .line 796
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    move-result-object v0

    .line 798
    .local v0, "name":Ljava/lang/String;
    const-string v2, "not"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8e

    .line 799
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 801
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    move-result-object v0

    .line 803
    const-string v2, "like"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_67

    .line 804
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    .line 828
    .end local v0    # "name":Ljava/lang/String;
    :cond_2b
    :goto_2b
    return-object v1

    .line 773
    :cond_2c
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x21

    if-ne v2, v3, :cond_3b

    .line 774
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 775
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 776
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->NE:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_c

    .line 777
    :cond_3b
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x3c

    if-ne v2, v3, :cond_51

    .line 778
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 779
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    if-ne v2, v4, :cond_4e

    .line 780
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 781
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->LE:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_c

    .line 783
    :cond_4e
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->LT:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_c

    .line 785
    :cond_51
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x3e

    if-ne v2, v3, :cond_c

    .line 786
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 787
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    if-ne v2, v4, :cond_64

    .line 788
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 789
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->GE:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_c

    .line 791
    :cond_64
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->GT:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_c

    .line 805
    .restart local v0    # "name":Ljava/lang/String;
    :cond_67
    const-string v2, "rlike"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_72

    .line 806
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_RLIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_2b

    .line 807
    :cond_72
    const-string v2, "in"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7d

    .line 808
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_2b

    .line 809
    :cond_7d
    const-string v2, "between"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_88

    .line 810
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->NOT_BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_2b

    .line 812
    :cond_88
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v2}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v2

    .line 815
    :cond_8e
    const-string v2, "like"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_99

    .line 816
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->LIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_2b

    .line 817
    :cond_99
    const-string v2, "rlike"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a4

    .line 818
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->RLIKE:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto :goto_2b

    .line 819
    :cond_a4
    const-string v2, "in"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_b0

    .line 820
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->IN:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto/16 :goto_2b

    .line 821
    :cond_b0
    const-string v2, "between"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_bc

    .line 822
    sget-object v1, Lcom/alibaba/fastjson/JSONPath$Operator;->BETWEEN:Lcom/alibaba/fastjson/JSONPath$Operator;

    goto/16 :goto_2b

    .line 824
    :cond_bc
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v2}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v2
.end method

.method readSegement()Lcom/alibaba/fastjson/JSONPath$Segement;
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 335
    iget v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    if-nez v2, :cond_43

    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v4, :cond_43

    .line 336
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-static {v2}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isDigitFirst(C)Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 337
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    add-int/lit8 v0, v2, -0x30

    .line 338
    .local v0, "index":I
    new-instance v2, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;

    invoke-direct {v2, v0}, Lcom/alibaba/fastjson/JSONPath$ArrayAccessSegement;-><init>(I)V

    .line 399
    .end local v0    # "index":I
    :goto_1e
    return-object v2

    .line 339
    :cond_1f
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x61

    if-lt v2, v3, :cond_2b

    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x7a

    if-le v2, v3, :cond_37

    :cond_2b
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x41

    if-lt v2, v3, :cond_43

    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x5a

    if-gt v2, v3, :cond_43

    .line 340
    :cond_37
    new-instance v2, Lcom/alibaba/fastjson/JSONPath$PropertySegement;

    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-static {v3}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/alibaba/fastjson/JSONPath$PropertySegement;-><init>(Ljava/lang/String;)V

    goto :goto_1e

    .line 343
    :cond_43
    :goto_43
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v2

    if-nez v2, :cond_e1

    .line 344
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 346
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x24

    if-ne v2, v3, :cond_56

    .line 347
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    goto :goto_43

    .line 351
    :cond_56
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x2e

    if-eq v2, v3, :cond_62

    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x2f

    if-ne v2, v3, :cond_c0

    .line 352
    :cond_62
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 353
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x2a

    if-ne v2, v3, :cond_77

    .line 354
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v2

    if-nez v2, :cond_74

    .line 355
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 358
    :cond_74
    sget-object v2, Lcom/alibaba/fastjson/JSONPath$WildCardSegement;->instance:Lcom/alibaba/fastjson/JSONPath$WildCardSegement;

    goto :goto_1e

    .line 361
    :cond_77
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-static {v2}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isDigitFirst(C)Z

    move-result v2

    if-eqz v2, :cond_85

    .line 362
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->parseArrayAccess(Z)Lcom/alibaba/fastjson/JSONPath$Segement;

    move-result-object v2

    goto :goto_1e

    .line 365
    :cond_85
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    move-result-object v1

    .line 366
    .local v1, "propertyName":Ljava/lang/String;
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x28

    if-ne v2, v3, :cond_b9

    .line 367
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 368
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x29

    if-ne v2, v3, :cond_b3

    .line 369
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v2

    if-nez v2, :cond_a1

    .line 370
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 373
    :cond_a1
    const-string v2, "size"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_ad

    .line 374
    sget-object v2, Lcom/alibaba/fastjson/JSONPath$SizeSegement;->instance:Lcom/alibaba/fastjson/JSONPath$SizeSegement;

    goto/16 :goto_1e

    .line 377
    :cond_ad
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v2}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v2

    .line 380
    :cond_b3
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v2}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v2

    .line 383
    :cond_b9
    new-instance v2, Lcom/alibaba/fastjson/JSONPath$PropertySegement;

    invoke-direct {v2, v1}, Lcom/alibaba/fastjson/JSONPath$PropertySegement;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1e

    .line 386
    .end local v1    # "propertyName":Ljava/lang/String;
    :cond_c0
    iget-char v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v3, 0x5b

    if-ne v2, v3, :cond_cc

    .line 387
    invoke-virtual {p0, v4}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->parseArrayAccess(Z)Lcom/alibaba/fastjson/JSONPath$Segement;

    move-result-object v2

    goto/16 :goto_1e

    .line 390
    :cond_cc
    iget v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->level:I

    if-nez v2, :cond_db

    .line 391
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    move-result-object v1

    .line 393
    .restart local v1    # "propertyName":Ljava/lang/String;
    new-instance v2, Lcom/alibaba/fastjson/JSONPath$PropertySegement;

    invoke-direct {v2, v1}, Lcom/alibaba/fastjson/JSONPath$PropertySegement;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1e

    .line 396
    .end local v1    # "propertyName":Ljava/lang/String;
    :cond_db
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v2}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v2

    .line 399
    :cond_e1
    const/4 v2, 0x0

    goto/16 :goto_1e
.end method

.method readString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 868
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    .line 869
    .local v1, "quoate":C
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    .line 871
    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    add-int/lit8 v0, v3, -0x1

    .line 872
    .local v0, "beginIndex":I
    :goto_9
    iget-char v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    if-eq v3, v1, :cond_17

    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v3

    if-nez v3, :cond_17

    .line 873
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    goto :goto_9

    .line 876
    :cond_17
    iget-object v4, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isEOF()Z

    move-result v3

    if-eqz v3, :cond_29

    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    :goto_21
    invoke-virtual {v4, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 878
    .local v2, "strValue":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->accept(C)V

    .line 880
    return-object v2

    .line 876
    .end local v2    # "strValue":Ljava/lang/String;
    :cond_29
    iget v3, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->pos:I

    add-int/lit8 v3, v3, -0x1

    goto :goto_21
.end method

.method protected readValue()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 741
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->skipWhitespace()V

    .line 743
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    invoke-static {v1}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->isDigitFirst(C)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 744
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readLongValue()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 755
    :goto_13
    return-object v1

    .line 747
    :cond_14
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v2, 0x22

    if-eq v1, v2, :cond_20

    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v2, 0x27

    if-ne v1, v2, :cond_25

    .line 748
    :cond_20
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readString()Ljava/lang/String;

    move-result-object v1

    goto :goto_13

    .line 751
    :cond_25
    iget-char v1, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v2, 0x6e

    if-ne v1, v2, :cond_41

    .line 752
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->readName()Ljava/lang/String;

    move-result-object v0

    .line 754
    .local v0, "name":Ljava/lang/String;
    const-string v1, "null"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_39

    .line 755
    const/4 v1, 0x0

    goto :goto_13

    .line 757
    :cond_39
    new-instance v1, Lcom/alibaba/fastjson/JSONPathException;

    iget-object v2, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->path:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONPathException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 761
    .end local v0    # "name":Ljava/lang/String;
    :cond_41
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v1
.end method

.method public final skipWhitespace()V
    .registers 4

    .prologue
    const/16 v2, 0x20

    .line 404
    :goto_2
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    if-gt v0, v2, :cond_2c

    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    if-eq v0, v2, :cond_28

    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v1, 0xd

    if-eq v0, v1, :cond_28

    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v1, 0xa

    if-eq v0, v1, :cond_28

    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v1, 0x9

    if-eq v0, v1, :cond_28

    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v1, 0xc

    if-eq v0, v1, :cond_28

    iget-char v0, p0, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->ch:C

    const/16 v1, 0x8

    if-ne v0, v1, :cond_2c

    .line 405
    :cond_28
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONPath$JSONPathParser;->next()V

    goto :goto_2

    .line 411
    :cond_2c
    return-void
.end method
