.class Lorg/mozilla/javascript/xmlimpl/XMLCtor;
.super Lorg/mozilla/javascript/IdFunctionObject;
.source "XMLCtor.java"


# static fields
.field private static final Id_defaultSettings:I = 0x1

.field private static final Id_ignoreComments:I = 0x1

.field private static final Id_ignoreProcessingInstructions:I = 0x2

.field private static final Id_ignoreWhitespace:I = 0x3

.field private static final Id_prettyIndent:I = 0x4

.field private static final Id_prettyPrinting:I = 0x5

.field private static final Id_setSettings:I = 0x3

.field private static final Id_settings:I = 0x2

.field private static final MAX_FUNCTION_ID:I = 0x3

.field private static final MAX_INSTANCE_ID:I = 0x5

.field private static final XMLCTOR_TAG:Ljava/lang/Object;

.field static final serialVersionUID:J = -0x78d9b94928711c7dL


# instance fields
.field private options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 15
    const-string v0, "XMLCtor"

    sput-object v0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->XMLCTOR_TAG:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;II)V
    .registers 6
    .param p1, "xml"    # Lorg/mozilla/javascript/xmlimpl/XML;
    .param p2, "tag"    # Ljava/lang/Object;
    .param p3, "id"    # I
    .param p4, "arity"    # I

    .prologue
    .line 22
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/IdFunctionObject;-><init>(Lorg/mozilla/javascript/IdFunctionCall;Ljava/lang/Object;II)V

    .line 24
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    .line 25
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->activatePrototypeMap(I)V

    .line 26
    return-void
.end method

.method private readSettings(Lorg/mozilla/javascript/Scriptable;)V
    .registers 7
    .param p1, "source"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 40
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1
    const/4 v4, 0x5

    if-gt v0, v4, :cond_2f

    .line 41
    invoke-super {p0}, Lorg/mozilla/javascript/IdFunctionObject;->getMaxInstanceId()I

    move-result v4

    add-int v1, v4, v0

    .line 42
    .local v1, "id":I
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v2

    .line 43
    .local v2, "name":Ljava/lang/String;
    invoke-static {p1, v2}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 44
    .local v3, "value":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v3, v4, :cond_19

    .line 40
    :cond_16
    :goto_16
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 47
    :cond_19
    packed-switch v0, :pswitch_data_30

    .line 62
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 52
    :pswitch_22
    instance-of v4, v3, Ljava/lang/Boolean;

    if-eqz v4, :cond_16

    .line 64
    :cond_26
    invoke-virtual {p0, v1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->setInstanceIdValue(ILjava/lang/Object;)V

    goto :goto_16

    .line 57
    :pswitch_2a
    instance-of v4, v3, Ljava/lang/Number;

    if-nez v4, :cond_26

    goto :goto_16

    .line 66
    .end local v1    # "id":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/Object;
    :cond_2f
    return-void

    .line 47
    :pswitch_data_30
    .packed-switch 0x1
        :pswitch_22
        :pswitch_22
        :pswitch_22
        :pswitch_2a
        :pswitch_22
    .end packed-switch
.end method

.method private writeSetting(Lorg/mozilla/javascript/Scriptable;)V
    .registers 7
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 30
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_1
    const/4 v4, 0x5

    if-gt v0, v4, :cond_18

    .line 31
    invoke-super {p0}, Lorg/mozilla/javascript/IdFunctionObject;->getMaxInstanceId()I

    move-result v4

    add-int v1, v4, v0

    .line 32
    .local v1, "id":I
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v2

    .line 33
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v3

    .line 34
    .local v3, "value":Ljava/lang/Object;
    invoke-static {p1, v2, v3}, Lorg/mozilla/javascript/ScriptableObject;->putProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 36
    .end local v1    # "id":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/Object;
    :cond_18
    return-void
.end method


# virtual methods
.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    const/4 v4, 0x0

    .line 218
    sget-object v2, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->XMLCTOR_TAG:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    .line 219
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/IdFunctionObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 243
    :goto_d
    return-object v1

    .line 221
    :cond_e
    invoke-virtual {p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v0

    .line 222
    .local v0, "id":I
    packed-switch v0, :pswitch_data_58

    .line 246
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 224
    :pswitch_1f
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setDefault()V

    .line 225
    invoke-virtual {p2, p3}, Lorg/mozilla/javascript/Context;->newObject(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 226
    .local v1, "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->writeSetting(Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_d

    .line 230
    .end local v1    # "obj":Lorg/mozilla/javascript/Scriptable;
    :pswitch_2c
    invoke-virtual {p2, p3}, Lorg/mozilla/javascript/Context;->newObject(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 231
    .restart local v1    # "obj":Lorg/mozilla/javascript/Scriptable;
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->writeSetting(Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_d

    .line 235
    .end local v1    # "obj":Lorg/mozilla/javascript/Scriptable;
    :pswitch_34
    array-length v2, p5

    if-eqz v2, :cond_41

    aget-object v2, p5, v4

    if-eqz v2, :cond_41

    aget-object v2, p5, v4

    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne v2, v3, :cond_49

    .line 239
    :cond_41
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setDefault()V

    .line 243
    :cond_46
    :goto_46
    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_d

    .line 240
    :cond_49
    aget-object v2, p5, v4

    instance-of v2, v2, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_46

    .line 241
    aget-object v2, p5, v4

    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->readSettings(Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_46

    .line 222
    nop

    :pswitch_data_58
    .packed-switch 0x1
        :pswitch_1f
        :pswitch_2c
        :pswitch_34
    .end packed-switch
.end method

.method protected findInstanceIdInfo(Ljava/lang/String;)I
    .registers 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 89
    const/4 v3, 0x0

    .local v3, "id":I
    const/4 v0, 0x0

    .line 90
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sparse-switch v4, :sswitch_data_50

    .line 99
    :cond_9
    :goto_9
    if-eqz v0, :cond_14

    if-eq v0, p1, :cond_14

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_14

    const/4 v3, 0x0

    .line 104
    :cond_14
    if-nez v3, :cond_3c

    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdFunctionObject;->findInstanceIdInfo(Ljava/lang/String;)I

    move-result v4

    .line 117
    :goto_1a
    return v4

    .line 91
    :sswitch_1b
    const-string v0, "prettyIndent"

    const/4 v3, 0x4

    goto :goto_9

    .line 92
    :sswitch_1f
    const/4 v4, 0x0

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 93
    .local v2, "c":I
    const/16 v4, 0x69

    if-ne v2, v4, :cond_2c

    const-string v0, "ignoreComments"

    const/4 v3, 0x1

    goto :goto_9

    .line 94
    :cond_2c
    const/16 v4, 0x70

    if-ne v2, v4, :cond_9

    const-string v0, "prettyPrinting"

    const/4 v3, 0x5

    goto :goto_9

    .line 96
    .end local v2    # "c":I
    :sswitch_34
    const-string v0, "ignoreWhitespace"

    const/4 v3, 0x3

    goto :goto_9

    .line 97
    :sswitch_38
    const-string v0, "ignoreProcessingInstructions"

    const/4 v3, 0x2

    goto :goto_9

    .line 107
    :cond_3c
    packed-switch v3, :pswitch_data_62

    .line 115
    new-instance v4, Ljava/lang/IllegalStateException;

    invoke-direct {v4}, Ljava/lang/IllegalStateException;-><init>()V

    throw v4

    .line 113
    :pswitch_45
    const/4 v1, 0x6

    .line 117
    .local v1, "attr":I
    invoke-super {p0}, Lorg/mozilla/javascript/IdFunctionObject;->getMaxInstanceId()I

    move-result v4

    add-int/2addr v4, v3

    invoke-static {v1, v4}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->instanceIdInfo(II)I

    move-result v4

    goto :goto_1a

    .line 90
    :sswitch_data_50
    .sparse-switch
        0xc -> :sswitch_1b
        0xe -> :sswitch_1f
        0x10 -> :sswitch_34
        0x1c -> :sswitch_38
    .end sparse-switch

    .line 107
    :pswitch_data_62
    .packed-switch 0x1
        :pswitch_45
        :pswitch_45
        :pswitch_45
        :pswitch_45
        :pswitch_45
    .end packed-switch
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 187
    const/4 v1, 0x0

    .local v1, "id":I
    const/4 v0, 0x0

    .line 188
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 189
    .local v2, "s_length":I
    const/16 v3, 0x8

    if-ne v2, v3, :cond_19

    const-string v0, "settings"

    const/4 v1, 0x2

    .line 192
    :cond_d
    :goto_d
    if-eqz v0, :cond_18

    if-eq v0, p1, :cond_18

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_18

    const/4 v1, 0x0

    .line 196
    :cond_18
    return v1

    .line 190
    :cond_19
    const/16 v3, 0xb

    if-ne v2, v3, :cond_21

    const-string v0, "setSettings"

    const/4 v1, 0x3

    goto :goto_d

    .line 191
    :cond_21
    const/16 v3, 0xf

    if-ne v2, v3, :cond_d

    const-string v0, "defaultSettings"

    const/4 v1, 0x1

    goto :goto_d
.end method

.method protected getInstanceIdName(I)Ljava/lang/String;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 125
    invoke-super {p0}, Lorg/mozilla/javascript/IdFunctionObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    packed-switch v0, :pswitch_data_1e

    .line 132
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdFunctionObject;->getInstanceIdName(I)Ljava/lang/String;

    move-result-object v0

    :goto_d
    return-object v0

    .line 126
    :pswitch_e
    const-string v0, "ignoreComments"

    goto :goto_d

    .line 127
    :pswitch_11
    const-string v0, "ignoreProcessingInstructions"

    goto :goto_d

    .line 128
    :pswitch_14
    const-string v0, "ignoreWhitespace"

    goto :goto_d

    .line 129
    :pswitch_17
    const-string v0, "prettyIndent"

    goto :goto_d

    .line 130
    :pswitch_1a
    const-string v0, "prettyPrinting"

    goto :goto_d

    .line 125
    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_e
        :pswitch_11
        :pswitch_14
        :pswitch_17
        :pswitch_1a
    .end packed-switch
.end method

.method protected getInstanceIdValue(I)Ljava/lang/Object;
    .registers 3
    .param p1, "id"    # I

    .prologue
    .line 138
    invoke-super {p0}, Lorg/mozilla/javascript/IdFunctionObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    packed-switch v0, :pswitch_data_46

    .line 150
    invoke-super {p0, p1}, Lorg/mozilla/javascript/IdFunctionObject;->getInstanceIdValue(I)Ljava/lang/Object;

    move-result-object v0

    :goto_d
    return-object v0

    .line 140
    :pswitch_e
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->isIgnoreComments()Z

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_d

    .line 142
    :pswitch_19
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->isIgnoreProcessingInstructions()Z

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_d

    .line 144
    :pswitch_24
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->isIgnoreWhitespace()Z

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_d

    .line 146
    :pswitch_2f
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->getPrettyIndent()I

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_d

    .line 148
    :pswitch_3a
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->isPrettyPrinting()Z

    move-result v0

    invoke-static {v0}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_d

    .line 138
    nop

    :pswitch_data_46
    .packed-switch 0x1
        :pswitch_e
        :pswitch_19
        :pswitch_24
        :pswitch_2f
        :pswitch_3a
    .end packed-switch
.end method

.method protected getMaxInstanceId()I
    .registers 2

    .prologue
    .line 82
    invoke-super {p0}, Lorg/mozilla/javascript/IdFunctionObject;->getMaxInstanceId()I

    move-result v0

    add-int/lit8 v0, v0, 0x5

    return v0
.end method

.method public hasInstance(Lorg/mozilla/javascript/Scriptable;)Z
    .registers 3
    .param p1, "instance"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 254
    instance-of v0, p1, Lorg/mozilla/javascript/xmlimpl/XML;

    if-nez v0, :cond_8

    instance-of v0, p1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method protected initPrototypeId(I)V
    .registers 6
    .param p1, "id"    # I

    .prologue
    .line 205
    packed-switch p1, :pswitch_data_1e

    .line 209
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 206
    :pswitch_d
    const/4 v0, 0x0

    .local v0, "arity":I
    const-string v1, "defaultSettings"

    .line 211
    .local v1, "s":Ljava/lang/String;
    :goto_10
    sget-object v2, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->XMLCTOR_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v2, p1, v1, v0}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    .line 212
    return-void

    .line 207
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_16
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v1, "settings"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 208
    .end local v0    # "arity":I
    .end local v1    # "s":Ljava/lang/String;
    :pswitch_1a
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v1, "setSettings"

    .restart local v1    # "s":Ljava/lang/String;
    goto :goto_10

    .line 205
    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_d
        :pswitch_16
        :pswitch_1a
    .end packed-switch
.end method

.method protected setInstanceIdValue(ILjava/lang/Object;)V
    .registers 5
    .param p1, "id"    # I
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 155
    invoke-super {p0}, Lorg/mozilla/javascript/IdFunctionObject;->getMaxInstanceId()I

    move-result v0

    sub-int v0, p1, v0

    packed-switch v0, :pswitch_data_40

    .line 172
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/IdFunctionObject;->setInstanceIdValue(ILjava/lang/Object;)V

    .line 173
    :goto_c
    return-void

    .line 157
    :pswitch_d
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setIgnoreComments(Z)V

    goto :goto_c

    .line 160
    :pswitch_17
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setIgnoreProcessingInstructions(Z)V

    goto :goto_c

    .line 163
    :pswitch_21
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setIgnoreWhitespace(Z)V

    goto :goto_c

    .line 166
    :pswitch_2b
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32(Ljava/lang/Object;)I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setPrettyIndent(I)V

    goto :goto_c

    .line 169
    :pswitch_35
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLCtor;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toBoolean(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setPrettyPrinting(Z)V

    goto :goto_c

    .line 155
    nop

    :pswitch_data_40
    .packed-switch 0x1
        :pswitch_d
        :pswitch_17
        :pswitch_21
        :pswitch_2b
        :pswitch_35
    .end packed-switch
.end method
