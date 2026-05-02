.class public Lch/qos/logback/core/android/SystemPropertiesProxy;
.super Ljava/lang/Object;


# static fields
.field private static final SINGLETON:Lch/qos/logback/core/android/SystemPropertiesProxy;


# instance fields
.field private SystemProperties:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private getBoolean:Ljava/lang/reflect/Method;

.field private getString:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lch/qos/logback/core/android/SystemPropertiesProxy;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lch/qos/logback/core/android/SystemPropertiesProxy;-><init>(Ljava/lang/ClassLoader;)V

    sput-object v0, Lch/qos/logback/core/android/SystemPropertiesProxy;->SINGLETON:Lch/qos/logback/core/android/SystemPropertiesProxy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/ClassLoader;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :try_start_3
    invoke-virtual {p0, p1}, Lch/qos/logback/core/android/SystemPropertiesProxy;->setClassLoader(Ljava/lang/ClassLoader;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_6} :catch_7

    :goto_6
    return-void

    :catch_7
    move-exception v0

    goto :goto_6
.end method

.method public static getInstance()Lch/qos/logback/core/android/SystemPropertiesProxy;
    .registers 1

    sget-object v0, Lch/qos/logback/core/android/SystemPropertiesProxy;->SINGLETON:Lch/qos/logback/core/android/SystemPropertiesProxy;

    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->SystemProperties:Ljava/lang/Class;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->getString:Ljava/lang/reflect/Method;

    if-nez v0, :cond_b

    :cond_9
    move-object p2, v1

    :cond_a
    :goto_a
    return-object p2

    :cond_b
    :try_start_b
    iget-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->getString:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->SystemProperties:Ljava/lang/Class;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_1e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_b .. :try_end_1e} :catch_28
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_1e} :catch_2a

    :goto_1e
    if-eqz v0, :cond_a

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_a

    move-object p2, v0

    goto :goto_a

    :catch_28
    move-exception v0

    throw v0

    :catch_2a
    move-exception v0

    move-object v0, v1

    goto :goto_1e
.end method

.method public getBoolean(Ljava/lang/String;Z)Ljava/lang/Boolean;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->SystemProperties:Ljava/lang/Class;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->getBoolean:Ljava/lang/reflect/Method;

    if-nez v0, :cond_d

    :cond_8
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    :try_start_11
    iget-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->getBoolean:Ljava/lang/reflect/Method;

    iget-object v2, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->SystemProperties:Ljava/lang/Class;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;
    :try_end_28
    .catch Ljava/lang/IllegalArgumentException; {:try_start_11 .. :try_end_28} :catch_29
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_28} :catch_2b

    goto :goto_c

    :catch_29
    move-exception v0

    throw v0

    :catch_2b
    move-exception v0

    move-object v0, v1

    goto :goto_c
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/SecurityException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    if-nez p1, :cond_d

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    :cond_d
    const-string v0, "android.os.SystemProperties"

    invoke-virtual {p1, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->SystemProperties:Ljava/lang/Class;

    iget-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->SystemProperties:Ljava/lang/Class;

    const-string v1, "get"

    new-array v2, v6, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v4

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->getString:Ljava/lang/reflect/Method;

    iget-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->SystemProperties:Ljava/lang/Class;

    const-string v1, "getBoolean"

    new-array v2, v6, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v4

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/android/SystemPropertiesProxy;->getBoolean:Ljava/lang/reflect/Method;

    return-void
.end method
