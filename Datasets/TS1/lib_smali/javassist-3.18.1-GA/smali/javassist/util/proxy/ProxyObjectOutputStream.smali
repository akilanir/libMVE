.class public Ljavassist/util/proxy/ProxyObjectOutputStream;
.super Ljava/io/ObjectOutputStream;
.source "ProxyObjectOutputStream.java"


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0, p1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 45
    return-void
.end method


# virtual methods
.method protected writeClassDescriptor(Ljava/io/ObjectStreamClass;)V
    .registers 10
    .param p1, "desc"    # Ljava/io/ObjectStreamClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p1}, Ljava/io/ObjectStreamClass;->forClass()Ljava/lang/Class;

    move-result-object v0

    .line 49
    .local v0, "cl":Ljava/lang/Class;
    invoke-static {v0}, Ljavassist/util/proxy/ProxyFactory;->isProxyClass(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_49

    .line 50
    const/4 v7, 0x1

    invoke-virtual {p0, v7}, Ljavassist/util/proxy/ProxyObjectOutputStream;->writeBoolean(Z)V

    .line 51
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    .line 52
    .local v6, "superClass":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v2

    .line 53
    .local v2, "interfaces":[Ljava/lang/Class;
    invoke-static {v0}, Ljavassist/util/proxy/ProxyFactory;->getFilterSignature(Ljava/lang/Class;)[B

    move-result-object v5

    .line 54
    .local v5, "signature":[B
    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 55
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {p0, v4}, Ljavassist/util/proxy/ProxyObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 57
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {p0, v7}, Ljavassist/util/proxy/ProxyObjectOutputStream;->writeInt(I)V

    .line 58
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_28
    array-length v7, v2

    if-ge v1, v7, :cond_41

    .line 59
    aget-object v3, v2, v1

    .line 60
    .local v3, "interfaze":Ljava/lang/Class;
    const-class v7, Ljavassist/util/proxy/ProxyObject;

    if-eq v3, v7, :cond_3e

    const-class v7, Ljavassist/util/proxy/Proxy;

    if-eq v3, v7, :cond_3e

    .line 61
    aget-object v7, v2, v1

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 62
    invoke-virtual {p0, v4}, Ljavassist/util/proxy/ProxyObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 58
    :cond_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_28

    .line 65
    .end local v3    # "interfaze":Ljava/lang/Class;
    :cond_41
    array-length v7, v5

    invoke-virtual {p0, v7}, Ljavassist/util/proxy/ProxyObjectOutputStream;->writeInt(I)V

    .line 66
    invoke-virtual {p0, v5}, Ljavassist/util/proxy/ProxyObjectOutputStream;->write([B)V

    .line 71
    .end local v1    # "i":I
    .end local v2    # "interfaces":[Ljava/lang/Class;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "signature":[B
    .end local v6    # "superClass":Ljava/lang/Class;
    :goto_48
    return-void

    .line 68
    :cond_49
    const/4 v7, 0x0

    invoke-virtual {p0, v7}, Ljavassist/util/proxy/ProxyObjectOutputStream;->writeBoolean(Z)V

    .line 69
    invoke-super {p0, p1}, Ljava/io/ObjectOutputStream;->writeClassDescriptor(Ljava/io/ObjectStreamClass;)V

    goto :goto_48
.end method
