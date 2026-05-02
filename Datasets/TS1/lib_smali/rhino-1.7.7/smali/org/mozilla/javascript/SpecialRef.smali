.class Lorg/mozilla/javascript/SpecialRef;
.super Lorg/mozilla/javascript/Ref;
.source "SpecialRef.java"


# static fields
.field private static final SPECIAL_NONE:I = 0x0

.field private static final SPECIAL_PARENT:I = 0x2

.field private static final SPECIAL_PROTO:I = 0x1

.field static final serialVersionUID:J = -0x686214493d5c9e97L


# instance fields
.field private name:Ljava/lang/String;

.field private target:Lorg/mozilla/javascript/Scriptable;

.field private type:I


# direct methods
.method private constructor <init>(Lorg/mozilla/javascript/Scriptable;ILjava/lang/String;)V
    .registers 4
    .param p1, "target"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "type"    # I
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-direct {p0}, Lorg/mozilla/javascript/Ref;-><init>()V

    .line 23
    iput-object p1, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    .line 24
    iput p2, p0, Lorg/mozilla/javascript/SpecialRef;->type:I

    .line 25
    iput-object p3, p0, Lorg/mozilla/javascript/SpecialRef;->name:Ljava/lang/String;

    .line 26
    return-void
.end method

.method static createSpecial(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/String;)Lorg/mozilla/javascript/Ref;
    .registers 7
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-static {p0, p2, p1}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 32
    .local v0, "target":Lorg/mozilla/javascript/Scriptable;
    if-nez v0, :cond_b

    .line 33
    invoke-static {p2, p3}, Lorg/mozilla/javascript/ScriptRuntime;->undefReadError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 37
    :cond_b
    const-string v2, "__proto__"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 38
    const/4 v1, 0x1

    .line 45
    .local v1, "type":I
    :goto_14
    const/4 v2, 0x5

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v2

    if-nez v2, :cond_1c

    .line 47
    const/4 v1, 0x0

    .line 50
    :cond_1c
    new-instance v2, Lorg/mozilla/javascript/SpecialRef;

    invoke-direct {v2, v0, v1, p3}, Lorg/mozilla/javascript/SpecialRef;-><init>(Lorg/mozilla/javascript/Scriptable;ILjava/lang/String;)V

    return-object v2

    .line 39
    .end local v1    # "type":I
    :cond_22
    const-string v2, "__parent__"

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 40
    const/4 v1, 0x2

    .restart local v1    # "type":I
    goto :goto_14

    .line 42
    .end local v1    # "type":I
    :cond_2c
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public delete(Lorg/mozilla/javascript/Context;)Z
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 124
    iget v0, p0, Lorg/mozilla/javascript/SpecialRef;->type:I

    if-nez v0, :cond_d

    .line 125
    iget-object v0, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    iget-object v1, p0, Lorg/mozilla/javascript/SpecialRef;->name:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lorg/mozilla/javascript/ScriptRuntime;->deleteObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z

    move-result v0

    .line 127
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public get(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 56
    iget v0, p0, Lorg/mozilla/javascript/SpecialRef;->type:I

    packed-switch v0, :pswitch_data_22

    .line 64
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 58
    :pswitch_a
    iget-object v0, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    iget-object v1, p0, Lorg/mozilla/javascript/SpecialRef;->name:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lorg/mozilla/javascript/ScriptRuntime;->getObjectProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v0

    .line 62
    :goto_12
    return-object v0

    .line 60
    :pswitch_13
    iget-object v0, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v0}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    goto :goto_12

    .line 62
    :pswitch_1a
    iget-object v0, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v0}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    goto :goto_12

    .line 56
    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_a
        :pswitch_13
        :pswitch_1a
    .end packed-switch
.end method

.method public has(Lorg/mozilla/javascript/Context;)Z
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 115
    iget v0, p0, Lorg/mozilla/javascript/SpecialRef;->type:I

    if-nez v0, :cond_d

    .line 116
    iget-object v0, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    iget-object v1, p0, Lorg/mozilla/javascript/SpecialRef;->name:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lorg/mozilla/javascript/ScriptRuntime;->hasObjectElem(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Z

    move-result v0

    .line 118
    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x1

    goto :goto_c
.end method

.method public set(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 71
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public set(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    .line 77
    iget v2, p0, Lorg/mozilla/javascript/SpecialRef;->type:I

    packed-switch v2, :pswitch_data_48

    .line 108
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 79
    :pswitch_b
    iget-object v2, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    iget-object v3, p0, Lorg/mozilla/javascript/SpecialRef;->name:Ljava/lang/String;

    invoke-static {v2, v3, p3, p1}, Lorg/mozilla/javascript/ScriptRuntime;->setObjectProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;Ljava/lang/Object;Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v0

    .line 105
    :goto_13
    return-object v0

    .line 83
    :pswitch_14
    invoke-static {p1, p3, p2}, Lorg/mozilla/javascript/ScriptRuntime;->toObjectOrNull(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 84
    .local v0, "obj":Lorg/mozilla/javascript/Scriptable;
    if-eqz v0, :cond_32

    .line 87
    move-object v1, v0

    .line 89
    .local v1, "search":Lorg/mozilla/javascript/Scriptable;
    :cond_1b
    iget-object v2, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    if-ne v1, v2, :cond_28

    .line 90
    const-string v2, "msg.cyclic.value"

    iget-object v3, p0, Lorg/mozilla/javascript/SpecialRef;->name:Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/mozilla/javascript/Context;->reportRuntimeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EvaluatorException;

    move-result-object v2

    throw v2

    .line 93
    :cond_28
    iget v2, p0, Lorg/mozilla/javascript/SpecialRef;->type:I

    if-ne v2, v3, :cond_3c

    .line 94
    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    .line 98
    :goto_30
    if-nez v1, :cond_1b

    .line 100
    .end local v1    # "search":Lorg/mozilla/javascript/Scriptable;
    :cond_32
    iget v2, p0, Lorg/mozilla/javascript/SpecialRef;->type:I

    if-ne v2, v3, :cond_41

    .line 101
    iget-object v2, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v2, v0}, Lorg/mozilla/javascript/Scriptable;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_13

    .line 96
    .restart local v1    # "search":Lorg/mozilla/javascript/Scriptable;
    :cond_3c
    invoke-interface {v1}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    goto :goto_30

    .line 103
    .end local v1    # "search":Lorg/mozilla/javascript/Scriptable;
    :cond_41
    iget-object v2, p0, Lorg/mozilla/javascript/SpecialRef;->target:Lorg/mozilla/javascript/Scriptable;

    invoke-interface {v2, v0}, Lorg/mozilla/javascript/Scriptable;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    goto :goto_13

    .line 77
    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_b
        :pswitch_14
        :pswitch_14
    .end packed-switch
.end method
