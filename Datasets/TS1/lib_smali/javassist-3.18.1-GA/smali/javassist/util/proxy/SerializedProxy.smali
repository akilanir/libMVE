.class Ljavassist/util/proxy/SerializedProxy;
.super Ljava/lang/Object;
.source "SerializedProxy.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private filterSignature:[B

.field private handler:Ljavassist/util/proxy/MethodHandler;

.field private interfaces:[Ljava/lang/String;

.field private superClass:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/Class;[BLjavassist/util/proxy/MethodHandler;)V
    .registers 11
    .param p1, "proxy"    # Ljava/lang/Class;
    .param p2, "sig"    # [B
    .param p3, "h"    # Ljavassist/util/proxy/MethodHandler;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p2, p0, Ljavassist/util/proxy/SerializedProxy;->filterSignature:[B

    .line 40
    iput-object p3, p0, Ljavassist/util/proxy/SerializedProxy;->handler:Ljavassist/util/proxy/MethodHandler;

    .line 41
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Ljavassist/util/proxy/SerializedProxy;->superClass:Ljava/lang/String;

    .line 42
    invoke-virtual {p1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v1

    .line 43
    .local v1, "infs":[Ljava/lang/Class;
    array-length v2, v1

    .line 44
    .local v2, "n":I
    add-int/lit8 v6, v2, -0x1

    new-array v6, v6, [Ljava/lang/String;

    iput-object v6, p0, Ljavassist/util/proxy/SerializedProxy;->interfaces:[Ljava/lang/String;

    .line 45
    const-class v6, Ljavassist/util/proxy/ProxyObject;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 46
    .local v4, "setterInf":Ljava/lang/String;
    const-class v6, Ljavassist/util/proxy/Proxy;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    .line 47
    .local v5, "setterInf2":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_29
    if-ge v0, v2, :cond_44

    .line 48
    aget-object v6, v1, v0

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    .line 49
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_41

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_41

    .line 50
    iget-object v6, p0, Ljavassist/util/proxy/SerializedProxy;->interfaces:[Ljava/lang/String;

    aput-object v3, v6, v0

    .line 47
    :cond_41
    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    .line 52
    .end local v3    # "name":Ljava/lang/String;
    :cond_44
    return-void
.end method


# virtual methods
.method protected loadClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 6
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 63
    :try_start_0
    new-instance v1, Ljavassist/util/proxy/SerializedProxy$1;

    invoke-direct {v1, p0, p1}, Ljavassist/util/proxy/SerializedProxy$1;-><init>(Ljavassist/util/proxy/SerializedProxy;Ljava/lang/String;)V

    invoke-static {v1}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedExceptionAction;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;
    :try_end_b
    .catch Ljava/security/PrivilegedActionException; {:try_start_0 .. :try_end_b} :catch_c

    return-object v1

    .line 70
    :catch_c
    move-exception v0

    .line 71
    .local v0, "pae":Ljava/security/PrivilegedActionException;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cannot load the class: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/security/PrivilegedActionException;->getException()Ljava/lang/Exception;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method readResolve()Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 77
    :try_start_0
    iget-object v8, p0, Ljavassist/util/proxy/SerializedProxy;->interfaces:[Ljava/lang/String;

    array-length v6, v8

    .line 78
    .local v6, "n":I
    new-array v5, v6, [Ljava/lang/Class;

    .line 79
    .local v5, "infs":[Ljava/lang/Class;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_6
    if-ge v4, v6, :cond_15

    .line 80
    iget-object v8, p0, Ljavassist/util/proxy/SerializedProxy;->interfaces:[Ljava/lang/String;

    aget-object v8, v8, v4

    invoke-virtual {p0, v8}, Ljavassist/util/proxy/SerializedProxy;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aput-object v8, v5, v4

    .line 79
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    .line 82
    :cond_15
    new-instance v3, Ljavassist/util/proxy/ProxyFactory;

    invoke-direct {v3}, Ljavassist/util/proxy/ProxyFactory;-><init>()V

    .line 83
    .local v3, "f":Ljavassist/util/proxy/ProxyFactory;
    iget-object v8, p0, Ljavassist/util/proxy/SerializedProxy;->superClass:Ljava/lang/String;

    invoke-virtual {p0, v8}, Ljavassist/util/proxy/SerializedProxy;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljavassist/util/proxy/ProxyFactory;->setSuperclass(Ljava/lang/Class;)V

    .line 84
    invoke-virtual {v3, v5}, Ljavassist/util/proxy/ProxyFactory;->setInterfaces([Ljava/lang/Class;)V

    .line 85
    iget-object v8, p0, Ljavassist/util/proxy/SerializedProxy;->filterSignature:[B

    invoke-virtual {v3, v8}, Ljavassist/util/proxy/ProxyFactory;->createClass([B)Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljavassist/util/proxy/Proxy;

    .line 86
    .local v7, "proxy":Ljavassist/util/proxy/Proxy;
    iget-object v8, p0, Ljavassist/util/proxy/SerializedProxy;->handler:Ljavassist/util/proxy/MethodHandler;

    invoke-interface {v7, v8}, Ljavassist/util/proxy/Proxy;->setHandler(Ljavassist/util/proxy/MethodHandler;)V
    :try_end_37
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_37} :catch_38
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_37} :catch_43
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_37} :catch_4e

    .line 87
    return-object v7

    .line 89
    .end local v3    # "f":Ljavassist/util/proxy/ProxyFactory;
    .end local v4    # "i":I
    .end local v5    # "infs":[Ljava/lang/Class;
    .end local v6    # "n":I
    .end local v7    # "proxy":Ljavassist/util/proxy/Proxy;
    :catch_38
    move-exception v0

    .line 90
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v8, Ljava/io/InvalidClassException;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InvalidClassException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 92
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :catch_43
    move-exception v1

    .line 93
    .local v1, "e2":Ljava/lang/InstantiationException;
    new-instance v8, Ljava/io/InvalidObjectException;

    invoke-virtual {v1}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 95
    .end local v1    # "e2":Ljava/lang/InstantiationException;
    :catch_4e
    move-exception v2

    .line 96
    .local v2, "e3":Ljava/lang/IllegalAccessException;
    new-instance v8, Ljava/io/InvalidClassException;

    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InvalidClassException;-><init>(Ljava/lang/String;)V

    throw v8
.end method
