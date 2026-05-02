.class final Ljavassist/ClassPool$1;
.super Ljava/lang/Object;
.source "ClassPool.java"

# interfaces
.implements Ljava/security/PrivilegedExceptionAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ljavassist/ClassPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Object;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 79
    const-string v1, "java.lang.ClassLoader"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 80
    .local v0, "cl":Ljava/lang/Class;
    const-string v1, "defineClass"

    new-array v2, v8, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v4

    const-class v3, [B

    aput-object v3, v2, v5

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v6

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v7

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    # setter for: Ljavassist/ClassPool;->defineClass1:Ljava/lang/reflect/Method;
    invoke-static {v1}, Ljavassist/ClassPool;->access$002(Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    .line 84
    const-string v1, "defineClass"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v4

    const-class v3, [B

    aput-object v3, v2, v5

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v6

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v7

    const-class v3, Ljava/security/ProtectionDomain;

    aput-object v3, v2, v8

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    # setter for: Ljavassist/ClassPool;->defineClass2:Ljava/lang/reflect/Method;
    invoke-static {v1}, Ljavassist/ClassPool;->access$102(Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    .line 88
    const-string v1, "definePackage"

    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v5

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v6

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v7

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v8

    const/4 v3, 0x5

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-class v4, Ljava/net/URL;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    # setter for: Ljavassist/ClassPool;->definePackage:Ljava/lang/reflect/Method;
    invoke-static {v1}, Ljavassist/ClassPool;->access$202(Ljava/lang/reflect/Method;)Ljava/lang/reflect/Method;

    .line 92
    const/4 v1, 0x0

    return-object v1
.end method
