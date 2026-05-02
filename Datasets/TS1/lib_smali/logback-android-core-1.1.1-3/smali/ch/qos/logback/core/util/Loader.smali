.class public Lch/qos/logback/core/util/Loader;
.super Ljava/lang/Object;


# static fields
.field private static HAS_GET_CLASS_LOADER_PERMISSION:Z = false

.field public static final IGNORE_TCL_PROPERTY_NAME:Ljava/lang/String; = "logback.ignoreTCL"

.field static final TSTR:Ljava/lang/String; = "Caught Exception while in Loader.getResource. This may be innocuous."

.field private static ignoreTCL:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v0, 0x0

    sput-boolean v0, Lch/qos/logback/core/util/Loader;->ignoreTCL:Z

    sput-boolean v0, Lch/qos/logback/core/util/Loader;->HAS_GET_CLASS_LOADER_PERMISSION:Z

    const-string v0, "logback.ignoreTCL"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lch/qos/logback/core/util/OptionHelper;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Lch/qos/logback/core/util/Loader;->ignoreTCL:Z

    :cond_18
    new-instance v0, Lch/qos/logback/core/util/Loader$1;

    invoke-direct {v0}, Lch/qos/logback/core/util/Loader$1;-><init>()V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Lch/qos/logback/core/util/Loader;->HAS_GET_CLASS_LOADER_PERMISSION:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getClassLoaderAsPrivileged(Ljava/lang/Class;)Ljava/lang/ClassLoader;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/ClassLoader;"
        }
    .end annotation

    sget-boolean v0, Lch/qos/logback/core/util/Loader;->HAS_GET_CLASS_LOADER_PERMISSION:Z

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    new-instance v0, Lch/qos/logback/core/util/Loader$2;

    invoke-direct {v0, p0}, Lch/qos/logback/core/util/Loader$2;-><init>(Ljava/lang/Class;)V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ClassLoader;

    goto :goto_5
.end method

.method public static getClassLoaderOfClass(Ljava/lang/Class;)Ljava/lang/ClassLoader;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/ClassLoader;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    if-nez v0, :cond_a

    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    :cond_a
    return-object v0
.end method

.method public static getClassLoaderOfObject(Ljava/lang/Object;)Ljava/lang/ClassLoader;
    .registers 3

    if-nez p0, :cond_a

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Argument cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/Loader;->getClassLoaderOfClass(Ljava/lang/Class;)Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public static getResource(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/net/URL;
    .registers 3

    :try_start_0
    invoke-virtual {p1, p0}, Ljava/lang/ClassLoader;->getResource(Ljava/lang/String;)Ljava/net/URL;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    const/4 v0, 0x0

    goto :goto_4
.end method

.method public static getResourceBySelfClassLoader(Ljava/lang/String;)Ljava/net/URL;
    .registers 2

    const-class v0, Lch/qos/logback/core/util/Loader;

    invoke-static {v0}, Lch/qos/logback/core/util/Loader;->getClassLoaderOfClass(Ljava/lang/Class;)Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {p0, v0}, Lch/qos/logback/core/util/Loader;->getResource(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/net/URL;

    move-result-object v0

    return-object v0
.end method

.method public static getResourceOccurrenceCount(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/net/URL;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v2

    :goto_9
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_19

    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/URL;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9

    :cond_19
    return-object v1
.end method

.method public static getTCL()Ljava/lang/ClassLoader;
    .registers 1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0
.end method

.method public static loadClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    sget-boolean v0, Lch/qos/logback/core/util/Loader;->ignoreTCL:Z

    if-eqz v0, :cond_9

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    :goto_8
    return-object v0

    :cond_9
    :try_start_9
    invoke-static {}, Lch/qos/logback/core/util/Loader;->getTCL()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_10} :catch_12

    move-result-object v0

    goto :goto_8

    :catch_12
    move-exception v0

    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_8
.end method

.method public static loadClass(Ljava/lang/String;Lch/qos/logback/core/Context;)Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lch/qos/logback/core/Context;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    invoke-static {p1}, Lch/qos/logback/core/util/Loader;->getClassLoaderOfObject(Ljava/lang/Object;)Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method
