.class public Ljavassist/util/proxy/ProxyObjectInputStream;
.super Ljava/io/ObjectInputStream;
.source "ProxyObjectInputStream.java"


# instance fields
.field private loader:Ljava/lang/ClassLoader;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 47
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyObjectInputStream;->loader:Ljava/lang/ClassLoader;

    .line 48
    iget-object v0, p0, Ljavassist/util/proxy/ProxyObjectInputStream;->loader:Ljava/lang/ClassLoader;

    if-nez v0, :cond_17

    .line 49
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iput-object v0, p0, Ljavassist/util/proxy/ProxyObjectInputStream;->loader:Ljava/lang/ClassLoader;

    .line 51
    :cond_17
    return-void
.end method


# virtual methods
.method protected readClassDescriptor()Ljava/io/ObjectStreamClass;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-virtual {p0}, Ljavassist/util/proxy/ProxyObjectInputStream;->readBoolean()Z

    move-result v3

    .line 68
    .local v3, "isProxy":Z
    if-eqz v3, :cond_51

    .line 69
    invoke-virtual {p0}, Ljavassist/util/proxy/ProxyObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 70
    .local v5, "name":Ljava/lang/String;
    iget-object v9, p0, Ljavassist/util/proxy/ProxyObjectInputStream;->loader:Ljava/lang/ClassLoader;

    invoke-virtual {v9, v5}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    .line 71
    .local v8, "superClass":Ljava/lang/Class;
    invoke-virtual {p0}, Ljavassist/util/proxy/ProxyObjectInputStream;->readInt()I

    move-result v4

    .line 72
    .local v4, "length":I
    new-array v2, v4, [Ljava/lang/Class;

    .line 73
    .local v2, "interfaces":[Ljava/lang/Class;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_19
    if-ge v1, v4, :cond_2c

    .line 74
    invoke-virtual {p0}, Ljavassist/util/proxy/ProxyObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "name":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 75
    .restart local v5    # "name":Ljava/lang/String;
    iget-object v9, p0, Ljavassist/util/proxy/ProxyObjectInputStream;->loader:Ljava/lang/ClassLoader;

    invoke-virtual {v9, v5}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    aput-object v9, v2, v1

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_19

    .line 77
    :cond_2c
    invoke-virtual {p0}, Ljavassist/util/proxy/ProxyObjectInputStream;->readInt()I

    move-result v4

    .line 78
    new-array v7, v4, [B

    .line 79
    .local v7, "signature":[B
    invoke-virtual {p0, v7}, Ljavassist/util/proxy/ProxyObjectInputStream;->read([B)I

    .line 80
    new-instance v0, Ljavassist/util/proxy/ProxyFactory;

    invoke-direct {v0}, Ljavassist/util/proxy/ProxyFactory;-><init>()V

    .line 83
    .local v0, "factory":Ljavassist/util/proxy/ProxyFactory;
    const/4 v9, 0x1

    invoke-virtual {v0, v9}, Ljavassist/util/proxy/ProxyFactory;->setUseCache(Z)V

    .line 84
    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Ljavassist/util/proxy/ProxyFactory;->setUseWriteReplace(Z)V

    .line 85
    invoke-virtual {v0, v8}, Ljavassist/util/proxy/ProxyFactory;->setSuperclass(Ljava/lang/Class;)V

    .line 86
    invoke-virtual {v0, v2}, Ljavassist/util/proxy/ProxyFactory;->setInterfaces([Ljava/lang/Class;)V

    .line 87
    invoke-virtual {v0, v7}, Ljavassist/util/proxy/ProxyFactory;->createClass([B)Ljava/lang/Class;

    move-result-object v6

    .line 88
    .local v6, "proxyClass":Ljava/lang/Class;
    invoke-static {v6}, Ljava/io/ObjectStreamClass;->lookup(Ljava/lang/Class;)Ljava/io/ObjectStreamClass;

    move-result-object v9

    .line 90
    .end local v0    # "factory":Ljavassist/util/proxy/ProxyFactory;
    .end local v1    # "i":I
    .end local v2    # "interfaces":[Ljava/lang/Class;
    .end local v4    # "length":I
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "proxyClass":Ljava/lang/Class;
    .end local v7    # "signature":[B
    .end local v8    # "superClass":Ljava/lang/Class;
    :goto_50
    return-object v9

    :cond_51
    invoke-super {p0}, Ljava/io/ObjectInputStream;->readClassDescriptor()Ljava/io/ObjectStreamClass;

    move-result-object v9

    goto :goto_50
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .registers 2
    .param p1, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 59
    if-eqz p1, :cond_5

    .line 60
    iput-object p1, p0, Ljavassist/util/proxy/ProxyObjectInputStream;->loader:Ljava/lang/ClassLoader;

    .line 64
    :goto_4
    return-void

    .line 62
    :cond_5
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    goto :goto_4
.end method
