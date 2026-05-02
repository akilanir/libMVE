.class public Lorg/mozilla/javascript/serialize/ScriptableInputStream;
.super Ljava/io/ObjectInputStream;
.source "ScriptableInputStream.java"


# instance fields
.field private classLoader:Ljava/lang/ClassLoader;

.field private scope:Lorg/mozilla/javascript/Scriptable;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lorg/mozilla/javascript/Scriptable;)V
    .registers 5
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    invoke-direct {p0, p1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 36
    iput-object p2, p0, Lorg/mozilla/javascript/serialize/ScriptableInputStream;->scope:Lorg/mozilla/javascript/Scriptable;

    .line 37
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/serialize/ScriptableInputStream;->enableResolveObject(Z)Z

    .line 38
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 39
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    if-eqz v0, :cond_15

    .line 40
    invoke-virtual {v0}, Lorg/mozilla/javascript/Context;->getApplicationClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    iput-object v1, p0, Lorg/mozilla/javascript/serialize/ScriptableInputStream;->classLoader:Ljava/lang/ClassLoader;

    .line 42
    :cond_15
    return-void
.end method


# virtual methods
.method protected resolveClass(Ljava/io/ObjectStreamClass;)Ljava/lang/Class;
    .registers 4
    .param p1, "desc"    # Ljava/io/ObjectStreamClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/ObjectStreamClass;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p1}, Ljava/io/ObjectStreamClass;->getName()Ljava/lang/String;

    move-result-object v0

    .line 49
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lorg/mozilla/javascript/serialize/ScriptableInputStream;->classLoader:Ljava/lang/ClassLoader;

    if-eqz v1, :cond_10

    .line 51
    :try_start_8
    iget-object v1, p0, Lorg/mozilla/javascript/serialize/ScriptableInputStream;->classLoader:Ljava/lang/ClassLoader;

    invoke-virtual {v1, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_8 .. :try_end_d} :catch_f

    move-result-object v1

    .line 56
    :goto_e
    return-object v1

    .line 52
    :catch_f
    move-exception v1

    .line 56
    :cond_10
    invoke-super {p0, p1}, Ljava/io/ObjectInputStream;->resolveClass(Ljava/io/ObjectStreamClass;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_e
.end method

.method protected resolveObject(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    instance-of v1, p1, Lorg/mozilla/javascript/serialize/ScriptableOutputStream$PendingLookup;

    if-eqz v1, :cond_39

    .line 64
    check-cast p1, Lorg/mozilla/javascript/serialize/ScriptableOutputStream$PendingLookup;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/mozilla/javascript/serialize/ScriptableOutputStream$PendingLookup;->getName()Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lorg/mozilla/javascript/serialize/ScriptableInputStream;->scope:Lorg/mozilla/javascript/Scriptable;

    invoke-static {v1, v0}, Lorg/mozilla/javascript/serialize/ScriptableOutputStream;->lookupQualifiedName(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    .line 66
    .restart local p1    # "obj":Ljava/lang/Object;
    sget-object v1, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne p1, v1, :cond_43

    .line 67
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Object "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found upon "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "deserialization."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 70
    .end local v0    # "name":Ljava/lang/String;
    :cond_39
    instance-of v1, p1, Lorg/mozilla/javascript/UniqueTag;

    if-eqz v1, :cond_44

    .line 71
    check-cast p1, Lorg/mozilla/javascript/UniqueTag;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/mozilla/javascript/UniqueTag;->readResolve()Ljava/lang/Object;

    move-result-object p1

    .line 75
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_43
    :goto_43
    return-object p1

    .line 72
    :cond_44
    instance-of v1, p1, Lorg/mozilla/javascript/Undefined;

    if-eqz v1, :cond_43

    .line 73
    check-cast p1, Lorg/mozilla/javascript/Undefined;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/mozilla/javascript/Undefined;->readResolve()Ljava/lang/Object;

    move-result-object p1

    .restart local p1    # "obj":Ljava/lang/Object;
    goto :goto_43
.end method
