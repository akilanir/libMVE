.class public Lcom/alibaba/fastjson/util/ASMClassLoader;
.super Ljava/lang/ClassLoader;
.source "ASMClassLoader.java"


# static fields
.field private static DOMAIN:Ljava/security/ProtectionDomain;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 12
    new-instance v0, Lcom/alibaba/fastjson/util/ASMClassLoader$1;

    invoke-direct {v0}, Lcom/alibaba/fastjson/util/ASMClassLoader$1;-><init>()V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/security/ProtectionDomain;

    sput-object v0, Lcom/alibaba/fastjson/util/ASMClassLoader;->DOMAIN:Ljava/security/ProtectionDomain;

    .line 18
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-static {}, Lcom/alibaba/fastjson/util/ASMClassLoader;->getParentClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/ClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .registers 2
    .param p1, "parent"    # Ljava/lang/ClassLoader;

    .prologue
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/ClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 26
    return-void
.end method

.method static getParentClassLoader()Ljava/lang/ClassLoader;
    .registers 2

    .prologue
    .line 29
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 30
    .local v0, "contextClassLoader":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_15

    .line 32
    :try_start_a
    const-class v1, Lcom/alibaba/fastjson/JSON;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_13
    .catch Ljava/lang/ClassNotFoundException; {:try_start_a .. :try_end_13} :catch_14

    .line 38
    .end local v0    # "contextClassLoader":Ljava/lang/ClassLoader;
    :goto_13
    return-object v0

    .line 34
    .restart local v0    # "contextClassLoader":Ljava/lang/ClassLoader;
    :catch_14
    move-exception v1

    .line 38
    :cond_15
    const-class v1, Lcom/alibaba/fastjson/JSON;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    goto :goto_13
.end method


# virtual methods
.method public defineClassPublic(Ljava/lang/String;[BII)Ljava/lang/Class;
    .registers 12
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "b"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[BII)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassFormatError;
        }
    .end annotation

    .prologue
    .line 42
    sget-object v5, Lcom/alibaba/fastjson/util/ASMClassLoader;->DOMAIN:Ljava/security/ProtectionDomain;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/alibaba/fastjson/util/ASMClassLoader;->defineClass(Ljava/lang/String;[BIILjava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v6

    .line 44
    .local v6, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    return-object v6
.end method

.method public isExternalClass(Ljava/lang/Class;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    .line 48
    invoke-virtual {p1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 50
    .local v0, "classLoader":Ljava/lang/ClassLoader;
    if-nez v0, :cond_8

    .line 63
    :cond_7
    :goto_7
    return v2

    .line 54
    :cond_8
    move-object v1, p0

    .line 55
    .local v1, "current":Ljava/lang/ClassLoader;
    :goto_9
    if-eqz v1, :cond_12

    .line 56
    if-eq v1, v0, :cond_7

    .line 60
    invoke-virtual {v1}, Ljava/lang/ClassLoader;->getParent()Ljava/lang/ClassLoader;

    move-result-object v1

    goto :goto_9

    .line 63
    :cond_12
    const/4 v2, 0x1

    goto :goto_7
.end method
