.class public Lorg/mozilla/javascript/tools/shell/Environment;
.super Lorg/mozilla/javascript/ScriptableObject;
.source "Environment.java"


# static fields
.field static final serialVersionUID:J = -0x5fa4044c42772a9L


# instance fields
.field private thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    .line 33
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/mozilla/javascript/tools/shell/Environment;->thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;

    .line 49
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Environment;->thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;

    if-nez v0, :cond_c

    .line 50
    iput-object p0, p0, Lorg/mozilla/javascript/tools/shell/Environment;->thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;

    .line 51
    :cond_c
    return-void
.end method

.method public constructor <init>(Lorg/mozilla/javascript/ScriptableObject;)V
    .registers 5
    .param p1, "scope"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/mozilla/javascript/ScriptableObject;-><init>()V

    .line 33
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/mozilla/javascript/tools/shell/Environment;->thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;

    .line 54
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/tools/shell/Environment;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 55
    const-string v2, "Environment"

    invoke-static {p1, v2}, Lorg/mozilla/javascript/ScriptRuntime;->getTopLevelProp(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 56
    .local v0, "ctor":Ljava/lang/Object;
    if-eqz v0, :cond_23

    instance-of v2, v0, Lorg/mozilla/javascript/Scriptable;

    if-eqz v2, :cond_23

    move-object v1, v0

    .line 57
    check-cast v1, Lorg/mozilla/javascript/Scriptable;

    .line 58
    .local v1, "s":Lorg/mozilla/javascript/Scriptable;
    const-string v2, "prototype"

    invoke-interface {v1, v2, v1}, Lorg/mozilla/javascript/Scriptable;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/mozilla/javascript/Scriptable;

    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/tools/shell/Environment;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 60
    .end local v1    # "s":Lorg/mozilla/javascript/Scriptable;
    :cond_23
    return-void
.end method

.method private collectIds()[Ljava/lang/Object;
    .registers 3

    .prologue
    .line 91
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    .line 92
    .local v0, "props":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static defineClass(Lorg/mozilla/javascript/ScriptableObject;)V
    .registers 4
    .param p0, "scope"    # Lorg/mozilla/javascript/ScriptableObject;

    .prologue
    .line 37
    :try_start_0
    const-class v1, Lorg/mozilla/javascript/tools/shell/Environment;

    invoke-static {p0, v1}, Lorg/mozilla/javascript/ScriptableObject;->defineClass(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Class;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    .line 41
    return-void

    .line 38
    :catch_6
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/Error;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 72
    iget-object v1, p0, Lorg/mozilla/javascript/tools/shell/Environment;->thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;

    if-ne p0, v1, :cond_9

    .line 73
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 79
    :goto_8
    return-object v1

    .line 75
    :cond_9
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 76
    .local v0, "result":Ljava/lang/String;
    if-eqz v0, :cond_18

    .line 77
    invoke-virtual {p0}, Lorg/mozilla/javascript/tools/shell/Environment;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->toObject(Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    goto :goto_8

    .line 79
    :cond_18
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_8
.end method

.method public getAllIds()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Environment;->thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;

    if-ne p0, v0, :cond_9

    .line 105
    invoke-super {p0}, Lorg/mozilla/javascript/ScriptableObject;->getAllIds()[Ljava/lang/Object;

    move-result-object v0

    .line 106
    :goto_8
    return-object v0

    :cond_9
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/Environment;->collectIds()[Ljava/lang/Object;

    move-result-object v0

    goto :goto_8
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    const-string v0, "Environment"

    return-object v0
.end method

.method public getIds()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Environment;->thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;

    if-ne p0, v0, :cond_9

    .line 98
    invoke-super {p0}, Lorg/mozilla/javascript/ScriptableObject;->getIds()[Ljava/lang/Object;

    move-result-object v0

    .line 99
    :goto_8
    return-object v0

    :cond_9
    invoke-direct {p0}, Lorg/mozilla/javascript/tools/shell/Environment;->collectIds()[Ljava/lang/Object;

    move-result-object v0

    goto :goto_8
.end method

.method public has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 64
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Environment;->thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;

    if-ne p0, v0, :cond_9

    .line 65
    invoke-super {p0, p1, p2}, Lorg/mozilla/javascript/ScriptableObject;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    .line 67
    :goto_8
    return v0

    :cond_9
    invoke-static {p1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    goto :goto_8

    :cond_11
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 84
    iget-object v0, p0, Lorg/mozilla/javascript/tools/shell/Environment;->thePrototypeInstance:Lorg/mozilla/javascript/tools/shell/Environment;

    if-ne p0, v0, :cond_8

    .line 85
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/ScriptableObject;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 88
    :goto_7
    return-void

    .line 87
    :cond_8
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v0

    invoke-static {p3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7
.end method
