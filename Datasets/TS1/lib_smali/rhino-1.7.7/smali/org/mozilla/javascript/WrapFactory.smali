.class public Lorg/mozilla/javascript/WrapFactory;
.super Ljava/lang/Object;
.source "WrapFactory.java"


# instance fields
.field private javaPrimitiveWrap:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/WrapFactory;->javaPrimitiveWrap:Z

    return-void
.end method


# virtual methods
.method public final isJavaPrimitiveWrap()Z
    .registers 2

    .prologue
    .line 150
    iget-boolean v0, p0, Lorg/mozilla/javascript/WrapFactory;->javaPrimitiveWrap:Z

    return v0
.end method

.method public final setJavaPrimitiveWrap(Z)V
    .registers 4
    .param p1, "value"    # Z

    .prologue
    .line 158
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 159
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    if-eqz v0, :cond_f

    invoke-virtual {v0}, Lorg/mozilla/javascript/Context;->isSealed()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 160
    invoke-static {}, Lorg/mozilla/javascript/Context;->onSealedMutation()V

    .line 162
    :cond_f
    iput-boolean p1, p0, Lorg/mozilla/javascript/WrapFactory;->javaPrimitiveWrap:Z

    .line 163
    return-void
.end method

.method public wrap(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 47
    .local p4, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-eqz p3, :cond_a

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p3, v1, :cond_a

    instance-of v1, p3, Lorg/mozilla/javascript/Scriptable;

    if-eqz v1, :cond_b

    .line 72
    .end local p3    # "obj":Ljava/lang/Object;
    :cond_a
    :goto_a
    return-object p3

    .line 52
    .restart local p3    # "obj":Ljava/lang/Object;
    :cond_b
    if-eqz p4, :cond_29

    invoke-virtual {p4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 53
    sget-object v1, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne p4, v1, :cond_1a

    .line 54
    sget-object p3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_a

    .line 55
    :cond_1a
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne p4, v1, :cond_a

    .line 56
    check-cast p3, Ljava/lang/Character;

    .end local p3    # "obj":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Character;->charValue()C

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    goto :goto_a

    .line 59
    .restart local p3    # "obj":Ljava/lang/Object;
    :cond_29
    invoke-virtual {p0}, Lorg/mozilla/javascript/WrapFactory;->isJavaPrimitiveWrap()Z

    move-result v1

    if-nez v1, :cond_4a

    .line 60
    instance-of v1, p3, Ljava/lang/String;

    if-nez v1, :cond_a

    instance-of v1, p3, Ljava/lang/Number;

    if-nez v1, :cond_a

    instance-of v1, p3, Ljava/lang/Boolean;

    if-nez v1, :cond_a

    .line 64
    instance-of v1, p3, Ljava/lang/Character;

    if-eqz v1, :cond_4a

    .line 65
    check-cast p3, Ljava/lang/Character;

    .end local p3    # "obj":Ljava/lang/Object;
    invoke-virtual {p3}, Ljava/lang/Character;->charValue()C

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object p3

    goto :goto_a

    .line 68
    .restart local p3    # "obj":Ljava/lang/Object;
    :cond_4a
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 69
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_59

    .line 70
    invoke-static {p2, p3}, Lorg/mozilla/javascript/NativeJavaArray;->wrap(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/NativeJavaArray;

    move-result-object p3

    goto :goto_a

    .line 72
    :cond_59
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/mozilla/javascript/WrapFactory;->wrapAsJavaObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p3

    goto :goto_a
.end method

.method public wrapAsJavaObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "javaObject"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Object;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/mozilla/javascript/Scriptable;"
        }
    .end annotation

    .prologue
    .line 115
    .local p4, "staticType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lorg/mozilla/javascript/NativeJavaObject;

    invoke-direct {v0, p2, p3, p4}, Lorg/mozilla/javascript/NativeJavaObject;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)V

    return-object v0
.end method

.method public wrapJavaClass(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/mozilla/javascript/Context;",
            "Lorg/mozilla/javascript/Scriptable;",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/mozilla/javascript/Scriptable;"
        }
    .end annotation

    .prologue
    .line 134
    .local p3, "javaClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lorg/mozilla/javascript/NativeJavaClass;

    invoke-direct {v0, p2, p3}, Lorg/mozilla/javascript/NativeJavaClass;-><init>(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V

    return-object v0
.end method

.method public wrapNewObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 84
    instance-of v1, p3, Lorg/mozilla/javascript/Scriptable;

    if-eqz v1, :cond_7

    .line 85
    check-cast p3, Lorg/mozilla/javascript/Scriptable;

    .line 91
    .end local p3    # "obj":Ljava/lang/Object;
    :goto_6
    return-object p3

    .line 87
    .restart local p3    # "obj":Ljava/lang/Object;
    :cond_7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 88
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_16

    .line 89
    invoke-static {p2, p3}, Lorg/mozilla/javascript/NativeJavaArray;->wrap(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/NativeJavaArray;

    move-result-object p3

    goto :goto_6

    .line 91
    :cond_16
    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, p3, v1}, Lorg/mozilla/javascript/WrapFactory;->wrapAsJavaObject(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;Ljava/lang/Class;)Lorg/mozilla/javascript/Scriptable;

    move-result-object p3

    goto :goto_6
.end method
