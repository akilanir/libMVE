.class Lorg/mozilla/javascript/regexp/NativeRegExpCtor;
.super Lorg/mozilla/javascript/BaseFunction;
.source "NativeRegExpCtor.java"


# static fields
.field private static final DOLLAR_ID_BASE:I = 0xc

.field private static final Id_AMPERSAND:I = 0x6

.field private static final Id_BACK_QUOTE:I = 0xa

.field private static final Id_DOLLAR_1:I = 0xd

.field private static final Id_DOLLAR_2:I = 0xe

.field private static final Id_DOLLAR_3:I = 0xf

.field private static final Id_DOLLAR_4:I = 0x10

.field private static final Id_DOLLAR_5:I = 0x11

.field private static final Id_DOLLAR_6:I = 0x12

.field private static final Id_DOLLAR_7:I = 0x13

.field private static final Id_DOLLAR_8:I = 0x14

.field private static final Id_DOLLAR_9:I = 0x15

.field private static final Id_PLUS:I = 0x8

.field private static final Id_QUOTE:I = 0xc

.field private static final Id_STAR:I = 0x2

.field private static final Id_UNDERSCORE:I = 0x4

.field private static final Id_input:I = 0x3

.field private static final Id_lastMatch:I = 0x5

.field private static final Id_lastParen:I = 0x7

.field private static final Id_leftContext:I = 0x9

.field private static final Id_multiline:I = 0x1

.field private static final Id_rightContext:I = 0xb

.field private static final MAX_INSTANCE_ID:I = 0x15

.field static final serialVersionUID:J = -0x4f90e148c40815ceL


# instance fields
.field private inputAttr:I

.field private multilineAttr:I

.field private starAttr:I

.field private underscoreAttr:I


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x4

    .line 29
    invoke-direct {p0}, Lorg/mozilla/javascript/BaseFunction;-><init>()V

    .line 331
    iput v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->multilineAttr:I

    .line 332
    iput v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->starAttr:I

    .line 333
    iput v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->inputAttr:I

    .line 334
    iput v0, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->underscoreAttr:I

    .line 30
    return-void
.end method

.method private static getImpl()Lorg/mozilla/javascript/regexp/RegExpImpl;
    .registers 2

    .prologue
    .line 71
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 72
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->getRegExpProxy(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/RegExpProxy;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/regexp/RegExpImpl;

    return-object v1
.end method


# virtual methods
.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 52
    array-length v0, p4

    if-lez v0, :cond_17

    aget-object v0, p4, v2

    instance-of v0, v0, Lorg/mozilla/javascript/regexp/NativeRegExp;

    if-eqz v0, :cond_17

    array-length v0, p4

    if-eq v0, v1, :cond_14

    aget-object v0, p4, v1

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v0, v1, :cond_17

    .line 55
    :cond_14
    aget-object v0, p4, v2

    .line 57
    :goto_16
    return-object v0

    :cond_17
    invoke-virtual {p0, p1, p2, p4}, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    goto :goto_16
.end method

.method public construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 63
    new-instance v0, Lorg/mozilla/javascript/regexp/NativeRegExp;

    invoke-direct {v0}, Lorg/mozilla/javascript/regexp/NativeRegExp;-><init>()V

    .line 64
    .local v0, "re":Lorg/mozilla/javascript/regexp/NativeRegExp;
    invoke-virtual {v0, p1, p2, p3}, Lorg/mozilla/javascript/regexp/NativeRegExp;->compile(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    .line 65
    sget-object v1, Lorg/mozilla/javascript/TopLevel$Builtins;->RegExp:Lorg/mozilla/javascript/TopLevel$Builtins;

    invoke-static {v0, p2, v1}, Lorg/mozilla/javascript/ScriptRuntime;->setBuiltinProtoAndParent(Lorg/mozilla/javascript/ScriptableObject;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/TopLevel$Builtins;)V

    .line 66
    return-object v0
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .registers 9
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v6, 0x24

    const/4 v5, 0x0

    .line 121
    const/4 v3, 0x0

    .local v3, "id":I
    const/4 v0, 0x0

    .line 122
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    packed-switch v4, :pswitch_data_fa

    .line 149
    :cond_c
    :goto_c
    :pswitch_c
    if-eqz v0, :cond_17

    if-eq v0, p1, :cond_17

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_17

    const/4 v3, 0x0

    .line 153
    :cond_17
    :goto_17
    if-nez v3, :cond_df

    invoke-super {p0, p1}, Lorg/mozilla/javascript/BaseFunction;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v4

    .line 174
    :goto_1d
    return v4

    .line 123
    :pswitch_1e
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    sparse-switch v4, :sswitch_data_114

    goto :goto_c

    .line 124
    :sswitch_27
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/4 v3, 0x6

    goto :goto_17

    .line 125
    :sswitch_2f
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0xc

    goto :goto_17

    .line 126
    :sswitch_38
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/4 v3, 0x2

    goto :goto_17

    .line 127
    :sswitch_40
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0x8

    goto :goto_17

    .line 128
    :sswitch_49
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0xd

    goto :goto_17

    .line 129
    :sswitch_52
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0xe

    goto :goto_17

    .line 130
    :sswitch_5b
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0xf

    goto :goto_17

    .line 131
    :sswitch_64
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0x10

    goto :goto_17

    .line 132
    :sswitch_6d
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0x11

    goto :goto_17

    .line 133
    :sswitch_76
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0x12

    goto :goto_17

    .line 134
    :sswitch_7f
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0x13

    goto :goto_17

    .line 135
    :sswitch_88
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0x14

    goto :goto_17

    .line 136
    :sswitch_91
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0x15

    goto/16 :goto_17

    .line 137
    :sswitch_9b
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/4 v3, 0x4

    goto/16 :goto_17

    .line 138
    :sswitch_a4
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne v4, v6, :cond_c

    const/16 v3, 0xa

    goto/16 :goto_17

    .line 140
    :pswitch_ae
    const-string v0, "input"

    const/4 v3, 0x3

    goto/16 :goto_c

    .line 141
    :pswitch_b3
    const/4 v4, 0x4

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 142
    .local v2, "c":I
    const/16 v4, 0x4d

    if-ne v2, v4, :cond_c1

    const-string v0, "lastMatch"

    const/4 v3, 0x5

    goto/16 :goto_c

    .line 143
    :cond_c1
    const/16 v4, 0x50

    if-ne v2, v4, :cond_ca

    const-string v0, "lastParen"

    const/4 v3, 0x7

    goto/16 :goto_c

    .line 144
    :cond_ca
    const/16 v4, 0x69

    if-ne v2, v4, :cond_c

    const-string v0, "multiline"

    const/4 v3, 0x1

    goto/16 :goto_c

    .line 146
    .end local v2    # "c":I
    :pswitch_d3
    const-string v0, "leftContext"

    const/16 v3, 0x9

    goto/16 :goto_c

    .line 147
    :pswitch_d9
    const-string v0, "rightContext"

    const/16 v3, 0xb

    goto/16 :goto_c

    .line 156
    :cond_df
    packed-switch v3, :pswitch_data_152

    .line 170
    const/4 v1, 0x5

    .line 174
    .local v1, "attr":I
    :goto_e3
    invoke-super {p0}, Lorg/mozilla/javascript/BaseFunction;->getMaxInstanceId()I

    move-result v4

    add-int/2addr v4, v3

    invoke-static {v1, v4}, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->instanceIdInfo(II)I

    move-result v4

    goto/16 :goto_1d

    .line 158
    .end local v1    # "attr":I
    :pswitch_ee
    iget v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->multilineAttr:I

    .line 159
    .restart local v1    # "attr":I
    goto :goto_e3

    .line 161
    .end local v1    # "attr":I
    :pswitch_f1
    iget v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->starAttr:I

    .line 162
    .restart local v1    # "attr":I
    goto :goto_e3

    .line 164
    .end local v1    # "attr":I
    :pswitch_f4
    iget v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->inputAttr:I

    .line 165
    .restart local v1    # "attr":I
    goto :goto_e3

    .line 167
    .end local v1    # "attr":I
    :pswitch_f7
    iget v1, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->underscoreAttr:I

    .line 168
    .restart local v1    # "attr":I
    goto :goto_e3

    .line 122
    :pswitch_data_fa
    .packed-switch 0x2
        :pswitch_1e
        :pswitch_c
        :pswitch_c
        :pswitch_ae
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_b3
        :pswitch_c
        :pswitch_d3
        :pswitch_d9
    .end packed-switch

    .line 123
    :sswitch_data_114
    .sparse-switch
        0x26 -> :sswitch_27
        0x27 -> :sswitch_2f
        0x2a -> :sswitch_38
        0x2b -> :sswitch_40
        0x31 -> :sswitch_49
        0x32 -> :sswitch_52
        0x33 -> :sswitch_5b
        0x34 -> :sswitch_64
        0x35 -> :sswitch_6d
        0x36 -> :sswitch_76
        0x37 -> :sswitch_7f
        0x38 -> :sswitch_88
        0x39 -> :sswitch_91
        0x5f -> :sswitch_9b
        0x60 -> :sswitch_a4
    .end sparse-switch

    .line 156
    :pswitch_data_152
    .packed-switch 0x1
        :pswitch_ee
        :pswitch_f1
        :pswitch_f4
        :pswitch_f7
    .end packed-switch
.end method

.method public getArity()I
    .registers 2

    .prologue
    .line 45
    const/4 v0, 0x2

    return v0
.end method

.method public getFunctionName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    const-string v0, "RegExp"

    return-object v0
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .registers 8
    .param p1, "id"    # I

    .prologue
    const/4 v5, 0x1

    .line 182
    invoke-super {p0}, Lorg/mozilla/javascript/BaseFunction;->getMaxInstanceId()I

    move-result v3

    sub-int v1, p1, v3

    .line 183
    .local v1, "shifted":I
    if-gt v5, v1, :cond_4b

    const/16 v3, 0x15

    if-gt v1, v3, :cond_4b

    .line 184
    packed-switch v1, :pswitch_data_50

    .line 204
    add-int/lit8 v3, v1, -0xc

    add-int/lit8 v2, v3, -0x1

    .line 205
    .local v2, "substring_number":I
    const/4 v3, 0x2

    new-array v0, v3, [C

    const/4 v3, 0x0

    const/16 v4, 0x24

    aput-char v4, v0, v3

    add-int/lit8 v3, v2, 0x31

    int-to-char v3, v3

    aput-char v3, v0, v5

    .line 206
    .local v0, "buf":[C
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v0}, Ljava/lang/String;-><init>([C)V

    .line 208
    .end local v0    # "buf":[C
    .end local v2    # "substring_number":I
    :goto_26
    return-object v3

    .line 185
    :pswitch_27
    const-string v3, "multiline"

    goto :goto_26

    .line 186
    :pswitch_2a
    const-string v3, "$*"

    goto :goto_26

    .line 188
    :pswitch_2d
    const-string v3, "input"

    goto :goto_26

    .line 189
    :pswitch_30
    const-string v3, "$_"

    goto :goto_26

    .line 191
    :pswitch_33
    const-string v3, "lastMatch"

    goto :goto_26

    .line 192
    :pswitch_36
    const-string v3, "$&"

    goto :goto_26

    .line 194
    :pswitch_39
    const-string v3, "lastParen"

    goto :goto_26

    .line 195
    :pswitch_3c
    const-string v3, "$+"

    goto :goto_26

    .line 197
    :pswitch_3f
    const-string v3, "leftContext"

    goto :goto_26

    .line 198
    :pswitch_42
    const-string v3, "$`"

    goto :goto_26

    .line 200
    :pswitch_45
    const-string v3, "rightContext"

    goto :goto_26

    .line 201
    :pswitch_48
    const-string v3, "$\'"

    goto :goto_26

    .line 208
    :cond_4b
    invoke-super {p0, p1}, Lorg/mozilla/javascript/BaseFunction;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_26

    .line 184
    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_27
        :pswitch_2a
        :pswitch_2d
        :pswitch_30
        :pswitch_33
        :pswitch_36
        :pswitch_39
        :pswitch_3c
        :pswitch_3f
        :pswitch_42
        :pswitch_45
        :pswitch_48
    .end packed-switch
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .registers 7
    .param p1, "id"    # I

    .prologue
    .line 214
    invoke-super {p0}, Lorg/mozilla/javascript/BaseFunction;->getMaxInstanceId()I

    move-result v4

    sub-int v1, p1, v4

    .line 215
    .local v1, "shifted":I
    const/4 v4, 0x1

    if-gt v4, v1, :cond_3c

    const/16 v4, 0x15

    if-gt v1, v4, :cond_3c

    .line 216
    invoke-static {}, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->getImpl()Lorg/mozilla/javascript/regexp/RegExpImpl;

    move-result-object v0

    .line 218
    .local v0, "impl":Lorg/mozilla/javascript/regexp/RegExpImpl;
    packed-switch v1, :pswitch_data_42

    .line 251
    add-int/lit8 v4, v1, -0xc

    add-int/lit8 v3, v4, -0x1

    .line 252
    .local v3, "substring_number":I
    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/regexp/RegExpImpl;->getParenSubString(I)Lorg/mozilla/javascript/regexp/SubString;

    move-result-object v2

    .line 256
    .end local v3    # "substring_number":I
    :goto_1c
    if-nez v2, :cond_37

    const-string v4, ""

    .line 258
    .end local v0    # "impl":Lorg/mozilla/javascript/regexp/RegExpImpl;
    :goto_20
    return-object v4

    .line 221
    .restart local v0    # "impl":Lorg/mozilla/javascript/regexp/RegExpImpl;
    :pswitch_21
    iget-boolean v4, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->multiline:Z

    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v4

    goto :goto_20

    .line 225
    :pswitch_28
    iget-object v2, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->input:Ljava/lang/String;

    .line 226
    .local v2, "stringResult":Ljava/lang/String;
    goto :goto_1c

    .line 230
    .end local v2    # "stringResult":Ljava/lang/String;
    :pswitch_2b
    iget-object v2, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastMatch:Lorg/mozilla/javascript/regexp/SubString;

    .line 231
    .local v2, "stringResult":Lorg/mozilla/javascript/regexp/SubString;
    goto :goto_1c

    .line 235
    .end local v2    # "stringResult":Lorg/mozilla/javascript/regexp/SubString;
    :pswitch_2e
    iget-object v2, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->lastParen:Lorg/mozilla/javascript/regexp/SubString;

    .line 236
    .restart local v2    # "stringResult":Lorg/mozilla/javascript/regexp/SubString;
    goto :goto_1c

    .line 240
    .end local v2    # "stringResult":Lorg/mozilla/javascript/regexp/SubString;
    :pswitch_31
    iget-object v2, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->leftContext:Lorg/mozilla/javascript/regexp/SubString;

    .line 241
    .restart local v2    # "stringResult":Lorg/mozilla/javascript/regexp/SubString;
    goto :goto_1c

    .line 245
    .end local v2    # "stringResult":Lorg/mozilla/javascript/regexp/SubString;
    :pswitch_34
    iget-object v2, v0, Lorg/mozilla/javascript/regexp/RegExpImpl;->rightContext:Lorg/mozilla/javascript/regexp/SubString;

    .line 246
    .restart local v2    # "stringResult":Lorg/mozilla/javascript/regexp/SubString;
    goto :goto_1c

    .line 256
    .end local v2    # "stringResult":Lorg/mozilla/javascript/regexp/SubString;
    :cond_37
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_20

    .line 258
    .end local v0    # "impl":Lorg/mozilla/javascript/regexp/RegExpImpl;
    :cond_3c
    invoke-super {p0, p1}, Lorg/mozilla/javascript/BaseFunction;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v4

    goto :goto_20

    .line 218
    nop

    :pswitch_data_42
    .packed-switch 0x1
        :pswitch_21
        :pswitch_21
        :pswitch_28
        :pswitch_28
        :pswitch_2b
        :pswitch_2b
        :pswitch_2e
        :pswitch_2e
        :pswitch_31
        :pswitch_31
        :pswitch_34
        :pswitch_34
    .end packed-switch
.end method

.method public getLength()I
    .registers 2

    .prologue
    .line 40
    const/4 v0, 0x2

    return v0
.end method

.method protected getMaxInstanceId()I
    .registers 2

    .prologue
    .line 114
    invoke-super {p0}, Lorg/mozilla/javascript/BaseFunction;->getMaxInstanceId()I

    move-result v0

    add-int/lit8 v0, v0, 0x15

    return v0
.end method

.method protected setInstanceIdAttributes(II)V
    .registers 6
    .param p1, "id"    # I
    .param p2, "attr"    # I

    .prologue
    .line 296
    invoke-super {p0}, Lorg/mozilla/javascript/BaseFunction;->getMaxInstanceId()I

    move-result v2

    sub-int v0, p1, v2

    .line 297
    .local v0, "shifted":I
    packed-switch v0, :pswitch_data_24

    .line 322
    add-int/lit8 v2, v0, -0xc

    add-int/lit8 v1, v2, -0x1

    .line 323
    .local v1, "substring_number":I
    if-ltz v1, :cond_20

    const/16 v2, 0x8

    if-gt v1, v2, :cond_20

    .line 329
    .end local v1    # "substring_number":I
    :goto_13
    :pswitch_13
    return-void

    .line 299
    :pswitch_14
    iput p2, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->multilineAttr:I

    goto :goto_13

    .line 302
    :pswitch_17
    iput p2, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->starAttr:I

    goto :goto_13

    .line 305
    :pswitch_1a
    iput p2, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->inputAttr:I

    goto :goto_13

    .line 308
    :pswitch_1d
    iput p2, p0, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->underscoreAttr:I

    goto :goto_13

    .line 328
    .restart local v1    # "substring_number":I
    :cond_20
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/BaseFunction;->setInstanceIdAttributes(II)V

    goto :goto_13

    .line 297
    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_14
        :pswitch_17
        :pswitch_1a
        :pswitch_1d
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
    .end packed-switch
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .registers 7
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 264
    invoke-super {p0}, Lorg/mozilla/javascript/BaseFunction;->getMaxInstanceId()I

    move-result v2

    sub-int v0, p1, v2

    .line 265
    .local v0, "shifted":I
    packed-switch v0, :pswitch_data_2e

    .line 286
    add-int/lit8 v2, v0, -0xc

    add-int/lit8 v1, v2, -0x1

    .line 287
    .local v1, "substring_number":I
    if-ltz v1, :cond_2a

    const/16 v2, 0x8

    if-gt v1, v2, :cond_2a

    .line 292
    .end local v1    # "substring_number":I
    :goto_13
    :pswitch_13
    return-void

    .line 268
    :pswitch_14
    invoke-static {}, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->getImpl()Lorg/mozilla/javascript/regexp/RegExpImpl;

    move-result-object v2

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v3

    iput-boolean v3, v2, Lorg/mozilla/javascript/regexp/RegExpImpl;->multiline:Z

    goto :goto_13

    .line 273
    :pswitch_1f
    invoke-static {}, Lorg/mozilla/javascript/regexp/NativeRegExpCtor;->getImpl()Lorg/mozilla/javascript/regexp/RegExpImpl;

    move-result-object v2

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lorg/mozilla/javascript/regexp/RegExpImpl;->input:Ljava/lang/String;

    goto :goto_13

    .line 291
    .restart local v1    # "substring_number":I
    :cond_2a
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/BaseFunction;->setInstanceIdValue(ILjava/lang/Object;)V

    goto :goto_13

    .line 265
    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_14
        :pswitch_14
        :pswitch_1f
        :pswitch_1f
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
        :pswitch_13
    .end packed-switch
.end method
