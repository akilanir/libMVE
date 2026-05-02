.class public Lorg/mozilla/javascript/JavaScriptException;
.super Lorg/mozilla/javascript/RhinoException;
.source "JavaScriptException.java"


# static fields
.field static final serialVersionUID:J = -0x6a639115d68db9edL


# instance fields
.field private value:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 29
    const-string v0, ""

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/mozilla/javascript/JavaScriptException;-><init>(Ljava/lang/Object;Ljava/lang/String;I)V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/String;I)V
    .registers 7
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "sourceName"    # Ljava/lang/String;
    .param p3, "lineNumber"    # I

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/mozilla/javascript/RhinoException;-><init>()V

    .line 39
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, p2, p3, v1, v2}, Lorg/mozilla/javascript/JavaScriptException;->recordErrorOrigin(Ljava/lang/String;ILjava/lang/String;I)V

    .line 40
    iput-object p1, p0, Lorg/mozilla/javascript/JavaScriptException;->value:Ljava/lang/Object;

    .line 43
    instance-of v1, p1, Lorg/mozilla/javascript/NativeError;

    if-eqz v1, :cond_3e

    invoke-static {}, Lorg/mozilla/javascript/Context;->getContext()Lorg/mozilla/javascript/Context;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/Context;->hasFeature(I)Z

    move-result v1

    if-eqz v1, :cond_3e

    move-object v0, p1

    .line 45
    check-cast v0, Lorg/mozilla/javascript/NativeError;

    .line 46
    .local v0, "error":Lorg/mozilla/javascript/NativeError;
    const-string v1, "fileName"

    invoke-virtual {v0, v1, v0}, Lorg/mozilla/javascript/NativeError;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v1

    if-nez v1, :cond_2a

    .line 47
    const-string v1, "fileName"

    invoke-virtual {v0, v1, v0, p2}, Lorg/mozilla/javascript/NativeError;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 49
    :cond_2a
    const-string v1, "lineNumber"

    invoke-virtual {v0, v1, v0}, Lorg/mozilla/javascript/NativeError;->has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z

    move-result v1

    if-nez v1, :cond_3b

    .line 50
    const-string v1, "lineNumber"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v0, v2}, Lorg/mozilla/javascript/NativeError;->put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 53
    :cond_3b
    invoke-virtual {v0, p0}, Lorg/mozilla/javascript/NativeError;->setStackProvider(Lorg/mozilla/javascript/RhinoException;)V

    .line 55
    .end local v0    # "error":Lorg/mozilla/javascript/NativeError;
    :cond_3e
    return-void
.end method


# virtual methods
.method public details()Ljava/lang/String;
    .registers 3

    .prologue
    .line 60
    iget-object v1, p0, Lorg/mozilla/javascript/JavaScriptException;->value:Ljava/lang/Object;

    if-nez v1, :cond_7

    .line 61
    const-string v1, "null"

    .line 72
    :goto_6
    return-object v1

    .line 62
    :cond_7
    iget-object v1, p0, Lorg/mozilla/javascript/JavaScriptException;->value:Ljava/lang/Object;

    instance-of v1, v1, Lorg/mozilla/javascript/NativeError;

    if-eqz v1, :cond_14

    .line 63
    iget-object v1, p0, Lorg/mozilla/javascript/JavaScriptException;->value:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_6

    .line 66
    :cond_14
    :try_start_14
    iget-object v1, p0, Lorg/mozilla/javascript/JavaScriptException;->value:Ljava/lang/Object;

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_19
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_19} :catch_1b

    move-result-object v1

    goto :goto_6

    .line 67
    :catch_1b
    move-exception v0

    .line 69
    .local v0, "rte":Ljava/lang/RuntimeException;
    iget-object v1, p0, Lorg/mozilla/javascript/JavaScriptException;->value:Ljava/lang/Object;

    instance-of v1, v1, Lorg/mozilla/javascript/Scriptable;

    if-eqz v1, :cond_2b

    .line 70
    iget-object v1, p0, Lorg/mozilla/javascript/JavaScriptException;->value:Ljava/lang/Object;

    check-cast v1, Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->defaultObjectToString(Lorg/mozilla/javascript/Scriptable;)Ljava/lang/String;

    move-result-object v1

    goto :goto_6

    .line 72
    :cond_2b
    iget-object v1, p0, Lorg/mozilla/javascript/JavaScriptException;->value:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_6
.end method

.method public getLineNumber()I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 100
    invoke-virtual {p0}, Lorg/mozilla/javascript/JavaScriptException;->lineNumber()I

    move-result v0

    return v0
.end method

.method public getSourceName()Ljava/lang/String;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 91
    invoke-virtual {p0}, Lorg/mozilla/javascript/JavaScriptException;->sourceName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 82
    iget-object v0, p0, Lorg/mozilla/javascript/JavaScriptException;->value:Ljava/lang/Object;

    return-object v0
.end method
